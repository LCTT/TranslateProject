在Linux服务器上如何为SSH登陆获取Email警告
================================================================================
![](http://www.ehowstuff.com/wp-content/uploads/2015/03/fail2ban-security.jpg)

让SSH服务器在虚拟私有服务器(VPS)上生效会使得该服务器暴露到互联网中并为黑客活动提供了机会,尤其时当VPS还将root作为主要访问时. VPS应该为每次通过SSH服务器成功登陆尝试配置一个自动的email警告. VPS的服务器所有者应该在任何的SSH服务器访问时得到通知,例如登陆者,登陆时间以及IP地址等信息.这是一个对于服务器拥有者保护服务器避免未知登陆尝试的非常重要的安全关注点.因为如果黑客使用暴力破解方式通过SSH来登陆你的VPS,那么后果很严重.在本文中,我会解释如何在CentOS 6, CentOS 7, RHEL 6 和 RHEL 7上为所有的SSH用户登陆设置一个email警告.	

1. 使用root用户登陆到你的服务器:

2. 在全局源定义处配置警告（/etc/bashrc），这样就会对跟用户以及普通用户都生效：
    [root@vps ~]# vi /etc/bashrc

将下面的内容加入到上述文件的尾部。

    echo 'ALERT - Root Shell Access (vps.ehowstuff.com) on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" recipient@gmail.com

3.你也可以选择性地让警告只对跟用户生效：

    [root@vps ~]# vi .bashrc

将下面的内容添加到/root/.bashrc的为尾部：

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

4.你也可以选择性地让警告只对特定的普通用户生效（例如 skytech）：

    [root@vps ~]# vi /home/skytech/.bashrc

将下面的内容加入到/home/skytech/.bashrc文件尾部：

    echo 'ALERT - Root Shell Access (vps.ehowstuff.com) on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" recipient@gmail.com

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-get-email-alerts-for-ssh-login-on-linux-server/

作者：[skytech][a]
译者：[theo-l](https://github.com/theo-l)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/
