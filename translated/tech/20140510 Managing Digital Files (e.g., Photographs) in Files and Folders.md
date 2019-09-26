数码文件与文件夹收纳术（以照片为例）
======
更新   2014-05-14:增加了一些具体实例

更新   2015-03-16:根据照片的 GPS 坐标过滤图片

更新   2016-08-29:以新的 `filetags--filter` (LCTT译注：文件标签过滤器)替换已经过时的 `show-sel.sh` 脚本（LCTT译注：show-sel 为 show firmware System Event Log records 即硬件系统事件及日志显示）

更新   2017-08-28: geeqier 视频缩略图的邮件评论

更新   2018-03-06:增加了zum Konzept von Julian Kahnert 的链接

更新   2018-05-06:增加了作者在 2018 Linuxtage Graz 大会上演讲的视频

更新   2018-06-05:关于 metadata 的邮件回复

更新   2019-07-09:关于在文件名中避免使用系谱和字符的邮件回复

每当度假或去哪游玩时我就会化身为一个富有激情的摄影师。所以，过去的几年中我积累了许多的 [JPEG][1] 文件。这篇文章中我会介绍我是如何避免[vendor lock-in][2]（LCTT译注：vendor lock-in 供应商锁定，原为经济学术语，这里引申为避免过于依赖某一服务平台）造成受限于那些临时性的解决方案及数据丢失。相反，我更倾向于使用那些可以让我投入时间和精力打理并能长久使用的解决方案。

这一（相当长的）攻略 **并不仅仅适用于图像文件** ：我将进一步阐述像是文件夹结构，文件的命名规则，等等许多领域的事情。因此，这些规范适用于我所能接触到的所有类型的文件。

在我开始传授我的方法之前，我们应该先就我将要介绍方法的达成一个共识，那就是我们是否有相同的需求。如果你对[raw 图像格式][3]十分推崇，将照片存储在云端或其他你信赖的地方（对我而言可能不会），那么你可能不会认同这篇文章将要描述的方式了。请根据你的情况来灵活做出选择。

### 我的需求

对于 **将照片（或视频）从我的数码相机中导出到电脑里**，我仅仅将 SD 卡茶道我的电脑里并调用 fetch-workflow 软件。这一步也完成了 **图像软件的预处理** 适用于我提出的文件命名规范（下文会具体论述）同时也可以将图片旋转至正常的方向（而不是横着）。

这些文件将会被存入到我的摄影收藏文件夹 `$HOME/tmp/digicam/`。 在这一文件夹中我希望能完成以下的操作 **浏览图像和视频文件** 以便于 **整理排序/删除，重命名，添加/移除标签，以及将一系列相关的文件移动到相应的文件夹中**。

在完成这些以后，我将会**浏览包含图像/电影文件集的文件夹**。在极少数情况下，我希望**在独立的图像处理工具**中打开一个图像文件，比如[GIMP][4]。如果仅是为了**旋转JPEG文件**，我想找到一个快速的方法，不需要图像处理工具，这是旋转JPEG图像[无损的方式][5]。

我的数码相机支持用[GPS][6]坐标标记图像。因此，我需要一个方法来**可视化GPS坐标的单个文件以及一组文件**显示我走过的路径。

我想安利的另一个好功能是:假设你在威尼斯度假时拍了几百张照片。每一个都很漂亮，所以你每张都舍不得删除。另一方面，你可能想要一组更小的照片，送给家里的朋友。而且，为了不让他们过于嫉妒，他们可能只希望看到20多张照片。因此，我希望能够**定义并显示一组特定的照片**。

就独立性和**避免锁定效应**而言，我不想使用那种一旦公司停止产品或服务就无法使用的工具。出于同样的原因，由于我是一个注重隐私的人，**我不想使用任何基于云的服务**。为了让自己对新的可能性保持开放的心态，我不希望仅在一个特定的操作系统平台上倾注全部的精力。**基本的东西必须在任何平台上可用**(查看、导航、……)。但是**全套需求必须在GNU/Linux上运行**且我选择Debian GNU/Linux。

在我传授当前针对上述大量需求的解决方案之前，我必须解释一下我的一般文件夹结构和文件命名约定，我也使用它来命名数码照片。但首先，你必须认清一个重要的事实:

#### iPhoto, Picasa, 诸如此类应被认为是有害的

管理照片集合的软件工具确实提供了相当酷的功能。他们提供了一个良好的用户界面，并试图为你提供各种需求的舒适的工作流程。

