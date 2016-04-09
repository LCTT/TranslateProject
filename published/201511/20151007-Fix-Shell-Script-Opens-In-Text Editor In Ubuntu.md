修复 Shell 脚本在 Ubuntu 中的默认打开方式
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Run-Shell-Script-on-Double-Click.jpg)

当你双击一个脚本（.sh文件）的时候，你想要做的是什么？通常的想法是执行它。但是在Ubuntu下面却不是这样，或者我应该更确切地说是在Files（Nautilus）中。你可能会疯狂地大叫“运行文件，运行文件”，但是文件没有运行而是用Gedit打开了。

我知道你也许会说文件有可执行权限么？我会说是的。脚本有可执行权限但是当我双击它的时候，它还是用文本编辑器打开了。我不希望这样，如果你遇到了同样的问题，我想你也许也想要这样。

我知道你或许已经被建议在终端下面执行，我知道这个可行，但是这不是一个在GUI下不能运行的借口是么？

这篇教程中，我们会看到**如何在双击后运行shell脚本。**

#### 修复在Ubuntu中shell脚本用文本编辑器打开的方式 ####

shell脚本用文件编辑器打开的原因是Files（Ubuntu中的文件管理器）中的默认行为设置。在更早的版本中，它或许会询问你是否运行文件或者用编辑器打开。默认的行为在新的版本中被修改了。

要修复这个，进入文件管理器，并在菜单中点击**选项**：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/execute-shell-program-ubuntu-1.png)

接下来在**文件选项（Files Preferences）**中进入**行为（Behavior）**标签中，你会看到**可执行的文本文件（Executable Text Files）**选项。

默认情况下，它被设置成“在打开时显示文本文件（View executable text files when they are opend）”。我建议你把它改成“每次询问（Ask each time）”，这样你可以选择是执行还是编辑了，当然了你也可以选择“在打开时云可执行文本文件（Run executable text files when they are opend）”。你可以自行选择。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/execute-shell-program-ubuntu-2.png)

我希望这个贴士可以帮你修复这个小“问题”。欢迎提出问题和建议。

--------------------------------------------------------------------------------

via: http://itsfoss.com/shell-script-opens-text-editor/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
