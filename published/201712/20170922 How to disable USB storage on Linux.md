Linux 上如何禁用 USB 存储
======

为了保护数据不被泄漏，我们使用软件和硬件防火墙来限制外部未经授权的访问，但是数据泄露也可能发生在内部。 为了消除这种可能性，机构会限制和监测访问互联网，同时禁用 USB 存储设备。

在本教程中，我们将讨论三种不同的方法来禁用 Linux 机器上的 USB 存储设备。所有这三种方法都在 CentOS 6＆7 机器上通过测试。那么让我们一一讨论这三种方法，

（另请阅读: [Ultimate guide to securing SSH sessions][1]）

### 方法 1 – 伪安装

在本方法中，我们往配置文件中添加一行 `install usb-storage /bin/true`， 这会让安装 usb-storage 模块的操作实际上变成运行 `/bin/true`， 这也是为什么这种方法叫做`伪安装`的原因。 具体来说就是，在文件夹 `/etc/modprobe.d` 中创建并打开一个名为 `block_usb.conf` (也可能叫其他名字) ，

```
$ sudo vim /etc/modprobe.d/block_usb.conf
```

然后将下行内容添加进去：

```
install usb-storage /bin/true
```

最后保存文件并退出。

### 方法 2 – 删除 USB 驱动

这种方法要求我们将 USB 存储的驱动程序（`usb_storage.ko`）删掉或者移走，从而达到无法再访问 USB 存储设备的目的。 执行下面命令可以将驱动从它默认的位置移走：

```
$ sudo mv /lib/modules/$(uname -r)/kernel/drivers/usb/storage/usb-storage.ko /home/user1
```

现在在默认的位置上无法再找到驱动程序了，因此当 USB 存储器连接到系统上时也就无法加载到驱动程序了，从而导致磁盘不可用。 但是这个方法有一个小问题，那就是当系统内核更新的时候，`usb-storage` 模块会再次出现在它的默认位置。

### 方法 3 - 将 USB 存储器纳入黑名单

我们也可以通过 `/etc/modprobe.d/blacklist.conf` 文件将 usb-storage 纳入黑名单。这个文件在 RHEL/CentOS 6 是现成就有的，但在 7 上可能需要自己创建。 要将 USB 存储列入黑名单，请使用 vim 打开/创建上述文件：

```
$ sudo vim /etc/modprobe.d/blacklist.conf
```

并输入以下行将 USB 纳入黑名单：

```
blacklist usb-storage
```

保存文件并退出。`usb-storage` 就在就会被系统阻止加载，但这种方法有一个很大的缺点，即任何特权用户都可以通过执行以下命令来加载 `usb-storage` 模块，

```
$ sudo modprobe usb-storage
```

这个问题使得这个方法不是那么理想，但是对于非特权用户来说，这个方法效果很好。

在更改完成后重新启动系统，以使更改生效。请尝试用这些方法来禁用 USB 存储，如果您遇到任何问题或有什么疑问，请告知我们。


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/disable-usb-storage-linux/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject)原创编译，[Linux 中国](https://linux.cn/)荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/ultimate-guide-to-securing-ssh-sessions/
