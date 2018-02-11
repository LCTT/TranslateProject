如何在命令行上编辑文件？-- 三个命令行编辑器使用教程
======

此次教程中，我们将向您展示三种命令行编辑文件的方式。本文一共覆盖了三种命令行编辑器，vi（或 vim）、nano 和 emacs。

#### 在命令行上使用 Vi 或 Vim 编辑文件

您可以使用 vi 编辑文件。运行如下命令，打开文件：

```
vi /path/to/file
```

现在，您可以看见文件中的内容了（如果文件存在。请注意，如果此文件不存在，该命令会创建文件）。

vi 最重要的命令莫过于此：

键入 `i` 进入 `Insert`（编辑）模式。如此，您可以编辑文本。

退出编辑模式请键入 `ESC`。

正处于光标之下的字符，使用 `x` 键删除（您千万不要在编辑模式这样做，如果您这样做了，将不会删除光标下的字符，而是会在光标下插入 `x` 字符）。因此，当您仅仅使用 vi 打开文本（此时默认进入指令模式），此时您可以使用 `x` 键立即删除字符。在编辑模式下，您需要键入 `ESC` 退出编辑模式。

如果您做了修改，想要保存文件，请键入 `:x`（同样，您不能在编辑模式执行此操作。请按 `ESC` 退出编辑模式，完成此操作）。

如果您并没有做修改，键入 `:q` 退出文本（您同样不能在编辑模式执行此操作）。

如果您做了修改，但却想不保存文本而之际退出，请键入 `:q!` （同样不能在编辑模式执行此作）。

请注意在上述所有操作中，您都可以使用方向键操控光标在文本中的位置。

以上所有都是 vi 编辑器的内容。请注意，vim 编辑器或多或少也会支持这些操作,如果您有深层次了解 vim 的需求，请看 [这里][1]。

#### 使用 Nano 命令行编辑器编辑文件

接下来是 Nano 编辑器。您可以执行 'nano' 命令调用它：

```
nano
```

这里是 nano 的用户界面：

[![Nano 命令行编辑器][2]][3]

您同样可以使用它启动文件。

```
nano [filename]
```

例如：

```
nano test.txt
```

[![在 nano 中打开文件][4]][5]

如您所见的用户界面，大致被分成四个部分。编辑器顶部显示编辑器版本、正在编辑的文件和编辑状态。然后是实际编辑区域，在这里，您能看见文件的内容。编辑器下方高亮区展示着重要的信息，最后两行显示能执行基础任务地快捷键，切实地帮助初学者。

这里是您前期应当了解的快捷键快表。

使用方向键浏览文本，退格键删除文本，**Ctrl+o** 保存文件修改。当您尝试保存时，nano 会征询您的确认（请参阅截图中主编辑器下方区域）：

[![在 nano 中保存文件][6]][7]

注意，在这个阶段，您有一个选项，可以保存不同的系统格式。键入 **Altd+d** 选择 DOS 格式，**Atl+m** 选择 Mac 格式。

[![以 DOS 格式保存文件][8]][9]

敲回车保存更改。

[![文件已经被保存][10]][11]

继续，文本剪切使用 **Ctrl+K**，文本复制使用 **Ctrl+u**。这些快捷键同样可以用来粘贴剪切单个单词，但您需要先选择好单词，通常，您可以通过键入 **Alt+A**（光标在第一个单词下） 然后使用方向键选择完整的单词。

现在来进行搜索操作。使用 **Ctrl+w** 可以执行一个简单的搜索，同时搜索和替换您可以使用 **Ctrl+\\**。

[![使用 nano 在文件中搜索][12]][13]

这些就是 nano 的一些基础功，它能给您带来一些不错的开始，如果您是初次使用 nano 编辑器。更多内容，请阅读我们的完整内容，点击 [这里][14]。

#### 使用 Emacs 命令行编辑器编辑文件

接下来登场的是 **Emacs**。如果系统未安装此软件，您可以使用下面的命令在您的系统中安装它：

```
sudo apt-get install emacs
```

和 nano 一致，您可以使用下面的方式在 emacs 中直接打开文件：

```
emacs -nw [filename]
```

**注意**：**-nw** 选项确保 emacs 在本窗口启动，而不是打开一个新窗口，默认情况下，它会打开一个新窗口。

一个实例：
```
emacs -nw test.txt

```

下面是编辑器的用户界面：

[![在 emacs 中打开文件][15]][16]

和 nano 一样，emacs 的界面同样被分割成了几个部分。第一部分是最上方的菜单区域，和您在图形界面下的应用程序一致。接下来是显示文本（您打开的文件文本）内容的主编辑区域。 

编辑区域下方坐落着另一个高亮菜单条，显示了文件名，编辑模式（如截图内的‘Text’）和状态（** 已修改，- 未修改，%% 只读状态）。最后是提供输入指令的区域，同时也能查看输出。

