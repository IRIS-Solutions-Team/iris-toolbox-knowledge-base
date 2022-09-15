__[IrisToolbox] for Macroeconomic Modeling__

# Dealing with overfitting in practical time-series models

`jaromir.benes@iris-toolbox.com`

---

## Near-term forecasts

* Reduced form, explore historical correlations
* Not much value in imposing sophisticated structural assumptions
* Process as much data as possible

---

## Issues

* Curse of dimensionality (overfitting etc)
* Mixed frequency
* Incorporation within main projection

---


## Practical techniques to overcome overfitting

Approaches

* Forecast combination (averaging)
* Shrinkage (aka bayesian) estimation methods
* Factor/principal component methods

Main consideration

* __Out of sample__ predictive power


---

## Shrinkage estimators for VAR models


* First-order VAR for ease of notation here

$$
x_t = A x_{t-1} + C + \epsilon_t
$$

* Unconstrained OLS estimator (aka conditional ML)

$$
\hat \beta = Y Z' \left( Z \, Z' \right)^{-1}
$$

$$
\begin{gathered}
\beta \equiv \left[C, A\right] \\[10pt]
\quad Y \equiv \begin{bmatrix} x_1, & \dots, & x_T \end{bmatrix},
\quad Z \equiv \begin{bmatrix} 1, & \dots, & 1 \\ x_{0}, & \dots, & x_{T-1} \end{bmatrix},
\end{gathered}
$$

* Add a total of N "prior" dummy observations (cross-dependent priors)

$$
\quad Y_d \equiv \begin{bmatrix} x_{d,1}, & \dots, & x_{d,N} \end{bmatrix},
\quad Z_d \equiv \begin{bmatrix} c_{d,1}, & \dots, & c_{d,N} \\ x_{d,0}, & \dots, & x_{d,N-1} \end{bmatrix},
$$

* OLS estimator with dummy observations

$$
\hat \beta_d = [Y_d, Y]\, [Z_d, Z]'\, \left( [Z_d, Z] \, [Z_d, Z]' \right)^{-1}
 = \left( Y_d Z_d' + Y Z'\right) \left( Z_d Z_d' + Z Z' \right)^{-1}
$$

---

## Practical examples of dummy observations

* Litterman: shrink towards white noise or random walk (or
  anything in between)

* Doan (sum of coefficients): shrink towards unit root

* Sims (unconditional mean): shrink towards a user-specified unconditional mean 

---


## Dynamic factor model

$$
\begin{gathered}
\hat y_t = C \, f_t + u_t \\[10pt]
f_t = A(L)\, f_{t-1} + B \, e_t \\[10pt]
\mathrm{cov} \ u_t = \Sigma, \quad \mathrm{cov} \ e_t = I, \quad \Omega = B \,B'
\end{gathered}
$$

* $y_t$ is $ny$ by 1
*  $f_t$ is $nf$ by 1, where $ny>>nf$

---

## Identification

* Principal component estimation
* State-space/Kalman filter estimation
* Hybrid estimation
* Choosing the number of factors


---

## Principal component estimation

Standardize observations
$$
\hat y_t^i = \frac{y_t^i - \mu_{1,T}^i}{\sigma^i_{1,T}}
$$


Sample covariance matrix of observables
$$
\Gamma_{1,T} = \frac{1}{T} \ \hat Y_{1,t} \ \hat Y_{1,t}{}'
$$

Singular value decomposition of the covariance matrix (equivalent to eigenvalue decomposition)

$$
\Gamma_{1,T} = U \, S \, U'
$$





