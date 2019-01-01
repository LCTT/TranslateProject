如何在 Linux 中一次重命名多个文件
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/Rename-Multiple-Files-720x340.png)

你可能已经知道，我们使用 `mv` 命令在类 Unix 操作系统中重命名或者移动文件和目录。 但是，`mv` 命令不支持一次重命名多个文件。 不用担心。 在本教程中，我们将学习使用 Linux 中的 `mmv` 命令一次重命名多个文件。 此命令用于在类 Unix 操作系统中使用标准通配符批量移动、复制、追加和重命名文件。

### 在 Linux 中一次重命名多个文件

`mmv` 程序可在基于 Debian 的系统的默认仓库中使用。 要想在 Debian、Ubuntu、Linux Mint 上安装它，请运行以下命令：

```
$ sudo apt-get install mmv
```

我们假设你在当前目录中有以下文件。

```
$ ls
a1.txt a2.txt a3.txt
```

现在，你想要将所有以字母 “a” 开头的文件重命名为以 “b” 开头的。 当然，你可以在几秒钟内手动执行此操作。 但是想想你是否有数百个文件想要重命名？ 这是一个非常耗时的过程。 这时候 `mmv` 命令就很有帮助了。

要将所有以字母 “a” 开头的文件重命名为以字母 “b” 开头的，只需要运行：

```
$ mmv a\* b\#1
```

让我们检查一下文件是否都已经重命名了。

```
$ ls
b1.txt b2.txt b3.txt
```

如你所见，所有以字母 “a” 开头的文件（即 `a1.txt`、`a2.txt`、`a3.txt`）都重命名为 `b1.txt`、`b2.txt`、`b3.txt`。

**解释**

在上面的例子中，第一个参数（`a\*`）是 “from” 模式，第二个参数是 “to” 模式（`b\#1`）。根据上面的例子，`mmv` 将查找任何以字母 “a” 开头的文件名，并根据第二个参数重命名匹配的文件，即 “to” 模式。我们可以使用通配符，例如用 `*`、`?` 和 `[]` 来匹配一个或多个任意字符。请注意，你必须转义使用通配符，否则它们将被 shell 扩展，`mmv` 将无法理解。

“to” 模式中的 `#1` 是通配符索引。它匹配 “from” 模式中的第一个通配符。 “to” 模式中的 `#2` 将匹配第二个通配符（如果有的话），依此类推。在我们的例子中，我们只有一个通配符（星号），所以我们写了一个 `#1`。并且，`#` 符号也应该被转义。此外，你也可以用引号括起模式。

你甚至可以将具有特定扩展名的所有文件重命名为其他扩展名。例如，要将当前目录中的所有 `.txt` 文件重命名为 `.doc` 文件格式，只需运行：

```
$ mmv \*.txt \#1.doc
```

这是另一个例子。 我们假设你有以下文件。

```
$ ls
abcd1.txt abcd2.txt abcd3.txt
```

你希望在当前目录下的所有文件中将第一次出现的 “abc” 替换为 “xyz”。 你会怎么做呢？

很简单。

```
$ mmv '*abc*' '#1xyz#2'
```

请注意，在上面的示例中，模式被单引号括起来了。

让我们检查下 “abc” 是否实际上被替换为 “xyz”。

```
$ ls
xyzd1.txt xyzd2.txt xyzd3.txt
```

看到没？ 文件 `abcd1.txt`、`abcd2.txt` 和 `abcd3.txt` 已经重命名为 `xyzd1.txt`、`xyzd2.txt` 和 `xyzd3.txt`。

`mmv` 命令的另一个值得注意的功能是你可以使用 `-n` 选项打印输出而不是重命名文件，如下所示。

```
$ mmv -n a\* b\#1
a1.txt -> b1.txt
a2.txt -> b2.txt
a3.txt -> b3.txt
```

这样，你可以在重命名文件之前简单地验证 `mmv` 命令实际执行的操作。

有关更多详细信息，请参阅 man 页面。

```
$ man mmv
```

### 更新：Thunar 文件管理器

**Thunar 文件管理器**默认具有内置**批量重命名**选项。 如果你正在使用 Thunar，那么重命名文件要比使用 `mmv` 命令容易得多。

Thunar 在大多数 Linux 发行版的默认仓库库中都可用。

要在基于 Arch 的系统上安装它，请运行：

```
$ sudo pacman -S thunar
```

在 RHEL、CentOS 上:

```
$ sudo yum install thunar
```

在 Fedora 上:

```
$ sudo dnf install thunar
```

在 openSUSE 上:

```
$ sudo zypper install thunar
```

在 Debian、Ubuntu、Linux Mint 上:

```
$ sudo apt-get install thunar
```

安装后，你可以从菜单或应用程序启动器中启动批量重命名程序。 要从终端启动它，请使用以下命令：

```
$ thunar -B
```

批量重命名方式如下。

![][1]

单击“+”，然后选择要重命名的文件列表。 批量重命名可以重命名文件的名称、文件的后缀或者同时重命名文件的名称和后缀。 Thunar 目前支持以下批量重命名：

- 插入日期或时间
- 插入或覆盖
- 编号
- 删除字符
- 搜索和替换
- 大写或小写

当你从选项列表中选择其中一个条件时，你将在“新名称”列中看到更改的预览，如下面的屏幕截图所示。

![][2]

选择条件后，单击“重命名文件”选项来重命名文件。

你还可以通过选择两个或更多文件从 Thunar 中打开批量重命名器。 选择文件后，按 F2 或右键单击并选择“重命名”。

嗯，这就是本次的所有内容了。希望有所帮助。更多干货即将到来。敬请关注！

祝快乐！

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-rename-multiple-files-at-once-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: http://www.ostechnix.com/wp-content/uploads/2018/06/bulk-rename.png
[2]: http://www.ostechnix.com/wp-content/uploads/2018/06/bulk-rename-1.png
