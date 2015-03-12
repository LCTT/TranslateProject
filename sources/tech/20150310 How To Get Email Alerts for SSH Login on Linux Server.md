Vic020

How To Get Email Alerts for SSH Login on Linux Server
================================================================================
![](http://www.ehowstuff.com/wp-content/uploads/2015/03/fail2ban-security.jpg)

Enable SSH server on a virtual private server (VPS) will expose the server to the internet and provide opportunities for hacking activities, especially when VPS still using root as a primary access. VPS should be configured with a email alert automatically to each successful login attempts via SSH server . VPS server owner shall be notified of any SSH server access log, such as who, when and which source IP address. This is an important security concern for server owners to protect the server from unknown login attempts. This is because if hackers use brute force to log into your VPS via ssh then it can be very dangerous. In this article, I will explain how to set up an email alert to all SSH login users on linux CentOS 6, CentOS 7, RHEL 6 and RHEL 7.

1. Login to your server as root user :

2. Configure at alert from source global definitions (/etc/bashrc). This will enabled for root and normal users :

    [root@vps ~]# vi /etc/bashrc

Add the following at the bottom of the files.

    echo 'ALERT - Root Shell Access (vps.ehowstuff.com) on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" recipient@gmail.com

3. Optionally you can enable alert for root only :

    [root@vps ~]# vi .bashrc

Add the following at the bottom of /root/.bashrc :

    echo 'ALERT - Root Shell Access (vps.ehowstuff.com) on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" recipient@gmail.com

Full Configuration file example :

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

4. Optionally you can enable alert for specify normal user (e.g skytech ) :

    [root@vps ~]# vi /home/skytech/.bashrc

Add the following at the bottom of /home/skytech/.bashrc :

    echo 'ALERT - Root Shell Access (vps.ehowstuff.com) on:' `date` `who` | mail -s "Alert: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" recipient@gmail.com

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-get-email-alerts-for-ssh-login-on-linux-server/

作者：[skytech][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/
