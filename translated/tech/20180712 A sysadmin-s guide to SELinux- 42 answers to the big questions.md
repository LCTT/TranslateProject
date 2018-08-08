系统管理员的 SELinux 指南：这个大问题的 42 个答案
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum)

> "一个重要而普遍的事实是，事情并不总是你看上去的那样 …"
>  ―Douglas Adams，银河系漫游指南

安全、坚固、遵从性、策略 —— 系统管理员启示录的四骑士。除了我们的日常任务之外 —— 监视、备份、实施、调优、更新等等 —— 我们还负责我们的系统安全。甚至是那些第三方提供给我们的禁用了安全增强的系统。这看起来像《碟中碟》中 [Ethan Hunt][1] 的工作一样。

面对这种窘境，一些系统管理员决定去[服用蓝色小药丸][2]，因为他们认为他们永远也不会知道如生命、宇宙、以及其它一些大问题的答案。而我们都知道，它的答案就是这 **[42][3]** 个。

按《银河系漫游指南》的精神，这里是关于在你的系统上管理和使用 [SELinux][4] 这个大问题的 42 个答案。

  1. SELinux 是一个标签系统，这意味着每个进程都有一个标签。每个文件、目录、以及系统对象都有一个标签。策略规则负责控制标签化进程和标签化对象之间的访问。由内核强制执行这些规则。


  2. 两个最重要的概念是：标签化（文件、进程、端口等等）和强制类型（它将基于类型对每个进程进行隔离）。


  3. 正确的标签格式是 `user:role:type:level`（可选）。


  4. 多级别安全（MLS）的目的是基于它们所使用数据的安全级别，对进程（域）强制实施控制。比如，一个秘密级别的进程是不能读取极机密级别的数据。


  5. 多类别安全（MCS）从每个其它类（如虚拟机、OpenShift gears、SELinux 沙盒、容器等等）中强制保护类似的进程。


  6. 在引导时内核参数可以改变 SELinux 模式：
    * `autorelabel=1` → 强制给系统标签化
    * `selinux=0` → 内核不加载 SELinux 基础设施的任何部分
    * `enforcing=0` → 引导为 permissive 模式


  7. 如果给整个系统标签化：
`# touch /.autorelabel #reboot`
如果系统标签中有大量的错误，为了能够让 autorelabel 成功，你可以用 permissive 模式引导系统。


  8. 检查 SELinux 是否启用：`# getenforce`


  9. 临时启用/禁用 SELinux：`# setenforce [1|0]`


  10. SELinux 状态工具：`# sestatus`


  11. 配置文件：`/etc/selinux/config`


  12. SELinux 是如何工作的？这是一个为 Apache Web Server 标签化的示例：
    * 二进制文件：`/usr/sbin/httpd`→`httpd_exec_t`
    * 配置文件目录：`/etc/httpd`→`httpd_config_t`
    * 日志文件目录：`/var/log/httpd` → `httpd_log_t`
    * 内容目录：`/var/www/html` → `httpd_sys_content_t`
    * 启动脚本：`/usr/lib/systemd/system/httpd.service` → `httpd_unit_file_d`
    * 进程：`/usr/sbin/httpd -DFOREGROUND` → `httpd_t`
    * 端口：`80/tcp, 443/tcp` → `httpd_t, http_port_t`



在 `httpd_t` 环境中运行的一个进程可以与具有 `httpd_something_t` 标签的对象交互。

  13. 许多命令都可以接收一个 `-Z` 参数去查看、创建、和修改环境：
    * `ls -Z`
    * `id -Z`
    * `ps -Z`
    * `netstat -Z`
    * `cp -Z`
    * `mkdir -Z`



