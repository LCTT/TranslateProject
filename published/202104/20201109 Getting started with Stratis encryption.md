[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13311-1.html)
[#]: subject: (Getting started with Stratis encryption)
[#]: via: (https://fedoramagazine.org/getting-started-with-stratis-encryption/)
[#]: author: (briansmith https://fedoramagazine.org/author/briansmith/)

Stratis 加密入门
======

![](https://img.linux.net.cn/data/attachment/album/202104/19/094919orzaxwl5axiqqfiu.jpg)

Stratis 在其 [官方网站][2] 上被描述为“_易于使用的 Linux 本地存储管理_”。请看这个 [短视频][3]，快速演示基础知识。该视频是在 Red Hat Enterprise Linux 8 系统上录制的。视频中显示的概念也适用于 Fedora 中的 Stratis。

Stratis 2.1 版本引入了对加密的支持。继续阅读以了解如何在 Stratis 中开始加密。

### 先决条件

加密需要 Stratis 2.1 或更高版本。这篇文章中的例子使用的是 Fedora 33 的预发布版本。Stratis 2.1 将用在 Fedora 33 的最终版本中。

你还需要至少一个可用的块设备来创建一个加密池。下面的例子是在 KVM 虚拟机上完成的，虚拟磁盘驱动器为 5GB（`/dev/vdb`）。

### 在内核密钥环中创建一个密钥

Linux 内核<ruby>密钥环<rt>keyring</rt></ruby>用于存储加密密钥。关于内核密钥环的更多信息，请参考 `keyrings` 手册页（`man keyrings`）。  

使用 `stratis key set` 命令在内核钥匙圈中设置密钥。你必须指定从哪里读取密钥。要从标准输入中读取密钥，使用 `-capture-key` 选项。要从文件中读取密钥，使用 `-keyfile-path <file>` 选项。最后一个参数是一个密钥描述。它将稍后你创建加密的 Stratis 池时使用。

例如，要创建一个描述为 `pool1key` 的密钥，并从标准输入中读取密钥，可以输入：

```
# stratis key set --capture-key pool1key
Enter desired key data followed by the return key:
```

该命令提示我们输入密钥数据/密码，然后密钥就创建在内核密钥环中了。

要验证密钥是否已被创建，运行 `stratis key list`：

```
# stratis key list
Key Description
pool1key
```

这将验证是否创建了 `pool1key`。请注意，这些密钥不是持久的。如果主机重启，在访问加密的 Stratis 池之前，需要再次提供密钥（此过程将在后面介绍）。

如果你有多个加密池，它们可以有一个单独的密钥，也可以共享同一个密钥。

也可以使用以下 `keyctl` 命令查看密钥：

```
# keyctl get_persistent @s
318044983
# keyctl show
Session Keyring
 701701270 --alswrv      0     0  keyring: _ses
 649111286 --alswrv      0 65534   \_ keyring: _uid.0
 318044983 ---lswrv      0 65534   \_ keyring: _persistent.0
1051260141 --alswrv      0     0       \_ user: stratis-1-key-pool1key
```

### 创建加密的 Stratis 池

现在已经为 Stratis 创建了一个密钥，下一步是创建加密的 Stratis 池。加密池只能在创建池时进行。目前不可能对现有的池进行加密。

使用 `stratis pool create` 命令创建一个池。添加 `-key-desc` 和你在上一步提供的密钥描述（`pool1key`）。这将向 Stratis 发出信号，池应该使用提供的密钥进行加密。下面的例子是在 `/dev/vdb` 上创建 Stratis 池，并将其命名为 `pool1`。确保在你的系统中指定一个空的/可用的设备。

```
# stratis pool create --key-desc pool1key pool1 /dev/vdb
```

你可以使用 `stratis pool list` 命令验证该池是否已经创建：

```
# stratis pool list
Name                     Total Physical   Properties
pool1   4.98 GiB / 37.63 MiB / 4.95 GiB      ~Ca, Cr
```

在上面显示的示例输出中，`~Ca` 表示禁用了缓存（`~` 否定了该属性）。`Cr` 表示启用了加密。请注意，缓存和加密是相互排斥的。这两个功能不能同时启用。

接下来，创建一个文件系统。下面的例子演示了创建一个名为 `filesystem1` 的文件系统，将其挂载在 `/filesystem1` 挂载点上，并在新文件系统中创建一个测试文件：

```
# stratis filesystem create pool1 filesystem1
# mkdir /filesystem1
# mount /stratis/pool1/filesystem1 /filesystem1
# cd /filesystem1
# echo "this is a test file" > testfile
```

### 重启后访问加密池

当重新启动时，你会发现 Stratis 不再显示你的加密池或它的块设备：

```
# stratis pool list
Name   Total Physical   Properties
```

```
# stratis blockdev list
Pool Name   Device Node   Physical Size   Tier
```

要访问加密池，首先要用之前使用的相同的密钥描述和密钥数据/口令重新创建密钥：

```
# stratis key set --capture-key pool1key
Enter desired key data followed by the return key:
```

接下来，运行 `stratis pool unlock` 命令，并验证现在可以看到池和它的块设备：

```
# stratis pool unlock
# stratis pool list
Name                      Total Physical   Properties
pool1   4.98 GiB / 583.65 MiB / 4.41 GiB      ~Ca, Cr
# stratis blockdev list
Pool Name   Device Node   Physical Size   Tier
pool1       /dev/dm-2          4.98 GiB   Data
```

接下来，挂载文件系统并验证是否可以访问之前创建的测试文件：

```
# mount /stratis/pool1/filesystem1 /filesystem1/
# cat /filesystem1/testfile
this is a test file
```

### 使用 systemd 单元文件在启动时自动解锁 Stratis 池

可以在启动时自动解锁 Stratis 池，无需手动干预。但是，必须有一个包含密钥的文件。在某些环境下，将密钥存储在文件中可能会有安全问题。

下图所示的 systemd 单元文件提供了一个简单的方法来在启动时解锁 Stratis 池并挂载文件系统。欢迎提供更好的/替代方法的反馈。你可以在文章末尾的评论区提供建议。

首先用下面的命令创建你的密钥文件。确保用之前输入的相同的密钥数据/密码来代替`passphrase`。

```
# echo -n passphrase > /root/pool1key
```

确保该文件只能由 root 读取：

```
# chmod 400 /root/pool1key
# chown root:root /root/pool1key
```

在 `/etc/systemd/system/stratis-filesystem1.service` 创建包含以下内容的 systemd 单元文件：

```
[Unit]
Description = stratis mount pool1 filesystem1 file system
After = stratisd.service

[Service]
ExecStartPre=sleep 2
ExecStartPre=stratis key set --keyfile-path /root/pool1key pool1key
ExecStartPre=stratis pool unlock
ExecStartPre=sleep 3
ExecStart=mount /stratis/pool1/filesystem1 /filesystem1
RemainAfterExit=yes

[Install]
WantedBy = multi-user.target
```

接下来，启用服务，使其在启动时运行：

```
# systemctl enable stratis-filesystem1.service
```

现在重新启动并验证 Stratis 池是否已自动解锁，其文件系统是否已挂载。

### 结语

在今天的环境中，加密是很多人和组织的必修课。本篇文章演示了如何在 Stratis 2.1 中启用加密功能。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-with-stratis-encryption/

作者：[briansmith][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/briansmith/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/stratis-encryption-2-816x345.jpg
[2]: https://stratis-storage.github.io/
[3]: https://www.youtube.com/watch?v=CJu3kmY-f5o
