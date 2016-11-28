Yinux 翻译中
 热补丁 - 免重启安装Ubuntu Linux 关键性补丁
============================================================

如果你是一个在企业环境中掌管关键性系统的系统管理员,你肯定知道以下两件事:

1) 很难找个停机时间去给系统安装安全补丁以修复内核或者系统漏洞 . 如果你工作的公司或者客户没有专门制定安全策略,运营管理可能最终会优先保证系统的运行而不是解决系统漏洞. 此外,内部的官僚主义也可能造成停机批准的延迟.我当时就是这样的.

2) 有时候你确实停不起, 并且还要做好用别的什么方法减小恶意攻击的风险.

好消息是 Canonical公司最近(事实上,几十天前)针对Ubuntu 16.04 (64位 / 4.4.x 内核)发布了一个不用重启就能安装关键性内核补丁的服务. 对,你没看错:打热补丁,你不用重启,就能使Ubuntu 160.4服务器 的安全补丁生效.

### 注册 Ubuntu Livepatch 账号

要享受 Canonical Livepatch 服务你先要在这里注册一个账号 [https://auth.livepatch.canonical.com/][1] 然后表明你是一个普通用户还是企业用户(付费). 通过令牌,所有的Ubuntu用户都能连接3台不同的电脑:

[
 ![Canonical Livepatch Service](http://www.tecmint.com/wp-content/uploads/2016/10/Canonical-Livepatch-Service.png) 
][2]

Canonical 热补丁服务
下一步会提示你输入你的 Ubuntu One 用户名密码或者注册一个新账号. 要是你注册的话,还会要你确认你的邮件地址以完成注册:
:

[
 ![Ubuntu One Confirmation Mail](http://www.tecmint.com/wp-content/uploads/2016/10/Ubuntu-One-Confirmation-Mail.png) 
][3]

Ubuntu One  确认邮件

一旦你点了上面的链接确认了你的邮件地址,你就会回到这个界面 [https://auth.livepatch.canonical.com/][4] 得到你的热补丁令牌.

### 获取令牌并使用它

首先,把分配给你账号的这个独一无二的令牌复制下来:

[
 ![Canonical Livepatch Token](http://www.tecmint.com/wp-content/uploads/2016/10/Livepatch-Token.png) 
][5]

Canonical 热补丁令牌

然后打开终端,输入:

```
$ sudo snap install canonical-livepatch
```

上面的命令会安装 livepach程序,下面的命令会激活热补丁服务

```
$ sudo canonical-livepatch enable [YOUR TOKEN HERE]
```
如果后面的命令提示 找不到  canonical-livepatch, 检查一下 `/snap/bin` 是不是在 path路径里面. 或者把你的工作目录切换到 `/snap/bin` 也行.

```
$ sudo ./canonical-livepatch enable [YOUR TOKEN HERE]
```
[
 ![Install Livepatch in Ubuntu](http://www.tecmint.com/wp-content/uploads/2016/10/Install-Livepatch-in-Ubuntu.png) 
][6]

安装热补丁

以后你可能会看一下已安装补丁的描述,检查一下安装状况.幸运的是,这很简单

```
$ sudo ./canonical-livepatch status --verbose
```

执行上面的命令,你就能看到下图:

[
 ![Check Livepatch Status in Ubuntu](http://www.tecmint.com/wp-content/uploads/2016/10/Check-Livepatch-Status.png) 
][7]

检查补丁安装情况

在你的Ubuntu服务器上启用了热补丁,你就可以把计划的非计划的停机降到最低,并且还能保证系统的安全.希望Canonical的这个服务能让你在运维上得到鼓励或者更近一步,一个提高.

如果你对这篇文章有什么疑问,欢迎在下面留言,我们会尽快回复.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/livepatch-install-critical-security-patches-to-ubuntu-kernel

作者：[Gabriel Cánepa][a]
译者：[Yinux](https://github.com/Yinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://auth.livepatch.canonical.com/
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Canonical-Livepatch-Service.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Ubuntu-One-Confirmation-Mail.png
[4]:https://auth.livepatch.canonical.com/
[5]:http://www.tecmint.com/wp-content/uploads/2016/10/Livepatch-Token.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/10/Install-Livepatch-in-Ubuntu.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Check-Livepatch-Status.png
