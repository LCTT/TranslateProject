How to auto start LXD containers at boot time in Linux
======
I am using LXD ("Linux container") based VM. How do I set an LXD container to start on boot in Linux operating system?

You can always start the container when LXD starts on boot. You need to set boot.autostart to true. You can define the order to start the containers in (starting with highest first) using boot.autostart.priority (default value is 0) option. You can also define the number of seconds to wait after the container started before starting the next one using boot.autostart.delay (default value 0) option.

### Syntax

Above discussed keys can be set using the lxc tool with the following syntax:
```
$ lxc config set {vm-name} {key} {value}
$ lxc config set {vm-name} boot.autostart {true|false}
$ lxc config set {vm-name} boot.autostart.priority integer
$ lxc config set {vm-name} boot.autostart.delay integer
```

### How do I set an LXD container to start on boot in Ubuntu Linux 16.10?

Type the following command:
`$ lxc config set {vm-name} boot.autostart true`
Set an LXD container name 'nginx-vm' to start on boot
`$ lxc config set nginx-vm boot.autostart true`
You can verify setting using the following syntax:
```
$ lxc config get {vm-name} boot.autostart
$ lxc config get nginx-vm boot.autostart
```
Sample outputs:
```
true
```

You can the 10 seconds to wait after the container started before starting the next one using the following syntax:
`$ lxc config set nginx-vm boot.autostart.delay 10`
Finally, define the order to start the containers in by setting with highest value. Make sure db_vm container start first and next start nginx_vm
```
$ lxc config set db_vm boot.autostart.priority 100
$ lxc config set nginx_vm boot.autostart.priority 99
```
Use [the following bash for loop on Linux to view all][1] values:
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


Sample outputs:
![Fig.01: Get autostarting LXD containers values using a bash shell script][2]


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-auto-start-lxd-containers-at-boot-time-in-linux/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/bash-for-loop/
[2]:https://www.cyberciti.biz/media/new/faq/2017/02/Autostarting-LXD-containers-values.jpg
