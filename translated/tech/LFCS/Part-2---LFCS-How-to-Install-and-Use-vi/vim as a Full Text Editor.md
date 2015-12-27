GHLandy Translated

LFCS系列第二讲：如何安装和使用纯文本编辑器vi/vim

================================================================================
几个月前，Linux基金会发起了LFCS（Linux基金会认证系统管理员）认证，以帮助世界各地的人来验证他们能够在Linux系统上做基本的中间系统管理任务：如系统支持，第一手的故障诊断和维修，以及合适向上游支持团队智提出问题的智能决策。



![Learning VI Editor in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/LFCS-Part-2.png)

在Linux中学习vi编辑器

请简要看看一下视频，里边介绍了linux基金会认证的程序。

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

这篇文章是十个tutorial系列的第二部分，在这个部分，我们会介绍基本的文件编辑操作和理解vi/vim编辑器中的（三个）模式，这是LFCS认证考试中必须掌握的。

### 使用vi/vim执行基本的文件编辑操作 ###

vi是为了Unix而被编写的第一个全屏文本编辑器。由于它被设计德小巧而简单，对于只使用图形界面编辑器，局几个例子，如NotePad++或者gedit的那些人来说，可能存在一些困难。

为了使用vi，我们必须首先理解这个强大的程序操作中的3中模式，方便我们后边学习这个强大文本处理软件的操作

请注意，大多数现代Linux发行版都集成了vi的变种——vim（vi升级版），相比于vi，它有跟多新功能。由于这个原因，我们教会在本教程中交替使用vi和vim。

如果你的发行版还没有安装vim，你可以通过以下方法来安装：

- Ubuntu及其衍生版：apt-get update && apt-get install vim
- 以Red-Hat为基础的发行版：yum update && yum install vim
- openSUSE：zypper update && zypper install vim

### 我为什么要学习vi ###

至少有以下两点好理由：

1.（不管你使用什么发行版）vi总是可用的，因为它是POSIX所要求的。

2.vi基本不消耗多少系统资源，并且运行我们仅仅通过键盘来完成任何可能的任务。

此外，vi有的非常广泛的内置manual帮助，程序打开后就可以通过:help命令来查看。这个内置manual帮助比vi/vim的man页面包含了跟多信息。

