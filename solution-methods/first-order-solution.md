
# First-Order Approximate Solution

## Introduction

In this article, we show an efficient algorithm for computing a first-order solution to models with forward-looking model-consistent expectations \(a.k.a. rational expectations\) such that its transition matrix is upper triangular, or quasi triangular. The algorithm is efficient in the sense that no extra matrix factorization is needed in addition to the one that produces a more conventional solution. We argue that the triangularity, achieved by suitably transforming the state vector, is preferable and convenient for a number of reasons. Furthermore, we also calculate the forward expansion of the resulting solution to include the effect of expectations of future exogenous shocks.

Why is a triangular solution superior to the more conventional one with a general transition matrix? There are at least two broad reasons. First, handling systems with triangular transition matrices is computationally more efficient in many contexts; a notable example is solving a Lyapunov equation to obtain unconditional covariance matrices. Second, a triangular solution greatly simplifies the treatment of models with unit roots, such as automated detection of non-stationary variables or initialization of a Kalman filter. We discuss and exemplify this point later in more detail.

The article is organized as follows. Section 2 explains the underlying assumptions and shows a recursive-form solution with a triangular transition matrix and forward expansion. Section 3 illustrates the algorithm on an example unit-root model. Appendix 1 provides details of the solution algorithm.


## The Model and Its Solution

We use a version of the algorithm proposed by Klein \(2000\), which builds
upon a generalized Schur \(also known as QZ\) decomposition when
integrating away the expectations of endogenous variables. We deviate from
Klein in three aspects. First, we transform the vector of predetermined
\(or backward-looking\) variables so as to give rise to a triangular
transition matrix in the resulting solution. Second, we allow unit roots in
the model \(and treat them correctly as \textit{stable}, or
\textit{non-exploding}, roots from the point of view of saddle-path
stability\).\footnote{Contrary to footnote 8 on page 1410 in Klein, there
is nothing spooky about unit roots.} Third, we provide explicit formulas
for the effects of future expectations of exogenous inputs without assuming
any specific process for them. In fact, in the last two aspects, we simply
return to the very origins of solving RE models laid by
\citet{Blanchard-Kahn:1980}, referred to as BK hencerforth.\footnote{And
wonder why everyone seems to have long forgotten these two points in spite
of how utterly useful they prove to be.}

We consider the following form of linear, linearized, or log-linearized rational-expectations models:

$$
\newcommand{\Rf}{{R_f}}
\newcommand{\Ra}{{R_\alpha}}
\newcommand{\Mf}{{M_f}}
\newcommand{\Ma}{{M_\alpha}}
\newcommand{\fce}{{\phi}}
\newcommand{\tp}{{_{t+1}}}
\newcommand{\tpk}{{_{t+k}}}
\newcommand{\tm}{{_{t-1}}}
\newcommand{\mathrm{E}_t}
\newcommand{\xf}{{x^f}}
\newcommand{\xb}{{x^b}}
\label{Eq:RESystem}
A \, \Et \begin{bmatrix} \xb_t \\ \xf\tp \end{bmatrix} + B \, 
\begin{bmatrix} \xb\tm \\ \xf_t\end{bmatrix} + C \,e_t = 0,
$$

where an $\Nx\times 1$ vector of endogenous variables consists of $\xb_t$,
an $\Nb\times 1$ vector of **predetermined**, or backward-looking,
variables for which $\Et \[ \xbt \] = \xb\_t$, with $\xb\tm$ being given,
and $\xf\_t$, an $\Nf\times 1$ vector of \_\_non-predetermined_, or
forward-looking, variables. Futhermore, $e\_t$ is an $\Ne \times 1$ vector
of exogenous processes, and $\Et\[\cdot\]$ is a time $t$ conditional
expectations operator. The current realisation of the exogenous vector as
well as its expectations, $e\_t$ and $\Et \[\,e\tpk\] $, $k=1,2,\ldots$,
are known at time $t$. We, however, do not introduce any further
assumptions about the law of motion for $e\_t$, apart from a~stability
requirement adopted from BK, condition \(1c\) on page~1305. Obviously, the
first-order difference equation \eqref{Eq:RESystem} can easily accommodate
systems with lags and leads higher than one by simply augmenting $\xb\_t$
and $\xf\_t$ with auxiliary, time-shifted, variables.

In the rest of this section, we construct a solution that has the following form:

$$
\label{Eq:SolutionOne}
\begin{gather}
\begin{bmatrix} \xf_t \\ \alpha_t \end{bmatrix}
= \begin{bmatrix} 0 & \Mf \\ 0 & \Ma \end{bmatrix}
\begin{bmatrix} \xf_{t-1} \\ \alpha_{t-1} \end{bmatrix} + R_0 \, e_t + R_1 \Et [e_{t+1}] + \cdots  R_k \Et [e_{t+k}], \\
\label{Eq:SolutionTwo}
\xb_t = U \alpha_t, 
\end{gather}
$$

