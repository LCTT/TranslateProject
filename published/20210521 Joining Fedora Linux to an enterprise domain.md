[#]: subject: (Joining Fedora Linux to an enterprise domain)
[#]: via: (https://fedoramagazine.org/join-fedora-linux-enterprise-domain/)
[#]: author: (ogutierrez https://fedoramagazine.org/author/ogutierrez/)
[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13426-1.html)

将 Fedora Linux 系统添加到企业域中
======

![](https://img.linux.net.cn/data/attachment/album/202105/26/120149o01pzllgw119w66l.jpg)

在企业互联网场景中，一般情况下最广泛使用的基于 Linux 的操作系统是 Red Hat Enterprise Linux（RHEL），它主要用于服务器，但也可以用作工作站。Fedora linux 其实也是工作站系统的一个很好的选择，它提供了许多在企业环境中工作的特性，使管理成为一项简单的任务。

当你的工作网络中有许多机器时，你需要一种以集中方式管理用户和机器的方法。[FreeIPA][4] 和 <ruby>[活动目录][5]<rt>Active Directory</rt></ruby> 就是用于这个任务的技术。它们允许系统管理员使用网络中所有实体的目录来管理大量的机器。

### Fedora 中的活动目录

活动目录在公司环境中非常常见。Fedora 和 RHEL 通过使用 SSSD （<ruby> 系统安全服务守护进程 <rt>System Security Services Daemon</rt></ruby>）与 FreeIPA 或活动目录等服务很好地集成。SSSD 是一种访问远程目录和身份验证机制的系统服务。使用此软件的计算机能够使用远程凭据进行身份验证，并访问该目录网络中可用的其他服务。

要加入域网络，你需要域管理员的权限才能添加计算机。可以通过在域凭据上设置特殊权限或代表你对该计算机进行预配置。Fedora Linux 有一个在安装时配置机器的选项，叫做<ruby>企业登录<rt>Enterprise Login</rt></ruby>。如果你的计算机网络自动配置为企业域网络，那么你可以直接使用域凭据登录。

![][6]

如果你的配置不是自动的，或者你已经安装了 Fedora Linux，你可以通过以下几个配置步骤加入一个活动目录域：

  1. 设置此计算机的 DNS。要连接到目录服务，首先需要能够解析目录域名。如果你的网络使用 DHCP 设置正确的 DNS，则可以跳过此步骤。
  2. 更改你的计算机名称，以反映它将是新域的一部分。编辑文件 `/etc/hostname`，并将机器名更改为 `machinename.my_domain`。
  3. 通过执行以下命令加入域：`sudo realm join my_domain -v`（ 用域名称替换 `my_domain`）。

运行此命令后，系统将请求允许加入该域中新计算机的用户的凭据。如果进程中没有错误，则机器将成为域的一部分。

![][7]

现在，此计算机已成为你的域的一部分，你可以：

  * 使用域用户名登录到计算机
  * 获取 kerberos 票据以访问域网络中的不同服务
  * 访问其他服务，具体取决于域的配置方式

### 使用 Fleet Commander 管理 Fedora Linux

现在这台计算机已经是你的域的一部分了，你可以使用活动目录的域管理员工具来管理它。由于你的计算机没有运行 Windows，因此你只能进行身份验证以及访问网络和目录服务。无法在此计算机上设置与桌面相关的配置。

幸运的是，Fedora 有个工具叫 [Fleet Commander][8]。

#### 创建配置

Fleet Commander 是一个管理工具，允许你为网络中的所有 Fedora Linux 机器设置桌面配置文件。

这意味着，你可以简单地为 GNOME 桌面、Firefox、Chrome、LibreOffice 和其他支持的软件设置任何配置，然后在登录到选定的用户/组/计算机时以细粒度的方式应用该配置。

![][9]

要使用这个工具首先安装 `fleet-commander-admin` 软件包：

```
sudo dnf install fleet-commander-admin
```

然后，用浏览器访问 [http://localhost:9090][10] 来登录。在左边的菜单中，点击 “Fleet Commander”。

Fleet Commander 有一个工具，可以使用“实时会话”机制直观地设置配置概要文件。它运行一个虚拟机，作为基本机器的模板。你需要手动进行所需的配置更改。然后检查所有配置更改，选择要添加到配置文件中的更改，然后部署它。

#### 管理客户端

在每个 Fedora Linux 或 RHEL 机器中，你都需要安装 Fleet Commander 客户端服务。此服务在用户登录时激活。它在域中搜索应用于当前用户/计算机的配置文件，并应用这个配置。

安装 `fleet-commander-client`：

```
sudo dnf install fleet-commander-client
```

软件将自动检测机器是否是域的一部分。当用户登录时，它将使用应用于该用户的配置文件来设置会话。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/join-fedora-linux-enterprise-domain/

作者：[ogutierrez][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ogutierrez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/05/enterprise-816x345.jpg
[2]: https://unsplash.com/@genefoto?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/fleet?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://www.freeipa.org/page/Main_Page
[5]: https://en.wikipedia.org/wiki/Active_Directory
[6]: https://lh5.googleusercontent.com/aIRYn2TDgaaUrErzBV_KPVgpm94OrVgySlwqlI3VsotslWKN5UnLQ0VYjESSFB12aZWf_UnbmOOwa_rcxvRoI-MB6gFaw8p-RgBP9Lswnb2YV3iIlQ8YeXgpwJC_-B5tPrFTfUe_
[7]: https://lh6.googleusercontent.com/DVvr7cHuZxvgqhAHk9v7jAYSER7VSP1G7CJ1xHx1kT5ZS-v1yt3rKMmwk9JhsLnYGfwAjOPPpSC2BGTpZtAdKrnx7XLUWgOZBhFFwB6SL7vR_q_2N1c_OGYp7YmNLRk7oRW8IEVB
[8]: https://fleet-commander.org/
[9]: https://lh6.googleusercontent.com/ATeNp5niX37MW7ARiMVSkqe9Vr5Fv4IN6eUW5xf1UPO0AMO1DxXLypw0CbqTNOfzLJYDM18ggc7Mrh3LZK8Foh80K1WjSW9LHQD081BbJg0owQJj_ZQdICLr0tGILmBRco-xbq92
[10]: http://localhost:9090/
