[#]: subject: (Using network bound disk encryption with Stratis)
[#]: via: (https://fedoramagazine.org/network-bound-disk-encryption-with-stratis/)
[#]: author: (briansmith https://fedoramagazine.org/author/briansmith/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13340-1.html)

使用 Stratis 的网络绑定磁盘加密
======

![](https://img.linux.net.cn/data/attachment/album/202104/27/221704gyzyvyroyyrybany.jpg)

在一个有许多加密磁盘的环境中，解锁所有的磁盘是一项困难的任务。<ruby>网络绑定磁盘加密<rt>Network bound disk encryption</rt></ruby>（NBDE）有助于自动解锁 Stratis 卷的过程。这是在大型环境中的一个关键要求。Stratis 2.1 版本增加了对加密的支持，这在《[Stratis 加密入门][4]》一文中介绍过。Stratis 2.3 版本最近在使用加密的 Stratis 池时引入了对网络绑定磁盘加密（NBDE）的支持，这是本文的主题。

[Stratis 网站][5] 将 Stratis 描述为一个“_易于使用的 Linux 本地存储管理_”。短视频《[使用 Stratis 管理存储][6]》对基础知识进行了快速演示。该视频是在 Red Hat Enterprise Linux 8 系统上录制的，然而，视频中显示的概念也适用于 Fedora Linux 中的 Stratis。

### 先决条件

本文假设你熟悉 Stratis，也熟悉 Stratis 池加密。如果你不熟悉这些主题，请参考这篇 [文章][4] 和前面提到的 [Stratis 概述视频][6]。

NBDE 需要 Stratis 2.3 或更高版本。本文中的例子使用的是 Fedora Linux 34 的预发布版本。Fedora Linux 34 的最终版本将包含 Stratis 2.3。

### 网络绑定磁盘加密（NBDE）概述

加密存储的主要挑战之一是有一个安全的方法在系统重启后再次解锁存储。在大型环境中，手动输入加密口令并不能很好地扩展。NBDE 解决了这一问题，允许以自动方式解锁加密存储。

在更高层次上，NBDE 需要环境中的 Tang 服务器。客户端系统（使用 Clevis Pin）只要能与 Tang 服务器建立网络连接，就可以自动解密存储。如果网络没有连接到 Tang 服务器，则必须手动解密存储。

这背后的想法是，Tang 服务器只能在内部网络上使用，因此，如果加密设备丢失或被盗，它将不再能够访问内部网络连接到 Tang 服务器，因此不会被自动解密。

关于 Tang 和 Clevis 的更多信息，请参见手册页（`man tang`、`man clevis`）、[Tang 的 GitHub 页面][7] 和 [Clevis 的 GitHub 页面][8]。

### 设置 Tang 服务器

本例使用另一个 Fedora Linux 系统作为 Tang 服务器，主机名为 `tang-server`。首先安装 `tang` 包。

```
dnf install tang
```

然后用 `systemctl` 启用并启动 `tangd.socket`。

```
systemctl enable tangd.socket --now
```

Tang 使用的是 TCP 80 端口，所以你也需要在防火墙中打开该端口。

```
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=80/tcp
```

最后，运行 `tang-show-keys` 来显示输出签名密钥指纹。你以后会需要这个。

```
# tang-show-keys
l3fZGUCmnvKQF_OA6VZF9jf8z2s
```

### 创建加密的 Stratis 池

上一篇关于 Stratis 加密的文章详细介绍了如何设置加密的 Stratis 池，所以本文不会深入介绍。

第一步是捕获一个将用于解密 Stratis 池的密钥。即使使用 NBDE，也需要设置这个，因为在 NBDE 服务器无法到达的情况下，可以用它来手动解锁池。使用以下命令捕获 `pool1` 密钥。

```
# stratis key set --capture-key pool1key
Enter key data followed by the return key:
```

然后我将使用 `/dev/vdb` 设备创建一个加密的 Stratis 池（使用刚才创建的 `pool1key`），命名为 `pool1`。

```
# stratis pool create --key-desc pool1key pool1 /dev/vdb。
```

接下来，在这个 Stratis 池中创建一个名为 `filesystem1` 的文件系统，创建一个挂载点，挂载文件系统，并在其中创建一个测试文件：

```
# stratis filesystem create pool1 filesystem1
# mkdir /filesystem1
# mount /dev/stratis/pool1/filesystem1 /filesystem1
# cd /filesystem1
# echo "this is a test file" > testfile
```

### 将 Stratis 池绑定到 Tang 服务器上

此时，我们已经创建了加密的 Stratis 池，并在池中创建了一个文件系统。下一步是将你的 Stratis 池绑定到刚刚设置的 Tang 服务器上。使用 `stratis pool bind nbde` 命令进行。

当你进行 Tang 绑定时，需要向该命令传递几个参数：

  * 池名（在本例中，`pool1`）
  * 钥匙描述符名称（本例中为 `pool1key`）
  * Tang 服务器名称（在本例中，`http://tang-server`）

记得之前在 Tang 服务器上，运行了 `tang-show-keys`，显示 Tang 输出的签名密钥指纹是 `l3fZGUCmnvKQF_OA6VZF9jf8z2s`。除了前面的参数外，还需要用参数 `-thumbprint l3fZGUCmnvKQF_OA6VZF9jf8z2s` 传递这个指纹，或者用 `-trust-url` 参数跳过对指纹的验证。

使用 `-thumbprint` 参数更安全。例如：

```
# stratis pool bind nbde pool1 pool1key http://tang-server --thumbprint l3fZGUCmnvKQF_OA6VZF9jf8z2s
```

### 用 NBDE 解锁 Stratis 池

接下来重启主机，并验证你可以用 NBDE 解锁 Stratis 池，而不需要使用密钥口令。重启主机后，该池不再可用：

```
# stratis pool list
Name Total Physical Properties
```

要使用 NBDE 解锁池，请运行以下命令：

```
# stratis pool unlock clevis
```

注意，你不需要使用密钥口令。这个命令可以在系统启动时自动运行。

此时，Stratis 池已经可以使用了：

```
# stratis pool list
Name Total Physical Properties
pool1 4.98 GiB / 583.65 MiB / 4.41 GiB ~Ca, Cr
```

你可以挂载文件系统，访问之前创建的文件：

```
# mount /dev/stratis/pool1/filesystem1 /filesystem1/
# cat /filesystem1/testfile
this is a test file
```

### 轮换 Tang 服务器密钥

最好定期轮换 Tang 服务器密钥，并更新 Stratis 客户服务器以使用新的 Tang 密钥。

要生成新的 Tang 密钥，首先登录到 Tang 服务器，查看 `/var/db/tang` 目录的当前状态。然后，运行 `tang-show-keys` 命令：

```
# ls -al /var/db/tang
total 8
drwx------. 1 tang tang 124 Mar 15 15:51 .
drwxr-xr-x. 1 root root 16 Mar 15 15:48 ..
-rw-r--r--. 1 tang tang 361 Mar 15 15:51 hbjJEDXy8G8wynMPqiq8F47nJwo.jwk
-rw-r--r--. 1 tang tang 367 Mar 15 15:51 l3fZGUCmnvKQF_OA6VZF9jf8z2s.jwk
# tang-show-keys
l3fZGUCmnvKQF_OA6VZF9jf8z2s
```

要生成新的密钥，运行 `tangd-keygen` 并将其指向 `/var/db/tang` 目录：

```
# /usr/libexec/tangd-keygen /var/db/tang
```

如果你再看看 `/var/db/tang` 目录，你会看到两个新文件：

```
# ls -al /var/db/tang
total 16
drwx------. 1 tang tang 248 Mar 22 10:41 .
drwxr-xr-x. 1 root root 16 Mar 15 15:48 ..
-rw-r--r--. 1 tang tang 361 Mar 15 15:51 hbjJEDXy8G8wynMPqiq8F47nJwo.jwk
-rw-r--r--. 1 root root 354 Mar 22 10:41 iyG5HcF01zaPjaGY6L_3WaslJ_E.jwk
-rw-r--r--. 1 root root 349 Mar 22 10:41 jHxerkqARY1Ww_H_8YjQVZ5OHao.jwk
-rw-r--r--. 1 tang tang 367 Mar 15 15:51 l3fZGUCmnvKQF_OA6VZF9jf8z2s.jwk
```

如果你运行 `tang-show-keys`，就会显示出 Tang 所公布的密钥：

```
# tang-show-keys
l3fZGUCmnvKQF_OA6VZF9jf8z2s
iyG5HcF01zaPjaGY6L_3WaslJ_E
```

你可以通过将两个原始文件改名为以句号开头的隐藏文件，来防止旧的密钥（以 `l3fZ` 开头）被公布。通过这种方法，旧的密钥将不再被公布，但是它仍然可以被任何没有更新为使用新密钥的现有客户端使用。一旦所有的客户端都更新使用了新密钥，这些旧密钥文件就可以删除了。

```
# cd /var/db/tang
# mv hbjJEDXy8G8wynMPqiq8F47nJwo.jwk   .hbjJEDXy8G8wynMPqiq8F47nJwo.jwk
# mv l3fZGUCmnvKQF_OA6VZF9jf8z2s.jwk   .l3fZGUCmnvKQF_OA6VZF9jf8z2s.jwk
```

此时，如果再运行 `tang-show-keys`，Tang 只公布新钥匙：

```
# tang-show-keys
iyG5HcF01zaPjaGY6L_3WaslJ_E
```

下一步，切换到你的 Stratis 系统并更新它以使用新的 Tang 密钥。当文件系统在线时， Stratis 支持这样做。

首先，解除对池的绑定：

```
# stratis pool unbind pool1
```

接下来，用创建加密池时使用的原始口令设置密钥：

```
# stratis key set --capture-key pool1key
Enter key data followed by the return key:
```

最后，用更新后的密钥指纹将 Stratis 池绑定到 Tang 服务器上：

```
# stratis pool bind nbde pool1 pool1key http://tang-server --thumbprint iyG5HcF01zaPjaGY6L_3WaslJ_E
```

Stratis 系统现在配置为使用更新的 Tang 密钥。一旦使用旧的 Tang 密钥的任何其他客户系统被更新，在 Tang 服务器上的 `/var/db/tang` 目录中被重命名为隐藏文件的两个原始密钥文件就可以被备份和删除了。

### 如果 Tang 服务器不可用怎么办？

接下来，关闭 Tang 服务器，模拟它不可用，然后重启 Stratis 系统。

重启后，Stratis 池又不可用了：

```
# stratis pool list
Name Total Physical Properties
```

如果你试图用 NBDE 解锁，会因为 Tang 服务器不可用而失败：

```
# stratis pool unlock clevis
Execution failed:
An iterative command generated one or more errors: The operation 'unlock' on a resource of type pool failed. The following errors occurred:
Partial action "unlock" failed for pool with UUID 4d62f840f2bb4ec9ab53a44b49da3f48: Cryptsetup error: Failed with error: Error: Command failed: cmd: "clevis" "luks" "unlock" "-d" "/dev/vdb" "-n" "stratis-1-private-42142fedcb4c47cea2e2b873c08fcf63-crypt", exit reason: 1 stdout: stderr: /dev/vdb could not be opened.
```

此时，在 Tang 服务器无法到达的情况下，解锁池的唯一选择就是使用原密钥口令：

```
# stratis key set --capture-key pool1key
Enter key data followed by the return key:
```

然后你可以使用钥匙解锁池：

```
# stratis pool unlock keyring
```

接下来，验证池是否成功解锁：

```
# stratis pool list
Name Total Physical Properties
pool1 4.98 GiB / 583.65 MiB / 4.41 GiB ~Ca, Cr
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/network-bound-disk-encryption-with-stratis/

作者：[briansmith][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/briansmith/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/03/stratis-nbde-816x345.jpg
[2]: https://unsplash.com/@imattsmart?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/lock?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://linux.cn/article-13311-1.html
[5]: https://stratis-storage.github.io/
[6]: https://www.youtube.com/watch?v=CJu3kmY-f5o
[7]: https://github.com/latchset/tang
[8]: https://github.com/latchset/clevis
