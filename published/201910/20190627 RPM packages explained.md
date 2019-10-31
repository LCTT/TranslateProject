[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11452-1.html)
[#]: subject: (RPM packages explained)
[#]: via: (https://fedoramagazine.org/rpm-packages-explained/)
[#]: author: (Ankur Sinha "FranciscoD" https://fedoramagazine.org/author/ankursinha/)

RPM 包初窥
======

![][1]

也许，Fedora 社区追求其[促进自由和开源的软件及内容的使命][2]的最著名的方式就是开发 [Fedora 软件发行版][3]了。因此，我们将很大一部分的社区资源用于此任务也就不足为奇了。这篇文章总结了这些软件是如何“打包”的，以及使之成为可能的基础工具，如 `rpm` 之类。

### RPM：最小的软件单元

可供用户选择的“版本”和“风味版”（[spins][4] / [labs][5] / [silverblue][6]）其实非常相似。它们都是由各种软件组成的，这些软件经过混合和搭配，可以很好地协同工作。它们之间的不同之处在于放入其中的具体工具不同。这种选择取决于它们所针对的用例。所有这些的“版本”和“风味版”基本组成单位都是 RPM 软件包文件。

RPM 文件是类似于 ZIP 文件或 tarball 的存档文件。实际上，它们使用了压缩来减小存档文件的大小。但是，除了文件之外，RPM 存档中还包含有关软件包的元数据。可以使用 `rpm` 工具查询：

```
$ rpm -q fpaste
fpaste-0.3.9.2-2.fc30.noarch

$ rpm -qi fpaste
Name        : fpaste
Version     : 0.3.9.2
Release     : 2.fc30
Architecture: noarch
Install Date: Tue 26 Mar 2019 08:49:10 GMT
Group       : Unspecified
Size        : 64144
License     : GPLv3+
Signature   : RSA/SHA256, Thu 07 Feb 2019 15:46:11 GMT, Key ID ef3c111fcfc659b9
Source RPM  : fpaste-0.3.9.2-2.fc30.src.rpm
Build Date  : Thu 31 Jan 2019 20:06:01 GMT
Build Host  : buildhw-07.phx2.fedoraproject.org
Relocations : (not relocatable)
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : https://pagure.io/fpaste
Bug URL     : https://bugz.fedoraproject.org/fpaste
Summary     : A simple tool for pasting info onto sticky notes instances
Description :
It is often useful to be able to easily paste text to the Fedora
Pastebin at http://paste.fedoraproject.org and this simple script
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

安装 RPM 软件包后，`rpm` 工具可以知道具体哪些文件被添加到了系统中。因此，删除该软件包也会删除这些文件，并使系统保持一致状态。这就是为什么要尽可能地使用 `rpm` 安装软件，而不是从源代码安装软件的原因。

### 依赖关系

如今，完全独立的软件已经非常罕见。甚至 [fpaste][7]，连这样一个简单的单个文件的 Python 脚本，都需要安装 Python 解释器。因此，如果系统未安装 Python（几乎不可能，但有可能），则无法使用 `fpaste`。用打包者的术语来说，“Python 是 `fpaste` 的**运行时依赖项**。”

构建 RPM 软件包时（本文不讨论构建 RPM 的过程），生成的归档文件中包括了所有这些元数据。这样，与 RPM 软件包归档文件交互的工具就知道必须要安装其它的什么东西，以便 `fpaste` 可以正常工作：

```
$ rpm -q --requires fpaste
/usr/bin/python3
python3
rpmlib(CompressedFileNames) &lt;= 3.0.4-1
rpmlib(FileDigests) &lt;= 4.6.0-1
rpmlib(PayloadFilesHavePrefix) &lt;= 4.0-1
rpmlib(PayloadIsXz) &lt;= 5.2-1

$ rpm -q --provides fpaste
fpaste = 0.3.9.2-2.fc30

$ rpm -qi python3
Name        : python3
Version     : 3.7.3
Release     : 3.fc30
Architecture: x86_64
Install Date: Thu 16 May 2019 18:51:41 BST
Group       : Unspecified
Size        : 46139
License     : Python
Signature   : RSA/SHA256, Sat 11 May 2019 17:02:44 BST, Key ID ef3c111fcfc659b9
Source RPM  : python3-3.7.3-3.fc30.src.rpm
Build Date  : Sat 11 May 2019 01:47:35 BST
Build Host  : buildhw-05.phx2.fedoraproject.org
Relocations : (not relocatable)
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : https://www.python.org/
Bug URL     : https://bugz.fedoraproject.org/python3
Summary     : Interpreter of the Python programming language
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

### 解决 RPM 依赖关系

虽然 `rpm` 知道每个归档文件所需的依赖关系，但不知道在哪里找到它们。这是设计使然：`rpm` 仅适用于本地文件，必须具体告知它们的位置。因此，如果你尝试安装单个 RPM 软件包，则 `rpm` 找不到该软件包的运行时依赖项时就会出错。本示例尝试安装从 Fedora 软件包集中下载的软件包：

```
$ ls
python3-elephant-0.6.2-3.fc30.noarch.rpm

$ rpm -qpi python3-elephant-0.6.2-3.fc30.noarch.rpm
Name        : python3-elephant
Version     : 0.6.2
Release     : 3.fc30
Architecture: noarch
Install Date: (not installed)
Group       : Unspecified
Size        : 2574456
License     : BSD
Signature   : (none)
Source RPM  : python-elephant-0.6.2-3.fc30.src.rpm
Build Date  : Fri 14 Jun 2019 17:23:48 BST
Build Host  : buildhw-02.phx2.fedoraproject.org
Relocations : (not relocatable)
Packager    : Fedora Project
Vendor      : Fedora Project
URL         : http://neuralensemble.org/elephant
Bug URL     : https://bugz.fedoraproject.org/python-elephant
Summary     : Elephant is a package for analysis of electrophysiology data in Python
Description :
Elephant - Electrophysiology Analysis Toolkit Elephant is a package for the
analysis of neurophysiology data, based on Neo.

$ rpm -qp --requires python3-elephant-0.6.2-3.fc30.noarch.rpm
python(abi) = 3.7
python3.7dist(neo) >= 0.7.1
python3.7dist(numpy) >= 1.8.2
python3.7dist(quantities) >= 0.10.1
python3.7dist(scipy) >= 0.14.0
python3.7dist(six) >= 1.10.0
rpmlib(CompressedFileNames) &lt;= 3.0.4-1
rpmlib(FileDigests) &lt;= 4.6.0-1
rpmlib(PartialHardlinkSets) &lt;= 4.0.4-1
rpmlib(PayloadFilesHavePrefix) &lt;= 4.0-1
rpmlib(PayloadIsXz) &lt;= 5.2-1

$ sudo rpm -i ./python3-elephant-0.6.2-3.fc30.noarch.rpm
error: Failed dependencies:
        python3.7dist(neo) >= 0.7.1 is needed by python3-elephant-0.6.2-3.fc30.noarch
        python3.7dist(quantities) >= 0.10.1 is needed by python3-elephant-0.6.2-3.fc30.noarch
```

理论上，你可以下载 `python3-elephant` 所需的所有软件包，并告诉 `rpm` 它们都在哪里，但这并不方便。如果 `python3-neo` 和 `python3-quantities` 还有其它的运行时要求怎么办？很快，这种“依赖链”就会变得相当复杂。

#### 存储库

幸运的是，有了 `dnf` 和它的朋友们，可以帮助解决此问题。与 `rpm` 不同，`dnf` 能感知到**存储库**。存储库是程序包的集合，带有告诉 `dnf` 这些存储库包含什么内容的元数据。所有 Fedora 系统都带有默认启用的默认 Fedora 存储库：

```
$ sudo dnf repolist
repo id              repo name                             status
fedora               Fedora 30 - x86_64                    56,582
fedora-modular       Fedora Modular 30 - x86_64               135
updates              Fedora 30 - x86_64 - Updates           8,573
updates-modular      Fedora Modular 30 - x86_64 - Updates     138
updates-testing      Fedora 30 - x86_64 - Test Updates      8,458
```

在 Fedora 快速文档中有[这些存储库][8]以及[如何管理][9]它们的更多信息。

`dnf` 可用于查询存储库以获取有关它们包含的软件包信息。它还可以在这些存储库中搜索软件，或从中安装/卸载/升级软件包：

```
$ sudo dnf search elephant
Last metadata expiration check: 0:05:21 ago on Sun 23 Jun 2019 14:33:38 BST.
============================================================================== Name &amp; Summary Matched: elephant ==============================================================================
python3-elephant.noarch : Elephant is a package for analysis of electrophysiology data in Python
python3-elephant.noarch : Elephant is a package for analysis of electrophysiology data in Python

$ sudo dnf list \*elephant\*
Last metadata expiration check: 0:05:26 ago on Sun 23 Jun 2019 14:33:38 BST.
Available Packages
python3-elephant.noarch      0.6.2-3.fc30      updates-testing
python3-elephant.noarch      0.6.2-3.fc30              updates
```

#### 安装依赖项

现在使用 `dnf` 安装软件包时，它将*解决*所有必需的依赖项，然后调用 `rpm` 执行该事务操作：

```
$ sudo dnf install python3-elephant
Last metadata expiration check: 0:06:17 ago on Sun 23 Jun 2019 14:33:38 BST.
Dependencies resolved.
==============================================================================================================================================================================================
 Package                                      Architecture                     Version                                                        Repository                                 Size
==============================================================================================================================================================================================
Installing:
 python3-elephant                             noarch                           0.6.2-3.fc30                                                   updates-testing                           456 k
Installing dependencies:
 python3-neo                                  noarch                           0.8.0-0.1.20190215git49b6041.fc30                              fedora                                    753 k
 python3-quantities                           noarch                           0.12.2-4.fc30                                                  fedora                                    163 k
Installing weak dependencies:
 python3-igor                                 noarch                           0.3-5.20150408git2c2a79d.fc30                                  fedora                                     63 k

Transaction Summary
==============================================================================================================================================================================================
Install  4 Packages

Total download size: 1.4 M
Installed size: 7.0 M
Is this ok [y/N]: y
Downloading Packages:
(1/4): python3-igor-0.3-5.20150408git2c2a79d.fc30.noarch.rpm                                                                                                  222 kB/s |  63 kB     00:00
(2/4): python3-elephant-0.6.2-3.fc30.noarch.rpm                                                                                                               681 kB/s | 456 kB     00:00
(3/4): python3-quantities-0.12.2-4.fc30.noarch.rpm                                                                                                            421 kB/s | 163 kB     00:00
(4/4): python3-neo-0.8.0-0.1.20190215git49b6041.fc30.noarch.rpm                                                                                               840 kB/s | 753 kB     00:00
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                         884 kB/s | 1.4 MB     00:01
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                      1/1
  Installing       : python3-quantities-0.12.2-4.fc30.noarch                                                                                                                              1/4
  Installing       : python3-igor-0.3-5.20150408git2c2a79d.fc30.noarch                                                                                                                    2/4
  Installing       : python3-neo-0.8.0-0.1.20190215git49b6041.fc30.noarch                                                                                                                 3/4
  Installing       : python3-elephant-0.6.2-3.fc30.noarch                                                                                                                                 4/4
  Running scriptlet: python3-elephant-0.6.2-3.fc30.noarch                                                                                                                                 4/4
  Verifying        : python3-elephant-0.6.2-3.fc30.noarch                                                                                                                                 1/4
  Verifying        : python3-igor-0.3-5.20150408git2c2a79d.fc30.noarch                                                                                                                    2/4
  Verifying        : python3-neo-0.8.0-0.1.20190215git49b6041.fc30.noarch                                                                                                                 3/4
  Verifying        : python3-quantities-0.12.2-4.fc30.noarch                                                                                                                              4/4

Installed:
  python3-elephant-0.6.2-3.fc30.noarch   python3-igor-0.3-5.20150408git2c2a79d.fc30.noarch   python3-neo-0.8.0-0.1.20190215git49b6041.fc30.noarch   python3-quantities-0.12.2-4.fc30.noarch

Complete!
```

请注意，`dnf` 甚至还安装了`python3-igor`，而它不是 `python3-elephant` 的直接依赖项。

### DnfDragora：DNF 的一个图形界面

尽管技术用户可能会发现 `dnf` 易于使用，但并非所有人都这样认为。[Dnfdragora][10] 通过为 `dnf` 提供图形化前端来解决此问题。

![dnfdragora (version 1.1.1-2 on Fedora 30) listing all the packages installed on a system.][11]

从上面可以看到，dnfdragora 似乎提供了 `dnf` 的所有主要功能。

Fedora 中还有其他工具也可以管理软件包，GNOME 的“<ruby>软件<rt>Software</rt></ruby>”和“<ruby>发现<rt>Discover</rt></ruby>”就是其中两个。GNOME “软件”仅专注于图形应用程序。你无法使用这个图形化前端来安装命令行或终端工具，例如 `htop` 或 `weechat`。但是，GNOME “软件”支持安装 `dnf` 所不支持的 [Flatpak][12] 和 Snap 应用程序。它们是针对不同目标受众的不同工具，因此提供了不同的功能。

这篇文章仅触及到了 Fedora 软件的生命周期的冰山一角。本文介绍了什么是 RPM 软件包，以及使用 `rpm` 和 `dnf` 的主要区别。

在以后的文章中，我们将详细介绍：

* 创建这些程序包所需的过程
* 社区如何测试它们以确保它们正确构建
* 社区用来将其给到社区用户的基础设施

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/rpm-packages-explained/

作者：[Ankur Sinha "FranciscoD"][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

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
