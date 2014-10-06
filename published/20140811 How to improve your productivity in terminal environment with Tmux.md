如何使用Tmux提高终端环境下的效率
===

鼠标的发明是了不起的创新，它让电脑更加接近普通人。但从程序员和系统管理员的角度，使用电脑工作时，手一旦离开键盘，就会有些分心。

作为一名系统管理员，我大量的工作都需要在终端环境下。打开很多标签，然后在多个终端之间切换窗口会让我慢下来。尤其是当我的服务器出问题的时候，我不能浪费任何时间！

![](https://farm6.staticflickr.com/5563/14853747084_e14cf18e8f_z.jpg)

[Tmux][1]是我日常工作必要的工具之一。我可以借助Tmux构建出复杂的开发环境，同时还可以在一旁进行SSH远程连接。我可以开出很多窗口，将其拆分成很多面板，接管和分离会话等等。掌握了Tmux之后，你就可以扔掉鼠标了（只是个玩笑:D）。

Tmux（"Terminal Multiplexer"的简称）可以让我们在单个屏幕的灵活布局下开出很多终端，我们就可以协作地使用它们。举个例子，在一个面板中，我们用Vim修改一些配置文件，在另一个面板，我们使用`irssi`聊天，而在其余的面板，可以跟踪一些日志。然后，我们还可以打开新的窗口来升级系统，再开一个新窗口来进行服务器的ssh连接。在这些窗口面板间浏览切换和创建它们一样简单。它的高度可配置和可定制的，让其成为你心中的延伸

### 在Linux/OSX下安装Tmux ###

你可以通过编译软件源或者通过系统包管理器的方式安装，我建议使用包管理器，这样比编译更快更简单

#### OSX: ####

	# sudo brew install tmux
	# sudo port install tmux

#### Debian/Ubuntu: ####

	# sudo apt-get install tmux

####RHEL/CentOS/Fedora(RHEL/CentOS 要求 [EPEL repo][2]):####

	$ sudo yum install tmux

####Archlinux:####

	$ sudo pacman -S tmux

### 使用不同会话工作 ###

使用Tmux的最好方式是使用会话的方式，这样你就可以以你想要的方式，将任务和应用组织到不同的会话中。如果你想改变一个会话，会话里面的任何工作都无须停止或者杀掉。让我们来看看这是怎么工作的。

让我们开始一个叫做"session"的会话，并且运行top命令

	$ tmux new -s new session
	$ top

然后输入**CTRL-b d**从此会话脱离，想要重新连接此会话，需输入：

	$ tmux attach-session -t session

之后你会看到top操作仍然运行在重新连接的会话上。

一些管理sessions的命令：

	$ tmux list-session
	$ tmux new-session <会话名>
	$ tmux attach-session -t <会话名>
	$ tmux rename-session -t <会话名>
	$ tmux choose-session -t <会话名>
	$ tmux kill-session -t <会话名>

### 使用不同的窗口工作

很多情况下，你需要在一个会话中运行多个命令，执行多个任务。我们可以在一个会话的多个窗口里组织他们。在现代的GUI终端（比如 iTerm或者Konsole），一个窗口被视为一个标签。在会话中配置了我们默认的环境之后，我们就能够在一个会话中创建许多我们需要的窗口。窗口就像运行在会话中的应用程序，当我们脱离当前会话的时候，它仍在持续，让我们来看一个例子：

	$ tmux new -s my_session

![](https://farm6.staticflickr.com/5583/14853747014_442b3742fa_z.jpg)

按下**CTRL-b c**

这将会创建一个新的窗口，然后屏幕的光标移向它。现在你就可以在新窗口下运行你的新应用。你可以修改你当前窗口的名字。在目前的例子里，我运行的top程序，所以top就是该窗口的名字

如果你想要重命名，只需要按下：

**CTRL-b**

状态条将会改变，这时你将可以重命名当前的窗口

![](https://farm6.staticflickr.com/5579/14855868482_d52516a357_z.jpg)

一旦在一个会话中创建多个窗口，我们需要在这些窗口间移动的办法。窗口像数组一样组织在一起，从0开始用数字标记每个窗口，想要快速跳转到其余窗口：

**CTRL-b <窗口号>**

如果我们给窗口起了名字，我们可以使用下面的命令找到它们：

**CTRL-b f**

也可以列出所有窗口：

**CTRL-b w**

按照顺序切换到不同的窗口：

**CTRL-b n**（到达下一个窗口）
**CTRL-b p**（到达上一个窗口）

想要离开一个窗口，可以输入 exit 或者：

**CTRL-b &**

关闭窗口之前，你需要确认一下。

### 把窗口分成许多面板

有时候你在编辑器工作的同时，需要查看日志文件。在编辑的同时追踪日志真的很有帮助。Tmux可以让我们把窗口分成许多面板。举个例子，我们可以创建一个控制台监测我们的服务器，同时用编辑器构造复杂的开发环境，这样就能同时进行编译和调试了。

让我们创建另一个Tmux会话，让其以面板的方式工作。首先，如果我们在某个会话中，那就从Tmux会话中脱离出来：

**CTRL-b d**

开始一个叫做"panes"的新会话：

	$ tmux new -s panes

你可以水平或者竖直分割一个窗口，水平分割输入：

**CRTL-b "**

现在你就拥有两个面板，现在我们竖直分割：

**CRTL-b %**

又增加了两个：

![](https://farm4.staticflickr.com/3881/14669677417_bc1bdce255_z.jpg)

在他们之间移动：

**CTRL-b <光标键>**

### 结论

我希望这篇教程能对你有作用。此外，像[Tmuxinator][3] 或者 [Tmuxifier][4]这样的工具，可以简化Tmux会话，窗口和面板的创建及加载，你可以很容易就配置Tmux。如果你没有使用过这些，尝试一下吧！

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/improve-productivity-terminal-environment-tmux.html

作者：[Christopher Valerio][a]
译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/valerio
[1]:http://tmux.sourceforge.net/
[2]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
[3]:https://github.com/tmuxinator/tmuxinator
[4]:https://github.com/jimeh/tmuxifier