这些软件的功能和我的个人需求之间的差异很大。它们几乎对所有东西都使用专有的存储格式:图像文件、元数据等等。这是一个大问题，当你打算在几年内换一个不同的软件。相信我:总有一天你会因为多种原因而改变。

如果你现在正打算更换 相应的工具，你将会意识到iPhoto或Picasa确实分别存储原始图像文件和你对它们所做的所有操作。旋转图像，向图像文件添加描述，标签，裁剪，等等，如果你不能导出并重新导入到新工具，那么**所有的东西都将永远丢失**。而无损的进行转换和迁移几乎是不可能的。

我不想在一个会锁住我工作的工具上投入任何精力。**我也拒绝把自己绑定在任何专有工具上**。我是一个过来人，希望你们吸取我的经验。

这就是我在文件名中保留时间戳、图像描述或标记的原因。文件名是永久性的，除非我手动更改它们。当我把照片备份或复制到u盘或其他操作系统时，它们不会丢失。每个人都能读懂。任何未来的系统都能够处理它们。

### 我的文件命名规范

这里有一个我在 [2018 Linuxtage Graz 大会][44]上给出的[演讲][45],其中详细阐述了我的在本文中提到的想法和工作流程。

我所有的文件都与一个特定的日期或时间有关，根据所采用的[ISO 8601][7]规范，我采用的是**日期-标记**或**时间-标记**

带有日期戳和两个标签的示例文件名:`2014-05-09 42号项目的预算 -- 金融公司.csv`

带有时间戳(甚至包括可选秒)和两个标签的示例文件名:`2014-05-09T22.19.58 Susan展示她的新鞋子 -- 家庭衣物.jpg`

由于冒号不适用于Windows[文件系统NTFS][8]，所以我必须使用已采用的ISO时间戳。因此，我用点代替冒号，以便将小时与分钟区别开来。

如果是**时间或持续的一段时间**，我会将两个日期或时间戳用两个负号分开:`2014-05-09—2014-05-13爵士音乐节Graz—folder 旅游音乐.pdf`。

文件名中的时间/日期戳的优点是，除非我手动更改它们，否则它们保持不变。当通过某些不处理这些元数据的软件进行处理时，包含在文件内容本身中的元数据(如[Exif][9])往往会丢失。此外，使用这样的日期/时间戳启动文件名可以确保文件按时间顺序显示，而不是按字母顺序显示。字母表是一种[完全人工的排序顺序][10]，对于用户定位文件通常不太实用。

当我想将**tags**关联到文件名时，我将它们放在原始文件名和[文件名扩展名][11]之间，中间用空格、两个减号和一个额外的空格分隔"`--`"。我的标签是小写的英文单词，不包含空格或特殊字符。有时，我可能会使用`quantifiedself`或`usergenerated`等连接词。我[倾向于选择一般类别][12]，而不是太过具体的描述标签。我用这一方式在Twitter [hashtags][13]上重用标记、文件名、文件夹名、书签、诸如此类的博客条目等等。

标签作为文件名的一部分有几个优点。通过使用常用的桌面搜索引擎，你可以在标签的帮助下定位文件。文件名称中的标签不能因为在不同的存储介质上复制而丢失。当系统使用与文件名不同的存储位置如:元数据数据库、[dot-files][14]、[备用数据流][15]等，通常会发生这种情况

当然，在一般的文件和文件夹名称中，**请避免使用特殊字符**，umlauts，冒号等。尤其是在不同操作系统平台之间同步文件时。

我的**文件夹名命名约定**与文件的相应规范相同。

注意:由于[Memacs][17]的[filenametimestamp][16]-module的聪明之处，所有带有日期/时间戳的文件和文件夹都在同一时间/天出现在我的组织模式日历(agenda)上。这样，我就能很好地了解当天发生了什么，包括我拍的所有照片。

### 我的一般文件夹结构

在本节中，我将描述主文件夹中最重要的文件夹。注意:这可能在将来的被移动到一个独立的页面。或许不是。让我们等着瞧:-)
很多东西只有在一定的时间内才会引起人们的兴趣。这些内容包括快速浏览其内容的下载、解压缩文件以检查包含的文件、一些有趣的小内容等等。对于**临时的东西**，我有 `$HOME/tmp/ ` 子层次结构。新照片放在`$HOME/tmp/digicam/`中。我从CD、DVD或USB记忆棒临时复制的东西放在`$HOME/tmp/fromcd/`中。每当软件工具需要用户文件夹层次结构中的临时数据时，我就使用` $HOME/tmp/Tools/ `作为起点。我经常使用的文件夹是`$HOME/tmp/2del/`:`2del`的意思是“随时可以删除”。例如，我所有的浏览器都使用这个文件夹作为默认的下载文件夹。如果我需要在机器上腾出空间，我首先查看这个`2del`-文件夹，用于删除内容。

