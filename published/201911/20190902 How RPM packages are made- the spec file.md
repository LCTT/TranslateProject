[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11538-1.html)
[#]: subject: (How RPM packages are made: the spec file)
[#]: via: (https://fedoramagazine.org/how-rpm-packages-are-made-the-spec-file/)
[#]: author: (Ankur Sinha "FranciscoD" https://fedoramagazine.org/author/ankursinha/)

如何编写 RPM 的 spec 文件
======

![][1]

在[关于 RPM 软件包构建的上一篇文章][2]中，你了解到了源 RPM 包括软件的源代码以及 spec 文件。这篇文章深入研究了 spec 文件，该文件中包含了有关如何构建 RPM 的指令。同样，本文以 `fpaste` 为例。

### 了解源代码

在开始编写 spec 文件之前，你需要对要打包的软件有所了解。在这里，你正在研究 `fpaste`，这是一个非常简单的软件。它是用 Python 编写的，并且是一个单文件脚本。当它发布新版本时，可在 Pagure 上找到：<https://pagure.io/releases/fpaste/fpaste-0.3.9.2.tar.gz>。

如该档案文件所示，当前版本为 0.3.9.2。下载它，以便你查看该档案文件中的内容：

```
$ wget https://pagure.io/releases/fpaste/fpaste-0.3.9.2.tar.gz
$ tar -tvf fpaste-0.3.9.2.tar.gz
drwxrwxr-x root/root         0 2018-07-25 02:58 fpaste-0.3.9.2/
-rw-rw-r-- root/root        25 2018-07-25 02:58 fpaste-0.3.9.2/.gitignore
-rw-rw-r-- root/root      3672 2018-07-25 02:58 fpaste-0.3.9.2/CHANGELOG
-rw-rw-r-- root/root     35147 2018-07-25 02:58 fpaste-0.3.9.2/COPYING
-rw-rw-r-- root/root       444 2018-07-25 02:58 fpaste-0.3.9.2/Makefile
-rw-rw-r-- root/root      1656 2018-07-25 02:58 fpaste-0.3.9.2/README.rst
-rw-rw-r-- root/root       658 2018-07-25 02:58 fpaste-0.3.9.2/TODO
drwxrwxr-x root/root         0 2018-07-25 02:58 fpaste-0.3.9.2/docs/
drwxrwxr-x root/root         0 2018-07-25 02:58 fpaste-0.3.9.2/docs/man/
drwxrwxr-x root/root         0 2018-07-25 02:58 fpaste-0.3.9.2/docs/man/en/
-rw-rw-r-- root/root      3867 2018-07-25 02:58 fpaste-0.3.9.2/docs/man/en/fpaste.1
-rwxrwxr-x root/root     24884 2018-07-25 02:58 fpaste-0.3.9.2/fpaste
lrwxrwxrwx root/root         0 2018-07-25 02:58 fpaste-0.3.9.2/fpaste.py -> fpaste
```

你要安装的文件是：

* `fpaste.py`：应该安装到 `/usr/bin/`。
* `docs/man/en/fpaste.1`：手册，应放到 `/usr/share/man/man1/`。
* `COPYING`：许可证文本，应放到 `/usr/share/license/fpaste/`。
* `README.rst`、`TODO`：放到 `/usr/share/doc/fpaste/` 下的其它文档。

这些文件的安装位置取决于文件系统层次结构标准（FHS）。要了解更多信息，可以在这里阅读：<http://www.pathname.com/fhs/> 或查看 Fedora 系统的手册页：

```
$ man hier
```

#### 第一部分：要构建什么？

现在我们知道了源文件中有哪些文件，以及它们要存放的位置，让我们看一下 spec 文件。你可以在此处查看这个完整的文件：<https://src.fedoraproject.org/rpms/fpaste/blob/master/f/fpaste.spec>。

这是 spec 文件的第一部分：

```
Name:   fpaste
Version:  0.3.9.2
Release:  3%{?dist}
Summary:  A simple tool for pasting info onto sticky notes instances
BuildArch:  noarch
License:  GPLv3+
URL:    https://pagure.io/fpaste
Source0:  https://pagure.io/releases/fpaste/fpaste-0.3.9.2.tar.gz

Requires:    python3

%description
It is often useful to be able to easily paste text to the Fedora
Pastebin at http://paste.fedoraproject.org and this simple script
will do that and return the resulting URL so that people may
examine the output. This can hopefully help folks who are for
some reason stuck without X, working remotely, or any other
reason they may be unable to paste something into the pastebin
```

`Name`、`Version` 等称为*标签*，它们定义在 RPM 中。这意味着你不能只是随意写点标签，RPM 无法理解它们！需要注意的标签是：

* `Source0`：告诉 RPM 该软件的源代码档案文件所在的位置。
* `Requires`：列出软件的运行时依赖项。RPM 可以自动检测很多依赖项，但是在某些情况下，必须手动指明它们。运行时依赖项是系统上必须具有的功能（通常是软件包），才能使该软件包起作用。这是 [dnf][3] 在安装此软件包时检测是否需要拉取其他软件包的方式。
* `BuildRequires`：列出了此软件的构建时依赖项。这些通常必须手动确定并添加到 spec 文件中。
* `BuildArch`：此软件为该计算机体系结构所构建。如果省略此标签，则将为所有受支持的体系结构构建该软件。值 `noarch` 表示该软件与体系结构无关（例如 `fpaste`，它完全是用 Python 编写的）。

本节提供有关 `fpaste` 的常规信息：它是什么，正在将什么版本制作为 RPM，其许可证等等。如果你已安装 `fpaste`，并查看其元数据时，则可以看到该 RPM 中包含的以下信息：

```
$ sudo dnf install fpaste
$ rpm -qi fpaste
Name        : fpaste
Version     : 0.3.9.2
Release     : 2.fc30
...
```

RPM 会自动添加一些其他标签，以代表它所知道的内容。

至此，我们掌握了要为其构建 RPM 的软件的一般信息。接下来，我们开始告诉 RPM 做什么。

#### 第二部分：准备构建

spec 文件的下一部分是准备部分，用 `％prep` 代表：

```
%prep
%autosetup
```

对于 `fpaste`，这里唯一的命令是 `％autosetup`。这只是将 tar 档案文件提取到一个新文件夹中，并为下一部分的构建阶段做好了准备。你可以在此处执行更多操作，例如应用补丁程序，出于不同目的修改文件等等。如果你查看过 Python 的源 RPM 的内容，那么你会在那里看到许多补丁。这些都将在本节中应用。

通常，spec 文件中带有 `％` 前缀的所有内容都是 RPM 以特殊方式解释的宏或标签。这些通常会带有大括号，例如 `％{example}`。

#### 第三部分：构建软件

下一部分是构建软件的位置，用 `％build` 表示。现在，由于 `fpaste` 是一个简单的纯 Python 脚本，因此无需构建。因此，这里是：

```
%build
#nothing required
```

不过，通常来说，你会在此处使用构建命令，例如：

```
configure; make
```

构建部分通常是 spec 文件中最难的部分，因为这是从源代码构建软件的地方。这要求你知道该工具使用的是哪个构建系统，该系统可能是许多构建系统之一：Autotools、CMake、Meson、Setuptools（用于 Python）等等。每个都有自己的命令和语法样式。你需要充分了解这些才能正确构建软件。

#### 第四部分：安装文件

软件构建后，需要在 `％install` 部分中安装它：

```
%install
mkdir -p %{buildroot}%{_bindir}
make install BINDIR=%{buildroot}%{_bindir} MANDIR=%{buildroot}%{_mandir}
```

在构建 RPM 时，RPM 不会修改你的系统文件。在一个可以正常运行的系统上添加、删除或修改文件的风险太大。如果发生故障怎么办？因此，RPM 会创建一个专门打造的文件系统并在其中工作。这称为 `buildroot`。 因此，在 `buildroot` 中，我们创建由宏 `％{_bindir}` 代表的 `/usr/bin` 目录，然后使用提供的 `Makefile` 将文件安装到其中。

至此，我们已经在专门打造的 `buildroot` 中安装了 `fpaste` 的构建版本。

#### 第五部分：列出所有要包括在 RPM 中的文件

spec 文件其后的一部分是文件部分：`％files`。在这里，我们告诉 RPM 从该 spec 文件创建的档案文件中包含哪些文件。`fpaste` 的文件部分非常简单：

```
%files
%{_bindir}/%{name}
%doc README.rst TODO
%{_mandir}/man1/%{name}.1.gz
%license COPYING
```

请注意，在这里，我们没有指定 `buildroot`。所有这些路径都是相对路径。`％doc` 和 `％license`命令做的稍微多一点，它们会创建所需的文件夹，并记住这些文件必须放在那里。

RPM 很聪明。例如，如果你在 `％install` 部分中安装了文件，但未列出它们，它会提醒你。

#### 第六部分：在变更日志中记录所有变更

Fedora 是一个基于社区的项目。许多贡献者维护或共同维护软件包。因此，当务之急是不要被软件包做了哪些更改所搞混。为了确保这一点，spec 文件包含的最后一部分是变更日志 `％changelog`：

```
%changelog
* Thu Jul 25 2019 Fedora Release Engineering < ...> - 0.3.9.2-3
- Rebuilt for https://fedoraproject.org/wiki/Fedora_31_Mass_Rebuild

* Thu Jan 31 2019 Fedora Release Engineering < ...> - 0.3.9.2-2
- Rebuilt for https://fedoraproject.org/wiki/Fedora_30_Mass_Rebuild

* Tue Jul 24 2018 Ankur Sinha  - 0.3.9.2-1
- Update to 0.3.9.2

* Fri Jul 13 2018 Fedora Release Engineering < ...> - 0.3.9.1-4
- Rebuilt for https://fedoraproject.org/wiki/Fedora_29_Mass_Rebuild

* Wed Feb 07 2018 Fedora Release Engineering < ..> - 0.3.9.1-3
- Rebuilt for https://fedoraproject.org/wiki/Fedora_28_Mass_Rebuild

* Sun Sep 10 2017 Vasiliy N. Glazov < ...> - 0.3.9.1-2
- Cleanup spec

* Fri Sep 08 2017 Ankur Sinha  - 0.3.9.1-1
- Update to latest release
- fixes rhbz 1489605
...
....
```

spec 文件的*每项*变更都必须有一个变更日志条目。如你在此处看到的，虽然我以维护者身份更新了该 spec 文件，但其他人也做过更改。清楚地记录变更内容有助于所有人知道该 spec 文件的当前状态。对于系统上安装的所有软件包，都可以使用 `rpm` 来查看其更改日志：

```
$ rpm -q --changelog fpaste
```

### 构建 RPM

现在我们准备构建 RPM 包。如果要继续执行以下命令，请确保遵循[上一篇文章][2]中的步骤设置系统以构建 RPM。

我们将 `fpaste` 的 spec 文件放置在 `~/rpmbuild/SPECS` 中，将源代码档案文件存储在 `~/rpmbuild/SOURCES/` 中，现在可以创建源 RPM 了：

```
$ cd ~/rpmbuild/SPECS
$ wget https://src.fedoraproject.org/rpms/fpaste/raw/master/f/fpaste.spec

$ cd ~/rpmbuild/SOURCES
$ wget https://pagure.io/fpaste/archive/0.3.9.2/fpaste-0.3.9.2.tar.gz

$ cd ~/rpmbuild/SOURCES
$ rpmbuild -bs fpaste.spec
Wrote: /home/asinha/rpmbuild/SRPMS/fpaste-0.3.9.2-3.fc30.src.rpm
```

让我们看一下结果：

```
$ ls ~/rpmbuild/SRPMS/fpaste*
/home/asinha/rpmbuild/SRPMS/fpaste-0.3.9.2-3.fc30.src.rpm

$ rpm -qpl ~/rpmbuild/SRPMS/fpaste-0.3.9.2-3.fc30.src.rpm
fpaste-0.3.9.2.tar.gz
fpaste.spec
```

我们看到源 RPM 已构建。让我们同时构建源 RPM 和二进制 RPM：

```
$ cd ~/rpmbuild/SPECS
$ rpmbuild -ba fpaste.spec
..
..
..
```

RPM 将向你显示完整的构建输出，并在我们之前看到的每个部分中详细说明它的工作。此“构建日志”非常重要。当构建未按预期进行时，我们的打包人员将花费大量时间来遍历它们，以跟踪完整的构建路径来查看出了什么问题。

就是这样！准备安装的 RPM 应该位于以下位置：

```
$ ls ~/rpmbuild/RPMS/noarch/
fpaste-0.3.9.2-3.fc30.noarch.rpm
```

### 概括

我们已经介绍了如何从 spec 文件构建 RPM 的基础知识。这绝不是一份详尽的文档。实际上，它根本不是文档。它只是试图解释幕后的运作方式。简短回顾一下：

* RPM 有两种类型：源 RPM 和 二进制 RPM。
* 二进制 RPM 包含要安装以使用该软件的文件。
* 源 RPM 包含构建二进制 RPM 所需的信息：完整的源代码，以及 spec 文件中的有关如何构建 RPM 的说明。
* spec 文件包含多个部分，每个部分都有其自己的用途。
   
在这里，我们已经在安装好的 Fedora 系统中本地构建了 RPM。虽然这是个基本的过程，但我们从存储库中获得的 RPM 是建立在具有严格配置和方法的专用服务器上的，以确保正确性和安全性。这个 Fedora 打包流程将在以后的文章中讨论。

你想开始构建软件包，并帮助 Fedora 社区维护我们提供的大量软件吗？你可以[从这里开始加入软件包集合维护者][4]。

如有任何疑问，请发布到 [Fedora 开发人员邮件列表][5]，我们随时乐意为你提供帮助！

### 参考

这里有一些构建 RPM 的有用参考：

* <https://fedoraproject.org/wiki/How_to_create_an_RPM_package>
* <https://docs.fedoraproject.org/en-US/quick-docs/create-hello-world-rpm/>
* <https://docs.fedoraproject.org/en-US/packaging-guidelines/>
* <https://rpm.org/documentation.html>

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-rpm-packages-are-made-the-spec-file/

作者：[Ankur Sinha "FranciscoD"][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ankursinha/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/rpm.png-816x345.jpg
[2]: https://linux.cn/article-11527-1.html
[3]: https://fedoramagazine.org/managing-packages-fedora-dnf/
[4]: https://fedoraproject.org/wiki/Join_the_package_collection_maintainers
[5]: https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/
