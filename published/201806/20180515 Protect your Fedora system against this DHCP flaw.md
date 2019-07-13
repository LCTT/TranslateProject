保护你的 Fedora 系统免受这个 DHCP 漏洞
======

![](https://fedoramagazine.org/wp-content/uploads/2018/05/dhcp-cve-816x345.jpg)

前几天在 `dhcp-client` 中发现并披露了一个严重的安全漏洞。此 DHCP 漏洞会对你的系统和数据造成高风险，尤其是在使用不受信任的网络，如非你拥有的 WiFi 接入点时。

动态主机控制协议（DHCP）能让你的系统从其加入的网络中获取配置。你的系统将请求 DHCP 数据，并且通常是由路由器等服务器应答。服务器为你的系统提供必要的数据以进行自我配置。例如，你的系统如何在加入无线网络时正确进行网络配置。

但是，本地网络上的攻击者可能会利用此漏洞。使用在 NetworkManager 下运行的 `dhcp-client` 脚本中的漏洞，攻击者可能能够在系统上以 root 权限运行任意命令。这个 DHCP 漏洞使你的系统和数据处于高风险状态。该漏洞已分配 CVE-2018-1111，并且有 [Bugzilla 来跟踪 bug][1]。

### 防范这个 DHCP 漏洞

新的 dhcp 软件包包含了 Fedora 26、27 和 28 以及 Rawhide 的修复程序。维护人员已将这些更新提交到 updates-testing 仓库。对于大多数用户而言，它们应该在这篇文章的大约一天左右的时间内在稳定仓库出现。所需的软件包是：

  * Fedora 26: dhcp-4.3.5-11.fc26
  * Fedora 27: dhcp-4.3.6-10.fc27
  * Fedora 28: dhcp-4.3.6-20.fc28
  * Rawhide: dhcp-4.3.6-21.fc29

#### 更新稳定的 Fedora 系统

要在稳定的 Fedora 版本上立即更新，请[使用 sudo][2] 运行此命令。如有必要，请在提示时输入你的密码：

```
sudo dnf --refresh --enablerepo=updates-testing update dhcp-client
```

之后，使用标准稳定仓库进行更新。要从稳定的仓库更新 Fedora 系统，请使用以下命令：

```
sudo dnf --refresh update dhcp-client
```

#### 更新 Rawhide 系统

如果你的系统是 Rawhide，请使用以下命令立即下载和更新软件包：

```
mkdir dhcp && cd dhcp
koji download-build --arch={x86_64,noarch} dhcp-4.3.6-21.fc29
sudo dnf update ./dhcp-*.rpm
```

在每日的 Rawhide compose 后，只需运行 `sudo dnf update` 即可获取更新。

### Fedora Atomic Host

针对 Fedora Atomic Host 的修复程序版本为 28.20180515.1。要获得更新，请运行以下命令：

```
atomic host upgrade -r
```

此命令将重启系统以应用升级。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/protect-fedora-system-dhcp-flaw/

作者：[Paul W. Frields][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/pfrields/
[1]:https://bugzilla.redhat.com/show_bug.cgi?id=1567974
[2]:https://fedoramagazine.org/howto-use-sudo/
