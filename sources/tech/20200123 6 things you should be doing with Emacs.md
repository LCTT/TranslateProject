[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 things you should be doing with Emacs)
[#]: via: (https://opensource.com/article/20/1/emacs-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

6 things you should be doing with Emacs
你应该用Emacs做的6件事
======
Here are six things you may not have realized you could do with Emacs.
下面是您可能没有意识到的Emacs可以做的六件事。
Then, get our new cheat sheet to get the most out of Emacs.
然后，使用我们的新备忘单来充分利用Emacs。
![Text editor on a browser, in blue][1]
[在蓝色浏览器上给编辑发短信][1]

Imagine using Python's IDLE interface to edit text. You would be able to load files into memory, edit them, and save changes. But every action you perform would be defined by a Python function. Making a word all capitals, for instance, calls **upper()**, opening a file calls **open**, and so on. Everything in your text document is a Python object and can be manipulated accordingly. From the user's perspective, it's the same experience as any text editor. For a Python developer, it's a rich Python environment that can be changed and developed with just a few custom functions in a config file.
想象一下使用Python的空闲接口来编辑文本。您可以将文件加载到内存中，编辑它们，并保存更改。但是您执行的每个操作都将由Python函数定义。例如，使一个单词全部大写，调用**upper()**，打开一个文件调用**open**，等等。文本文档中的所有内容都是Python对象，可以相应地进行操作。从用户的角度来看，这与任何文本编辑器的体验都是一样的。对于Python开发人员来说，这是一个丰富的Python环境，只需在配置文件中添加几个自定义函数就可以对其进行更改和开发。

This is what [Emacs][2] does for the 1958 programming language [Lisp][3]. In Emacs, there's no separation between the Lisp engine running the application and the arbitrary text you type into it. To Emacs, everything is Lisp data, so everything can be analyzed and manipulated programmatically.
这就是[Emacs][2]对1958年的编程语言[Lisp][3]所做的。在Emacs中，运行应用程序的Lisp引擎与您输入的任意文本之间没有分离。对于Emacs，一切都是Lisp数据，因此一切都可以通过编程进行分析和操作。

That makes for a powerful user interface (UI). But if you're a casual Emacs user, you may only be scratching the surface of what it can do for you. Here are six things you may not have realized you could do with Emacs.
这就形成了一个强大的用户界面(UI)。但是，如果您是Emacs的普通用户，您可能只了解它能为您做些什么。下面是您可能没有意识到的Emacs可以做的六件事。

## Use Tramp mode for cloud editing
使用流浪汉模式进行克劳德编辑

Emacs has been network-transparent for a lot longer than has been trendy, and today it still provides one of the smoothest remote editor experiences available. The [Tramp mode][4] in Emacs (formerly known as RPC mode) stands for "Transparent Remote (file) Access, Multiple Protocol," which spells out exactly what it offers: easy access to remote files you want to edit over most popular network protocols. The most popular and safest protocol for remote editing these days is [OpenSSH][5], so that's the default.
Emacs实现网络透明的时间要比流行的时间长得多，而且时至今日，它仍然提供最流畅的远程编辑体验。Emacs中的[Tramp模式][4](以前称为RPC模式)代表“透明的远程(文件)访问，多协议”，它详细说明了它提供的功能:通过最流行的网络协议轻松访问您希望编辑的远程文件。目前最流行、最安全的远程编辑协议是[OpenSSH][5]，因此它是默认的。

Tramp is already included in Emacs 22.1 or greater, so to use Tramp, you just open a file in the Tramp syntax. In the **File** menu of Emacs, select **Open File**. When prompted in the mini-buffer at the bottom of the Emacs window, enter the file name using this syntax:
在Emacs 22.1或更高版本中已经包含了Tramp，因此要使用Tramp，只需在Tramp语法中打开一个文件。在Emacs的**File**菜单中，选择**Open File**。当在Emacs窗口底部的小缓冲区中出现提示时，使用以下语法输入文件名:


```
引用----------------------------------------------------
`/ssh:user@example.com:/path/to/file`
```

If you are required to log in interactively, Tramp prompts you for your password. However, Tramp uses OpenSSH directly, so to avoid interactive prompts, you can also add your hostname, username, and SSH key path to your **~/.ssh/config** file. Like Git, Emacs uses your SSH config first and only stops to ask for more information in the event of an error.
如果需要交互式登录，Tramp会提示您输入密码。但是，Tramp直接使用OpenSSH，所以为了避免交互提示，您还可以将您的主机名、用户名和SSH密钥路径添加到您的**~/。ssh / config文件* *。与Git一样，Emacs首先使用SSH配置，只有在出现错误时才会停下来询问更多信息。

Tramp is great for editing files that don't exist on your computer, and the user experience is not noticeably any different from editing a local file. The next time you start to SSH into a server just to launch a Vim or Emacs session, try Tramp instead.
Tramp非常适合编辑计算机上不存在的文件，用户体验与编辑本地文件没有明显的区别。下一次，当您为了启动Vim或Emacs会话而开始SSH到服务器时，请尝试使用Tramp。

## Calendaring
# Calendaring

If you parse text better than you parse graphical interfaces, you'll be happy to know that you can schedule your day (or life) in plain text with Emacs but still get fancy notifications on your mobile device with open source [Org mode][6] viewers.
如果您解析文本比解析图形界面更好，那么您会很高兴地知道，您可以使用Emacs以纯文本方式安排您的一天(或生活)，但仍然可以在您的移动设备上使用开放源码[Org模式][6]查看器获得花哨的通知。

The process takes a little setup to create a convenient way to sync your agenda with your mobile device (I use Git, but you could invoke Bluetooth, KDE Connect, Nextcloud, or your file synchronization tool of choice), and you have to install an Org mode viewer (such as [Orgzly][7]) and a Git client app on your mobile. Once you've got your infrastructure sorted, though, the process is inherently perfectly integrated with your usual (or developing, if you're a new user) Emacs workflow. You can refer to your agenda easily in Emacs, make updates to your schedule, and generally stay on task. Pushing changes to your agenda is reflected on your mobile, so you can stay organized even when Emacs isn't available.
这个过程需要一些设置创建一个方便的方式来移动设备同步你的议程(我使用Git,但你可以调用蓝牙,KDE连接,Nextcloud,或您的文件同步工具的选择),你必须安装一个组织模式查看器(如[Orgzly][7])和一个Git客户对你的移动应用程序。但是，一旦您对基础设施进行了排序，该流程就会与您通常使用的Emacs工作流完美地集成在一起(如果您是新用户，则会进行开发)。您可以在Emacs中方便地查阅您的日程，更新您的日程，并通常停留在任务上。推动您的议程的变化反映在您的移动设备上，因此即使Emacs不可用，您也可以保持组织性。

