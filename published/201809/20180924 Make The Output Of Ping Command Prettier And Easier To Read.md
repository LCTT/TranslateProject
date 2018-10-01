如何让 Ping 的输出更简单易读
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/prettyping-720x340.png)

众所周知，`ping` 命令可以用来检查目标主机是否可达。使用 `ping` 命令的时候，会发送一个 ICMP Echo 请求，通过目标主机的响应与否来确定目标主机的状态。如果你经常使用 `ping` 命令，你可以尝试一下 `prettyping`。Prettyping 只是将一个标准的 ping 工具增加了一层封装，在运行标准 `ping` 命令的同时添加了颜色和 unicode 字符解析输出，所以它的输出更漂亮紧凑、清晰易读。它是用 `bash` 和 `awk` 编写的自由开源工具，支持大部分类 Unix 操作系统，包括 GNU/Linux、FreeBSD 和 Mac OS X。Prettyping 除了美化 `ping` 命令的输出，还有很多值得注意的功能。

  * 检测丢失的数据包并在输出中标记出来。
  * 显示实时数据。每次收到响应后，都会更新统计数据，而对于普通 `ping` 命令，只会在执行结束后统计。
  * 可以灵活处理“未知信息”（例如错误信息），而不搞乱输出结果。
  * 能够避免输出重复的信息。
  * 兼容常用的 `ping` 工具命令参数。
  * 能够由普通用户执行。
  * 可以将输出重定向到文件中。
  * 不需要安装，只需要下载二进制文件，赋予可执行权限即可执行。
  * 快速且轻巧。
  * 输出结果清晰直观。

### 安装 Prettyping

如上所述，Prettyping 是一个绿色软件，不需要任何安装，只要使用以下命令下载 Prettyping 二进制文件：

```
$ curl -O https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
```

将二进制文件放置到 `$PATH`（例如 `/usr/local/bin`）中：

```
$ sudo mv prettyping /usr/local/bin
```

然后对其赋予可执行权限：

```
$ sudo chmod +x /usr/local/bin/prettyping
```

就可以使用了。

### 让 ping 的输出清晰易读

安装完成后，通过 `prettyping` 来 ping 任何主机或 IP 地址，就可以以图形方式查看输出。

```
$ prettyping ostechnix.com
```

输出效果大概会是这样：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/prettyping-in-action.gif)

如果你不带任何参数执行 `prettyping`，它就会一直运行直到被 `ctrl + c` 中断。

由于 Prettyping 只是一个对普通 `ping` 命令的封装，所以常用的 ping 参数也是有效的。例如使用 `-c 5` 来指定 ping 一台主机的 5 次：

```
$ prettyping -c 5 ostechnix.com
```

Prettyping 默认会使用彩色输出，如果你不喜欢彩色的输出，可以加上 `--nocolor` 参数：

```
$ prettyping --nocolor ostechnix.com
```

同样的，也可以用 `--nomulticolor` 参数禁用多颜色支持：

```
$ prettyping --nomulticolor ostechnix.com
```

使用 `--nounicode` 参数禁用 unicode 字符：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/prettyping-without-unicode-support.png)

如果你的终端不支持 UTF-8，或者无法修复系统中的 unicode 字体，只需要加上 `--nounicode` 参数就能轻松解决。

Prettyping 支持将输出的内容重定向到文件中，例如执行以下这个命令会将 `prettyping ostechnix.com` 的输出重定向到 `ostechnix.txt` 中：

```
$ prettyping ostechnix.com | tee ostechnix.txt
```

Prettyping 还有很多选项帮助你完成各种任务，例如：

  * 启用/禁用延时图例（默认启用）
  * 强制按照终端的格式输出（默认自动）
  * 在统计数据中统计最后的 n 次 ping（默认 60 次）
  * 覆盖对终端尺寸的自动检测
  * 指定 awk 解释器路径（默认：`awk`）
  * 指定 ping 工具路径（默认：`ping`）


查看帮助文档可以了解更多：

```
$ prettyping --help
```

尽管 Prettyping 没有添加任何额外功能，但我个人喜欢它的这些优点：

  * 实时统计 —— 可以随时查看所有实时统计信息，标准 `ping` 命令只会在命令执行结束后才显示统计信息。
  * 紧凑的显示 —— 可以在终端看到更长的时间跨度。
  * 检测丢失的数据包并显示出来。

如果你一直在寻找可视化显示 `ping` 命令输出的工具，那么 Prettyping 肯定会有所帮助。尝试一下，你不会失望的。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/prettyping-make-the-output-of-ping-command-prettier-and-easier-to-read/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/

