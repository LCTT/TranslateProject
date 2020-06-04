[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to find and remove broken symlinks on Linux)
[#]: via: (https://www.networkworld.com/article/3546252/how-to-find-and-remove-broken-symlinks-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何在 Linux 上查找和删除损坏的符号链接
======
符号链接 （symbolic link） 是指向另一个文件的 Linux 文件。如果删除了引用的文件，符号链接将保留，除非你尝试使用它，否则不会有问题。以下是查找和删除指向文件已被删除的符号链接的简单方法。

符号链接在 Linux 系统上扮演了非常有用的角色。它们可以帮助你记住重要文件在系统上的位置，让你不必为了更方便访问大文件而复制它们，从而更方便地访问它们并节省了大量的空间。

### 什么是符号链接？

通常称它们为 “symlink” 或“软链接”，符号链接是非常小的文件。实际上，符号链接真正包含的是它指向文件的名称，通常包含路径（相对于当前位置或绝对路径）。如果有个名为 **ref1** 的文件指向名为  **/apps/refs/ref-2020** 的文件，那么 **ref1** 的长度将为 19 个字符，即使 ref-202 文件有 2TB。如果指向 **./ref-2020**，那么长度仅为 10 个字符。如果指向 **ref-2020**，那么只有八个。

如果你执行 “vi ref1” 之类的命令（其中 ref1 是符号链接的名称），你将编辑 ref1 指向的文件，而不是符号链接本身的内容。Linux 系统知道如何使用符号链接，并且可以做正确的事。同样，如果你使用诸如 **cat**、**more**、**head** 或 **tail** 之类的命令，那么将查看引用文件的内容。

另一方面，如果删除符号链接，你将删除链接，而不是引用的文件。再说一次，Linux 知道怎么做。符号链接使得使用和共享文件更加容易，仅此而已。

#### 符号链接损坏时

当删除或重命名符号链接指向的文件时，符号链接将不再起作用。符号链接只不过是存储在某个特定目录中的引用而已，它不会随着指向它的文件的更改而更新或删除。即使该文件已经消失了很长时间，它仍然指向被引用的文件。

如果尝试使用指向不存在的文件的符号链接，那么将出现如下错误：

```
$ tail whassup
tail: cannot open 'whassup' for reading: No such file or directory
```

如果你尝试访问指向自身的符号链接（是的，发生了陌生的事情），你将看到类似以下的内容：

```
$ cat loopy
cat: loopy: Too many levels of symbolic links
$ ls -l loopy
lrwxrwxrwx 1 shs shs 5 May 28 18:07 loopy -> loopy
```

以防万一，如果列表中的第一个字母没有引起你的注意，这表示该文件是符号链接。**rwxrwxrwx** 权限是标准权限，并不反映符号链接指向的文件的权限。

### 查找损坏的符号链接

find 命令有一个选项，能让你找到指向不再存在的文件的符号链接。此命令列出当前目录中的符号链接：

```
$ find . -type l
```

“ l”（小写字母 L）告诉 find 命令查找符号链接。

另一方面，下面的命令在当前目录中查找指向不存在的文件的符号链接：

```
$ find . -xtype l
```

为了避免在命令尝试查找你无权检查的文件或目录时发生错误，你可以将所有错误输出到 /dev/null，如下所示：

```
$ find . -xtype l 2>/dev/null
```

你也可以使用此命令找到损坏的符号链接。它比以前的更长，但会做同样的事情：

```
$ find . -type l ! -exec test -e {} \; -print 2>/dev/null
```

### 如何处理损坏的符号链接

除非你知道符号链接引用的文件将被替换，否则最好的方法是直接删除损坏的链接。实际上，如果需要，你可以使用以下命令在单个命令中查找和删除损坏的符号链接：

```
$ find . -xtype l 2>/dev/null -exec rm {} \;
```

该命令的 **rm {}** 部分是“删除文件名”命令

相反，如果你想将符号链接与其他文件相关联，你必须先删除该符号链接，然后重新创建它，使其指向新文件。这是一个例子：

```
$ rm ref1
$ ln -s /apps/data/newfile ref1
```

#### 总结

符号链接使引用的文件更易于查找和使用，但有时它会比路标上那些去年关闭的餐馆广告还要多。查找命令可以帮助你摆脱损坏的符号链接，或在缺少可能仍需要的文件时提醒你。

加入 [Facebook][1] 和 [LinkedIn][2] 上的 Network World 社区，评论热门主题。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3546252/how-to-find-and-remove-broken-symlinks-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
