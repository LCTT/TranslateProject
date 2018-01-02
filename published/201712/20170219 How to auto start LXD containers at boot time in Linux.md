如何在 Linux 启动时自动启动 LXD 容器
======

Q：我正在使用基于 LXD（“Linux 容器”）的虚拟机。如何在 Linux 系统中启动时自动启动 LXD 容器？

当 LXD 在启动时运行，你就可以随时启动容器。你需要将 `boot.autostart` 设置为 `true`。你可以使用 `boot.autostart.priority`（默认值为 `0`）选项来定义启动容器的顺序（从最高开始）。你也可以使用 `boot.autostart.delay`（默认值 `0`）选项定义在启动一个容器后等待几秒后启动另一个容器。

### 语法

上面讨论的关键字可以使用 `lxc` 工具用下面的语法来设置：

```
$ lxc config set {vm-name} {key} {value}
$ lxc config set {vm-name} boot.autostart {true|false}
$ lxc config set {vm-name} boot.autostart.priority integer
$ lxc config set {vm-name} boot.autostart.delay integer
```

### 如何在 Ubuntu Linux 16.10 中让 LXD 容器在启动时启动？

输入以下命令：

```
$ lxc config set {vm-name} boot.autostart true
```

设置一个 LXD 容器名称 “nginx-vm” 以在启动时启动

```
$ lxc config set nginx-vm boot.autostart true
```

你可以使用以下语法验证设置：

```
$ lxc config get {vm-name} boot.autostart
$ lxc config get nginx-vm boot.autostart
```

示例输出：

```
true
```

你可以使用下面的语法在启动容器后等待 10 秒钟后启动另一个容器：

```
$ lxc config set nginx-vm boot.autostart.delay 10
```

最后，通过设置最高值来定义启动容器的顺序。确保 db_vm 容器首先启动，然后再启动 nginx_vm。

```
$ lxc config set db_vm boot.autostart.priority 100
$ lxc config set nginx_vm boot.autostart.priority 99
```

使用[下面的 bash 循环在 Linux 上查看所有][1]配置值：

```
#!/bin/bash
echo 'The current values of each vm boot parameters:'
for c in db_vm nginx_vm memcache_vm
do
    echo "*** VM: $c ***"
    for v in boot.autostart boot.autostart.priority boot.autostart.delay
    do
        echo "Key: $v => $(lxc config get $c $v) "
    done
    echo ""
done
```

示例输出：

![Fig.01: Get autostarting LXD containers values using a bash shell script][2]


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-auto-start-lxd-containers-at-boot-time-in-linux/

作者：[Vivek Gite][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/bash-for-loop/
[2]:https://www.cyberciti.biz/media/new/faq/2017/02/Autostarting-LXD-containers-values.jpg
