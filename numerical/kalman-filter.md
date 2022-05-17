

__[IrisToolbox] for Macroeconomic Modeling__

# Intro to Kalman filter

`jaromir.benes@iris-toolbox.com`

$$
\newcommand{\E}[1]{\mathrm E_{#1}\!}
\newcommand{\C}[1]{{\color{darkred}#1}}
$$

---

## Overview

* Major Kalman filter advances appeared in the 1950s–1960s primarily for spacecraft control (dynamic positioning)

* Recursive form of a conditioning problem
>    * Estimate directly unobserved quantities 
>    * Reduce computational demands
>    * Run in real time

* In macro, we could do stacked time

* A number of useful characteristics from recursive
>    * Prediction errors
>    * Likelihood
>    * Conditional MSEs

---

## Reverse logic

#### Simulation: "causality"

Initial conditions + shocks $\to$ variables

#### Kalman filtering: "diagnostics"

Observations of variables $\to$ the most likely combination of initial conditions and shocks

---

## State space system


Run for $t = 1, \dots, T$:

###### Transition equations: Dynamics
$$
x_t = T \, x_{t-1} + k + R \, e_t
$$

<br/>

###### Measurement equations: Static transformation
$$
y_t = Z \, x_t + d + H \, u_t
$$




---

## Initializing the filter

To start the Kalman filter, we need to describe the distribution of the initial condition

$$
x_{0|0} \equiv \E{0} \left[ x_0 \right]
$$

$$
P_{0|0} \equiv \mathrm{MSE}_0\! \left[x_0\right]
\equiv \E{0} \left[
\left(x_{0|0} - x_0\right) \left(x_{0|0}-x_0\right)'
\right]
$$

The Kalman filter algorithm itself does not specify how to come up with the initial condition

* Use the asymptotic (steady-state) distribution

* Use the result of a preceding run of a filter

* Arbitrary set up initial condition, stochastic or fixed


---

## Prediction step

<br/>

###### Prediction step for transition variables

$$
x_{1|0} = T \, x_{0|0} + k + R \, 0
$$

$$
P_{1|0} = T \, P_{0|0} \, T' + R \, \Omega \, R'
$$

<br/>

###### Prediction step for measurement variables

$$
y_{1|0} = Z \, x_{1|0} + d + H \, 0= Z \left( T\, \C{x_{0|0}} + k + R \, \C{0}\right) + d + H\,\C{0}
$$

$$
F_1 = MSE_0\!\left[y_1\right] 
= Z \, P_{1|0} \, Z' + \Sigma_{x,t}
= Z \, \left( T \, \C{P_{0|0}} \, T' + \C{\Sigma_{x,t}} \right) \, Z' + \C{\Sigma_{y,t}}
$$


<br/>


where  $\quad \Sigma_x = R \, \mathrm E\!\left[ e \, e' \right] \, R', \quad \Sigma_y = H \, \mathrm E\!\left[ u \, u' \right] \, H'$


---

## Observe $y$

* Observation of $y_1$ becomes available

* In general, our prediction will be wrong by some margin, $y_{1|0}\ne y_1$

* Prediction error $\nu_1 \equiv y_{1|0} - y_1$

---

## Updating step

* Reconcile your prediction with the observation by changing whatever can be changed that shaped our prediction, i.e. whatever is stochastic and not fixed

> * State in previous period (initial conditoin) $x_{0|1} \ne x_{0|0}$
> * Transition shocks in current period $e_{1|1} \ne 0$
> * Measurement errors in current period $u_{1|1} \ne 0$

* Infinitely many combinations $\to$ find the likelihood maximizing combination

---

## Logic of the prediction and updating steps

<br/>

![[kalman-filter.png]]


---

## Conditioning problem in updating step

* Equivalent to the conditional normal distribution formulas

>
> Minimize
>
> $$
> \begin{multline}
> \left(x_{0|1}-x_{0|0}\right)'
> P_{0|0}^{-1} 
> \left(x_{0|1}-x_{0|0}\right) \ \cdots
> \\[0pt] 
> +
> \left(e_{1|1}-0\right)' \, \Omega_e{}^{-1} \, \left(e_{1|1}-0\right) \ \cdots
> \\[0pt]
> +
> \left(u_{1|1}-0\right)' \, \Omega_u{}^{-1} \, \left(u_{1|1}-0\right)
> \end{multline}
> $$
> 
> subject to
> 
> $$
> Z\left(T\,x_{0|1} + k + R \, e_{1|1}\right) + d + H \, u_{1|1} = y_1
> $$


---

## The result of an updating step

* New set of "inputs" reflecting the observation of $y_{1}$: $x_{0|1}$, $e_{1|1}$, $u_{1|1}$

* Accordingly, the MSE matrices will also change (shrink)

* Recompute $x_{1|1}$, $P_{1|1}$

---

## Wash, rinse, repeat

* Using $x_{1|1}$, $P_{1|1}$  as a new starting point, calculate new predictions for $t=2$

* Repeat the entire procedure

---

## Backward smoothing

* Arriving at the final time $T$, we use $y_T$ to update  $x_{T-1|T}$, $e_{T|T}$, $u_{T|T}$ 

* But wait... we're changing $x_{T-1|T-1}$ into $x_{T-1|T}$... that makes things inconsistent with $y_{T-1}$...

* We now also need to calculate $e_{T-1|T}$, $u_{T-1|T}$ and $x_{T-2|T}$, etc...

* ...all the way back to $e_{1|T}$, $u_{1|T}$, $x_{0|T}$

---

## Three sets of values 

$$
t = 1, \dots, T
$$

* Prediction step $x_{t|t-1}$

* Updating step $x_{t|t}$

* Smoothing step $x_{t|T}$


---

## Likelihood function

* Prediction error decomposition approach to likelihood function evaluation

$$
\mathcal L \propto \sum_{t=1}^{T}\ \nu_t{}' \, F_t{}^{-1} \, \nu_t
$$

* Allows to break the overall likelihood into the contributions of individual periods