当文件基于它们的父级目录的环境（有一些例外）创建后，它的环境就已经被设置。RPM 包可以在安装时设置环境。

    14. 这里有导致 SELinux 出错的四个关键原因，它们将在下面的 15 - 21 号问题中展开描述：
    * 标签化问题
    * SELinux 需要知道一些东西
    * 在一个 SELinux 策略/app 中有 bug
    * 你的信息可能被损坏


  15. 标签化问题：如果在 `/srv/myweb` 中你的文件没有正确的标签，访问可能会被拒绝。这里有一些修复这类问题的方法：
    * 如果你知道标签：
`# semanage fcontext -a -t httpd_sys_content_t '/srv/myweb(/.*)?'`
    * 如果你知道使用等价标签的文件：
`# semanage fcontext -a -e /srv/myweb /var/www`
    * 恢复环境（对于以上两种情况）：
`# restorecon -vR /srv/myweb`


  16. 标签化问题：如果你是移动了一个文件，而不是去复制它，那么这个文件将保持原始的环境。修复这类问题：
    * 用标签改变环境的命令：
      `# chcon -t httpd_system_content_t /var/www/html/index.html`

    * 用引用标签改变环境的命令：
      `# chcon --reference /var/www/html/ /var/www/html/index.html`

    * 恢复环境（对于以上两种情况）：

      `# restorecon -vR /var/www/html/`


  17. 如果 SELinux 需要知道 HTTPD 是在 8585 端口上监听，告诉 SELinux：
`# semanage port -a -t http_port_t -p tcp 8585`


  18. SELinux 需要知道是否允许在运行时无需重写 SELinux 策略而改变 SELinux 策略部分的布尔值。例如，如果希望 httpd 去发送邮件，输入：`# setsebool -P httpd_can_sendmail 1`


  19. SELinux 需要知道 SELinux 设置的 off/on 的布尔值：
    * 查看所有的布尔值：`# getsebool -a`
    * 查看每个布尔值的描述：`# semanage boolean -l`
    * 设置布尔值：`# setsebool [_boolean_] [1|0]`
    * 将它配置为永久值，添加 `-P` 标志。例如：
`# setsebool httpd_enable_ftp_server 1 -P`


  20. SELinux 策略/apps 可能有 bug，包括：
    * 与众不同的代码路径
    * 配置
    * 重定向 `stdout`
    * 文件描述符漏洞
    * 可运行内存
    * 错误构建的库打开了一个 ticket（不要提交 Bugzilla 报告；这里没有使用 Bugzilla 的 SLAs）


  21. 如果你定义了域，你的信息可能被损坏：
    * 加载内核模块
    * 关闭 SELinux 的强制模式
    * 写入 `etc_t/shadow_t`
    * 修改 iptables 规则


  22. 开发策略模块的 SELinux 工具：
`# yum -y install setroubleshoot setroubleshoot-server`
安装完成之后重引导机器或重启 `auditd` 服务。


  23. 使用 `journalctl` 去列出所有与 `setroubleshoot` 相关的日志：
`# journalctl -t setroubleshoot --since=14:20`


  24. 使用 `journalctl` 去列出所有与特定 SELinux 标签相关的日志。例如：
`# journalctl _SELINUX_CONTEXT=system_u:system_r:policykit_t:s0`


  25. 当 SELinux 发生错误以及建议一些可能的解决方案时，使用 `setroubleshoot` 日志。例如：从  `journalctl` 中：
[code]     Jun 14 19:41:07 web1 setroubleshoot: SELinux is preventing httpd from getattr access on the file /var/www/html/index.html. For complete message run: sealert -l 12fd8b04-0119-4077-a710-2d0e0ee5755e



    # sealert -l 12fd8b04-0119-4077-a710-2d0e0ee5755e
    
    SELinux is preventing httpd from getattr access on the file /var/www/html/index.html.



    ***** Plugin restorecon (99.5 confidence) suggests ************************



    If you want to fix the label,
    
    /var/www/html/index.html default label should be httpd_syscontent_t.
    
    Then you can restorecon.
    
    Do
    
    # /sbin/restorecon -v /var/www/html/index.html




  26. 日志：SELinux 记录的信息全部在这些地方：
    * `/var/log/messages`
    * `/var/log/audit/audit.log`
    * `/var/lib/setroubleshoot/setroubleshoot_database.xml`


  27. 日志：在审计日志中查找 SELinux 错误：
