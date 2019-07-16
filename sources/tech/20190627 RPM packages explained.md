[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (RPM packages explained)
[#]: via: (https://fedoramagazine.org/rpm-packages-explained/)
[#]: author: (Ankur Sinha "FranciscoD" https://fedoramagazine.org/author/ankursinha/)

RPM packages explained
======

![][1]

Perhaps the best known way the Fedora community pursues its [mission of promoting free and open source software and content][2] is by developing the [Fedora software distribution][3]. So it’s not a surprise at all that a very large proportion of our community resources are spent on this task. This post summarizes how this software is “packaged” and the underlying tools such as _rpm_ that make it all possible.

### RPM: the smallest unit of software

The editions and flavors ([spins][4]/[labs][5]/[silverblue][6]) that users get to choose from are all very similar. They’re all composed of various software that is mixed and matched to work well together. What differs between them is the exact list of tools that goes into each. That choice depends on the use case that they target. The basic unit of all of these is an RPM package file.

RPM files are archives that are similar to ZIP files or tarballs. In fact, they uses compression to reduce the size of the archive. However, along with files, RPM archives also contain metadata about the package. This can be queried using the _rpm_ tool:
```

```

$ rpm -q fpaste
fpaste-0.3.9.2-2.fc30.noarch

$ rpm -qi fpaste
Name        : fpaste
Version     : 0.3.9.2
Release     : 2.fc30
Architecture: noarch
Install Date: Tue 26 Mar 2019 08:49:10 GMT
Group       : Unspecified
Size        : 64144
License     : GPLv3+
Signature   : RSA/SHA256, Thu 07 Feb 2019 15:46:11 GMT, Key ID ef3c111fcfc659b9
Source RPM  : fpaste-0.3.9.2-2.fc30.src.rpm
Build Date  : Thu 31 Jan 2019 20:06:01 GMT
Build Host  : buildhw-07.phx2.fedoraproject.org
Relocations : (not relocatable)
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : <https://pagure.io/fpaste>
Bug URL     : <https://bugz.fedoraproject.org/fpaste>
Summary     : A simple tool for pasting info onto sticky notes instances
Description :
It is often useful to be able to easily paste text to the Fedora
Pastebin at <http://paste.fedoraproject.org> and this simple script
will do that and return the resulting URL so that people may
examine the output. This can hopefully help folks who are for
some reason stuck without X, working remotely, or any other
reason they may be unable to paste something into the pastebin

$ rpm -ql fpaste
/usr/bin/fpaste
/usr/share/doc/fpaste
/usr/share/doc/fpaste/README.rst
/usr/share/doc/fpaste/TODO
/usr/share/licenses/fpaste
/usr/share/licenses/fpaste/COPYING
/usr/share/man/man1/fpaste.1.gz
```

```

When an RPM package is installed, the _rpm_ tools know exactly what files were added to the system. So, removing a package also removes these files, and leaves the system in a consistent state. This is why installing software using _rpm_ is preferred over installing software from source whenever possible.

### Dependencies

Nowadays, it is quite rare for software to be completely self-contained. Even [fpaste][7], a simple one file Python script, requires that the Python interpreter be installed. So, if the system does not have Python installed (highly unlikely, but possible), _fpaste_ cannot be used. In packager jargon, we say that “Python is a **run-time dependency** of _fpaste_“.

When RPM packages are built (the process of building RPMs is not discussed in this post), the generated archive includes all of this metadata. That way, the tools interacting with the RPM package archive know what else must must be installed so that fpaste works correctly:
```

```

$ rpm -q --requires fpaste
/usr/bin/python3
python3
rpmlib(CompressedFileNames) &amp;lt;= 3.0.4-1
rpmlib(FileDigests) &amp;lt;= 4.6.0-1
rpmlib(PayloadFilesHavePrefix) &amp;lt;= 4.0-1
rpmlib(PayloadIsXz) &amp;lt;= 5.2-1

$ rpm -q --provides fpaste
fpaste = 0.3.9.2-2.fc30

$ rpm -qi python3
Name        : python3
Version     : 3.7.3
Release     : 3.fc30
Architecture: x86_64
Install Date: Thu 16 May 2019 18:51:41 BST
Group       : Unspecified
Size        : 46139
License     : Python
Signature   : RSA/SHA256, Sat 11 May 2019 17:02:44 BST, Key ID ef3c111fcfc659b9
Source RPM  : python3-3.7.3-3.fc30.src.rpm
Build Date  : Sat 11 May 2019 01:47:35 BST
Build Host  : buildhw-05.phx2.fedoraproject.org
Relocations : (not relocatable)
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : <https://www.python.org/>
Bug URL     : <https://bugz.fedoraproject.org/python3>
Summary     : Interpreter of the Python programming language
Description :
Python is an accessible, high-level, dynamically typed, interpreted programming
language, designed with an emphasis on code readability.
It includes an extensive standard library, and has a vast ecosystem of
third-party libraries.

The python3 package provides the "python3" executable: the reference
interpreter for the Python language, version 3.
The majority of its standard library is provided in the python3-libs package,
which should be installed automatically along with python3.
The remaining parts of the Python standard library are broken out into the
python3-tkinter and python3-test packages, which may need to be installed
separately.

Documentation for Python is provided in the python3-docs package.

Packages containing additional libraries for Python are generally named with
the "python3-" prefix.

$ rpm -q --provides python3
python(abi) = 3.7
python3 = 3.7.3-3.fc30
python3(x86-64) = 3.7.3-3.fc30
python3.7 = 3.7.3-3.fc30
python37 = 3.7.3-3.fc30
```

```

### Resolving RPM dependencies

While _rpm_ knows the required dependencies for each archive, it does not know where to find them. This is by design: _rpm_ only works on local files and must be told exactly where they are. So, if you try to install a single RPM package, you get an error if _rpm_ cannot find the package’s run-time dependencies. This example tries to install a package downloaded from the Fedora package set:
```

```

$ ls
python3-elephant-0.6.2-3.fc30.noarch.rpm

$ rpm -qpi python3-elephant-0.6.2-3.fc30.noarch.rpm
Name        : python3-elephant
Version     : 0.6.2
Release     : 3.fc30
Architecture: noarch
Install Date: (not installed)
Group       : Unspecified
Size        : 2574456
License     : BSD
Signature   : (none)
Source RPM  : python-elephant-0.6.2-3.fc30.src.rpm
Build Date  : Fri 14 Jun 2019 17:23:48 BST
Build Host  : buildhw-02.phx2.fedoraproject.org
Relocations : (not relocatable)
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : <http://neuralensemble.org/elephant>
Bug URL     : <https://bugz.fedoraproject.org/python-elephant>
Summary     : Elephant is a package for analysis of electrophysiology data in Python
Description :
Elephant - Electrophysiology Analysis Toolkit Elephant is a package for the
analysis of neurophysiology data, based on Neo.

$ rpm -qp --requires python3-elephant-0.6.2-3.fc30.noarch.rpm
python(abi) = 3.7
python3.7dist(neo) &gt;= 0.7.1
python3.7dist(numpy) &gt;= 1.8.2
python3.7dist(quantities) &gt;= 0.10.1
python3.7dist(scipy) &gt;= 0.14.0
python3.7dist(six) &gt;= 1.10.0
rpmlib(CompressedFileNames) &amp;lt;= 3.0.4-1
rpmlib(FileDigests) &amp;lt;= 4.6.0-1
rpmlib(PartialHardlinkSets) &amp;lt;= 4.0.4-1
rpmlib(PayloadFilesHavePrefix) &amp;lt;= 4.0-1
rpmlib(PayloadIsXz) &amp;lt;= 5.2-1

$ sudo rpm -i ./python3-elephant-0.6.2-3.fc30.noarch.rpm
error: Failed dependencies:
        python3.7dist(neo) &gt;= 0.7.1 is needed by python3-elephant-0.6.2-3.fc30.noarch
        python3.7dist(quantities) &gt;= 0.10.1 is needed by python3-elephant-0.6.2-3.fc30.noarch
```

```

In theory, one could download all the packages that are required for _python3-elephant_, and tell _rpm_ where they all are, but that isn’t convenient. What if _python3-neo_ and _python3-quantities_ have other run-time requirements and so on? Very quickly, the **dependency chain** can get quite complicated.

#### Repositories

Luckily, _dnf_ and friends exist to help with this issue. Unlike _rpm_, _dnf_ is aware of **repositories**. Repositories are collections of packages, with metadata that tells _dnf_ what these repositories contain. All Fedora systems come with the default Fedora repositories enabled by default:
```

```

$ sudo dnf repolist
repo id              repo name                             status
fedora               Fedora 30 - x86_64                    56,582
fedora-modular       Fedora Modular 30 - x86_64               135
updates              Fedora 30 - x86_64 - Updates           8,573
updates-modular      Fedora Modular 30 - x86_64 - Updates     138
updates-testing      Fedora 30 - x86_64 - Test Updates      8,458
```

```

There’s more information on [these repositories][8], and how they [can be managed][9] on the Fedora quick docs.

_dnf_ can be used to query repositories for information on the packages they contain. It can also search them for software, or install/uninstall/upgrade packages from them:
```

```

$ sudo dnf search elephant
Last metadata expiration check: 0:05:21 ago on Sun 23 Jun 2019 14:33:38 BST.
============================================================================== Name &amp;amp; Summary Matched: elephant ==============================================================================
python3-elephant.noarch : Elephant is a package for analysis of electrophysiology data in Python
python3-elephant.noarch : Elephant is a package for analysis of electrophysiology data in Python

$ sudo dnf list \\*elephant\\*
Last metadata expiration check: 0:05:26 ago on Sun 23 Jun 2019 14:33:38 BST.
Available Packages
python3-elephant.noarch      0.6.2-3.fc30      updates-testing
python3-elephant.noarch      0.6.2-3.fc30              updates
```

```

#### Installing dependencies

When installing the package using _dnf_ now, it _resolves_ all the required dependencies, then calls _rpm_ to carry out the _transaction_:
```

```

$ sudo dnf install python3-elephant
Last metadata expiration check: 0:06:17 ago on Sun 23 Jun 2019 14:33:38 BST.
Dependencies resolved.
==============================================================================================================================================================================================
 Package                                      Architecture                     Version                                                        Repository                                 Size
==============================================================================================================================================================================================
Installing:
 python3-elephant                             noarch                           0.6.2-3.fc30                                                   updates-testing                           456 k
Installing dependencies:
 python3-neo                                  noarch                           0.8.0-0.1.20190215git49b6041.fc30                              fedora                                    753 k
 python3-quantities                           noarch                           0.12.2-4.fc30                                                  fedora                                    163 k
Installing weak dependencies:
 python3-igor                                 noarch                           0.3-5.20150408git2c2a79d.fc30                                  fedora                                     63 k

Transaction Summary
==============================================================================================================================================================================================
Install  4 Packages

Total download size: 1.4 M
Installed size: 7.0 M
Is this ok [y/N]: y
Downloading Packages:
(1/4): python3-igor-0.3-5.20150408git2c2a79d.fc30.noarch.rpm                                                                                                  222 kB/s |  63 kB     00:00
(2/4): python3-elephant-0.6.2-3.fc30.noarch.rpm                                                                                                               681 kB/s | 456 kB     00:00
(3/4): python3-quantities-0.12.2-4.fc30.noarch.rpm                                                                                                            421 kB/s | 163 kB     00:00
(4/4): python3-neo-0.8.0-0.1.20190215git49b6041.fc30.noarch.rpm                                                                                               840 kB/s | 753 kB     00:00
\----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                         884 kB/s | 1.4 MB     00:01
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                      1/1
  Installing       : python3-quantities-0.12.2-4.fc30.noarch                                                                                                                              1/4
  Installing       : python3-igor-0.3-5.20150408git2c2a79d.fc30.noarch                                                                                                                    2/4
  Installing       : python3-neo-0.8.0-0.1.20190215git49b6041.fc30.noarch                                                                                                                 3/4
  Installing       : python3-elephant-0.6.2-3.fc30.noarch                                                                                                                                 4/4
  Running scriptlet: python3-elephant-0.6.2-3.fc30.noarch                                                                                                                                 4/4
  Verifying        : python3-elephant-0.6.2-3.fc30.noarch                                                                                                                                 1/4
  Verifying        : python3-igor-0.3-5.20150408git2c2a79d.fc30.noarch                                                                                                                    2/4
  Verifying        : python3-neo-0.8.0-0.1.20190215git49b6041.fc30.noarch                                                                                                                 3/4
  Verifying        : python3-quantities-0.12.2-4.fc30.noarch                                                                                                                              4/4

Installed:
  python3-elephant-0.6.2-3.fc30.noarch   python3-igor-0.3-5.20150408git2c2a79d.fc30.noarch   python3-neo-0.8.0-0.1.20190215git49b6041.fc30.noarch   python3-quantities-0.12.2-4.fc30.noarch

Complete!
```

```

Notice how dnf even installed _python3-igor_, which isn’t a direct dependency of _python3-elephant_.

### DnfDragora: a graphical interface to DNF

While technical users may find _dnf_ straightforward to use, it isn’t for everyone. [Dnfdragora][10] addresses this issue by providing a graphical front end to _dnf_.

![dnfdragora \(version 1.1.1-2 on Fedora 30\) listing all the packages installed on a system.][11]

From a quick look, dnfdragora appears to provide all of _dnf_‘s main functions.

There are other tools in Fedora that also manage packages. GNOME Software, and Discover are two examples. GNOME Software is focused on graphical applications only. You can’t use the graphical front end to install command line or terminal tools such as _htop_ or _weechat_. However, GNOME Software does support the installation of [Flatpaks][12] and Snap applications which _dnf_ does not. So, they are different tools with different target audiences, and so provide different functions.

This post only touches the tip of the iceberg that is the life cycle of software in Fedora. This article explained what RPM packages are, and the main differences between using _rpm_ and using _dnf_.

In future posts, we’ll speak more about:

  * The processes that are needed to create these packages
  * How the community tests them to ensure that they are built correctly
  * The infrastructure that the community uses to get them to community users in future posts.



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/rpm-packages-explained/

作者：[Ankur Sinha "FranciscoD"][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ankursinha/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/rpm.png-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/project/#_what_is_fedora_all_about
[3]: https://getfedora.org
[4]: https://spins.fedoraproject.org/
[5]: https://labs.fedoraproject.org/
[6]: https://silverblue.fedoraproject.org/
[7]: https://src.fedoraproject.org/rpms/fpaste
[8]: https://docs.fedoraproject.org/en-US/quick-docs/repositories/
[9]: https://docs.fedoraproject.org/en-US/quick-docs/adding-or-removing-software-repositories-in-fedora/
[10]: https://src.fedoraproject.org/rpms/dnfdragora
[11]: https://fedoramagazine.org/wp-content/uploads/2019/06/dnfdragora-1024x558.png
[12]: https://fedoramagazine.org/getting-started-flatpak/
