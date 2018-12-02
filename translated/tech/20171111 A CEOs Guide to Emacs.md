一位 CEO 的 Emacs 指南
============================================================

几年前，不，是几十年前，我就在用 Emacs。不论是码代码、编写文档，还是管理邮件和日程，我都用这个编辑器或者是说操作系统，而且我还乐此不疲。多年过去了，我也转向了其他更新，更好的工具。结果，我已经忘了如何在不用鼠标的情况下来浏览文件。大约三个月前，我意识到我在应用程序和计算机之间切换上耗费了大量的时间，于是就决定再试一次 Emacs。这是个很正确的决定，原因有以下几个。其中包括了 `.emacs` 和 Dropbox 的技巧，可以让你建立一个良好的，可移植的环境。

对于那先还没用过 Emacs 的人来说，你可能会讨厌它，但也可能喜欢上它。它有点像一个房子大小的 Rube Goldberg 机器，乍一看，它具备烤面包机的所有功能。这听起来不像是一种认可，但关键短语是“乍一看”。一旦你了解了Emacs，你就会意识到它其实是一种可以作为发动机的热核烤面包机。好吧，你想对文字做什么都可以。当考虑到计算寿命在很大程度上与文本有关时，这是一个相当大胆的声明，真的很大胆。

也许对我来说更重要的是，它是我曾经使用过的一个应用程序，并让我觉得我真正的拥有它，而不是把我塑造成一个匿名的“用户”，就好像位于 [Soma][30] 或 Redmond 附近某个高档办公室的产品营销部门把钱作为明确的目标一样。现代生产力和创作应用程序（如文件或 `IDE`）就像碳纤维赛车，他们装备得很好，也很完整。而Emacs 就像一盒经典的 [Campagnolo][31] 零件和一个漂亮的拖钢框架，缺少曲柄臂和刹车杆，你必须在网上某个小众文化中找到它们。第二点就是它会给你带来无尽的快乐或烦恼，这取决于你自己，而且会一直持续到你生命的最后一天。我是那种在找到一堆老古董或用 `Emacs Lisp` 配置编辑器时同样感到高兴的人，具体情况因人而异。

