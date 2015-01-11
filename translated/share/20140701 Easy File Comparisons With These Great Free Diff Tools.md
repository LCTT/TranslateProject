Translated By H-mudcup

文件轻松比对，伟大而自由的比较软件们
================================================================================
作者 Frazer Kline

文件比较工具用于比较电脑文件的内容，找到他们之间相同与不同之处。比较的结果通常被称为diff。

diff同时也是一个著名的，基于控制台的，能输出两个文件之间不同之处的，文件比较程序的名字。diff是二十世纪70年代早期，在Unix操作系统上被开发出来的。diff将会把两个文件之间不同之处的部分进行输出。

Linux拥有很多不错的，能使你能清楚的看到两个文件或同一文件不同版本之间的不同之处的，很棒的GUI工具。这次我从自己最喜欢的GUI比较工具中选出了五个推荐给大家。除了其中的一个，其他的都有开源许可证。

这些应用程序可以让文件或目录的差别变得可见，能合并有差异的文件，可以解决冲突并将其输出成一个新的文件或补丁，还能帮助回顾文件被改动过的地方并评论最终产品（比如，在源代码合并到源文件树之前，要先批准源代码的改变）。因此它们是非常重要的软件开发工具。它们不停的把文件传来传，帮助开发人员们在同一个文件上工作。这些比较工具不仅仅能用于显示源代码文件中的不同之处；他们还适用于很多种文本类文件。可视化的特性使文件比较变得容易、简单。

----------

![](http://www.linuxlinks.com/portal/content2/png/Meld.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Meld.png)

Meld是一个适用于Gnome桌面的，开源的，图形化的文件差异查看和合并的应用程序。它支持2到3个文件的同时比较，递归式的目录比较，版本控制(Bazaar, Codeville, CVS, Darcs, Fossil SCM, Git, Mercurial, Monotone, Subversion)之下的目录比较。还能够手动或自动合并文件差异。

eld的重点在于帮助开发人员比较和合并多个源文件，并在他们最喜欢的版本控制系统下能直观的浏览改动过的地方。

功能包括

- 原地编辑文件，即时更新
- 进行两到三个文件的比较及合并
- 差异和冲突之间的导航
- 可视化本地和总体间的插入、改变和冲突这几种不同之处。
- 内置正则表达式文本过滤器，可以忽略不重要的差异
- 语法高亮度显示（可选择gtksourceview)
- 将两到三个目录一个文件一个文件的进行比较，显示新建，缺失和替换过的文件。
- 可直接开启任何有冲突或差异的文件的比较
- 可以过滤文件或目录以避免出现假差异
- 被改动区域的自动合并模式使合并更容易
- 简单的文件管理
- 支持多种版本控制系统，包括Git, Mercurial, Bazaar and SVN
- 在提交前开启文件比较来检查改动的地方和内容
- 查看文件版本状态
- 还能进行简单的版本控制操作（例如，提交、更新、添加、移动或删除文件）
- 继承自同一文件的两个文件进行自动合并
- 标注并在中间的窗格显示所有有冲突的变更的基础版本
- 显示并合并同一文件的各自独立的修改
- 锁定只读性质的基础文件以避免出错
- 可以整合到已有的命令行界面中，包括gitmergetool
- 国际化支持
- 可视化使文件比较更简单

- 网址: [meldmerge.org][1]
- 开发人员: Kai Willadsen
- 证书: GNU GPL v2
- 版本号: 1.8.5

----------

