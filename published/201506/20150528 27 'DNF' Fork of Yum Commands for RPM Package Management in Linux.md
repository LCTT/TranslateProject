27 个 Linux 下软件包管理工具 DNF 命令例子
================================================================================
DNF即Dandified YUM，是基于RPM的Linux发行版的下一代软件包管理工具。它首先在Fedora 18中出现，并且在最近发行的Fedora 22中替代了[YUM工具集][1]。

![](http://www.tecmint.com/wp-content/uploads/2015/05/linux-dnf-command-examples.jpg)

DNF致力于改善YUM的瓶颈，即性能、内存占用、依赖解决、速度和许多其他方面。DNF使用RPM、libsolv和hawkey库进行包管理。尽管它并未预装在CentOS和RHEL 7中，但您可以通过yum安装，并同时使用二者。

您也许想阅读更多关于DNF的信息：

- [使用DNF取代Yum背后的原因][2]

最新的DNF稳定版本是2015年5月11日发布的1.0（在写这篇文章之前）。它（以及所有DNF之前版本）主要由Python编写，并以GPL v2许可证发布。

### 安装DNF ###

尽管Fedora 22官方已经过渡到了DNF，但DNF并不在RHEL/CentOS 7的默认仓库中。

为了在RHEL/CentOS系统中安装DNF，您需要首先安装和开启epel-release仓库。

    # yum install epel-release
    或
    # yum install epel-release -y

尽管并不建议在使用yum时添上'-y'选项，因为最好还是看看什么将安装在您的系统中。但如果您对此并不在意，则您可以使用'-y'选项以自动化的安装而无需用户干预。

接下来，使用yum命令从epel-realease仓库安装DNF包。

    # yum install dnf

在您装完dnf后，我会向您展示27个实用的dnf命令和例子，以便帮您更容易和高效的管理基于RPM包的发行版。

### 1. 检查DNF版本 ###

检查您的系统上安装的DNF版本。

    # dnf --version

![检查DNF版本](http://www.tecmint.com/wp-content/uploads/2015/05/Check-DNF-Version.gif)

### 2. 列出启用的DNF仓库 ###

dnf命令中的'repolist'选项将显示您系统中所有启用的仓库。

    # dnf repolist

![检查所有开启的仓库](http://www.tecmint.com/wp-content/uploads/2015/05/Check-All-Enabled-Repositories.gif)

### 3. 列出所有启用和禁用的DNF仓库 ###

'repolist all'选项将显示您系统中所有启用/禁用的仓库。

    # dnf repolist all

![列出所有启用/禁用的仓库](http://www.tecmint.com/wp-content/uploads/2015/05/Check-All-Repositories.gif)

### 4. 用DNF列出所有可用的且已安装的软件包 ###

'dnf list'命令将列出所有仓库中所有可用的软件包和您Linux系统中已安装的软件包。

    # dnf list

![用DNF列出所有的软件包](http://www.tecmint.com/wp-content/uploads/2015/05/List-All-Packages.png)

### 5. 用DNF列出所有已安装的软件包 ###

尽管'dnf list'命令将列出所有仓库中所有可用的软件包和已安装的软件包。然而像下面一样使用'list installed'选项将只列出已安装的软件包。

    # dnf list installed

![列出已安装的软件包](http://www.tecmint.com/wp-content/uploads/2015/05/List-Installed-Packages.png)

### 6. 用DNF列出所有可用的软件包 ###

类似的，可以用'list available'选项列出所有开启的仓库中所有可用的软件包。

    # dnf list available

![用DNF列出可用的软件包](http://www.tecmint.com/wp-content/uploads/2015/05/List-Available-Packages.png)

### 7. 使用DNF查找软件包 ###

如果您不太清楚您想安装的软件包的名字，这种情况下，您可以使用'search'选项来搜索匹配该字符（例如，nano）和字符串的软件包。

    # dnf search nano

![通过关键字搜索软件包](http://www.tecmint.com/wp-content/uploads/2015/05/Search-Package.gif)

### 8. 查看哪个软件包提供了某个文件/子软件包？ ###

dnf的选项'provides'能查找提供了某个文件/子软件包的软件包名。例如，如果您想找找哪个软件包提供了您系统中的'/bin/bash'文件，可以使用下面的命令

    # dnf provides /bin/bash

![查找提供文件的软件包](http://www.tecmint.com/wp-content/uploads/2015/05/Find-Package-Sub-Package.gif)

### 9. 使用DNF获得一个软件包的详细信息 ###

如果您想在安装一个软件包前知道它的详细信息，您可以使用'info'来获得一个软件包的详细信息，例如：

    # dnf info nano

![用DNF查看软件信息](http://www.tecmint.com/wp-content/uploads/2015/05/Check-Package-Information.gif)

### 10. 使用DNF安装软件包 ###

想安装一个叫nano的软件包，只需运行下面的命令，它会为nano自动的解决和安装所有的依赖。

    # dnf install nano

![用DNF安装软件](http://www.tecmint.com/wp-content/uploads/2015/05/Install-Package-DNF.gif)

### 11. 使用DNF更新一个软件包 ###

您可能只想更新一个特定的包（例如，systemd）并且保留系统内剩余软件包不变。

    # dnf update systemd

![更新一个软件包](http://www.tecmint.com/wp-content/uploads/2015/05/Update-a-Package.gif)

### 12. 使用DNF检查系统更新 ###

检查系统中安装的所有软件包的更新可以简单的使用如下命令：

    # dnf check-update

![检查系统更新](http://www.tecmint.com/wp-content/uploads/2015/05/Check-For-System-Update.gif)

### 13. 使用DNF更新系统中所有的软件包 ###

您可以使用下面的命令来更新整个系统中所有已安装的软件包。

    # dnf update
    或
    # dnf upgrade

![更新系统](http://www.tecmint.com/wp-content/uploads/2015/05/Update-System.gif)

### 14. 使用DNF来移除/删除一个软件包 ###

您可以在dnf命令中使用'remove'或'erase'选项来移除任何不想要的软件包。

    # dnf remove nano
    或
    # dnf erase nano

![移除系统中的软件](http://www.tecmint.com/wp-content/uploads/2015/05/Remove-Package.gif)

### 15. 使用DNF移除于依赖无用的软件包（Orphan Packages） ###

这些为了满足依赖安装的软件包在相应的程序删除后便不再需要了。可以用过下面的命令来将它们删除。

    # dnf autoremove

![移除无用的依赖包](http://www.tecmint.com/wp-content/uploads/2015/05/Autoremove-Packages.gif)

### 16. 使用DNF移除缓存的软件包 ###

我们在使用dnf时经常会碰到过期的头部信息和不完整的事务，它们会导致错误。我们可以使用下面的语句清理缓存的软件包和包含远程包信息的头部信息。

    # dnf clean all

![移除DNF缓存](http://www.tecmint.com/wp-content/uploads/2015/05/Remove-Cache-Packages.gif)

### 17. 获得特定DNF命令的帮助 ###

您可能需要特定的DNF命令的帮助（例如，clean），可以通过下面的命令来得到：

    # dnf help clean

![获得某一命令帮助](http://www.tecmint.com/wp-content/uploads/2015/05/Help-on-DNF-Command.gif)

### 18. 列出所有DNF的命令和选项 ###

要显示所有dnf的命令和选项，只需要：

    # dnf help

![获得命令选项帮助](http://www.tecmint.com/wp-content/uploads/2015/05/DNF-Options.gif)

### 19. 查看DNF的历史记录 ###

您可以调用'dnf history'来查看已经执行过的dnf命令的列表。这样您便可以知道什么被安装/移除及其时间戳。

    # dnf history

![查看历史记录](http://www.tecmint.com/wp-content/uploads/2015/05/Check-DNF-History.gif)

### 20. 显示所有软件包组 ###

'dnf grouplist'命令可以显示所有可用的或已安装的软件包，如果没有什么输出，则它会列出所有已知的软件包组。

    # dnf grouplist

![列出所有软件包组](http://www.tecmint.com/wp-content/uploads/2015/05/List-All-Group-Packages.gif)

### 21. 使用DNF安装一个软件包组 ###

要安装一组由许多软件打包在一起的软件包组（例如，Educational Softaware），只需要执行：

    # dnf groupinstall 'Educational Software'

![安装一个软件包组](http://www.tecmint.com/wp-content/uploads/2015/05/Install-Group-Packages.gif)

### 22. 更新一个软件包组 ###

可以通过下面的命令来更新一个软件包组（例如，Educational Software）：

    # dnf groupupdate 'Educational Software'

![更新软件包组](http://www.tecmint.com/wp-content/uploads/2015/05/Update-Group-Package.gif)

### 23. 移除一个软件包组 ###

可以使用下面的命令来移除一个软件包组（例如，Educational Software）：

    # dnf groupremove 'Educational Software'

![移除软件包组](http://www.tecmint.com/wp-content/uploads/2015/05/Remove-Group-Package.gif)

### 24. 从某个特定的仓库安装一个软件包 ###

DNF可以从任何特定的仓库（比如 epel）安装一个软件包（例如，phpmyadmin）：

    # dnf --enablerepo=epel install phpmyadmin

![从特定的仓库安装软件](http://www.tecmint.com/wp-content/uploads/2015/05/Install-Package-From-Specific-Repo.gif)

### 25. 将已安装的软件包同步到稳定发行版 ###

'dnf distro-sync'将同步所有已安装的软件包到所有开启的仓库中最近的稳定版本。如果没有选择软件包，则会同步所有已安装的软件包。

    # dnf distro-sync

![将包同步至稳定版](http://www.tecmint.com/wp-content/uploads/2015/05/Synchronize-Packages.gif)

### 26. 重新安装一个软件包 ###

'dnf reinstall nano'命令将重新安装一个已经安装的软件包（例如，nano）：

    # dnf reinstall nano

![重新安装软件包](http://www.tecmint.com/wp-content/uploads/2015/05/Re-Install-Package.gif)

### 27. 降级一个软件包 ###

选项'downgrade'将会使一个软件包（例如，acpid）回退到低版本。

    # dnf downgrade acpid

示例输出

    Using metadata from Wed May 20 12:44:59 2015
    No match for available package: acpid-2.0.19-5.el7.x86_64
    Error: Nothing to do.

**我观察到**：dnf不会按预想的那样降级一个软件包。这已做为一个bug被提交。

### 结论 ###

DNF是YUM管理器的优秀替代品。它试着自动做许多甚至不推荐有经验的Linux系统管理员做的工作。例如：

- `--skip-broken`不被DNF识别，并且DNF中没有其替代命令。
- 尽管您可能会运行dnf provides，但再也没有'resolvedep'命令了。
- 没有'deplist'命令用来发现软件包依赖。
- 您排除一个仓库意味着在所有操作上排除该仓库，而在yum中，排除一个仓库只在安装和升级等时刻排除他们。

许多Linux用户对于Linux生态系统的走向不甚满意。首先[Systemd替换了init系统][3]v，现在DNF将于不久后替换YUM，首先是Fedora 22，接下来是RHEL和CentOS。

您怎么看呢？是不是发行版和整个Linux生态系统并不注重用户并且在朝着与用户愿望相悖的方向前进呢？IT行业里有这样一句话 - “如果没有坏，为什么要修呢？”，System V和YUM都没有坏。

上面便是这篇文章的全部了。请在下方留言以让我了解您的宝贵想法。点赞和分享以帮助我们传播。谢谢！

--------------------------------------------------------------------------------

via: http://www.tecmint.com/dnf-commands-for-fedora-rpm-package-management/

作者：[Avishek Kumar][a]
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/dnf-next-generation-package-management-utility-for-linux/
[3]:http://www.tecmint.com/systemd-replaces-init-in-linux/
