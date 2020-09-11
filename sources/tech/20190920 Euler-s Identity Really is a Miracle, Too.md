[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Euler's Identity Really is a Miracle, Too)
[#]: via: (https://theartofmachinery.com/2019/09/20/euler_formula_miracle.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Euler's Identity Really is a Miracle, Too
======

[A post about the exponential function being a miracle][1] did the rounds recently, and [the Hacker News comment thread][2] brought up some debate about the miracle of Euler’s famous identity:

[e^{\pi i} + 1 = 0]

A while back I used to make a living teaching this stuff to high school students and university undergrads. Let me give my personal take on what’s so special about Euler’s identity.

### Complex numbers are already a miracle

Let’s start with complex numbers.

The first introduction to complex numbers is usually something like, “We don’t know what (\sqrt{- 1}) is, so let’s try calling it (i).” As it turns out, it works. [It works unreasonably well.][3] To see what I mean, imagine we tried to do the same thing with (\frac{1}{0}). We’ll let’s just make up a value for it called, say, (v). Now consider this old teaser:

[\begin{matrix} {x = 2} &amp; {,y = 2} \ {\therefore x} &amp; {= y} \ {\text{(multiply\ by\ y)}\therefore{xy}} &amp; {= y^{2}} \ {\text{(subtract\ x\ squared)}\therefore{xy} - x^{2}} &amp; {= y^{2} - x^{2}} \ {\text{(factorise)}\therefore x(y - x)} &amp; {= (y + x)(y - x)} \ {\text{(divide\ common\ factor)}\therefore x} &amp; {= y + x} \ {\text{(subtract\ x)}\therefore 0} &amp; {= y} \ {\therefore 0} &amp; {= 2} \ \end{matrix}]

(If you’re not sure about the factorisation, try expanding it.) Obviously (0 \neq 2), so where does this “proof” go wrong? At the point it assumes dividing by the (y - x) factor obeys the normal rules of algebra — it doesn’t because (y - x = 0). We can’t just quietly add (v) to our number system and expect any of our existing maths to work with it. On the other hand, it turns out we _can_ (for example) write quadratic equations using (i) and treat them just like quadratic equations using real numbers (even solving them with the same old quadratic formula).

It gets better. As anyone who’s studied complex numbers knows, after we take the plunge and say (\sqrt{- 1} = i), we don’t need to invent new numbers for, e.g., (\sqrt{i}) (it’s (\frac{\pm (1 + i)}{2})). In fact, instead of going “[turtles all the way down][4]” naming new numbers, we discover that complex numbers actually fill more gaps in the real number system. In many ways, complex numbers work better than real numbers.

### (e^{\pi i}) isn’t just a made up thing

I’ve met a few engineers who think that (e^{\pi i} = - 1) and its generalisation (e^{\theta i} = \cos\theta + i\sin\theta) are just notation made up by mathematicians for conveniently modelling things like rotations. I think that’s a shame because Euler’s formula is a lot more surprising than just notation.

Let’s look at some ways to calculate (e^{x}) for real numbers. With a bit of calculus, you can figure out this Taylor series expansion around zero (also known as a Maclaurin series):

[\begin{matrix} e^{x} &amp; {= 1 + x + \frac{x^{2}}{2} + \frac{x^{3}}{2 \times 3} + \frac{x^{4}}{2 \times 3 \times 4} + \ldots} \ &amp; {= \sum\limits_{n = 0}^{\infty}\frac{x^{n}}{n!}} \ \end{matrix}]

A neat thing about this series is that it’s easy to compare with [the series for sin and cos][5]. If you assume they work just as well for complex numbers as real numbers, it only takes simple algebra to show (e^{\theta i} = \cos\theta + i\sin\theta), so it’s the classic textbook proof.

Unfortunately, if you try evaluating the series on a computer, you hit numerical stability problems. Here’s another way to calculate (e^{x}):

[e^{x} = \lim\limits_{n\rightarrow\infty}\left( 1 + \frac{x}{n} \right)^{n}]

Or, translated naïvely into a stupid approximation algorithm in computer code [1][6]:

```
import std.algorithm;
import std.range;

double approxExp(double x, int n) pure
{
    return (1 + x / n).repeat(n).reduce!"a * b";
}
```

Try plugging some numbers into this function, and you’ll see it calculates approximate values for (e^{x}) (though you might need `n` in the thousands to get good results).

Now for a little leap of faith: That function only uses addition, division and multiplication, which can all be defined and implemented for complex numbers without assuming Euler’s formula. So what if you replace `double` with [a complex number type][7], assume everything’s okay mathematically, and try plugging in some numbers like (3.141593i)? Try it for yourself. Somehow everything starts cancelling out as (n) gets bigger and (x) gets closer to (\pi i), and you get something closer and closer to (- 1 + 0i).

### (e) and (\pi) are miracles, too

Because mathematicians prefer to write these constants symbolically, it’s easy to forget what they really are. Imagine the real number line stretching from minus infinity to infinity. There’s one notch slightly below 3, and another notch just above 3, and for deeper reasons, these two notches are special and keep turning up in seemingly unrelated places in maths.

For example, take the series sum (\frac{1}{1} + \frac{1}{2} + \frac{1}{3} + \ldots). It doesn’t converge, but the sum to (n) terms (called the Harmonic function, or (H(n))) approximates (\log_{e}n). If you square the terms, the series converges, but this time (\pi) appears instead of (e): (\frac{1}{1^{2}} + \frac{1}{2^{2}} + \frac{1}{3^{2}} + \ldots = \frac{\pi^{2}}{6}).

Here’s some more context for why the ubiquity of (e) and (\pi) is special. “The ratio of a circle’s circumference to its diameter” and “the square root of 2” are both numbers that can’t be written down as exact decimals, but at least we can describe them well enough to _define_ them exactly. Imagine some immortal creature tried listing all the numbers that can be mathematically defined. The list could start with all numbers that can be defined in under 10 characters, then all the numbers that can be defined in 10-20 characters, and so on. Obviously, that list never ends, but every definable number will appear on it somewhere, at some finite position. That’s what Georg Cantor called countably infinite, and he went on to prove ([using a simple diagonalisation argument][8]) that the set of real numbers is somehow infinitely bigger than that. That means most real numbers aren’t even definable.

In other words, you could say maths with numbers is based on a sea of literally indescribable chaos. Thinking of it that way, it’s amazing that the five constants in Euler’s formula get us as far as they do.

### Yes, the exponential function is a miracle

I hinted that we can’t just assume that the Taylor series expansion for (e^{x}) works for complex numbers. Here are some examples that show what I mean. First, take the series expansion of (e^{- x^{2}}), the shape of the bell curve famous in statistics:

[e^{- x^{2}} = 1 - x^{2} + \frac{x^{4}}{2} - \frac{x^{6}}{3!} + \frac{x^{8}}{4!} - \ldots]

Of course, we can’t calculate the whole infinite sum, but we can approximate it by taking the first (n) terms. Here’s a plot of approximations taking successively more terms. We can see the bell shape after a few dozen terms, and the more terms we add, the better it gets:

![][9]

Okay, that’s a Taylor series doing what it’s supposed to. How about we try the same thing with another hump-shaped curve, (\frac{1}{1 + x^{2}})?

![][10]

This time it’s like there’s an invisible brick wall at (x = \pm 1). By adding more terms, we can get as close to perfect an approximation as we like, until (x) hits (\pm 1), then the approximation stops converging. The series just won’t work beyond that. But if Taylor expansion doesn’t always work for the whole real number line, can we take it for granted that the series for (e^{x}), (\sin x) and (\cos x) work for complex numbers?

To get some more insight, we can colour in the places in the complex plane where the Taylor series for (\frac{1}{1 + x^{2}}) converges. It turns out we get a perfect circle of radius 1 centred at 0:

![][11]

There are two special points on the plane: (i) and (- i). At these points, (\frac{1}{1 + x^{2}}) turns into a (\frac{1}{0}) singularity, and the series expansion simply can’t work. It’s as if the convergence region expands out from 0 until it hits these singularity points and gets stuck. The funny thing is, these singularities in the complex plane limit how far the Taylor series can work, even when if we derive it using nothing but real analysis.

It turns out that (e^{x}), (\sin x) and (\cos x) don’t have any problematic points in the complex plane, and that’s why we can easily use Taylor series to explore them beyond real numbers.

This is yet another example of things making more sense when analysed with complex numbers, which only makes “real” numbers look like the odd ones out. Which raises another question: if [complex numbers are apparently fundamental to explaining the universe][12][2][13], why do we only experience real values? Obviously, the world would be a very different place if we could eat (i) slices of pizza, or if the flow of time had real and imaginary parts. But why the heck _not_?

### Provably true things can still be surprising

Of course, philosophy about the physical world aside, none of this is just luck. Maths is maths and there’s no alternative universe where things work differently. That’s because there are logical reasons why all this is true.

But I don’t think that makes it less special. Arthur C. Clarke famously said that any sufficiently advanced technology is indistinguishable from magic, and I don’t think it should lose all magic as soon as someone, somewhere is smart enough to figure out how to make it work. Likewise, I don’t think mathematical theory becomes less special just because someone figures out a proof. On the contrary, it’s thanks to people wondering about these miraculous patterns that we have the calculus and complex analysis needed to understand how it all works.

  1. A less-stupid version uses squaring instead of naïve exponentiation: `return (1 + z / (1<<n)).recurrence!"a[n-1] * a[n-1]".take(n+1).reduce!"b"` [↩︎][14]

  2. A classical physics example is the shape of a chain hanging from two poles (i.e., [a catenary][15]): it’s the shape of (\cos ix) [↩︎][16]




--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/09/20/euler_formula_miracle.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://blog.plover.com/math/exponential.html
[2]: https://news.ycombinator.com/item?id=20954275
[3]: https://www.dartmouth.edu/~matc/MathDrama/reading/Wigner.html
[4]: https://en.wikipedia.org/wiki/Turtles_all_the_way_down
[5]: https://en.wikipedia.org/wiki/Taylor_series#Trigonometric_functions
[6]: tmp.03tyq5Ssty#fn:1
[7]: https://dlang.org/phobos/std_complex.html
[8]: https://www.coopertoons.com/education/diagonal/diagonalargument.html
[9]: https://theartofmachinery.com/images/euler_formula_miracle/taylorbellcurve.svg
[10]: https://theartofmachinery.com/images/euler_formula_miracle/taylorfailure.svg
[11]: https://theartofmachinery.com/images/euler_formula_miracle/taylorconvergence.svg
[12]: https://www.scottaaronson.com/blog/?p=4021
[13]: tmp.03tyq5Ssty#fn:2
[14]: tmp.03tyq5Ssty#fnref:1
[15]: http://mathworld.wolfram.com/Catenary.html
[16]: tmp.03tyq5Ssty#fnref:2
