FSSlc translating

What is a good IDE for R on Linux
================================================================================
Some time ago, I covered some of the [best IDEs for C/C++][1] on Linux. Obviously C and C++ are not the only programming languages out there, and it is time to turn to something a bit more specific.

If you have ever done some statistics, it is possible that you have encountered the [language R][2]. If you have not, I really recommend this open source programming language which is tailored for statistics and data mining. Coming from a coding background, you might be thrown off a bit by the syntax, but hopefully you will get seduced by the speed of its vector operations. In short, try it. And to do so, what better way to start with an IDE? R being a cross platform language, there are a bunch of good IDEs which make data analysis in R far more pleasurable. If you are very attached to a particular editor, there are also some very good plugins to turn that editor into a fully-fledged R IDE.

Here is a list of five good IDEs for R language in Linux environment.

### 1. RStudio ###

![](https://c1.staticflickr.com/1/603/22093054381_431383ab60_c.jpg)

Let’s start hard with maybe one of the most popular R IDEs out there: [RStudio][3]. In addition to common IDE features like syntax highlighting and code completion, RStudio stands out for its integration of R documentation, its powerful debugger and its multiple views system. If you start with R, I can only recommend RStudio as the R console on the side is perfect for testing your code in real time, and the object explorer will help you understand what kind of data you are dealing with. Finally, what really conquered me was the integration of the plots visualiser, making it easy to export your graphs as images. On the downside, RStudio lacks the shortcuts and the advanced settings to make it a perfect IDE. Still, with a free version under AGPL license, Linux users have no excuses not to give this IDE a try.

### 2. Emacs with ESS ###

![](https://c2.staticflickr.com/6/5824/22056857776_a14a4e7e1b_c.jpg)

In my last post about IDEs, some people were disappointed by the absence of Emacs in my list. My main reason for that is that Emacs is kind of the wild card of IDE: you could place it on any list for any languages. But things are different for [R with the ESS plugin][4]. Emacs Speaks Statistics (ESS) is an amazing plugin which completely changes the way you use the Emacs editor and really fits the needs of R coders. A bit like RStudio which has multiple views, Emacs with ESS displays presents two panels: one with the code and one with an R console, making it easy to test your code in real time and explore the objects. But ESS's real strength is its seamless integration with other Emacs plugins you might have installed and its advanced configuration options. In short, if you like your Emacs shortcuts, you will like to be able to use them in an environment that makes sense for R development. For full disclosure, however, I have heard of and experienced some efficiency issues when dealing with a lot of data in ESS. Nothing too major to be a problem, but just enough have me prefer RStudio.

### 3. Vim with Vim-R-plugin ###

![](https://c1.staticflickr.com/1/680/22056923916_abe3531bb4_b.jpg)

Because I do not want to discriminate after talking about Emacs, I also tried the equivalent for Vim: the [Vim-R-plugin][5]. Using the terminal tool called tmux, this plugin makes it possible to have an R console open and code at the same time. But most importantly, it brings syntax highlighting and omni-completion for R objects to Vim. You can also easily access R documentation and browse objects. But once again, the strength comes from its extensive customization capacities and the speed of Vim. If you are tempted by this option, I direct you to the extremely thorough [documentation][6] on installing and setting up your environment. 

### 4. Gedit with RGedit ###

![](https://c1.staticflickr.com/1/761/22056923956_1413f60b42_c.jpg)

If neither Emacs or Vim is your cup of tea, and what you like is your default Gnome editor, then [RGedit][7] is made for you: a plugin to code in R from Gedit. Gedit is known to be more powerful than what it looks. With a very large library of plugins, it is possible to do a lot with it. And RGedit is precisely the plugin you need to code in R from Gedit. It comes with the classic syntax highlighting and integration of the R console at the bottom of the screen, but also a bunch of unique features like multiple profiles, code folding, file explorer, and even a GUI wizard to generate code from snippets. Despite my indifference towards Gedit, I have to admit that these features go beyond the basic plugin functionality and really make a difference when you spend a lot of time analyzing data. The only shadow is that the last update is from 2013. I really hope that this project can pick up again.

### 5. RKWard ###

![](https://c2.staticflickr.com/6/5643/21896132829_2ea8f3a320_c.jpg)

Finally, last but not least, [RKWard][8] is an R IDE made for KDE environments. What I love the most about it is its name. But honestly, its package management system and spreadsheet-like data editor come in close second. In addition to that, it includes an easy system for plotting and importing data, and can be extended by plugins. If you are not a fan of the KDE feel, you might be a bit uncomfortable, but if you are, I would really recommend checking it out.

To conclude, whether you are new to R or not, these IDEs might be useful to you. It does not matter if you prefer something that stands for itself, or a plugin for your favorite editor, I am sure that you will appreciate one of the features these software provide. I am also sure I missed a lot of good IDEs for R, which deserve to be on this list. So since you wrote a lot of very good comments for the post on the IDEs for C/C++, I invite you to do the same here and share your knowledge.

What do you feel is a good IDE for R on Linux? Please let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/good-ide-for-r-on-linux.html

作者：[Adrien Brochard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://xmodulo.com/good-ide-for-c-cpp-linux.html
[2]:https://www.r-project.org/
[3]:https://www.rstudio.com/
[4]:http://ess.r-project.org/
[5]:http://www.vim.org/scripts/script.php?script_id=2628
[6]:http://www.lepem.ufc.br/jaa/r-plugin.html
[7]:http://rgedit.sourceforge.net/
[8]:https://rkward.kde.org/
