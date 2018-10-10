如何在 Ubuntu Linux 中使用 RAR 文件
======

[RAR][1] 是一种非常好的归档文件格式。但相比之下 7-zip 能提供了更好的压缩率，并且默认情况下还可以在多个平台上轻松支持 Zip 文件。不过 RAR 仍然是最流行的归档格式之一。然而 [Ubuntu][2] 自带的归档管理器却不支持提取 RAR 文件，也不允许创建 RAR 文件。

办法总比问题多。只要安装 `unrar` 这款由 [RARLAB][3] 提供的免费软件，就能在 Ubuntu 上支持提取 RAR 文件了。你也可以安装 `rar`  试用版来创建和管理 RAR 文件。

![RAR files in Ubuntu Linux][4]

### 提取 RAR 文件

在未安装 `unrar` 的情况下，提取 RAR 文件会报出“未能提取”错误，就像下面这样（以 [Ubuntu 18.04][5] 为例）：

![Error in RAR extraction in Ubuntu][6]

如果要解决这个错误并提取 RAR 文件，请按照以下步骤安装 `unrar`：

打开终端并输入：

```
sudo apt-get install unrar
```

安装 `unrar` 后，直接输入 `unrar` 就可以看到它的用法以及如何使用这个工具处理 RAR 文件。

最常用到的功能是提取 RAR 文件。因此，可以**通过右键单击 RAR 文件并执行提取**，也可以借助此以下命令通过终端执行操作：

```
unrar x FileName.rar
```

结果类似以下这样：

![Using unrar in Ubuntu][7]

如果压缩文件没放在家目录中，就必须使用 `cd` 命令移动到目标目录下。例如 RAR 文件如果在 `Music` 目录下，只需要使用 `cd Music` 就可以移动到相应的目录，然后提取 RAR 文件。

### 创建和管理 RAR 文件

![Using rar archive in Ubuntu Linux][8]

`unrar` 不允许创建 RAR 文件。因此还需要安装 `rar` 命令行工具才能创建 RAR 文件。

要创建 RAR 文件，首先需要通过以下命令安装 `rar`：

```
sudo apt-get install rar
```

按照下面的命令语法创建 RAR 文件：

```
rar a ArchiveName File_1 File_2 Dir_1 Dir_2
```

按照这个格式输入命令时，它会将目录中的每个文件添加到 RAR 文件中。如果需要某一个特定的文件，就要指定文件确切的名称或路径。

默认情况下，RAR 文件会放置在**家目录**中。

以类似的方式，可以更新或管理 RAR 文件。同样是使用以下的命令语法：

```
rar u ArchiveName Filename
```

在终端输入 `rar` 就可以列出 RAR 工具的相关命令。

### 总结

现在你已经知道如何在 Ubuntu 上管理 RAR 文件了，你会更喜欢使用 7-zip、Zip 或 Tar.xz 吗？

欢迎在评论区中评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/use-rar-ubuntu-linux/

作者：[Ankush Das][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[1]: https://www.rarlab.com/rar_file.htm
[2]: https://www.ubuntu.com/
[3]: https://www.rarlab.com/
[4]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/rar-ubuntu-linux.png
[5]: https://itsfoss.com/things-to-do-after-installing-ubuntu-18-04/
[6]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/extract-rar-error.jpg
[7]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/unrar-rar-extraction.jpg
[8]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/rar-update-create.jpg

