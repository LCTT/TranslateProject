[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How RPM packages are made: the spec file)
[#]: via: (https://fedoramagazine.org/how-rpm-packages-are-made-the-spec-file/)
[#]: author: (Ankur Sinha "FranciscoD" https://fedoramagazine.org/author/ankursinha/)

How RPM packages are made: the spec file
======

![][1]

In the [previous article on RPM package building][2], you saw that source RPMS include the source code of the software, along with a “spec” file. This post digs into the spec file, which contains instructions on how to build the RPM. Again, this article uses _fpaste_ as an example.

### Understanding the source code

Before you can start writing a spec file, you need to have some idea of the software that you’re looking to package. Here, you’re looking at fpaste, a very simple piece of software. It is written in Python, and is a one file script. When a new version is released, it’s provided here on Pagure: <https://pagure.io/releases/fpaste/fpaste-0.3.9.2.tar.gz>

The current version, as the archive shows, is 0.3.9.2. Download it so you can see what’s in the archive:

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

The files you want to install are:

  * _fpaste.py_: which should go be installed to /usr/bin/.
  * _docs/man/en/fpaste.1_: the manual, which should go to /usr/share/man/man1/.
  * _COPYING_: the license text, which should go to /usr/share/license/fpaste/.
  * _README.rst, TODO_: miscellaneous documentation that goes to /usr/share/doc/fpaste.



Where these files are installed depends on the Filesystem Hierarchy Standard. To learn more about it, you can either read here: <http://www.pathname.com/fhs/> or look at the man page on your Fedora system:

```
$ man hier
```

#### Part 1: What are we building?

Now that we know what files we have in the source, and where they are to go, let’s look at the spec file. You can see the full file here: <https://src.fedoraproject.org/rpms/fpaste/blob/master/f/fpaste.spec>

Here is the first part of the spec file:

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

_Name_, _Version_, and so on are called _tags_, and are defined in RPM. This means you can’t just make up tags. RPM won’t understand them if you do! The tags to keep an eye out for are:

  * _Source0_: tells RPM where the source archive for this software is located.
  * _Requires_: lists run-time dependencies for the software. RPM can automatically detect quite a few of these, but in some cases they must be mentioned manually. A run-time dependency is a capability (often a package) that must be on the system for this package to function. This is how _[dnf][3]_ detects whether it needs to pull in other packages when you install this package.
  * _BuildRequires_: lists the build-time dependencies for this software. These must generally be determined manually and added to the spec file.
  * _BuildArch_: the computer architectures that this software is being built for. If this tag is left out, the software will be built for all supported architectures. The value _noarch_ means the software is architecture independent (like fpaste, which is written purely in Python).



This section provides general information about fpaste: what it is, which version is being made into an RPM, its license, and so on. If you have fpaste installed, and look at its metadata, you can see this information included in the RPM:

```
$ sudo dnf install fpaste
$ rpm -qi fpaste
Name        : fpaste
Version     : 0.3.9.2
Release     : 2.fc30
...
```

RPM adds a few extra tags automatically that represent things that it knows.

At this point, we have the general information about the software that we’re building an RPM for. Next, we start telling RPM what to do.

#### Part 2: Preparing for the build

The next part of the spec is the preparation section, denoted by _%prep_:

```
%prep
%autosetup
```

For fpaste, the only command here is %autosetup. This simply extracts the tar archive into a new folder and keeps it ready for the next section where we build it. You can do more here, like apply patches, modify files for different purposes, and so on. If you did look at the contents of the source rpm for Python, you would have seen lots of patches there. These are all applied in this section.

Typically anything in a spec file with the **%** prefix is a macro or label that RPM interprets in a special way. Often these will appear with curly braces, such as _%{example}_.

#### Part 3: Building the software

The next section is where the software is built, denoted by “%build”. Now, since fpaste is a simple, pure Python script, it doesn’t need to be built. So, here we get:

```
%build
#nothing required
```

Generally, though, you’d have build commands here, like:

```
configure; make
```

The build section is often the hardest section of the spec, because this is where the software is being built from source. This requires you to know what build system the tool is using, which could be one of many: Autotools, CMake, Meson, Setuptools (for Python) and so on. Each has its own commands and style. You need to know these well enough to get the software to build correctly.

#### Part 4: Installing the files

Once the software is built, it needs to be installed in the _%install_ section:

```
%install
mkdir -p %{buildroot}%{_bindir}
make install BINDIR=%{buildroot}%{_bindir} MANDIR=%{buildroot}%{_mandir}
```

RPM doesn’t tinker with your system files when building RPMs. It’s far too risky to add, remove, or modify files to a working installation. What if something breaks? So, instead RPM creates an artificial file system and works there. This is referred to as the _buildroot_. So, here in the buildroot, we create _/usr/bin_, represented by the macro _%{_bindir}_, and then install the files to it using the provided Makefile.

At this point, we have a built version of fpaste installed in our artificial buildroot.

#### Part 5: Listing all files to be included in the RPM

The last section of the spec file is the files section, _%files_. This is where we tell RPM what files to include in the archive it creates from this spec file. The fpaste file section is quite simple:

```
%files
%{_bindir}/%{name}
%doc README.rst TODO
%{_mandir}/man1/%{name}.1.gz
%license COPYING
```

Notice how, here, we do not specify the buildroot. All of these paths are relative to it. The _%doc_ and _%license_ commands simply do a little more—they create the required folders and remember that these files must go there.

RPM is quite smart. If you’ve installed files in the _%install_ section, but not listed them, it’ll tell you this, for example.

#### Part 6: Document all changes in the change log

Fedora is a community based project. Lots of contributors maintain and co-maintain packages. So it is imperative that there’s no confusion about what changes have been made to a package. To ensure this, the spec file contains the last section, the Changelog, _%changelog_:

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

There must be a changelog entry for _every_ change to the spec file. As you see here, while I’ve updated the spec as the maintainer, others have too. Having the changes documented clearly helps everyone know what the current status of the spec is. For all packages installed on your system, you can use rpm to see their changelogs:

```
$ rpm -q --changelog fpaste
```

### Building the RPM

Now we are ready to build the RPM. If you want to follow along and run the commands below, please ensure that you followed the steps [in the previous post][2] to set your system up for building RPMs.

We place the fpaste spec file in _~/rpmbuild/SPECS_, the source code archive in _~/rpmbuild/SOURCES/_ and can now create the source RPM:

```
$ cd ~/rpmbuild/SPECS
$ wget https://src.fedoraproject.org/rpms/fpaste/raw/master/f/fpaste.spec

$ cd ~/rpmbuild/SOURCES
$ wget https://pagure.io/fpaste/archive/0.3.9.2/fpaste-0.3.9.2.tar.gz

$ cd ~/rpmbuild/SOURCES
$ rpmbuild -bs fpaste.spec
Wrote: /home/asinha/rpmbuild/SRPMS/fpaste-0.3.9.2-3.fc30.src.rpm
```

Let’s have a look at the results:

```
$ ls ~/rpmbuild/SRPMS/fpaste*
/home/asinha/rpmbuild/SRPMS/fpaste-0.3.9.2-3.fc30.src.rpm

$ rpm -qpl ~/rpmbuild/SRPMS/fpaste-0.3.9.2-3.fc30.src.rpm
fpaste-0.3.9.2.tar.gz
fpaste.spec
```

There we are — the source rpm has been built. Let’s build both the source and binary rpm together:

```
$ cd ~/rpmbuild/SPECS
$ rpmbuild -ba fpaste.spec
..
..
..
```

RPM will show you the complete build output, with details on what it is doing in each section that we saw before. This “build log” is extremely important. When builds do not go as expected, we packagers spend lots of time going through them, tracing the complete build path to see what went wrong.

That’s it really! Your ready-to-install RPMs are where they should be:

```
$ ls ~/rpmbuild/RPMS/noarch/
fpaste-0.3.9.2-3.fc30.noarch.rpm
```

### Recap

We’ve covered the basics of how RPMs are built from a spec file. This is by no means an exhaustive document. In fact, it isn’t documentation at all, really. It only tries to explain how things work under the hood. Here’s a short recap:

  * RPMs are of two types: _source_ and _binary_.
  * Binary RPMs contain the files to be installed to use the software.
  * Source RPMs contain the information needed to build the binary RPMs: the complete source code, and the instructions on how to build the RPM in the spec file.
  * The spec file has various sections, each with its own purpose.



Here, we’ve built RPMs locally, on our Fedora installations. While this is the basic process, the RPMs we get from repositories are built on dedicated servers with strict configurations and methods to ensure correctness and security. This Fedora packaging pipeline will be discussed in a future post.

Would you like to get started with building packages, and help the Fedora community maintain the massive amount of software we provide? You can [start here by joining the package collection maintainers][4].

For any queries, post to the [Fedora developers mailing list][5]—we’re always happy to help!

### References

Here are some useful references to building RPMs:

  * <https://fedoraproject.org/wiki/How_to_create_an_RPM_package>
  * <https://docs.fedoraproject.org/en-US/quick-docs/create-hello-world-rpm/>
  * <https://docs.fedoraproject.org/en-US/packaging-guidelines/>
  * <https://rpm.org/documentation.html>



* * *

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-rpm-packages-are-made-the-spec-file/

作者：[Ankur Sinha "FranciscoD"][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ankursinha/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/rpm.png-816x345.jpg
[2]: https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/
[3]: https://fedoramagazine.org/managing-packages-fedora-dnf/
[4]: https://fedoraproject.org/wiki/Join_the_package_collection_maintainers
[5]: https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/
