Translating----------------geekpi

Options in Linux RPM Command to Query Packages
================================================================================
RPM is RedHat Package Manager, used to install/remove/update and query the packages in Red Hat based linux. RHEL and the systems based on it uses rpm command to do that.  The following example demonstrates the use of rpm query feature and shows different ways you can query rpm database and restore configuration file.

I have included the SSH package to in the example commands.

### Query RPM Database and Packages ###

**1、 To query the whole RPM database, use the following command.**

    # rpm -qa
    plymouth-0.8.3-27.el6.x86_64
    pciutils-libs-3.1.10-2.el6.i686 
    netcf-libs-0.1.9-3.el6.x86_64
    ..
    …
    ..
    Output Truncated

**2、 You can identify the package from which SSH is installed by using grep on the above example.**

    # rpm -qa |grep ssh
    libssh2-1.4.2-1.el6.x86_64
    openssh-askpass-5.3p1-84.1.el6.x86_64
    libssh2-1.4.2-1.el6.i686
    openssh-server-5.3p1-84.1.el6.x86_64
    openssh-clients-5.3p1-84.1.el6.x86_64
    openssh-5.3p1-84.1.el6.x86_64

The output shows other packages related to ssh but you have to still identify that which package is actually installing SSH.  To further break it down see the next example.

**3、 Check the installed package of SSH a) from sshd daemon  b) from it’s configuration file.**

    # rpm -qf /etc/init.d/sshd
    openssh-server-5.3p1-84.1.el6.x86_64
    # rpm -qf /etc/ssh/sshd_config
    openssh-server-5.3p1-84.1.el6.x86_64

As you can see the ssh is installed from the openssh-server-5.3p1-84.1.el6.x86_64 package.  You can use rpm -qf command both on daemon and a configuration file. Both will output the package it is installed from.

**4、 Now that you have the package name, you may want to explore more on it and want to know what are the various files this package contains. For that use rpm -ql command.**

    # rpm -ql openssh-server-5.3p1-84.1.el6.x86_64
    /etc/pam.d/ssh-keycat
    /etc/pam.d/sshd
    /etc/rc.d/init.d/sshd
    /etc/ssh/sshd_config
    /etc/sysconfig/sshd
    /usr/libexec/openssh/sftp-server
    /usr/libexec/openssh/ssh-keycat
    /usr/sbin/.sshd.hmac
    /usr/sbin/sshd
    /usr/share/doc/openssh-server-5.3p1
    /usr/share/doc/openssh-server-5.3p1/HOWTO.ssh-keycat
    /usr/share/man/man5/moduli.5.gz
    /usr/share/man/man5/sshd_config.5.gz
    /usr/share/man/man8/sftp-server.8.gz
    /usr/share/man/man8/sshd.8.gz
    /var/empty/sshd

he above output is showing all the files that this package installed on the system. Now let’s even break it down and we only want to see the configuration files and document files supplied with this package.

**5、 To list only the configuration files use the rpm -qc command.**

    # rpm -qc openssh-server-5.3p1-84.1.el6.x86_64
    /etc/pam.d/ssh-keycat
    /etc/pam.d/sshd
    /etc/ssh/sshd_config
    /etc/sysconfig/sshd

**6、 To list only documentation files use rpm -qd command**

    # rpm -qd openssh-server-5.3p1-84.1.el6.x86_64
    /usr/share/doc/openssh-server-5.3p1/HOWTO.ssh-keycat
    /usr/share/man/man5/moduli.5.gz
    /usr/share/man/man5/sshd_config.5.gz
    /usr/share/man/man8/sftp-server.8.gz
    /usr/share/man/man8/sshd.8.gz

Consider a situation in which you want to configure a service, but you don’t know where to find the configuration files. As an example, Consider the above example: Use **rpm -qf rpm -qf /etc/init.d/sshd** to find out from what package the **/etc/ssh/sshd_config** file originated. It should show you the **openssh-server-5.3p1-84.1.el6.x86_64** package. Use **rpm -ql openssh-server-5.3p1-84.1.el6.x86_64** to show a list of all the files in this package. As you can see, the names of many files are displayed, but the output is not very useful.

Now use **rpm -qc openssh-server-5.3p1-84.1.el6.x86_64** to show just the configuration files used by this package. This shows a list of four files only and gives you the absolute path of [/etc/ssh/sshd_config file][1] to start configuring the service.

**7、 Restore configuration file from RPM Package, without reinstalling a package.**

If for some reason a file has been damaged or got deleted from system, you can start with the **rpm -qf** query option to find out from what package the file originated. Next use **rpm2cpio | cpio -idmv** to extract the files from the package. Consider the ssh example:

Assuming that the **/etc/ssh/sshd_config** file has been deleted and you may not want to reinstall ssh, Restore the file using the steps below.

    * Use rpm -qf /etc/init.d/sshd This command shows that the file comes from the openssh-server-5.3p1-84.1.el6.x86_64 Package.
    
    * Download the Openssh rpm from it’s source
    
    * Copy openssh-server-5.3p1-84.1.el6.x86_64 package file to /tmp directory or any other directory of your choice.
    
    * Use rpm2cpio |cpio -idmv to extract the package.

The command you used in the above step  created a few subdirectories in /tmp. You can now copy it to its original location.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/rpm-command-query/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linoxide.com/how-tos/disable-ssh-direct-login/