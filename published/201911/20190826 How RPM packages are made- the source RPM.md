[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11527-1.html)
[#]: subject: (How RPM packages are made: the source RPM)
[#]: via: (https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/)
[#]: author: (Ankur Sinha "FranciscoD" https://fedoramagazine.org/author/ankursinha/)

RPM 包是如何从源 RPM 制作的
======

![][1]

在[上一篇文章中，我们研究了什么是 RPM 软件包][2]。它们是包含文件和元数据的档案文件。当安装或卸载 RPM 时，此元数据告诉 RPM 在哪里创建或删除文件。正如你将在上一篇文章中记住的，元数据还包含有关“依赖项”的信息，它可以是“运行时”或“构建时”的依赖信息。

例如，让我们来看看 `fpaste`。你可以使用 `dnf` 下载该 RPM。这将下载 Fedora 存储库中可用的 `fpaste` 最新版本。在 Fedora 30 上，当前版本为 0.3.9.2：

```
$ dnf download fpaste

...
fpaste-0.3.9.2-2.fc30.noarch.rpm
```

由于这是个构建 RPM，因此它仅包含使用 `fpaste` 所需的文件：

```
$ rpm -qpl ./fpaste-0.3.9.2-2.fc30.noarch.rpm
/usr/bin/fpaste
/usr/share/doc/fpaste
/usr/share/doc/fpaste/README.rst
/usr/share/doc/fpaste/TODO
/usr/share/licenses/fpaste
/usr/share/licenses/fpaste/COPYING
/usr/share/man/man1/fpaste.1.gz
```

### 源 RPM

在此链条中的下一个环节是源 RPM。Fedora 中的所有软件都必须从其源代码构建。我们不包括预构建的二进制文件。因此，要制作一个 RPM 文件，RPM（工具）需要：

* 给出必须要安装的文件，
* 例如，如果要编译出这些文件，则告诉它们如何生成这些文件，
* 告知必须在何处安装这些文件，
* 该特定软件需要其他哪些依赖才能正常工作。

源 RPM 拥有所有这些信息。源 RPM 与构建 RPM 相似，但顾名思义，它们不包含已构建的二进制文件，而是包含某个软件的源文件。让我们下载 `fpaste` 的源 RPM：

```
$ dnf download fpaste --source

...
fpaste-0.3.9.2-2.fc30.src.rpm
```

注意文件的结尾是 `src.rpm`。所有的 RPM 都是从源 RPM 构建的。你也可以使用 `dnf` 轻松检查“二进制” RPM 的源 RPM：

```
$ dnf repoquery --qf "%{SOURCERPM}" fpaste
fpaste-0.3.9.2-2.fc30.src.rpm
```

另外，由于这是源 RPM，因此它不包含构建的文件。相反，它包含有关如何从中构建 RPM 的源代码和指令：

```
$ rpm -qpl ./fpaste-0.3.9.2-2.fc30.src.rpm
fpaste-0.3.9.2.tar.gz
fpaste.spec
```

这里，第一个文件只是 `fpaste` 的源代码。第二个是 spec 文件。spec 文件是个配方，可告诉 RPM（工具）如何使用源 RPM 中包含的源代码创建 RPM（档案文件）— 它包含 RPM（工具）构建 RPM（档案文件）所需的所有信息。在 spec 文件中。当我们软件包维护人员添加软件到 Fedora 中时，我们大部分时间都花在编写和完善 spec 文件上。当软件包需要更新时，我们会回过头来调整 spec 文件。你可以在 <https://src.fedoraproject.org/browse/projects/> 的源代码存储库中查看 Fedora 中所有软件包的 spec 文件。

请注意，一个源 RPM 可能包含构建多个 RPM 的说明。`fpaste` 是一款非常简单的软件，一个源 RPM 生成一个“二进制” RPM。而 Python 则更复杂。虽然只有一个源 RPM，但它会生成多个二进制 RPM：

```
$ sudo dnf repoquery --qf "%{SOURCERPM}" python3
python3-3.7.3-1.fc30.src.rpm
python3-3.7.4-1.fc30.src.rpm

$ sudo dnf repoquery --qf "%{SOURCERPM}" python3-devel
python3-3.7.3-1.fc30.src.rpm
python3-3.7.4-1.fc30.src.rpm

$ sudo dnf repoquery --qf "%{SOURCERPM}" python3-libs
python3-3.7.3-1.fc30.src.rpm
python3-3.7.4-1.fc30.src.rpm

$ sudo dnf repoquery --qf "%{SOURCERPM}" python3-idle
python3-3.7.3-1.fc30.src.rpm
python3-3.7.4-1.fc30.src.rpm

$ sudo dnf repoquery --qf "%{SOURCERPM}" python3-tkinter
python3-3.7.3-1.fc30.src.rpm
python3-3.7.4-1.fc30.src.rpm
```

用 RPM 行话来讲，“python3” 是“主包”，因此该 spec 文件将称为 `python3.spec`。所有其他软件包均为“子软件包”。你可以下载 python3 的源 RPM，并查看其中的内容。（提示：补丁也是源代码的一部分）：

```
$ dnf download --source python3
python3-3.7.4-1.fc30.src.rpm

$ rpm -qpl ./python3-3.7.4-1.fc30.src.rpm
00001-rpath.patch
00102-lib64.patch
00111-no-static-lib.patch
00155-avoid-ctypes-thunks.patch
00170-gc-assertions.patch
00178-dont-duplicate-flags-in-sysconfig.patch
00189-use-rpm-wheels.patch
00205-make-libpl-respect-lib64.patch
00251-change-user-install-location.patch
00274-fix-arch-names.patch
00316-mark-bdist_wininst-unsupported.patch
Python-3.7.4.tar.xz
check-pyc-timestamps.py
idle3.appdata.xml
idle3.desktop
python3.spec
```

### 从源 RPM 构建 RPM 

现在我们有了源 RPM，并且其中有什么内容，我们可以从中重建 RPM。但是，在执行此操作之前，我们应该设置系统以构建 RPM。首先，我们安装必需的工具：

```
$ sudo dnf install fedora-packager
```

这将安装 `rpmbuild` 工具。`rpmbuild` 需要一个默认布局，以便它知道源 RPM 中每个必需组件的位置。让我们看看它们是什么：

```
# spec 文件将出现在哪里？
$ rpm -E %{_specdir}
/home/asinha/rpmbuild/SPECS

# 源代码将出现在哪里？
$ rpm -E %{_sourcedir}
/home/asinha/rpmbuild/SOURCES

# 临时构建目录是哪里？
$ rpm -E %{_builddir}
/home/asinha/rpmbuild/BUILD

# 构建根目录是哪里？
$ rpm -E %{_buildrootdir}
/home/asinha/rpmbuild/BUILDROOT

# 源 RPM 将放在哪里？
$ rpm -E %{_srcrpmdir}
/home/asinha/rpmbuild/SRPMS

# 构建的 RPM 将放在哪里？
$ rpm -E %{_rpmdir}
/home/asinha/rpmbuild/RPMS
```

我已经在系统上设置了所有这些目录：

```
$ cd
$ tree -L 1 rpmbuild/
rpmbuild/
├── BUILD
├── BUILDROOT
├── RPMS
├── SOURCES
├── SPECS
└── SRPMS

6 directories, 0 files
```

RPM 还提供了一个为你全部设置好的工具：

```
$ rpmdev-setuptree
```

然后，确保已安装 `fpaste` 的所有构建依赖项：

```
sudo dnf builddep fpaste-0.3.9.2-3.fc30.src.rpm
```

对于 `fpaste`，你只需要 Python，并且它肯定已经安装在你的系统上（`dnf` 也使用 Python）。还可以给 `builddep` 命令一个 spec 文件，而不是源 RPM。在手册页中了解更多信息：

```
$ man dnf.plugin.builddep
```

现在我们有了所需的一切，从源 RPM 构建一个 RPM 就像这样简单：

```
$ rpmbuild --rebuild fpaste-0.3.9.2-3.fc30.src.rpm
..
..

$ tree ~/rpmbuild/RPMS/noarch/
/home/asinha/rpmbuild/RPMS/noarch/
└── fpaste-0.3.9.2-3.fc30.noarch.rpm

0 directories, 1 file
```

`rpmbuild` 将安装源 RPM 并从中构建你的 RPM。现在，你可以使用 `dnf` 安装 RPM 以使用它。当然，如前所述，如果你想在 RPM 中进行任何更改，则必须修改 spec 文件，我们将在下一篇文章中介绍 spec 文件。

### 总结

总结一下这篇文章有两点：

* 我们通常安装使用的 RPM 是包含软件的构建版本的 “二进制” RPM
* 构建 RPM 来自于源 RPM，源 RPM 包括用于生成二进制 RPM 所需的源代码和规范文件。

如果你想开始构建 RPM，并帮助 Fedora 社区维护我们提供的大量软件，则可以从这里开始： <https://fedoraproject.org/wiki/Join_the_package_collection_maintainers>

如有任何疑问，请发邮件到 [Fedora 开发人员邮件列表][3]，我们随时乐意为你提供帮助！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/

作者：[Ankur Sinha "FranciscoD"][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ankursinha/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/rpm.png-816x345.jpg
[2]: https://linux.cn/article-11452-1.html
[3]: https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/
