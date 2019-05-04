DomTerm 一款为 Linux 打造的终端模拟器 
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_terminals.png?itok=CfBqYBah)

[DomTerm][1] 是一款现代化的终端模拟器，它使用浏览器引擎作为 “GUI 工具包”。这就使得一些干净特性例如可嵌入的图像和链接，HTML 富文本以及可折叠（显示/隐藏）命令成为可能。除此以外，它看起来感觉就像一个功能强大，有着优秀 xterm 兼容性（包括鼠标处理和24位色）和恰当的 “chrome” （菜单）的独特终端模拟器。另外它同样有对会话管理和副窗口（例如 `tmux` 和 `GNU Screen` 中），基本输入编辑（例如 `readline` 中）以及分页（例如 `less` 中）的内置支持。

![](https://opensource.com/sites/default/files/u128651/domterm1.png)
图 1: DomTerminal 终端模拟器。 查看大图

在以下部分我们将看一看这些特性。我们将假设你已经安装好了 `domterm` （如果你需要获取并搭建 Dormterm 请跳到本文最后）。开始之前先让我们概览一下这项技术。

### 前端 vs. 后端

DomTerm 大部分是用 JavaScript 写的，它运行在一个浏览器引擎中。这个引擎可以是一个桌面浏览器，例如 Chrome 或者 Firefox（见图三），也可以是一个内嵌的浏览器。使用一个通用的网页浏览器没有问题，但是用户体验却不够好（因为菜单是为通用的网页浏览而不是为了终端模拟器所打造)，并且安全模型也会妨碍使用。因此使用内嵌的浏览器更好一些。

目前以下这些是支持的：

  * `qdomterm`，使用了 Qt 工具包 和 `QtWebEngine`
  * 一个内嵌的 `[Electron][2]`（见图一）
  * `atom-domterm` 以 [Atom 文本编辑器][3]（同样基于 Electron）包的形式运行 DomTerm，并和 Atom 面板系统集成在一起（见图二）
  * 一个为 JavaFX 的 `WebEngine`  包装器，这对 Java 编程十分有用（见图四）
  * 之前前端使用 [Firefox-XUL][4] 作为首选，但是 Mozilla 已经终止了 XUL



![在 Atom 编辑器中的 DomTerm 终端面板][6]

图二：在 Atom 编辑器中的 DomTerm 终端面板。[查看大图][7]

目前，Electron 前端可能是最佳选择，紧随其后的是 Qt 前端。如果你使用 Atom，`atom-domterm` 也工作得相当不错。

后端服务器是用 C 写的。它管理着伪终端（PTYs）和会话。它同样也是一个为前端提供 Javascript 和其他文件的 HTTP 服务器。如果没有服务器在运行，`domterm` 就会使用它自己。后端与服务器之间的通讯通常是用 WebSockets （在服务器端是[libwebsockets][8]）完成的。然而，JavaFX 嵌入时既不用 Websockets 也不用 DomTerm 服务器。相反 Java 应用直接通过 Java-Javascript 桥接进行通讯。

### 一个稳健的可兼容 xterm 的终端模拟器

DomTerm 看上去感觉像一个现代的终端模拟器。它处理鼠标事件，24位色，万国码，倍宽字符（CJK）以及输入方式。DomTerm 在 [vttest 测试套件][9] 上工作地十分出色。

不同寻常的特性包括：

**展示/隐藏按钮（“折叠”）:** 小三角（如上图二）是隐藏/展示相应输出的按钮。仅需在[提示文字][11]中添加特定的[转义字符][10]就可以创建按钮。

**对于 `readline` 和类似输入编辑器的鼠标点击支持：** 如果你点击（黄色）输入区域，DomTerm 会向应用发送正确的方向键按键序列。（提示窗口中的转义字符使能这一特性，你也可以通过 Alt+Click 强制使用。）

**用CSS样式化终端：** 这通常是在 `~/.domterm/settings.ini` 里完成的，保存时会自动重载。例如在图二中，终端专用的背景色被设置。

### 一个更好的 REPL 控制台

一个经典的终端模拟器基于长方形的字符单元格工作。这在 REPL（命令行）上没问题，但是并不理想。这有些对通常在终端模拟器中不常见的 REPL 很有用的 DomTerm 特性：

**一个能“打印”图片，图表，数学公式或者一组可点击的链接的命令：** 一个应用可以发送包含几乎任何 HTML 的转义字符。（擦除 HTML 以移除 JavaScript 和其它危险特性。）

图三从[`gnuplot`][12]会话展示了一个片段。Gnuplot（2.1或者跟高版本）支持 `dormterm` 作为终端类型。图像输出被转换成 [SVG 图][13]，然后图片被打印到终端。我的博客帖子[在 DormTerm 上的 Gnuplot 展示]在这方面提供了更多信息。

