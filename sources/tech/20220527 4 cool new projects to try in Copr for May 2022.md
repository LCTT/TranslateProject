[#]: subject: "4 cool new projects to try in Copr for May 2022"
[#]: via: "https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-may-2022/"
[#]: author: "Miroslav Suchý https://fedoramagazine.org/author/msuchy/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 cool new projects to try in Copr for May 2022
======

![4 packages to try from the Copr repos][1]

[Copr][2] is a build system for anyone in the Fedora community. It hosts thousands of projects for various purposes and audiences. Some of them should never be installed by anyone, some are already being transitioned to the official Fedora Linux repositories, and the rest are somewhere in between. Copr gives you the opportunity to install third-party software that is not available in Fedora Linux repositories, try nightly versions of your dependencies, use patched builds of your favorite tools to support some non-standard use cases, and just experiment freely.

If you don’t know [how to enable a repository][3] or if you are concerned about whether [it is safe to use Copr][4], please consult the [project documentation][5].

This article takes a closer look at interesting projects that recently landed in Copr.

### Python-QT6

Do you miss QT6 Python bindings for Fedora Linux? Here they are. [https://copr.fedorainfracloud.org/coprs/g/kdesig/python-qt6/][6]

KDE SIG owns this project. Therefore, it should be a quality one. And one day, it may land in Fedora Linux.

Example of usage:

```
$ python 
 Python 3.10.4 (main, Mar 25 2022, 00:00:00) [GCC 12.0.1 20220308 (Red Hat 12.0.1-0)] on linux
 Type "help", "copyright", "credits" or "license" for more information.
 >>> import PyQt6
 >>> from PyQt6.QtWidgets import QApplication, QWidget
 >>> import sys
 >>> app = QApplication(sys.argv)
 >>> window = QWidget()
 >>> window.show()
 >>> app.exec()
 0
```

More documentation can be found at

[https://www.pythonguis.com/tutorials/pyqt6-creating-your-first-window/][7].

**Installation instructions**

This package is available for Fedora Linux 36 and Rawhide. To install it, enter these commands:

```
sudo dnf copr enable @kdesig/python-qt6
sudo dnf install python3-qt6
```

### Cloud-Native Utilities

[A collection of cloud-native development tools][8].

These packages do not follow Fedora packaging guidelines, are statically built, and opt to bundle all dependencies.

**Currently available packages**:

* Terraform – terraform
* Packer – packer
* Helm – helm
* Tekton CLI – tektoncd-cli tektoncd-cli-doc
* Knative CLI – knative-client knative-client-doc
* Buildpack CLI – pack

All build recipes can be viewed in dist-git or from Pagure:[https://pagure.io/mroche/cloud-utilities][9]

**Installation instructions**

These packages are available for Fedora 36 Linux and Rawhide. To install them, enter this command:

```
sudo dnf copr enable mroche/cloud-native-utilities
```

### DNF 5

You may be aware the DNF team is working on DNF5. There is a [change proposal][10] for Fedora Linux 38. The benefit is that every package management software — including PackageKit, and DNFDragora — should use a common *libdnf* library. If you have an application that handles RPM packages, you should definitely check out this project.

[https://copr.fedorainfracloud.org/coprs][11][/][12][rpmsoftwaremanagement/dnf5-unstable/][13]

Another similar project from the DNF team is

[https://copr.fedorainfracloud.org/coprs/jmracek/dnf5-alternatives/][14].

**Installation instructions**

These packages are available for Fedora Linux 35, 36 and Rawhide. To install them, enter these commands:

```
sudo dnf copr enable  rpmsoftwaremanagement/dnf5-unstable
sudo dnf install dnf5
sudo dnf copr enable jmracek/dnf5-alternatives
sudo dnf install microdnf-deprecated
```

### Hare

[Hare][15] is a systems programming language designed to be simple, stable and robust. Hare uses a static type system, manual memory management, and a minimal runtime. It is well suited to writing operating systems, system tools, compilers, networking software, and other low-level, high-performance tasks. A detailed overview can be found in [these slides][16].

My summary is: Hare is simpler than C. It can be easy. But if you insist on shooting in your legs, Hare will allow you to do it.

[Copr project][17].

**Installation Instructions**

These packages are available for Fedora Linux 35, 36 and Rawhide. They are also available for OpenSUSE Leap and Tumbleweed. To install them, enter these commands:

```
sudo dnf copr enable sentry/qbe
sudo dnf copr enable sentry/hare
sudo dnf install hare harec qbe
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-may-2022/

作者：[Miroslav Suchý][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/msuchy/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/how_to_enable_repo.html#how-to-enable-repo
[4]: https://docs.pagure.org/copr.copr/user_documentation.html#is-it-safe-to-use-copr
[5]: https://docs.pagure.org/copr.copr/user_documentation.html
[6]: https://copr.fedorainfracloud.org/coprs/g/kdesig/python-qt6/
[7]: https://www.pythonguis.com/tutorials/pyqt6-creating-your-first-window/
[8]: https://copr.fedorainfracloud.org/coprs/mroche/cloud-native-utilities/
[9]: https://pagure.io/mroche/cloud-utilities
[10]: https://fedoraproject.org/wiki/Changes/MajorUpgradeOfMicrodnf
[11]: https://copr.fedorainfracloud.org/coprs/rpmsoftwaremanagement/dnf5-unstable/
[12]: https://copr.fedorainfracloud.org/coprs/rpmsoftwaremanagement/dnf5-unstable/
[13]: https://copr.fedorainfracloud.org/coprs/rpmsoftwaremanagement/dnf5-unstable/
[14]: https://copr.fedorainfracloud.org/coprs/jmracek/dnf5-alternatives/
[15]: https://harelang.org/
[16]: https://mirror.drewdevault.com/hare.pdf
[17]: https://copr.fedorainfracloud.org/coprs/sentry/hare/
