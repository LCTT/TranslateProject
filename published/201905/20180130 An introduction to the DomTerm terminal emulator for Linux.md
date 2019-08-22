DomTerm：一款为 Linux 打造的终端模拟器 
======
> 了解一下 DomTerm，这是一款终端模拟器和复用器，带有 HTML 图形和其它不多见的功能。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_terminals.png?itok=CfBqYBah)

[DomTerm][1] 是一款现代化的终端模拟器，它使用浏览器引擎作为 “GUI 工具包”。这就支持了一些相关的特性，例如可嵌入图像和链接、HTML 富文本以及可折叠（显示/隐藏）命令。除此以外，它看起来感觉就像一个功能完整、独立的终端模拟器，有着出色 xterm 兼容性（包括鼠标处理和 24 位色）和恰当的 “装饰” （菜单）。另外它内置支持了会话管理和副窗口（如同 `tmux` 和 `GNU Screen` 中一样）、基本输入编辑（如在 `readline` 中）以及分页（如在 `less` 中）。

![](https://opensource.com/sites/default/files/u128651/domterm1.png)

*图 1: DomTerminal 终端模拟器。*

在以下部分我们将看一看这些特性。我们将假设你已经安装好了 `domterm` （如果你需要获取并构建 Dormterm 请跳到本文最后）。开始之前先让我们概览一下这项技术。

### 前端 vs. 后端

DomTerm 大部分是用 JavaScript 写的，它运行在一个浏览器引擎中。它可以是像例如 Chrome 或者 Firefox 一样的桌面浏览器（见图 3），也可以是一个内嵌的浏览器。使用一个通用的网页浏览器没有问题，但是用户体验却不够好（因为菜单是为通用的网页浏览而不是为了终端模拟器所打造)，并且其安全模型也会妨碍使用。因此使用内嵌的浏览器更好一些。

目前以下这些是支持的：

  * qdomterm，使用了 Qt 工具包 和 QtWebEngine
  * 一个内嵌的 [Electron][2]（见图 1）
  * atom-domterm 以 [Atom 文本编辑器][3]（同样基于 Electron）包的形式运行 DomTerm，并和 Atom 面板系统集成在一起（见图 2）
  * 一个为 JavaFX 的 WebEngine 包装器，这对 Java 编程十分有用（见图 4）
  * 之前前端使用 [Firefox-XUL][4] 作为首选，但是 Mozilla 已经终止了 XUL

![在 Atom 编辑器中的 DomTerm 终端面板][6]

*图 2：在 Atom 编辑器中的 DomTerm 终端面板。*

目前，Electron 前端可能是最佳选择，紧随其后的是 Qt 前端。如果你使用 Atom，atom-domterm 也工作得相当不错。

后端服务器是用 C 写的。它管理着伪终端（PTY）和会话。它同样也是一个为前端提供 Javascript 和其它文件的 HTTP 服务器。`domterm` 命令启动终端任务和执行其它请求。如果没有服务器在运行，domterm 就会自己来服务。后端与服务器之间的通讯通常是用 WebSockets（在服务器端是[libwebsockets][8]）完成的。然而，JavaFX 的嵌入既不用 Websockets 也不用 DomTerm 服务器。相反 Java 应用直接通过 Java-Javascript 桥接进行通讯。

### 一个稳健的可兼容 xterm 的终端模拟器

DomTerm 看上去感觉像一个现代的终端模拟器。它处理鼠标事件、24 位色、Unicode、倍宽字符（CJK）以及输入方式。DomTerm 在 [vttest 测试套件][9] 上工作地十分出色。

其不同寻常的特性包括：

**展示/隐藏按钮（“折叠”）：** 小三角（如上图 2）是隐藏/展示相应输出的按钮。仅需在[提示符][11]中添加特定的[转义字符][10]就可以创建按钮。

**对于 readline 和类似输入编辑器的鼠标点击支持：** 如果你点击输入区域（黄色），DomTerm 会向应用发送正确的方向键按键序列。（可以通过提示符中的转义字符启用这一特性，你也可以通过 `Alt+点击` 强制使用。）

**用 CSS 样式化终端：** 这通常是在 `~/.domterm/settings.ini` 里完成的，保存时会自动重载。例如在图 2 中，设置了终端专用的背景色。

### 一个更好的 REPL 控制台

一个经典的终端模拟器基于长方形的字符单元格工作的。这在 REPL（命令行）上没问题，但是并不理想。这里有些通常在终端模拟器中不常见的 REPL 很有用的 DomTerm 特性：

**一个能“打印”图片、图形、数学公式或者一组可点击的链接的命令：** 应用可以发送包含几乎任何 HTML 的转义字符。（HTML 会被剔除部分，以移除 JavaScript 和其它危险特性。）

图 3 显示了来自 [gnuplot][12] 会话的一个片段。Gnuplot（2.1 或者跟高版本）支持 DormTerm 作为终端类型。图形输出被转换成 [SVG 图片][13]，然后被打印到终端。我的博客帖子[在 DormTerm 上的 Gnuplot 展示][14]在这方面提供了更多信息。

