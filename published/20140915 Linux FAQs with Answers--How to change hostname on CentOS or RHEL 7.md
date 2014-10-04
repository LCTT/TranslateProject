Linux有问必答：如何在CentOS或RHEL 7上修改主机名
================================================================================
> 问题：在CentOS/RHEL 7上修改主机名的正确方法是什么（永久或临时）？

在CentOS或RHEL中，有三种定义的主机名:a、静态的（static），b、瞬态的（transient），以及 c、灵活的（pretty）。“静态”主机名也称为内核主机名，是系统在启动时从/etc/hostname自动初始化的主机名。“瞬态”主机名是在系统运行时临时分配的主机名，例如，通过DHCP或mDNS服务器分配。静态主机名和瞬态主机名都遵从作为互联网域名同样的字符限制规则。而另一方面，“灵活”主机名则允许使用自由形式（包括特殊/空白字符）的主机名，以展示给终端用户（如Dan's Computer）。

在CentOS/RHEL 7中，有个叫hostnamectl的命令行工具，它允许你查看或修改与主机名相关的配置。

要查看主机名相关的设置：

    $ hostnamectl status 

![](https://farm4.staticflickr.com/3844/15113861225_e0e19783a7.jpg)

只查看静态、瞬态或灵活主机名，分别使用“--static”，“--transient”或“--pretty”选项。

     $ hostnamectl status [--static|--transient|--pretty] 

要同时修改所有三个主机名：静态、瞬态和灵活主机名：

    $ sudo hostnamectl set-hostname <host-name> 

![](https://farm4.staticflickr.com/3855/15113489172_4e25ac87fa_z.jpg)

就像上面展示的那样，在修改静态/瞬态主机名时，任何特殊字符或空白字符会被移除，而提供的参数中的任何大写字母会自动转化为小写。一旦修改了静态主机名，/etc/hostname 将被自动更新。然而，/etc/hosts 不会更新以保存所做的修改，所以你需要手动更新/etc/hosts。

如果你只想修改特定的主机名（静态，瞬态或灵活），你可以使用“--static”，“--transient”或“--pretty”选项。

例如，要永久修改主机名，你可以修改静态主机名：

     $ sudo hostnamectl --static set-hostname <host-name> 

注意，你不必重启机器以激活永久主机名修改。上面的命令会立即修改内核主机名。注销并重新登入后在命令行提示来观察新的静态主机名。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-hostname-centos-rhel-7.html

译者：[GOLinux](https://github.com/GOLinux) 
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
