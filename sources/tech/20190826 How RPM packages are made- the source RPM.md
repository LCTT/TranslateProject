[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How RPM packages are made: the source RPM)
[#]: via: (https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/)
[#]: author: (Ankur Sinha "FranciscoD" https://fedoramagazine.org/author/ankursinha/)

How RPM packages are made: the source RPM
======

![][1]

In a [previous post, we looked at what RPM packages are][2]. They are archives that contain files and metadata. This metadata tells RPM where to create or remove files from when an RPM is installed or uninstalled. The metadata also contains information on “dependencies”, which you will remember from the previous post, can either be “runtime” or “build time”.

As an example, we will look at _fpaste_. You can download the RPM using _dnf_. This will download the latest version of _fpaste_ that is available in the Fedora repositories. On Fedora 30, this is currently 0.3.9.2:

```
$ dnf download fpaste

...
fpaste-0.3.9.2-2.fc30.noarch.rpm
```

Since this is the built RPM, it contains only files needed to use _fpaste_:

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

### Source RPMs

The next link in the chain is the source RPM. All software in Fedora must be built from its source code. We do not include pre-built binaries. So, for an RPM file to be made, RPM (the tool) needs to be:

  * given the files that have to be installed,
  * told how to generate these files, if they are to be compiled, for example,
  * told where these files must be installed,
  * what other dependencies this particular software needs to work properly.



The source RPM holds all of this information. Source RPMs are similar archives to RPM, but as the name suggests, instead of holding the built binary files, they contain the source files for a piece of software. Let’s download the source RPM for _fpaste_:

```
$ dnf download fpaste --source
...
fpaste-0.3.9.2-2.fc30.src.rpm
```

Notice how the file ends with “src.rpm”. All RPMs are built from source RPMs. You can easily check what source RPM a “binary” RPM comes from using dnf too:

```
$ dnf repoquery --qf "%{SOURCERPM}" fpaste
fpaste-0.3.9.2-2.fc30.src.rpm
```

Also, since this is the source RPM, it does not contain built files. Instead, it contains the sources and instructions on how to build the RPM from them:

```
$ rpm -qpl ./fpaste-0.3.9.2-2.fc30.src.rpm
fpaste-0.3.9.2.tar.gz
fpaste.spec
```

Here, the first file is simply the source code for _fpaste_. The second is the “spec” file. The spec file is the recipe that tells RPM (the tool) how to create the RPM (the archive) using the sources contained in the source RPM—all the information that RPM (the tool) needs to build RPMs (the archives) are contained in spec files. When we package maintainers add software to Fedora, most of our time is spent writing and perfecting the individual spec files. When a software package needs an update, we go back and tweak the spec file. You can see the spec files for ALL packages in Fedora at our source repository at <https://src.fedoraproject.org/browse/projects/>

Note that one source RPM may contain the instructions to build multiple RPMs. _fpaste_ is a very simple piece of software, where one source RPM generates one “binary” RPM. Python, on the other hand is more complex. While there is only one source RPM, it generates multiple binary RPMs:

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

In RPM jargon, “python3” is the “main package”, and so the spec file will be called “python3.spec”. All the other packages are “sub-packages”. You can download the source RPM for python3 and see what’s in it too. (Hint: patches are also part of the source code):

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

### Building an RPM from a source RPM

Now that we have the source RPM, and know what’s in it, we can rebuild our RPM from it. Before we do so, though, we should set our system up to build RPMs. First, we install the required tools:

```
$ sudo dnf install fedora-packager
```

This will install the rpmbuild tool. rpmbuild requires a default layout so that it knows where each required component of the source rpm is. Let’s see what they are:

```
# Where should the spec file go?
$ rpm -E %{_specdir}
/home/asinha/rpmbuild/SPECS

# Where should the sources go?
$ rpm -E %{_sourcedir}
/home/asinha/rpmbuild/SOURCES

# Where is temporary build directory?
$ rpm -E %{_builddir}
/home/asinha/rpmbuild/BUILD

# Where is the buildroot?
$ rpm -E %{_buildrootdir}
/home/asinha/rpmbuild/BUILDROOT

# Where will the source rpms be?
$ rpm -E %{_srcrpmdir}
/home/asinha/rpmbuild/SRPMS

# Where will the built rpms be?
$ rpm -E %{_rpmdir}
/home/asinha/rpmbuild/RPMS
```

I have all of this set up on my system already:

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

RPM provides a tool that sets it all up for you too:

```
$ rpmdev-setuptree
```

Then we ensure that we have all the build dependencies for _fpaste_ installed:

```
sudo dnf builddep fpaste-0.3.9.2-3.fc30.src.rpm
```

For _fpaste_ you only need Python and that must already be installed on your system (dnf uses Python too). The builddep command can also be given a spec file instead of an source RPM. Read more in the man page:

```
$ man dnf.plugin.builddep
```

Now that we have all that we need, building an RPM from a source RPM is as simple as:

```
$ rpmbuild --rebuild fpaste-0.3.9.2-3.fc30.src.rpm
..
..

$ tree ~/rpmbuild/RPMS/noarch/
/home/asinha/rpmbuild/RPMS/noarch/
└── fpaste-0.3.9.2-3.fc30.noarch.rpm

0 directories, 1 file
```

rpmbuild will install the source RPM and build your RPM from it. You can now install the RPM to use it as you do–using dnf. Of course, as said before, if you want to change anything in the RPM, you must modify the spec file—we’ll cover spec files in next post.

### Summary

To summarise this post in two short points:

  * the RPMs we generally install to use software are “binary” RPMs that contain built versions of the software
  * these are built from source RPMs that include the source code and the spec file that are needed to generate the binary RPMs.



If you’d like to get started with building RPMs, and help the Fedora community maintain the massive amount of software we provide, you can start here: <https://fedoraproject.org/wiki/Join_the_package_collection_maintainers>

For any queries, post to the [Fedora developers mailing list][3]—we’re always happy to help!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/

作者：[Ankur Sinha "FranciscoD"][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ankursinha/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/rpm.png-816x345.jpg
[2]: https://fedoramagazine.org/rpm-packages-explained/
[3]: https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/
