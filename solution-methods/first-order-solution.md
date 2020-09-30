# First-Order Approximate Solution

## Introduction

In this article, we show an efficient algorithm for computing a first-order solution to rational-expectations \(RE\) models such that its transition matrix is upper triangular, or quasi triangular. The algorithm is efficient in the sense that no extra matrix factorization is needed in addition to the one that produces a more conventional solution. We argue that the triangularity, achieved by suitably transforming the state vector, is preferable and convenient for a number of reasons. Furthermore, we also calculate the forward expansion of the resulting solution to include the effect of expectations of future exogenous shocks.

Why is a triangular solution superior to the more conventional one with a general transition matrix? There are at least two broad reasons. First, handling systems with triangular transition matrices is computationally more efficient in many contexts; a notable example is solving a Lyapunov equation to obtain unconditional covariance matrices. Second, a triangular solution greatly simplifies the treatment of models with unit roots, such as automated detection of non-stationary variables or initialization of a Kalman filter. We discuss and exemplify this point later in more detail.

The paper is organized as follows. Section 2 explains the underlying assumptions and shows a recursive-form solution with a triangular transition matrix and forward expansion. Section 3 illustrates the algorithm on an example unit-root model. Appendix 1 provides details of the solution algorithm.