where $\alpha_t$ is a suitable transformation of the vector of predetermined variables such that $\Ma$, and hence also the overall transition matrix of the system, is upper triangular. Note that the expectations of endogenous variables, $\Et \[\xf_{t+1}\]$ translate, in general, into an infinite sum of expectations of exogenous processes, which are known by assumption.

First, we take for granted that the system matrices $$A$$ and $$B$$ satisfy
a~generalized saddle-path condition. In other words, they have exactly
$\Nb$ generalized eigenvalues inside, or on, the unit circle \(called
\textit{non-explosive}; recall that these also include unit roots\), and
exactly $\Nf$ eigenvalues outside the unit circle \(called
\textit{explosive}\).\footnote{See section 5.3.1 in Klein, and propositions
1 to 3 in BK.} Next, we can transform the vector of state variables and
factorize the system \eqref{Eq:RESystem} using the Schur generalized
decomposition as follows:

$$
\label{Eq:SchurTransform}
\quad \text{or} \quad 
\begin{bmatrix} \xb\tm \\ \xf_t \end{bmatrix} = 
Z \begin{bmatrix} s_t \\ u_t \end{bmatrix},
$$

and

$$
\label{Eq:SchurSystem}
S \Et \begin{bmatrix} s\tp \\ u\tp \end{bmatrix}
+ T \begin{bmatrix} s_t \\ u_t \end{bmatrix} + D \,e_t = 0,
$$

where $D = Q\, C$, and $S = Q A Z$ and $T = Q B Z$ are both upper triangular \(for complex Schur forms\) or quasi-triangular \(for real Schur forms\) matrices,\footnotemark and $Q$ and $Z$ are unitary matrices. The new matrices can be split into blocks conformably with $\Nb$ and $\Nf$, \footnotetext{By quasi-triangular we mean a matrix with $1\times 1$ and $2\times 2$ blocks along the main diagonal, depending on the occurrence of real and complex eigenvalues, and with zeros below it. Whether we perform a complex or real Schur decomposition irrelevant for constructing the solution. The choice affects only the computational efficiency of the procedure.}

$$
S = \begin{bmatrix} S_{11} & S_{12} \\ 0 & S_{22} \end{bmatrix}, \quad
T = \begin{bmatrix} T_{11} & T_{12} \\ 0 & T_{22} \end{bmatrix}, \quad
Z = \begin{bmatrix} Z_{11} & Z_{12} \\ Z_{21} & Z_{12} \end{bmatrix}, \quad
D = \begin{bmatrix} D_1 \\ D_2 \end{bmatrix} ,
$$

and arranged so that the upper left blocks $S_{11}$ and $T_{11}$ contain only the non-explosive eigenvalues whereas $S_{22}$ and $T_{22}$ have only the explosive ones. Furthermore, if there are unit roots in the system, we concentrate them in the upper-left blocks of $S_{11}$ and $T_{11}$; the reason for doing so becomes obvious later in the paper.

The procedure now consists of four simple steps:

1. solving the the lower, explosive, part of the transformed vector, $u\_t$, using forward iterations;
2. finding a transformation $\alpha\_t$ of the predetermined vector, $\xb\_t$,  such that it gives rise to a~triangular transition matrix;
3. solving for the upper, non-explosive, part of the transformed vector, $\alpha\_t$, in recursive form;
4. solving for the vector of forward-looking variables, $\xf\_t$.

First, we iterate the lower part of eq. \eqref{Eq:SchurSystem} forward and
get the following solution in which we retain the effect of all future
expected residuals, 

$$
\label{Eq:UnstableSolution}
u_t = F e_t + G \, F \, \Et \[ e\tp\] + G^2 F \, \Et \[ e_{t+2} \] + \cdots
$$

where

$$
F = -(T_{22})^{-1} D_2, \quad G = -(T_{22})^{-1} S_{22},
$$

cf. eq. \(5.5\) in Klein (2000). For ease of notation, we introduce
a~conditional expectations operator, $\(\fce_t\)^k e\_t = \Et \[e_{t+k}\]$,
and re-write \eqref{Eq:UnstableSolution} as a polynomial in $\fce_t$:

$$
\label{Eq:UnstableSolutionPoly}
u_t = \left[ \sum\nolimits_{k=0}^\infty (G \,\fce_t)^k \right] F e_t .
$$

