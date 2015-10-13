RHCSA 系列（十二）: 使用 Kickstart 完成 RHEL 7 的自动化安装
================================================================================

无论是在数据中心还是实验室环境，Linux 服务器很少是独立的机器，很可能有时你需要安装多个以某种方式相互联系的机器。假如你将在单个服务器上手动安装 RHEL 7 所花的时间乘以你需要配置的机器数量，这将导致你必须做出一场相当长的努力，而通过使用被称为 kicksta 的无人值守安装工具则可以避免这样的麻烦。

在这篇文章中，我们将向你展示使用 kickstart 工具时所需的一切，以便在安装过程中，不用你时不时地照看“处在襁褓中”的服务器。

![RHEL 7 的自动化 Kickstart 安装](http://www.tecmint.com/wp-content/uploads/2015/05/Automatic-Kickstart-Installation-of-RHEL-7.jpg)

*RHCSA： RHEL 7 的自动化 Kickstart 安装*

#### Kickstart 和自动化安装简介 ####

Kickstart 是一种被用来执行无人值守操作系统安装和配置的自动化安装方法，主要被 RHEL（以及其他 Fedora 的副产品，如 CentOS，Oracle Linux 等）所使用。因此，kickstart 安装方法可使得系统管理员只需考虑需要安装的软件包组和系统的配置，便可以得到相同的系统，从而省去必须手动安装这些软件包的麻烦。

### 准备 Kickstart 安装 ###

要执行 kickstart 安装，我们需要遵循下面的这些步骤：

1. 创建一个 Kickstart 文件，它是一个带有多个预定义配置选项的纯文本文件。

2. 将 Kickstart 文件保存在可移动介质上，如一个硬盘或一个网络位置。kickstart 客户端需要使用 `rhel-server-7.0-x86_64-boot.iso` 镜像文件，而你还需要可从一个网络资源上获取得到完整的 ISO 镜像 `rhel-server-7.0-x86_64-dvd.iso` ，例如通过一个 FTP 服务器的 HTTP 服务形式（在我们当前的例子中，我们将使用另一个 IP 地址为 192.168.0.18 的 RHEL 7 机器）。

3. 开始 Kickstart 安装。

要创建一个 kickstart 文件，请登录你的红帽客户门户网站（Red Hat Customer Portal）帐户，并使用 [Kickstart 配置工具][1] 来选择所需的安装选项。在向下滑动之前请仔细阅读每个选项，然后选择最适合你需求的选项：

![Kickstart 配置工具](http://www.tecmint.com/wp-content/uploads/2015/05/Kickstart-Configuration-Tool.png)

*Kickstart 配置工具*

假如你指定安装将通过 HTTP，FTP，NFS 来执行，请确保服务器上的防火墙允许这些服务通过。

尽管你可以使用红帽的在线工具来创建一个 kickstart 文件，但你还可以使用下面的代码来作为参考手动地创建它。例如，你可以注意到，下面的代码指定了安装过程将使用英语环境，使用拉丁美洲键盘布局，并设定时区为 America/Argentina/San_Luis 时区：

    lang en_US
    keyboard la-latin1
    timezone America/Argentina/San_Luis --isUtc
    rootpw $1$5sOtDvRo$In4KTmX7OmcOW9HUvWtfn0 --iscrypted
    #platform x86, AMD64, or Intel EM64T
    text
    url --url=http://192.168.0.18//kickstart/media
    bootloader --location=mbr --append="rhgb quiet crashkernel=auto"
    zerombr
    clearpart --all --initlabel
    autopart
    auth --passalgo=sha512 --useshadow
    selinux --enforcing
    firewall --enabled
    firstboot --disable
    %packages
    @base
    @backup-server
    @print-server
    %end

在上面的在线配置工具中，在选择以 HTTP 来作为安装源后，设置好在安装过程中使用 192.168.0.18 来作为 HTTP 服务器的地址，`/kickstart/tecmint.bin` 作为 HTTP 目录。

在上面的 kickstart 示例文件中，你需要特别注意

    url --url=http://192.168.0.18//kickstart/media

这个目录是你展开 DVD 或 ISO 安装介质内容的地方。在执行解压之前，我们将把 ISO 安装文件作为一个回环设备挂载到 /media/rhel 目录下：

    # mount -o loop /var/www/html/kickstart/rhel-server-7.0-x86_64-dvd.iso /media/rhel

![挂载 RHEL ISO 镜像](http://www.tecmint.com/wp-content/uploads/2015/05/Mount-RHEL-ISO-Image.png)

*挂载 RHEL ISO 镜像*

接下来，复制 /media/rhel 中的全部文件到 /var/www/html/kickstart/media 目录：

    # cp -R /media/rhel /var/www/html/kickstart/media

这一步做完后，/var/www/html/kickstart/media 目录中的文件列表和磁盘使用情况将如下所示：

![Kickstart 媒体文件](http://www.tecmint.com/wp-content/uploads/2015/05/Kickstart-media-Files.png)

*Kickstart 媒体文件*

现在，我们已经准备好开始 kickstart 安装了。

不管你如何选择创建 kickstart 文件的方式，在执行安装之前检查下这个文件的语法是否有误总是一个不错的主意。为此，我们需要安装 pykickstart 软件包。

    # yum update && yum install pykickstart

然后使用 ksvalidator 工具来检查这个文件：

    # ksvalidator /var/www/html/kickstart/tecmint.bin

假如文件中的语法正确，你将不会得到任何输出，反之，假如文件中存在错误，你得到警告，向你提示在某一行中语法不正确或出错原因未知。

### 执行 Kickstart 安装 ###

首先，使用 rhel-server-7.0-x86_64-boot.iso 来启动你的客户端。当初始屏幕出现时，选择安装 RHEL 7.0 ，然后按 Tab 键来追加下面这一句，接着按 Enter 键：

    # inst.ks=http://192.168.0.18/kickstart/tecmint.bin

![RHEL Kickstart 安装](http://www.tecmint.com/wp-content/uploads/2015/05/RHEL-Kickstart-Installation.png)

*RHEL Kickstart 安装*

其中 tecmint.bin 是先前创建的 kickstart 文件。

当你按了 Enter 键后，自动安装就开始了，且你将看到一个列有正在被安装的软件的列表（软件包的数目和名称根据你所选择的程序和软件包组而有所不同）：

![RHEL 7 的自动化 Kickstart 安装](http://www.tecmint.com/wp-content/uploads/2015/05/Kickstart-Automatic-Installation.png)

*RHEL 7 的自动化 Kickstart 安装*

当自动化过程结束后，将提示你移除安装介质，接着你就可以启动到你新安装的系统中了：

![RHEL 7 启动屏幕](http://www.tecmint.com/wp-content/uploads/2015/05/RHEL-7.png)

*RHEL 7 启动屏幕*

尽管你可以像我们前面提到的那样，手动地创建你的 kickstart 文件，但你应该尽可能地考虑使用受推荐的方式：你可以使用在线配置工具，或者使用在安装过程中创建的位于 root 家目录下的 anaconda-ks.cfg 文件。

这个文件实际上就是一个 kickstart 文件，你或许想在选择好所有所需的选项（可能需要更改逻辑卷布局或机器上所用的文件系统）后手动地安装第一个机器，接着使用产生的 anaconda-ks.cfg 文件来自动完成其余机器的安装过程。

另外，使用在线配置工具或 anaconda-ks.cfg 文件来引导将来的安装将允许你在系统安装时以加密的形式设置 root 密码。

### 总结 ###

既然你知道了如何创建 kickstart 文件并如何使用它们来自动完成 RHEL 7 服务器的安装，你就可以不用时时照看安装进度的过程了。这将给你时间来做其他的事情，或者若你足够幸运，你还可以用来休闲一番。

无论以何种方式，请使用下面的评论栏来让我们知晓你对这篇文章的看法。提问也同样欢迎！

另外，请阅读：[使用 PXE 和 kickstart 来自动化安装多个 RHEL/CentOS 7 发行版本][2]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/automatic-rhel-installations-using-kickstart/

作者：[Gabriel Cánepa][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://access.redhat.com/labs/kickstartconfig/
[2]:http://www.tecmint.com/multiple-centos-installations-using-kickstart/
