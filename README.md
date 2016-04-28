## Building Abstractions with Procedures
* Computational Process

## The key of understanding complicate thing is to ignore details
* Know what not to look at, not to compute, not to think
* The way you would construct a recursive process is by wishful thinking
* Whenever you see yourself writing the same thing down more than once, there must be something wrong. The reason is not because it is wasting time to write some again, it's about idea.
* Abstraction is the key to conquer complexity

## What is data
* Wishful thinking there exists.
* There is no real differences in some sense between procedures and data

## In order to make system robust
* Small changes, small changes on the problems should lead small changes to the solutions
* Instead of solving a particular problem at every level of decomposition of the problem to sub problems
  * We solve the class problems which are neighborhood of the particular problem you're trying to solve
  * The way you do that is by creating a language at that level of detail, in which the solution to those class problems are representable at that language.
  * which is **Embed Language**
* Dispatching on the type of expression, expressions are absolutely essential in building languages
* Data abstraction barriers are powerful tools for controlling complexity. By isolating the underlying representations data objects, we can divide the task of designing a large program into smaller tasks that can be performed separately.
  * But this technique is not very powerful for every "underlying representation" for a data object
* What we todo instead of bringing the rules to the computers by writing a program that is of these rules, in the computers language
  * The way we understanding a rule is from a pattern --> skeleton, if an expression matched a rule it will be transferred to another expression which is instantiated skeleton.
  * We're going to bring the computer to the level of us by running a way by which the computers can understand rules of this sort
  * This is slightly emphasizing
