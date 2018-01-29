如何在使用 scp 命令时递归地排除文件
======

Q：我需要将所有包含 *.c 文件的文件夹从名为 hostA 的本地笔记本复制到 hostB。我使用的是下面的 `scp` 命令，但不知道如何排除特定的文件（如 *.out）：

```
$ scp -r ~/projects/ user@hostB:/home/delta/projects/
```

如何告诉 `scp` 命令在 Linux/Unix 命令行中排除特定的文件或目录？

人们可以使用 `scp` 命令在网络主机之间安全地复制文件。它使用 ssh 进行数据传输和身份验证。典型的语法是：

```
scp file1 user@host:/path/to/dest/
scp -r /path/to/source/ user@host:/path/to/dest/ 
```

### scp 排除文件

我不认为你可以在使用 scp 命令时过滤或排除文件。但是，有一个很好的解决方法来排除文件并使用 ssh 安全地复制它。本页面说明如何在使用 `scp` 递归复制目录时过滤或排除文件。

### 如何使用 rsync 命令排除文件

语法是：

```
rsync av -e ssh --exclude='*.out' /path/to/source/ user@hostB:/path/to/dest/
```

这里：

1.  `-a` ：递归到目录，即复制所有文件和子目录。另外，打开归档模式和所有其他选项（相当于 `-rlptgoD`）
2.  `-v` ：详细输出
3.  `-e ssh` ：使用 ssh 作为远程 shell，这样所有的东西都被加密
4.  `--exclude='*.out'` ：排除匹配模式的文件，例如 *.out 或 *.c 等。


### rsync 命令的例子

在这个例子中，从 `~/virt/` 目录递归地复制所有文件，但排除所有 *.new 文件：

```
$ rsync -av -e ssh --exclude='*.new' ~/virt/ root@centos7:/tmp
```

示例输出：

[![Scp exclude files but using rsync exclude command][2]][2]

如果远程服务器上找不到 `rsync`，那么 `rsync` 命令将失败。在这种情况下，请尝试使用以下 `scp` 命令，该命令在当前目录中使用 [bash shell 模式匹配] [3] （它不能与 `-r` 选项一起使用）：

```
$ ls
```

示例输出：

```
centos71.log centos71.qcow2 centos71.qcow2.new centos71.v2.qcow2.new meta-data user-data
```

复制除 .new 之外的当前目录中的所有内容：

```
$ shopt -s extglob
$ scp !(*.new) root@centos7:/tmp/
```

示例输出：

```
centos71.log 100 % 4262 1.3MB/s 00:00
centos71.qcow2 100 % 836MB 32.7MB/s 00: 25 
meta-data 100 % 47 18.5KB/s 00:00
user-data 100 % 1543 569.7KB/s 00:00
```

有关更多信息，请参阅以下手册页：

```
$ man rsync
$ man bash
$ man scp
```

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/scp-exclude-files-when-using-command-recursively-on-unix-linux/

作者：[Vivek Gite][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/cdn-cgi/l/email-protection
[2]:https://www.cyberciti.biz/media/new/faq/2017/12/scp-exclude-files-on-linux-unix-macos-bash-shell-command-line.jpg
[3]:https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html#Pattern-Matching
[4]:https://www.samba.org/ftp/rsync/rsync.html
[5]:https://man.openbsd.org/scp