与上面描述的临时文件相比，我当然也想将文件**保存更长的时间**。这些文件被移动到我的`$HOME/archive/`子层次结构中。它有几个子文件夹备份,web /下载我想保留,二进制文件我要存档,索引文件的可移动媒体(CD, DVD,记忆棒、外部硬盘驱动器),和一个文件夹用来存档(和寻找一个合适的的目标文件夹)在不久的将来。有时，我太忙或没有耐心的时候将文件妥善整理。是的，那就是我，我甚至有一个名为`现在不要整理我`的文件夹。这对你而言是否很怪？:-)

我的归档中最重要的子层次结构是 `$HOME/archive/events_memories/ `及其子文件夹` 2014/ `、` 2013/ `、` 2012/ `等等。正如你可能已经猜到的，每个年份有一个**子文件夹**。其中每个文件中都有单个文件和文件夹。这些文件是根据我在前一节中描述的文件名约定命名的。文件夹名称符合“YYYY-MM-DD”[ISO 8601][7] 日期标签开头，后面跟着一个具有描述性的名称，如`$HOME/archive/events_memories/2014/2014-05-08 Business marathon with /`。在这些与日期相关的文件夹中，我保存着各种与特定事件相关的文件:照片、(扫描的)pdf文件、文本文件等等。

对于**共享数据**，我设置一个`$HOME/share/`子层次结构。这是我的Dropbox文件夹，我用各种各样的方法(比如[unison][18])来分享数据。我也在我的设备之间共享数据:家里的Mac Mini，家里的GNU/Linux笔记本，Android手机，root-server(我的个人云)，工作时的windows笔记本。我不想在这里详细说明我的同步设置。如果你想了解相关的设置，可以参考另一篇相关的文章。:-)

在我的` $HOME/ templates_tags / `子层次结构中，我保存了各种**模板文件** ([LaTeX][19]， 脚本，…)，剪辑和**logos**，等等。

我的**Org-mode**文件,主要是保存在`$ HOME /org/`。我练习保持记忆，并没有解释我有多喜欢 [Emacs/Org-mode][20]以及这我从中获益多少。你可能读过或听过我详细描述我用它做的很棒的事情。具体可以在我的博客上查找[我的' emacs '标签][21]，在twitter上查找[hashtag ' #orgmode '][22]。

以上就是我最重要的文件夹子层次结构设置方式。

### 我的工作流程

Tataaaa，在你了解了我的文件夹结构和文件名约定之后，下面是我当前的工作流程和工具，我使用它们来满足我前面描述的需求。
请注意，**你必须知道你在做什么**。我这里的示例及文件夹路径和更多只**适用我的机器或我的设置的文件夹路径**。你必须采用**相应的路径、文件名等**来满足你的需求!

#### 工作流程:将文件从SD卡移动到笔记本电脑，旋转人像图像，并重命名文件

当我想把数据从我的数码相机移到我的GNU/Linux笔记本上时，我拿出它的mini sd存储卡，把它放在我的笔记本上。然后它会自动挂载在` /media/digicam `上。

然后，调用[getdigicamdata]。它做了如下几件事:它将文件从SD卡移动到一个临时文件夹中进行处理。原始文件名会转换为小写字符。使用[jhead][24]旋转所有人像照片。同样使用jhead，我从Exif头时间戳生成文件名称时间戳。使用[date2name][25]，我将时间戳添加到电影文件中。处理完所有这些文件后，它们将被移动到新的digicam文件的目标文件夹:$HOME/tmp/digicam/tmp/~。

#### 工作流程:文件夹索引、查看、重命名、删除图像文件

为了快速浏览我的图像和电影文件，我更喜欢在GNU/Linux上使用[geeqie][26]。这是一个相当轻量级的图像浏览器，它具有其他文件浏览器所缺少的一大优势:我可以通过键盘快捷方式调用的外部脚本/工具。通过这种方式，我可以通过任意的外部命令扩展图像浏览器的特性。

基本的图像管理功能是内置在geeqie:索引我的文件夹层次结构，在窗口模式或全屏查看图像(快捷键' f ')，重命名文件名，删除文件，显示Exif元数据(快捷键` Ctrl-e `)。

