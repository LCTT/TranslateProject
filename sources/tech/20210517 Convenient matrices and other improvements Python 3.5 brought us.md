[#]: subject: (Convenient matrices and other improvements Python 3.5 brought us)
[#]: via: (https://opensource.com/article/21/5/python-35-features)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Convenient matrices and other improvements Python 3.5 brought us
======
Explore some of the underutilized but still useful Python features.
![Hacker code matrix][1]

This is the sixth in a series of articles about features that first appeared in a version of Python 3.x. Python 3.5 was first released in 2015, and even though it has been out for a long time, many of the features it introduced are underused and pretty cool. Here are three of them.

### The @ operator

The `@` operator is unique in Python in that there are no objects in the standard library that implement it! It was added for use in mathematical packages that have matrices.

Matrices have two concepts of multiplication; point-wise multiplication is done with the `*` operator. But matrix composition (also considered multiplication) needed its own symbol. It is done using `@`.

For example, composing an "eighth-turn" matrix (rotating the axis by 45 degrees) with itself results in a quarter-turn matrix:


```
import numpy

hrt2 = 2**0.5 / 2
eighth_turn = numpy.array([
    [hrt2, hrt2],
    [-hrt2, hrt2]
])
eighth_turn @ eighth_turn

[/code] [code]

    array([[ 4.26642159e-17,  1.00000000e+00],
           [-1.00000000e+00, -4.26642159e-17]])
```

Floating-point numbers being imprecise, this is harder to see. It is easier to check by subtracting the quarter-turn matrix from the result, summing the squares, and taking the square root.

This is one advantage of the new operator: especially in complex formulas, the code looks more like the underlying math:


```
almost_zero = ((eighth_turn @ eighth_turn) - numpy.array([[0, 1], [-1, 0]]))**2
round(numpy.sum(almost_zero) ** 0.5, 10)

[/code] [code]`    0.0`
```

### Multiple keyword dictionaries in arguments

Python 3.5 made it possible to call functions with multiple keyword-argument dictionaries. This means multiple sources of defaults can "co-operate" with clearer code.

For example, here is a function with a ridiculous amount of keyword arguments:


```
def show_status(
    *,
    the_good=None,
    the_bad=None,
    the_ugly=None,
    fistful=None,
    dollars=None,
    more=None
):
    if the_good:
        print("Good", the_good)
    if the_bad:
        print("Bad", the_bad)
    if the_ugly:
        print("Ugly", the_ugly)
    if fistful:
        print("Fist", fistful)
    if dollars:
        print("Dollars", dollars)
    if more:
        print("More", more)
```

When you call this function in the application, some arguments are hardcoded:


```
defaults = dict(
    the_good="You dig",
    the_bad="I have to have respect",
    the_ugly="Shoot, don't talk",
)
```

More arguments are read from a configuration file:


```
import json

others = json.loads("""
{
"fistful": "Get three coffins ready",
"dollars": "Remember me?",
"more": "It's a small world"
}
""")
```

You can call the function from both sources together without having to construct an intermediate dictionary:


```
`show_status(**defaults, **others)`[/code] [code]

    Good You dig
    Bad I have to have respect
    Ugly Shoot, don't talk
    Fist Get three coffins ready
    Dollars Remember me?
    More It's a small world
```

### os.scandir

The `os.scandir` function is a new way to iterate through directories' contents. It returns a generator that yields rich data about each object. For example, here is a way to print a directory listing with a trailing `/` at the end of directories:


```
for entry in os.scandir(".git"):
    print(entry.name + ("/" if entry.is_dir() else ""))

[/code] [code]

    refs/
    HEAD
    logs/
    index
    branches/
    config
    objects/
    description
    COMMIT_EDITMSG
    info/
    hooks/
```

### Welcome to 2015

Python 3.5 was released over six years ago, but some of the features that first showed up in this release are cool—and underused. Add them to your toolkit if you haven't already.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/python-35-features

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/markus-spiske-iar-matrix-unsplash.jpg?itok=78u_4veR (Hacker code matrix)
