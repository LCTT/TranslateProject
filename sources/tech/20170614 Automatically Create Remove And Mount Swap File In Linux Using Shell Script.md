Automatically Create/Remove And Mount Swap File In Linux Using Shell Script
============================================================ 


Few days ago we have covered an article about swap file creation in Linux using three ways which is the common method but it requires manual human effort.

Today i have found a small shell script (Two shell script, one for swap file creation and another one for removing swap file) which was written by [Gary Stafford][3] that help us to create/remove & mount swap file automatically in Linux.

By default the script create and mount `512MB` swapfile. If you want more swap space and different file name you have to modify the script accordingly. It’s not a big deal to modify the script since it’s very handy and small script, even though i have colored the line where you want to modify the script.

**Suggested Read : **[3 Easy Ways To Create Or Extend Swap Space In Linux][4]

#### How to check current swap size

Lets first check the size of existing swap space partition using **[free][1]** & `swapon` command.

```
$ free -h
              total        used        free      shared  buff/cache   available
Mem:           2.0G        1.3G        139M         45M        483M        426M
Swap:          2.0G        655M        1.4G

$ swapon --show
NAME      TYPE      SIZE   USED PRIO
/dev/sda5 partition   2G 655.2M   -1
```

The above output clearly shows `2GB` is my current swap space.

#### Create Swap File

Create `create_swap.sh` file and add below script to automate the swap space creation and mounting.

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

Add execute permission to the file.

```
$ sudo +x create_swap.sh
```

Run the file to create and mount swap file.

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

Yes i can see the new `1024M swapfile`. Reboot the system to use the new swap file.

#### Remove Swap File

If the swap file is no longer required, then create `remove_swap.sh` file and add below script to remove swap file and its mount point from /etc/fstab.

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

Add execute permission to the file.

```
$ sudo +x remove_swap.sh
```

Run the file to remve and unmount swap file.

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

<nav class="pagination group" style="display: block; margin: 0px 0px 15px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; zoom: 1;"></nav>

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/shell-script-create-add-extend-swap-space-linux/

作者：[2DAYGEEK ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/free-command-to-check-memory-usage-statistics-in-linux/
[2]:http://www.2daygeek.com/author/2daygeek/
[3]:https://programmaticponderings.com/2013/12/19/scripting-linux-swap-space/
[4]:http://www.2daygeek.com/add-extend-increase-swap-space-memory-file-partition-linux/