![vi Man Pages](http://www.tecmint.com/wp-content/uploads/2014/10/vi-man-pages.png)

vi Man 页面

#### 启动vi ####

可以通过在命令提示符下输入vi来启动。

![Start vi Editor](http://www.tecmint.com/wp-content/uploads/2014/10/start-vi-editor.png)

使用vi编辑器

然后按下字母i，你就可以开始输入了。或者通过下面的方法来启动vi：

    # vi filename

这样会打开一个名为filename的buffer（稍后详细介绍buffer），在你编辑完成之后就可以存储在磁盘中了。

#### 理解vi的三个模式 ####

1.在命令模式中，vi允许用户浏览该文件并输入由一个或多个字母组成简短的、大小写敏感的vi命令。这些命令的大部分都可以增加一个前缀数字表示执行次数。

比如：yy（或Y）复制当前的整行，3yy（或3Y）复制当前整行和下边紧接着的两行（总共3行）。通过Esc键可以随时进入命令模式（而不管当前工作在什么模式下）。事实上，在命令模式下，键盘上所有的输入都被解释为命令而非文本，这往往使得初学者困惑不已。

2.在末行模式中，我们可以处理文件（包括保存当前文件和运行外部程序）。我们必须在命令模式下输入一个冒号（:），才能进入这个模式，紧接着是需要使用末行模式下的命令。执行之后vi自动回到命令模式。

3.在文本输入模式（通常使用字母i进入这个模式）中，我们可以随意输入文本。大多数的键入将以文本形式输出到屏幕（一个重要的例外是Esc键，它将退出文本编辑模式并回到命令模式）。

![vi Insert Mode](http://www.tecmint.com/wp-content/uploads/2014/10/vi-insert-mode.png)

vi 文本插入模式

#### vi命令 ####

下面的表格列出常用的vi命令。文件版本的命令可以通过添加惊叹号的命令强制执行（如，:q!命令强制退出编辑器而不保存文件）。

注：表格
<table cellspacing="0" border="0">
  <colgroup width="290">
  </colgroup>
  <colgroup width="781">
  </colgroup>
  <tbody>
    <tr>
      <td bgcolor="#999999" height="19" align="LEFT" style="border: 1px solid #000000;"><b><span style="font-size: small;">&nbsp;关键命令</span></b></td>
      <td bgcolor="#999999" align="LEFT" style="border: 1px solid #000000;"><b><span style="font-size: small;">&nbsp;描述</span></b></td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;h或←</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标左移一个字符</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;j或↓</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标下移一行</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;k或↑</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标上移一行</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;l(小写L)或→</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标右移一个字符</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;H</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标移至屏幕顶行</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;L</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标移至屏幕末行</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;G</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标移至文件末行</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;w</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标右移一个词</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;b</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标左移一个词</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;0(零)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标移至行首</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;^</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标移至当前行第一个非空格字符</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;$</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标移至当前行行尾</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;Ctrl-B</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;向后翻页</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;Ctrl-F</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;向前翻页</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;i</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;在光标所在位置插入文本</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;I(大写i)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;在当前行首插入文本</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;J(大写j)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;将下一行与当前行合并（下一行上移到当前行）</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;a</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;在光标所在位置后追加文本</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;o(小写O)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;在当前行下边插入空白行</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;O(大写o)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;在当前行上边插入空白行</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;r</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;替换光标所在位置的字符</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;R</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;光标所在位置覆盖插入文本</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;x</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;删除光标所在位置的字符</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;X</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;立即删除光标所在位置之前（左边）的一个字符</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;dd</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;剪切当前整行文本（为了之后进行粘贴）</td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;D</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;剪切光标所在位置到行末的文本（该命令等效于d$）</td>
    </tr>
    <tr class="alt">
      <td height="20" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;yX</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;给X命令一个移动长度，复制适当数量的字符、单词或者从光标开始到一定数量的行</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;yy或Y</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;复制当前整行</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;p</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;粘贴在光标所在位置之后（下一行）</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;P</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;粘贴在光标所在位置之前（上一行）</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;.(句点)</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;重复最后一个命令</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;u</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;撤销最后一个命令</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;U</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;撤销最后一行的最后一个命令，只有光标仍在最后一行才能执行。</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;n</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;在查找中跳到下一个匹配项</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;N</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;在查找中跳到前一个匹配项</td>
    </tr>
    <tr>
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;:n</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;下一个文件，编辑多个指定文件时，该命令加载下一个文件。</td>
    </tr>
    <tr class="alt">
      <td height="20" align="LEFT" style="border: 1px solid #000000;">&nbsp;:e file</td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;加载新文件来替代当前文件</td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000000;">&nbsp;:r file</td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;将新文件的内容插入到光标所在位置的下一行</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;:q</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;退出并放弃更改</td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000000;">&nbsp;:w file</td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;将当期打开的buffer保存为file。如果是追加到已存在的文件中，则使用：w &gt;&gt; file.</td>
    </tr>
    <tr class="alt">
      <td height="18" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Courier New;">&nbsp;:wq</span></td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;保存当前文件的内容并退出。等效于x!和ZZ</td>
    </tr>
    <tr>
      <td height="20" align="LEFT" style="border: 1px solid #000000;">&nbsp;:r! command</td>
      <td align="LEFT" style="border: 1px solid #000000;">&nbsp;执行command命令，并将命令的输出插入到光标所在位置的下一行。</td>
    </tr>
  </tbody>
</table>

#### vi选项 ####

下列选项将会在启动Vim的时候加载（需要写入到~/.vimrc文件）：

    # echo set number >> ~/.vimrc
    # echo syntax on >> ~/.vimrc
    # echo set tabstop=4 >> ~/.vimrc
    # echo set autoindent >> ~/.vimrc

![vi Editor Options](http://www.tecmint.com/wp-content/uploads/2014/10/vi-options.png)

vi编辑器选项

- set number 当vi打开或新建文件时，显示行号。
- syntax on 打开语法高亮（对应多个文件扩展名），以便源码文件和配置文件根据可读性。
- set tabstop=4 设置制表符间距为4个空格（默认为8）。
- set autoindent 将前一行的缩进应用于下一行。 

#### 查找和替换 ####

vi具有通过查找将光标移动到（在单独一行或者整个文件中的）指定位置。它还可自动或者通过用户确认来执行文本替换。

a)在行内查找。f命令在当前查找指定字符，并将光标移动到指定字符出现的位置。

例如，命令fh会在本行中将光标实例字母h出现的位置。注意，字母f和你要查找的字符都不会出现在屏幕上，但是当你按下回车的时候，要查找的字符会被高亮显示。

比如，一下是在命令模式按下f4之后的结果。

![Search String in Vi](http://www.tecmint.com/wp-content/uploads/2014/10/vi-search-string.png)

在vi中查找字符。

b)在整个文件内查找。使用/命令，紧接着需要查找的单词或短语。这个查找可以通过使用n命令或者N重复查找上一个查找的字符串。以下是在命令模式键入/Jane的查找结果。

![Vi Search String in File](http://www.tecmint.com/wp-content/uploads/2014/10/vi-search-line.png)

在vi中查找字符

c)vi通过使用命令来完成多行或者整个文件的替换操作（类似于sed）。我们可以使用一下命令，使得整个文件中的单词“old”替换为“young”。

    :%s/old/young/g

**注意**：冒号位于命令的最前面。

![Vi Search and Replace](http://www.tecmint.com/wp-content/uploads/2014/10/vi-search-and-replace.png)

vi的查找和替换

冒号(:)进入末行模式，在本例中s表谁替换，%是第一行到最后一行的表示方式（也可以使用nm表示范围，即第n行到第m行），old是查找模式，young是用来替换的文本，g表示在每个查找出来的字符串都进行替换。

另外，在命令最后增加一个c，可以在每一个匹配项替换前进行替换。

    :%s/old/young/gc

将就文本替换为新文本前，vi/vim会想我们显示一下信息：

![Replace String in Vi](http://www.tecmint.com/wp-content/uploads/2014/10/vi-replace-old-with-young.png)

vi中替换字符串

- y: 执行替换（yes）
- n: 跳过这个匹配字符并转到下一个（no）
- a: 在当前匹配字符及后边的相同想全部执行替换
- q或Esc: 取消替换
- l(小写L): 执行本次替换并退出
- Ctrl-e, Ctrl-y: 下翻页，上翻页，查看相应的文本来进行替换。

#### 同时编辑多个文件 ####

我们在命令提示符输入vim file1 file2 file3如下：

    # vim file1 file2 file3

vim会首先打开file1，要跳到file2需用:n命令。当需要打开前一个文件时，:N就可以了。

为了从file1跳到file3

a) :buffers命令会显示当前正在编辑的文件列表

    :buffers

![Edit Multiple Files](http://www.tecmint.com/wp-content/uploads/2014/10/vi-edit-multiple-files.png)

编辑多个文件

b) :buffer 3命令（后边没有s）会打开file惊醒编辑。

在上边的图片中，标记符号#表示该文件当前已被打开在后台，而%a标记的文件是正在被编辑的。另外，文件号哦后边的空格（如上边例子的3）表示该文件还没有被打开。

#### vi的临时buffers ####

为了复制连续的多行（比如，假设为4行）到一个名为a的临时buffer（与文件无关），并且还要将这些行粘贴到在当前vi会话文件中的其它位置，我们需要：

1.按下Esc键以确认vi处在命令模式

2.将光标放在我们希望复制的第一行文本

3.输入a4yy复制当前行和接下来的3行，进入一个名为a的buffer。我们一继续编辑我们的文件——我们不需要立即插入刚刚复制的行。

4.当到了需要使用刚刚复制行的位置，在p(小写)或P(大写)命令来讲复制行插入到名为a的buffer：

- 输入ap，复制行将插入到光标位置所在行的下一行。
- 输入aP，复制行将插入到光标位置所在行的上一行。

如果愿意，我们可以重复上述步骤，将buffer a中的内容插入到我们文件的多个位置。一个临时buffer，像本次回话中的一样，会在当前窗口关闭之后释放掉。

### 总结 ###

像我们看到的一样，vi/vim在命令接口下是一个强大而灵活的文本编辑器。通过以下链接，随时分享你自己的技巧和评论。

#### 参考链接 ####

- [About the LFCS][1]
- [Why get a Linux Foundation Certification?][2]
- [Register for the LFCS exam][3]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/vi-editor-usage/

作者：[Gabriel Cánepa][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://training.linuxfoundation.org/certification/LFCS
[2]:https://training.linuxfoundation.org/certification/why-certify-with-us
[3]:https://identity.linuxfoundation.org/user?destination=pid/1