在OS X上，我使用[Xee][27]。与geeqie不同，它不能通过外部命令进行扩展。不过，基本的导航、查看和重命名功能也是可用的。

#### 工作流:添加和删除标签

我创建了一个名为[filetags][28]的Python脚本，用于向单个文件以及一组文件添加和删除标记。

对于数码照片，我使用标签，例如，`specialL`用于我认为适合桌面背景的风景图片，`specialP`用于我想展示给其他人的人像照片，`sel`用于筛选，等等。

##### 使用geeqie初始设置文件标签

向geeqie添加文件标签是一个手动步骤:`编辑>首选项>配置编辑器…`然后创建一个带有`New`的附加条目。在这里，你可以定义一个新的桌面文件，如下所示:

add-tags.desktop
```
[Desktop Entry]
Name=filetags
GenericName=filetags
Comment=
Exec=/home/vk/src/misc/vk-filetags-interactive-adding-wrapper-with-gnome-terminal.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;

```

包装器脚本的`vk-filetags-interactive-adding-wrapper-with-gnome-terminal.sh `是必须的，因为我想要弹出一个新的终端，以便添加标签到我的文件:

vk-filetags-interactive-adding-wrapper-with-gnome-terminal.sh
```
#!/bin/sh

/usr/bin/gnome-terminal \
 --geometry=85x15+330+5 \
 --tab-with-profile=big \
 --hide-menubar \
 -x /home/vk/src/filetags/filetags.py --interactive "${@}"

#end

```

在geeqie中，你可以在` Edit > Preferences > Preferences…>键盘`。我将`t`与`filetags`命令相关联。

标签脚本还能够从单个文件或一组文件中删除标记。它基本上使用与上面相同的方法。唯一的区别是文件标签脚本额外的`--remove`参数:

remove-tags.desktop
```
[Desktop Entry]
Name=filetags-remove
GenericName=filetags-remove
Comment=
Exec=/home/vk/src/misc/vk-filetags-interactive-removing-wrapper-with-gnome-terminal.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;

```

vk-filetags-interactive-removing-wrapper-with-gnome-terminal.sh
```
#!/bin/sh

/usr/bin/gnome-terminal \
 --geometry=85x15+330+5 \
 --tab-with-profile=big \
 --hide-menubar \
 -x /home/vk/src/filetags/filetags.py --interactive --remove "${@}"

#end

```

为了删除标签，我为`T`参数创建了一个键盘快捷方式。

##### 在geeqie中使用文件标签

当我在geeqie文件浏览器中浏览图像文件时，我选择要标记的文件(一到多个)并按`t`。然后，一个小窗口弹出，要求我提供一个或多个标签。在 ` Return ` 命令确认后，这些标签被添加到文件名中。

删除标签也是一样:选择多个文件，按下`T`，输入要删除的标签，然后用`Return`确认。就是这样。几乎没有[更简单的方法来添加或删除标签到文件][29]。

#### 工作流:使用appendfilename重命名高级文件

##### 不使用 appendfilename

重命名一组大型文件可能是一个冗长乏味的过程。对于`2014-04-20T17.09.11_p1100386.jpg`这样的原始文件名，在文件名中添加描述的过程相当烦人。你将按`Ctrl-r`(重命名)在geeqie打开文件重命名对话框。默认情况下，原始名称(没有文件扩展名的文件名称)被标记。因此，如果不希望删除/覆盖文件名(但要追加)，则必须按下光标键` <right> `。然后，光标放在基本名称和扩展名之间。输入你的描述(不要忘记初始空格字符)，并用`Return`进行确认。

##### 在 geeqie 使中用 appendfilename

使用[appendfilename][30]，我的过程得到了简化，可以获得将文本附加到文件名的最佳用户体验:当我在geeqie中按下` a ` (append)时，会弹出一个对话框窗口，询问文本。在`Return`确认后，输入的文本将放置在时间戳和可选标记之间。

例如，当我在`2014-04-20T17.09.11_p1100386.jpg`上按下`a`，然后在`Graz`中键入`Pick-nick in Graz`时，文件名变为`2014-04-20T17.09.11_p1100386 Pick-nick in Graz.jpg`。当我再次按下`a`并输入`with Susan`时，文件名变为`2014-04-20T17.09.11_p1100386 Pick-nick in Graz with Susan.jpg`。当文件名也获得标记时，附加的文本将附加在标记分隔符之前。

这样，我就不必担心覆盖时间戳或标记。重命名的过程对我来说变得更加有趣!

