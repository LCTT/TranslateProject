如何设置 Linux 上 SSH 登录的 Email 提醒
================================================================================
![](http://www.ehowstuff.com/wp-content/uploads/2015/03/fail2ban-security.jpg)

虚拟私有服务器 （VPS）上启用 SSH 服务使得该服务器暴露到互联网中，为黑客攻击提供了机会，尤其是当 VPS 还允许root 直接访问时。VPS 应该为每次 SSH 登录成功尝试配置一个自动的 email 警告。 VPS 服务器的所有者会得到各种 SSH 服务器访问日志的通知，例如登录者、登录时间以及来源 IP 地址等信息。这是一个对于服务器拥有者来说，保护服务器避免未知登录尝试的重要安全关注点。这是因为如果黑客使用暴力破解方式通过 SSH 来登录到你的 VPS 的话，后果很严重。在本文中，我会解释如何在 CentOS 6、 CentOS 7、 RHEL 6 和 RHEL 7上为所有的 SSH 用户登录设置一个 email 警告。

1. 使用root用户登录到你的服务器；

2. 在全局源定义处配置警告（/etc/bashrc），这样就会对 root 用户以及普通用户都生效：

    	[root@vps ~]# vi /etc/bashrc

	将下面的内容加入到上述文件的尾部。

    	echo 'ALERT - Root Shell Access (vps.ehowstuff.com) on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" recipient@gmail.com

3. 你也可以选择性地让警告只对 root 用户生效：

    	[root@vps ~]# vi .bashrc

	将下面的内容添加到/root/.bashrc的尾部：

    	echo 'ALERT - Root Shell Access (vps.ehowstuff.com) on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" recipient@gmail.com

	整个配置文件样例：

    	# .bashrc
    
    	# User specific aliases and functions
    
    	alias rm='rm -i'
    	alias cp='cp -i'
    	alias mv='mv -i'
    
    	# Source global definitions
    	if [ -f /etc/bashrc ]; then
            	. /etc/bashrc
   	 	fi
    	echo 'ALERT - Root Shell Access (vps.ehowstuff.com) on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" recipient@gmail.com

4. 你也可以选择性地让警告只对特定的普通用户生效（例如 skytech）：

   	 	[root@vps ~]# vi /home/skytech/.bashrc

	将下面的内容加入到/home/skytech/.bashrc文件尾部：

    	echo 'ALERT - Root Shell Access (vps.ehowstuff.com) on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" recipient@gmail.com

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-get-email-alerts-for-ssh-login-on-linux-server/

作者：[skytech][a]
译者：[theo-l](https://github.com/theo-l)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/
