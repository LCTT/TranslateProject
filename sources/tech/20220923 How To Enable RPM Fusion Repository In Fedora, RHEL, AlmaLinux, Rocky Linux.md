[#]: subject: "How To Enable RPM Fusion Repository In Fedora, RHEL, AlmaLinux, Rocky Linux"
[#]: via: "https://ostechnix.com/how-to-enable-rpm-fusion-repository-in-fedora-rhel/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Enable RPM Fusion Repository In Fedora, RHEL, AlmaLinux, Rocky Linux
======
Install RPM Fusion Repository In Fedora, RHEL, AlmaLinux, Rocky Linux

In this brief guide, we will see **what is RPM Fusion repository**, why should we **install RPM Fusion repository**, and finally how to **enable RPM Fusion repository** in Fedora, RHEL, and its clones like CentOS, AlmaLinux and Rocky Linux distributions.

#### Contents

1. What is RPM Fusion Repository?
2. 1. Enable RPM Fusion Repository In Fedora Linux  3. 1.1. List Repositories In Fedora
4. 2. Enable RPM Fusion Repository In RHEL  5. 2.1. List Installed Repositories In RHEL-based Systems
6. Conclusion

### What is RPM Fusion Repository?

Fedora project strictly adheres the Fedora [licensing policies][1]. It excludes some packages from the official repositories for the following reasons:

* If a package is propriety, it can't be included in Fedora;
* If a package is closed-source, it can't be included in Fedora;
* If a package is legally encumbered, it cannot be included in Fedora;
* If package violates United States laws (specifically, Federal or applicable state laws), it cannot be included in Fedora.

Any package that fails to meet the aforementioned policies will not be included in the official repositories of Fedora and RHEL. This is why some third party repositories, which have liberal licensing policies, are created. One such repository is **RPM Fusion**.

RPM Fusion is a community-maintained, third-party software repository that provides packages that the Fedora project and Red Hat can't ship due to legal and various other reasons as stated earlier.

The RPM Fusion is a must have to install the necessary multimedia codecs, proprietary software and drivers in Fedora, RHEL and its clones like CentOS, AlmaLinux and Rocky Linux etc.

RPM Fusion has two repositories namely `"free"` and `"nonfree"`. The `free` repository contains the packages that are Open Source as defined by Fedora licensing guidelines. The `nonfree` repository contains redistributable packages that are not Open Source and packages that are not free for commercial purpose.

You can add both repos and use them simultaneously on your personal system. There won't be any conflicts between the packages in the `free` and `nonfree` repos. If you're interested in running only free packages, just add the `free` repo and install the `nonfree` repo later.

### 1. Enable RPM Fusion Repository In Fedora Linux

To enable both the `free` and the `nonfree` RPM Fusion repositories on your Fedora system, run:

```
$ sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

**Sample output:**

```
Last metadata expiration check: 1:51:10 ago on Thursday 29 April 2021 02:10:14 PM.
 rpmfusion-free-release-34.noarch.rpm                                                                                                    5.5 kB/s |  11 kB     00:02    
 rpmfusion-nonfree-release-34.noarch.rpm                                                                                                 6.6 kB/s |  11 kB     00:01    
 Dependencies resolved.
  Package                                              Architecture                      Version                           Repository                               Size
 Installing:
  rpmfusion-free-release                               noarch                            34-1                              @commandline                             11 k
  rpmfusion-nonfree-release                            noarch                            34-1                              @commandline                             11 k
 Transaction Summary
 Install  2 Packages
 Total size: 23 k
 Installed size: 11 k
 Is this ok [y/N]: y
 Downloading Packages:
 Running transaction check
 Transaction check succeeded.
 Running transaction test
 Transaction test succeeded.
 Running transaction
   Preparing        :                                                                                                                                                1/1 
   Installing       : rpmfusion-nonfree-release-34-1.noarch                                                                                                          1/2 
   Installing       : rpmfusion-free-release-34-1.noarch                                                                                                             2/2 
   Verifying        : rpmfusion-free-release-34-1.noarch                                                                                                             1/2 
   Verifying        : rpmfusion-nonfree-release-34-1.noarch                                                                                                          2/2 
 Installed:
   rpmfusion-free-release-34-1.noarch                                                rpmfusion-nonfree-release-34-1.noarch                                               
 Complete!
```

![Enable RPM Fusion Repository In Fedora Linux][2]

Like I already mentioned, you can install only the `free` repo like below:

```
$ sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

To enable only the non-free RPM Fusion repository, do:

```
$ sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

**On Fedora Silverblue:**

To add and enable `free` and `nonfree` RPM Fusion repositories on a Fedora Silverblue machine, run:

```
$ sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Well, RPM Fusion repository is installed and enabled. Let us go ahead and see if RPM Fusion is enabled or not.

#### 1.1. List Repositories In Fedora

To **[find the list of installed repositories][3]** in Fedora, run:

```
$ dnf repolist
```

**Sample output:**

```
repo id                                                                    repo name
 fedora                                                                     Fedora 34 - x86_64
 fedora-cisco-openh264                                                      Fedora 34 openh264 (From Cisco) - x86_64
 fedora-modular                                                             Fedora Modular 34 - x86_64
 rpmfusion-free                                                             RPM Fusion for Fedora 34 - Free
 rpmfusion-free-updates                                                     RPM Fusion for Fedora 34 - Free - Updates
 rpmfusion-nonfree                                                          RPM Fusion for Fedora 34 - Nonfree
 rpmfusion-nonfree-updates                                                  RPM Fusion for Fedora 34 - Nonfree - Updates
 updates                                                                    Fedora 34 - x86_64 - Updates
 updates-modular                                                            Fedora Modular 34 - x86_64 - Updates
```

If you want to list only the enabled repositories, the command would be:

```
$ dnf repolist enabled
```

The first time you attempt to install packages from the RPM Fusion repositories, the `dnf` utility prompts you to confirm the signature of the repositories. Type **y** and hit ENTER to confirm it.

```
[...]
warning: /var/cache/dnf/rpmfusion-free-27856ae4f82a6a42/packages/ffmpeg-4.4-2.fc34.x86_64.rpm: Header V3 RSA/SHA1 Signature, key ID d651ff2e: NOKEY
 RPM Fusion for Fedora 34 - Free                                                                                                         1.6 MB/s | 1.7 kB     00:00    
 Importing GPG key 0xD651FF2E:
  Userid     : "RPM Fusion free repository for Fedora (2020) rpmfusion-buildsys@lists.rpmfusion.org"
  Fingerprint: E9A4 91A3 DE24 7814 E7E0 67EA E06F 8ECD D651 FF2E
  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-34
 Is this ok [y/N]: y
[...]
```

### 2. Enable RPM Fusion Repository In RHEL

In RHEL and its clones like CentOS, AlmaLinux, Rocky Linux etc., you must enable **[EPEL]** repository before enabling RPM Fusion repository.

To install EPEL repository in Red Hat Enterprise Linux system, run:

```
$ sudo dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm
```

After enabling the EPEL repository, run the following command to enable RPM Fusion repository in RHEL and its compatible clones CentOS, AlmaLinux and Rocky Linux:

```
$ sudo dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm
```

**Sample output:**

```
Last metadata expiration check: 0:09:07 ago on Friday 23 September 2022 11:41:49 AM UTC.
rpmfusion-free-release-8.noarch.rpm             861  B/s |  11 kB     00:12    
rpmfusion-nonfree-release-8.noarch.rpm          877  B/s |  11 kB     00:12    
Dependencies resolved.
================================================================================
 Package                        Arch        Version     Repository         Size
================================================================================
Installing:
 rpmfusion-free-release         noarch      8-0.1       @commandline       11 k
 rpmfusion-nonfree-release      noarch      8-0.1       @commandline       11 k

Transaction Summary
================================================================================
Install  2 Packages

Total size: 22 k
Installed size: 7.6 k
Is this ok [y/N]: y
Downloading Packages:
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                        1/1 
  Installing       : rpmfusion-free-release-8-0.1.noarch                    1/2 
  Installing       : rpmfusion-nonfree-release-8-0.1.noarch                 2/2 
  Verifying        : rpmfusion-free-release-8-0.1.noarch                    1/2 
  Verifying        : rpmfusion-nonfree-release-8-0.1.noarch                 2/2 

Installed:
  rpmfusion-free-release-8-0.1.noarch   rpmfusion-nonfree-release-8-0.1.noarch  

Complete!
```

![Enable RPM Fusion Repository In RHEL, CentOS, AlmaLinux, Rocky Linux][4]

If you are using CentOS Steam 8, you need to enable **[PowerTools]** repository as well.

```
$ sudo dnf config-manager --enable powertools
```

CentOS 8 (older version) used a case sensitive name for the **PowerTools** repository:

```
$ sudo dnf config-manager --enable PowerTools
```

On RHEL 8, you should enable subscription:

```
$ sudo subscription-manager repos --enable "codeready-builder-for-rhel-8-$(uname -m)-rpms"
```

In RHEL 7 and its compatible clones like CentOS 7, run the following command to enable EPEL and RPM Fusion repositories:

```
$ sudo yum localinstall --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm
```

#### 2.1. List Installed Repositories In RHEL-based Systems

You can view the [list of the installed repositories][5] at any time using the following commands:

```
$ dnf repolist
```

Or,

```
$ yum repolist
```

**Sample output:**

```
repo id                                                    repo name
appstream                                                  AlmaLinux 8 - AppStream
baseos                                                     AlmaLinux 8 - BaseOS
docker-ce-stable                                           Docker CE Stable - x86_64
epel                                                       Extra Packages for Enterprise Linux 8 - x86_64
epel-modular                                               Extra Packages for Enterprise Linux Modular 8 - x86_64
extras                                                     AlmaLinux 8 - Extras
rpmfusion-free-updates                                     RPM Fusion for EL 8 - Free - Updates
rpmfusion-nonfree-updates                                  RPM Fusion for EL 8 - Nonfree - Updates
```

![List Installed Repositories In RHEL, CentOS, AlmaLinux, Rocky Linux][6]

### Conclusion

That's it. You know now how to **enable RPM Fusion repository RPM-based systems** such as Fedora, RHEL, CentOS, AlmaLinux, and Rocky Linux. Enabling RPM Fusion in a newly installed system is mandatory as it provides a lots of unofficial packages that are not included in the official repositories.

**Resource:**

* [RPM Fusion Configuration][7]

--------------------------------------------------------------------------------

via: https://ostechnix.com/how-to-enable-rpm-fusion-repository-in-fedora-rhel/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://docs.fedoraproject.org/en-US/packaging-guidelines/LicensingGuidelines/
[2]: https://ostechnix.com/wp-content/uploads/2021/04/Enable-RPM-Fusion-repository-in-Fedora-Linux.png
[3]: https://ostechnix.com/find-list-installed-repositories-commandline-linux/
[4]: https://ostechnix.com/wp-content/uploads/2022/09/Enable-RPM-Fusion-repository-in-RHEL-CentOS-AlmaLinux-Rocky-Linux.png
[5]: https://ostechnix.com/find-list-installed-repositories-commandline-linux/
[6]: https://ostechnix.com/wp-content/uploads/2022/09/List-Installed-Repositories-In-RHEL-CentOS-AlmaLinux-Rocky-Linux.png
[7]: https://rpmfusion.org/Configuration
