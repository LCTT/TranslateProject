在CentOS上配置基于主机的入侵检测系统（IDS）
================================================================================
所有系统管理员想要在他们生产服务器上首先要部署的安全手段之一，就是检测文件篡改的机制——不仅仅是文件内容，而且也包括它们的属性。

[AIDE][1] （“高级入侵检测环境”的简称）是一个开源的基于主机的入侵检测系统。AIDE通过检查大量文件属性的不一致性来检查系统二进制文件和基本配置文件的完整性，这些文件属性包括权限、文件类型、索引节点、链接数、链接名、用户、组、文件大小、块计数、修改时间、添加时间、创建时间、acl、SELinux安全上下文、xattrs，以及md5/sha校验值在内的各种特征。

AIDE通过扫描一台（未被篡改）的Linux服务器的文件系统来构建文件属性数据库，以后将服务器文件属性与数据库中的进行校对，然后在服务器运行时对被修改的索引了的文件发出警告。出于这个原因，AIDE必须在系统更新后或其配置文件进行合法修改后重新对受保护的文件做索引。

对于某些客户，他们可能会根据他们的安全策略在他们的服务器上强制安装某种入侵检测系统。但是，不管客户是否要求，系统管理员都应该部署一个入侵检测系统，这通常是一个很好的做法。

### 在 CentOS或RHEL 上安装AIDE ###

AIDE的初始安装（同时是首次运行）最好是在系统刚安装完后，并且没有任何服务暴露在互联网甚至局域网时。在这个早期阶段，我们可以将来自外部的一切闯入和破坏风险降到最低限度。事实上，这也是确保系统在AIDE构建其初始数据库时保持干净的唯一途径。（LCTT 译注：当然，如果你的安装源本身就存在安全隐患，则无法建立可信的数据记录）

出于上面的原因，在安装完系统后，我们可以执行下面的命令安装AIDE：

     # yum install aide 

我们需要将我们的机器从网络断开，并实施下面所述的一些基本配置任务。

### 配置AIDE ###

默认配置文件是/etc/aide.conf，该文件介绍了几个示例保护规则（如FIPSR，NORMAL，DIR，DATAONLY），各个规则后面跟着一个等号以及要检查的文件属性列表，或者某些预定义的规则（由+分隔）。你也可以使用此种格式自定义规则。

![](https://farm3.staticflickr.com/2947/15446746115_7d0a291b0a_o.png)

    FIPSR = p+i+n+u+g+s+m+c+acl+selinux+xattrs+sha256
    NORMAL = FIPSR+sha512

例如，上面的例子说明，NORMAL规则将检查下列属性的不一致性：权限（p）、索引节点（i）、链接数（n）、用户（u）、组（g）、大小（s）、修改时间（m）、创建时间（c）、ACL（acl）、SELinux（selinux）、xattrs（xattr）、SHA256/SHA512校验和（sha256和sha512）。

定义的规则可灵活地用于不同的目录和文件（用正则表达式表示）。

![](https://farm6.staticflickr.com/5601/15259978179_f93b757c56_o.png)

条目之前的感叹号（！）告诉AIDE忽略子目录（或目录中的文件），对于这些可以另外定义规则。

在上面的例子中，PERMS是用于/etc机器子目录和文件的默认规则。然而，对于/etc中的备份文件（如/etc/.*~）则不应用任何规则，也没有规则用于/etc/mtab文件。对于/etc中的其它一些选定的子目录或文件，使用NORMAL规则替代默认规则PERMS。

定义并应用正确的规则到系统中正确的位置，是使用AIDE最难的一部分，但作一个好的判断是一个良好的开始。作为首要的一条规则，不要检查不必要的属性。例如，检查/var/log或/var/spool里头的文件的修改时间将导致大量误报，因为许多的应用程序和守护进程经常会写入内容到该位置，而这些内容都没有问题。此外，检查多个校验值可能会加强安全性，但随之而来的是AIDE的运行时间的增加。

可选的，如果你使用MAILTO变量指定电子邮件地址，就可以将检查结果发送到你的邮箱。将下面这一行放到/etc/aide.conf中的任何位置即可。

    MAILTO=root@localhost

### 首次运行AIDE ###

运行以下命令来初始化AIDE数据库：

     # aide --init 

![](https://farm3.staticflickr.com/2942/15446399402_198472e983_o.png)

根据/etc/aide.conf生成的/var/lib/aide/aide.db.new.gz文件需要被重命名为/var/lib/aide/aide.db.gz，以便AIDE能读取它：

     # mv /var/lib/aide/aide.db.new.gz /var/lib/aide.db.gz 

现在，是时候来将我们的系统与数据库进行第一次校对了。任务很简单，只需运行：

     # aide 

在没有选项时，AIDE假定使用了--check选项。

如果在数据库创建后没有对系统做过任何修改，AIDE将会以OK信息来结束本次校对。

![](https://farm3.staticflickr.com/2948/15260041950_f568b3996a_o.png)

### 生产环境中管理AIDE ###

在构建了一个初始AIDE数据库后，作为不断进行的系统管理活动，你常常需要因为某些合法的理由更新受保护的服务器。每次服务器更新后，你必须重新构建AIDE数据库，以更新数据库内容。要完成该任务，请执行以下命令：

     # aide --update 

要使用AIDE保护生产系统，可能最好通过任务计划调用AIDE来周期性检查不一致性。例如，要让AIDE每天运行一次，并将结果发送到邮箱：

     # crontab -e 

----------

    0 0 * * * /usr/sbin/aide --check | /usr/bin/mail -s "AIDE run for $HOSTNAME" your@email.com

### 测试AIDE检查文件篡改 ###

下面的测试环境将演示AIDE是如何来检查文件的完整性的。

#### 测试环境 1 ####

让我们添加一个新文件（如/etc/fake）。

    # cat /dev/null > /etc/fake 

![](https://farm3.staticflickr.com/2941/15260140358_f1d758d354_o.png)

#### 测试环境 2 ####

让我们修改文件权限，然后看看它是否被检测到。

     # chmod 644 /etc/aide.conf 

#### 测试环境 3 ####

最后，让我们修改文件内容（如，添加一个注释行到/etc/aide.conf）。

    echo "#This is a comment" >> /etc/aide.conf 

![](https://farm4.staticflickr.com/3936/15259978229_3ff1ea950e_b.jpg)

上面的截图中，第一栏显示了文件的属性，第二栏是AIDE数据库中的值，而第三栏是更新后的值。第三栏中空白部分表示该属性没有改动（如本例中的ACL）。

### 结尾 ###

如果你曾经发现你自己有很好的理由确信系统被入侵了，但是第一眼又不能确定到底哪些东西被改动了，那么像AIDE这样一个基于主机的入侵检测系统就会很有帮助了，因为它可以帮助你很快识别出哪些东西被改动过，而不是通过猜测来浪费宝贵的时间。

--------------------------------------------------------------------------------

via: http://xmodulo.com/host-intrusion-detection-system-centos.html

作者：[Gabriel Cánepa][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://aide.sourceforge.net/