最好的部分是:当我想要将相同的文本添加到多个选定的文件中时，也可以使用appendfilename。

##### 使用 geeqie 初始 appendfilename

添加一个额外的编辑器到geeqie: ` Edit > Preferences > Configure editor…>New`。然后输入桌面文件定义:

appendfilename.desktop
```
[Desktop Entry]
Name=appendfilename
GenericName=appendfilename
Comment=
Exec=/home/vk/src/misc/vk-appendfilename-interactive-wrapper-with-gnome-terminal.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;

```

同样，我也使用了一个包装脚本，它将为我打开一个新的终端:

vk-appendfilename-interactive-wrapper-with-gnome-terminal.sh
```
#!/bin/sh

/usr/bin/gnome-terminal \
 --geometry=90x5+330+5 \
 --tab-with-profile=big \
 --hide-menubar \
 -x /home/vk/src/appendfilename/appendfilename.py "${@}"

#end

```

#### 工作流程:播放电影文件

在GNU/Linux上，我使用[mplayer][31]回放视频文件。由于geeqie本身不播放电影文件，所以我必须创建一个设置，以便在mplayer中打开电影文件。

##### 在geeqie中初始化mplayer的设置

我已经使用[xdg-open][32]将电影文件扩展名关联到mplayer。因此，我只需要为geeqie创建一个通用的“open”命令，使用xdg-open打开任何文件及其关联的应用程序。

再次访问` Edit > Preferences > Configure editor…`在geeqie中添加`open`的条目:

open.desktop
```
[Desktop Entry]
Name=open
GenericName=open
Comment=
Exec=/usr/bin/xdg-open %F
Icon=
Terminal=true
Type=Application
hidden=false
NOMimeType=*;
MimeType=image/*;video/*
Categories=X-Geeqie;

```

当你将快捷方式`o`(见上文)与geeqie关联时，你就能够打开与其关联的应用程序的视频文件(和其他文件)。

##### 使用xdg-open打开电影文件(和其他文件)

在上面的设置过程之后，当你的geeqie光标位于文件上方时，你只需按下`o`即可。就是如此简洁。

#### 工作流:在外部图像编辑器中打开

我不太希望能够在GIMP中快速编辑图像文件。因此，我添加了一个快捷方式`g`，并将其与外部编辑器“GNU图像处理程序”(GIMP)关联起来，geeqie已经默认创建了该程序

这样，只需按下`g`就可以打开GIMP中的当前图像。

#### 工作流程:移动到存档文件夹

现在我已经在我的文件名中添加了注释，我想将单个文件移动到`$HOME/archive/events_memories/2014/`，或者将一组文件移动到这个文件夹中的新文件夹中，如`$HOME/archive/events_memories/2014/2014-05-08 business marathon after show - party`。

通常的方法是选择一个或多个文件，并将它们移动到具有快捷方式`Ctrl-m`的文件夹中。

何等繁复无趣之至！

