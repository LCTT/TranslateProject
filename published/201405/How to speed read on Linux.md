如何在Liunx中“快速阅读”？
===============================
你听说过“快速阅读”吗？说实话我也没有。直到一个名叫Spritz的新型公司[筹集了350万种子基金][1]来开发使用户能够实现每分钟阅读1000个单词的一个API。

“快速阅读”的概念十分简单：将一文本分割成一个个独立短小的部分，像一两个单词，然后使这些部分迅速地闪过屏幕。在这一阅读过程中，读者的眼睛完全不需要运动，从而减少读者平常阅读中花费的不必要的浏览页面的时间。因为这是一件相对较新的技术，没人知道在这样的阅读速度下，你的大脑是否会爆炸或者崩溃。不过，实际上[这技术是十分安全的][2]，因为你的大脑运行地足够快来处理这些信息。一旦人们习惯了这种阅读方式，这种方式会变得十分方便。想必你像我一样已经对这项技术的到来已经激动万分了，但我并不想等待，而是更快地习惯这种阅读方式。好消息是：现在你就可以在你最喜爱的操作系统下尝试“快速阅读”了。

### 1. Spread0r###

![](https://farm8.staticflickr.com/7145/13750477263_6618438d38_z.jpg)

基于Perl和GTK2，[spread0r][3]（曾名为Gritz）是一个GPL软件，它以文本文档作为输入，然后将文本内容在你眼前以最高1000词每分钟速度闪过。当然你可以先尝试较慢的速度，来慢慢熟悉它。软件的用户界面十分简介，功能按键几乎极简：开始文章阅读，选择阅读速度，推出等等。这个软件也有一些需要改进的地方，我建议使其能够支持除了文本文档之外的其他文件作为输入（当然你也可以自己转换格式），另外也可以考虑加入“无干扰”模式。不管怎样，这款软件是十分高大上的。

你可以通过从[github][4]中下载源码并启动“spread0r.pl”文件来尝试Spread0r。注意你先需要在你的操作系统中安装GTK2以及Perl.

    $ sudo apt-get install libgtk2-perl (for Debian/Ubuntu)
    $ sudo pacman -S gtk2-perl (for Archlinux)
    $ sudo yum install perl-gtk2 (for Fedora) 

### 2. Spread ###

![](https://farm8.staticflickr.com/7330/13750836154_34774f1a69_z.jpg)

除电子书以及word文档之外，我在电脑中阅读最多的就是来自网络的文章了（是的，就是这样）。如果我需要复制并黏贴我需要阅读的文本到一个文本编辑器中，将其保存为一个txt文档，然后用Spread0r打开，这样事情会变得太麻烦了。幸运的是，Chrome的一个拓展程序[Spread][5]会为我们处理这个需求。在你的Chrome浏览器中安装并启用Spread之后，你只需要选择你想要“快速阅读”的文本，在选取内右击，然后选择“Spreed selected text.”这个拓展程序会开启一个新窗口，你选择的文本就会在那个窗口中为你进行快速阅读。我喜欢这个和用扩展程序的方式集成到Chrome做法。比如说，你可以选择窗口的配色，一次快速阅读的文本量，字体大小，通过空格键控制的开始以及暂停，你甚至可以进行高于4,000词每分钟的快速阅读（但这已经不是快速阅读了，你只能看到零星的闪烁）。

### 3. Squirt ###

![](https://farm4.staticflickr.com/3673/13750455205_70c44f91c0_z.jpg)

如果您喜欢在浏览器中快速阅读的点子，但是你不使用Chrome，也不喜欢“扩展程序”，对此的解决方案是书签[Squirt][6]。除了Squirt这个不明觉厉的名字之外，Squirt是我现在最喜欢的快速阅读工具。它十分高效并且使用简单。从[这里][7]加入它，通过把那个蓝色大按钮拖进你最喜欢的书签栏中。然后你就可以在任何网页中打开它，无论是否选中了阅读文本——一个白色的面板会出现在当前页面之上。你可以凭直觉来控制阅读文本。用户界面十分漂亮，而且它也可以实现4,000词以上的阅读速度。

###　Bonus: Zethos ###

如果之前提及的方案没有一个能使你满意，而且你是一名程序员，你会很高兴地发现有一个叫做[Zethos][8]的免费及开源的JS项目，你可以通过使用它来开发你自己的“快速阅读”应用。你可以在[github][9]上查看代码，并为作者点个赞。

总而言之，你现在没有理由不在你最爱的操作系统进行“快速阅读”了。你只需要防止你的大脑被烧焦就行了。你更喜欢以上的哪个解决方案呢？或者你有另外更好的选择？你认为“快速阅读”在未来能够发展吗？在评论区中评论让我们知道你的想法。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/speed-read-linux.html

译者：[ThomazL](https://github.com/ThomazL) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://techcrunch.com/2014/03/10/spritz-seed/
[2]:http://www.spritzinc.com/faq/
[3]:https://github.com/xypiie/spread0r
[4]:https://github.com/xypiie/spread0r
[5]:https://chrome.google.com/webstore/detail/spreed-speed-read-the-web/ipikiaejjblmdopojhpejjmbedhlibno
[6]:http://www.squirt.io/
[7]:http://www.squirt.io/install.html
[8]:http://zethos.zolmeister.com/
[9]:https://github.com/Zolmeister/Zethos