`# ausearch -m AVC,USER_AVC,SELINUX_ERR -ts today`


  28. 为特定的服务去搜索 SELinux 的访问向量缓存（AVC）信息：
`# ausearch -m avc -c httpd`


  29. `audit2allow` 实用工具从拒绝的操作的日志中采集信息，然后生成 SELinux policy-allow 规则。例如：
    * 产生一个人类可读的关于为什么拒绝访问的描述：`# audit2allow -w -a`
    * 查看已允许的拒绝访问的强制类型规则：`# audit2allow -a`
    * 创建一个自定义模块：`# audit2allow -a -M mypolicy`
`-M` 选项使用一个指定的名字去创建一个类型强制文件（.te）并编译这个规则到一个策略包（.pp）中：`mypolicy.pp mypolicy.te`
    * 安装自定义模块：`# semodule -i mypolicy.pp`


  30. 配置单个进程（域）运行在 permissive 模式：`# semanage permissive -a httpd_t`


  31. 如果不再希望一个域在 permissive 模式中：`# semanage permissive -d httpd_t`


  32. 禁用所有的 permissive 域：`# semodule -d permissivedomains`


  33. 启用  SELinux MLS 策略：`# yum install selinux-policy-mls`
在 `/etc/selinux/config` 中：
`SELINUX=permissive`
`SELINUXTYPE=mls`
确保 SELinux 运行在 permissive 模式：`# setenforce 0`
使用 `fixfiles` 脚本去确保那个文件在下次重引导后重打标签：
`# fixfiles -F onboot # reboot`


  34. 使用一个特定的 MLS 范围创建用户：`# useradd -Z staff_u john`
使用 `useradd` 命令，映射新用户到一个已存在的 SELinux 用户（上面例子中是 `staff_u`）。


  35. 查看 SELinux 和 Linux 用户之间的映射：`# semanage login -l`


  36. 为用户定义一个指定的范围：`# semanage login --modify --range s2:c100 john`


  37. 调整用户 home 目录上的标签（如果需要的话）：`# chcon -R -l s2:c100 /home/john`


  38. 列出当前分类：`# chcat -L`


  39. 修改分类或者开始去创建你自己的分类、修改文件：
`/etc/selinux/_<selinuxtype>_/setrans.conf`


  40. 在指定的文件、角色、和用户环境中运行一个命令或脚本：
`# runcon -t initrc_t -r system_r -u user_u yourcommandhere`
    * `-t` 是文件环境
    * `-r` 是角色环境
    * `-u` 是用户环境


  41. 在容器中禁用 SELinux：
    * 使用 Podman：`# podman run --security-opt label=disable` …
    * 使用 Docker：`# docker run --security-opt label=disable` …


  42. 如果需要给容器提供完全访问系统的权限：
    * 使用 Podman：`# podman run --privileged` …
    * 使用 Docker：`# docker run --privileged` …



就这些了，你已经知道了答案。因此请相信我：**不用恐慌，去打开 SELinux 吧**。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/sysadmin-guide-selinux

作者：[Alex Callejas][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/darkaxl
[1]:https://en.wikipedia.org/wiki/Ethan_Hunt
[2]:https://en.wikipedia.org/wiki/Red_pill_and_blue_pill
[3]:https://en.wikipedia.org/wiki/Phrases_from_The_Hitchhiker%27s_Guide_to_the_Galaxy#Answer_to_the_Ultimate_Question_of_Life,_the_Universe,_and_Everything_%2842%29
[4]:https://en.wikipedia.org/wiki/Security-Enhanced_Linux