![1933 steel bicycle](https://blog.fugue.co/assets/images/bicycle.jpg)
一辆我还在骑的1933年产的钢制自行车。你可以从查看框架管差别： [https://www.youtube.com/watch?v=khJQgRLKMU0][6].

这可能给人一种 Emacs 已经过气或过时的印象。但它不是，它是强大和永恒的，只要你耐心地去理解它的一些规则。他的规则很另类，也很奇怪，但其中的逻辑却引人注目，且很有魅力。对于我来说， Emacs 更像是未来而不是过去。就像牵引式钢框架在未来几十年里将会变得好用和舒适，而神奇的碳纤维自行车将会被扔进垃圾场，在撞击中粉碎一样，Emacs 也将会作为一种在最新的流行应用早已被遗忘的时候的好用的工具继续存在这。

如果通过编辑 `Lisp` 代码来构建自己的个人工作环境，并将这种非常适合自己的环境移植到任何计算机的想法吸引了你，那么你可能会爱上 Emacs。如果你喜欢很潮、很炫的，又不想投入太多时间和精力的情况下就能直接工作的话，那么它可能不适合你。我已经不再写代码了（除了 `Ludwig` 和 `Emacs Lisp`），但是 `Fugue` 的很多工程师都使用 Emacs 来提高码代码的效率。我公司有 30% 的工程师用 Emacs， 40% 用 `IDE` 和 30% 的用 vim。但这篇文章是关于 CEO 和其他[聪明的老板][32]（PHB<sup>[1][7]</sup>）的 Emacs 指南，所以我将解释或者说辩解我为什么喜欢它以及我如何使用它。同时我也希望我能介绍清楚从而让你能有个良好的体验，而不是花上几个小时去 Google。

### 最后的优点

使用 Emacs 带来的长期优势是让生活更轻松。与最后的收获相比，最开始的付出完全值得。想想这些:

### 无需上下文切换

`Org` 模式本身就值得花时间，但如果你像我一样，你通常要处理十几份左右的文件 —— 从博客帖子到会议需要做什么的清单，再到员工评论。在现代计算世界中，这通常意味着要使用多个应用程序，所有这些应用程序都有不同的用户界面，保存方式、排序和搜索方式。结果就是你需要不断转换思维环境，记住细节。我讨厌上下文切换，因为它是一种强加到我身上的方式，原因是破坏了接口模型<sup>[2][8]</sup>，并且我讨厌记住计算机的命令，这本该是计算机要记住的东西。在单个环境下，Emacs 对 PHB 甚至比对于程序员更有用，因为程序员更多时候只需要专注于一个程序。转换思维环境的成本比通常看起来的要高。操作系统和应用程序供应商已经构建了各种接口，以分散我们对这一现实的注意力。如果你是技术人员，通过快捷键（`M-:`）来访问功能强大的[语言解释器][33]会方便的多<sup>[3][9]</sup>。

许多应用程序可以全天全屏并用于编辑文本。Emacs 是惟一的，因为它既是编辑器也是 `Emacs Lisp` 解释器。从本质上说，你工作时只要用电脑上的一两个键就能完成。如果你对编程略知一二，就能发现这一位置你可以在 Emacs 中做 _任何事情_。一旦你在内存中有了这些命令，你的电脑就可以在你工作时几乎实时地为你提供高效的运转。你不会想用 `Emacs Lisp`  来重建 Excel，只要用简单的一两行代码就能实现 Excel 中大多数的功能。如果我需要处理数字，我更有可能转到 scratch 缓冲区，编写一些代码，而不是打开电子表格。即便是我有一封多行的邮件要写，我通常也会先在 Emacs 中写完，然后再复制粘贴到邮件客户端中。当你可以流畅的书写时，为什么要去切换呢？你可以先从一两个简单的计算开始，随着时间的推移，你可以很容易的在 Emacs 中添加你所需要处理的计算。这在应用程序中可能是独一无二的，同时还提供了让为其他的人创造的丰富特性。还记得 Isaac Asimov 书中那些神奇的终端吗<sup>[4][10]</sup>？ Emacs 是我所遇到的最接近他们的东西。我决定不再用什么应用程序来做这个或那个。相反，我只是工作。拥有一个伟大的工具并致力于此，这才是真正的动力和效率。

### 在安静中创造事情

拥有我所发现的最好的文本编辑功能的最终结果是什么？有一群人在做各种各样有用的补充吗？拥有 `Lisp` 键盘的全部功能？这就是我用 Emacs 来完成所有的创作性工作，处理音乐和图片除外。

我的办公桌上有两个显示器。其中一块竖屏是将 Emacs 全天全屏显示，另一个显示浏览器，用来搜索和阅读，通常也会打开一个终端。我将日历、邮件等保存在 OS X 的另一个桌面上，当我使用 Emacs 时，这个桌面是隐藏的，同时我也会关掉所有通知。这样就能让我专注于我手头上在做的事了。我发现，在更现代的 UI 应用程序中，消除干扰几乎是不可能的，因为这些应用程序努力提供帮助并使其易于使用。我不需要经常被提醒该如何操作，我已经做了成千上万次了，我真正需要的是一张干净整洁的白纸用来思考。也许因为年龄和自己的“恶习”，我不太喜欢处在嘈杂的环境中，但我认为这值得一试。看看在你电脑环境中有一些真正的宁静是怎样的。当然，现在很多应用程序都有隐藏界面的模式，谢天谢地，苹果和微软现在都有了真正意义上的全屏模式。但是，没有并没有应用程序可以强大到足以“处理”大多数事务。除非你整天写代码，或者像写一本书一样处理很长的文档，否则你仍然会面临其他应用程序的干扰。而且，大多数现代应用程序似乎同时显得自视甚高，缺乏功能和可用性<sup>[5][11]</sup>。比其 office 应用程序，我更讨厌在线版的应用程序。

![1933 steel bicycle](https://blog.fugue.co/assets/images/desktop.jpg)
我的桌面布局， Emacs 在左边

但是交流呢？创造和交流之间的差别很大。当我为两者留出不同的时间时，我的效率会更高。在 `Fugue` 中使用了 `Slack`，痛并快乐着。我把它和我的日历、电子邮件放在一个即时通讯的桌面上，这样，当我正在做事时，我很高兴地能够忽略所有的聊天。仅仅是风投或董事会董事的一次懈怠，或一封电子邮件，就能让我立刻丢掉手头工作。但是，大多数事情通常可以等上一两个小时。

### 带上一切，并保留着

第三个原因是，我发现 Emacs 比其它的环境更有优势的是你可以很容易的用它来处理事务。我的意思是，你所需要的只是通过 `Dropbox` 类似的网站同步一两个目录，而不是让大量的应用程序以它们自己的方式进行交互和同步。然后，你可以在任何地方，任何环境下工作了，因为你已经精心制作了适合目的套件了。我在 OS X，Windows，或有时在 Linux 都是这样做的。它非常简单可靠。这种功能很有用，以至于我害怕处理页面、Google Docs、Office 或其他类型的文件和应用程序，这些文件和应用程序会迫使我回到文件系统或云中的某个地方去寻找。

永久存储在计算机上的限制是文件格式。假设人类已经解决了存储<sup>[6][12]</sup>的问题，随着时间的推移，我们面临的问题是我们能否够继续访问我们创建的信息。文本文件是最持久的计算格式。你可以用 Emacs 轻松地打开 1970 年的文本文件。然而对于办公应用程序却并非如此。同时文本文件要比 Office 应用程序数据文件小得多，也要好的多。作为一个数码背包迷，作为一个在脑子里一闪而过就会做很多小笔记的人，拥有一个简单、轻便、永久、随时可用的东西对我来说很重要。

如果你准备尝试 Emacs，请继续阅读！下面的部分不会取代完整的教程，但是在完成阅读时，就可以操作了。

### 学会驾驭 Emacs —— 一个专业的配置

所有这些强大、精神上的平静和安宁的代价是，Emacs 有一个陡峭的学习曲线，它的一切都与你以前所习惯的不同。一开始，这会让你觉得你是在浪费时间在一个过时和奇怪的应用程序上，就好像现代世界已经过去了。这有点像你只开过车，却要你去学骑自行车<sup>[7][13]</sup>。

### 该选哪个 Emacs

我用的是 GNU 中 OS X 和 Windows 的通用版本的 Emacs。你可以在 [][34][http://emacsformacos.com/][35] 获取 OS X 版本，在[][36][http://www.gnu.org/software/emacs/][37]获取 Windows 版本。市面上还有很多其他版本，尤其是 Mac 版本，但我发现，要做一些功能强大的东西（包括 `Lisp` 和许多模式），学习曲线要比实际操作低得多。下载，然后我们就可以开始了<sup>[8][14]</sup>！

### 首先，学会浏览

在本文中，我将约定 Emacs 中的键和组合。`C` 表示 `Control` 键，`M` 表示 `meta`（通常是 `Alt` 或 `Option` 键），以及用于组合键的连字符。因此，`C-h t` 表示同时按下 `Control` 和 `h` 键，然后释放，再按下 `t`。这个组快捷键会指向一个教程，这是你首先要做的一件事。

不要使用方向键或鼠标。它们可以工作，但是你应该给自己一周的时间来使用 Emacs 教程中的原生命令。一旦你这些命令变为了肌肉记忆，你可能就会乐在其中，无论到哪里，你都会非常想念它们。Emacs 教程在介绍它们方面做得很好，但是我将进行总结，所以您不需要阅读全部内容。最无聊的是，不用方向键，用 `C-b` 向前移动，用 `C-f` 向后移动，上一行用 `C-p`，下一行用 `C-n`。你可能会想：“我用方向键就很好，为什么还要这样做？” 有几个原因。首先，你不需要从主键盘区将你的手移开。第二，使用 `Alt`（或用 Emacs 的说法 `Meta`)键来向前或向后移动一个单词。显而易见这样更方便。第三，如果想重复某个命令，可以在命令前面加上一个数字。在编辑文档时，我经常使用这种方法，通过估计向前多少个单词或向上或线下移动多少行，然后按下 `C-9 C-p` 或 `M-5 M-b` 之类的快捷键。其他真正重要的浏览命令基于开头用 `a` 和结尾用 `e`。在行中使用 `C-a|e`，在句中使用 `M-a|e`。为了让句中的命令正常工作，需要在句号后增加两个空格，这同时提供了一个有用的特性，并消除了脑中的[希伯列][38]。如果需要将文档导出到单个空间[发布环境][39]，可以编写一个宏来执行此操作。

Emacs 附带的教程很值得去看。对于真正缺乏耐心的人，我将介绍一些重要的命令，但那个教程非常有用。记住：用 `C-h t` 进入教程。

### 学会复制和粘贴

你可以叫 Emacs 设为 `CUA` 模式，这将会以熟悉的方式工作来操作复制粘贴，但是原生的 Emacs 方法更好，而且你一旦学会了它，就很容易。你可以使用 `Shift` 这样的浏览命令来标记区域（如选择）。所以 `C-F` 是选中管标前的一个字符，等等。亦可以用 `M-w` 来复制，用 `C-w` 剪切，然后用 `C-y` 粘贴。这些实际上叫做删除和召回，但它非常类似于剪切和粘贴。在删除的环中有些小技巧，但是现在，你只需要关注剪切、复制和粘贴。如果你在这开始摸索， `C-x u` 是撤销。

### 下一步，学会用 `Ido` 模式

相信我，`Ido` 会让文件的工作变得很简单。通常，你在 Emacs 中处理文件不需要使用一个单独分开的查找或文件资源管理器的窗口。相反的，你可以用编辑器的命令来创建、打开和保存文件。如果没有 `Ido` 的话，这将有点麻烦，所以我建议你在学习其他之前安装好它。 `Ido` 是 Emacs 的 22 版时开发出来的，但是需要对你的 `.emacs` 文件做一些调整，来确保它一直开启着。这是个配置环境的好理由。

Emacs 中的大多数功能都表现在模式上。要安装制定的模式，需要做两件事。嗯，一开始你需要做一些额外的事情，但这些只需要做一次，然后再做这两件事。那么，额外的事情是你需要一个单独的位置来放置所有 `Emacs Lisp` 文件，并且你需要告诉 Emacs 这个位置在哪。我建议你在 Dropbox 上创建一个单独的目录，那是你 Emacs 主目录。在这里，你需要创建一个 `.emacs` 文件和 `.emacs.d` 目录。在 `.emacs.d` 目录下，创建一个 `lisp` 的目录。就像这样:

```
home
|
+.emacs
|
-.emacs.d
  |
  -lisp
```

你可以将那些像模式的 `.el` 文件放到 `home/.emacs.d/lis` 目录下，然后在你的 `.emacs` 文件中添加以下代码来指明该路径：

`(add-to-list 'load-path "~/.emacs.d/lisp/")`

`Ido` 模式是 Emacs 自带的，所以你不需要在你的 `lisp` 目录中放 `.el` 文件，但你仍然需要添加上面代码，因为下面的介绍会使用到它.

### 符号链接是你的好伙伴

等等，这里写的 `.emacs` 和 `.emacs.d` 都是存放在你的主目录下，但我们把他们放到了 Dropbox 的某些愚蠢的文件夹！对，这就让你的环境在任何地方都很容易使用。把所有东西都保存在 Dropbox 上，并链接到 `.emacs` 和 `.emacs.d`，以及主目录 `~`。在 OS X 上，使用 `ln -s` 命令非常简单，但在 Windows 上却很麻烦。幸运的是，Emacs 提供了一种简单的方法来替代 Windows 上的符号链接，Windows 的 `HOME` 环境变量。转到 Windows 的环境变量（Windows 10,你可以按 Windows 键然后输入 “环境变量” 来搜索，这是 Windows 10 最好的一部分了)，在你的帐户下创建一个指向你在 Dropbox 中 Emacs 的文件家的 `HOME` 环境变量。如果你想方便地浏览 Dropbox 之外的本地文件，你可能想在你的实际主目录下建立一个到 Dropbox 下 Emacs 主目录的符号链接。

至此，你已经完成了在任意机器上指向 Emacs 配置和配置文件所需的技巧。如果你买了一台新电脑，或者用别人的电脑一小时或一天，你就得到了你的整个工作环境。第一次做这个似乎有点困难，但是一旦你知道你在做什么，就只需要10分钟(最多)。

但我们现在是在配置 `Ido`……

按下 `C-x` `C-f` 然后输入 `~/.emacs RET RET` 来创建 `.emacs` 文件，将下面几行添加进去:

```
;; set up ido mode
(require `ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
```

在 `.emacs` 窗口开着的时候，执行 `M-x evaluate-buffer` 命令。如果某处弄错了的话，将得到一个错误，或者你将得到 `Ido`。`Ido` 改变了在 `minibuffer` 中操作文件操方式。有一篇比较好的文档，但是我也会指出一些技巧。有效地使用 `~/`；你可以在 `minibuffer` 的任何地方输入 `~/`，它就会跳转到主目录。这就意味着，你应该让你的大部分东西就近的放在主目录下。我用 `~/org` 目录来保存所有非代码的东西，用 `~/code` 保存代码。一旦你进入到正确的目录，通常会拥有一组具有不同扩展名的文件，特别是当你使用 `Org` 模式并从中发布的话。你可以输入 `period` 和想要的扩展名，无论你的在文件名的什么位置，`Ido` 都会将选择限制在具有该扩展名的文件中。例如，我在 `Org` 模式下写这篇博客，所以该文件是:

`~/org/blog/emacs.org`

我偶尔也会用 `Org` 模式发布成 HTML 格式，所以我将在同一目录下得到 `emacs.html` 文件。当我想打开 `Org` 文件时，我会输入:

`C-x C-f ~/o[RET]/bl[RET].or[RET]`

其中 `[RET]` 是我使用 `Ido` 模式的自动补全而按下的回车键。所以，这只需要按 12 个键，如果你习惯了的话， 这将比打开查找或文件资源管理器再用鼠标点要节省 _很_ 多时间。 `Ido` 模式很有用， 这真的是操作 Emacs 的一种实用的模式。下面让我们去探索一些其他对完成工作很有帮助的模式吧。

### 字体及风格

我推荐在 Emacs 中使用很棒的字体系列。它们可以使用不同的括号、0和其他字符进行自定义。你可以在字体文件本身中构建额外的行间距。我推荐 1\.5 倍的行间距，并在代码和数据中使用它们适应比例的字体。写作中我用 `Serif` 字体，它有一种紧凑但时髦的感觉。你可以在 [http://input.fontbureau.com/][40] 上找到它们，在那里你可以根据自己的喜好进行定制。你可以使用 Emacs 中的菜单手动设置字体，但这会将代码保存到你的 `.emacs` 文件中，如果您使用多个设备，您可能需要一些不同的设置。我我将我的 `.emacs` 设置位根据使用的机器的名称，并配置适当的屏幕机字体。代码如下:

```
;; set up fonts for different OSes. OSX toggles to full screen.
(setq myfont "InputSerif")
(cond
((string-equal system-name "Sampo.local")
 (set-face-attribute 'default nil :font myfont :height 144)
 (toggle-frame-fullscreen))
((string-equal system-name "Morpheus.local")
 (set-face-attribute 'default nil :font myfont :height 144))
((string-equal system-name "ILMARINEN")
 (set-face-attribute 'default nil :font myfont :height 106))
((string-equal system-name "UKKO")
 (set-face-attribute 'default nil :font myfont :height 104)))
```

您应该将你的 Emacs 副本中 `system-name` 的值替换成你使用命令 `(system-name)` 得到的值。注意，在 Sampo （我的 MacBook）上，我还将 Emacs 设置为全屏。我也想在 Windows 实现这个，但是 Windows 和 Emacs 并不真正喜欢对方，当我尝试这个时，它总是不稳定。相反，我只是在启动后手动全屏。

我还建议去掉 Emacs 中在 90 年代获得的难看的工具栏，当时最酷的事情是在应用程序中使用工具栏。我还去掉了一些其他的 `chrome`，这样我就有了一个简单、高效的界面。把这些加到你的 `.emacs` 的文件中，来去掉工具栏和滚动条，但要保留菜单 （在 OS X 上，它将被隐藏，除非你将鼠标到屏幕顶部）:

```
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
```

### Org 模式

我基本上 `Org` 模式下处理工作的。它是我创作文档、记笔记、列任务清单以及 90% 其他工作的首选环境。`Org` 最初是由一个在会议中使用笔记本电脑的家伙构想出来的，它是笔记和待办事项列表的组合工具。我反对在会议中使用笔记本电脑，自己也不使用，所以我的用法与他的有些不同。对我来说，`Org` 主要是一种处理结构中内容的方式。在 `Org` 模式中有标题和副标题等，它们的作用就像一个大纲。`Org` 允许你展开或隐藏文本内容，还可以重新排列文本。这非常很符合我的想法，而且我发现用这种方式使用它是一种乐趣。

`Org` 模式也有很多让生活愉快的小功能。例如，脚注处理非常好，`LaTeX/PDF` 输出也很好。`Org` 能够根据所有文档中的待办事项生成议程，并能很好地将它们与日期/时间联系起来。我不把它用在任何形式的外部任务上，这些任务都是在一个共享的日历上处理的，但是在创建事物和跟踪我未来需要创建的东西时，它是无价的。安装它，你只要将 `org-mode.el` 放到你的 `lisp` 目录下，然后再在你的 `.emacs` 文件中添加如下代码，如果你想要它基于文档的结构进行缩进并在打开时全部展开的话:

```
;; set up org mode
(setq org-startup-indented t)
(setq org-startup-folded "showall")
(setq org-directory "~/org")
```

最后一行是让 `Org` 知道在哪里查找要包含在议程和其他事情中的文件。我把 `Org` 保存在我的主目录中，也就是说，像前面介绍的一样，它是 Dropbox 目录的一个符号链接。

我有一个总是在缓冲区中打开的 `stuff.org` 文件。我把它当作记事本。`Org` 使得提取待办事项和有期限的事情变得很容易。当你在内联 `Lisp` 代码并在需要计算它时，它特别有用。拥有包含内容的代码非常方便。同样，你可以使用 Emacs 访问实际的计算机，这是一种解放。

#### 用 `Org` 模式进行发布

我关心的是文档的外观和格式。我我刚开始工作时是个设计师，而且我认为信息可以，也应该表现得清晰和美丽。`Org` 对将 `LaTeX` 生成 PDF 支持的很好, `LaTeX` 有自己的学习曲线，但是做简单的事情非常简单。

如果你想使用字体和样式，而不是典型的 `LaTeX` 字体和样式，你需要做些事。首先，你要用到 `XeLaTeX`，这样就可以使用普通的系统字体，而不是 `LaTeX` 的特殊字体。接下来，您需要将一下代码添加到 `.emacs` 中：

```
(setq org-latex-pdf-process
 '("xelatex -interaction nonstopmode %f"
  "xelatex -interaction nonstopmode %f"))
```

我把这个放在 `.emacs` 中 `Org` 配置部分的末尾来保持整洁。这让你在从 `Org` 发布时使用更多格式化选项。例如，我经常使用:

```
#+LaTeX_HEADER: \usepackage{fontspec}
#+LATEX_HEADER: \setmonofont[Scale=0.9]{Input Mono}
#+LATEX_HEADER: \setromanfont{Maison Neue}
#+LATEX_HEADER: \linespread{1.5}
#+LATEX_HEADER: \usepackage[margin=1.25in]{geometry}

#+TITLE: Document Title Here
```

这些都可以在你的 `.org` 文件中找到。我们的公司规定的正文字体是 `Maison Neue`，但你也可以在这写上任何适当的东西。我强烈反对使用 `Maison Neue`。它是一种糟糕的字体，任何人都不应该使用它。

这个文件是一个使用该配置输出为 PDF 的实例。这就是开箱即用的 `LaTeX` 一样。在我看来这还不错，但是字体很无聊，而且有点奇怪。此外，如果你使用标准格式，人们会认为他们正在阅读的东西是或假装是一篇学术论文。别怪我没提醒你。

### `Ace Jump` 模式

如果你想使用的话，这是个辅助而不是主要功能。它的工作原理有点像 Jef Raskin 的 `Leap` 功能<sup>[9][15]</sup>。 按下 `C-c` `C-SPC`，然后输入要跳转到单词的第一个字母。它会高亮显示所有以该字母开头的单词，并将其替换为字母表中的字母。您只需键入所需位置的字母，光标就会跳转到该位置。我自己经常用这个作为导航键或搜索。将 `.el` 文件下到你的 `Lisp` 目录下，并在 `.emacs` 文件添加如下代码:

```
;; set up ace-jump-mode
(add-to-list 'load-path "which-folder-ace-jump-mode-file-in/")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c C-SPC" ) 'ace-jump-mode)
```

### 更多

这篇文章已经够详细了，你能在其中的到你所想要的。我很想了解除编程（或编程）之外你对 Emacs 的使用，以及这是否有用。在我使用 Emacs 的过程中，可能存在一些自作聪明的想法，如果你能指出它们，我将感激不尽。之后，我可能会写一些更新来引入其他特性或模式。我很确定我将会向你展示如何在 Emacs 和 `Ludwig` 模式下使用 `Fugue`，因为我会将它发展成比代码突出显示更有用的东西。把你的想法发到 [@fugueHQ][41] 上。

* * *

#### 附注

1.  [^][16] If you are now a PHB of some sort, but were never technical, Emacs likely isn’t for you. There may be a handful of folks for whom Emacs will form a path into the more technical aspects of computing, but this is probably a small population. It’s helpful to know how to use a Unix or Windows terminal, to have edited a dotfile or two, and to have written some code at some point in your life for Emacs to make much sense.

2.  [^][17] [][18][http://archive.wired.com/wired/archive/2.08/tufte.html][19]

3.  [^][20] I mainly use this to perform calculations while writing. For example, I was writing an offer letter to a new employee and wanted to calculate how many options to include in the offer. Since I have a variable defined in my `.emacs` for outstanding-shares, I can simply type `M-: (* .001 outstanding-shares)`and get a tenth of a point without opening a calculator or spreadsheet. I keep  _lots_ of numbers in variables like this so I can avoid context switching.

4.  [^][21] The missing piece of this is the web. There is an Emacs web browser called eww that will allow you to browse in Emacs. I actually use this, as it is both a great ad-blocker and removes most of the poor choices in readability from the web designer's hands. It's a bit like Reading Mode in Safari. Unfortunately, most websites have lots of annoying cruft and navigation that translates poorly into text.

5.  [^][22] Usability is often confused with learnability. Learnability is how difficult it is to learn a tool. Usability is how useful the tool is. Often, these are at odds, such as with the mouse and menus. Menus are highly learnable, but have poor usability, so there have been keyboard shortcuts from the earliest days. Raskin was right on many points where he was ignored about GUIs in general. Now, OSes are putting things like decent search onto a keyboard shortcut. On OS X and Windows, my default method of navigation is search. Ubuntu's search is badly broken, as is the rest of its GUI.

6.  [^][23] AWS S3 has effectively solved file storage for as long as we have the Internet. Trillions of objects are stored in S3 and they've never lost one of them. Most every service out there that offers cloud storage is built on S3 or imitates it. No one has the scale of S3, so I keep important stuff there, via Dropbox.

7.  [^][24] By now, you might be thinking "what is it with this guy and bicycles?" ... I love them on every level. They are the most mechanically efficient form of transportation ever invented. They can be objects of real beauty. And, with some care, they can last a lifetime. I had Rivendell Bicycle Works build a frame for me back in 2001 and it still makes me happy every time I look at it. Bicycles and UNIX are the two best inventions I've interacted with. Well, they and Emacs.

8.  [^][25] This is not a tutorial for Emacs. It comes with one and it's excellent. I do walk through some of the things that I find most important to getting a useful Emacs setup, but this is not a replacement in any way.

9.  [^][26] Jef Raskin designed the Canon Cat computer in the 1980s after falling out with Steve Jobs on the Macintosh project, which he originally led. The Cat had a document-centric interface (as all computers should) and used the keyboard in innovative ways that you can now imitate with Emacs. If I could have a modern, powerful Cat with a giant high-res screen and Unix underneath, I'd trade my Mac for it right away. [][27][https://youtu.be/o_TlE_U_X3c?t=19s][28]

--------------------------------------------------------------------------------

via: https://blog.fugue.co/2015-11-11-guide-to-emacs.html

作者：[Josh Stella ][a]
译者：[oneforalone](https://github.com/oneforalone)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.fugue.co/authors/josh.html
[1]:https://blog.fugue.co/2013-10-16-vpc-on-aws-part3.html
[2]:https://blog.fugue.co/2013-10-02-vpc-on-aws-part2.html
[3]:http://ww2.fugue.co/2017-05-25_OS_AR_GartnerCoolVendor2017_01-LP-Registration.html
[4]:https://blog.fugue.co/authors/josh.html
[5]:https://twitter.com/joshstella
[6]:https://www.youtube.com/watch?v=khJQgRLKMU0
[7]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#phb
[8]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#tufte
[9]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#interpreter
[10]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#eww
[11]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#usability
[12]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#s3
[13]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#bicycles
[14]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#nottutorial
[15]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#canoncat
[16]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#phbOrigin
[17]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#tufteOrigin
[18]:http://archive.wired.com/wired/archive/2.08/tufte.html
[19]:http://archive.wired.com/wired/archive/2.08/tufte.html
[20]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#interpreterOrigin
[21]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#ewwOrigin
[22]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#usabilityOrigin
[23]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#s3Origin
[24]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#bicyclesOrigin
[25]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#nottutorialOrigin
[26]:https://blog.fugue.co/2015-11-11-guide-to-emacs.html?utm_source=wanqu.co&utm_campaign=Wanqu+Daily&utm_medium=website#canoncatOrigin
[27]:https://youtu.be/o_TlE_U_X3c?t=19s
[28]:https://youtu.be/o_TlE_U_X3c?t=19s
[29]:https://blog.fugue.co/authors/josh.html
[30]:http://www.huffingtonpost.com/zachary-ehren/soma-isnt-a-drug-san-fran_b_987841.html
[31]:http://www.campagnolo.com/US/en
[32]:http://www.businessinsider.com/best-pointy-haired-boss-moments-from-dilbert-2013-10
[33]:http://www.webopedia.com/TERM/I/interpreter.html
[34]:http://emacsformacosx.com/
[35]:http://emacsformacosx.com/
[36]:http://www.gnu.org/software/emacs/
[37]:http://www.gnu.org/software/emacs/
[38]:http://www.huffingtonpost.com/2015/05/29/two-spaces-after-period-debate_n_7455660.html
[39]:http://practicaltypography.com/one-space-between-sentences.html
[40]:http://input.fontbureau.com/
[41]:https://twitter.com/fugueHQ
