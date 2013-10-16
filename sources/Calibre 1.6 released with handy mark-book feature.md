携带便利的图书标记特性,Calibre 1.6 正式发布!!!

[Calibre][1]是一个免费的开源电子丛书管理工具,令人心动的设计思想,综合电子书相关的多领域的要求和需求,提供强大的转换处理,专注电子书的阅读,书库轻而易举的创建和管理,在线集成服务等,总而言之,给你真真正正的现代化电子书阅读.

Calibre 已经更新到**1.6**版本,介绍了一个已存在的**图书标记**(book-mark)特性,也有大量的修补和功能增强.

**图书标记**作为一种**暂定**选书的简便方式(重启Calibre,就会失去标记),允许用户标记图书,再点击已标记的图书便取消标记,该特性能在多场景提供便利.

最新应用的图书标记功能并没有默认开启,当然,开启它也是很容易的`首选项(Prefences)-->工具栏(Toolbar)-->主工具栏(The main toolbar)-->点击标记图书(Mark Books)-->点击左端的箭头-->应用(Apply)`,之后在工具栏上就有图书标记按钮

**标记**,举个例子,手动的标记三本书(按住Ctrl键,并点击首选的三本图书),也可以通过工具栏上的按钮,标记图书.

最新标记的三本书将显示一个特殊标记的图标,这样用户可以清楚的观察到标记的书本.

![](http://iloveubuntu.net/pictures_me/calibre%2016%20marking%20books.png)

在标记图书后,用户可以通过'右击标记按钮-->显示标记书本'来只显示已标记的图书,同时隐藏未标记的图书.

在有些时候想清楚观察重点图书,图书标记功能允许用户轻而易举的隔离出偏爱的图书,想通过几秒钟点击标记按钮,隔离处理能完全的展示某一书本

再次选择标记图书或再点击标记图书按钮,将取消标记,按钮就像是一个标记/不标记的按钮

Calibre默认携带了好用的电子书阅读器,在1.6版本增加了额外的快捷键配置,意味着现在用户能通过自己的喜好制定不同的**快捷键**例如放大缩小

打开电子书阅读器之前先调整快捷键,点击工具条的首选项来操纵快捷键,双击一个条目进行编辑.

![](http://iloveubuntu.net/pictures_me/calibre%20font%20size%20shortcut.png)

以上提及的特性,连同大量的漏洞的修补,增加最新的新闻源(大量的乌拉圭新闻)和改良了一些新闻源(国家地理杂志,纽约书评,聚焦,Carta Capital,明报,Neu Osnabrucker Zeitung),去感受更强大的Calibre吧!!!!!

我们怎么**安装**Calibre 1.6呢?

复制制以下命令到终端

	sudo python -c "'import sys; py3 = sys.version_info[0] > 2; u = __import__('urllib.request' if py3 else 'urllib', fromlist=1); exec(u.urlopen('http://status.calibre-ebook.com/linux_installer').read()); main()

按回车键,出现`Enter the installation directory for calibre [/opt]`再按回车键

如果用户通过PPA安装了Calibre,那么请先执行下列命令(在执行以上命令之前).
	
	sudo apt-get remove calibre calibre-bin

--------------------------------------------------------------------------------

via: http://iloveubuntu.net/calibre-16-released-handy-mark-book-feature

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://calibre-ebook.com/
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
