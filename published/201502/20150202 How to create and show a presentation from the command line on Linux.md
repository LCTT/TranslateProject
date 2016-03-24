如何在Linux命令行中创建以及展示演示稿
================================================================================
你在准备一场演讲的时候，脑海可能会先被图文并茂、形象华丽的演示图稿所占据。诚然，没有人会否认一份生动形象的演讲稿所带来的积极作用。然而，并非所有的演讲都需要TED Talk的质量。更多时候，演讲稿只为传达特定的信息。 而这个，使用文本信息足以完成。在这种情况下，你的时间可以更好的花在信息的搜集和核实上面，而不是在谷歌图片搜索（Google Image）上寻找好看的图片。

在Linux的世界里，有几个不同的方式供你选择来做演讲。比如带有大量多媒体展示、视觉冲击效果极佳的[Impress.js][1]，专为LaTex用户提供的Beamer，等等。而如果你苦于寻找一种简单的方式来创建并且展示文本演示稿，[mdp][2] 就能帮你实现。

### 什么是Mdp？ ###

mdp是Linux下一款基于ncurses的命令行演示工具。我喜欢mdp在于它对[markdown][3]的支持，使得我很容易以熟悉的markdown格式来创建幻灯片。自然，它还可以很轻松地用HTML格式来发布幻灯片。另一个好处是它支持UTF-8字符编码，这让非英语字符（如希腊或西里尔字母）的展示也变得很方便。

### 在Linux中安装Mdp ###

mdp的依赖需求很少（如 ncursesw），这使得安装非常简单。

#### Debian、Ubuntu或者它们的衍生版 ####

    $ sudo apt-get install git gcc make libncursesw5-dev
    $ git clone https://github.com/visit1985/mdp.git
    $ cd mdp
    $ make
    $ sudo make install 

#### Fedora或者CentOS/RHEL ####

    $ sudo yum install git gcc make ncurses-devel
    $ git clone https://github.com/visit1985/mdp.git
    $ cd mdp
    $ make
    $ sudo make install 

#### Arch Linux ####

Arch Linux可以通过[AUR][4]轻松安装mdp。

### 在命令行中创建演示稿 ###

安装mdp完毕，你可以使用你喜欢的文本编辑器来轻松创建一个演示稿。如果你熟悉markdown的话，很快就可以驾驭mdp。而对于那些不熟悉markdown的人来说，学习mdp最好的方式就是从一个实例着手。

这里有一份6页的演示稿样本可供参考。

	%title: Sample Presentation made with mdp (Xmodulo.com)
	%author: Dan Nanni
	%date: 2015-01-28
	 
	-> This is a slide title <-
	=========
	 
	-> mdp is a command-line based presentation tool with markdown support. <-
	 
	*_Features_*
	 
	* Multi-level headers
	* Code block formatting
	* Nested quotes
	* Nested list
	* Text highlight and underline
	* Citation
	* UTF-8 special characters
	 
	-------------------------------------------------
	 
	-> # Example of nested list <-
	 
	This is an example of multi-level headers and a nested list.
	 
	# first-level title
	 
	second-level
	------------
	 
	- *item 1*
	    - sub-item 1
	        - sub-sub-item 1
	        - sub-sub-item 2
	        - sub-sub-item 3
	    - sub-item 2
	 
	-------------------------------------------------
	 
	-> # Example of code block formatting <-
	 
	This example shows how to format a code snippet.
	 
	    1  /* Hello World program */
	    2
	    3  #include <stdio.h>
	    4
	    5  int main()
	    6  {
	    7     printf("Hello World");
	    8     return 0;
	    9  }
	 
	This example shows inline code: `sudo reboot`
	 
	-------------------------------------------------
	 
	-> # Example of nested quotes <-
	 
	This is an example of nested quotes.
	 
	# three-level nested quotes
	 
	> This is the first-level quote.
	>> This is the second-level quote
	>> and continues.
	>>> *This is the third-level quote, and so on.*
	 
	-------------------------------------------------
	 
	-> # Example of citations <-
	 
	This example shows how to place a citation inside a presentation.
	 
	This tutorial is published at [Xmodulo](http://xmodulo.com)
	 
	You are welcome to connect with me at [LinkedIn](http://www.linkedin.com/in/xmodulo)
	 
	Pretty cool, huh?
	 
	-------------------------------------------------
	 
	-> # Example of UTF-8 special characters <-
	 
	This example shows UTF-8 special characters.
	 
	ae = ä, oe = ö, ue = ü, ss = ß
	alpha = ?, beta = ?, upsilon = ?, phi = ?
	Omega = ?, Delta = ?, Sigma = ?
	 
	???????????
	?rectangle?
	???????????

### 在命令行中展示演示稿 ###

当你把以上代码保存为slide.md的文本文件后，你可以运行以下命令来展示演示稿：

     $ mdp slide.md 

你可以通过按键 回车/空格/下翻页/向下光标键 (下一张幻灯)、回退/上翻页/向上光标键 (上一张幻灯)、Home (幻灯首页)、 End (幻灯末页)或者 数字N (第N页幻灯)来操作你的演示稿。

演示稿的标题将在每页幻灯的顶部展示，而你的名字和页码则会出现在幻灯的底部。

![](https://farm9.staticflickr.com/8637/16392457702_ec732d0094_c.jpg)

这是嵌套列表和多层次标题的实例效果。

![](https://farm9.staticflickr.com/8567/16367397606_29be7df633_c.jpg)

这是代码片段和内联代码的实例效果。

![](https://farm9.staticflickr.com/8682/15770926144_0f982b0863_b.jpg)

这是嵌套引用的实例效果。

![](https://farm9.staticflickr.com/8587/16393383115_0865c8b89b_c.jpg)

这是放置引文的实例效果。

![](https://farm8.staticflickr.com/7409/16392457712_ed36c14bc2_c.jpg)

这是UTF-8编码特殊字符支持的实例效果。

![](https://farm9.staticflickr.com/8648/16205981560_7fa3debc75_c.jpg)

### 总结 ###

在本教程中，我演示了在命令行中如何使用mdp来创建并且展示一个演示稿。mdp的markdown兼容性让我们省去了学习其它新格式的麻烦，这相对于另一种名为[tpp][5]的演示工具来说是一个优势。拘于mdp的局限性，它可能无法作为你的默认演示工具。但是，值得肯定的是它一定能在某个场合下派上用场。你觉得mdp怎么样呢？你还喜欢其它的什么东西吗？

--------------------------------------------------------------------------------

via: http://xmodulo.com/presentation-command-line-linux.html

作者：[Dan Nanni][a]
译者：[soooogreen](https://github.com/soooogreen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://bartaz.github.io/impress.js/
[2]:https://github.com/visit1985/mdp
[3]:http://daringfireball.net/projects/markdown/
[4]:https://aur.archlinux.org/packages/mdp-git/
[5]:http://www.ngolde.de/tpp.html