![][8]

Intrigued? Read my step-by-step guide about [calendaring with Org mode and Git][9].
感兴趣吗?阅读我的关于[使用Org模式和Git进行日历][9]的逐步指南。

## Access the terminal
访问终端

There are [lots of terminal emulators][10] available. Although the Elisp terminal emulator in Emacs isn't the greatest general-purpose one, it's got two notable advantages.
有[许多终端模拟器][10]可用。尽管Emacs中的Elisp终端仿真器不是最强大的通用仿真器，但是它有两个显著的优点。

1. **Opens in an Emacs buffer: **I use Emacs' Elisp shell because it's conveniently located in my Emacs window, which I often run in fullscreen. It's a small but significant advantage to have a terminal just a **Ctrl+x+o** (or C-x o in Emacs notation) away, and it's especially nice to be able to glance over at it for status reports when it's running a lengthy job.
1. 我使用Emacs的Elisp shell，因为它方便地位于我的Emacs窗口，我经常在全屏运行。这是一个小但重要的优势，有一个终端只是**Ctrl+x+o**(或C-x o在Emacs符号)，它是特别好的，能够浏览它的状态报告，当它运行一个漫长的作业。
2. **Easy copying and pasting if no system clipboard is available:** Whether I'm too lazy to move my hand from the keys to the mouse, or I don't have mouse functionality because I'm running Emacs in a remote console, having a terminal in Emacs can sometimes mean a quick transfer of data from my Emacs buffer to Bash.
2. * *简单的复制和粘贴,如果没有可用系统剪贴板:* *是否我太懒惰的关键将我的手从鼠标,或者我没有鼠标功能,因为我在远程控制台运行Emacs,在Emacs有时意味着终端快速传输数据从我的Emacs缓冲Bash。



To try the Emacs terminal, type **Alt**+**x** (**M-x** in Emacs notation), then type **shell**, and press **Return**.
要尝试Emacs终端，输入**Alt**+**x** (Emacs符号中的**M-x**)，然后输入**shell**，然后按**Return**。

## Use Racket mode
使用球拍模式

[Racket][11] is an exciting emerging Lisp dialect with a dynamic programming environment, a GUI toolkit, and a passionate community. The default editor when learning Racket is DrRacket, which has a Definitions panel at the top and an Interactions panel at the bottom. Using this setup, the user writes definitions that affect the Racket runtime. Imagine the old [Logo Turtle][12] program, but with a terminal instead of just a turtle.
[11]是一种激动人心的新兴Lisp语言，拥有动态编程环境、GUI工具包和热情的社区。学习球拍的默认编辑器是dr球拍，它的顶部有一个定义面板，底部有一个交互面板。使用此设置，用户可以编写影响球拍运行时的定义。想象一下旧的[Logo Turtle][12]程序，但是有一个终端而不是一个Turtle。

