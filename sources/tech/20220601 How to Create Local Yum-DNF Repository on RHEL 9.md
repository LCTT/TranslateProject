[#]: subject: "How to Create Local Yum/DNF Repository on RHEL 9"
[#]: via: "https://www.linuxtechi.com/create-local-yum-dnf-repository-rhel/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Create Local Yum/DNF Repository on RHEL 9
======
Hello techies, recently Red Hat has released its latest operating system RHEL 9. RHEL 9 fulfill all the requirements of hybrid cloud. It can be installed on physical server, virtual machine and inside the container image.

When we don’t have subscription and want to install packages for doing the POCs then setting up local yum or dnf repository will be handy.

In this guide, we will cover how to create local yum/dnf repository on RHEL 9 using DVD or ISO file step by step.

Prerequisites for creating local Yum/DNF repository

* Minimal Install RHEL 9 system
* Sudo User with admin privileges
* RHEL 9 DVD or ISO file

### 1 ) Mount RHEL 9 ISO File or DVD

We are assuming RHEL 9 iso file is already copied into the system. Run following mount command to mount ISO file on /opt/repo folder.

```
$ sudo mkdir /var/repo
$ sudo mount -o loop rhel-baseos-9.0-x86_64-dvd.iso /var/repo/
```

![Mount-RHEL9-ISO-File-Command][1]

In case of  dvd, run

```
$ sudo mount /dev/sr0 /var/repo/
```

### 2) Create Repo File in ‘/etc/yum.repos.d/’ Directory

Create a repo file with name ‘rhel9-local.repo’ under the folder /etc/yum.repos.d/ with following content

```
$ sudo vi /etc/yum.repos.d/rhel9-local.repo
[Local-BaseOS]
name=Red Hat Enterprise Linux 9 - BaseOS
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///var/repo//BaseOS/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release

[Local-AppStream]
name=Red Hat Enterprise Linux 9 - AppStream
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///var/repo//AppStream/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
```

Save and close the file.

![RHEL8-Local-Repo-File][2]

### 3) Flush Yum/DNF & Subscription Manager Cache

Execute following commands to clean yum or dnf and subscription manager cache.

```
$ sudo dnf clean all
$ sudo subscription-manager clean
```

![DNF-Subscription-Manager-Clean][3]

In the above output, we are getting a warning message ‘This system is not registered with an entitlement’. So, to suppress this warning message, edit the file  ‘/etc/yum/pluginconf.d/subscription-manager.conf’ , change the parameter ‘enabled=1’ to ‘enabled=0’.

```
$ sudo vi /etc/yum/pluginconf.d/subscription-manager.conf
```

![Disable-Subscription-Parameter-RHEL-9][4]

Save and exit the file.

### 4) Install Packages using Local Repository

Now we are all set to test our local repository. Run beneath command to view configure repository.

```
$ sudo dnf repolist
```

Output,

![DNF-Repolist-RHEL-9][5]

Now, try Install packages using dnf command via above configure local repository.

```
$ sudo dnf install nfs-utils
```

Output,

![Install-RPM-Package-via-local-repo-rhel9][6]

![Package-Installation-Completion-RHEL9-DNF-Command][7]

Perfect, above output confirms that nfs-utils package along with its dependencies are installed successfully via locally configured yum or dnf repository.

That’s all from this guide. I hope you have found it informative. Kindly do post your queries and feedback in below comments section.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/create-local-yum-dnf-repository-rhel/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Mount-RHEL9-ISO-File-Command.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/06/RHEL8-Local-Repo-File.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/06/DNF-Subscription-Manager-Clean.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Disable-Subscription-Parameter-RHEL-9.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/06/DNF-Repolist-RHEL-9.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Install-RPM-Package-via-local-repo-rhel9.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/06/Package-Installation-Completion-RHEL9-DNF-Command.png
