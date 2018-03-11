SPARTA —— 用于网络渗透测试的 GUI 工具套件
======

![](https://i0.wp.com/gbhackers.com/wp-content/uploads/2018/01/GjWDZ1516079830.png?resize=696%2C379&ssl=1)

SPARTA 是使用 Python 开发的 GUI 应用程序，它是 Kali Linux 内置的网络渗透测试工具。它简化了扫描和枚举阶段，并更快速的得到结果。

SPARTA GUI 工具套件最擅长的事情是扫描和发现目标端口和运行的服务。

因此，作为枚举阶段的一部分功能，它提供对开放端口和服务的暴力攻击。


延伸阅读：[网络渗透检查清单][1]

## 安装

请从 GitHub 上克隆最新版本的 SPARTA：

```
git clone https://github.com/secforce/sparta.git
```

或者，从 [这里][2] 下载最新版本的 Zip 文件。
```
cd /usr/share/
git clone https://github.com/secforce/sparta.git
```
将 "sparta" 文件放到 /usr/bin/ 目录下并赋于可运行权限。
在任意终端中输入 'sparta' 来启动应用程序。


## 网络渗透测试的范围：

  * 添加一个目标主机或者目标主机的列表到范围中，来发现一个组织的网络基础设备在安全方面的薄弱环节。
  * 选择菜单条 - File > Add host(s) to scope



[![Network Penetration Testing][3]][4]

[![Network Penetration Testing][5]][6]

  * 上图展示了在扫描范围中添加 IP 地址。根据你网络的具体情况，你可以添加一个 IP 地址的范围去扫描。
  * 扫描范围添加之后，Nmap 将开始扫描，并很快得到结果，扫描阶段结束。



## 打开 Ports & Services:

  * Nmap 扫描结果提供了目标上开放的端口和服务。



[![Network Penetration Testing][7]][8]

  * 上图展示了扫描发现的目标操作系统、开发的端口和服务。



## 在开放端口上实施暴力攻击：

  * 我们来通过 445 端口的服务器消息块（SMB）协议来暴力获取用户列表和它们的有效密码。



[![Network Penetration Testing][9]][10]

  * 右键并选择 “Send to Brute” 选项。也可以选择发现的目标上的开放端口和服务。
  * 浏览和在用户名密码框中添加字典文件。



[![Network Penetration Testing][11]][12]

  * 点击 “Run” 去启动对目标的暴力攻击。上图展示了对目标 IP 地址进行的暴力攻击取得成功，找到了有效的密码。
  * 在 Windows 中失败的登陆尝试总是被记录到事件日志中。
  * 密码每 15 到 30 天改变一次的策略是非常好的一个实践经验。
  * 强烈建议使用强密码策略。密码锁定策略是阻止这种暴力攻击的最佳方法之一（ 5 次失败的登陆尝试之后将锁定帐户）
  * 将关键业务资产整合到 SIEM（ 安全冲突 & 事件管理）中将尽可能快地检测到这类攻击行为。



SPARTA 对渗透测试的扫描和枚举阶段来说是一个非常省时的 GUI 工具套件。SPARTA 可以扫描和暴力破解各种协议。它有许多的功能！祝你测试顺利！

--------------------------------------------------------------------------------

via: https://gbhackers.com/sparta-network-penetration-testing-gui-toolkit/

作者：[Balaganesh][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://gbhackers.com/author/balaganesh/
[1]:https://gbhackers.com/network-penetration-testing-checklist-examples/
[2]:https://github.com/SECFORCE/sparta/archive/master.zip
[3]:https://i0.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-526.png?resize=696%2C495&amp;ssl=1
[4]:https://i0.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-526.png?ssl=1
[5]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-527.png?resize=696%2C516&amp;ssl=1
[6]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-527.png?ssl=1
[7]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-528.png?resize=696%2C519&amp;ssl=1
[8]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-528.png?ssl=1
[9]:https://i1.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-529.png?resize=696%2C525&amp;ssl=1
[10]:https://i1.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-529.png?ssl=1
[11]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-531.png?resize=696%2C523&amp;ssl=1
[12]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-531.png?ssl=1
