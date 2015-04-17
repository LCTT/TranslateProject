文件轻松比对，伟大而自由的比较软件们
================================================================================

文件比较工具用于比较计算机上的文件的内容，找到他们之间相同与不同之处。比较的结果通常被称为diff。

diff同时也是一个基于控制台的、能输出两个文件之间不同之处的著名的文件比较程序的名字。diff是于二十世纪70年代早期，在Unix操作系统上被开发出来的。diff将会把两个文件之间不同之处的部分进行输出。

Linux拥有很多不错的GUI工具，能使你能清楚的看到两个文件或同一文件不同版本之间的不同之处。这次我从自己最喜欢的GUI比较工具中选出了五个推荐给大家。除了其中的一个，其他的都是开源的。

这些应用程序可以让你更清楚的看到文件或目录的差别，能合并有差异的文件，可以解决冲突并将其输出成一个新的文件或补丁，其也用于那些预览和备注文件改动的产品上（比如，在源代码合并到源文件树之前，要先接受源代码的改变）。因此它们是非常重要的软件开发工具。它们可以帮助开发人员们对文件进行处理，不停的把文件转来转去。这些比较工具不仅仅能用于显示源代码文件中的不同之处；他们还适用于很多种的文本文件。可视化的特性使文件比较变得容易、简单。

----------

###Meld

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Meld.png)

Meld是一个适用于Gnome桌面的、开源的、图形化的文件差异查看和合并的应用程序。它支持2到3个文件的同时比较、递归式的目录比较、处于版本控制(Bazaar, Codeville, CVS, Darcs, Fossil SCM, Git, Mercurial, Monotone, Subversion)之下的目录比较。还能够手动或自动合并文件差异。

Meld的重点在于帮助开发人员比较和合并多个源文件，并在他们最喜欢的版本控制系统下能直观的浏览改动过的地方。

功能包括

- 原地编辑文件，即时更新
- 进行两到三个文件的比较及合并
- 在显示的差异和冲突之间的导航
- 使用插入、改变和冲突这几种标记可视化展示本地和全局的差异
- 内置正则表达式文本过滤器，可以忽略不重要的差异
- 语法高亮度显示（使用可选的gtksourceview)
- 将两到三个目录中的文件逐个进行比较，显示新建，缺失和替换过的文件
- 对任何有冲突或差异的文件直接打开比较界面
- 可以过滤文件或目录以避免以忽略某些差异
- 被改动区域的自动合并模式使合并更容易
- 也有一个简单的文件管理
- 支持多种版本控制系统，包括Git, Mercurial, Bazaar 和 SVN
- 在提交前开启文件比较来检查改动的地方和内容
- 查看文件版本状态
- 还能进行简单的版本控制操作（例如，提交、更新、添加、移动或删除文件）
- 继承自同一文件的两个文件进行自动合并
- 标注并在中间的窗格显示所有有冲突的变更的基础版本
- 显示并合并同一文件的无关的独立修改
- 锁定只读性质的基础文件以避免出错
- 可以整合到已有的命令行界面中，包括gitmergetool
- 国际化支持
- 可视化使文件比较更简单

- 网址: [meldmerge.org][1]
- 开发人员: Kai Willadsen
- 证书: GNU GPL v2
- 版本号: 1.8.5

----------

###DiffMerge

![](http://www.sourcegear.com/images/screenshots/diffmerge/img_merge_linux.png)

DiffMerge是一个可以在Linux、Windows和OS X上运行的，可以可视化文件的比较和合并的应用软件。

功能包括:

- 图形化显示两个文件之间的差别。包括插入行，高亮标注以及对编辑的全面支持
- 图形化显示三个文件之间的差别。（安全的前提下）允许自动合并，并对最终文件可以随意编辑
- 并排显示两个文件夹的比较，显示哪一个文件只存在于其中一个文件夹而不存在于另外的一个文件夹，还能一对一的将完全相同的、等价的或不同的文件配对
- 规则设置和选项让你可以个性化它的外观和行为
- 基于Unicode，可以导入多种编码的字符
- 跨平台工具

- 网址: [sourcegear.com/diffmerge][2]
- 开发人员: SourceGear LLC
- 证书: Licensed for use free of charge (not open source)
- 版本号: 4.2

----------

###xxdiff

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-xxdiff.png)

