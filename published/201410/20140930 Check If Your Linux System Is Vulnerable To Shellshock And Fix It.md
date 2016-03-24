检查你的系统系统是否有“Shellshock”漏洞并修复它
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/shellshock_Linux_check.jpeg)

快速地向你展示**如何检查你的系统是否受到Shellshock的影响**，如果有，**怎样修复你的系统免于被Bash漏洞利用**。

如果你正跟踪新闻，你可能已经听说过在[Bash][1]中发现了一个漏洞，这被称为**Bash Bug**或者** Shellshock**。 [红帽][2]是第一个发现这个漏洞的机构。Shellshock错误允许攻击者注入自己的代码，从而使系统开放各给种恶意软件和远程攻击。事实上，[黑客已经利用它来启动DDoS攻击][3]。

由于Bash在所有的类Unix系统中都有，如果这些都运行bash的特定版本，它会让所有的Linux系统都容易受到这种Shellshock错误的影响。

想知道如果你的Linux系统是否已经受到Shellshock影响？有一个简单的方法来检查它，这就是我们要看到的。

### 检查Linux系统的Shellshock漏洞 ###

打开一个终端，在它运行以下命令:

    env x='() { :;}; echo vulnerable' bash -c 'echo hello'

如果你的系统没有漏洞，你会看到这样的输出:

    bash: warning: x: ignoring function definition attempt
    bash: error importing function definition for `x’
    hello

如果你的系统有Shellshock漏洞，你会看到一个像这样的输出:

    vulnerable
    hello

我尝试在我的Ubuntu14.10上运行，我得到了这个:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Shellshock_Linux_Check.jpeg)

您还可以通过使用下面的命令查看bash的版本:

    bash --version

如果bash的版本是3.2.51(1)，你就应该更新了。

#### 为有Shellshock漏洞的Linux系统打补丁 ####

如果你运行的是基于Debian的Linux操作系统，如Ubuntu、Linux Mint的等，请使用以下命令升级Bash：

    sudo apt-get update && sudo apt-get install --only-upgrade bash

对于如Fedora，Red Hat，Cent OS等操作系统，请使用以下命令

    yum -y update bash

我希望这个小技巧可以帮助你，看看你是否受到Shellshock漏洞的影响并解决它。有任何问题和建议，欢迎来提。

--------------------------------------------------------------------------------

via: http://itsfoss.com/linux-shellshock-check-fix/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://en.wikipedia.org/wiki/Bash_(Unix_shell)
[2]:https://securityblog.redhat.com/2014/09/24/bash-specially-crafted-environment-variables-code-injection-attack/
[3]:http://www.wired.com/2014/09/hackers-already-using-shellshock-bug-create-botnets-ddos-attacks/