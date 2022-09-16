[#]: subject: "Package a new Python module in 4 steps"
[#]: via: "https://opensource.com/article/22/6/package-python-module-rpm"
[#]: author: "Sumantro Mukherjee https://opensource.com/users/sumantro"
[#]: collector: "lkxed"
[#]: translator: "Return7g"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15030-1.html"

4 步打包一个新的 Python 模块
======

![](https://img.linux.net.cn/data/attachment/album/202209/14/155051kzjuzhzvmllmv2b5.jpg)

> pyp2rpm 使得创建 RPM 包的过程更加自动化。

当你安装一个应用程序时，你通常是在安装一个软件包，其中包含应用程序的可执行代码和重要文件，如文档、图标等。在 Linux上，软件一般被打包成 RPM 或 DEB 等格式，用户只要通过 `dnf` 或者 `apt` 等命令就可以进行安装了，这取决于你使用的 Linux 发行版。然而几乎每天都有新的 Python 模块发布，因此你很容易遇到一个尚未打包的 Python 模块。这就是 `pyp2rpm` 存在的意义了。

最近我在尝试安装一个叫 `python-concentration` 的模块，但是进展并不太顺利：

```
$ sudo dnf install python-concentration
Updating Subscription Management repositories.
Last metadata expiration check: 1:23:32 ago on Sat 11 Jun 2022 06:37:25.
No match for argument: python-concentration
Error: Unable to find a match: python-concentration
```

虽然这是一个发布在 PyPi 的包，但它仍不能被打包成 RPM 包。好消息是你可以使用 `pyp2rpm` 以一个相对简单的过程将它打包成 RPM 包。

首先你需要设置两个目录：

```
$ mkdir rpmbuild
$ cd rpmbuild && mkdir SPECS
```

像这样去安装 `pyp2rpm`：

```
$ sudo dnf install pyp2rpm
```

### 1、生成 spec 文件

RPM 包的基础是一种 spec 文件，这个文件包含你创建这个包的所有信息，如所需的依赖关系、应用的版本号、安装的文件等信息。当指向某个 Python 模块时，`pyp2rpm` 会为它构建一个 spec 文件，你可以用它来创建 RPM 包。

下面以 `python-concentration` 为例演示如何构建一个 spec 文件：

```
$ pyp2rpm concentration > ~/rpmbuild/SPECS/concentration.spec
```

下面是它生成的文件：

```
# Created by pyp2rpm-3.3.8
%global pypi_name concentration
%global pypi_version 1.1.5

Name:           python-%{pypi_name}
Version:        %{pypi_version}
Release:        1%{?dist}
Summary:        Get work done when you need to, goof off when you don't

License:        None
URL:            None
Source0:        %{pypi_source}
BuildArch:      noarch

BuildRequires:  python3-devel
BuildRequires:  python3dist(setuptools)

%description
Concentration [![PyPI version]( [![Test Status]( [![Lint Status]( [![codecov](

%package -n     python3-%{pypi_name}
Summary:        %{summary}
%{?python_provide:%python_provide python3-%{pypi_name}}

Requires:       (python3dist(hug) >= 2.6.1 with python3dist(hug) < 3~~)
Requires:       python3dist(setuptools)
%description -n python3-%{pypi_name}
Concentration [![PyPI version]( [![Test Status]( [![Lint Status]( [![codecov](


%prep
%autosetup -n %{pypi_name}-%{pypi_version}

%build
%py3_build

%install
%py3_install

%files -n python3-%{pypi_name}
%license LICENSE
%doc README.md
%{_bindir}/concentration
%{python3_sitelib}/%{pypi_name}
%{python3_sitelib}/%{pypi_name}-%{pypi_version}-py%{python3_version}.egg-info

%changelog
*  - 1.1.5-1
- Initial package.
```

### 2、运行 rpmlint

为了确保 spec 文件符合标准，你需要对文件使用 `rpmlint` 命令：

```
$ rpmlint ~/rpmbuild/SPEC/concentration.spec
error: bad date in %changelog: - 1.1.5-1
0 packages and 1 specfiles checked; 0 errors, 0 warnings.
```

看起来更新日志（`%changelog`）需要记录日期。

```
%changelog
* Sat Jun 11 2022 Tux <tux@example.com> - 1.1.5-1
```

再次运行 `rpmint`：

```
$ rpmlint ~/rpmbuild/SPEC/concentration.spec
0 packages and 1 specfiles checked; 0 errors, 0 warnings.
```

成功！

### 3、下载源码

你需要下载好打包的代码才能进一步构建 RPM 包。一种简单的方式是解析你的 spec 文件以获取源码的网址。

首先，通过 `dnf` 安装 `spectool`：

```
$ sudo dnf install spectool
```

然后通过 `spectool` 来下载源码：

```
$ cd ~/rpmbuild
$ spectool -g -R SPEC/concentration.spec
Downloading: https://files.pythonhosted.org/...concentration-1.1.5.tar.gz
   6.0 KiB / 6.0 KiB    [=====================================]
Downloaded: concentration-1.1.5.tar.gz
```

这样就创建了一个 `SOURCES` 目录并将源码放入其中。

### 4、构建源软件包

现在你已经验证过 spec 文件了，接下来就可以通过 `rpmbuild` 构建源软件包了。如果你还没有安装 `rpmbuild`，你也可以通过 `dnf` 安装 `rpm-build` 包（或者在使用 `rpmbuild` 命令时根据终端的的提示进行安装）。

参数 `-bs` 表示构建源软件包。添加这个参数会产生一个 src.rpm 文件，这是一个用于为特定架构重新构建的通用包：

```
$ rpmbuild -bs SPECS/concentration.spec
Wrote: ~/rpmbuild/SRPMS/python-concentration-1.1.5-1.el9.src.rpm
```

为你的系统构建一个可安装的 RPM 文件：

```
$ rpmbuild –rebuild SRPMS/python-concentration-1.1.5-1.el9.src.rpm
error: Failed build dependencies:
        python3-devel is needed by python-concentration-1.1.5-1.el9.noarch
```

看起来这个包需要安装 Python 的开发库才能继续构建。安装它们以继续构建。这一次，构建成功了，并且渲染了更多的输出（为了清楚起见，我在这里简略了输出）：

```
$ sudo dnf install python3-devel -y
$ rpmbuild –rebuild SRPMS/python-concentration-1.1.5-1.el9.src.rpm
[...]
Executing(--clean): /bin/sh -e /var/tmp/rpm-tmp.TYA7l2
+ umask 022
+ cd /home/bogus/rpmbuild/BUILD
+ rm -rf concentration-1.1.5
+ RPM_EC=0
++ jobs -p
+ exit 0
```

你的 RPM 包现在已经构建在 `RPMS` 子目录下，像平常一样使用 `dnf` 安装它。

```
$ sudo dnf install RPMS/noarch/python3-concentration*rpm
```

### 为什么不使用 PyPi？

通常情况下我们并不需要将 Python 模块打包成 RPM 包。通过 PyPi 来安装模块也是可以接受的，但是 PyPi 会安装额外的包管理器对你的模块进行检查和更新。当你使用 `dnf` 来安装 RPM 包时，你在安装完成时就能够获取到完整的安装列表。有了 `pyp2rpm` 之后，这个过程就变得快速、简单且自动化了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/package-python-module-rpm

作者：[Sumantro Mukherjee][a]
选题：[lkxed][b]
译者：[Return7g](https://github.com/Return7g)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python-programming-code-keyboard.png