xxdiff是个开源的图形化的可进行文件、目录比较及合并的工具。

xxdiff可以用于显示两到三个文件或两个目录的差别，还能产生一个合并后的版本。被比较的两到三个文件会并排显示，并将有区别的文字内容用不同颜色高亮显示以便于识别。

这个程序是个非常重要的软件开发工具。他可以图形化的显示两个文件或目录之间的差别，合并有差异的文件，其也用于那些预览和备注文件改动的产品上（比如，在源代码合并到源文件树之前，要先接受源代码的改变）

功能包括:

- 比较两到三个文件，或是两个目录（浅层或递归）
- 横向高亮显示差异
- 交互式的文件合并，可视化的输出和保存
- 可以辅助合并的评论/监管
- 自动合并文件中时不合并 CVS 冲突，并以两个文件显示以便于解决冲突
- 可以用其它的比较程序计算差异：适用于GNU diff、SGI diff和ClearCase的cleardiff，以及所有与这些程序输出相似的文件比较程序。
- 可以使用资源文件实现完全的个性化设置
- 用起来感觉和Rudy Wortel或SGI的xdiff差不多，与桌面系统无关
- 功能和输出可以和脚本轻松集成

- 网址: [furius.ca/xxdiff][3]
- 开发人员: Martin Blais
- 证书: GNU GPL
- 版本号: 4.0

----------

###Diffuse

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Diffuse.png)

Diffuse是个开源的图形化工具，可用于合并和比较文本文件。Diffuse能够比较任意数量的文件，并排显示，并提供手动行匹配调整，能直接编辑文件。Diffuse还能从bazaar、CVS、darcs, git, mercurial, monotone, Subversion和GNU RCS 库中获取版本用于比较及合并。

功能包括: 

- 比较任意数量的文件，并排显示（多方合并）
- 行匹配可以被用户人工矫正
- 直接编辑文件
- 语法高亮
- 支持Bazaar, CVS, Darcs, Git, Mercurial, Monotone, RCS, Subversion和SVK
- 支持Unicode
- 可无限撤销
- 易用的键盘导航

- 网址: [diffuse.sourceforge.net][]
- 开发人员: Derrick Moser
- 证书: GNU GPL v2
- 版本号: 0.4.7

----------

###Kompare

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-Kompare.png)

Kompare是个开源的GUI前端程序，可以对不同源文件之间差异的可视化和合并。Kompare可以比较文件或文件夹内容的差异。Kompare支持很多种diff格式，并提供各种选项来设置显示的信息级别。

不论你是个想比较源代码的开发人员，还是只想比较一下研究论文手稿与最终文档的差异，Kompare都是个有用的工具。

Kompare是KDE桌面环境的一部分。

功能包括: 

- 比较两个文本文件
- 递归式比较目录
- 显示diff产生的补丁
- 将补丁合并到一个已存在的目录
- 可以让你在编译时更轻松

- 网址: [www.caffeinated.me.uk/kompare/][5]
- 开发者: The Kompare Team
- 证书: GNU GPL
- 版本号: Part of KDE

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/2014062814400262/FileComparisons.html

作者：Frazer Kline
译者：[H-mudcup](https://github.com/H-mudcup) 
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://meldmerge.org/
[2]:https://sourcegear.com/diffmerge/
[3]:http://furius.ca/xxdiff/
[4]:http://diffuse.sourceforge.net/
[5]:http://www.caffeinated.me.uk/kompare/