因此，我(再次)编写了一个Python脚本，它为我完成了这项工作:[move2archive][33](简而言之:` m2a `需要一个或多个文件作为命令行参数。然后，出现一个对话框，我可以在其中输入一个可选文件夹名。当我不输入任何东西，但按`Return`，文件被移动到相应年份的文件夹。当我输入一个类似`business marathon after show - party`的文件夹名称时，第一个图像文件的日期戳被附加到该文件夹(`$HOME/archive/events_memories/2014/2014-05-08 business marathon after show - party`)，得到的文件夹是(`$HOME/archive/events_memories/2014/2014-05-08 Business-Marathon After-Show-Party`)，并移动文件。

我在geeqie中再一次选择一个或多个文件，按`m`(移动)，或者只按`Return`(没有特殊的子文件夹)，或者输入一个描述性文本，这是要创建的子文件夹的名称(可选不带日期戳)。

**没有一个图像管理工具像我的geeqie一样通过快捷键快速且有趣的使用 appendfilename和move2archive完成工作。**

##### 在 geeqie 里初始化 m2a 的相关设置

同样，向geeqie添加`m2a`是一个手动步骤:“编辑>首选项>配置编辑器……”然后创建一个带有“New”的附加条目。在这里，你可以定义一个新的桌面文件，如下所示:

m2a.desktop
```
[Desktop Entry]
Name=move2archive
GenericName=move2archive
Comment=Moving one or more files to my archive folder
Exec=/home/vk/src/misc/vk-m2a-interactive-wrapper-with-gnome-terminal.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;

```
包装器脚本的`vk-m2a-interactive-wrapper-with-gnome-terminal.sh `是必要的，因为我想要弹出一个新的终端窗口，以便我的文件进入我指定的目标文件夹:

vk-m2a-interactive-wrapper-with-gnome-terminal.sh
```
#!/bin/sh

/usr/bin/gnome-terminal \
 --geometry=157x56+330+5 \
 --tab-with-profile=big \
 --hide-menubar \
 -x /home/vk/src/m2a/m2a.py --pauseonexit "${@}"

#end

```

在geeqie中，你可以在`Edit > Preferences > Preferences ... > Keyboard`将`m`与`m2a`命令相关联。

#### 工作流程:旋转图像(无损)

通常，我的数码相机会自动将人像照片标记为人像照片。然而，在某些特定的情况下(比如从主题上方拍照)，我的相机会出错。在那些**罕见的情况下**，我必须手动修正方向。

你必须知道，JPEG文件格式是一种有损格式，应该只用于照片，而不是计算机生成的东西，如屏幕截图或图表。以傻瓜方式旋转JPEG图像文件通常会解压/可视化图像文件，旋转生成新的图像，然后重新编码结果。这将导致生成的图像[比原始图像质量差得多][5]。

因此，你应该使用无损方法来旋转JPEG图像文件。

再一次，我添加了一个“外部编辑器”到geeqie:`Edit > Preferences > Configure Editors ... > New`。在这里，我添加了两个条目:一个用于旋转270度(即逆时针旋转90度)，另一个用于使用[exiftran][34]旋转90度(逆时针旋转90度):

rotate-270.desktop
```
[Desktop Entry]
Version=1.0
Type=Application
Name=Losslessly rotate JPEG image counterclockwise

# call the helper script
TryExec=exiftran
Exec=exiftran -p -2 -i -g %f

# Desktop files that are usable only in Geeqie should be marked like this:
Categories=X-Geeqie;
OnlyShowIn=X-Geeqie;

# Show in menu "Edit/Orientation"
X-Geeqie-Menu-Path=EditMenu/OrientationMenu

MimeType=image/jpeg;

```

rotate-90.desktop
```
[Desktop Entry]
Version=1.0
Type=Application
Name=Losslessly rotate JPEG image clockwise

# call the helper script
TryExec=exiftran
Exec=exiftran -p -9 -i -g %f

# Desktop files that are usable only in Geeqie should be marked like this:
Categories=X-Geeqie;
OnlyShowIn=X-Geeqie;

# Show in menu "Edit/Orientation"
X-Geeqie-Menu-Path=EditMenu/OrientationMenu

# It can be made verbose
# X-Geeqie-Verbose=true

MimeType=image/jpeg;

```

我为“[”(逆时针方向)和“]”(逆时针方向)创建了geeqie快捷键。

#### 工作流程:可视化GPS坐标

我的数码相机有一个GPS传感器，它在JPEG文件的Exif元数据中存储当前的地理位置。位置数据以[WGS 84][35]格式存储，如“47,58,26.73;16、23、55.51”(纬度;经度)。这一方式可读性较差，从我所期望的意义上讲:要么是地图，要么是位置名称。因此，我向geeqie添加了一些功能，这样我就可以在[OpenStreetMap][36]上看到单个图像文件的位置: `Edit > Preferences > Configure Editors ... > New`

photolocation.desktop
```
[Desktop Entry]
Name=vkphotolocation
GenericName=vkphotolocation
Comment=
Exec=/home/vk/src/misc/vkphotolocation.sh %F
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/bmp;image/gif;image/jpeg;image/jpg;image/pjpeg;image/png;image/tiff;image/x-bmp;image/x-gray;image/x-icb;image/x-ico;image/x-png;image/x-portable-anymap;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/x-xbitmap;image/x-xpixmap;image/x-pcx;image/svg+xml;image/svg+xml-compressed;image/vnd.wap.wbmp;

```

这就调用了我的名为`vkphotolocation.sh`的包装脚本，它使用[ExifTool][37]让[Marble][38]能够读取和可视化的适当格式并提取坐标:

vkphotolocation.sh
```
#!/bin/sh

IMAGEFILE="${1}"
IMAGEFILEBASENAME=`basename ${IMAGEFILE}`

COORDINATES=`exiftool -c %.6f "${IMAGEFILE}" | awk '/GPS Position/ { print $4 " " $6 }'`

if [ "x${COORDINATES}" = "x" ]; then
 zenity --info --title="${IMAGEFILEBASENAME}" --text="No GPS-location found in the image file."
else
 /usr/bin/marble --latlon "${COORDINATES}" --distance 0.5
fi

#end

```

映射到键盘快捷键“G”，我可以快速地得到**单个图像文件的映射位置位置**。

当我想将多个JPEG图像文件的**位置可视化为路径**时，我使用[GpsPrune][39]。我无法派生出GpsPrune将一组文件作为命令行参数的方法。正因为如此，我必须手动启动GpsPrune，`选择一组文件或一个文件夹>添加照片`。

通过这种方式，我可以为OpenStreetMap地图上的每个JPEG位置获得一个点(如果配置为这样)。通过单击这样一个点，我可以得到相应图像的详细信息。

如果你恰好在国外拍摄照片，可视化GPS位置对**在文件名中添加描述**大有帮助!

#### 工作流程:根据GPS坐标过滤照片

这并非我的工作流程。为了完整起见，我列出该工作流对应工具的特性。我想做的就是从一大堆图片中寻找那些在一定区域内(范围或点+距离)的照片。

到目前为止，我只找到了[DigiKam][40]，它能够[根据矩形区域进行过滤][41]。如果你知道其他工具，请将其添加到下面的评论或写一封电子邮件。

#### 工作流:显示给定集合的子集

如上面的需求所述，我希望能够在一个文件夹中定义一组子文件，以便将这个小集合呈现给其他人。

工作流程非常简单:我向选择的文件添加一个标记(通过` t ` /filetags)。为此，我使用标记`sel`，它是“selection”的缩写。在标记了一组文件之后，我可以按下` s `，它与一个脚本相关联，该脚本只显示标记为` sel `的文件。

当然，这也适用于任何标签或标签组合。因此，用同样的方法，你可以得到一个适当的概述，你的婚礼上的所有照片都标记着“教堂”和“戒指”。

很棒的功能，不是吗?:-)

