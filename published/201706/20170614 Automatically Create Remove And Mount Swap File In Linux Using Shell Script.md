在 Linux 中使用 shell 脚本自动创建/移除并挂载交换文件
======

几天前我们写了一篇关于在 Linux 中 3 种创建交换文件的方法，它们是常见的方法，但是需要人工操作。

今天我发现了一个 [Gary Stafford][3] 写的 shell 小脚本（两个 shell 脚本，一个用于创建交换文件，另外一个用于移除交换文件），它可以帮助我们在 Linux 中创建/移除并且自动挂载交换文件。

默认这个脚本创建并挂载 512MB 的交换文件。如果你想要更多的交换空间和不同的文件名，你需要相应地修改脚本。修改脚本不是一件困难的事，因为这是一个容易上手而且很小的脚本。

**推荐阅读：** [Linux 中 3 种简易创建或扩展交换空间的方法][4]

### 如何检查当前交换文件大小

使用 [free][1] 和 `swapon` 命令检查已经存在交换空间。

```
$ free -h
              total        used        free      shared  buff/cache   available
Mem:           2.0G        1.3G        139M         45M        483M        426M
Swap:          2.0G        655M        1.4G

$ swapon --show
NAME      TYPE      SIZE   USED PRIO
/dev/sda5 partition   2G 655.2M   -1
```

上面的输出显示我当前的交换空间是 `2GB`。

### 创建交换文件

创建 `create_swap.sh` 文件并添加下面的内容来自动化交换空间的创建和挂载。

```
$ nano create_swap.sh
#!/bin/sh

# size of swapfile in megabytes
swapsize=1024

# does the swap file already exist?
grep -q "swapfile" /etc/fstab

# if not then create it
if [ $? -ne 0 ]; then
	echo 'swapfile not found. Adding swapfile.'
	fallocate -l ${swapsize}M /swapfile
	chmod 600 /swapfile
	mkswap /swapfile
	swapon /swapfile
	echo '/swapfile none swap defaults 0 0' >> /etc/fstab
else
	echo 'swapfile found. No changes made.'
fi

echo '--------------------------------------------'
echo 'Check whether the swap space created or not?'
echo '--------------------------------------------'
swapon --show
```

给文件添加执行权限。

```
$ sudo +x create_swap.sh
```

运行文件来创建和挂载交换文件。

```
$ sudo ./create_swap.sh

swapfile not found. Adding swapfile.
Setting up swapspace version 1, size = 1024 MiB (1073737728 bytes)
no label, UUID=d9004261-396a-4321-a45f-9923e3e1328c
--------------------------------------------
Check whether the swap space created or not?
--------------------------------------------
NAME      TYPE       SIZE   USED PRIO
/dev/sda5 partition    2G 954.1M   -1
/swapfile file      1024M     0B   -2
```

你可以看到新的 1024M 的 `swapfile`。重启系统以使用新的交换文件。

### 移除交换文件

如果不再需要交换文件，接着创建 `remove_swap.sh` 文件并添加下面的内容来移除交换文件以及它的 `/etc/fstab` 挂载点。

```
$ nano remove_swap.sh
#!/bin/sh

# does the swap file exist?
grep -q "swapfile" /etc/fstab

# if it does then remove it
if [ $? -eq 0 ]; then
	echo 'swapfile found. Removing swapfile.'
	sed -i '/swapfile/d' /etc/fstab
	echo "3" > /proc/sys/vm/drop_caches
	swapoff -a
	rm -f /swapfile
else
	echo 'No swapfile found. No changes made.'
fi

echo '--------------------------------------------'
echo 'Check whether the swap space removed or not?'
echo '--------------------------------------------'
swapon --show
```

并给文件添加可执行权限。

```
$ sudo +x remove_swap.sh
```

运行脚本来移除并卸载交换文件。

```
$ sudo ./remove_swap.sh

swapfile found. Removing swapfile.
swapoff: /dev/sda5: swapoff failed: Cannot allocate memory
--------------------------------------------
Check whether the swap space removed or not?
--------------------------------------------
NAME      TYPE      SIZE   USED PRIO
/dev/sda5 partition   2G 951.8M   -1
```


--------------------------------------------------------------------------------

via: http://www.2daygeek.com/shell-script-create-add-extend-swap-space-linux/

作者：[2DAYGEEK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/free-command-to-check-memory-usage-statistics-in-linux/
[2]:http://www.2daygeek.com/author/2daygeek/
[3]:https://programmaticponderings.com/2013/12/19/scripting-linux-swap-space/
[4]:http://www.2daygeek.com/add-extend-increase-swap-space-memory-file-partition-linux/
