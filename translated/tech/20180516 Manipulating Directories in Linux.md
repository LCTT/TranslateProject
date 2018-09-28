在Linux上操作目录
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/branches-238379_1920_0.jpg?itok=2PlNpsVu)

如果你不熟悉本系列（以及Linux），[请查看我们的第一部分][1]。在那篇文章中，我们通过Linux文件系统的树状结构，或者更确切地说以文件层次结构标准工作。我建议你仔细阅读，确保你理解自己能安全的做哪些操作。因为这一次，我将向你展示目录操作的魅力。

### 新建目录

在操作变得具有破坏性之前，让我们发挥创意创造。首先，打开一个终端窗口并使用命令mkdir创建一个新目录，如下所示：
```
mkdir <directoryname>

```
如果你只输入了目录名称，该目录将显示在您当前所在目录中。如果你刚刚打开一个终端，你当前位置为你的家目录。下面这个例子，我们展示了将要创建的目录与你当前所处位置的关系：
```
$ pwd #This tells you where you are now -- see our first tutorial
/home/<username>
$ mkdir newdirectory #Creates /home/<username>/newdirectory

```
(注 你不用输入＃后面的文本。#后面的文本为注释内容，用于解释发生了什么。它会被shell忽略，不会被执行).

你可以在当前位置中已经存在的某个目录下创建新的目录，方法是在命令行中指定它：
```
mkdir Documents/Letters

```
这将在Documents目录中创建Letters目录。

你还可以在路径中使用..在当前目录的上一级目录中创建目录。假设你进入刚刚创建的Documents/Letters/目录，并且想要创建Documents/Memos/目录。你可以这样做：
```
cd Documents/Letters # Move into your recently created Letters/ directory
mkdir ../Memos

```
同样，以上所有内容都是相对于你当前的位置做的。这就是使用了相对路径。
你还可以使用目录的绝对路径：这意味着告诉mkdir命令将目录放在和根目录（/）有关的位置：
```
mkdir /home/<username>/Documents/Letters

```
在上面的命令中将<username>更改为你的用户名，这相当于从你的主目录执行mkdir Documents / Letters，通过使用绝对路径你可以在目录树中的任何位置完成这项工作。

无论你使用相对路径还是绝对路径，只要命令成功执行，mkdir将静默的创建新目录，而没有任何明显的反馈。只有当遇到某种问题时，mkdir才会在你敲下[Enter]后打印一些反馈。

与大多数其他命令行工具一样，mkdir提供了几个有趣的选项。 -p选项特别有用，因为它允许你创建嵌套目录，即使目录不存在也可以。例如，要在Documents /中创建一个目录存放写给妈妈的信，你可以这样做：
```
mkdir -p Documents/Letters/Family/Mom

```
And `mkdir` will create the whole branch of directories above _Mom/_ and also the directory _Mom/_ for you, regardless of whether any of the parent directories existed before you issued the command.

你也可以用空格来分隔目录名，来同时创建几个目录：
```
mkdir Letters Memos Reports

```
这将在当前目录下创建目录Letters，Memos和Reports。

### 目录名中可怕的空格

... 这带来了目录名称中关于空格的棘手问题。你能在目录名中使用空格吗？是的你可以。那么建议你使用空格吗？不，绝对不是。空格使一切变得更加复杂，并且可能是危险的操作。

假设您要创建一个名为letters mom的目录。如果你不知道如何更好处理，你可能会输入：
```
mkdir letters mom

```
但这是错误的！错误的！错误的！正如我们在上面介绍的，这将创建两个目录letters和mom，而不是一个目录letters mom。

得承认这是一个小麻烦：你所要做的就是删除这两个目录并重新开始，这没什么大不了。

可是等等！删除目录可是个危险的操作。想象一下，你确实使用图形工具[Dolphin][2]或[Nautilus][3]创建了目录letters mom。如果你突然决定从终端删除目录letters mom，并且您在同一目录下有另一个名为letters的目录，并且该目录中包含重要的文档，结果你为了删除错误的目录尝试了以下操作：
```
rmdir letters mom

```
你将会有风险删除目录letters。这里说“风险”，是因为幸运的是rmdir这条用于删除目录的指令，有一个内置的安全措施，如果你试图删除一个非空目录时，它会发出警告。

但是，下面这个：
```
rm -Rf letters mom

```
（注 这是删除目录及其内容的一种非常标准的方式）将完全删除letters目录，甚至永远不会告诉你刚刚发生了什么。

rm命令用于删除文件和目录。当你将它与选项-R（递归删除）和-f（强制删除）一起使用时，它会深入到目录及其子目录中，删除它们包含的所有文件，然后删除子目录本身，然后它将删除所有顶层目录中的文件，再然后是删除目录本身。

`rm -Rf` 是你必须非常小心处理的命令。

我的建议是，你可以使用下划线来代替空格，但如果你仍然坚持使用空格，有两种方法可以使它们起作用。您可以使用单引号或双引号，如下所示：
```
mkdir 'letters mom'
mkdir "letters dad"

```
或者，你可以转义空格。有些字符对shell有特殊意义。正如你所见，空格用于在命令行上分隔选项和参数。 “分离选项和参数”属于“特殊含义”范畴。当你想让shell忽略一个字符的特殊含义时，你需要转义，你可以在它前面放一个反斜杠（\）如：
```
mkdir letters\ mom
mkdir letter\ dad

```
还有其他特殊字符需要转义，如撇号或单引号（'），双引号（“）和＆符号（＆）：
```
mkdir mom\ \&\ dad\'s\ letters

```
我知道你在想什么：如果反斜杠有一个特殊的含义（即告诉shell它必须转义下一个字符），这也使它成为一个特殊的字符。然后，你将如何转义转义字符(\)？

事实证明，你转义任何其他特殊字符都是同样的方式：
```
mkdir special\\characters

```
这将生成一个名为special\characters的目录。

感觉困惑？当然。这就是为什么你应该避免在目录名中使用特殊字符，包括空格。

以防误操作你可以参考下面这个记录特殊字符的列表。

### 总结

  * 使用 `mkdir <directory name>` 创建新目录。
  * 使用 `rmdir <directory name>` 删除目录（仅在目录为空时才有效）。
  * 使用 `rm -Rf <directory name>` 来完全删除目录及其内容 - 请务必谨慎使用。
  * 使用相对路径创建相对于当前目录的目录： `mkdir newdir.`.
  * 使用绝对路径创建相对于根目录(`/`)的目录: `mkdir /home/<username>/newdir`
  * 使用 `..` 在当前目录的上级目录中创建目录： `mkdir ../newdir`
  * 你可以通过在命令行上使用空格分隔目录名来创建多个目录: `mkdir onedir twodir threedir`
  * 同时创建多个目录时，你可以混合使用相对路径和绝对路径: `mkdir onedir twodir /home/<username>/threedir`
  * 在目录名称中使用空格和特殊字符真的会让你很头疼，你最好不要那样做。



有关更多信息，您可以查看`mkdir`, `rmdir` 和 `rm`的手册:
```
man mkdir
man rmdir
man rm

```
要退出手册页，请按键盘[q]键。

### 下次预告

在下一部分中，你将学习如何创建，修改和删除文件，以及你需要了解的有关权限和特权的所有信息!

通过Linux Foundation和edX免费提供的["Introduction to Linux" ][4]课程了解有关Linux的更多信息。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/5/manipulating-directories-linux

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[way-ww](https://github.com/way-ww)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.linux.com/blog/learn/intro-to-linux/2018/4/linux-filesystem-explained
[2]:https://userbase.kde.org/Dolphin
[3]:https://projects-old.gnome.org/nautilus/screenshots.html
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