##### 根据标签和geeqie初始设置文件标签

你必须定义一个额外的“外部编辑器”:`Edit > Preferences > Configure Editors ... > New`:

filter-tags.desktop
```
[Desktop Entry]
Name=filetag-filter
GenericName=filetag-filter
Comment=
Exec=/home/vk/src/misc/vk-filetag-filter-wrapper-with-gnome-terminal.sh
Icon=
Terminal=true
Type=Application
Categories=Application;Graphics;
hidden=false
MimeType=image/*;video/*;image/mpo;image/thm
Categories=X-Geeqie;

```

再次调用我编写的包装脚本:

vk-filetag-filter-wrapper-with-gnome-terminal.sh
```
#!/bin/sh

/usr/bin/gnome-terminal \
 --geometry=85x15+330+5 \
 --hide-menubar \
 -x /home/vk/src/filetags/filetags.py --filter

#end

```

带参数`--filter`的`filetags`基本上完成的是:用户被要求输入一个或多个标签。然后，当前文件夹中所有匹配的文件都能使用[符号链接][42]都链接到` $HOME/.filetags_tagfilter/ `。然后，启动一个新的geeqie实例，显示链接的文件。

在退出这个新的geeqie实例之后，你将从该实例调用了选择过程中看到旧的geeqie实例。

#### 用一个真实的案例来总结

Wow, 这是一篇很长的博客文章。难怪你可能已经忘了之前的概述。总结一下我在geeqie(扩展了标准功能集)中可以做的事情，我有一个很酷的总结:

快捷功能 `m` m2a `o` 打开（针对非图像文件） `a` 在文件名里添加字段 `t` 文件标签（添加） `T` 文件标签（删除） `s` 文件标签（排序） `g` gimp `G` 显示GPS信息 `[` 无损的逆时针旋转 `]` 无损的顺时针旋转 `Ctrl-e` EXIF图像信息 `f` 全屏显示

一些针对文件名的(包括它的路径)及我用来操作组件的示例:
```
 /this/is/a/folder/2014-04-20T17.09 Pick-nick in Graz -- food graz.jpg
 [ m2a ] [ date2name ] [ appendfilename ] [filetags]

```
在示例中，我按照以下步骤将照片从相机保存到存档:我将SD存储卡放入计算机的SD卡读卡器中。然后我运行[getdigicamdata.sh][23]。完成之后，我在geeqie中打开`$HOME/tmp/digicam/tmp/`。我浏览了一下照片，把那些不成功的删除了。如果有一个图像的方向错误，我用`[`or`]`纠正它。

