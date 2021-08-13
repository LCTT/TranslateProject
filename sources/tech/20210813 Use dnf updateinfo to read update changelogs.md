[#]: subject: "Use dnf updateinfo to read update changelogs"
[#]: via: "https://fedoramagazine.org/use-dnf-updateinfo-to-read-update-changelogs/"
[#]: author: "Mateus Rodrigues Costa https://fedoramagazine.org/author/mateusrodcosta/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use dnf updateinfo to read update changelogs
======

![][1]

Cover image background excerpted from photo by [Fotis Fotopoulos][2] on [Unsplash][3]

This article will explore how to check the changelogs for the Fedora Linux operating system using the command line and _dnf updateinfo_. Instead of showing the commands running on a real Fedora Linux install, this article will demo running the dnf commands in [toolbox][4].

### Introduction

If you have used any type of computer recently (be it a desktop, laptop or even a smartphone), you most likely have had to deal with software updates. You might have an opinion about them. They might be a “necessary evil”, something that always breaks your setup and makes you waste hours fixing the new problems that appeared, or you might even like them.

No matter your opinion, there are reasons to update your software: mainly bug fixes, especially security-related bug fixes. After all, you most likely don’t want someone getting your private data by exploiting a bug that happens because of a interaction between the code of your web browser and the code that renders text on your screen.

If you manage your software updates in a manual or semi-manual fashion (in comparison to letting the operating system auto-update your software), one feature you should be aware of is “changelogs”.

A changelog is, as the name hints, a big list of changes between two releases of the same software. The changelog content can vary a lot. It may depend on the team, the type of software, its importance, and the number of changes. It can range from a very simple “several small bugs were fixed in this release”-type message, to a list of links to the bugs fixed on a issue tracker with a small description, to a big and detailed list of changes or elaborate blog posts.

Now, how do you check the changelogs for the updates?

If you use Fedora Workstation the easy way to see the changelog with a GUI is with Gnome Software. Select the name of the package or name of the software on the updates page and the changelog is displayed. You could also try your favorite GUI package manager, which will most likely show it to you as well. But how does one do the same thing via CLI?

### How to use dnf updateinfo

Start by creating a Fedora 34 toolbox called _updateinfo-demo_:

```
toolbox create --distro fedora --release f34 updateinfo-demo
```

Now, enter the toolbox:

```
toolbox enter updateinfo-demo
```

The commands from here on can also be used on a normal Fedora install.

First, check the updates available:

```
$ dnf check-update
audit-libs.x86_64                   3.0.3-1.fc34              updates
ca-certificates.noarch              2021.2.50-1.0.fc34        updates
coreutils.x86_64                    8.32-30.fc34              updates
coreutils-common.x86_64             8.32-30.fc34              updates
curl.x86_64                         7.76.1-7.fc34             updates
dnf.noarch                          4.8.0-1.fc34              updates
dnf-data.noarch                     4.8.0-1.fc34              updates
expat.x86_64                        2.4.1-1.fc34              updates
file-libs.x86_64                    5.39-6.fc34               updates
glibc.x86_64                        2.33-20.fc34              updates
glibc-common.x86_64                 2.33-20.fc34              updates
glibc-minimal-langpack.x86_64       2.33-20.fc34              updates
krb5-libs.x86_64                    1.19.1-14.fc34            updates
libcomps.x86_64                     0.1.17-1.fc34             updates
libcurl.x86_64                      7.76.1-7.fc34             updates
libdnf.x86_64                       0.63.1-1.fc34             updates
libeconf.x86_64                     0.4.0-1.fc34              updates
libedit.x86_64                      3.1-38.20210714cvs.fc34   updates
libgcrypt.x86_64                    1.9.3-3.fc34              updates
libidn2.x86_64                      2.3.2-1.fc34              updates
libmodulemd.x86_64                  2.13.0-1.fc34             updates
librepo.x86_64                      1.14.1-1.fc34             updates
libsss_idmap.x86_64                 2.5.2-1.fc34              updates
libsss_nss_idmap.x86_64             2.5.2-1.fc34              updates
libuser.x86_64                      0.63-4.fc34               updates
libxcrypt.x86_64                    4.4.23-1.fc34             updates
nano.x86_64                         5.8-3.fc34                updates
nano-default-editor.noarch          5.8-3.fc34                updates
nettle.x86_64                       3.7.3-1.fc34              updates
openldap.x86_64                     2.4.57-5.fc34             updates
pam.x86_64                          1.5.1-6.fc34              updates
python-setuptools-wheel.noarch      53.0.0-2.fc34             updates
python-unversioned-command.noarch   3.9.6-2.fc34              updates
python3.x86_64                      3.9.6-2.fc34              updates
python3-dnf.noarch                  4.8.0-1.fc34              updates
python3-hawkey.x86_64               0.63.1-1.fc34             updates
python3-libcomps.x86_64             0.1.17-1.fc34             updates
python3-libdnf.x86_64               0.63.1-1.fc34             updates
python3-libs.x86_64                 3.9.6-2.fc34              updates
python3-setuptools.noarch           53.0.0-2.fc34             updates
sssd-client.x86_64                  2.5.2-1.fc34              updates
systemd.x86_64                      248.6-1.fc34              updates
systemd-libs.x86_64                 248.6-1.fc34              updates
systemd-networkd.x86_64             248.6-1.fc34              updates
systemd-pam.x86_64                  248.6-1.fc34              updates
systemd-rpm-macros.noarch           248.6-1.fc34              updates
vim-minimal.x86_64                  2:8.2.3182-1.fc34         updates
xkeyboard-config.noarch             2.33-1.fc34               updates
yum.noarch                          4.8.0-1.fc34              updates
```

OK, so run your first _dnf updateinfo_ command:

```
$ dnf updateinfo
Updates Information Summary: available
     5 Security notice(s)
         4 Moderate Security notice(s)
         1 Low Security notice(s)
    11 Bugfix notice(s)
     8 Enhancement notice(s)
     3 other notice(s)
```

This is the summary of updates. As you can see there are security updates, bugfix updates, enhancement updates and some which are not specified.

Look at the list of updates and which types they belong to:

```
$ dnf updateinfo list
FEDORA-2021-e4866762d8 enhancement   audit-libs-3.0.3-1.fc34.x86_64
FEDORA-2021-1f32e18471 bugfix        ca-certificates-2021.2.50-1.0.fc34.noarch
FEDORA-2021-b09e010a46 bugfix        coreutils-8.32-30.fc34.x86_64
FEDORA-2021-b09e010a46 bugfix        coreutils-common-8.32-30.fc34.x86_64
FEDORA-2021-83fdddca0f Moderate/Sec. curl-7.76.1-7.fc34.x86_64
FEDORA-2021-3b74285c43 bugfix        dnf-4.8.0-1.fc34.noarch
FEDORA-2021-3b74285c43 bugfix        dnf-data-4.8.0-1.fc34.noarch
FEDORA-2021-523ee0a81e enhancement   expat-2.4.1-1.fc34.x86_64
FEDORA-2021-07625b9c81 unknown       file-libs-5.39-6.fc34.x86_64
FEDORA-2021-e14e86e40e Moderate/Sec. glibc-2.33-20.fc34.x86_64
FEDORA-2021-e14e86e40e Moderate/Sec. glibc-common-2.33-20.fc34.x86_64
FEDORA-2021-e14e86e40e Moderate/Sec. glibc-minimal-langpack-2.33-20.fc34.x86_64
FEDORA-2021-8b25e4642f Low/Sec.      krb5-libs-1.19.1-14.fc34.x86_64
FEDORA-2021-3b74285c43 bugfix        libcomps-0.1.17-1.fc34.x86_64
FEDORA-2021-83fdddca0f Moderate/Sec. libcurl-7.76.1-7.fc34.x86_64
FEDORA-2021-3b74285c43 bugfix        libdnf-0.63.1-1.fc34.x86_64
FEDORA-2021-ca22b882a5 enhancement   libeconf-0.4.0-1.fc34.x86_64
FEDORA-2021-f9c139edd8 bugfix        libedit-3.1-38.20210714cvs.fc34.x86_64
FEDORA-2021-31fdc84207 Moderate/Sec. libgcrypt-1.9.3-3.fc34.x86_64
FEDORA-2021-bc56cf7c1f enhancement   libidn2-2.3.2-1.fc34.x86_64
FEDORA-2021-da2ec14d7f bugfix        libmodulemd-2.13.0-1.fc34.x86_64
FEDORA-2021-3b74285c43 bugfix        librepo-1.14.1-1.fc34.x86_64
FEDORA-2021-1db6330a22 unknown       libsss_idmap-2.5.2-1.fc34.x86_64
FEDORA-2021-1db6330a22 unknown       libsss_nss_idmap-2.5.2-1.fc34.x86_64
FEDORA-2021-8226c82fe9 bugfix        libuser-0.63-4.fc34.x86_64
FEDORA-2021-e6916d6758 bugfix        libxcrypt-4.4.22-2.fc34.x86_64
FEDORA-2021-fed4036fd9 bugfix        libxcrypt-4.4.23-1.fc34.x86_64
FEDORA-2021-3122d2b8d2 unknown       nano-5.8-3.fc34.x86_64
FEDORA-2021-3122d2b8d2 unknown       nano-default-editor-5.8-3.fc34.noarch
FEDORA-2021-d1fc0b9d32 Moderate/Sec. nettle-3.7.3-1.fc34.x86_64
FEDORA-2021-97949d7a4e bugfix        openldap-2.4.57-5.fc34.x86_64
FEDORA-2021-e6916d6758 bugfix        pam-1.5.1-6.fc34.x86_64
FEDORA-2021-07931f7f08 bugfix        python-setuptools-wheel-53.0.0-2.fc34.noarch
FEDORA-2021-2056ce89d9 enhancement   python-unversioned-command-3.9.6-1.fc34.noarch
FEDORA-2021-d613e00b72 enhancement   python-unversioned-command-3.9.6-2.fc34.noarch
FEDORA-2021-2056ce89d9 enhancement   python3-3.9.6-1.fc34.x86_64
FEDORA-2021-d613e00b72 enhancement   python3-3.9.6-2.fc34.x86_64
FEDORA-2021-3b74285c43 bugfix        python3-dnf-4.8.0-1.fc34.noarch
FEDORA-2021-3b74285c43 bugfix        python3-hawkey-0.63.1-1.fc34.x86_64
FEDORA-2021-3b74285c43 bugfix        python3-libcomps-0.1.17-1.fc34.x86_64
FEDORA-2021-3b74285c43 bugfix        python3-libdnf-0.63.1-1.fc34.x86_64
FEDORA-2021-2056ce89d9 enhancement   python3-libs-3.9.6-1.fc34.x86_64
FEDORA-2021-d613e00b72 enhancement   python3-libs-3.9.6-2.fc34.x86_64
FEDORA-2021-07931f7f08 bugfix        python3-setuptools-53.0.0-2.fc34.noarch
FEDORA-2021-1db6330a22 unknown       sssd-client-2.5.2-1.fc34.x86_64
FEDORA-2021-3141f0eff1 bugfix        systemd-248.6-1.fc34.x86_64
FEDORA-2021-3141f0eff1 bugfix        systemd-libs-248.6-1.fc34.x86_64
FEDORA-2021-3141f0eff1 bugfix        systemd-networkd-248.6-1.fc34.x86_64
FEDORA-2021-3141f0eff1 bugfix        systemd-pam-248.6-1.fc34.x86_64
FEDORA-2021-3141f0eff1 bugfix        systemd-rpm-macros-248.6-1.fc34.noarch
FEDORA-2021-b8b1f6e54f enhancement   vim-minimal-2:8.2.3182-1.fc34.x86_64
FEDORA-2021-67645ae09f enhancement   xkeyboard-config-2.33-1.fc34.noarch
FEDORA-2021-3b74285c43 bugfix        yum-4.8.0-1.fc34.noarch
```

The output is in three columns. These show the ID for an update, the type of the update, and the package to which it refers.

If you want to see the Bodhi page for a specific update, just add the id to the end of this URL:
<https://bodhi.fedoraproject.org/updates/>.

For example, <https://bodhi.fedoraproject.org/updates/FEDORA-2021-3141f0eff1> for _systemd-248.6-1.fc34.x86_64_ or <https://bodhi.fedoraproject.org/updates/FEDORA-2021-b09e010a46> for _coreutils-8.32-30.fc34.x86_64_.

The next command will list the actual changelog.

```
dnf updateinfo info
```

The output from this command is quite long. So only a few interesting excerpts are provided below.

Start with a small one:

```
===============================================================================
  ca-certificates-2021.2.50-1.0.fc34
===============================================================================
  Update ID: FEDORA-2021-1f32e18471
       Type: bugfix
    Updated: 2021-06-18 22:08:02
Description: Update the ca-certificates list to the lastest upstream list.
   Severity: Low
```

Notice how this info has the update ID, type, updated time, description and severity. Very simple and easy to understand.

Now look at the _systemd_ update which, in addition to the previous items, has some bugs associated with it in Red Hat Bugzilla, a more elaborate description, and a different severity.

```
===============================================================================
  systemd-248.6-1.fc34
===============================================================================
  Update ID: FEDORA-2021-3141f0eff1
       Type: bugfix
    Updated: 2021-07-24 22:00:30
       Bugs: 1963428 - if keyfile >= 1024*4096-1 service "systemd-cryptsetup@<partition name>" can't start
           : 1965815 - 50-udev-default.rules references group "sgx" which does not exist
           : 1975564 - systemd-cryptenroll SIGABRT when adding recovery key - buffer overflow
           : 1984651 - systemd[1]: Assertion 'a <= b' failed at src/libsystemd/sd-event/sd-event.c:2903, function sleep_between(). Aborting.
Description: - Create 'sgx' group (and also use soft-static uids for input and render, see https://pagure.io/setup/c/df3194a7295c2ca3cfa923981b046f4bd2754825 and https://pagure.io/packaging-committee/issue/1078 (#1965815)
           : - Various bugfixes (#1963428, #1975564)
           : - Fix for a regression introduced in the previous release with sd-event abort (#1984651)
           :
           : No need to log out or reboot.
   Severity: Moderate
```

Next look at a _curl_ update. This has a security update with several [CVE][5]s associated with it. Each CVE has its respective Red Hat Bugzilla bug.

```
===============================================================================
  curl-7.76.1-7.fc34
===============================================================================
  Update ID: FEDORA-2021-83fdddca0f
       Type: security
    Updated: 2021-07-22 22:03:07
       Bugs: 1984325 - CVE-2021-22922 curl: wrong content via metalink is not being discarded [fedora-all]
           : 1984326 - CVE-2021-22923 curl: Metalink download sends credentials [fedora-all]
           : 1984327 - CVE-2021-22924 curl: bad connection reuse due to flawed path name checks [fedora-all]
           : 1984328 - CVE-2021-22925 curl: Incorrect fix for CVE-2021-22898 TELNET stack contents disclosure [fedora-all]
Description: - fix TELNET stack contents disclosure again (CVE-2021-22925)
           : - fix bad connection reuse due to flawed path name checks (CVE-2021-22924)
           : - disable metalink support to fix the following vulnerabilities
           :     CVE-2021-22923 - metalink download sends credentials
           :     CVE-2021-22922 - wrong content via metalink not discarded
   Severity: Moderate
```

This item shows a simple enhancement update.

```
===============================================================================
  python3-docs-3.9.6-1.fc34 python3.9-3.9.6-1.fc34
===============================================================================
  Update ID: FEDORA-2021-2056ce89d9
       Type: enhancement
    Updated: 2021-07-08 22:00:53
Description: Update of Python 3.9 and python3-docs to latest release 3.9.6
   Severity: None
```

Finally an “unknown” type update.

```
===============================================================================
  file-5.39-6.fc34
===============================================================================
  Update ID: FEDORA-2021-07625b9c81
       Type: unknown
    Updated: 2021-06-11 22:16:57
       Bugs: 1963895 - Wrong detection of python bytecode mimetypes
Description: do not classify python bytecode files as text (#1963895)
   Severity: None
```

### Conclusion

So, in what situation does dnf updateinfo become handy?

Well, you could use it if you prefer managing updates fully via the CLI, or if you are unable to successfully use the GUI tools at a specific moment.

In which case is checking the changelog useful?

Say you manage the updates yourself, sometimes you might not consider it ideal to stop what you are doing to update your system. Instead of simply installing the updates, you check the changelogs. This allows you to figure out whether you should prioritize your updates (maybe there’s a important security fix?) or whether to postpone a bit longer (no important fix, “I will do it later when I’m not doing anything important”).

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-dnf-updateinfo-to-read-update-changelogs/

作者：[Mateus Rodrigues Costa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mateusrodcosta/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/08/dnf-updateinfo-816x345.jpg
[2]: https://unsplash.com/@ffstop?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/a-quick-introduction-to-toolbox-on-fedora/
[5]: https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures
