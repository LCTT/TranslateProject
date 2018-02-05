2 scientific calculators for the Linux desktop
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_OpenData_CityNumbers.png?itok=lC03ce76)

Image by : opensource.com

Every Linux desktop environment comes with at least a simple desktop calculator, but most of those simple calculators are just that: a simple tool for simple calculations.

Fortunately, there are exceptions; programs that go far beyond square roots and a couple of trigonometric functions, yet are still easy to use. Here are two powerful calculator tools for Linux, plus a couple of bonus options.

### SpeedCrunch

[SpeedCrunch][1] is a high-precision scientific calculator with a simple Qt5 graphical interface and strong focus on the keyboard.

![SpeedCrunch graphical interface][3]


SpeedCrunch at work

It supports working with units and comes loaded with all kinds of functions.

For example, by writing:
`2 * 10^6 newton / (meter^2)`

you get:
`= 2000000 pascal`

By default, SpeedCrunch delivers its results in the international unit system, but units can be transformed with the "in" instruction.

For example:
`3*10^8 meter / second in kilo meter / hour`

produces:
`= 1080000000 kilo meter / hour`

With the `F5` key, all results will turn into scientific notation (`1.08e9 kilo meter / hour`), while with `F2` only numbers that are small enough or big enough will change. More options are available on the Configuration menu.

The list of available functions is really impressive. It works on Linux, Windows, and MacOS, and it's licensed under GPLv2; you can access its source code on [Bitbucket][4].

### Qalculate!

[Qalculate!][5] (with the exclamation point) has a long and complex history.

The project offers a powerful library that can be used by other programs (the Plasma desktop can use it to perform calculations from krunner) and a graphical interface built on GTK3. It allows you to work with units, handle physical constants, create graphics, use complex numbers, matrices, and vectors, choose arbitrary precision, and more.


![Qalculate! Interface][7]


Looking for some physical constants on Qalculate!

Its use of units is far more intuitive than SpeedCrunch's and it understands common prefixes without problem. Have you heard of an exapascal pressure? I hadn't (the Sun's core stops at `~26 PPa`), but Qalculate! has no problem understanding the meaning of `1 EPa`. Also, Qalculate! is more flexible with syntax errors, so you don't need to worry about closing all those parentheses: if there is no ambiguity, Qalculate! will give you the right answer.

After a long period on which the project seemed orphaned, it came back to life in 2016 and has been going strong since, with more than 10 versions in just one year. It's licensed under GPLv2 (with source code on [GitHub][8]) and offers versions for Linux and Windows, as well as a MacOS port.

### Bonus calculators

#### ConvertAll

OK, it's not a "calculator," yet this simple application is incredibly useful.

Most unit converters stop at a long list of basic units and a bunch of common combinations, but not [ConvertAll][9]. Trying to convert from astronomical units per year into inches per second? It doesn't matter if it makes sense or not, if you need to transform a unit of any kind, ConvertAll is the tool for you.

Just write the starting unit and the final unit in the corresponding boxes; if the units are compatible, you'll get the transformation without protest.

The main application is written in PyQt5, but there is also an [online version written in JavaScript][10].

#### (wx)Maxima with the units package

Sometimes (OK, many times) a desktop calculator is not enough and you need more raw power.

[Maxima][11] is a computer algebra system (CAS) with which you can do derivatives, integrals, series, equations, eigenvectors and eigenvalues, Taylor series, Laplace and Fourier transformations, as well as numerical calculations with arbitrary precision, graph on two and three dimensions… we could fill several pages just listing its capabilities.

[wxMaxima][12] is a well-designed graphical frontend for Maxima that simplifies the use of many Maxima options without compromising others. On top of the full power of Maxima, wxMaxima allows you to create "notebooks" on which you write comments, keep your graphics with your math, etc. One of the (wx)Maxima combo's most impressive features is that it works with dimension units.

On the prompt, just type:
`load("unit")`

press Shift+Enter, wait a few seconds, and you'll be ready to work.

By default, the unit package works with the basic MKS units, but if you prefer, for instance, to get `N` instead of `kg*m/s2`, you just need to type:
`setunits(N)`

Maxima's help (which is also available from wxMaxima's help menu) will give you more information.

Do you use these programs? Do you know another great desktop calculator for scientists and engineers or another related tool? Tell us about them in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/scientific-calculators-linux

作者：[Ricardo Berlasso][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rgb-es
[1]:http://speedcrunch.org/index.html
[2]:/file/382511
[3]:https://opensource.com/sites/default/files/u128651/speedcrunch.png (SpeedCrunch graphical interface)
[4]:https://bitbucket.org/heldercorreia/speedcrunch
[5]:https://qalculate.github.io/
[6]:/file/382506
[7]:https://opensource.com/sites/default/files/u128651/qalculate-600.png (Qalculate! Interface)
[8]:https://github.com/Qalculate
[9]:http://convertall.bellz.org/
[10]:http://convertall.bellz.org/js/
[11]:http://maxima.sourceforge.net/
[12]:https://andrejv.github.io/wxmaxima/
