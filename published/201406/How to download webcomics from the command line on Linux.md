Linux + 漫画迷 = 二次元世界？
================================================================================
你是否从来都没有错过xkcd上的漫画连载？及时地阅读到网络漫画。或者你是否想过从你喜欢的网站上备份所有漫画连载？如你所愿，开源社区将为你提供解决方案：使用命令行程序从终端上下载所有你喜欢的漫画连载。

在我们开始之前，请记住一点，你下载的漫画连载仅供个人使用，在没有授权的情况下是不可以散播出去的。如果你确实喜欢该作者的作品，请支持通过捐赠或购买正版商品获得。

### 在Linux中安装Dosage

有一个下载漫画连载的开源程序叫[dosage][1]。由于该程序是用python写的，所以安装漫画连载工具的方式有几种。今天我们就从一种简单的方法开始吧。

第一步，你需要[安装pip][2]（LCTT译注，这是一个用于安装和管理python包的工具），并确保你的python版本在2.7.0至3.3区间。接下来使用pip安装dosage。

    $ sudo pip install dosage

如果pip不能以某种方式来找到相关包（例如Ubuntu14.04系统），可以使用下列命令来找到。

    $ sudo pip install http://wummel.github.io/dosage/dist/dosage-2.13.tar.gz

dosage将会自动创建一个名为“Comics”新的文件夹。

### Dosage的基本用法

dosage的基本用法如下所述。使用dosage，你可以在数据库中找到你喜欢阅读的网络漫画，当最新一期的连载发布时，你可以及时获取最新一期。从某种意义来说，无论你在网络漫画中订阅多少连载，dosage都会确保一期不落地帮你把没有读过的漫画连载下载下来。

下载和阅读你的离线网络漫画，首先要用以下命令将它们列出：

    $ dosage -l

现在，我们可以看到dosage将2000多套漫画从数据库列出。我个人建议用下面的这个命令来查找我们想要看的漫画：

    $ dosage -l | grep [keyword]

这样就会返回所有包含关键字标题的漫画了。

一旦你确定列表中哪一本漫画是你想要阅读的，使用以下命令订阅这本漫画：

    $ dosage [name of the webcomic] 

![](https://farm3.staticflickr.com/2940/13943751585_978ef260de_z.jpg)

订阅漫画时会自动在"Comics"目录下创建子目录，并把最新的连载漫画下载到在里边。

如果你不仅仅想下载最新连载的漫画而是完整的一部，那么你使用以下的命令就可以了：

    $ dosage -a [name of the comic] 

最后，订阅了几本网络漫画之后，你可以使用下面这条简单的命令，方便地下载到这几本漫画的所有更新：

    $ dosage @ 

如果你不想错过每天的漫画更新，你可以每天执行这条命令确保不会错过。

### Dosage的高级用法

玩了一天dosage，你也许想知道它的更多使用方法。这需要你掌握更多的命令语法和快捷入门。

如果你想在xkcd上下载更多的漫画连载，你应该会看到一条dosage拒绝的提示（使用成人选项，确认你的年龄）：

    use the --adult option to confirm your age
    
![](https://farm3.staticflickr.com/2929/13920634111_9d63589f74_z.jpg)

因为默认情况下，dosage会忽略任何标记为仅限18岁以上的成年人浏览的网络漫画（由于某些原因，xkcd也属于其中的一个）。如果你已经成人了，请输入：

    $ dosage --adult xkcd

从之前的例子，你也许注意到'@'这个参数代表你所有已经下载的漫画书。而这个'@@'这个参数则是表示dosage数据库中的所有漫画书。

    $ dosage @@

上面的命令会下载dosage所知道的每一本漫画的最新连载。

如果你想获取漫画从开始到特定的某一天的连载，你可以使用以下命令：

    $ dosage -a [name of the comic]:[year-month-day]

举个例子，我们想看《Calvin and Hobbes》2014年之前的所有连载，运行这条命令：

    $ dosage -a calvinandhobbes:2014-01-01

最后，对于所有想自己做些开发的人来说，dosage可以在下载时生成rss，json和html日志文件。

    $ dosage -o [type] [name of the comic]

在以上命令中，，[type]可以是rss，json或者html，[name of comic]也可以只用'@'。例如，用'html'参数就会创建一个漂亮的HTML代码，以看到所有已经下载到的漫画连载。

下面的命令会下载所有关于Calvin and Hobbes的连载并生成一个网页，可以在你的浏览器中看到一个漂亮的网页，呈现出所有连载漫画。

    $ dosage -o html -a calvinandhobbes 

![](https://farm4.staticflickr.com/3693/13920644962_1b041dc2f2_z.jpg)

最后，我会建议你[阅读手册][3]获取更多相关信息。dosage的确是一个非常简洁的工具，它为广大网页漫画迷们服务。我很好奇地想知道像创建出一个json文件来下载连载漫画的这种创意是怎么诞生的？

你还有其它更好的取代dosage的工具么？或者说你是这些工具的粉丝并且用得非常过瘾，那就在评论里推荐给我们吧。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/download-webcomics-command-line-linux.html

译者：[disylee](https://github.com/disylee) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://wummel.github.io/dosage/
[2]:http://ask.xmodulo.com/install-pip-linux.html
[3]:http://wummel.github.io/dosage/dosage.1.html
