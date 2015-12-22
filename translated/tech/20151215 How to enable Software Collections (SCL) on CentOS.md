如何在CentOS上启用Software Collections(SCL)
================================================================================

红帽企业版linux(RHEL)和它的社区版分支——CentOS，提供10年的生命周期，这意味着RHEL/CentOS的每个版本会提供长达10年的安全更新。虽然这么长的生命周期为企业用户提供了更需要的系统兼容性和可靠性，但也存在一个缺点：随着底层的RHEL/CentOS版本接近生命周期的结束，核心应用和运行时环境变得陈旧过时。例如CentOS 6.5，它的生命周期结束时间是2020年11月30日，携带Python 2.6.6和MySQL 5.1.73，以今天的标准来看已经非常古老了。

另一方面，在RHEL/CentOS上试图手动升级开发工具链和运行时环境存在潜在的可能使系统崩溃，除非所有依赖都被正确解决。通常情况下，手动升级都是不推荐的，除非你知道你在干什么。

[Software Collections][1](SCL)源出现了，以帮助解决RHEL/CentOS下的这种问题。SCL的创建就是为了给RHEL/CentOS用户提供一种方式以方便、安全地安装和使用应用程序和运行时环境的多个（而且可能更新的）版本，同时避免把系统搞乱。与之相对的是第三方源，它们可能会在已安装的包之间引起冲突。

最新的SCL提供：

- Python 3.3 和 2.7
- PHP 5.4
- Node.js 0.10
- Ruby 1.9.3
- Perl 5.16.3
- MariaDB 和 MySQL 5.5
- Apache httpd 2.4.6

在这篇教程的剩余部分，我会展示一下如何配置SCL源，以及如何安装和启用SCL中的包。

### 配置SCL源

SCL可用于CentOS 6.5及更新的版本。要配置SCL源，只需执行：

    $ sudo yum install centos-release-SCL

要启用和运行SCL中的应用，你还需要安装下列包：

    $ sudo yum install scl-utils-build

执行下面的命令可以查看SCL中可用包的完整列表：

    $ yum --disablerepo="*" --enablerepo="scl" list available

![](https://c2.staticflickr.com/6/5730/23304424250_f5c8a09584_c.jpg)

### 从SCL中安装和启用包

既然你已配置好了SCL，你可以继续并从SCL中安装包了。

你可以搜索SCL中的包：

    $ yum --disablerepo="*" --enablerepo="scl" search <keyword>

我们假设你要安装Python 3.3。

继续，就像通常安装包那样使用yum安装：

    $ sudo yum install python33

任何时候你都可以查看从SCL中安装的包的列表，只需执行：

    $ scl --list

----------

    python33

SCL的优点之一是安装其中的包不会覆盖任何系统文件，并且保证了不会引起系统中其它库和应用的冲突。

例如，若果在安装python33包后检查默认的python版本，你会发现默认的版本并没有改变：

    $ python --version

----------

    Python 2.6.6

如果想使用一个已经安装的SCL包，你需要在每个命令中使用scl命令显式启用它（译注：即想在哪条命令中使用SCL中的包，就得通过scl命令执行该命令）

    $ scl enable <scl-package-name> <command>

例如，要针对python命令启用python33包：

    $ scl enable python33 'python --version'

----------

    Python 3.3.2

如果想在启用python33包时执行多条命令，你可以像下面那样创建一个启用SCL的bash会话：

    $ scl enable python33 bash

在这个bash会话中，默认的python会被切换为3.3版本，直到你输入exit，退出会话。

![](https://c2.staticflickr.com/6/5642/23491549632_1d08e163cc_c.jpg)

简而言之，SCL有几分像Python的虚拟环境，但更通用，因为你可以为远远更多的应用启用/禁用SCL会话，而不仅仅是Python。

更详细的SCL指南，参考官方的[快速入门指南][2]

--------------------------------------------------------------------------------

via: http://xmodulo.com/enable-software-collections-centos.html

作者：[Dan Nanni][a]
译者：[bianjp](https://github.com/bianjp)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://www.softwarecollections.org/
[2]:https://www.softwarecollections.org/docs/
