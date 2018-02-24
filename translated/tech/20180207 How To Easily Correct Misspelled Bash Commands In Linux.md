如何在 Linux 中轻松修正拼写错误的 Bash 命令
======

![](https://www.ostechnix.com/wp-content/uploads/2018/02/Correct-Misspelled-Bash-Commands-720x340.png)

我知道你可以按下向上箭头来调出你运行过的命令，然后使用左/右键移动到拼写错误的单词，并更正拼写错误的单词，最后按回车键再次运行它，对吗？可是等等。还有一种更简单的方法可以纠正 GNU/Linux 中拼写错误的 Bash 命令。这个教程解释了如何做到这一点。请继续阅读。

### 在 Linux 中纠正拼写错误的 Bash 命令

你有没有运行过类似于下面的错误输入命令？
```
$ unme -r
bash: unme: command not found

```

你注意到了吗？上面的命令中有一个错误。我在 “uname” 命令缺少了字母 “a”。

我在很多时候犯过这种愚蠢的错误。在我知道这个技巧之前，我习惯按下向上箭头来调出命令并转到命令中拼写错误的单词，纠正拼写错误，然后按回车键再次运行该命令。但相信我。下面的技巧非常易于纠正你刚刚运行的命令中的任何拼写错误。

要轻松更正上述拼写错误的命令，只需运行：
```
$ ^nm^nam^

```

这会将 “uname” 命令中将 “nm” 替换为 “nam”。很酷，是吗？它不仅纠正错别字，而且还能运行命令。查看下面的截图。

![][2]

当你在命令中输入错字时使用这个技巧。请注意，它仅适用于 Bash shell。

**额外提示：**

你有没有想过在使用 “cd” 命令时如何自动纠正拼写错误？没有么？没关系！下面的技巧将解释如何做到这一点。

这个技巧只能纠正使用 “cd” 命令时的拼写错误。

比如说，你想使用命令切换到 “Downloads” 目录：
```
$ cd Donloads
bash: cd: Donloads: No such file or directory

```

哎呀！没有名称为 “Donloads” 的文件或目录。是的，正确的名称是 “Downloads”。上面的命令中缺少 “w”。

要解决此问题并在使用 cd 命令时自动更正错误，请编辑你的 **.bashrc** 文件：
```
$ vi ~/.bashrc

```

最后添加以下行。
```
[...]
shopt -s cdspell

```

输入 **:wq** 保存并退出文件。

最后，运行以下命令更新更改。
```
$ source ~/.bashrc

```

现在，如果在使用 cd 命令时路径中存在任何拼写错误，它将自动更正并进入正确的目录。

![][3]

正如你在上面的命令中看到的那样，我故意输错（“Donloads” 而不是 “Downloads”），但 Bash 自动检测到正确的目录名并 cd 进入它。

[**Fish**][4] 和**Zsh** shell 内置的此功能。所以，如果你使用的是它们，那么你不需要这个技巧。

然而，这个技巧有一些局限性。它只适用于使用正确的大小写。在上面的例子中，如果你输入的是 “cd donloads” 而不是 “cd Donloads”，它将无法识别正确的路径。另外，如果路径中缺少多个字母，它也不起作用。


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/easily-correct-misspelled-bash-commands-linux/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/02/misspelled-command.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/02/cd-command.png
[4]:https://www.ostechnix.com/install-fish-friendly-interactive-shell-linux/
