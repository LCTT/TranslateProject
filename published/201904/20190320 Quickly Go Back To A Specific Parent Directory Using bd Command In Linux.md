[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10695-1.html)
[#]: subject: (Quickly Go Back To A Specific Parent Directory Using bd Command In Linux)
[#]: via: (https://www.2daygeek.com/bd-quickly-go-back-to-a-specific-parent-directory-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 中使用 bd 命令快速返回到特定的父目录
======

两天前我们写了一篇关于 `autocd` 的文章，它是一个内置的 shell 变量，可以帮助我们在[没有 cd 命令的情况下导航到目录中][1]。

如果你想回到上一级目录，那么你需要输入 `cd ..`。

如果你想回到上两级目录，那么你需要输入 `cd ../..`。

这在 Linux 中是正常的，但如果你想从第九级目录回到第三级目录，那么使用 `cd` 命令是很糟糕的。

有什么解决方案呢？

是的，在 Linux 中有一个解决方案。我们可以使用 `bd` 命令来轻松应对这种情况。

### 什么是 bd 命令？

`bd` 命令允许用户快速返回 Linux 中的父目录，而不是反复输入 `cd ../../..`。

你可以列出给定目录的内容，而不用提供完整路径 ls `bd Directory_Name`。它支持以下其它命令，如 `ls`、`ln`、`echo`、`zip`、`tar` 等。

另外，它还允许我们执行 shell 文件而不用提供完整路径 bd p`/shell_file.sh`。

### 如何在 Linux 中安装 bd 命令？

除了 Debian/Ubuntu 之外，`bd` 没有官方发行包。因此，我们需要手动执行方法。

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][2]或[APT 命令][3]来安装 `bd`。

```
$ sudo apt install bd
```

对于其它 Linux 发行版，使用 [wget 命令][4]下载 `bd` 可执行二进制文件。

```
$ sudo wget --no-check-certificate -O /usr/local/bin/bd https://raw.github.com/vigneshwaranr/bd/master/bd
```

设置 `bd` 二进制文件的可执行权限。

```
$ sudo chmod +rx /usr/local/bin/bd
```

在 `.bashrc` 文件中添加以下值。

```
$ echo 'alias bd=". bd -si"' >> ~/.bashrc
```

运行以下命令以使更改生效。

```
$ source ~/.bashrc
```

要启用自动完成，执行以下两个步骤。

```
$ sudo wget -O /etc/bash_completion.d/bd https://raw.github.com/vigneshwaranr/bd/master/bash_completion.d/bd  
$ sudo source /etc/bash_completion.d/bd
```

我们已经在系统上成功安装并配置了 `bd` 实用程序，现在是时候测试一下了。

我将使用下面的目录路径进行测试。

运行 `pwd` 命令或 `dirs` 命令，亦或是 `tree` 命令来了解你当前的路径。

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ pwd
或
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ dirs

/usr/share/icons/Adwaita/256x256/apps
```

我现在在 `/usr/share/icons/Adwaita/256x256/apps` 目录，如果我想快速跳转到 `icons` 目录，那么只需输入以下命令即可。

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ bd icons
/usr/share/icons/
daygeek@Ubuntu18:/usr/share/icons$
```

甚至，你不需要输入完整的目录名称，也可以输入几个字母。

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ bd i
/usr/share/icons/
daygeek@Ubuntu18:/usr/share/icons$ 
```

注意：如果层次结构中有多个同名的目录，`bd` 会将你带到最近的目录。（不考虑直接的父目录）

如果要列出给定的目录内容，使用以下格式。它会打印出 `/usr/share/icons/` 的内容。

```
$ ls -lh `bd icons`
或
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ ls -lh `bd i`
total 64K
drwxr-xr-x 12 root root 4.0K Jul 25  2018 Adwaita
lrwxrwxrwx  1 root root   51 Feb 25 14:32 communitheme -> /snap/communitheme/current/share/icons/communitheme
drwxr-xr-x  2 root root 4.0K Jul 25  2018 default
drwxr-xr-x  3 root root 4.0K Jul 25  2018 DMZ-Black
drwxr-xr-x  3 root root 4.0K Jul 25  2018 DMZ-White
drwxr-xr-x  9 root root 4.0K Jul 25  2018 gnome
drwxr-xr-x  3 root root 4.0K Jul 25  2018 handhelds
drwxr-xr-x 20 root root 4.0K Mar  9 14:52 hicolor
drwxr-xr-x  9 root root 4.0K Jul 25  2018 HighContrast
drwxr-xr-x 12 root root 4.0K Jul 25  2018 Humanity
drwxr-xr-x  7 root root 4.0K Jul 25  2018 Humanity-Dark
drwxr-xr-x  4 root root 4.0K Jul 25  2018 locolor
drwxr-xr-x  3 root root 4.0K Feb 25 15:46 LoginIcons
drwxr-xr-x  3 root root 4.0K Jul 25  2018 redglass
drwxr-xr-x 10 root root 4.0K Feb 25 15:46 ubuntu-mono-dark
drwxr-xr-x 10 root root 4.0K Feb 25 15:46 ubuntu-mono-light
drwxr-xr-x  3 root root 4.0K Jul 25  2018 whiteglass
```

如果要在父目录中的某个位置执行文件，使用以下格式。它将运行 shell 文件 `/usr/share/icons/users-list.sh`。

```
$ `bd i`/users-list.sh
或
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ `bd icon`/users-list.sh
daygeek
thanu
renu
2gadmin
testuser
demouser
sudha
suresh
user1
user2
user3
```

如果你位于 `/usr/share/icons/Adwaita/256x256/apps` 中，想要导航到不同的父目录，使用以下格式。以下命令将导航到 `/usr/share/icons/gnome` 目录。

```
$ cd `bd i`/gnome
或
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ cd `bd icon`/gnome
daygeek@Ubuntu18:/usr/share/icons/gnome$ 
```

如果你位于 `/usr/share/icons/Adwaita/256x256/apps` ，你想在 `/usr/share/icons/` 下创建一个新目录，使用以下格式。

```
$ daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ sudo mkdir `bd icons`/2g

daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ ls -ld `bd icon`/2g
drwxr-xr-x 2 root root 4096 Mar 16 05:44 /usr/share/icons//2g
```

本教程允许你快速返回到特定的父目录，但没有快速前进的选项。

我们有另一个解决方案，很快就会提出，请保持关注。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bd-quickly-go-back-to-a-specific-parent-directory-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/navigate-switch-directory-without-using-cd-command-in-linux/
[2]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/wget-command-line-download-utility-tool/
