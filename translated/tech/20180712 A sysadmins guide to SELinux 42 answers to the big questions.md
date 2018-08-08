系统管理员的 SELinux 指南： 42 个重大相关问题的答案
============================================================

> 获取有关生活、宇宙和除了有关 SELinux 的重要问题的答案

![Lock](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum "Lock")
Image credits : [JanBaby][13], via Pixabay [CC0][14].

> ”一个重要并且受欢迎的事实是：事情并不总是它们该有的样子“
> ―Douglas Adams，_银河系漫游指南_

安全、加固、规范化、策略是末世中系统管理员的四骑士。除了我们的日常任务--监控、备份、实现、调优、升级以及类似任务--我们还需要对我们系统的安全负责。即使这些系统是第三方提供商告诉我们该禁用增强安全性的系统。这就像 [Ethan Hunt][15] 面临的 _不可能的任务_。

面对这些困境，有些系统管理员决定 [拿绿色药丸][16]，因为他们认为他们将不会知道诸如生活、宇宙和其他事情等重大问题的答案，并且众所周知的是，那个答案是 42.

受到_银河系漫游指南_启发，下面有 42 个有关在你系统中管理和使用 [SELinux][17] 这个重大问题的答案。

1. SELinux 是一个标签系统，这意味着每个进程都有一个标签。每个文件、目录和系统事物都有一个标签。策略规则控制着被标记的进程和被标记的事物之间的获取。内核强制执行这些规则。

1. 最重要的两个概念是： _标签_（文件、进程、端口等）和 _类型强制_（基于不同的类型隔离不同的进程）。

1. 正确的标签格式是 `user:role:type:level`（_可选_）。

1. _多层安全（MLS）强制_ 的目的是基于它们索要使用数据的安全级别来控制进程（_区域_）。例如一个秘密级别的进程不能读取绝密级别的数据。

1. _多目录安全（MCS）强制_ 相互保护相似的进程（例如虚拟机、OpenShift gears、SELinux 沙盒、容器等等）。

1. 在启动时改变 SELinux 模式的内核参数有：
    *   `autorelabel=1` → 强制系统重新标签

    *   `selinux=0` → 内核并不加载 SELinux 设施的任何部分

    *   `enforcing=0` → 以许可模式启动

1. 假如你需要重新标签整个系统：
    `# touch /.autorelabel
    #reboot`
    假如你的标签中包含大量错误，为了让 autorelabel 能够成功，你需要以许可模式启动

1. 检查 SELinux 是否启用：`# getenforce`

1. 临时启用或禁用 SELinux：`# setenforce [1|0]`

1. SELinux 状态工具：`# sestatus`

1. 配置文件：`/etc/selinux/config`

1. SELinux 是如何工作的呢？下面是一个标签一个 Apache Web 服务器的例子：
    *  二进制：`/usr/sbin/httpd`→`httpd_exec_t`

    *  配置目录：`/etc/httpd`→`httpd_config_t`

    *  日志文件目录：`/var/log/httpd` → `httpd_log_t`

    *  内容目录：`/var/www/html` → `httpd_sys_content_t`

    *  启动脚本：`/usr/lib/systemd/system/httpd.service` → `httpd_unit_file_d`

    *  进程：`/usr/sbin/httpd -DFOREGROUND` → `httpd_t`

    *  端口：`80/tcp, 443/tcp` → `httpd_t, http_port_t`

一个运行在 `httpd_t` 安全上下文的端口可以和被标记为 `httpd_something_t` 标签的事物交互。

1. 许多命令接收 `-Z` 参数来查看、创建和修改安全上下文：
    *   `ls -Z`

    *   `id -Z`

    *   `ps -Z`

    *   `netstat -Z`

    *   `cp -Z`

    *   `mkdir -Z`

当文件被创建时，它们的安全上下文会根据它们父目录的安全上下文来创建（可能有某些例外）。RPM 可以在安装过程中设定安全上下文。

1. 导致 SELinux 错误的四个关键的因素如下，它们将在 15-21 条深入解释：
    *  标签问题

    *  SELinux 需要知晓更多信息

    *  SELinux 策略或者应用有 bug

    *  你的信息可能被损坏了

