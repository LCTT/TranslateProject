在 Linux 上复制和重命名文件
======
![](https://images.idgesg.net/images/article/2018/05/trees-100759415-large.jpg)
Linux 用户数十年来一直在使用简单的 cp 和 mv 命令来复制和重命名文件。这些命令是我们大多数人第一次了解并且每天可能由数百万人使用的一些命令。但是还有其他技术、方便的方法和另外的命令，这些提供了一些独特的选项。

首先，我们来思考为什么你想要复制一个文件。你可能需要在另一个位置使用同一个文件，或者因为你要编辑该文件而需要一个副本，并且希望确保备有便利的备份以防万一需要恢复原始文件。这样做的显而易见的方式是使用像 “cp myfile myfile-orig” 这样的命令。

但是，如果你想复制大量的文件，那么这个策略可能就会变得很老。更好的选择是：

  * 在开始编辑之前，使用 tar 创建所有要备份的文件的存档。
  * 使用 for 循环来使备份副本更容易。



使用 tar 的方式很简单。对于当前目录中的所有文件，你可以使用如下命令：
```
$ tar cf myfiles.tar *

```

对于一组可以用模式标识的文件，可以使用如下命令：
```
$ tar cf myfiles.tar *.txt

```

在每种情况下，最终都会生成一个 myfiles.tar 文件，其中包含目录中的所有文件或扩展名为 .txt 的所有文件。

一个简单的循环将允许你使用修改后的名称制作备份副本：
```
$ for file in *
> do
> cp $file $file-orig
> done

```

当你备份单个文件并且该文件恰好有一个长名称时，可以依靠使用 tab来补全文件名（在输入足够的字母以便唯一标识该文件后点击 Tab 键）并使用像这样的语法将 “-orig” 附加到副本。
```
$ cp file-with-a-very-long-name{,-orig}

```

然后你有一个 file-with-a-very-long-name 和一个 file-with-a-very-long-name file-with-a-very-long-name-orig。

### 在Linux上重命名文件

重命名文件的传统方法是使用 mv 命令。该命令将文件移动到不同的目录，更改其名称并保留在原位置，或者同时执行这两个操作。
```
$ mv myfile /tmp
$ mv myfile notmyfile
$ mv myfile /tmp/notmyfile

```

但我们也有 rename 命令来做重命名。使用 rename 命令的窍门是习惯它的语法，但是如果你了解一些 perl，你可能发现它并不棘手。

有个非常有用的例子。假设你想重新命名一个目录中的文件，将所有的大写字母替换为小写字母。一般来说，你在 Unix 或 Linux 系统上找不到大量大写字母的文件，但你可以。这里有一个简单的方法来重命名它们，而不必为它们中的每一个使用 mv 命令。  /A-Z/a-z/ 告诉 rename 命令将范围 A-Z 中的任何字母更改为 a-z 中的相应字母。
```
$ ls
Agenda Group.JPG MyFile
$ rename 'y/A-Z/a-z/' *
$ ls
agenda group.jpg myfile

```

你也可以使用 rename 来删除文件扩展名。也许你厌倦了看到带有 .txt 扩展名的文本文件。简单删除它们 - 并用一个命令。
```
$ ls
agenda.txt notes.txt weekly.txt
$ rename 's/.txt//' *
$ ls
agenda notes weekly

```

现在让我们想象一下，你改变了心意，并希望把这些扩展名改回来。没问题。只需修改命令。窍门是理解第一个斜杠前的 “s” 意味着“替代”。前两个斜线之间的内容是我们想要改变的东西，第二个斜线和第三个斜线之间是改变后的东西。所以，$ 表示文件名的结尾，我们将它改为 “.txt”。
```
$ ls
agenda notes weekly
$ rename 's/$/.txt/' *
$ ls
agenda.txt notes.txt weekly.txt

```

你也可以更改文件名的其他部分。牢记 **s/旧内容/新内容/** 规则。
```
$ ls
draft-minutes-2018-03 draft-minutes-2018-04 draft-minutes-2018-05
$ rename 's/draft/approved/' *minutes*
$ ls
approved-minutes-2018-03 approved-minutes-2018-04 approved-minutes-2018-05

```

在上面的例子中注意到，当我们在 “ **s** /old/new/” 中使用 **s**  时，我们用另一个名称替换名称的一部分。当我们使用 **y** 时，我们就是直译（将字符从一个范围替换为另一个范围）。

### 总结

现在有很多复制和重命名文件的方法。我希望其中的一些会让你在使用命令行时更愉快。

在 [Facebook][1] 和 [LinkedIn][2] 上加入 Network World 社区来对热门主题评论。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3276349/linux/copying-and-renaming-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.facebook.com/NetworkWorld/
[2]:https://www.linkedin.com/company/network-world
