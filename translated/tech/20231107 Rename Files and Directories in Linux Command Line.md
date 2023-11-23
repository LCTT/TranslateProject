[#]: subject: "Rename Files and Directories in Linux Command Line"
[#]: via: "https://itsfoss.com/linux-rename-files-directories/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Linux 命令行中重命名文件和目录
======

如何在 Linux 终端中重命名文件和目录？ 你使用 mv 命令。

是的，与用于将文件和文件夹从一个位置“移动”到另一个位置的 mv 命令相同。

你可以在“移动文件和目录”时简单地指定文件和目录的新名称。

要重命名文件，请使用：

````

     mv old_file new_file

````

同样，要重命名目录，请使用：

````

     mv old_dir new_dir

````

听起来很容易，对吧？ 但我将在这里详细讨论文件重命名：

   * 向你展示重命名的实际示例
   * 显示通过结合 find 和 exec 命令批量重命名多个文件的示例
   * 讨论用于批量重命名文件的专用程序



我们来一一看看。

### 使用 mv 命令重命名文件和目录

使用 mv 命令重命名同一目录中的文件：

````

     mv file1.txt file2.txt

````

同样，你可以重命名同一位置的目录：

````

     mv dir1 dir2

````

这是我重命名文件和目录的示例：

![][1]

如你所见，与 [cp 命令][2]不同，你不必使用递归选项来通过 [mv 命令][3]处理目录。

🚧

如果你尝试使用相同的名称重命名该文件，你会看到一个错误（显然）。

你还可以在将文件移动到另一个位置时重命名它：

````

     mv old-file-name another_dir/new-file-name

````

在下面的示例中，我将名为 `firefox-quiz.txt` 的文件移动到示例目录。在这样做的同时，我将其重命名为 `quiz.txt`。

![][4]

我将其视为剪切粘贴操作。

💡

虽然你可以将多个文件移动到另一个位置（mv file1 file2 file2 dir），但你不能使用 mv 重命名多个文件。为此，你必须采用我在以下部分中讨论的其他策略。

### 通过组合 mv、find 和 exec 命令重命名与某个模式匹配的多个文件

🚧

批量重命名此类文件时要格外小心。一步错误的举动就会导致无法挽回的不良结果。

find 命令用于根据文件名、类型、修改时间和其他参数在给定目录中查找文件。[exec 命令与 find][5] 结合使用，对 find 命令的结果执行命令。

没有使用 find、exec 和 mv 命令的固定、标准结构。你可以根据需要组合它们。

假设你想通过在名称中添加 `_old` 来重命名当前目录中以 `.txt` 结尾的所有文件。所以 `file_1.txt` 变成 `file_1.txt_old` 等等。

````

     find . -type f -name "*.txt" -exec mv {} {}_old ;

````

![][6]

这只是一个示例，你的重命名要求可能会有所不同。另外，**以上仅适用于不带空格的文件名**。

**专业提示**：在处理这样的批量操作时，你可以巧妙地使用 echo 命令来查看将执行什么操作，而不是实际执行它。如果看起来不错，那就采取实际行动吧。

例如，首先查看哪些文件将被重命名：

````

     find . -type f -name "*.txt" -exec echo mv {} {}_old \;

````

![][7]

如你所见，实际上没有重命名任何文件。但是，如果你在没有回显的情况下运行上述命令，你将看到将执行什么命令。

如果你觉得没问题，请删除 echo 命令并继续进行实际的重命名。

````

     find . -type f -name "*.txt" -exec mv {} {}_old \;

````

我在 《Efficient Linux at the Command Line》 一书中学到了这个技巧。一本充满了这样的小宝石的优秀书。难怪它已成为[我最喜欢的 Linux 书籍][8]之一。

![][9]

##### 新书：Efficient Linux at the Command Line

非常棒的 Linux 书，里面有很多实用技巧。它填补了这一空白，即使对于经验丰富的 Linux 用户也是如此。你的收藏里一定要有。

[从亚马逊获取][10]

### 使用重命名命令轻松重命名多个文件

有一个名为 rename 的便捷命令行程序，可用于根据给定的 Perl 正则表达式模式批量重命名文件。

该实用程序不是 GNU 工具链的一部分，也不是预安装的。因此，你必须首先使用发行版的包管理器来安装它。

对于 Debian/Ubuntu，命令为：

````

     sudo apt install rename

````

你可以通过以下方式使用它：

````

     rename [options] perl_regex [files]

````

选项有：

   * -v : 详细模式
   * -n ：无操作，显示将被重命名的文件，但不重命名它们
   * -o : 不覆盖
   * -f : 强制覆盖现有文件
   * -s : 不重命名软链接，只重命名其目标



现在，让我们采用你在上一节中看到的相同示例。将 \*.txt 重命名为 .txt_old。

````

     rename 's/\.txt$/.txt_old/' **

````

我不打算在这里解释正则表达式。`**` 表示查看所有子目录中的所有文件。

![][11]

正如你所看到的，它按预期工作。

＃＃＃ 结论

我希望你喜欢这个技巧，它可以帮助你学习在 Linux 命令行中执行基本任务。当然是针对那些想学习和使用命令行的人。桌面用户始终拥有用于此类任务的 GUI 工具。

如果你对 Linux 命令完全陌生，本系列将对你有很大帮助。

![][12]

如果你有疑问或建议，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-rename-files-directories/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/11/renaming-file-directory-linux-command-line.png
[2]: https://itsfoss.com/cp-command/
[3]: https://linuxhandbook.com/mv-command/
[4]: https://itsfoss.com/content/images/2023/11/rename-file-while-moving-another-location.png
[5]: https://linuxhandbook.com/find-exec-command/
[6]: https://itsfoss.com/content/images/2023/11/bulk-renaming-files-linux-1.png
[7]: https://itsfoss.com/content/images/2023/11/use-echo-for-dry-run-renaming-files.png
[8]: https://itsfoss.com/best-linux-books/
[9]: https://itsfoss.com/content/images/2023/04/efficient-at-linux-command-line-horizontal.png
[10]: https://amzn.to/3MPjiHw
[11]: https://itsfoss.com/content/images/2023/11/use-rename-command-linux.png
[12]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