在第二步中，我向我认为值得评论的文件添加描述(` a `)。每当我想添加标签时，我也这样做:我快速地标记所有应该共享标签的文件(` Ctrl ` \+鼠标点击)，并使用[filetags][28] (` t `)进行标记。

要组合来自给定事件的文件，我选中相应的文件，将它们移动到年度归档文件夹中的“event-folder”,并通过在[move2archive][33] (`m `)中键入事件描述，其余的(非特殊的文件夹)由move2archive (`m `)直接移动到年度归档中，而不需要声明事件描述。

为了完成我的工作流程，我删除了SD卡上的所有文件，把它从操作系统上弹出，然后把它放回我的数码相机里。

以上。

因为这种工作流程几乎不需要任何开销，所以评论、标记和归档照片不再是一项乏味的工作。

### 最后

所以，这是一个详细描述我关于照片和电影的工作流程的叙述。你可能已经发现了我可能感兴趣的其他东西。所以请不要犹豫，请使用下面的链接留下评论或电子邮件。

我也希望得到反馈，如果我的工作流程适用于你。并且:如果你已经发布了你的工作流程或者找到了其他人工作流程的描述，也请留下评论!

及时行乐，莫让错误的工具或低效的方法浪费了我们的人生!

### 其他工具

阅读关于[本文中关于 gThumb 的部分][43].

当你觉得你以上文中所叙述的符合你的需求时，请根据相关的建议来选择对应的工具。




--------------------------------------------------------------------------------

via: http://karl-voit.at/managing-digital-photographs/

作者：[Karl Voit][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://karl-voit.at
[1]:https://en.wikipedia.org/wiki/Jpeg
[2]:http://en.wikipedia.org/wiki/Vendor_lock-in
[3]:https://en.wikipedia.org/wiki/Raw_image_format
[4]:http://www.gimp.org/
[5]:http://petapixel.com/2012/08/14/why-you-should-always-rotate-original-jpeg-photos-losslessly/
[6]:https://en.wikipedia.org/wiki/Gps
[7]:https://en.wikipedia.org/wiki/Iso_date
[8]:https://en.wikipedia.org/wiki/Ntfs
[9]:https://en.wikipedia.org/wiki/Exif
[10]:http://www.isisinform.com/reinventing-knowledge-the-medieval-controversy-of-alphabetical-order/
[11]:https://en.wikipedia.org/wiki/File_name_extension
[12]:http://karl-voit.at/tagstore/en/papers.shtml
[13]:https://en.wikipedia.org/wiki/Hashtag
[14]:https://en.wikipedia.org/wiki/Dot-file
[15]:https://en.wikipedia.org/wiki/NTFS#Alternate_data_streams_.28ADS.29
[16]:https://github.com/novoid/Memacs/blob/master/docs/memacs_filenametimestamps.org
[17]:https://github.com/novoid/Memacs
[18]:http://www.cis.upenn.edu/~bcpierce/unison/
[19]:https://github.com/novoid/LaTeX-KOMA-template
[20]:http://orgmode.org/
[21]:http://karl-voit.at/tags/emacs
[22]:https://twitter.com/search?q%3D%2523orgmode&src%3Dtypd
[23]:https://github.com/novoid/getdigicamdata.sh
[24]:http://www.sentex.net/%3Ccode%3Emwandel/jhead/
[25]:https://github.com/novoid/date2name
[26]:http://geeqie.sourceforge.net/
[27]:http://xee.c3.cx/
[28]:https://github.com/novoid/filetag
[29]:http://karl-voit.at/tagstore/
[30]:https://github.com/novoid/appendfilename
[31]:http://www.mplayerhq.hu
[32]:https://wiki.archlinux.org/index.php/xdg-open
[33]:https://github.com/novoid/move2archive
[34]:http://manpages.ubuntu.com/manpages/raring/man1/exiftran.1.html
[35]:https://en.wikipedia.org/wiki/WGS84#A_new_World_Geodetic_System:_WGS_84
[36]:http://www.openstreetmap.org/
[37]:http://www.sno.phy.queensu.ca/~phil/exiftool/
[38]:http://userbase.kde.org/Marble/Tracking
[39]:http://activityworkshop.net/software/gpsprune/
[40]:https://en.wikipedia.org/wiki/DigiKam
[41]:https://docs.kde.org/development/en/extragear-graphics/digikam/using-kapp.html#idp7659904
[42]:https://en.wikipedia.org/wiki/Symbolic_link
[43]:http://karl-voit.at/2017/02/19/gthumb
[44]:https://glt18.linuxtage.at
[45]:https://glt18-programm.linuxtage.at/events/321.html