现在开始基础操作，当您做了修改、想要保存时，在 **Ctrl+x** 之后键入 **Ctrl+s**。最后，在面板最后一行会向您显示一些信息：‘**Wrote ........’。这里有一个例子：

[![emascs 中保存文件][17]][18]

现在，如果您放弃修改并且退出时，在 **Ctrl+x** 之后键入**Ctrl+c**。编辑器将会立即询问，如下图：

[![emacs 中抛弃修改][19]][20]

输入 ‘n’ 之后键入 ‘yes’，之后编辑器将会不保存而直接退出。

请注意，Emacs 中 ‘C’ 代表 ‘Ctrl’，‘M’ 代表 ‘Alt’。比如，当你看见 C-x，这意味着 Ctrl+x。

至于其他基本编辑器操作，以删除为例，大多数人都会，使用 Backspace/Delete 键。然而，这里的一些删除快捷键能够提高用户体验。比如，使用 **Ctrl+k** 删除一整行，**Alt+d** 删除一个单词，**Alt+k** 删除一个整句。

在键入 ‘ **Ctrl+k** ’ 之后键入 ‘ **u** ’ 将不会生效，输入 **Ctrl+g** 之后输入 **Crel+_** 撤销操作。使用 **Crel+s** 向前搜索，**Ctrl+r** 反向搜索。

[![使用 emacs 在文件中搜索][21]][22]

继续，使用 Alt+Shift+% 执行替换操作。您将被询问替换单词。回复并回车。之后编辑器将会询问您是否替换。例如，下方截图展示了 emacs 询问使用者关于单词 ‘This’ 的替换操作。

[![使用 emacs 替换单词][23]][24]

输入替换文本并回车。每一个替换操作 emacs 都会等待询问，下面是首次询问：

[![确定文本替换][25]][26]

键入 'y' 之后，单词将会被替换。

[![键入 y 确定操作][27]][28]

这些就是几乎所有的基础操作，您在开始使用 emacs 时需要了解掌握的。对了，我们忘记讨论如何访问顶部菜单，其实这些可以通过使用 F10 访问它们。

[![基础编辑器操作][29]][30]

按 Esc 键三次，退出这些菜单。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/faq/how-to-edit-files-on-the-command-line

作者：[falko][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/vim-basics
[2]:https://www.howtoforge.com/images/command-tutorial/nano-basic-ui.png
[3]:https://www.howtoforge.com/images/command-tutorial/big/nano-basic-ui.png
[4]:https://www.howtoforge.com/images/command-tutorial/nano-file-open.png
[5]:https://www.howtoforge.com/images/command-tutorial/big/nano-file-open.png
[6]:https://www.howtoforge.com/images/command-tutorial/nano-save-changes.png
[7]:https://www.howtoforge.com/images/command-tutorial/big/nano-save-changes.png
[8]:https://www.howtoforge.com/images/command-tutorial/nano-mac-format.png
[9]:https://www.howtoforge.com/images/command-tutorial/big/nano-mac-format.png
[10]:https://www.howtoforge.com/images/command-tutorial/nano-changes-saved.png
[11]:https://www.howtoforge.com/images/command-tutorial/big/nano-changes-saved.png
[12]:https://www.howtoforge.com/images/command-tutorial/nano-search-replace.png
[13]:https://www.howtoforge.com/images/command-tutorial/big/nano-search-replace.png
[14]:https://www.howtoforge.com/linux-nano-command/
[15]:https://www.howtoforge.com/images/command-tutorial/nano-file-open1.png
[16]:https://www.howtoforge.com/images/command-tutorial/big/nano-file-open1.png
[17]:https://www.howtoforge.com/images/command-tutorial/emacs-save.png
[18]:https://www.howtoforge.com/images/command-tutorial/big/emacs-save.png
[19]:https://www.howtoforge.com/images/command-tutorial/emacs-quit-without-saving.png
[20]:https://www.howtoforge.com/images/command-tutorial/big/emacs-quit-without-saving.png
[21]:https://www.howtoforge.com/images/command-tutorial/emacs-search.png
[22]:https://www.howtoforge.com/images/command-tutorial/big/emacs-search.png
[23]:https://www.howtoforge.com/images/command-tutorial/emacs-search-replace.png
[24]:https://www.howtoforge.com/images/command-tutorial/big/emacs-search-replace.png
[25]:https://www.howtoforge.com/images/command-tutorial/emacs-replace-prompt.png
[26]:https://www.howtoforge.com/images/command-tutorial/big/emacs-replace-prompt.png
[27]:https://www.howtoforge.com/images/command-tutorial/emacs-replaced.png
[28]:https://www.howtoforge.com/images/command-tutorial/big/emacs-replaced.png
[29]:https://www.howtoforge.com/images/command-tutorial/emacs-accessing-menus.png
[30]:https://www.howtoforge.com/images/command-tutorial/big/emacs-accessing-menus.png
