Translating by MjSeven


What version of Linux am I running?
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC)

The question "what version of Linux" can mean two different things. Strictly speaking, Linux is the kernel, so the question can refer specifically to the kernel's version number, or "Linux" can be used more colloquially to refer to the entire distribution, as in Fedora Linux or Ubuntu Linux.

`apt`, `dnf`, `yum`, or some other command to install packages.

Both are important, and you may need to know one or both answers to fix a problem with a system. For example, knowing the installed kernel version might help diagnose an issue with proprietary drivers, and identifying what distribution is running will help you quickly figure out if you should be using, or some other command to install packages.

The following will help you find out what version of the Linux kernel and/or what Linux distribution is running on a system.

### How to find the Linux kernel version

To find out what version of the Linux kernel is running, run the following command:
```
uname -srm

```

Alternatively, the command can be run by using the longer, more descriptive, versions of the various flags:
```
uname --kernel-name --kernel-release --machine

```

Either way, the output should look similar to the following:
```
Linux 4.16.10-300.fc28.x86_64 x86_64

```

This gives you (in order): the kernel name, the version of the kernel, and the type of hardware the kernel is running on. In this case, the kernel is Linux version 4.16.10-300.fc28.x86_64 running on an x86_64 system.

More information about the `uname` command can be found by running `man uname`.

### How to find the Linux distribution

There are several ways to figure out what distribution is running on a system, but the quickest way is the check the contents of the `/etc/os-release` file. This file provides information about a distribution including, but not limited to, the name of the distribution and its version number. The os-release file in some distributions contains more details than in others, but any distribution that includes an os-release file should provide a distribution's name and version.

To view the contents of the os-release file, run the following command:
```
cat /etc/os-release

```

On Fedora 28, the output looks like this:
```
NAME=Fedora

VERSION="28 (Workstation Edition)"

ID=fedora

VERSION_ID=28

PLATFORM_ID="platform:f28"

PRETTY_NAME="Fedora 28 (Workstation Edition)"

ANSI_COLOR="0;34"

CPE_NAME="cpe:/o:fedoraproject:fedora:28"

HOME_URL="https://fedoraproject.org/"

SUPPORT_URL="https://fedoraproject.org/wiki/Communicating_and_getting_help"

BUG_REPORT_URL="https://bugzilla.redhat.com/"

REDHAT_BUGZILLA_PRODUCT="Fedora"

REDHAT_BUGZILLA_PRODUCT_VERSION=28

REDHAT_SUPPORT_PRODUCT="Fedora"

REDHAT_SUPPORT_PRODUCT_VERSION=28

PRIVACY_POLICY_URL="https://fedoraproject.org/wiki/Legal:PrivacyPolicy"

VARIANT="Workstation Edition"

VARIANT_ID=workstation

```

As the example above shows, Fedora's os-release file provides the name of the distribution and the version, but it also identifies the installed variant (the "Workstation Edition"). If we ran the same command on Fedora 28 Server Edition, the contents of the os-release file would reflect that on the `VARIANT` and `VARIANT_ID` lines.

Sometimes it is useful to know if a distribution is like another, so the os-release file can contain an `ID_LIKE` line that identifies distributions the running distribution is based on or is similar to. For example, Red Hat Enterprise Linux's os-release file includes an `ID_LIKE` line stating that RHEL is like Fedora, and CentOS's os-release file states that CentOS is like RHEL and Fedora. The `ID_LIKE` line is very helpful if you are working with a distribution that is based on another distribution and need to find instructions to solve a problem.

CentOS's os-release file makes it clear that it is like RHEL, so documentation and questions and answers in various forums about RHEL should (in most cases) apply to CentOS. CentOS is designed to be a near clone of RHEL, so it is more compatible with its `LIKE` than some entries that might be found in the `ID_LIKE` field, but checking for answers about a "like" distribution is always a good idea if you cannot find the information you are seeking for the running distribution.

More information about the os-release file can be found by running `man os-release`.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/linux-version

作者：[Joshua Allen Holm][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/holmja
