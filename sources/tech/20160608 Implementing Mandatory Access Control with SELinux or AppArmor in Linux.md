Implementing Mandatory Access Control with SELinux or AppArmor in Linux
===========================================================================

To overcome the limitations of and to increase the security mechanisms provided by standard ugo/rwx permissions and [access control lists][1], the United States National Security Agency (NSA) devised a flexible Mandatory Access Control (MAC) method known as SELinux (short for Security Enhanced Linux) in order to restrict among other things, the ability of processes to access or perform other operations on system objects (such as files, directories, network ports, etc) to the least permission possible, while still allowing for later modifications to this model.

![](http://www.tecmint.com/wp-content/uploads/2016/06/SELinux-AppArmor-Security-Hardening-Linux.png)
>SELinux and AppArmor Security Hardening Linux

Another popular and widely-used MAC is AppArmor, which in addition to the features provided by SELinux, includes a learning mode that allows the system to “learn” how a specific application behaves, and to set limits by configuring profiles for safe application usage.

In CentOS 7, SELinux is incorporated into the kernel itself and is enabled in Enforcing mode by default (more on this in the next section), as opposed to openSUSE and Ubuntu which use AppArmor.

In this article we will explain the essentials of SELinux and AppArmor and how to use one of these tools for your benefit depending on your chosen distribution.

### Introduction to SELinux and How to Use it on CentOS 7

Security Enhanced Linux can operate in two different ways:

- Enforcing: SELinux denies access based on SELinux policy rules, a set of guidelines that control the security engine.
- Permissive: SELinux does not deny access, but denials are logged for actions that would have been denied if running in enforcing mode.

SELinux can also be disabled. Although it is not an operation mode itself, it is still an option. However, learning how to use this tool is better than just ignoring it. Keep it in mind!

To display the current mode of SELinux, use getenforce. If you want to toggle the operation mode, use setenforce 0 (to set it to Permissive) or setenforce 1 (Enforcing).

Since this change will not survive a reboot, you will need to edit the /etc/selinux/config file and set the SELINUX variable to either enforcing, permissive, or disabled in order to achieve persistence across reboots:

![](http://www.tecmint.com/wp-content/uploads/2016/06/Enable-Disable-SELinux-Mode.png)
>How to Enable and Disable SELinux Mode

On a side note, if getenforce returns Disabled, you will have to edit /etc/selinux/config with the desired operation mode and reboot. Otherwise, you will not be able to set (or toggle) the operation mode with setenforce.

One of the typical uses of setenforce consists of toggling between SELinux modes (from enforcing to permissive or the other way around) to troubleshoot an application that is misbehaving or not working as expected. If it works after you set SELinux to Permissive mode, you can be confident you’re looking at a SELinux permissions issue.

Two classic cases where we will most likely have to deal with SELinux are:

- Changing the default port where a daemon listens on.
- Setting the DocumentRoot directive for a virtual host outside of /var/www/html.

Let’s take a look at these two cases using the following examples.

#### EXAMPLE 1: Changing the default port for the sshd daemon

One of the first thing most system administrators do in order to secure their servers is change the port where the SSH daemon listens on, mostly to discourage port scanners and external attackers. To do this, we use the Port directive in `/etc/ssh/sshd_config` followed by the new port number as follows (we will use port 9999 in this case):

```
Port 9999
```

After attempting to restart the service and checking its status we will see that it failed to start:

```
# systemctl restart sshd
# systemctl status sshd
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Check-sshd-Service-Status.png)
>Check SSH Service Status

If we take a look at /var/log/audit/audit.log, we will see that sshd was prevented from starting on port 9999 by SELinux because that is a reserved port for the JBoss Management service (SELinux log messages include the word “AVC” so that they might be easily identified from other messages):

```
# cat /var/log/audit/audit.log | grep AVC | tail -1
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Check-Linux-Audit-Logs.png)
>Check Linux Audit Logs

At this point most people would probably disable SELinux but we won’t. We will see that there’s a way for SELinux, and sshd listening on a different port, to live in harmony together. Make sure you have the policycoreutils-python package installed and run:

```
# yum install policycoreutils-python
```

To view a list of the ports where SELinux allows sshd to listen on. In the following image we can also see that port 9999 was reserved for another service and thus we can’t use it to run another service for the time being:

```
# semanage port -l | grep ssh
```

Of course we could choose another port for SSH, but if we are certain that we will not need to use this specific machine for any JBoss-related services, we can then modify the existing SELinux rule and assign that port to SSH instead:

```
# semanage port -m -t ssh_port_t -p tcp 9999
```

After that, we can use the first semanage command to check if the port was correctly assigned, or the -lC options (short for list custom):

```
# semanage port -lC
# semanage port -l | grep ssh
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Assign-Port-to-SSH.png)
>Assign Port to SSH

We can now restart SSH and connect to the service using port 9999. Note that this change WILL survive a reboot.

#### EXAMPLE 2: Choosing a DocumentRoot outside /var/www/html for a virtual host

If you need to [set up a Apache virtual host][2] using a directory other than /var/www/html as DocumentRoot (say, for example, `/websrv/sites/gabriel/public_html`):

```
DocumentRoot “/websrv/sites/gabriel/public_html”
```

Apache will refuse to serve the content because the index.html has been labeled with the default_t SELinux type, which Apache can’t access:

```
# wget http://localhost/index.html
# ls -lZ /websrv/sites/gabriel/public_html/index.html
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Labeled-default_t-SELinux-Type.png)
>Labeled as default_t SELinux Type

