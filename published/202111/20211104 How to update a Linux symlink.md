[#]: subject: "How to update a Linux symlink"
[#]: via: "https://opensource.com/article/21/11/update-linux-file-system-link"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13981-1.html"

如何更新 Linux 的符号链接
======

> 链接一直是 UNIX 文件系统的一个独特的高级功能。

![](https://img.linux.net.cn/data/attachment/album/202111/13/185626ubb832pphjhlpmly.jpg)

UNIX 和 Linux 用户发现链接有很多用途，特别是符号链接。我喜欢使用符号链接的一种方式是管理各种 IT 设备的配置备份。

我有一个目录结构，用来存放我的文档、更新及网络上其他和计算机和设备有关的文件。设备可以包括路由器、接入点、NAS 服务器和笔记本电脑，通常有不同的品牌和版本。配置备份本身可能在目录树的深处，例如 `/home/alan/Documents/network/device/NetgearRL5000/config`。

为了简化备份过程，我在主目录中有一个名为 `Configuration` 的目录。我使用这个目录的符号链接来指向特定的设备目录：

```
:~/Configuration/ $ ls -F1
Router@
Accesspoint@
NAS@
```

**注意**：`ls` 命令的 `-F` 选项在每个文件名上附加特殊字符以表示其类型。如上所示，`@` 符号表示这些是链接。

### 创建一个链接

符号链接 `Router` 指向我的 Netgear RL5000 的 `config` 目录。创建它的命令是 `ln -s`：

```
$ ln -s /home/alan/Documents/network/device/NetgearRL5000/config Router
```

然后，用 `ls -l` 看一下并确认：

```
:~/Configuration/ $ ls -l
Router -> /home/alan/Documents/network/device/NetgearRL5000/config
NAS -> /home/alan/Documents/network/device/NFSBox/config
...
```

这样做的好处是，当对这个设备进行维护时，我只需进入 `~/Configuration/Router`。

如果我决定用一个新的型号替换这个路由器，使用符号链接的第二个好处就很明显了。我可能会把旧的路由器改成一个接入点。因此，它的目录并没有被删除。相反，我有一个新的目录，对应于新的路由器，也许是华硕 DF-3760。我创建这个目录并确认它的存在：

```
$ mkdir -p ~/Documents/network/device/ASUSDF-3760/config
```

```
:~/Documents/network/device/ $ ls
NetgearRL5000
ASUSDF-3760
NFSBox
...
```

另一个例子是，如果你的办公室里有几个接入点。你可以使用符号链接在逻辑上代表每一个，用一个通用的名字，如 `ap1`，`ap2`，等等，或者你可以使用描述性的词语，如 `ap_floor2`，`ap_floor3`，等等。这样，当物理设备随时间变化时，你不必持续更新任何可能管理它们的进程，因为它们是在处理链接而不是实际的设备目录。

### 更新一个链接

由于我的主路由器已经改变，我想让路由器的符号链接指向它的目录。我可以使用 `rm` 和 `ln` 命令来删除和创建一个新的符号链接，但是有一种方法可以只用 `ln` 命令和几个选项就可以一步完成：

```
:~/Configuration/ $ ln -vfns ~/Documents/network/device/ASUSDF-3760/config/ Router
'Router' -> '/home/alan/Documents/network/device/ASUSDF-3760/config/'
:~/Configuration/ $ ls -l
Router -> /home/alan/Documents/network/device/ASUSDF-3760/config
NAS -> /home/alan/Documents/network/device/NFSBox/config
```

根据手册页，这些选项如下：

- `-v`、`--verbose`：打印每个链接文件的名称
- `-f`、`--force`：删除目标文件（有必要，因为已经存在一个链接）
- `-n`、`--no-dereference`：如果链接名是一个目录的符号链接，就把它当作一个正常的文件
- `-s`、`--symbolic`：制作符号链接而不是硬链接

### 总结

链接是 UNIX 和 Linux 文件系统中最强大的功能之一。其他操作系统也曾试图模仿这种能力，但由于他们的文件系统缺乏基本的链接设计，这些系统从来没有工作得那么好，也没有那么可用。

上面的演示只是利用链接在生活生产环境中无缝浏览不断变化的目录结构的众多可能性中的一种。链接提供了一个永远不会长期静态的组织所需的灵活性。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/update-linux-file-system-link

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/links.png?itok=enaPOi4L (Links)