1.  _标签问题：_ 假如你的位于  `/srv/myweb` 的文件没有被正确地标志，获取这些资源时可能会被拒绝。下面是一些解决方法：
    * 假如你知道标签：
        `# semanage fcontext -a -t httpd_sys_content_t '/srv/myweb(/.*)?'`

    *  假如你知道和它有相同标签的文件：
        `# semanage fcontext -a -e /srv/myweb /var/www`

    *  恢复安全上下文（针对上述两种情形）：
        `# restorecon -vR /srv/myweb`

1.  _标识问题：_ 假如你移动了一个文件而不是复制它，这个文件仍然保留原来的安全上下文。为了修复这些问题，你需要：
    *  使用标签来改变安全上下文：
        `# chcon -t httpd_system_content_t /var/www/html/index.html`

    *  使用参考文件的标签来改变安全上下文：
        `# chcon --reference /var/www/html/ /var/www/html/index.html`

    *  恢复安全上下文（针对上述两种情形）： `# restorecon -vR /var/www/html/`

1. 假如_SELinux 需要知道_ HTTPD 在端口 8585 上监听，使用下面的命令告诉它：
    `# semanage port -a -t http_port_t -p tcp 8585`

1.  _SELinux 需要知道_ 布尔值来允许在运行时改变 SELinux 的策略，而不需要知道任何关于 SELinux 策略读写的信息。例如，假如你想让 httpd 去发送邮件，键入：`# setsebool -P httpd_can_sendmail 1`

1. _SELinux 需要知道_ 布尔值来做 SELinux 的开关设定：
    *  查看所有的布尔值：`# getsebool -a`

    *  查看每一个的描述：`# semanage boolean -l`

    *  设定某个布尔值，执行：`# setsebool [_boolean_] [1|0]`

    *  添加 `-P` 参数来作为永久设置，例如：
        `# setsebool httpd_enable_ftp_server 1 -P`

1. SELinux 策略或者应用有 bug，包括：
    *  不寻常的代码路径

    *  配置

    *  `stdout` 的重定向

    *  泄露的文件描述符

    *  可执行内存

    *  损坏的已构建的库
    打开一个工单（但别书写一个 Bugzilla 报告，使用 Bugzilla 没有对应的服务）。

1.  _你的信息可能被损坏了_ 假如你被限制在某个区域，尝试这样做：
    *  加载内核模块

    *  关闭 SELinux 的强制模式

    *  向 `etc_t/shadow_t` 写入东西

    *  修改 iptables 规则

1. 下面是安装针对策略模块的发展的 SELinux 工具：
    `# yum -y install setroubleshoot setroubleshoot-server`
    在你安装后重启或重启动 `auditd` 服务

1. 使用 `journalctl` 来监听所有跟 `setroubleshoot` 有关的日志：
    `# journalctl -t setroubleshoot --since=14:20`

1. 使用 `journalctl` 来监听所有跟某个特定 SELinux 标签相关的日志，例如：
    `# journalctl _SELINUX_CONTEXT=system_u:system_r:policykit_t:s0`

1. 当 SELinux 错误发生时，使用`setroubleshoot` 的日志，并尝试找到某些可能的解决方法。例如，从 `journalctl`：
    ```
    Jun 14 19:41:07 web1 setroubleshoot: SELinux is preventing httpd from getattr access on the file /var/www/html/index.html. For complete message run: sealert -l 12fd8b04-0119-4077-a710-2d0e0ee5755e

    # sealert -l 12fd8b04-0119-4077-a710-2d0e0ee5755e
    SELinux is preventing httpd from getattr access on the file /var/www/html/index.html.

    ***** Plugin restorecon (99.5 confidence) suggests ************************

    If you want to fix the label,
    /var/www/html/index.html default label should be httpd_syscontent_t.
    Then you can restorecon.
    Do
    # /sbin/restorecon -v /var/www/html/index.html
    ```

1. 带有 SELinux 记录的日志：
    *   `/var/log/messages`

    *   `/var/log/audit/audit.log`

    *   `/var/lib/setroubleshoot/setroubleshoot_database.xml`

1. 在 audit 日志文件中查找有关 SELinux 的错误：
    `# ausearch -m AVC,USER_AVC,SELINUX_ERR -ts today`

1. 针对某个特定的服务，搜寻 SELinux 的访问向量缓存（Access Vector Cache,，AVC）信息：
    `# ausearch -m avc -c httpd`

