Linux上有哪些比较好的C/C++ IDE？
================================================================================
"一个真正的程序员是不用IDE（译者注：集成开发环境）的，他们都是用带着某某插件的文本编辑器来写代码。"我们总能在某些地方听到此类观点。然而，尽管越来越多的人同意这样的观点，但是一个IDE仍然非常有用，它设置简单，使用起来也很方便，因此没有更好办法能像这样来编写一个项目了。所以鉴于这点，在这里我想给大家列一份在linux平台上比较好的C/C++ IDE清单。为什么特地说C/C++呢？因为C语言是我最喜欢的编程语言而且我们总要找个切入点来开始。另外要注意的是，通常有很多种编写C代码的方法，所以为了消减清单的篇幅，我只选择了"真正好用的IDE"，而不是诸如Gedit或Vim这种注入[插件][1]的文本编辑器。并不是说这些编辑器在任何情况下都不好，只是如果我将文本编辑器包含进去那这份清单就将永无止境了。

### 1. Code::Blocks ###

![](https://farm8.staticflickr.com/7520/16089880989_10173db27b_c.jpg)

用我个人的最爱来开篇，[Code::Blocks][2]是一款简单快速的专有C/C++ IDE。就像任何一款强大的IDE一样, 它集成了语法高亮、书签功能、自动补全功能、项目管理和一个调试器。它闪耀的地方在于它简单的插件系统，里面添加了不可缺少的工具，像Valgrind和CppCheck，还有不太重要的比如像俄罗斯方块这样的小游戏。但是我特别喜欢它的理由是它连贯方便的快捷键设定和大量的却感受不到受压迫的选项设置。

### 2. Eclipse ###

![](https://farm8.staticflickr.com/7522/16276001255_66235a0a69_c.jpg)

我知道我只说"真正好用的IDE"而不是带着插件的文本编辑器，但是，[Eclipse][3]的确是一款"真正好用的IDE"，只是Eclipse需要一些[plugin][4]（或经过一些改装）来编写C程序，所以严格来说我无法反驳我自己。而且，做一份IDE清单不提到Eclipse这个“巨人”是不可能的事情。无论喜欢它与否，Eclipse仍然是一款强大的Java编程工具。这里要感谢[CDT 项目][5]，让Eclipse编写C程序变得可能。你同样可以体验到Eclipse的强大功能包括它的一些传统功能特点比如自动补全、代码大纲、代码生成器和先进的重构功能。照我话说，它的不足之处在于它不如Code::Blocks那么轻量级，它仍然很臃肿，要花费很多时间去载入。但是如果你的电脑可以驾驭它，或者你是个忠实的Eclipse粉，那么它一定是你的不二选择。

### 3. Geany ###

![](https://farm9.staticflickr.com/8573/16088461968_c6a6c9e49a_c.jpg)

牺牲了很多特色功能但是增加了很多灵活性，[Geany][6] is at the opposite of Eclipse. But what it lacks (like a debugger for example), Geany makes it up with nice little features: a space for note taking, creation from template, code outline, customizable shortcuts, and plugins management. Geany is still closer to an extensive text editor than an IDE here. However I keep it in the list for its lightness and its well designed interface.

### 4. MonoDevelop ###

![](https://farm8.staticflickr.com/7515/16275175052_61487480ce_c.jpg)

Another monster to add to the list, [MonoDevelop][7] has a very unique feel derived from its look and interface. I personally love its project management and its integrated version control system. The plugin system is also pretty amazing. But for some reason, all the options and the support for all kind of programming languages make it feel a bit overwhelming to me. It remains a great tool that I used many times in the past, but just not my number one when dealing with "simplistic" C. 

### 5. Anjuta ###

![](https://farm8.staticflickr.com/7514/16088462018_7ee6e5b433_c.jpg)

With a very strong "GNOME feeling" attached to it, [Anjuta][8]'s appearance is a hit or miss. I tend to see it as an advanced version of Geany with a debugger included, but the interface is actually a lot more elaborate. I do enjoy the tab system to switch between the project, folders, and code outline view. I would have liked maybe a bit more shortcuts to move around in a file. However, it is a good tool, and offers outstanding compilation and build options, which can support the most specific needs.

### 6. Komodo Edit ###

![](https://farm8.staticflickr.com/7502/16088462028_81d1114c84_c.jpg)

I was not very familiar with [Komodo Edit][9], but after trying it a few days, it surprised me with many many good things. First, the tab-based navigation is always appreciable. Then the fancy looking code outline reminds me a lot of Sublime Text. Furthermore, the macro system and the file comparator make Komodo Edit very practical. Its plugin library makes it almost perfect. "Almost" because I do not find the shortcuts as nice as in other IDEs. Also, I would enjoy more specific C/C++ tools, and this is typically the flaw of general IDEs. Yet, very enjoyable software.

### 7. NetBeans ###

![](https://farm8.staticflickr.com/7569/16089881229_98beb0fce3_c.jpg)

Just like Eclipse, impossible to avoid this beast. With navigation via tabs, project management, code outline, change history tracking, and a plethora of tools, [NetBeans][10] might be the most complete IDE out there. I could list for half a page all of its amazing features. But that will tip you off too easily about its main disadvantage, it might be too big. As great as it is, I prefer plugin based software because I doubt that anyone will need both Git and Mercurial integration for the same project. Call me crazy. But if you have the patience to master all of its options, you will be pretty much become the master of IDEs everywhere.

### 8. KDevelop ###

![](https://farm8.staticflickr.com/7519/15653583824_e412f2ab1f_c.jpg)

For all KDE fans out there, [KDevelop][11] might be the answer to your prayers. With a lot of configuration options, KDevelop is yours if you manage to seize it. Call me superficial but I never really got past the interface. But it's too bad for me as the editor itself packs quite a punch with a lot of navigation options and customizable shortcuts. The debugger is also very advanced and will take a bit of practice to master. However, this patience will be rewarded with this very flexible IDE's full power. And it gets special credits for its amazing embedded documentation.

### 9. CodeLite ###

![](https://farm9.staticflickr.com/8594/16250066446_b5f654e63f_c.jpg)

Finally, last for not least, [CodeLite][12] shows that you can take a traditional formula and still get something with its own feeling attached to it. If the interface really reminded me of Code::Blocks and Anjuta at first, I was just blown away by the extensive plugin library. Whether you want to diff a file, insert a copyright block, define an abbreviation, or push your work on Git, there is a plugin for you. If I had to nitpick, I would say that it lacks a few navigation shortcuts for my taste, but that's really it. 

最后，我希望that this list had you discover new IDEs for coding in your favorite language. While Code::Blocks remains my favorite, it has some serious challengers. Also we are far from covering all the ways to code in C/C++ using an IDE on Linux. So if you have another one to propose, let us know in the comments. Also if you would like me to cover IDEs for a different language next, also let us know in the comment section.

--------------------------------------------------------------------------------

via: http://xmodulo.com/good-ide-for-c-cpp-linux.html

作者：[Adrien Brochard][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://xmodulo.com/turn-vim-full-fledged-ide.html
[2]:http://www.codeblocks.org/
[3]:https://eclipse.org/
[4]:http://xmodulo.com/how-to-set-up-c-cpp-development-environment-in-eclipse.html
[5]:https://eclipse.org/cdt/
[6]:http://www.geany.org/
[7]:http://www.monodevelop.com/
[8]:http://anjuta.org/
[9]:http://komodoide.com/komodo-edit/
[10]:https://netbeans.org/
[11]:https://www.kdevelop.org/
[12]:http://codelite.org/