![](https://opensource.com/sites/default/files/dt-gnuplot.png)

*图 3：Gnuplot 截图。*

[Kawa][15] 语言有一个创建并转换[几何图像值][16]的库。如果你将这样的图片值打印到 DomTerm 终端，图片就会被转换成 SVG 形式并嵌入进输出中。

![](https://opensource.com/sites/default/files/dt-kawa1.png)

*图 4：Kawa 中可计算的几何形状。*

**富文本输出：** 有着 HTML 样式的帮助信息更加便于阅读，看上去也更漂亮。图片 1 的下面面板展示 `dormterm help` 的输出。（如果没在 DomTerm 下运行的话输出的是普通文本。）注意自带的分页器中的 `PAUSED` 消息。

**包括可点击链接的错误消息：** DomTerm 可以识别语法 `filename:line:column` 并将其转化成一个能在可定制文本编辑器中打开文件并定位到行的链接。（这适用于相对路径的文件名，如果你用 `PROMPT_COMMAND` 或类似的跟踪目录。）

编译器可以侦测到它在 DomTerm 下运行，并直接用转义字符发出文件链接。这比依赖 DomTerm 的样式匹配要稳健得多，因为它可以处理空格和其他字符并且无需依赖目录追踪。在图 4 中，你可以看到来自 [Kawa Compiler][15] 的错误消息。悬停在文件位置上会使其出现下划线，`file:` URL 出现在 `atom-domterm` 消息栏（窗口底部）中。（当不用 atom-domterm 时，这样的消息会在一个浮层的框中显示，如图 1 中所看到的 `PAUSED` 消息所示。）

点击链接时的动作是可以配置的。默认对于带有 `#position` 后缀的 `file:` 链接的动作是在文本编辑器中打开那个文件。

**结构化内部表示：**以下内容均以内部节点结构表示：命令、提示符、输入行、正常和错误输出、标签，如果“另存为 HTML”，则保留结构。HTML 文件与 XML 兼容，因此你可以使用 XML 工具搜索或转换输出。命令 `domterm view-saved` 会以一种启用命令折叠（显示/隐藏按钮处于活动状态）和重新调整窗口大小的方式打开保存的 HTML 文件。

**内建的 Lisp 样式优美打印：** 你可以在输出中包括优美打印指令（比如，grouping），这样断行会根据窗口大小调整而重新计算。查看我的文章 [DomTerm 中的动态优美打印][17]以更深入探讨。

**基本的内建行编辑**，带着历史记录（像 GNU readline 一样）： 这使用浏览器自带的编辑器，因此它有着优秀的鼠标和选择处理机制。你可以在正常字符模式（大多数输入的字符被指接送向进程）；或者行模式（通常的字符是直接插入的，而控制字符导致编辑操作，回车键会向进程发送被编辑行）之间转换。默认的是自动模式，根据 PTY 是在原始模式还是终端模式中，DomTerm 在字符模式与行模式间转换。

**自带的分页器**（类似简化版的 `less`）：键盘快捷键控制滚动。在“页模式”中，输出在每个新的屏幕（或者单独的行，如果你想一行行地向前移）后暂停；页模式对于用户输入简单智能，因此（如果你想的话）你无需阻碍交互式程序就可以运行它。

### 多路复用和会话

**标签和平铺：** 你不仅可以创建多个终端标签，也可以平铺它们。你可以要么使用鼠标或键盘快捷键来创建或者切换面板和标签。它们可以用鼠标重新排列并调整大小。这是通过 [GoldenLayout][18]  JavaScript 库实现的。图 1 展示了一个有着两个面板的窗口。上面的有两个标签，一个运行 [Midnight Commander][20]；底下的面板以 HTML 形式展示了 `dormterm help` 输出。然而相反在 Atom 中我们使用其自带的可拖拽的面板和标签。你可以在图 2 中看到这个。

**分离或重接会话：** 与 `tmux` 和 GNU `screen` 类似，DomTerm 支持会话安排。你甚至可以给同样的会话接上多个窗口或面板。这支持多用户会话分享和远程链接。（为了安全，同一个服务器的所有会话都需要能够读取 Unix 域接口和一个包含随机密钥的本地文件。当我们有了良好、安全的远程链接，这个限制将会有所放松。）

**domterm 命令** 类似与 `tmux` 和 GNU `screen`，它有多个选项可以用于控制或者打开单个或多个会话的服务器。主要的差别在于，如果它没在 DomTerm 下运行，`dormterm` 命令会创建一个新的顶层窗口，而不是在现有的终端中运行。

与 `tmux` 和 `git` 类似，`dormterm` 命令有许多子命令。一些子命令创建窗口或者会话。另一些（例如“打印”一张图片）仅在现有的 DormTerm 会话下起作用。

命令 `domterm browse` 打开一个窗口或者面板以浏览一个指定的 URL，例如浏览文档的时候。

### 获取并安装 DomTerm

DomTerm 可以从其 [Github 仓库][21]获取。目前没有提前构建好的包，但是有[详细指导][22]。所有的前提条件在 Fedora 27 上都有，这使得其特别容易被搭建。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/introduction-domterm-terminal-emulator

作者：[Per Bothner][a]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

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

