如何在 CentOS 上启用 软件集 Software Collections（SCL）
================================================================================

红帽企业版 linux（RHEL）和它的社区版分支——CentOS，提供10年的生命周期，这意味着 RHEL/CentOS 的每个版本会提供长达10年的安全更新。虽然这么长的生命周期为企业用户提供了迫切需要的系统兼容性和可靠性，但也存在一个缺点：随着底层的 RHEL/CentOS 版本接近生命周期的结束，核心应用和运行时环境变得陈旧过时。例如 CentOS 6.5，它的生命周期结束时间是2020年11月30日，其所携带的 Python 2.6.6和 MySQL 5.1.73，以今天的标准来看已经非常古老了。

另一方面，在 RHEL/CentOS 上试图手动升级开发工具链和运行时环境存在使系统崩溃的潜在可能，除非所有依赖都被正确解决。通常情况下，手动升级都是不推荐的，除非你知道你在干什么。

[软件集（Software Collections）][1]（SCL）源出现了，以帮助解决 RHEL/CentOS 下的这种问题。SCL 的创建就是为了给 RHEL/CentOS 用户提供一种以方便、安全地安装和使用应用程序和运行时环境的多个（而且可能是更新的）版本的方式，同时避免把系统搞乱。与之相对的是第三方源，它们可能会在已安装的包之间引起冲突。

最新的 SCL 提供了：

- Python 3.3 和 2.7
- PHP 5.4
- Node.js 0.10
- Ruby 1.9.3
- Perl 5.16.3
- MariaDB 和 MySQL 5.5
- Apache httpd 2.4.6

在这篇教程的剩余部分，我会展示一下如何配置 SCL 源，以及如何安装和启用 SCL 中的包。

### 配置 SCL 源

SCL 可用于 CentOS 6.5 及更新的版本。要配置 SCL 源，只需执行：

    $ sudo yum install centos-release-SCL

要启用和运行 SCL 中的应用，你还需要安装下列包：

    $ sudo yum install scl-utils-build

执行下面的命令可以查看 SCL 中可用包的完整列表：

    $ yum --disablerepo="*" --enablerepo="scl" list available

![](https://c2.staticflickr.com/6/5730/23304424250_f5c8a09584_c.jpg)

### 从 SCL 中安装和启用包

既然你已配置好了 SCL，你可以继续并从 SCL 中安装包了。

你可以搜索 SCL 中的包：

    $ yum --disablerepo="*" --enablerepo="scl" search <keyword>

我们假设你要安装 Python 3.3。

继续，就像通常安装包那样使用 yum 安装：

    $ sudo yum install python33

任何时候你都可以查看从 SCL 中安装的包的列表，只需执行：

    $ scl --list

    python33

SCL 的优点之一是安装其中的包不会覆盖任何系统文件，并且保证不会引起与系统中其它库和应用的冲突。

例如，如果在安装 python33 包后检查默认的 python 版本，你会发现默认的版本并没有改变：

    $ python --version

    Python 2.6.6

如果想使用一个已经安装的 SCL 包，你需要在每个命令中使用 `scl` 命令显式启用它（LCTT 译注：即想在哪条命令中使用 SCL 中的包，就得通过`scl`命令执行该命令）

    $ scl enable <scl-package-name> <command>

例如，要针对`python`命令启用 python33 包：

    $ scl enable python33 'python --version'

    Python 3.3.2

如果想在启用 python33 包时执行多条命令，你可以像下面那样创建一个启用 SCL 的 bash 会话：

    $ scl enable python33 bash

在这个 bash 会话中，默认的 python 会被切换为3.3版本，直到你输入`exit`，退出会话。

![](https://c2.staticflickr.com/6/5642/23491549632_1d08e163cc_c.jpg)

简而言之，SCL 有几分像 Python 的虚拟环境，但更通用，因为你可以为远比 Python 更多的应用启用/禁用 SCL 会话。

更详细的 SCL 指南，参考官方的[快速入门指南][2]

--------------------------------------------------------------------------------

via: http://xmodulo.com/enable-software-collections-centos.html

作者：[Dan Nanni][a]
译者：[bianjp](https://github.com/bianjp)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:https://www.softwarecollections.org/
[2]:https://www.softwarecollections.org/docs/