As with the previous example, you can use the following command to verify that this is indeed a SELinux-related issue:

```
# cat /var/log/audit/audit.log | grep AVC | tail -1
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Check-Logs-for-SELinux-Issues.png)
>Check Logs for SELinux Issues

To change the label of /websrv/sites/gabriel/public_html recursively to httpd_sys_content_t, do:

```
# semanage fcontext -a -t httpd_sys_content_t "/websrv/sites/gabriel/public_html(/.*)?"
```

The above command will grant Apache read-only access to that directory and its contents.

Finally, to apply the policy (and make the label change effective immediately), do:

```
# restorecon -R -v /websrv/sites/gabriel/public_html
```

Now you should be able to access the directory:

```
# wget http://localhost/index.html
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Access-Apache-Directory.png)
>Access Apache Directory

For more information on SELinux, refer to the Fedora 22 [SELinux and Administrator guide][3].


### Introduction to AppArmor and How to Use it on OpenSUSE and Ubuntu

The operation of AppArmor is based on profiles defined in plain text files where the allowed permissions and access control rules are set. Profiles are then used to place limits on how applications interact with processes and files in the system.

A set of profiles is provided out-of-the-box with the operating system, whereas others can be put in place either automatically by applications when they are installed or manually by the system administrator.

Like SELinux, AppArmor runs profiles in two modes. In enforce mode, applications are given the minimum permissions that are necessary for them to run, whereas in complain mode AppArmor allows an application to take restricted actions and saves the “complaints” resulting from that operation to a log (/var/log/kern.log, /var/log/audit/audit.log, and other logs inside /var/log/apparmor).

These logs will show through lines with the word audit in them errors that would occur should the profile be run in enforce mode. Thus, you can try out an application in complain mode and adjust its behavior before running it under AppArmor in enforce mode.

The current status of AppArmor can be shown using:

```
$ sudo apparmor_status
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/Check-AppArmor-Status.png)
>Check AppArmor Status

The image above indicates that the profiles /sbin/dhclient, /usr/sbin/, and /usr/sbin/tcpdump are in enforce mode (that is true by default in Ubuntu).

Since not all applications include the associated AppArmor profiles, the apparmor-profiles package, which provides other profiles that have not been shipped by the packages they provide confinement for. By default, they are configured to run in complain mode so that system administrators can test them and choose which ones are desired.

We will make use of apparmor-profiles since writing our own profiles is out of the scope of the LFCS [certification][4]. However, since profiles are plain text files, you can view them and study them in preparation to create your own profiles in the future.

AppArmor profiles are stored inside /etc/apparmor.d. Let’s take a look at the contents of that directory before and after installing apparmor-profiles:

```
$ ls /etc/apparmor.d
```

![](http://www.tecmint.com/wp-content/uploads/2016/06/View-AppArmor-Directory-Content.png)
>View AppArmor Directory Content

If you execute sudo apparmor_status again, you will see a longer list of profiles in complain mode. You can now perform the following operations:

To switch a profile currently in enforce mode to complain mode:

```
$ sudo aa-complain /path/to/file
```

and the other way around (complain –> enforce):

```
$ sudo aa-enforce /path/to/file
```

Wildcards are allowed in the above cases. For example,

```
$ sudo aa-complain /etc/apparmor.d/*
```

will place all profiles inside /etc/apparmor.d into complain mode, whereas

```
$ sudo aa-enforce /etc/apparmor.d/*
```

will switch all profiles to enforce mode.

To entirely disable a profile, create a symbolic link in the /etc/apparmor.d/disabled directory:

```
$ sudo ln -s /etc/apparmor.d/profile.name /etc/apparmor.d/disable/
```

For more information on AppArmor, please refer to the [official AppArmor wiki][5] and to the documentation [provided by Ubuntu][6].

### Summary

In this article we have gone through the basics of SELinux and AppArmor, two well-known MACs. When to use one or the other? To avoid difficulties, you may want to consider sticking with the one that comes with your chosen distribution. In any event, they will help you place restrictions on processes and access to system resources to increase the security in your servers.

Do you have any questions, comments, or suggestions about this article? Feel free to let us know using the form below. Don’t hesitate to let us know if you have any questions or comments.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/mandatory-access-control-with-selinux-or-apparmor-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/gacanepa/
[1]: http://www.tecmint.com/secure-files-using-acls-in-linux/
[2]: http://www.tecmint.com/apache-virtual-hosting-in-centos/
[3]: https://docs.fedoraproject.org/en-US/Fedora/22/html/SELinux_Users_and_Administrators_Guide/index.html
[4]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[5]: http://wiki.apparmor.net/index.php/Main_Page
[6]: https://help.ubuntu.com/community/AppArmor