Second, we introduce $\alpha_t = \(Z_{11}\)^{-1} \xb_t$, and denote $U :=
\(Z_{11}\)^{-1}$ for future reference. The new vector $\alpha\_t$ is
backward-looking, or predetermined, by construction. We will see shortly
that this particular transformation leads to a triangularized transition
matrix.

Third, noting that from \eqref{Eq:SchurTranform}

$$
\begin{gather}
\label{Eq:Triang_Transform}
\Et [ s\tp ] = \alpha_t - U Z_{12} \, \Et [ u\tp ], \quad \text{or} \quad
s_t = \alpha_{t-1} - U Z_{12} \, u_t,
$$

we can re-write the upper part of eq.~\eqref{Eq:SchurSystem} as

$$
S_{11} \alpha_t + (S_{12} - U Z_{12} )\,  \Et [ u\tp ] + T_{11} \alpha\tm + (T_{12} - U 
Z_{12}) \, u_t + D_1 e_t = 0.
$$

After substituting for $u\_t$ and $\Et \[ u\tp \] $ from \eqref{Eq:UnstableSolutionPoly}, we obtain the following process for $\alpha\_t$:

$$
\alpha_t = M_\alpha \, \alpha\tm + R_\alpha(\fce_t) \, e_t ,
$$

where $M_\alpha = -\(S_{11}\) T_{11}$ is upper triangular \(or
quasi-triangular\) by construction, and the coefficient matrices $R_{\alpha
0}$, $R_{\alpha 1}$, $R_{\alpha 2}$, $\ldots$ of the infinite polynomial

$$
R_\alpha(\fce_t) = R_{\alpha,0} + R_{\alpha,1} \, \fce_t + R_{\alpha,2}\, (\fce_t)^2 + 
\cdots
$$

can be easily calculated by evaluating the following polynominal expression
up to any desired order:

$$
\begin{multline*}
R_\alpha(\fce_t) = - S_{11}^{-1} D_1 +
\\ S_{11}^{-1}\, \Bigl[ (T_{11} U Z_{12} - T_{12} ) + (S_{11} U Z_{12} -  
S_{12} ) \, \fce_t \Bigr] \,
\Bigl[ \sum\nolimits_{k=0}^\infty (G \,\fce_t)^k \Bigr] \, F .
$$

We provide the formulas for the coefficient matrices below.

Fourth, we solve for the vector of forward-looking variables, $\xf\_t$.
Using~ \eqref{Eq:SchurTranform}, we get

$$
\xf_t = Z_{21} s_t + Z_{22} u_t = Z_{21} \alpha_{t-1} + (Z_{22} - Z_{21} U Z_{12} )\, u_t.
$$

Denoting

$$
\begin{gather*}
\Mf = Z_{21}, \\
\Rf(\phi_t) = (Z_{22} - Z_{21} U Z_{12} )\,\left[ \sum\nolimits_{k=0}^\infty (G 
\,\fce_t)^k \right] F,
\end{gather*}
$$

we can now summarise the resulting dynamics of the model \eqref{Eq:RESystem} as follows:

$$
\begin{gather}
\begin{bmatrix} \xf_t \\ \alpha_t \end{bmatrix}
= M \begin{bmatrix} \xf\tm \\ \alpha\tm \end{bmatrix}
+ R(\phi_t) \, e_t.
\\[2pt]
\xb_t = Z_{11} \alpha_t,
\end{gather}
$$

where

$$
M = \begin{bmatrix} 0 & \Mf \\ 0 & \Ma \end{bmatrix}, \quad \text{and} \quad
R(\cdot) = \begin{bmatrix} \Rf(\phi_t) \\ R_\alpha(\phi_t) \end{bmatrix}.
$$

Finally, the coefficient matrices for the polynomial $R\_\alpha\(\phi\_t\)$ are

$$
\begin{align*}
R_{\alpha,0} &= - S_{11}^{-1} D_1 + H F, \\
R_{\alpha,1} &= (H G + J) F, \\
&\vdots \\
R_{\alpha,k} &= (H G + J) G^{k-1} F,
\end{align*}
$$

where $H := \(S_{11}\)^{-1} \(T_{11} U Z_{12} - T_{12} \)$ and $J := \(S_{11}\)^{-1} \(S_{11} U Z_{12} -  
S_{12} \)$, whereas the coefficient matrices for $\Rf\(\phi\_t$\) are

$$
R_{f,0} &= K F, \\
R_{f,1} &= K G F, \\
&\vdots \\
R_{f,k} &= K G^k F,
$$

with $K := Z_{22} - Z_{21} U Z\_{12} $.

We have now completed the all matrices in the triangular
solution~\eqref{Eq:SolutionOne}-\eqref{Eq:SolutionTwo}.

## Simulations of Anticipated Shocks