![](https://opensource.com/sites/default/files/dt-gnuplot.png)
图三: Gnuplot 截图。查看大图

[Kawa][15] 语言有一个创建并转换[几何图像值][16]的库。如果你将这样的图片值打印到 DomTerm 终端，图片就会被转换成 SVG 形式并嵌入进输出中。

![](https://opensource.com/sites/default/files/dt-kawa1.png)
图四: Kawa 中可计算的几何形状。查看大图

**输出中的富文本：** 有着 HTML 样式的帮助信息更加便于阅读，看上去也更漂亮。图片一的面板下部分展示 `dormterm help` 的输出。（如果没在 DomTerm 下运行的话输出的是普通文本。）注意自带的分页器中的 `PAUSED` 消息。

**包括可点击链接的错误消息：** DomTerm 识别语法 `filename:line:column` 并将其转化成一个能在可定制文本编辑器中打开文件并定位到行的链接。（这适用相对的文件名上如果你用 `PROMPT_COMMAND` 或类似的以跟踪目录。）

一个编译器可以侦测到它在 DomTerm 下运行，并直接用转义字符发出文件链接。这比依赖 DomTerm 的样式匹配要稳健得多，因为它可以处理空格和其他字符并且无需依赖目录追踪。在图四中，你可以看到来自 [Kawa Compiler][15] 的错误消息。悬停在文件位置上会使其出现下划线，`file:` URL 出现在 `atom-domterm` 消息栏（窗口底部）中。（当不用 `atom-domterm` 时，这样的消息会在一个覆盖框中显示，如图一中所看到的 `PAUSED` 消息所示。）

点击链接时的动作是可以配置的。默认对于带有 `#position` 后缀的 `file:` 链接的动作是在文本编辑器中打开那个文件。

**内建的 Lisp 样式优美打印：** 你可以在输出中包括优美打印目录（比如，组）这样行分隔符会随着窗口调整二重新计算。查看我的文章 [DomTerm 中的动态优美打印][17]以更深入探讨。

**基本的有着历史记录的内建行编辑**（像 `GNU readline` 一样）： 这使用浏览器自带的编辑器，因此它有着优秀的鼠标和选择处理机制。你可以在正常字符模式（大多数输入的字符被指接送向进程）; 或者行模式（当控制字符导致编辑动作，回车键向进程发送被编辑行，通常的字符是被插入的）之间转换。默认的是自动模式，根据 PTY 是在原始模式还是终端模式中，DomTerm 在字符模式与行模式间转换。

**自带的分页器**（类似简化版的 `less`）：键盘快捷键控制滚动。在“页模式”中，输出在每个新的屏幕（或者单独的行如果你一行行地向前移）后暂停; 页模式对于用户输入简单智能，因此（如果你想的话）你可以无需阻碍交互程序就可以运行它。

###  多路传输和会话

**标签和平铺：** 你不仅可以创建多个终端标签，也可以平铺它们。你可以要么使用鼠标要么使用键盘快捷键来创建或者切换面板和标签。它们可以用鼠标重新排列并调整大小。这是通过[GoldenLayout][18] JavaScript 库实现的。[图一][19]展示了一个有着两个面板的窗口。上面的有两个标签，一个运行 [Midnight Commander][20]; 底下的面板以 HTML 形式展示了 `dormterm help` 输出。然而相反在 Atom 中我们使用其自带的可拖拽的面板和标签。你可以在图二中看到这个。

**分离或重接会话：** 与 `tmux` 和 GNU `screen` 类似，DomTerm 支持会话安排。你甚至可以给同样的会话接上多个窗口或面板。这支持多用户会话分享和远程链接。（为了安全，同一个服务器的所有会话都需要能够读取 Unix 域接口和包含随机密钥的本地文件。当我们有了良好，安全的远程链接，这个限制将会有所改善。）

**`domterm`** **命令** 与 `tmux` 和 GNU `screen` 同样相似的地方在于它为控制或者打开单个或多个会话的服务器有着多个选项。主要的差别在于，如果它没在 DomTerm 下运行，`dormterm` 命令会创建一个新的顶层窗口，而不是在现有的终端中运行。

与 `tmux` 和 `git` 类似，dormterm` 命令有许多副命令。一些副命令创建窗口或者会话。另一些（例如“打印”一张图片）仅在现有的 DormTerm 会话下起作用。

命令 `domterm browse` 打开一个窗口或者面板以浏览一个指定的 URL，例如浏览文档的时候。

### 获取并安装 DomTerm

DomTerm 从其 [Github 仓库][21]可以获取。目前没有提前搭建好的包，但是有[详细指导][22]。所有的前提条件都可以在 Fedora 27 上获取，这使得其特别容易被搭建。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/introduction-domterm-terminal-emulator

作者：[Per Bothner][a]
译者：[tomjlw](https://github.com/tomjlw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/perbothner
[1]:http://domterm.org/
[2]:https://electronjs.org/
[3]:https://atom.io/
[4]:https://en.wikipedia.org/wiki/XUL
[5]:/file/385346
[6]:https://opensource.com/sites/default/files/images/dt-atom1.png (DomTerm terminal panes in Atom editor)
[7]:https://opensource.com/sites/default/files/images/dt-atom1.png
[8]:https://libwebsockets.org/
[9]:http://invisible-island.net/vttest/
[10]:http://domterm.org/Wire-byte-protocol.html
[11]:http://domterm.org/Shell-prompts.html
[12]:http://www.gnuplot.info/
[13]:https://developer.mozilla.org/en-US/docs/Web/SVG
[14]:http://per.bothner.com/blog/2016/gnuplot-in-domterm/
[15]:https://www.gnu.org/software/kawa/
[16]:https://www.gnu.org/software/kawa/Composable-pictures.html
[17]:http://per.bothner.com/blog/2017/dynamic-prettyprinting/
[18]:https://golden-layout.com/
[19]:https://opensource.com/sites/default/files/u128651/domterm1.png
[20]:https://midnight-commander.org/
[21]:https://github.com/PerBothner/DomTerm
[22]:http://domterm.org/Downloading-and-building.html

