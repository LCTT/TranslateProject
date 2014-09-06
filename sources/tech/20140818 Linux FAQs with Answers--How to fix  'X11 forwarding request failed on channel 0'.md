Translating----------geekpi


Linux FAQs with Answers--How to fix “X11 forwarding request failed on channel 0″
================================================================================
> **Question**: When I tried to SSH to a remote host with X11 forwarding option, I got "X11 forwarding request failed on channel 0" error after logging in. Why am I getting this error, and how can I fix this problem? 

![](https://farm6.staticflickr.com/5562/14909594691_ce7ca01b2d_z.jpg)

First of all, we assume that you already enabled [X11 forwarding over SSH][1] properly.

If you are getting "X11 forwarding request failed on channel 0" message upon SSH login, there could be several reasons. Solutions vary as well.

### Solution One ###

For security reason, OpenSSH server, by default, binds X11 forwarding server to the local loopback address, and sets the hostname in DISPLAY environment variable to "localhost". Under this setup, some X11 clients cannot handle X11 forwarding properly, which causes the reported error. To fix this problem, add the following line in /etc/ssh/sshd_config file, which will let X11 forwarding server bind on the wild card address.

    $ sudo vi /etc/ssh/sshd_config 

----------

    X11Forwarding yes
    X11UseLocalhost no

Restart SSH server to activate the change:

    $ sudo /etc/init.d/ssh restart (Debian 6, Ubuntu or Linux Mint)
    $ sudo systemctl restart ssh.service (Debian 7, CentOS/RHEL 7, Fedora)
    $ sudo service sshd restart (CentOS/RHEL 6) 

### Solution Two ###

The broken X11 forwarding error may also happen if the remote host where SSH server is running has IPv6 disabled. To fix the error in this case, open /etc/ssh/sshd_config file, and uncomment "AddressFamily all" (if any). Then add the following line. This will force SSH server to use IPv4 only, but not IPv6.

    $ sudo vi /etc/ssh/sshd_config 

----------

    AddressFamily inet

Again, restart SSH server to finalize the change.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-broken-x11-forwarding-ssh.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2012/11/how-to-enable-x11-forwarding-using-ssh.html