![](http://www.linuxlinks.com/portal/content2/png/DiffMerge.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-DiffMerge.png)
注：上面这个图访问不到，图的地址是原文地址的小图的链接地址，发布的时候在验证一下，如果还访问不到，不行先采用小图或者网上搜一下看有没有大图

DiffMerge是一个可以在Linux、Windows和OS X上运行的，可以可视化文件的比较和合并的应用软件。

功能包括:

- 图形化的显示两个文件之间的差别。包括插入行，高亮标注以及对编辑的全面支持。
- 图形化的显示三个文件之间的差别。（安全的前提下）允许自动合并还完全拥有最终文件的编辑权。
- 并排显示两个文件夹的比较，显示哪一个文件只存在于其中一个文件夹而不存在于与之相比较的那个文件夹，还能一对一的将完全相同的、等价的或不同的文件配对。
- 规则设置和选项让你可以个性化它的外观和行为
- 基于Unicode，可以导入多种编码的字符
- 跨平台工具

- 网址: [sourcegear.com/diffmerge][2]
- 开发人员: SourceGear LLC
- 证书: Licensed for use free of charge (not open source)
- 版本号: 4.2

----------

![](http://www.linuxlinks.com/portal/content2/png/xxdiff.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-xxdiff.png)

xxdiff是个开源的图形化的，可进行文件、目录比较及合并的工具。

xxdiff可以用于显示两到三个文件或两个目录的差别，还能产生一个合并后的版本。被比较的两到三个文件会并排显示，并将有区别的文字内容用不同颜色高亮显示以便于识别。

这个程序是个非常重要的软件开发工具。他可以图形化的显示两个文件或目录之间的差别，合并有差异的文件，解决冲突并评论结果（例如在源代码合并到一个源文件树里之前必须先允许其改变）

功能包括:

- 比较两到三个文件，或是两个目录（浅层或递归）
- 水平差别高亮显示
- 文件可以被交互式的合并，可视化的输出和保存
- 可以可视化合并的评论/监管
- 保留自动合并文件中的冲突，并以两个文件显示以便于解决冲突
- 用额外的比较程序估算差异：适用于GNU diff、SGI diff和ClearCase的cleardiff，以及所有与这些程序输出相似的文件比较程序。
- 可以在源文件上实现完全的个性化设置
- 用起来感觉和Rudy Wortel或SGI的xdiff差不多， it is desktop agnostic
- 功能和输出可以和脚本轻松集成

- 网址: [furius.ca/xxdiff][3]
- 开发人员: Martin Blais
- 证书: GNU GPL
- 版本号: 4.0

----------

![](http://www.linuxlinks.com/portal/content2/png/Diffuse.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Diffuse.png)

Diffuse是个开源的图形化工具，可用于合并和比较文本文件。Diffuse能够比较任意数量的文件，并排显示，并提供手动行匹配调整，能直接编辑文件。Diffuse还能从bazaar、CVS、darcs, git, mercurial, monotone, Subversion和GNU矫正控制系统（GNU Revision Control System ，RCS)这些关于比较及合并的资源中对文件进行恢复和矫正。

功能包括: 

- 比较任意数量的文件，并排显示（多方合并）
- 行匹配可以被用户人工矫正
- 直接编辑文件
- 语法高亮
- 支持Bazaar, CVS, Darcs, Git, Mercurial, Monotone, RCS, Subversion和SVK
- 支持Unicode
- 可无限撤销
- 简易键盘导航

- 网址: [diffuse.sourceforge.net][]
- 开发人员: Derrick Moser
- 证书: GNU GPL v2
- 版本号: 0.4.7

----------

![](http://www.linuxlinks.com/portal/content2/png/Kompare.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Kompare.png)

Kompare是个开源的GUI前端程序，可以开启不同源文件之间差异的可视化和合并。Kompare可以比较文件或文件夹内容的差异。Kompare支持很多种diff格式，并提供各种选项来设置显示的信息级别。

不论你是个想比较源代码的开发人员，还是只想比较一下研究论文手稿与最终文档的差异，Kompare都是个有用的工具。

Kompare是KDE桌面环境的一部分。

功能包括: 

- 比较两个文本文件
- 递归式比较目录
- 显示diff产生的补丁
- 将补丁合并到一个已存在的目录
- 在无聊的编译时刻，逗你玩

- 网址: [www.caffeinated.me.uk/kompare/][5]
- 开发者: The Kompare Team
- 证书: GNU GPL
- 版本号: Part of KDE

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/2014062814400262/FileComparisons.html

译者：[H-mudcup](https://github.com/H-mudcup) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://meldmerge.org/
[2]:https://sourcegear.com/diffmerge/
[3]:http://furius.ca/xxdiff/
[4]:http://diffuse.sourceforge.net/
[5]:http://www.caffeinated.me.uk/kompare/
