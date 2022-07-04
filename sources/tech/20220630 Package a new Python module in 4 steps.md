[#]: subject: "Package a new Python module in 4 steps"
[#]: via: "https://opensource.com/article/22/6/package-python-module-rpm"
[#]: author: "Sumantro Mukherjee https://opensource.com/users/sumantro"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Package a new Python module in 4 steps
======
The pyp2rpm command makes it possible to create an RPM package and automate the process.

![Hands on a keyboard with a Python book][1]

Image by: WOCinTech Chat. Modified by Opensource.com. CC BY-SA 4.0

When you install an application, you're usually installing a package that contains the executable code for an application and important files such as documentation, icons, and so on. On Linux, applications are commonly packaged as RPM or DEB files, and users install them with the `dnf` or `apt` commands, depending on the Linux distribution. However, new Python modules are released virtually every day, so you could easily encounter a module that hasn't yet been packaged. And that's exactly why the `pyp2rpm` command exists.

Recently, I tried to install a module called python-concentration. It didn't go well:

```
$ sudo dnf install python-concentration
Updating Subscription Management repositories.
Last metadata expiration check: 1:23:32 ago on Sat 11 Jun 2022 06:37:25.
No match for argument: python-concentration
Error: Unable to find a match: python-concentration
```

It’s a PyPi package, but it's not yet available as an RPM package. The good news is that you can build an RPM yourself with a relatively simple process using `pyp2rpm`.

You'll need two directories to get started:

```
$ mkdir rpmbuild
$ cd rpmbuild && mkdir SPECS
```

You'll also need to install `pyp2rpm` :

```
$ sudo dnf install pyp2rpm
```

### 1. Generate the spec file

The foundation of any RPM package is a file called the spec file. This file contains all the information about how to build the package, which dependencies it needs, the version of the application it provides, what files it installs, and more. When pointed to a Python module, `pyp2rpm` generates a spec file for it, which you can use to build an RPM.

Using python-concentration as an arbitrary example, here's how to generate a spec file:

```
$ pyp2rpm concentration > ~/rpmbuild/SPECS/concentration.spec
```

And here's the file it generates:

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

### 2. Run rpmlint

To ensure that the spec file is up to standards, run the `rpmlint` command on the file:

```
$ rpmlint ~/rpmbuild/SPEC/concentration.spec
error: bad date in %changelog: - 1.1.5-1
0 packages and 1 specfiles checked; 0 errors, 0 warnings.
```

It seems the changelog entry requires a date.

```
%changelog
* Sat Jun 11 2022 Tux <tux@example.com> - 1.1.5-1
```

Try `rpmlint` again:

```
$ rpmlint ~/rpmbuild/SPEC/concentration.spec
0 packages and 1 specfiles checked; 0 errors, 0 warnings.
```

Success!

### 3. Download the source code

To build an RPM package, you must download the code you're packaging up. The easy way to do this is to parse your spec file to find the source code's location on the Internet.

First, install the `spectool` command with `dnf` :

```
$ sudo dnf install spectool
```

Then use it to download the source code:

```
$ cd ~/rpmbuild
$ spectool -g -R SPEC/concentration.spec
Downloading: https://files.pythonhosted.org/...concentration-1.1.5.tar.gz
   6.0 KiB / 6.0 KiB    [=====================================]
Downloaded: concentration-1.1.5.tar.gz
```

This creates a SOURCES directory and places the source code archive into it.

### 4. Build the source package

Now you have a valid spec file, so it's time to build the source package with the `rpmbuild` command. If you don't have `rpmbuild` yet, install the rpm-build package with `dnf` (or accept your terminal's offer to install that package when you attempt to use the `rpmbuild` command).

```
$ cd ~/rpmbuild
$ spectool -g -R SPEC/concentration.spec
Downloading: https://files.pythonhosted.org/...concentration-1.1.5.tar.gz
   6.0 KiB / 6.0 KiB    [=====================================]
Downloaded: concentration-1.1.5.tar.gz
```

The `-bs` option stands for build source. This option gives you an `src.rpm` file, an all-purpose package that must be rebuilt for a specific architecture.

Build an installable RPM for your system:

```
$ rpmbuild –rebuild SRPMS/python-concentration-1.1.5-1.el9.src.rpm
error: Failed build dependencies:
        python3-devel is needed by python-concentration-1.1.5-1.el9.noarch
```

It looks like this package requires the development libraries of Python. Install them to continue with the build. This time the build succeeds and renders a lot more output (which I abbreviate here for clarity):

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

Your RPM package has been built in the RPMS subdirectory. Install it as usual with `dnf` :

```
$ sudo dnf install RPMS/noarch/python3-concentration*rpm
```

### Why not just use PyPi?

It's not absolutely necessary to make a Python module into an RPM. Installing a module with PyPi is also acceptable, but PyPi adds another package manager to your personal list of things to check and update. When you install an RPM using `dnf`, you have a complete listing of what you've installed on your system. Thanks to `pyp2rpm`, the process is quick, easy, and automatable.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/package-python-module-rpm

作者：[Sumantro Mukherjee][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/python-programming-code-keyboard.png
