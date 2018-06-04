Qalculate! – The Best Calculator Application in The Entire Universe
======
I have been a GNU-Linux user and a [Debian][1] user for more than a decade. As I started using the desktop more and more, it seemed to me that apart from few web-based services most of my needs were being met with [desktop applications][2] within Debian itself.

One of such applications was the need for me to calculate between different measurements of units. While there are and were many web-services which can do the same, I wanted something which could do all this and more on my desktop for both privacy reasons as well as not having to hunt for a web service for doing one thing or the other. My search ended when I found Qalculate!.

### Qalculate! The most versatile calculator application

![Qalculator is the best calculator app][3]

This is what aptitude says about [Qalculate!][4] and I cannot put it in better terms:

> Powerful and easy to use desktop calculator – GTK+ version
>
> Qalculate! is small and simple to use but with much power and versatility underneath. Features include customizable functions, units, arbitrary precision, plotting, and a graphical interface that uses a one-line fault-tolerant expression entry (although it supports optional traditional buttons).

It also did have a KDE interface as well as in its previous avatar, but at least in Debian testing, it just shows only the GTK+ version which can be seen from the github [repo][5] as well.

Needless to say that Qalculate! is available in Debian repository and hence can easily be installed [using apt command][6] or through software center in Debian based distributions like Ubuntu. It is also availale for Windows and macOS.

#### Features of Qalculate!

Now while it would be particularly long to go through the whole list of functionality it allows – allow me to list some of the functionality to be followed by a few screenshots of just a couple of functionalities that Qalculate! provides. The idea is basically to familiarize you with a couple of basic methods and then leave it up to you to enjoy exploring what all Qalculate! can do.

  * Algebra
  * Calculus
  * Combinatorics
  * Complex_Numbers
  * Data_Sets
  * Date_&_Time
  * Economics
  * Exponents_&_Logarithms
  * Geometry
  * Logical
  * Matrices_&_Vectors
  * Miscellaneous
  * Number_Theory
  * Statistics
  * Trigonometry



#### Using Qalculate!

Using Qalculate! is not complicated. You can even write in the simple natural language. However, I recommend [reading the manual][7] to utilize the full potential of Qalculate!

![qalculate byte to gibibyte conversion ][8]

![conversion from celcius degrees to fahreneit][9]

#### qalc is the command line version of Qalculate!

You can achieve the same results as Qalculate! with its command-line brethren qalc
```
$ qalc 62499836 byte to gibibyte
62499836 * byte = approx. 0.058207508 gibibyte

$ qalc 40 degree celsius to fahrenheit
(40 * degree) * celsius = 104 deg*oF

```

I shared the command-line interface so that people who don’t like GUI interfaces and prefer command-line (CLI) or have headless nodes (no GUI) could also use qalculate, pretty common in server environments.

If you want to use it in scripts, I guess libqalculate would be the way to go and seeing how qalculate-gtk, qalc depend on it seems it should be good enough.

Just to share, you could also explore how to use plotting of series data but that and other uses will leave to you. Don’t forget to check the /usr/share/doc/qalculate/index.html to see all the different functionalities that Qalculate! has.

Note:- Do note that though Debian prefers [gnuplot][10] to showcase the pretty graphs that can come out of it.

#### Bonus Tip: You can thank the developer via command line in Debian

If you use Debian and like any package, you can quickly thank the Debian Developer or maintainer maintaining the said package using:
```
reportbug --kudos $PACKAGENAME

```

Since I liked QaIculate!, I would like to give a big shout-out to the Debian developer and maintainer Vincent Legout for the fantastic work he has done.
```
reportbug --kudos qalculate

```

I would also suggest reading my detailed article on using reportbug tool for [bug reporting in Debian][11].

#### The opinion of a Polymer Chemist on Qalculate!

Through my fellow author [Philip Prado][12], we contacted a Mr. Timothy Meyers, currently a student working in a polymer lab as a Polymer Chemist.

His professional opinion on Qaclulate! is –

> This looks like almost any scientist to use as any type of data calculations statistics could use this program issue would be do you know the commands and such to make it function
>
> I feel like there’s some Physics constants that are missing but off the top of my head I can’t think of what they are but I feel like there’s not very many [fluid dynamics][13] stuff in there and also some different like [light absorption][14] coefficients for different compounds but that’s just a chemist in me I don’t know if those are super necessary. [Free energy][15] might be one

In the end, I just want to share this is a mere introduction to what Qalculate! can do and is limited by what you want to get done and your imagination. I hope you like Qalculate!

--------------------------------------------------------------------------------

via: https://itsfoss.com/qalculate/

作者：[Shirish][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/shirish/
[1]:https://www.debian.org/
[2]:https://itsfoss.com/essential-linux-applications/
[3]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/qalculate-app-featured-1-800x450.jpeg
[4]:https://qalculate.github.io/
[5]:https://github.com/Qalculate
[6]:https://itsfoss.com/apt-command-guide/
[7]:https://qalculate.github.io/manual/index.html
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/04/qalculate-byte-conversion.png
[9]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/04/qalculate-gtk-weather-conversion.png
[10]:http://www.gnuplot.info/
[11]:https://itsfoss.com/bug-report-debian/
[12]:https://itsfoss.com/author/phillip/
[13]:https://en.wikipedia.org/wiki/Fluid_dynamics
[14]:https://en.wikipedia.org/wiki/Absorption_(electromagnetic_radiation)
[15]:https://en.wikipedia.org/wiki/Gibbs_free_energy
