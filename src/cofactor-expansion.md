---
title: Cofactor Expansion
date: 07-15-2023
author: Henry W.
---

Recently, I've picked up a little bit of linear algebra to lay the foundation for a project I've been building. Even though I was first introduced to some concepts within the realm of linear algebra in my freshman and sophomore years of high school, they were very shallow topics and I didn't really learn any application. Sometime in 10th grade, I built my first system of equations solver, which I bashed together in only a couple of hours. Recently, to support a small linear algebra library that I've been building, I reimplemented the same program, this time with far more ease.

My SOE solver was simple:

1. Find the determinant of some coefficient matrix $M$
2. If $det(M) \ne 0$, $\exists M^{-1}: M * M^{-1} = I_n$
3. Use Gauss-Jordan Elimination to find $M^{-1}$ given $M$.

Evidently, two fundamental parts to building the SOE solver is the function which computes the determinant of $M$, as well as the function which computes the inverse of $M$ using Gauss-Jordan Elimination.

To compute the determinant of some $n * n$ matrix $M$, we can use something known as the "Cofactor Expansion".

When you begin to learn about matrices, one of the first most commonly stated facts is: 

The determinant of some 1x1 matrix $M = \begin{pmatrix} a \end{pmatrix}$, $det(M) = a$. Using this information, it's actually possible to find the determinant of any square matrix in a recursive manner.

First, let's define a couple of important terms which are used in the Cofactor Expansion of any square matrix. 

Let A be an $n*n$ matrix. The $(i,j)$ minor of $A$, which is denoted $A_{i,j}$ is defined as the $(n-1)*(n-1)$ matrix resulting from the deletion of the $i^{th}$ row and $j^{th}$ column. For example:

$$\text{If } A = \begin{pmatrix} 1 & 2 & 3 \\\ 4 & 5 & 6 \\\ 7 & 8 & 9 \end{pmatrix} \text{ then } A_{1,1} = \begin{pmatrix} 5 & 6 \\ 8 & 9\end{pmatrix} $$ 

Furthermore, the $(i, j)$ cofactor of $A$, denoted $C_{i,j}$ is defined in terms of the minor $(i,j)$ of A as: $C_{i,j} = (-1)^{i+j} * det(A_{i,j})$

For example:

$$\text{If } A = \begin{pmatrix} 1 & 2 \\\ 3 & 4 \end{pmatrix} \text{ then } C_{1, 1} = (-1)^{1 + 1} * det(A_{1,1}) = (1) * det(\begin{pmatrix} 4 \end{pmatrix}) = 4$$

Therefore, the $(1,1)$ cofactor of $A = \begin{pmatrix} 1 & 2 \\\ 3 & 4 \end{pmatrix}$ is $C_{1,1} = 4$.

The Cofactor Formula states: 

For any $i \in \{1, ..., n\}$, the determinant of an $n*n$ matrix $A$ is:

$$ det(A) = A_{i,1}*(-1)^{i+1}*det(A_{i,1}) + A_{i,2}*(-1)^{i+2}*det(A_{i,2}) + ... + A_{i,n}*(-1)^{i+n}*det(A_{i,n}) $$

In sigma notation, this is written as:

$$ det(A) = \sum_{j=1}^{n} A_{i,j} * (-1)^{i+j} * det(A_{i,j}) = \sum_{j=1}^{n} A_{i,j} * C_{i,j}$$

This is known as the cofactor expansion along the $i^{th}$ row. Similarly, a cofactor expansion can be done for any column $j$ as well.

Therefore, for any $j \in \{j, ..., n\}$, the determinant of an $n*n$ matrix $A$ is:

$$ det(A) = A_{1, j}*(-1)^{1+j}*det(A_{1,j}) + A_{2,j}*(-1)^{2+j}*det(A_{2,j}) + ... + A_{n,j} * (-1)^{n+j} * det(A_{n,j}) $$

$$ det(A) = \sum_{i=1}^{n} A_{i,j} * (-1)^{i+j} * det(A_{i,j}) = \sum_{i=1}^{n} A_{i,j} * C_{i,j}$$

This is known as the cofactor expansion along the $j^{th}$ column.

We can now use the Cofactor Expansion formula to prove that the determinant of a $2*2$ matrix $M = \begin{pmatrix} a & b \\\ c & d \end{pmatrix} = ad - bc$.

For the sake of simplicity, lets perform the Cofactor Expansion along the 1st row.

As the formula for Cofactor Expansion states, when $i = 1 \text{ and } n = 2$:

$$ det(A) = \sum_{j=1}^{n} A_{i,j} * C_{i, j} = A_{1, 1} * C_{1, 1} + A_{1, 2} * C_{1,2} $$

$$ det(A) = [(a * (-1)^({1+1}) * det(A_{1,1})) + (b * (-1)^{(1 + 2)} * det(A_{1,2}))] $$

$$ det(A) = [(a * (1) * det(\begin{pmatrix} d \end{pmatrix})) + (b * (-1) * det(\begin{pmatrix} c \end{pmatrix}))] $$

$$ \therefore det(A) = ad - bc \text{ by Cofactor Expansion }$$

Using Cofactor Expansion, we can then determine a rigid formula for the determinant of a 3x3 matrix $M$ using Cofactor Expansion on the 1st Row.

Let $M = \begin{pmatrix} x_1 & y_1 & z_1 \\\ x_2 & y_2 & z_2 \\\ x_3 & y_3 & z_3 \end{pmatrix}$. By Cofactor Expansion, when $i = 1, n = 3$:

$$ det(M) = \sum_{j=1}^{n} A_{i,j} * C_{i,j} $$

$$ det(M) = [(x_1 * C_{1, 1}) + (y_1 * C_{1,2}) + (z_1 * C_{1,3})] $$

$$ det(M) = [(x_1 * (-1)^{(1+1)} * det(M_{1,1})) + (y_1 * (-1)^{(1+2)} * det(M_{1,2})) + (z_1 * (-1)^{(1+3)} * det(M_{1,2}))] $$

$$ det(M) = [(x_1 * det(\begin{pmatrix}y_2 & z_2 \\\ y_3 & z_3 \end{pmatrix})) - (y_1 * det(\begin{pmatrix} x_2 & z_2 \\\ x_3 & z_3 \end{pmatrix})) + (z_1 * det(\begin{pmatrix} x_2 & y_2 \\\ x_3 & y_3 \end{pmatrix}))] $$

$$ \therefore det(M) = [(x_1 * [y_2z_3 - y_3z_2]) - (y_1 * [x_2z_3 - x_3z_2]) + (z_1 * [x_2y_3 - x_3y_2])] $$

## Implementing Cofactor Expansion Recursively

All recursive functions must have a base case, and recursive case. The base case for finding the determinant of a matrix using Cofactor Expansion is when the matrix is $1*1$. Otherwise, we can use recursion to break down matrices into minors until they are eventually $1*1$ matrices.

```c++

double det(matrix<double> M) {
    assert(M.is_square());

    // If M is a 1x1 matrix, return the only entry in M.
    if (M.rows() == 1) {
        return M[0][0];
    }

    d = 0;

    // Perform Cofactor Expansion on the ith row.
    uint64_t i = 0;

    for (uint64_t j = 0; j < M.rows(); j++) {
        // Calls det(M(i,j)) 
        d += M[i][j] * ((i + j) % 2 == 0 ? 1 : -1) * det(M.minor(i,j));
    }

    return d;
}
```
