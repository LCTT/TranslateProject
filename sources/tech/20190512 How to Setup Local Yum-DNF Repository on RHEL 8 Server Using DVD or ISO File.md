[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Setup Local Yum/DNF Repository on RHEL 8 Server Using DVD or ISO File)
[#]: via: (https://www.linuxtechi.com/setup-local-yum-dnf-repository-rhel-8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Setup Local Yum/DNF Repository on RHEL 8 Server Using DVD or ISO File
======

Recently Red Hat has released its most awaited operating system “ **RHEL 8** “, in case you have installed RHEL 8 Server on your system and wondering how to setup local yum or dnf repository using installation DVD or ISO file then refer below steps and procedure.

<https://www.linuxtechi.com/wp-content/uploads/2019/05/Setup-Local-Repo-RHEL8.jpg>

In RHEL 8, we have two package repositories:

  * BaseOS
  * Application Stream



BaseOS repository have all underlying OS packages where as Application Stream repository have all application related packages, developer tools and databases etc. Using Application stream repository, we can have multiple of versions of same application and Database.

### Step:1) Mount RHEL 8 ISO file / Installation DVD

To mount RHEL 8 ISO file inside your RHEL 8 server use the beneath mount command,

```
[root@linuxtechi ~]# mount -o loop rhel-8.0-x86_64-dvd.iso /opt/
```

**Note:** I am assuming you have already copied RHEL 8 ISO file inside your system,

In case you have RHEL 8 installation DVD, then use below mount command to mount it,

```
[root@linuxtechi ~]# mount /dev/sr0  /opt
```

### Step:2) Copy media.repo file from mounted directory to /etc/yum.repos.d/

In our case RHEL 8 Installation DVD or ISO file is mounted under /opt folder, use cp command to copy media.repo file to /etc/yum.repos.d/ directory,

```
[root@linuxtechi ~]# cp -v /opt/media.repo /etc/yum.repos.d/rhel8.repo
'/opt/media.repo' -> '/etc/yum.repos.d/rhel8.repo'
[root@linuxtechi ~]#
```

Set “644” permission on “ **/etc/yum.repos.d/rhel8.repo** ”

```
[root@linuxtechi ~]# chmod 644 /etc/yum.repos.d/rhel8.repo
[root@linuxtechi ~]#
```

### Step:3) Add repository entries in “/etc/yum.repos.d/rhel8.repo” file

By default, **rhel8.repo** file will have following content,

<https://www.linuxtechi.com/wp-content/uploads/2019/05/default-rhel8-repo-file.jpg>

Edit rhel8.repo file and add the following contents,

```
[root@linuxtechi ~]# vi /etc/yum.repos.d/rhel8.repo
[InstallMedia-BaseOS]
name=Red Hat Enterprise Linux 8 - BaseOS
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///opt/BaseOS/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release

[InstallMedia-AppStream]
name=Red Hat Enterprise Linux 8 - AppStream
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///opt/AppStream/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
```

rhel8.repo should look like above once we add the content, In case you have mounted the Installation DVD or ISO on different folder then change the location and folder name in base url line for both repositories and rest of parameter leave as it is.

### Step:4) Clean Yum / DNF and Subscription Manager Cache

Use the following command to clear yum or dnf and subscription manager cache,

```
root@linuxtechi ~]# dnf clean all
[root@linuxtechi ~]# subscription-manager clean
All local data removed
[root@linuxtechi ~]#
```

### Step:5) Verify whether Yum / DNF is getting packages from Local Repo

Use dnf or yum repolist command to verify whether these commands are getting packages from Local repositories or not.

```
[root@linuxtechi ~]# dnf repolist
Updating Subscription Management repositories.
Unable to read consumer identity
This system is not registered to Red Hat Subscription Management. You can use subscription-manager to register.
Last metadata expiration check: 1:32:44 ago on Sat 11 May 2019 08:48:24 AM BST.
repo id                 repo name                                         status
InstallMedia-AppStream  Red Hat Enterprise Linux 8 - AppStream            4,672
InstallMedia-BaseOS     Red Hat Enterprise Linux 8 - BaseOS               1,658
[root@linuxtechi ~]#
```

**Note :** You can use either dnf or yum command, if you use yum command then its request is redirecting to DNF itself because in RHEL 8 yum is based on DNF command.

If you have noticed the above command output carefully, we are getting warning message “ **This system is not registered to Red Hat Subscription Management**. **You can use subscription-manager to register”** , if you want to suppress or prevent this message while running dnf / yum command then edit the file “/etc/yum/pluginconf.d/subscription-manager.conf”, changed the parameter “enabled=1” to “enabled=0”

```
[root@linuxtechi ~]# vi /etc/yum/pluginconf.d/subscription-manager.conf
[main]
enabled=0
```

save and exit the file.

### Step:6) Installing packages using DNF / Yum

Let’s assume we want to install nginx web server then run below dnf command,

```
[root@linuxtechi ~]# dnf install nginx
```

![][1]

Similarly if you want to install **LEMP** stack on your RHEL 8 system use the following dnf command,

```
[root@linuxtechi ~]# dnf install nginx mariadb php -y
```

[![][2]][3]

This confirms that we have successfully configured Local yum / dnf repository on our RHEL 8 server using Installation DVD or ISO file.

In case these steps help you technically, please do share your feedback and comments.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/setup-local-yum-dnf-repository-rhel-8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/wp-content/uploads/2019/05/dnf-install-nginx-rhel8-1024x376.jpg
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/05/LEMP-Stack-Install-RHEL8-1024x540.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/05/LEMP-Stack-Install-RHEL8.jpg
