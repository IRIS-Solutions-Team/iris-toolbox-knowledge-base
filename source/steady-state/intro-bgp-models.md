
__[IrisToolbox] for Macroeconomic Modeling__

# Balanced growth path models

`jaromir.benes@iris-toolbox.com`

---

## Key point:  Balanced growth models do not need to be stationarized

We can handle (solve, simulate, analyze, etc.) balanced growth path models in their original nonstationary forms.


---

## A very informal definition of a balanced growth path model

A BGP model is a nonstationary model that we are able to manually stationarize so that 

* a stationary steady state (fixed point) exists for the new system of transformed variables,

and each variable in the transformed system is either of the following

* a nontransformed variable from the original system, or

* a linear combination of the original variables (or their lags and leads), or

* a log-linear combination of the original variables (or their lags and leads)

---

## The key point rephrased

If we are able to manually stationarize the model, we don't actually need to do that...


---

## Digression: Under what conditions does a nonstationary model feature a balanced-growth path?

* This is a separate question

* Very difficult (and not very insightful) to define general, context-agnostic conditions

* Two typical examples of necessary conditions:

> Nominal terms in budget constraints and definitions (e.g. households' budget constaint, nominal expenditures in the definition of nominal GDP, etc.) grow at the same rate and 

> Elasticity of substitution (in production, consumption, etc.) between things that possibly grow at different rates is exactly one in the long run

---

## Practical issues in solving BGP models

* How to define, describe and calculate the (nonstationary) steady state of a BGP model?

* How to deal with the non-unique levels (infinitely many solutions), aka a singularity in the steady-state system?

* How to calculate a local approximation around a nonstationary steady state?


---

## How to describe the steady state of a nonstationary BGP model?


From the (very informal) definition of a BGP, each variables is one of the following:

Type of variable | Behavior in steady state
---|---
Stationary | Constant at a fixed unique level
Flat | Not changing over time but an unpredetermined level
??? | Changing over time: fixed first difference
??? | Changing over time: fixed rate of change


We need to know which variable is which type before we start steady-state calculations

---

## How to describe the steady state of a nonstationary BGP model?

![BGP](bgp.png)

* Take a snapshot of the variables as they move along their BGP(s) at one
  arbitrary point of time

* Read off two numerical values for each variable:

1. its current level
1. its change over time, i.e. first difference or rate of change

* For everything we need to do, it does not matter which particular snapshot we take - any snapshot along the BGP is equally good (and equivalent to any other)


---


## Trivial example

Use the following trivial model

$$
\begin{gathered}
A_{t} = \alpha \, A_{t-1} \exp \epsilon_t \\[5pt]
Y_t = \gamma \, A_{t-1}
\end{gathered}
$$

to show its solution

* the traditional way (manually stationarizing the system)

* the direct route (dealing with the variables in their original levels)



---

## Traditional way: Steady state

1. Define new transformed variables

$$
\begin{gathered}
\hat a_t \equiv A_t / A_{t-1} \\[5pt]
y_t \equiv Y_t / A_t
\end{gathered}
$$

<br/>

2. Rewrite the original equations

$$
\begin{gathered}
A_{t} = \alpha \, A_{t-1} \exp \epsilon_t \quad\longrightarrow\quad
\hat a_t = \alpha \exp \epsilon_t \\[5pt]
y_t = \gamma  A_{t-1} \quad\longrightarrow\quad
y_t = \left. \gamma \middle/ \hat a_t \right. 
\end{gathered}
$$

<br/>

3. Solve for the fixed point in $\hat a$, $y$, this uniquely determines 

* the steady-state rate of change in $a_t$ and $y_t$
* the steady-state ratio $y_t/a_t$


---

## Traditional way: A point on the BGP

* We can create an arbitrary point on the BGP by picking any valid value for $A_t$, and calculating the corresponding $Y_t \equiv y_t \, A_t$

* There are infinitely many points we could pick, one for each valid $A_t$

* This fact leads to a little singularity in the direct approach presented later, but lo and behold, we can easily deal with it...

* Note that when going the traditional way, we don't actually need to explicitly express a BGP point for the variables in their original levels


---

## Traditional way: First-order approximation

4. Given the fixed point $\hat a_\ss$, $y_\ss$, calculate first-order Taylor expansion and approximate solution

$$
\begin{bmatrix}
\hat a_t - \hat a_\ss \\
y_t - y_\ss
\end{bmatrix} 
= T \, 
\begin{bmatrix}
\hat a_{t-1} - \hat a_\ss \\
y_{t-1} - y_\ss
\end{bmatrix} + R \, \epsilon_t
$$

5. In forward-loking models, apply Blanchard-Kahn-Klein procedure using (generalized) eigenvalue
   decomposition to integrate out future expectations


---

## Traditional way: Go the extra mile

5. We can alternatively calculate a log approximation, where the
   log transformation **preserves linearity** 

$$
\begin{bmatrix}
\log \hat a_t - \log \hat a_\ss \\
\log y_t - \log y_\ss
\end{bmatrix} 
= T^* \, 
\begin{bmatrix}
\log \hat a_{t-1} - \log \hat a_\ss \\
\log y_{t-1} - \log y_\ss
\end{bmatrix} + R^* \, \epsilon_t
$$

$$
\begin{gathered}
\log \hat a_t \equiv \log A_t - \log A_{t-1} \\[5pt]
\log y_t \equiv \log Y_t - \log A_T
\end{gathered}
$$

<br/>

6. Substitute the definitons of the log transformations back

$$
\begin{bmatrix}
\log A_t - \log A_{t-1} - \log \hat a_\ss \\
\log Y_t - \log A_t - \log y_\ss 
\end{bmatrix} 
= T^* \, 
\begin{bmatrix}
\log A_{t-1} - \log A_{t-2} - \log \hat a_\ss \\
\log Y_{t-1} - \log A_t - \log y_\ss
\end{bmatrix} 
+ R^{*} \, \epsilon_t
$$

<br/>

7. Rearrange to get 

$$
\begin{bmatrix}
\log A_t \\
\log A_{t-1} \\
\log Y_t
\end{bmatrix} 
= T^{**}
\begin{bmatrix}
\log A_{t-1} \\
\log A_{t-2} \\
\log Y_{t-1}
\end{bmatrix} 
+ K^{**} + R^{**} \, \epsilon_t
$$

<br/>

Note that

* an intercept vector $K^{**}$ now appears in the system, based on the fixed-point numbers $\log a_\ss$, $\log y_\ss$

* the transion matrix $T^{**}$ now contains a unit root

* in forward-looking models, the same Blanchard-Kahn-Klein procedure can be
  applied (treating unit roots as **stable* roots)


---

## Direct route

Absolutely no stationarizing step needed to calculate

* a point on the BGP

* a first-order approximate solution


---

## Direct route: Steady state

1. Write the equations in their steady-state form for the following four unknowns:

   * Level of $A_t$, denoted by $A_\ss$

   * Level of $Y_t$, denoted by $Y_\ss$

   * Rate of change in $A$, denoted by $\hat A_\ss$

   * Rate of change in $Y$, denoted by $\hat Y_\ss$

<br/>

$$
\begin{aligned}
A_{t} = \alpha \, A_{t-1} \exp \epsilon_t
&\quad\longrightarrow\quad
A_\ss = \alpha \, A_\ss / \hat A_\ss
\\[5pt]
Y_t = \gamma \, A_{t-1}
&\quad\longrightarrow\quad
Y_\ss = \gamma \, A_\ss / \hat A_\ss
\end{aligned}
$$

<br/>

2. Problem: Two equations in four unknowns. Solution: Repeat the system at a different time point

$$
\begin{gathered}
A_\ss = \alpha \, A_\ss \, \hat A_\ss^{-1}
\\[5pt]
Y_\ss = \gamma \, A_\ss \, \hat A_\ss{}^{-1}
\\[15pt]
A_\ss \, \hat A_\ss{}^k = \alpha \, A_\ss \, \hat A_\ss{}^{k-1}
\\[5pt]
Y_\ss \, \hat Y_\ss{}^{k} = \gamma \, A_\ss\, \hat A_\ss{}^{k-1}
\end{gathered}
$$

---

## Direct route: Singularity problem

* The system has infinitely many solutions, the Jacobian is singular 

* We do have algorithms capable of dealing with the singularity, delivering one
   (arbitrary) solution, e.g. Levenberg-Marquardt 

* One arbitrary

---

## Direct route: First-order approximation

3. Calculate Taylor expansion of each model equation around the BGP 

   * w.r.t. to the **log** of the variables that show a constant rate of change

   * w.r.t. the other variables 

<br/>

$$
f_k \left( A_t, A_{t-1}, Y_{t}, Y_{t-1} \right) = 0
$$

<br/>

$$
\left. \frac{\partial f_k\left( A_t, A_{t-1}, Y_{t}, Y_{t-1} \right)}{\partial \, \log A_t} \middle|_{A_t=A_\ss,\ A_{t-1}=A_\ss \hat A_\ss{}^{-1}, \ Y_t=Y_\ss, \ Y_{t-1}=Y_\ss \hat Y_\ss{}^{-1}} \right.
$$

$$
\left. \frac{\partial f_k\left( A_t, A_{t-1}, Y_{t}, Y_{t-1} \right)}{\partial \, \log A_{t-1}} \middle|_{A_t=A_\ss,\ A_{t-1}=A_\ss \hat A_\ss{}^{-1}, \ Y_t=Y_\ss, \ Y_{t-1}=Y_\ss \hat Y_\ss{}^{-1}} \right.
$$
 
$$
\left. \frac{\partial f_k\left( A_t, A_{t-1}, Y_{t}, Y_{t-1} \right)}{\partial \, \log Y_{t}} \middle|_{A_t=A_\ss,\ A_{t-1}=A_\ss \hat A_\ss{}^{-1}, \ Y_t=Y_\ss, \ Y_{t-1}=Y_\ss \hat Y_\ss{}^{-1}} \right.
$$
 
$$
\left. \frac{\partial f_k\left( A_t, A_{t-1}, Y_{t}, Y_{t-1} \right)}{\partial \, \log Y_{t-1}} \middle|_{A_t=A_\ss,\ A_{t-1}=A_\ss \hat A_\ss{}^{-1}, \ Y_t=Y_\ss, \ Y_{t-1}=Y_\ss \hat Y_\ss{}^{-1}} \right.
$$

$$
\left. \frac{\partial f_k\left( A_t, A_{t-1}, Y_{t}, Y_{t-1} \right)}{\partial \, \epsilon_{t}} \middle|_{A_t=A_\ss,\ A_{t-1}=A_\ss \hat A_\ss{}^{-1}, \ Y_t=Y_\ss, \ Y_{t-1}=Y_\ss \hat Y_\ss{}^{-1}} \right.
$$
 
 
<br/>

4. Set up the dynamic system

$$
\begin{bmatrix}
\log A_t - \log A_\ss \\[5pt]
\log A_{t-1} - \log (A_\ss \hat A_\ss{}^{-1}) \\[5pt]
\log Y_t - \log Y_\ss \\[5pt]
\end{bmatrix}
=
T^{**}
\begin{bmatrix}
\log A_{t-1} - \log (A_\ss\hat A_\ss{}^{-1}) \\[5pt]
\log A_{t-2} - \log (A_\ss \hat A_\ss{}^{-2}) \\[5pt]
\log Y_{t-1} - \log (Y_\ss\hat Y_\ss{}^{-1}) \\[5pt]
\end{bmatrix}
+ R^{**} \, \epsilon_t
$$

<br/>

5. Rearrange collecting the constant terms

$$
\begin{bmatrix}
\log A_t \\[5pt]
\log A_{t-1} \\[5pt]
\log Y_t \\[5pt]
\end{bmatrix}
=
T^{**}
\begin{bmatrix}
\log A_{t-1} \\[5pt]
\log A_{t-2} \\[5pt]
\log Y_{t-1} \\[5pt]
\end{bmatrix}
+ K^{**}
+ R^{**} \, \epsilon_t
$$

Note that

* the system matrices $T^{**}$, $K^{**}$, $R^{**}$ are exactly the same as
  in the traditional approach

* the system matrices are independent of the particular snapshot of the BGP
  because the derivatives are independent of these as well up to
  scaling/normalization

---

## First-order solution matrices (aka state space)


Iris works with two forms of solution (state-space forms)


* **Triangular** representation is used whenever we need to technically separate unit root dynamics from the stable dynamics of the model: stationarity diagnosis, Kalman filtering, autocovariance and power spectrum functions

* **Nontriangular** (aka rectangular) is used in simulations


---

## Non-triangular (rectangular) form

Rectangular transition equation with no forward expansion

$$
\begin{gathered}
x_t \equiv
\begin{bmatrix}
xf_t \\[5pt]
xb_t 
\end{bmatrix}
= 
T \, xb_{t-1}
+ R \, \epsilon_t + K
\\[20pt]
T = 
\begin{bmatrix}
T_1 \\[5pt]
T_2
\end{bmatrix}
\end{gathered}
$$

where

* $xf_t$ is an $nf \times 1$ vector of non-predetermined (forward-looking) variables, including auxiliary leads

* $xb_t$ is an $nb \times 1$ vector of predetermined (backward-looking) variables, including auxiliary lags

* $\epsilon_t$ is an $ne \times 1$ vector of shocks

* $T$ is an $nx \times nb$ transition matrix, $nx=nf+nb$

* $T_2$ is a $nb \times nb$ proper transition block with stable and unit eigenvalues

* $R$ is an $nx \times ne$ shock impact matrix

* $K$ is an $nx \times 1$ constant vector


---

## Triangular form

Triangular transition equation with no forward expansion

$$
\begin{gathered}
x_t^{\small\Delta} \equiv 
\begin{bmatrix}
xf_t \\[5pt]
\alpha_t
\end{bmatrix}
= 
T^{\small\Delta} \, \alpha_{t-1}
+ R^{\small\Delta} \, \epsilon_t + K^{\small\Delta}
\\[20pt]
T^{\small\Delta} = 
\begin{bmatrix}
T_1^{\small\Delta} \\[5pt]
T_2^{\small\Delta}
\end{bmatrix}
\\[20pt]
\alpha = U \, xb_t
\end{gathered}
$$

where

* $xf_t$ is an $nf \times 1$ vector of non-predetermined (forward-looking) variables identical to the rectangular solution

* $\alpha_t$ is an $nb \times 1$ vector of transformed predetermined (backward-looking) variables 

* $T^{\small\Delta}$ is an $nx \times nb$ transformed transition matrix, $nx=nf+nb$

* $T_2$ is a $nb \times nb$ upper triangular proper transition block with unit roots concentrated in the top-left corner

* $R^{\small\Delta}$ is an $nx \times ne$ transformed shock impact matrix

* $K^{\small\Delta}$ is an $nx \times 1$ transformed constant vector

* $U$ is an invertible transformation matrix
