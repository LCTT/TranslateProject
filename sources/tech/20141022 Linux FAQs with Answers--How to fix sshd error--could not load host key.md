Translating by GOLinux!
Linux FAQs with Answers--How to fix “sshd error: could not load host key”
================================================================================
> **Question**: When I try to SSH to a remote server, SSH client fails with "Connection closed by X.X.X.X". On the SSH server side, I see error messages: "sshd error: could not load host key." What is going on, and how can I fix this error? 

The detailed symptom of this SSH connection error is as follows.

**SSH client side**: when you attempt to SSH to a remote host, you don't see login screen, and your SSH connection is closed right away with a message: "Connection closed by X.X.X.X"

**SSH server side**: in a system log, you see the following error messages (e.g., /var/log/auth.log on Debian/Ubuntu).

    Oct 16 08:59:45 openstack sshd[1214]: error: Could not load host key: /etc/ssh/ssh_host_rsa_key
    Oct 16 08:59:45 openstack sshd[1214]: error: Could not load host key: /etc/ssh/ssh_host_dsa_key
    Oct 16 08:59:45 openstack sshd[1214]: error: Could not load host key: /etc/ssh/ssh_host_ecdsa_key
    Oct 16 08:59:45 openstack sshd[1214]: fatal: No supported key exchange algorithms [preauth]

The root cause of this problem is that sshd daemon somehow is not able to load SSH host keys.

When OpenSSH server is first installed on Linux system, SSH host keys should automatically be generated for subsequent use. If, however, key generation was not finished successfully, that can cause SSH login problems like this.

Let's check if SSH host keys are found where they should be.

    $ ls -al /etc/ssh/ssh*key 

![](https://farm4.staticflickr.com/3931/15367231099_61b9087256_z.jpg)

If SSH host keys are not found there, or their size is all truncated to zero (like above), you need to regenerate SSH host keys from scratch.

### Regenerate SSH Host Keys ###

On Debian, Ubuntu or their derivatives, you can use dpkg-reconfigure tool to regenerate SSH host keys as follows.

    $ sudo rm -r /etc/ssh/ssh*key
    $ sudo dpkg-reconfigure openssh-server 

![](https://farm4.staticflickr.com/3931/15551179631_363e6a9047_z.jpg)

On CentOS, RHEL or Fedora, all you have to do is to restart sshd after removing existing (problematic) keys.

    $ sudo rm -r /etc/ssh/ssh*key
    $ sudo systemctl restart sshd

An alternative way to regenerate SSH host keys is to manually generate them using ssh-keygen command.

    $ sudo ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
    $ sudo ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
    $ sudo ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key 

![](https://farm6.staticflickr.com/5603/15367844767_cdfd9716c8_z.jpg)

Once new SSH host keys are generated, make sure that they are found in /etc/ssh directory. There is no need to restart sshd at this point.

     $ ls -al /etc/ssh/ssh*key 

Now try to SSH again to the SSH server to see if the problem is gone.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/sshd-error-could-not-load-host-key.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
