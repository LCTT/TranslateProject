[#]: subject: "**How I manage files from the Linux command lin**e"
[#]: via: "https://opensource.com/article/22/7/manage-files-linux-command-line"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "Donkey"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Linux 中如何使用命令行管理文件
======
如果你更喜欢用终端与系统交互，请查看我最喜欢的管理文件的命令。

![Files in a folder][1]

在如 GNOME 或 KDE 等图形桌面中使用鼠标点击管理文件。你点击文件的图标将它移动到另一个文件夹中，或者移动到回收站里。图形交互使得桌面计算 (desktop computing) 方便使用。

但是在 Linux 中，我们并不总是与图形界面交互。如果你在服务器上工作，那么你可能需要使用命令行来解决问题。即使像我这样使用桌面的用户，可能也更喜欢使用终端和命令行和系统交互。我倾向于通过命令行运行命令来管理我的文件：

### 使用 ls 显示文件

```
ls
```

对任何使用命令行的人来说，如果不知道有什么文件，工作将很难进行下去。[ls 命令][2] 会罗列出文件夹中的文件。例如，要查看 Web 服务器的文档根目录 `/var/www/html` 中的内容，你可以键入：

```
ls /var/www/html
```

大多数情况，我使用 `ls` 命令查看当前文件夹内的文件。只需要输入 `ls` 即可查看所有文件。例如，当我在我的网页项目的根目录时，输入 `ls` 后可以看到这些：

```
$ ls
about  fontawesome      fonts   index.php  styles
docs   fontawesome.zip  images  prism
```

`ls` 命令包含 60 种选项，可以以任意方式显示文件和目录。`-l` 是一个很有用的选项，可以详细的显示文件，包含权限、文件大小以及所有者等信息。

```
$ ls -l

total 6252
drwxrwxr-x. 2 jhall jhall    4096 Jun 22 16:18 about
drwxr-xr-x. 2 jhall jhall    4096 Jun 25 16:35 docs
drwxr-xr-x. 2 jhall jhall    4096 Jun  7 00:00 fontawesome
-rw-r--r--. 1 jhall jhall 6365962 Jun  2 16:26 fontawesome.zip
drwxrwxr-x. 2 jhall jhall    4096 Jun 22 16:17 fonts
drwxr-xr-x. 2 jhall jhall    4096 Jun 25 13:03 images
-rw-rw-r--. 1 jhall jhall     327 Jun 22 16:38 index.php
drwxrwxr-x. 2 jhall jhall    4096 Jun 22 16:18 prism
drwxrwxr-x. 2 jhall jhall    4096 Jun 22 16:17 styles
```

上方的文件大小是以字节为单位，或许看起来有点吃力。想要以方便我们阅读的格式查看文件大小，只需要添加 `-h` 或 `--human-readable` 选项，能以 `G` 、`M` 、`K` 为单位显示文件大小。

```
$ ls -l --human-readable
total 6.2M
drwxrwxr-x. 2 jhall jhall 4.0K Jun 22 16:18 about
drwxr-xr-x. 2 jhall jhall 4.0K Jun 25 16:35 docs
drwxr-xr-x. 2 jhall jhall 4.0K Jun  7 00:00 fontawesome
-rw-r--r--. 1 jhall jhall 6.1M Jun  2 16:26 fontawesome.zip
drwxrwxr-x. 2 jhall jhall 4.0K Jun 22 16:17 fonts
drwxr-xr-x. 2 jhall jhall 4.0K Jun 25 13:03 images
-rw-rw-r--. 1 jhall jhall  327 Jun 22 16:38 index.php
drwxrwxr-x. 2 jhall jhall 4.0K Jun 22 16:18 prism
drwxrwxr-x. 2 jhall jhall 4.0K Jun 22 16:17 styles
```

现在，`ls` 将 zip 文件显示为 `6.1M` 或刚刚超过 6 MB 的文件大小，而不是 `6365962`。

### 使用 cat ，head 和 tail 命令查看文件

```
cat
```

```
head
```

```
tail
```

当显示出文件后，需要检查文件夹中的内容。使用很少一些命令即可做到。以我的 Web 服务器中的 `docs` 文件夹为例：

```
$ ls docs
chapter1.tex  chapter4.tex  chapter7.tex  lorem.txt
chapter2.tex  chapter5.tex  chapter8.tex  readme.txt
chapter3.tex  chapter6.tex  chapter9.tex  workbook.tex
```

这些文件是什么？我不知道，幸运的是该目录中有一个 `readme.txt` 文件，我猜它包含了这个项目目录中文件的描述。如果该文件不是很长，那我可以使用 `cat` 命令查看它：

```
$ cat docs/readme.txt 
This is the workbook for the C programming self-paced
video series. The main file is the workbook.tex file,
which includes the other chapters.
```

如果这个文件很长，则可以使用 `head` 命令查看文件的前几行。该命令通常显示前 10 行的内容，不过你也可以使用 `-n` 或者 `--lines` 选项来指定行数。例如，使用这两个 `head` 命令的选项查看 `lorem.txt` 文件的前三行：

```
$ head -n 3 docs/lorem.txt 
Lorem ipsum dolor sit amet, consectetur adipiscing
elit. Nullam at ligula eget nunc feugiat pharetra. Nullam
nec vulputate augue. Suspendisse tincidunt aliquet

$ head --lines=3 docs/lorem.txt 
Lorem ipsum dolor sit amet, consectetur adipiscing
elit. Nullam at ligula eget nunc feugiat pharetra. Nullam
nec vulputate augue. Suspendisse tincidunt aliquet
```

如果我想要查看文件的最后几行的内容，可以以相同方式使用 `tail` 命令。同样，这两个 `tail` 命令分别显示 `lorem.txt` 文件的最后三行：

```
$ tail -n 3 docs/lorem.txt 
egestas sodales. Vivamus tincidunt ex sed tellus tincidunt
varius. Nunc commodo volutpat risus, vitae luctus lacus
malesuada tempor. Nulla facilisi.

$ tail --lines=3 docs/lorem.txt 
egestas sodales. Vivamus tincidunt ex sed tellus tincidunt
varius. Nunc commodo volutpat risus, vitae luctus lacus
malesuada tempor. Nulla facilisi.
```

使用 `head` 和 `tail` 命令在服务器中查看日志文件十分有用。我有一个小型 Web 服务器运行在家庭网络，用于在网站上线前的测试。最近我发现 Web 服务器的日志很长，我好奇它存在多久了。使用 `head` 命令，我只打印第一行，可以看到该日志文件是在 2020 年 12 月创建的：

```
$ ls -l --human-readable /var/log/httpd
total 13M
-rw-r--r--. 1 root root 13M Jun 25 16:23 access_log
-rw-r--r--. 1 root root 45K Jun  2 00:00 error_log

$ sudo head -n 1 /var/log/httpd/access_log
10.0.0.177 - - [05/Dec/2020:14:58:35 -0600] "GET / HTTP/1.1" 403 5564 "-" "Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36"
```

**[[ 相关阅读：Linux cat 命令入门 ]][3]**

### 使用 rm 命令删除文件

```
rm
```

在包含示例文本文件的目录中，`lorem.txt` 文件中包含 “乱数假文” (`Lorem Ipsum`) 文本。这只是印刷行业中使用的虚拟文本，因此 "lorem.txt" 文件并不属于该项目。让我们用 `rm` 命令删除这样的文件：

```
$ ls docs
chapter1.tex  chapter4.tex  chapter7.tex  lorem.txt
chapter2.tex  chapter5.tex  chapter8.tex  readme.txt
chapter3.tex  chapter6.tex  chapter9.tex  workbook.tex

$ rm docs/lorem.txt 

$ ls docs
chapter1.tex  chapter4.tex  chapter7.tex  readme.txt
chapter2.tex  chapter5.tex  chapter8.tex  workbook.tex
chapter3.tex  chapter6.tex  chapter9.tex
```

由于用 `rm` 命令删除的文件会直接删除，而不会放入回收站，因此它很危险。安装 trash 命令比较安全，例如 [trashy][4] 或 [trash-cli][5] 命令。这样你可以在文件永久删除前，将其放入暂存区。

```
$ rm docs/lorem.txt
```

只需很少的命令即可在命令行中管理文件。使用 `ls` 命令显示目录中的文件，使用 `cat` 、`head` 和 `tail` 命令查看文件中的内容。使用 `rm` 或者安全的 `trash` 命令将不需要的文件删除。这五个命令足以帮你在 Linux 中管理文件。想要了解更多，可以使用 `--hep` 选项来查看如何使用这些命令。例如使用 `ls --help` 查看 `ls` 命令如何使用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/manage-files-linux-command-line

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/files_documents_paper_folder.png
[2]: https://opensource.com/article/19/7/master-ls-command
[3]: https://opensource.com/article/19/2/getting-started-cat-command
[4]: https://gitlab.com/trashy/trashy
[5]: https://github.com/andreafrancia/trash-cli
