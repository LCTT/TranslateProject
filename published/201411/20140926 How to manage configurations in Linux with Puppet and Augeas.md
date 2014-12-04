如何用Puppet和Augeas管理Linux配置
================================================================================
虽然[Puppet][1]是一个真正独特的有用工具，但在有些情况下你可以使用一点不同的方法来用它。比如，你要修改几个服务器上已有的配置文件，而且它们彼此稍有不同。Puppet实验室的人也意识到了这一点，他们在 Puppet 中集成了一个叫做[Augeas][2]的伟大的工具，它是专为这种使用情况而设计的。

Augeas可被认为填补了Puppet能力的空白，比如在其中一个指定对象的资源类型（例如用于维护/etc/hosts中的条目的主机资源）还不可用时。在这个文档中，您将学习如何使用Augeas来减轻你管理配置文件的负担。

### Augeas是什么? ###

Augeas基本上就是一个配置编辑工具。它以他们原生的格式解析配置文件并且将它们转换成树。配置的更改可以通过操作树来完成，并可以以原生配置文件格式保存配置。

### 这篇教程要达成什么目的？ ###

我们会针对[我们之前构建的Puppet服务器][1]安装并配置Augeas。我们会使用这个工具创建并测试几个不同的配置文件，并学习如何适当地使用它来管理我们的系统配置。

### 前置阅读 ###

我们需要一台工作的Puppet服务器和客户端。如果你还没有，请先按照我先前的[教程][1]来。

Augeas安装包可以在标准CentOS/RHEL仓库中找到。不幸的是，Puppet用到的Augeas的ruby封装只在puppetlabs仓库中（或者[EPEL][4]）中才有。如果你系统中还没有这个仓库，请使用下面的命令：

在CentOS/RHEL 6.5上:

     # rpm -­ivh https://yum.puppetlabs.com/el/6.5/products/x86_64/puppetlabs­release­6­10.noarch.rpm 

在CentOS/RHEL 7上: 

     # rpm -­ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs­release­7­10.noarch.rpm 

在你成功地安装了这个仓库后，在你的系统中安装Ruby­Augeas：

     # yum install ruby­augeas 

或者如果你是从我的[上一篇教程中继续][1]的，使用puppet的方法安装这个包。在/etc/puppet/manifests/site.pp中修改你的custom_utils类，在packages这行中加入“ruby­augeas”。

    class custom_utils {
            package { ["nmap","telnet","vim­enhanced","traceroute","ruby­augeas"]:
                    ensure => latest,
                    allow_virtual => false,
            }
    } 

### 不带Puppet的Augeas ###

如我先前所说，最初Augeas并不是来自Puppet实验室，这意味着即使没有Puppet本身我们仍然可以使用它。这种方法可在你将它们部署到Puppet环境之前，验证你的修改和想法是否是正确的。要做到这一点，你需要在你的系统中安装一个额外的软件包。请执行以下命令：

    # yum install augeas 

### Puppet Augeas 示例 ###

用于演示，这里有几个Augeas使用案例。

#### 管理 /etc/sudoers 文件 ####

1. 给wheel组加上sudo权限。

这个例子会向你展示如何在你的GNU/Linux系统中为%wheel组加上sudo权限。

    # 安装sudo包
    package { 'sudo':
        ensure => installed, # 确保sudo包已安装
    }
      
    # 允许用户属于wheel组来使用sudo
    augeas { 'sudo_wheel':
        context => '/files/etc/sudoers', # 目标文件是 /etc/sudoers
        changes => [
            # 允许wheel用户使用sudo
            'set spec[user = "%wheel"]/user %wheel',
            'set spec[user = "%wheel"]/host_group/host ALL',
            'set spec[user = "%wheel"]/host_group/command ALL',
            'set spec[user = "%wheel"]/host_group/command/runas_user ALL',
        ]
    } 

现在来解释这些代码做了什么：**spec**定义了/etc/sudoers中的用户段，**[user]**定义了数组中给定的用户，所有的定义放在该用户的斜杠( / ) 后那部分。因此在典型的配置中这个可以这么表达：

    user host_group/host host_group/command host_group/command/runas_user

这个将被转换成/etc/sudoers下的这一行：

    %wheel ALL = (ALL) ALL 

2. 添加命令别称

下面这部分会向你展示如何定义命令别名，它可以在你的sudoer文件中使用。

    # 创建新的SERVICE别名，包含了一些基本的特权命令。
    augeas { 'sudo_cmdalias':
        context => '/files/etc/sudoers', # The target file is /etc/sudoers
        changes => [
          "set Cmnd_Alias[alias/name = 'SERVICES']/alias/name SERVICES",
          "set Cmnd_Alias[alias/name = 'SERVICES']/alias/command[1] /sbin/service",
          "set Cmnd_Alias[alias/name = 'SERVICES']/alias/command[2] /sbin/chkconfig",
          "set Cmnd_Alias[alias/name = 'SERVICES']/alias/command[3] /bin/hostname",
          "set Cmnd_Alias[alias/name = 'SERVICES']/alias/command[4] /sbin/shutdown",
        ]
    } 

sudo命令别名的语法很简单：**Cmnd_Alias**定义了命令别名字段，**[alias/name]**绑定所有给定的别名，/alias/name **SERVICES** 定义真实的别名，alias/command 是属于该别名的所有命令的数组。以上将被转换如下：

    Cmnd_Alias SERVICES = /sbin/service , /sbin/chkconfig , /bin/hostname , /sbin/shutdown

关于/etc/sudoers的更多信息，请访问[官方文档][5]。

#### 向一个组中加入用户 ####

要使用Augeas向组中添加用户，你也许要添加一个新用户，不管是排在 gid 字段还是最后的用户 uid 之后。我们在这个例子中使用SVN组。这可以通过下面的命令达成：

在Puppet中:

    augeas { 'augeas_mod_group:
        context => '/files/etc/group', #目标文件是 /etc/group
        changes => [
            "ins user after svn/*[self::gid or self::user][last()]",
            "set svn/user[last()] john",
        ]
    }

使用 augtool:

     augtool> ins user after /files/etc/group/svn/*[self::gid or self::user][last()] augtool> set /files/etc/group/svn/user[last()] john 

### 总结 ###

目前为止，你应该对如何在Puppet项目中使用Augeas有点明白了。随意地试一下，你肯定需要浏览官方的Augeas文档。这会帮助你了解如何在你的个人项目中正确地使用Augeas，并且它会让你知道可以用它节省多少时间。

如有任何问题，欢迎在下面的评论中发布，我会尽力解答和向你建议。

### 有用的链接 ###

- [http://www.watzmann.net/categories/augeas.html][6]:  包含许多关于 Augeas 使用的教程。
- [http://projects.puppetlabs.com/projects/1/wiki/puppet_augeas][7]: Puppet wiki 带有许多实例。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/manage-configurations-linux-puppet-augeas.html

作者：[Jaroslav Štěpánek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/jaroslav
[1]:http://linux.cn/article-3959-1.html
[2]:http://augeas.net/
[3]:http://xmodulo.com/manage-configurations-linux-puppet-augeas.html
[4]:http://xmodulo.com/2013/03/how-to-set-up-epel-repository-on-centos.html
[5]:http://augeas.net/docs/references/lenses/files/sudoers-aug.html
[6]:http://www.watzmann.net/categories/augeas.html
[7]:http://projects.puppetlabs.com/projects/1/wiki/puppet_augeas