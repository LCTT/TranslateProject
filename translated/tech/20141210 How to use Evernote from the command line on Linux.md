如何在Linux的命令行中使用Evernote
================================================================================
这周让我们继续什么学习如个使用Linux命令行管理和组织信息。在命令行中管理[你的个人花费][1]后，我建议你在命令行中管理你的笔记，特别地是，当你笔记放在Evernote中时。为防止你从来没有听说过，[Evernote][2]专门有一个用户有好的在线服务用来在不同的设备间同步笔记。除了提供花哨的基于Web的API，Evernote还发布了在Windows、Mac、[Android][3]和iOS上的客户端。然而至今还没有官方的Linux客户端可用。老实说在众多的非官方Linux程序中，一个程序一出现就吸引了所有的命令行爱好者：[Geeknote][4]

### Geeknote 的安装 ###

Geeknote使用Python开发的。因此，在开始之前请确保你已经安装了Python（最好是2.7的版本）和git。

#### 在 Debian、 Ubuntu 和 Linux Mint 中 ####

    $ sudo apt-get install python2.7 git python-setuptools
    $ git clone git://github.com/VitaliyRodnenko/geeknote.git
    $ cd geeknote
    $ sudo python2.7 setup.py install 

#### 在 Fedora 或者 CentOS/RHEL 中 ####

    $ sudo yum install git
    $ git clone git://github.com/VitaliyRodnenko/geeknote.git
    $ cd geeknote
    $ sudo python setup.py install 

#### 在 Arch Linux 中 ####

对于ArchLinux用户，只需要使用[AUR][5]中的包。

### Geeknote 的基本使用 ###

一旦你安装玩Geeknote后，你应该将Geeknote与你的Evernote账号关联：

    $ geeknote login 

接着输入你的emial地址、密码、和你的二步验证码。如果你没有后者，忽略它并按下回车。

![](https://farm8.staticflickr.com/7525/15761947888_7bc71bf216_o.jpg)

很明显，你需要一个Evernote账号来完成这些，因此先去注册。

一旦完成这一切之后，你就可以开始了，创建新的笔记并编辑它们。

但是首先，你需要设置你最喜欢的文本编辑器：

    $ geeknote settings --editor vim 

接着，常规创建一条新笔记的语法是：

    $ geeknote create --title [title of the new note] (--content [content] --tags [comma-separated tags] --notebook [comma-separated notebooks]) 

上面的命令中，只有‘title’是必须的，它会与一条新笔记的标题相关联。其他的标注可以为笔记添加额外的元数据：添加标签来与你的笔记关联、指定放在那个笔记本里。同样，如果你的标题或者内容还有空格，不要忘记将它们放在引号中。


比如:

    $ geeknote create --title "My note" --content "This is a test note" --tags "finance, business, important" --notebook "Family" 

通常上，下一步就是编辑你的笔记。语法很相似：

    $ geeknote edit --note [title of the note to edit] (--title [new title] --tags [new tags] --notebook [new notebooks]) 

注意可选的参数如标题、标签和笔记本，用来修改笔记的元数据。比如，你可以用下面的命令重命名笔记：

    $ geeknote edit --note [old title] --title [new title] 

现在基本的创建和编辑已经完成了，更高级的特性是搜索和删除。你可以下面的语法搜索你的笔记：

    $ geeknote find --search [text-to-search] --tags [comma-separated tags] --notebook [comma-separated notebooks] --date [date-or-date-range] --content-search 

默认上，上面的命令会通过标题搜索笔记。 用"--content-search"选项，就可以搜索它们的内容。

比如：

    $ geeknote find --search "*restaurant" --notebooks "Family" --date 31.03.2014-31.08.2014 

显示制定标题的笔记：

    $ geeknote show [title] 

![](https://farm8.staticflickr.com/7538/15327089024_32867cded6_o.jpg)

我最喜欢使用的一个技巧是使用：

    $ geeknote show "*" 

这会显示所有的笔记并允许你在这中选择一个。

删除一条笔记：

    $ geeknote remove --note [title] 

小心这是真正的删除。它会从云存储中删除这条笔记。

最后有很多的选项来管理标签和笔记本。我想最有用的是显示笔记本列表。

    $ geeknote notebook-list 

![](https://farm8.staticflickr.com/7472/15762063420_43e3ee17da_o.jpg)

下面的非常相像。你可以猜到，可以用下面的命令列出所有的标签：

    $ geeknote tag-list 

创建一个笔记本：

    $ geeknote notebook-create --title [notebook title] 

创建一个标签：

    $ geeknote tag-create --title [tag title] 

一旦你了解了窍门，很明显语法是非常连贯且明确的。

如果你想要了解更多，不要忘记查看[官方文档][6]。

### 福利 ###

As a bonus, Geeknote comes with the utility gnsync, which allows for file synchronization between your Evernote account and your local computer. However, I find its syntax a bit dry:
福利的是，Geeknote自带的gnsync工具可以让你在Evernote和本地计算机之间同步。然而，我发现它的语法有点枯燥：

    $ gnsync --path [where to sync] (--mask [what kind of file to sync] --format [in which format] --logpath [where to write the log] --notebook [which notebook to use]) 

下面是这些的意义。


- **--path /home/adrien/Documents/notes/**: 与Evernote同步笔记的位置。
- **--mask "*.txt"**: 只同步纯文本文件。默认上，gnsync会尝试同步所有文件。
- **--format markdown**: 你希望它们是纯文本或者markdown格式（默认是纯文本）。
- **--logpath /home/adrien/gnsync.log**: 同步日志的位置。为防出错，gnsync会在那里写入日志信息。
- **--notebook "Family"**: 同步哪个笔记本中的笔记。如果你那里留空，程序会创建一个以你同步文件夹命令的笔记本。

总结来说，Geeknote是一款花哨的Evernote的命令行客户端。我个人不常使用Evernote，但它仍然很漂亮和有用。命令行一方面让它变得很极客且很容易与shell脚本结合。同样，还有Git上fork出来的Geeknote，在ArchLinux AUR上称为[geeknote-improved-git][7]，貌似它有更多的特性和比其他分支更积极的开发。但在我看来，还很值得再看看。

你认为Geeknote怎么样？ 有什么你想用的么？或者你更喜欢使用传统的程序？在评论区中让我们知道。

--------------------------------------------------------------------------------

via: http://xmodulo.com/evernote-command-line-linux.html

作者：[Adrien Brochard][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://xmodulo.com/manage-personal-expenses-command-line.html
[2]:https://evernote.com/
[3]:http://xmodulo.com/go/android_tutorial
[4]:http://www.geeknote.me/
[5]:https://aur.archlinux.org/packages/geeknote-git/
[6]:http://www.geeknote.me/documentation/
[7]:https://aur.archlinux.org/packages/geeknote-improved-git/