1. `audit2allow` 程序可以通过从日志中搜集有关被拒绝的操作，然后生成 SELinux 策略允许的规则，例如：
    *  生成一个为什么会被拒绝访问的对人友好的描述： `# audit2allow -w -a`

    *  查看允许被拒绝的访问的类型强制规则： `# audit2allow -a`

    *  创建一个自定义模块：`# audit2allow -a -M mypolicy`
       其中的 `-M` 选项将创建一个特定名称的类型强制文件（.te），(.te) 并且将规则编译进一个策略包（.pp）中：`mypolicy.pp mypolicy.te`

    *  安装自定义模块：`# semodule -i mypolicy.pp`

1. 为了配置一个单独的进程（区域）来更宽松地运行： `# semanage permissive -a httpd_t`

1. 假如你不在想某个区域是宽松的：`# semanage permissive -d httpd_t`

1. 禁用所有的宽松区域： `# semodule -d permissivedomains`

1. 启用 SELinux MLS 策略：`# yum install selinux-policy-mls`
    在 `/etc/selinux/config` 文件中配置：
    `SELINUX=permissive`
    `SELINUXTYPE=mls`
    确保 SELinux 正运行在宽松模式下：`# setenforce 0`
    使用 `fixfiles` 脚本来确保在下一次重启时文件将被重新标识：
    `# fixfiles -F onboot # reboot`

1. 创建一个带有特定 MLS 范围的用户：`# useradd -Z staff_u john`
    使用 `useradd` 命令来将新的用户映射到一个现存的 SELinux 用户（在这个例子中，用户为 `staff_u`）。

1. 查看 SELinux 和 Linux 用户之间的映射：`# semanage login -l`

1. 为某个用户定义一个特别的范围：`# semanage login --modify --range s2:c100 john`

1. 更正用户家目录的标志（假如需要的话）：`# chcon -R -l s2:c100 /home/john`

1. 列出当前的类别：`# chcat -L`

1. 更改类别或者创建你自己类别，修改如下的文件：
    `/etc/selinux/_<selinuxtype>_/setrans.conf`

1. 以某个特定的文件、角色和用户安全上下文来运行一个命令或者脚本：
    `# runcon -t initrc_t -r system_r -u user_u yourcommandhere`
    *   `-t` 是 _文件安全上下文_ 

    *   `-r` 是 _角色安全上下文_ 

    *   `-u` 是 _用户安全上下文_ 

1. 禁用 SELinux 来运行容器：
    *  使用 Podman：`# podman run --security-opt label=disable` …

    *  使用 Docker：`# docker run --security-opt label=disable` …

1. 假如你需要给一个容器对系统的完整访问权限：
    *  使用 Podman：`# podman run --privileged` …

    *  使用 Docker：`# docker run --privileged` …

知道了上面的这些，你就已经知道答案了。所以请 **不要惊慌，打开 SELinux**。

### 作者简介

Alex Callejas - Alex Callejas 是位于墨西哥城的红帽公司拉丁美洲区的一名技术客服经理。作为一名系统管理员，他已有超过 10 年的经验。在基础设施强化方面具有很强的专业知识。对开源抱有热情，通过在不同的公共事件和大学中分享他的知识来支持社区。天生的极客，当然他一般选择使用 Fedora Linux 发行版。[这里][11]有更多关于我的信息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/sysadmin-guide-selinux

作者：[Alex Callejas][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/darkaxl
[11]:https://opensource.com/users/darkaxl
[13]:https://pixabay.com/en/security-secure-technology-safety-2168234/
[14]:https://creativecommons.org/publicdomain/zero/1.0/deed.en
[15]:https://en.wikipedia.org/wiki/Ethan_Hunt
[16]:https://en.wikipedia.org/wiki/Red_pill_and_blue_pill
[17]:https://en.wikipedia.org/wiki/Security-Enhanced_Linux
[18]:https://opensource.com/users/darkaxl
[19]:https://opensource.com/users/darkaxl
[20]:https://opensource.com/article/18/7/sysadmin-guide-selinux#comments
[21]:https://opensource.com/tags/security
[22]:https://opensource.com/tags/linux
[23]:https://opensource.com/tags/sysadmin
