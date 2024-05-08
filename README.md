# Algebraic Loop Invariant Synthesis

*Prototype implementation of an algorithm for computing polynomial invariants for polynomial loops with fixed initial values.*

This repository contains the source files used for the benchmarks described in the ISSAC'24 submission:

* **Algebraic Tools for Computing Polynomial Loop Invariants** <br>*E. Bayarmagnai, F. Mohammadi, R. Prébet*

The files, contained in the "benchmarks" directory, require [Macaulay2](https://macaulay2.com/) to be run. You can follow the following steps to run examples.
1. Open the terminal and go to the directory where the files are.
2. Run Macaulay 2 (type M2).
3. Type load "terminal.m2".
4. If you want to run an example with a name "x" and degree d, then type computeInvariants("x.m2",d)
After these 4 steps, you will see a vector basis and the dimension of the dth truncated ideal and timing.
