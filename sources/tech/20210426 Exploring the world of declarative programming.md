[#]: subject: (Exploring the world of declarative programming)
[#]: via: (https://fedoramagazine.org/exploring-the-world-of-declarative-programming/)
[#]: author: (pampelmuse https://fedoramagazine.org/author/pampelmuse/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Exploring the world of declarative programming
======

![][1]

Photo by [Stefan Cosma][2] on [Unsplash][3]

### Introduction

Most of us use imperative programming languages like C, Python, or Java at home. But the universe of programming languages is endless and there are languages where no imperative command has gone before. That which may sound impossible at the first glance is feasible with Prolog and other so called declarative languages. This article will demonstrate how to split a programming task between Python and Prolog.

In this article I do not want to teach Prolog. There are [resources available][4] for that. We will demonstrate how simple it is to solve a puzzle solely by describing the solution. After that it is up to the reader how far this idea will take them.

To proceed, you should have a basic understanding of Python. Installation of Prolog and the Python-Prolog bridge is accomplished using this command:

dnf install pl python3-pyswip

Our exploration uses [SWI-Prolog][5], an actively developed Prolog which has the Fedora package name “pl”. The Python/SWI-Prolog bridge is [pyswip][6].

If you are a bold adventurer you are welcome to follow me exploring the world of declarative programming.

### Puzzle

The example problem for our exploration will be a puzzle similar to what you may have seen before.

**How many triangles are there?**

![][7]

### Getting started

Get started by opening a fresh text file with your favorite text editor. Copy all three text blocks in the sections below (Input, Process and Output) together into one file.

#### Input

This section sets up access to the Prolog interface and defines data for the problem. This is a simple case so it is fastest to write the data lines by hand. In larger problems you may get your input data from a file or from a database.

```
#!/usr/bin/python

from pyswip import Prolog

prolog = Prolog()
prolog.assertz("line([a, e, k])")
prolog.assertz("line([a, d, f, j])")
prolog.assertz("line([a, c, g, i])")
prolog.assertz("line([a, b, h])")
prolog.assertz("line([b, c, d, e])")
prolog.assertz("line([e, f, g, h])")
prolog.assertz("line([h, i, j, k])")
```

  * The first line is the UNIX way to tell that this text file is a Python program.
Don’t forget to make your file executable by using _chmod +x yourfile.py_ .
  * The second line imports a Python module which is doing the Python/Prolog bridge.
  * The third line makes a Prolog instance available inside Python.
  * Next lines are puzzle related. They describe the picture you see above.
Single **small** letters stand for concrete points.
_[a,e,k]_ is the Prolog way to describe a list of three points.
_line()_ declares that it is true that the list inside parentheses is a line .



The idea is to let Python do the work and to feed Prolog.

#### “Process”

This section title is quoted because nothing is actually processed here. This is simply the description (declaration) of the solution.

There is no single variable which gets a new value. Technically the processing is done in the section titled Output below where you find the command _prolog.query()_.

```
prolog.assertz("""
triangle(A, B, C) :-
  line(L1),
  line(L2),
  line(L3),
  L1 \= L2,
  member(A, L1),
  member(B, L1),
  member(A, L2),
  member(C, L2),
  member(B, L3),
  member(C, L3),
  A @< B,
  B @< C""")
```

First of all: All capital letters and strings starting with a capital letter are Prolog variables!

The statements here are the description of what a triangle is and you can read this like:

  * **If** all lines after _“:-“_ are true, **then** _triangle(A, B, C)_ is a triangle
  * There must exist three lines (L1 to L3).
  * Two lines must be different. “\_=_” means not equal in Prolog. We do not want to count a triangle where all three points are on the same line! So we check if at least two different lines are used.
  * _member()_ is a Prolog predicate which is true if the first argument is inside the second argument which must be a list. In sum these six lines express that the three points must be pairwise on different lines.
  * The last two lines are only true if the three points are in alphabetical order. (“_@&lt;_” compares terms in Prolog.) This is necessary, otherwise [a, h, k] and [a, k, h] would count as two triangles. Also, the case where a triangle contains the same point two or even three times is excluded by these final two lines.



As you can see, it is often not that obvious what defines a triangle. But for a computed approach you must be rather strict and rigorous.

#### Output

After the hard work in the process chapter the rest is easy. Just have Python ask Prolog to search for triangles and count them all.

```
total = 0
for result in prolog.query("triangle(A, B, C)"):
  print(result)
  total += 1
print("There are", total, "triangles.")
```

Run the program using this command in the directory containing _yourfile.py_ :

```
./yourfile.py
```

The output shows the listing of each triangle found and the final count.

```
{'A': 'a', 'B': 'e', 'C': 'f'}
{'A': 'a', 'B': 'e', 'C': 'g'}
{'A': 'a', 'B': 'e', 'C': 'h'}
{'A': 'a', 'B': 'd', 'C': 'e'}
{'A': 'a', 'B': 'j', 'C': 'k'}
{'A': 'a', 'B': 'f', 'C': 'g'}
{'A': 'a', 'B': 'f', 'C': 'h'}
{'A': 'a', 'B': 'c', 'C': 'e'}
{'A': 'a', 'B': 'i', 'C': 'k'}
{'A': 'a', 'B': 'c', 'C': 'd'}
{'A': 'a', 'B': 'i', 'C': 'j'}
{'A': 'a', 'B': 'g', 'C': 'h'}
{'A': 'a', 'B': 'b', 'C': 'e'}
{'A': 'a', 'B': 'h', 'C': 'k'}
{'A': 'a', 'B': 'b', 'C': 'd'}
{'A': 'a', 'B': 'h', 'C': 'j'}
{'A': 'a', 'B': 'b', 'C': 'c'}
{'A': 'a', 'B': 'h', 'C': 'i'}
{'A': 'd', 'B': 'e', 'C': 'f'}
{'A': 'c', 'B': 'e', 'C': 'g'}
{'A': 'b', 'B': 'e', 'C': 'h'}
{'A': 'e', 'B': 'h', 'C': 'k'}
{'A': 'f', 'B': 'h', 'C': 'j'}
{'A': 'g', 'B': 'h', 'C': 'i'}
There are 24 triangles.
```

There are certainly more elegant ways to display this output but the point is:
**Python should do the output handling for Prolog.**

If you are a star programmer you can make the output look like this:

```
***************************
* There are 24 triangles. *
***************************
```

### Conclusion

Splitting a programming task between Python and Prolog makes it easy to keep the Prolog part pure and monotonic, which is good for logic reasoning. It is also easy to make the input and output handling with Python.

Be aware that Prolog is a bit more complicated and can do much more than what I explained here. You can find a really good and modern introduction here: [The Power of Prolog][4].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/exploring-the-world-of-declarative-programming/

作者：[pampelmuse][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pampelmuse/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/explore_declarative-816x345.jpg
[2]: https://unsplash.com/@stefanbc?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/star-trek?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://www.metalevel.at/prolog
[5]: https://www.swi-prolog.org/
[6]: https://github.com/yuce/pyswip
[7]: https://fedoramagazine.org/wp-content/uploads/2021/04/triangle2.png
