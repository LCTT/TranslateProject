命令行星期二 —— 第二篇
================================================================================
Hi，极客们！

让我们来更新一下我们的记忆。[上周][1]，我们学习了一些基础命令，了解了shell是什么，同时介绍了我们CLI的星期二系列。

今天的菜单将提供点别的东西：通过文件系统导航。

现在，我设法找到最好的图片是从一个叫[devopsbootcamp][2]的网站。你可以在上面找到他们其余的教程。但无论如何，这是一个关于Linux根文件系统的看起来非常不错的图。

![Filesys](http://devopsbootcamp.readthedocs.org/en/latest/_images/hierarchy.jpg)

例如，在上面的图片说明中，你的用户目录（你通常用来存储你的电影，音乐，文档等）是位于/home文件夹下。 /home文件夹位于/。然后，/下有个 /etc 文件夹，其中文件大部分为配置文件。无论如何，你可以在这里找到详细的描述，因为我们将进入这些文件夹来了解他们的功能，直到我们开始使用和配置它们。今天是仅用于导航。而关于这一点，让我们来开始今天的第一个命令...

### pwd ###

pwd，或者 ‘Print Working Directory’，当你觉得在文件丛林之中迷失了方向时是一个非常有用的命令。在任何给定时刻，键入pwd命令，瞧！这是你到达这个文件夹的完整路径。在电影《异次元杀阵（The Cube）》里的那些家伙总在用它，这些笨蛋！

![Cube](http://bloody-disgusting.com/images/news/cube2review1.gif)


想象一下，自己在一个巨大的公寓里面从一个房间走到另一个房间房间，迷路了。 pwd就像面包屑指引着你到你的出发点，这样你就不会在文件夹迷宫里面失去你的方向！

![pwd](http://redhat.activeventure.com/73/gettingstartedguide/figs/basics/pwd.png)

### cd ###

现在你学习了如果想知道自己在哪个目录的pwd命令的用法。现在，你要做的下一步骤就是移动到另一个目录。比方说，你在你的home文件夹下有一个文件夹（目录），你要将你的绝密的东东放到里面。要这样做，你需要使用用'cd'命令。 cd，或‘Change Directory’，将改变所处目录的位置。你怎么使用它呢？简单，键入cd和你的文件夹路径。比方说，例如，你想从你的主文件夹进入你的Hello Kitty图片集。你输入‘cd /home/username/Hello\ Kitty’。

正如你看到的，我们并没有只使用文件夹名称的空格键。这是因为终端将无法识别它。每当你要导航到它的名称中有空格的文件夹，你**用反斜杠字符，后跟空格**代替它。您也可以不使用反斜杠+空格选项，只是把**整个文件夹名称加引号**，例如，cd /home/username/ "Hello Kitty"。

![cd](http://blogote.com/wp-content/uploads/2010/06/terminal-cd-desktop.png)

自己尝试一下。使用cd导航到不同的目录，同时，键入pwd命令，看看一切工作是否如期望的那样。

### 肖茨先生的快捷键 ###

肖茨先生提醒我们也有一些可用的快捷键。 

如果你仅键入cd，不带路径，你的终端将从你的工作目录（无论是不是）切换到你的/home文件夹。

同样地，如果你键入 cd `~user_name` 它会带你到你指定的特定用户的主文件夹。

### 下周 ###

下周，我们将进入到下一章 - 我们将学习如何列出文件和目录，查看文本文件和文件的内容，因此会比之前我们已经学习的有更多的工作，但我希望你将会有足够的时间。一条命令又一条命令，如果你没有时间自己学习的话，那让我们在几个月内一起学习基础知识吧！

同时，记得...

### …玩得开心! ###

P.S.：感谢bwl的评论，我们修正了一个在目录名称中包含空格的文本的一个错误。

P.P.S：GreatEmerald还增加了有关文件层次结构的一些新信息。您可以在[意见][3]中阅读。

感谢你们的贡献和更正

--------------------------------------------------------------------------------

via: https://news.opensuse.org/2014/06/24/command-line-tuesdays-part-two/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-3300-1.html
[2]:http://devopsbootcamp.readthedocs.org/
[3]:https://news.opensuse.org/2014/06/24/command-line-tuesdays-part-two/comment-page-1/#comment-99186
