在Linux终端下使用 calcurse 安排约会和待办事项
================================================================================
如果你是一个享受linux终端的系统管理员，但同样需要一种方法来安排每天最重要的任务、约会和会议，你会发现[calcurse][1]是一个很有用的工具。calcurse包含了日历、一个待办事项管理、一个调度程序和一个可配置的通知系统，这些都集成进了一个软件中，基于的都是ncurse的接口。同时，它不会限制你在终端中，你可以将你的日历和笔记导出成可以打印的格式。

本篇文章我们会探索如何在Linux上安装calcurse，并且教你如何利用它的特性。

### 在Linux上安装Culcurse ###

calcurse在大多数Linux发行版的标准仓库都有。万一在你的发行版上没有（比如CentOS/RHEL），只要你安装了gcc和ncurse开发文件后就可以很简单地从源码安装。

Debian、Ubuntu或者Linux Mint

    # aptitude install calcurse

Fedora

    # yum install calcurse

CentOS/RHEL

    # yum install gcc ncurses-devel
    # wget http://calcurse.org/files/calcurse-3.2.1.tar.gz
    # tar xvfvz calcurse-3.2.1.tar.gz
    # cd calcurse-3.2.1
    # ./configure
    # make
    # make install 

### 启动 Calcurse ###

安装完成后，你就可以用下面的命令启动calcurse了：

    $ calcurse 

你将会看到下面的空白界面。如果这配色不吸引你，你可以以后换一个。

![](https://farm8.staticflickr.com/7567/15410270544_0af50a4eb6_c.jpg)

我们现在可以按下回车-‘q’- 再次按下回车- ‘y’来退出主界面。这个按键序列激活界面底部的主菜单，并告诉它保存当前的笔记并确认退出。

我们第一次运行 calcurse 时，会在主目录创建如下子目录：

![](https://farm8.staticflickr.com/7482/15845194188_2ba15035e7_o.png)

这里是每一个子目录的简要描述：

- **apts**文件包含了用户所有的约会和事项，todo文件包含了所有的**待办事项** 列表。
- **conf**文件，如你所想的那样，包含当前用户的独立设置。
- **keys**文件包含了用户定义的按键绑定（比如：q或者Q退出，x或者X导出内容等等）。
- 在**notes**子目录你会看到包含了笔记描述的文件，这些笔记你可以附到任何一个安排事项中。

### 改变配色 ###

要改变配色，按照下面的步骤：

![](https://farm9.staticflickr.com/8595/16006755476_5289384f81_z.jpg)

使用最后一幅图的按键绑定来选择前景色和背景色配置，以更好地适应你的需求：

![](https://farm8.staticflickr.com/7499/15845274420_70bb95c221_b.jpg)

### 添加约会和待办任务 ###

在前面的选项卡中浏览命令菜单时，我们看到按下‘o’可以从一个菜单跳到下一个菜单。我们可以把第二个菜单作为**安排编辑菜单**。

![](https://farm9.staticflickr.com/8634/16031851732_b947951f76_c.jpg)

那么我们用Ctrl + A 和 Ctrl + T组合键为今天添加一个新的约会和一个新的待办任务。如果我们希望为约会指定一个具体的日期而不是今天，我们可以在添加约会和待办事项前使用Ctrl + L (+1 天)、Ctrl + H (-1 天)、Ctrl + J (+1 周)和Ctrl + K (-1 周)组合键。

![](https://farm8.staticflickr.com/7498/15410270594_dc282928ac_z.jpg)

添加待办任务的步骤是相似的，只是用Ctrl + T，之前已经解释了：

![](https://farm8.staticflickr.com/7520/15845386020_9799fe7378_o.png)

你还会被要求输入一个优先级，这样待办任务就会显示在主页上了：

![](https://farm8.staticflickr.com/7498/15413012243_e081b4e0b3_o.png)

你现在可以验证待办任务和约会已经相应地添加到了.culcurse文件夹下的todo和apts文件中了：

![](https://farm8.staticflickr.com/7569/16030583401_0a07d007aa_z.jpg)

注意你可以使用你最喜欢的编辑器或者菜单底部的calcurse屏幕来编辑这些文件。你可以按下TAB来在不同的面板间切换，并选择你想要编辑的项目：

![](https://farm9.staticflickr.com/8663/16032536475_2fd68e16bf_z.jpg)

### 为事项设置通知 ###

你可以在通知菜单下配置通知。按照相同的步骤来改变配色方案，但是选择**Notify**而不是**Colour**：

![](https://farm8.staticflickr.com/7569/15412900863_eaf2767e19_z.jpg)

假设你想要设置email通知。按下数字5来编辑**notify-bar_command**的值：

![](https://farm8.staticflickr.com/7531/16030583451_6d116b5f63_z.jpg)

按照上面的设置之后，如果这个任务被标为重要，那么root@localhost会在300秒（或者5分钟）后收到邮件通知，这会发生在下一个安排的任务之前。如果你想要即使calcurse不在运行也启用这个功能，那么将notify-daemon_enable设成yes。在本例中，dev2是本机的主机名。

![](https://farm8.staticflickr.com/7552/16031851862_afbf1937d0_z.jpg)

请注意出于演示目的，我已经在这篇教程中改变了原始约会的开始和/或者结束时间。

### 总结 ###

本篇教程中我们展示了如何设置一个多样化的调度器和提醒器来帮助你组织每日的活动和提前安排重要的事项。你或许还要看看calcurse的[PDF 手册][2]，请随意在下面的评论中提出你的疑问。欢迎你的评论，我也很高兴看到这些。

--------------------------------------------------------------------------------

via: http://xmodulo.com/schedule-appointments-todo-tasks-linux-terminal.html

作者：[Gabriel Cánepa][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://calcurse.org/
[2]:http://calcurse.org/files/manual.pdf