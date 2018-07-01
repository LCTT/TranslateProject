我正在运行的 Linux 是什么版本？
=====

> 掌握这些快捷命令以找出你正在运行的 Linux 系统的内核版本和发行版。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC)

“什么版本的 Linux ？”这个问题可能意味着两个不同的东西。严格地说，Linux 是内核，所以问题可以特指内核的版本号，或者 “Linux” 可以更通俗地用来指整个发行版，就像在 Fedora Linux 或 Ubuntu Linux 中一样。

两者都很重要，你可能需要知道其中一个或全部答案来修复系统中的问题。例如，了解已安装的内核版本可能有助于诊断带有专有驱动程序的问题，并且确定正在运行的发行版将帮助你快速确定是否应该使用 `apt`、 `dnf`、 `yum` 或其他命令来安装软件包。

以下内容将帮助你了解 Linux 内核的版本和/或系统上正在运行的 Linux 发行版是什么。

### 如何找到 Linux 内核版本

要找出哪个 Linux 内核版本正在运行，运行以下命令：

```
uname -srm
```

或者，可以使用更长，更具描述性的各种标志的版本来运行该命令：

```
uname --kernel-name --kernel-release --machine
```

无论哪种方式，输出都应该类似于以下内容：

```
Linux 4.16.10-300.fc28.x86_64 x86_64
```

这为你提供了（按顺序）：内核名称、内核版本以及运行内核的硬件类型。在上面的情况下，内核是 Linux ，版本 4.16.10-300.fc28.x86_64 ，运行于 x86_64 系统。

有关 `uname` 命令的更多信息可以通过运行 `man uname` 找到。

### 如何找出 Linux 发行版

有几种方法可以确定系统上运行的是哪个发行版，但最快的方法是检查 `/etc/os-release` 文件的内容。此文件提供有关发行版的信息，包括但不限于发行版名称及其版本号。某些发行版的 `os-release` 文件包含比其他发行版更多的细节，但任何包含 `os-release` 文件的发行版都应该提供发行版的名称和版本。

要查看 `os-release` 文件的内容，运行以下命令：

```
cat /etc/os-release
```

在 Fedora 28 中，输出如下所示：

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

如上面那个例子展示的那样，Fedora 的 `os-release` 文件提供了发行版的名称和版本，但它也标识这个安装的变体（“Workstation Edition”）。如果我们在 Fedora 28 服务器版本上运行相同的命令，`os-release` 文件的内容会反映在 `VARIANT` 和 `VARIANT_ID` 行中。

有时候知道一个发行版是否与另一个发行版相似非常有用，因此 `os-release` 文件可以包含一个 `ID_LIKE` 行，用于标识正在运行的是基于什么的发行版或类似的发行版。例如，Red Hat Linux 企业版的 `os-release` 文件包含 `ID_LIKE` 行，声明 RHEL 与 Fedora 类似；CentOS 的 `os-release` 文件声明 CentOS 与 RHEL 和 Fedora 类似。如果你正在使用基于另一个发行版的发行版并需要查找解决问题的说明，那么 `ID_LIKE` 行非常有用。

CentOS 的 `os-release` 文件清楚地表明它就像 RHEL 一样，所以在各种论坛中关于 RHEL 的文档，问题和答案应该（大多数情况下）适用于 CentOS。CentOS 被设计成一个 RHEL 近亲，因此在某些字段它更兼容其 `ID_LIKE` 系统的字段。如果你找不到正在运行的发行版的信息，检查有关 “类似” 发行版的答案总是一个好主意。

有关 `os-release` 文件的更多信息可以通过运行 `man os-release` 命令来查找。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/linux-version

作者：[Joshua Allen Holm][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/holmja
