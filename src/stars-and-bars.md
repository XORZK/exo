---
title: Stars and Bars 
date: 07-12-2023
---

Within the mathematical field of combinatorics and contest mathematics, stars and bars is a popular idea for deriving certain theorems regarding the distribution of identical objects into distinct boxes. 

The generalized form of the most basic "Stars and Bars" question asks: 
*How many ways are there to distribute $n$ identical (indistinguisable) balls into $k$ distinct (distinguishable) boxes, such that each box contains at least 1 ball.*

Much like the majority of contest math ideas, there is an elegant and simplistic visual solution to the problem above.

We can visualize the $n$ balls to be organized in a row. 

<center>
O O O ... O O O
</center>

The balls distributed to each of the $k$ boxes can be determined by placing $k-1$ "wedges" in between gaps between the balls. The amount of balls between adjacent wedges represent the amount of balls distributed to a box. The amount of balls which are found between the $(i-1)^{th}$ and $i^{th}$ wedge represents the amount of balls within the $i^{th}$ box. Furthermore, the $0^{th}$ and $n^{th}$ wedge are not shown, but they represent the beginning and the end of the row of balls. Therefore, to divide the $n$ balls into $k$ boxes, one only needs to place $k-1$ wedges.

For example, if $n = 7$ and $k = 3$, a possible configuration is:

<center>
O | O O | O O O O 
</center>

In this example, there's 1 ball in the first box, 2 balls in the second box and 4 balls in the third box. When $n = 7$ and $k = 3$, there are 6 possible locations to put the 2 wedges.

Thus, when generalized: $\forall n, k\in \mathbb{N}$, there are $\binom{n-1}{k-1}$ ways to distribute $n$ identical balls into $k$ distinct boxes.

Furthermore, the question of distributing $n$ balls into $k$ boxes such that each box contains at least one ball can be reworded as:
*How many k-tuples of positive integers exist who sum of elements is $n$?*

Denote the $i^{th}$ element in the k-tuple as $a_i$. 

$$\sum_{i=1}^{k} a_i = n, \text{ with } a_i > 0 \text{ for } 1 \le i \le k $$

Since this is just an algebraic rewording of the previous question with balls and boxes, once again, the number of k-tuples of positive integers whose elements adds up to n is $\binom{n-1}{k-1}$.

For example, one possible question which involves stars and bars is: Find the number of quintuples $(x_1, x_2, x_3, x_4, x_5)$ of positive integers which satisfy $x_1 + x_2 + x_3 + x_4 + x_5 = 7$.

The amount of quintuples $(x_1, x_2, x_3, x_4, x_5)$ which satisfy these conditions are: $\binom{6}{4} = 15$ quintuples.

This number is small enough to actually list out the set of quintuples:

$S = \{(1, 2, 2, 1, 1), (1, 3, 1, 1, 1), (1, 1, 2, 2, 1), (2, 1, 1, 1, 2), (1, 1, 1, 1, 3), (1, 2, 1, 2, 1), (1, 1, 3, 1, 1), (2, 1, 2, 1, 1), (1, 2, 1, 1, 2), (2, 2, 1, 1, 1), (1, 1, 2, 1, 2), (1, 1, 1, 2, 2), (1, 1, 1, 3, 1), (2, 1, 1, 2, 1), (3, 1, 1, 1, 1)\}$

By inspecting this set of quintuples, it's evident that there are only 2 unique quintuples: $(1,1,1,2,2)$ and $(1,1,1,1,3)$, and all other quintuples in the set are permutations of these base quintuples.

There are $\binom{5}{2} = 10$ permutations of the $(1,1,1,2,2)$ tuple and $\binom{5}{1} = 5$ permutations of the $(1,1,1,1,3)$ tuple, which together form the set of $\binom{5}{2} + \binom{5}{1} = \binom{6}{4} = 15$ tuples.

In the current state, the problem space is relatively constricted: it can only solve problems when there is at least one ball in each bin, that is $x_i > 0 \text{ for } 1 \le i \le n$.

What if $x_i$ was bounded by some $m_i \in \mathbb{Z}$ such that $x_i \ge m_i$. For example: Find the number of quintuple of integers $(x_1, x_2, x_3, x_4, x_5)$ such that:

1. $x_i \ge i \text{ for } 1 \le i \le n$
2. $\sum_{i=1}^{5} x_i = 25$

How do we translate this problem to a Stars and Bars problem? If we imagine each $x_1$, $x_2$ ... $x_n$ to once again represent boxes. To get rid of the arbitrary lower bounds $m_i$ we can simply distribute $m_i - 1$ balls into the $i^{th}$ box before solving the problem as a Stars and Bars. Thus, to satisfy the restrictions when we actually "distribute" the balls, each box only needs 1 ball to satisfy the restriction of $x_i \ge m_i$. Thus, turning into the classic Stars and Bars problem.

So, to solve the example, we denote $a_i = x_i - i + 1$ where $a_i \gt 0$. The equation $x_1 + x_2 + x_3 + x_4 + x_5 = 25$ becomes $(x_1 - 0) + (x_2 - 1) + (x_3 - 2) + (x_4 - 3) + (x_5 - 4) = 25 - \sum_{i = 1}^{4} i$.

Thus, $a_1 + a_2 + a_3 + a_4 + a_5 = 15$ with $a_i \gt 0 \text{ for } 1 \le i \le 5$. By Stars and Bars, there exists $\binom{14}{4}$ quintuples $(a_1, a_2, a_3, a_4, a_5)$ such that $\sum_{i = 1}^{5} a_i = 15$. Similarly, this also means that there exists $\binom{14}{4} = 1001$ quintuples $(x_1, x_2, x_3, x_4, x_5)$ which satisfy the conditions presented above. 
