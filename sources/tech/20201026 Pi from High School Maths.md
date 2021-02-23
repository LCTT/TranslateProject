[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Pi from High School Maths)
[#]: via: (https://theartofmachinery.com/2020/10/26/pi_from_high_school_maths.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Pi from High School Maths
======

Warning: I don’t think the stuff in this post has any direct practical application by itself (unless you’re a nuclear war survivor and need to reconstruct maths from scratch or something). Sometimes I like to go back to basics, though. Here’s a look at (\pi) and areas of curved shapes without any calculus or transcendental functions.

### A simple algorithm for calculating (\pi)

This algorithm starts with simple number theoretic musing. Some whole numbers form neat Pythagorean triples ((x,y,z)) where (x^{2} + y^{2} = z^{2}). E.g., (3^{2} + 4^{2} = 5^{2}). It’s easy to find all the solutions to (x^{2} + y^{2} = 5^{2}) through brute-force search because we know that (x) and (y) can’t be bigger than (5). Here they are:

[\begin{matrix} {0^{2} + 5^{2}} &amp; {= 5^{2}} \ {3^{2} + 4^{2}} &amp; {= 5^{2}} \ {4^{2} + 3^{2}} &amp; {= 5^{2}} \ {5^{2} + 0^{2}} &amp; {= 5^{2}} \ \end{matrix}]

(Plus all the negative-number combinations, but let’s stick with non-negative integers and just count 4 solutions.) If we relax the equation, and count solutions to (x^{2} + y^{2} \leq 5^{2}), the answer turns out to be 26. Why care? Well, if (t) is the total number of solutions to (x^{2} + y^{2} \leq n^{2}), then

[\lim\limits_{n\rightarrow\infty}\frac{4t}{(n + 1)^{2}} = \pi]

Or, in code, here’s a simple program that estimates (\pi), getting more accurate for bigger values of the `n` variable:

```
import std;

ulong sq(ulong x) pure
{
    return x * x;
}

void main(string[] args)
{
    const n = args.length > 1 ? args[1].to!ulong : 20;

    ulong total;
    foreach (x; 0..n+1)
    {
        foreach (y; 0..n+1)
        {
            if (sq(x) + sq(y) <= sq(n)) total++;
        }
    }

    /*
    // Alternatively, for functional programming fans:
    const total =
        cartesianProduct(iota(n+1), iota(n+1))
        .filter!(p => sq(p[0]) + sq(p[1]) <= sq(n))
        .walkLength;
    */

    writef("%.12f\n", 4.0 * total / sq(n+1));
}

$ ./pi_calc
3.038548752834
$ ./pi_calc 10000
3.141362256135
```

Okay, that’s a little bit more accurate than (\frac{22}{7}). Unlike most formulae for (\pi), though, there’s a simple diagram that shows how it works. Imagine we lay out the ((x,y)) integer pairs (where (x) and (y) range from (0) to (n)) on a 2D grid the obvious way. The figure below shows an example for (n = 10), with the arrow (r) pointing from the origin to ((6,8)). (r) and the (x) and (y) components make a right-angled triangle, so [Pythagoras’s theorem][1] says that (x^{2} + y^{2} = r^{2}). For ((6,8)), (r = 10 = n), so ((6,8)) is on the boundary as a solution to (x^{2} + y^{2} \leq 10^{2}). That boundary (the set of real-valued points a constant distance (n = 10) from the origin) makes a quarter circle.

![][2]

A circle is a simple, convex shape, and the grid points are evenly spaced, so the number of points inside the quarter circle will be roughly proportional to the area. More specifically, the fraction of all the grid points inside the quarter circle will be roughly the area of the quarter circle divided by the area of square around all points. The quarter circle area is (\pi r^{2} \div 4), inside the square of area (r^{2}) (remember, (n = r)), so (\frac{\pi}{4}) of all points represent solutions. The (x) and (y) values count from (0) to (n), so there are ((n + 1)^{2}) grid points. Rearrange the equations and you get a formula for estimating (\pi) from a solution count. The grid points keep drawing an arbitrarily more accurate circle as (n) gets bigger (just like a higher-resolution computer monitor does) so the estimate is exact in the limit.

### A faster implementation

The code above is simple but slow because it brute-force scans over all ((n + 1) \times (n + 1))possible (x) and (y) values. But we obviously don’t need to scan _all_ values. If we know that (x^{2} + y^{2} \leq n^{2}), then making (x) or (y) smaller will only give us another solution. We don’t need to keep testing smaller values after we find a solution. Ultimately, we only need to find the integral points around the boundary. Here’s a faster algorithm based on that idea.

Imagine we scan along the integral (x) values and find the maximum integral (y) value that still gives us a solution. This gives us a border line marked in red in the figure below. If (y = 8) for a given (x) value, we instantly know there are (8 + 1 = 9) solutions with that given (x) value ((+ 1) to count the (y = 0) solution).

![][3]

Note that as (x) scans from (0) to (n), (y) starts at (n) and decreases to (0). Importantly, it _only_ decreases — it’s monotonic. So if we scan (x) from (0) to (n), we can find the next boundary (y) point by starting from the previous boundary point and searching downwards. Here’s some code:

```
ulong y = n, total;
foreach (x; 0..n+1)
{
    while (sq(x) + sq(y) > sq(n)) y--;
    total += y + 1;
}
```

This version still has nested loops, so it might look like it’s still (O(n^{2})). However, the inner `while` loop executes a varying number of times for each (x) value. Often the `y--` doesn’t trigger at all. In fact, because `y` starts from `n` and monotonically decreases to 0, we know the `y--` will be executed exactly `n` times in total. There’s no instruction in that code that executes more than (O(n)) times, total, so the whole algorithm is (O(n)).

With 64b `ulong` integers, the largest value of `n` that works before overflow is 4294967294:

```
$ ./pi_calc 4294967294
3.141592653058
```

There are ways to get faster convergence using numerical integration tricks, but I like the way this algorithm only uses integer arithmetic (up until the final division), and can be understood directly from simple diagrams.

### Area of a circle without calculus

Perhaps you feel a bit cheated because that algorithm assumes the (\pi r^{2}) formula for the area of a circle. Sure, that’s arguably included in “high school maths”, but it’s something students just get told to remember, unless they study integral calculus and derive it that way. But if we’re going to assume (\pi r^{2}), why not assume the theory of trigonometric functions as well, and just use (\pi = 4\operatorname{atan}(1))?

The great ancient Greek mathematician Archimedes figured out the circle area over two thousand years ago without integral calculus (or trigonometric functions for that matter). He started with an elegant insight about regular (i.e., equal-sided) polygons.

The famous [“half base times height” formula for the area of a triangle already had a well-known proof in the first book of Euclid’s Elements of Geometry][4] (easily derived from [a theorem about parallelograms][5]). Conveniently, any regular polygon can be split into equal triangles joined to the centre. For example, a regular hexagon splits into six triangles, as in the figure below. We can take any one of the triangles (they’re all the same) and call the “base” the side that’s also a side of the polygon. Then the “height” is the line from the centre of the base to the centre of the polygon.

![][6]

Now here’s Archimedes’s neat insight: The ratio of the triangle area to the base is (\frac{h}{2}). If you add up all the areas, you get the area of the polygon. Likewise, if you add up all the bases, you get the perimeter of the polygon. Because the triangle area/base ratio is a constant (\frac{h}{2}) for all triangles, the area/perimeter ratio for the whole polygon is the same (\frac{h}{2}). As a formula, the area of _any_ regular polygon is (P \times \frac{h}{2}) (where (P) is the perimeter).

If you think of a circle as a regular polygon with infinitely many sides (so that (h) becomes the radius of the circle), and use the circle circumference ((2\pi r)) as your basic definition of (\pi), then that implies the area of a circle is (2\pi r \times \frac{r}{2} = \pi r^{2}).

Of course, Archimedes was a respected mathematician who couldn’t get away with just assuming that anything true of a polygon is true of a circle (counterexample: all polygons have bumpy corners, but circles don’t). He used the kind of geometric proof by contradiction that was popular in his day. (He even took it further and analysed spheres, cylinders, parabolas and other curved objects, almost inventing something like modern real analysis a couple of millenia early.) Sadly, not all of his mathemetical work has survived, but [the key part of his Measurement of a Circle][7] has.

Here’s the high-level version. Archimedes claimed that the area of a circle is (2\pi r \times \frac{r}{2}). Suppose you think his value is too small, and the circle is really bigger than (2\pi r \times \frac{r}{2}). That means there’s enough room inside the circle to fit a regular polygon that’s also bigger than (2\pi r \times \frac{r}{2}). But Archimedes said that’s contradictory because for any such polygon, (h &lt; r), and (P &lt; 2\pi r) (because each side of the polygon is a straight line that’s shorter than the circle arc that connects the same points), so the area (A = P \times \frac{h}{2} &lt; 2\pi r \times \frac{r}{2}). The polygon’s area can’t be both bigger and smaller than (2\pi r \times \frac{r}{2}).

![][8]

Archimedes argued that there’s a similar contradiction if you think (2\pi r \times \frac{r}{2}) is too big, and the circle area is smaller than that. In that case he could make a polygon that’s also smaller than (2\pi r \times \frac{r}{2}), yet still wraps around the circle. For this polygon, (h = r), but he said the perimeter of the polygon must be greater than (2\pi r)[1][9], so that the polygon’s area must be bigger than (2\pi r \times \frac{r}{2}), even though it’s also meant to be smaller.

![][10]

If both of those cases lead to contradiction, we’re left with the only alternative that the circle area is (\pi r^{2}).

  1. I don’t actually know how he argued this. [↩︎][11]




--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2020/10/26/pi_from_high_school_maths.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://www.cut-the-knot.org/pythagoras/
[2]: https://theartofmachinery.com/images/pi_from_high_school_maths/pi_calc_grid.svg
[3]: https://theartofmachinery.com/images/pi_from_high_school_maths/pi_fast_calc_grid.svg
[4]: https://mathcs.clarku.edu/~djoyce/java/elements/bookI/propI37.html
[5]: https://mathcs.clarku.edu/~djoyce/java/elements/bookI/propI35.html
[6]: https://theartofmachinery.com/images/pi_from_high_school_maths/polygon.svg
[7]: https://flashman.neocities.org/ARCHCI1set.htm
[8]: https://theartofmachinery.com/images/pi_from_high_school_maths/polygon_inner.svg
[9]: tmp.gJlezpSbZb#fn:1
[10]: https://theartofmachinery.com/images/pi_from_high_school_maths/polygon_outer.svg
[11]: tmp.gJlezpSbZb#fnref:1
