Linux有问必答：如何修复“sshd error: could not load host key”
================================================================================
> **问题**：当我尝试SSH到一台远程服务器时，SSH客户端登陆失败并提示“Connection closed by X.X.X.X”。在SSH服务器那端，我看到这样的错误消息：“sshd error: could not load host key.”。这发生了什么问题，我怎样才能修复该错误？

该SSH连接错误的详细症状如下。

**SSH客户端方面**：当你尝试SSH到一台远程主机时，你没有看见登录屏幕，你的SSH连接就立即关闭，并提示此消息：“Connection closed by X.X.X.X”。

**SSH服务器方面**：在系统日志中，你看到如下错误消息（如，在Debian/Ubuntu上，/var/log/auth.log）。

    Oct 16 08:59:45 openstack sshd[1214]: error: Could not load host key: /etc/ssh/ssh_host_rsa_key
    Oct 16 08:59:45 openstack sshd[1214]: error: Could not load host key: /etc/ssh/ssh_host_dsa_key
    Oct 16 08:59:45 openstack sshd[1214]: error: Could not load host key: /etc/ssh/ssh_host_ecdsa_key
    Oct 16 08:59:45 openstack sshd[1214]: fatal: No supported key exchange algorithms [preauth]

导致该问题的根源是，sshd守护进程不知怎么地不能加载SSH主机密钥了。

当OpenSSH服务器第一次安装到Linux系统时，SSH主机密钥应该会自动生成以供后续使用。如果，不管怎样，密钥生成过程没有成功完成，那就会导致这样的SSH登录问题。

让我们检查能否在相应的地方找到SSH主机密钥。

    $ ls -al /etc/ssh/ssh*key 

![](https://farm4.staticflickr.com/3931/15367231099_61b9087256_z.jpg)

如果SSH主机密钥在那里找不到，或者它们的大小被截断成为0（就像上面那样），你需要从头开始重新生成主机密钥。

### 重新生成SSH主机密钥 ###

在Debian、Ubuntu或其衍生版上，你可以使用dpkg-reconfigure工具来重新生成SSH主机密钥，过程如下：

    $ sudo rm -r /etc/ssh/ssh*key
    $ sudo dpkg-reconfigure openssh-server 

![](https://farm4.staticflickr.com/3931/15551179631_363e6a9047_z.jpg)

在CentOS、RHEL或Fedora上，你所要做的是，删除现存（有问题的）密钥，然后重启sshd服务。

    $ sudo rm -r /etc/ssh/ssh*key
    $ sudo systemctl restart sshd

另外一个重新生成SSH主机密钥的方式是，使用ssh-keygen命令来手动生成。

    $ sudo ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
    $ sudo ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
    $ sudo ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key 

![](https://farm6.staticflickr.com/5603/15367844767_cdfd9716c8_z.jpg)

在生成新的SSH主机密钥后，确保它们能在/etc/ssh目录中找到。此时，不必重启sshd服务。

     $ ls -al /etc/ssh/ssh*key 

现在，再试试SSH到SSH服务器吧，看看问题是否已经离你而去了。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/sshd-error-could-not-load-host-key.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
