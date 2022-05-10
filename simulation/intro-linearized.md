
__[IrisToolbox] for Macroeconomic Modeling__

# First-order solution 

`jaromir.benes@iris-toolbox.com`

---

## System of nonlinear equations with model-consistent expectations

$$
\newcommand{\Et}{\mathrm{E}_t}
\newcommand{\E}[1]{\mathrm{E}_{#1}\!}
$$

System of $n$ nonlinear conditional-expectations equations

$$
\begin{gathered}
\E{t}\, \Bigl[ f_1\bigl( x_{t-1}, x_t, x_{t+1}, \epsilon_t \bigm| \theta \bigr) \Bigr] = 0 \\[10pt]
\vdots \\[10pt]
\E{t} \, \Bigl[ f_n\bigl( x_{t-1}, x_t, x_{t+1}, \epsilon_t \bigm| \theta \bigr) \Bigr] = 0 \\[40pt]
\end{gathered}
$$

* Vector of $n$ variables: $x_t = \left[ x_t^1, \, \dots, x_t^n \right]'$

* Vector of $s$ shocks: $\epsilon_t = \left[ \epsilon_t^1, \, \dots, \epsilon_t^s \right]'$

* Vector of $p$ parameters: $\theta_t = \left[ \theta_t^1, \, \dots, \theta_t^p \right]'$


---


## Sequence of steps


1. Find a nonstochastic steady state (growth path)

1. Calculate first-order Taylor expansion around steady state

1. Calculate state-space representation 

> Use generalized Schur decomposition to decouple predetermined and unpredetermined variables, create a recursive representation, and translate the expectations of endogenous variables into the expectations of exogenous shocks


---

## Nonstochastic steady state: Case 1

* Stationary model or model with unit roots but no deterministic growth component

* This case is assumed by default in IrisT

* Make the equations nonstochastic


$$
\mathrm E_t \left[ f_k \left(
 x_{t-1}, x_t, x_{t+1}, \epsilon_t 
\bigm| \theta
\right) \right] =0
$$

$$
\downarrow
$$

$$
f_k \left(
 x_{t-1}, x_t, x_{t+1}, 0
\bigm| \theta
\right) =0
$$

* Simple fixed point problem

* Replace $x_{t-k}$, $x_t$, $x_{t+k}$ with $\bar x$ and solve the system of equations for $\bar x$

* Can still be an underdetermined system (singularity in its Jacobian); 
need a solution algorithm able to deal with the singularity, e.g. Marquardt-Levenberg or Newton-Cauchy


---

## Nonstochastic steady state: Case 2

* Nonstationary models with deterministic growth component

* No manual "stationarization" needed

* Set `growth=true` to indicate deterministic growth component when creating the `Model` object

* "Growth-augmented" steady point: find $\bar x$ and $\bar g$

$$
\mathrm E_t \left[ f_k \left(
 x_{t-1}, x_t, x_{t+1}, \epsilon_t 
\bigm| \theta
\right) \right] =0
$$

$$
\downarrow
$$

$$
f_k \left(
 x_{t-1}, x_t, x_{t+1}, 0
\bigm| \theta
\right) =0
$$

* Replace $x_{i,t+k} \rightarrow \bar x_i \bar  g_i^{k}$ for each $x_{i,t}$  that is a log variable, where $\bar g_i$ is the steady-state gross rate of change for that variable

* Replace $x_{i,t+k} \rightarrow \bar x_i + k\, \bar g_i$ for each $x_{i,t}$  that is a "plain" variable, where $\bar g_i$ is the steady-state first difference for that variable

* We have $n$ equations but $2n$ unknows (levels and changes): Copy the system of equations once more for another point in time

---

## Log-status rules

1. Variables that are growing at a constant rate of change in steady state must be declared as log-variables

1. Variables that can take zero or negative values must not be declared as log-variables

1. Otherwise, it does not matter

1. Variables that fall under #1 and #2 at the same time cannot be included in the model as such - use transformations, e.g. ratios over GDP etc.

---

## Taylor expansion in first-difference form

* Create a transition vector $\xi_t$ from $x_t$

* Transition vector $\xi_t$ contains (i) logarithms for log-variables, (ii) auxiliary lags and leads to have a first-difference form

* Split $\xi_t$ into predetermined (backward looking) and non-predetermined (forward looking) parts

<br/>

$$
A \, \mathrm E_t \begin{bmatrix} \xi_{b,t} - \bar\xi_{b,t} \\ \xi_{f,t+1}-\bar \xi_{f,t+1} \end{bmatrix} + B \, 
\begin{bmatrix} \xi_{b,t-1} - \bar \xi_{b,t-1} \\ \xi_{f,t} - \bar \xi_{f,t} \end{bmatrix} + C + D \,\epsilon_t = 0,
$$

---

## First-order triangular solution 

<br/>

Transition equations

$$
\begin{aligned}
\begin{bmatrix}
\xi_{f,t} \\ \alpha_t
\end{bmatrix}
=&\ 
\begin{bmatrix}
0 & T_f  \\ 0 & T_\alpha
\end{bmatrix}
\begin{bmatrix}
\xi_{f,t-1} \\ \alpha_{t-1}
\end{bmatrix} \ \cdots \\[15pt]
+&\ k + R_0\, \epsilon_t
+ R_1 \, \mathrm E_t \left[\epsilon_{t+1}\right]
+ \cdots + R_k \, \mathrm E_t \left[\epsilon_{t+k}\right]
+ \cdots
\end{aligned}
$$

<br/>

Transformed vector of predermined (backward looking) variables

$$
\xi_{b,t} = U \, \alpha_t
$$

<br/>


Measurement equations

$$
y_t = Z \, \alpha_t + d + H \epsilon_t
$$

---

## Triangular transition matrix $T_b$

* Upper (block) triangular (1-by-1 or 2-by-2 blocks on the main diagonal)

* Only stable roots (eigenvalues) or unit roots; the unit roots concentrated in the top-left corner

![[transition-matrix.png]]


---

## First-order "rectangular" solution

<br/>

Equivalent to the triangular form, no $\alpha$ vector involved

$$
\begin{aligned}
\begin{bmatrix}
\xi_{f,t} \\ \xi_{b,t}
\end{bmatrix}
=&\ 
\begin{bmatrix}
0 & \widetilde T_f  \\ 0 & \widetilde T_{b}
\end{bmatrix}
\begin{bmatrix}
\xi_{f,t-1} \\ \xi_{b,t-1}
\end{bmatrix} \ \cdots \\[15pt]
+&\ \widetilde k + 
\widetilde R_0\, \epsilon_t
+ 
\widetilde R_1 \, \mathrm E_t \left[\epsilon_{t+1}\right]
+ \cdots + 
\widetilde R_k \, \mathrm E_t \left[\epsilon_{t+k}\right]
+ \cdots
\end{aligned}
$$

Measurement equations

$$
y_t = \widetilde Z \, \xi_{b,t} + \widetilde d + \widetilde H \epsilon_t
$$
