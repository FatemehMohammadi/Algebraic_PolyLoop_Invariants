# Algebraic Loop Invariant Synthesis

*Prototype implementation of an new algorithm for computing polynomial invariants of fixed maximum degree for polynomial loops with fixed initial values.*

This repository contains two directories, that contain both implementation in [Macaulay2](https://macaulay2.com/) of the algorithm (aka Algorithm 2) described in the ISSAC'24 submission: 

* **Algebraic Tools for Computing Polynomial Loop Invariants** <br>*E. Bayarmagnai, F. Mohammadi, R. Prébet*

---
The directory **"benchmarks"** contains the source files used for the experiments reported in the above submission. Each of these files can be run using the following command in the terminal:

```
M2 <benchmark-name>_d<invariants-max-degree>.m2
```
---
The directory **"software"** contains the on-going implementation of the algorithm. In particular, it includes speedups that has not been described in the above document, and improve the timings. 

In this directory, you will find a the source code together with a directory "loops" where the user can find loop examples (e.g. "fib2.m2") to run the software on.

A short way to run the software is by the command:

```
M2 main.m2 -e 'computeInvariants("<loops/loop-name>.m2",<invariants-max-degree>)'
```

An alternative way is to run the following Macaulay commands (which requires to run Macaulay2 in the same directory):

```
load "main.m2"
computeInvariants("<loops/loop-name>.m2",<invariants-max-degree>)
```

The output consists of three elements:
1. a vector space basis of the vector space of all polynomial invariants of degree $\leq$ D, where D is the chosen maximum degree; each element of the basis is written on a new line; 
2. the dimension of the above vector space, that is the cardinal of the above basis;
3. the total time spent by the software to compute such data.

```
computeGeneralInvariants("<loops/loop-name>.m2",<invariants-max-degree>)
```

The output consists of two elements:
1. a vector space of the vector space of all polynomial invariants of the form $f(x)-f(a)=0$ with $\deg f\leq D$.
2. the total time spent by the software to compute such data.

```
computeMatrix("<loops/loop-name>.m2",<invariants-max-degree>)
```

The output consists of two elements:
1. A polynomial matrix $A$ with polynomial entries such that for any $\textbf{a}\in \mathbb{C}$ <br>
```math
I_{\mathcal{L}(\textbf{a}, \textbf{h},F),\mathbb{Q}_{\leq D}} =\left\{ \sum_{ |\alpha_i| \leq D}b_{i}\textbf{x}^{\alpha_i} \mid (b_1,\ldots,b_m) \in \ker\,A(\textbf{a}) \right\}.
```
2. the total time spent by the software to compute such data.