![Racket-mode][13]
[Racket-mode] [13] !

LGPL sample code by PLT
由PLT提供的LGPL示例代码

Emacs, being based on Lisp, makes a great integrated development environment (IDE) for advanced Racket coders. It doesn't ship with [Racket mode][14] (yet), but you can install Racket mode and several other helper extensions using the Emacs package installer. To install it, press **Alt**+**X** (**M-x** in Emacs notation), type **package-install**, and press **Return**. Then enter the package you want to install (**racket-mode**), and press **Return**.
基于Lisp的Emacs为高级球拍编程人员提供了一个很好的集成开发环境(IDE)。它还没有[球拍模式][14]，但你可以安装球拍模式和其他几个助手扩展使用Emacs包安装程序。要安装它，按**Alt**+**X** (**M-x** Emacs符号)，键入**package-install**，然后按**Return**。然后输入要安装的包(**rac模式**)，按**Return**。

Enter Racket mode with **M-x racket-mode**. If you're new to Racket but not to Lisp or Emacs, start with the excellent [Quick introduction to Racket with pictures][15].
进入球拍模式，使用**M-x球拍模式**。如果你是球拍新手，但不是口齿不清或Emacs，开始优秀[快速介绍球拍与图片][15]。

## Scripting
# # Scripting

You might know that Bash scripts are popular for automating and enhancing your Linux or Unix experience. You may have heard that Python does a pretty good job of that, too. But did you know that Lisp scripts can be run in much the same way? There's sometimes confusion about just how useful Lisp really is because many people are introduced to Lisp through Emacs, so there's the latent impression that the only way to run Lisp in the 21st century is to open an Emacs window. Luckily, that's not the case at all, and Emacs is a great IDE for the tools that enable you to run Lisp scripts as general system executables.
您可能知道，Bash脚本在自动化和增强您的Linux或Unix体验方面很流行。您可能听说过Python在这方面也做得很好。但是你知道Lisp脚本可以用同样的方式运行吗?有时人们会对Lisp到底有多有用感到困惑，因为许多人是通过Emacs来了解Lisp的，因此有一种潜在的印象，即在21世纪运行Lisp的惟一方法是打开Emacs窗口。幸运的是，事实并非如此，Emacs是一个很好的IDE，它支持将Lisp脚本作为一般的系统可执行文件来运行。

There are two popular modern Lisps, aside from Elisp, that are easy to run as standalone scripts.
除了Elisp之外，有两种流行的现代lisp很容易作为独立脚本运行。

1. **Racket:** You can run Racket scripts relying on your system's Racket install to provide runtime support, or you can use **raco exe** to produce an executable. The **raco exe** command packages your code together with runtime support files to create an executable. The **raco distribute** command then packages that executable into a distribution that works on other machines. Emacs has many Racket-specific tools, so creating Racket files in Emacs is easy and efficient.
1. **球拍:**你可以运行球拍脚本依赖于你的系统的球拍安装提供运行时支持，或者你可以使用**raco exe**产生一个可执行文件。**raco exe**命令将代码和运行时支持文件打包，以创建可执行文件。然后，**raco distribution **命令将可执行文件打包到在其他机器上工作的发行版中。Emacs有许多特定于球拍的工具，因此在Emacs中创建球拍文件既简单又有效。

2. **GNU Guile:** [GNU Guile][16] (short for "GNU Ubiquitous Intelligent Language for Extensions") is an implementation of the [Scheme][17] programming language that's used for creating applications and games for the desktop, internet, terminal, and more. Writing Scheme is easy, using any one of the many Scheme extensions in Emacs. For example, here's a "Hello world" script in Guile: [code] #!/usr/bin/guile -s
2. **GNU Guile:** [GNU Guile][16](“GNU通用智能语言扩展”的缩写)是[Scheme][17]编程语言的一个实现，它用于为桌面、internet、终端等创建应用程序和游戏。使用Emacs中众多Scheme扩展中的任何一个，编写Scheme都很容易。例如，这里有一个用Guile编写的“Hello world”脚本:[code] #!/usr/bin/guile - s
!#

(display "hello world")
(显示“hello world”)
     (newline) [/code] Compile and run it with the **guile** command: [code] $ guile ./hello.scheme
(换行)[/code]编译并运行**guile**命令:[code] $ guile ./hello.scheme
;;; compiling /home/seth/./hello.scheme
;;;compiling / home /塞斯-你好。怀廷
;;; compiled [...]/hello.scheme.go
;;;[…]/ hello.scheme.go编译
hello world
你好，世界
$ guile ./hello.scheme
你好，scheme
hello world
你好，世界
```
引用----------------------------------------------------
## Run Elisp without Emacs
