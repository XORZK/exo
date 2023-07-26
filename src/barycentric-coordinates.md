---
title: Barycentric Coordinates
date: 07-22-2023
author: Henry W.
---

Imagine that there exists a triangle $ABC$, for which the vertices exists in $\mathbb{R}^3$. That is, each vertex, which ultimately defines the triangle is a vector in 3-D space. How would one go about checking whether or not some point $P$ lies within triangle $ABC$?

One possible solution is to use *barycentric coordinates*.

Barycentric Coordinates are weights $(\alpha, \beta, \gamma)$ which define a point $P$ according to vertices $A, B, C$ such that: 

$$ P = \alpha A + \beta B + \gamma C \text { and } \alpha + \beta + \gamma = 1 $$

Furthermore, these weights $(\alpha, \beta, \gamma)$ can be thought of as signed ratios of areas, formed between the vertices and the given point $P$.

<center markdown="1">
![](/img/triangle.png)
</center>

As you can see, the triangle $ABC$ is split primarily into three smaller triangles by point $P$. These triangles are: $\triangle ABP$, $\triangle BPC$, and $\triangle APC$. One way of determining the weights $(\alpha, \beta, \gamma)$ is to use these smaller triangles.

$$\alpha = \frac{[\triangle BPC]}{[\triangle ABC]}$$

$$\beta = \frac{[\triangle APC]}{[\triangle ABC]}$$

$$\gamma = \frac{[\triangle ABP]}{[\triangle ABC]}$$

If we harness the use of vectors, computing these areas is incredibly simple through the use of cross products.

$$[\triangle ABP] = \frac{\| (A-B) \times (P-B) \|}{2} $$

$$[\triangle BPC] = \frac{\| (C-B) \times (P-B) \|}{2} $$

$$[\triangle APC] = \frac{\| (A-C) \times (P-C) \|}{2} $$

$$[\triangle ABC] = \frac{\|(A-C) \times (B-C) \|}{2} $$

Therefore,

$$ \alpha = \frac{\| (C-B) \times (P-B) \|}{\| (A-C) \times (B-C) \|} $$

$$ \beta = \frac{\| (A-C) \times (P-C) \|}{\| (A-C) \times (B-C) \|} $$

$$ \gamma = \frac{\| (A-B) \times (P-B) \|}{\| (A-C) \times (B-C) \| } $$

One method to check whether or not point $P$ lies within $\triangle ABC$ is to check whether or not the individual areas of the subtriangles $[\triangle ABP]$, $[\triangle BPC]$, and $[\triangle APC]$ add up to the area of the larger triangle. That is:

$$[\triangle ABP] + [\triangle BPC] + [\triangle APC] = [\triangle ABC] $$

This can also be checked using $(\alpha, \beta, \gamma)$. Technically, if:

$$[\triangle ABP] + [\triangle BPC] + [\triangle APC] = [\triangle ABC] $$

$$\implies \frac{[\triangle ABP]}{[\triangle ABC]} + \frac{[\triangle BPC]}{[\triangle ABC]} + \frac{[\triangle APC]}{[\triangle ABC]} = \frac{[\triangle ABC]}{[\triangle ABC]} $$

$$\implies \alpha + \beta + \gamma = 1$$

$$ \text{If } \alpha + \beta + \gamma \ne 1, \text{ point P is located outside of } \triangle ABC$$
