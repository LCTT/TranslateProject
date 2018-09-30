translating by Flowsnow

How to build rpm packages
======

Save time and effort installing files and scripts across multiple hosts. 

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1)

I have used rpm-based package managers to install software on Red Hat and Fedora Linux since I started using Linux more than 20 years ago. I have used the **rpm** program itself, **yum** , and **DNF** , which is a close descendant of yum, to install and update packages on my Linux hosts. The yum and DNF tools are wrappers around the rpm utility that provide additional functionality, such as the ability to find and install package dependencies.

Over the years I have created a number of Bash scripts, some of which have separate configuration files, that I like to install on most of my new computers and virtual machines. It reached the point that it took a great deal of time to install all of these packages, so I decided to automate that process by creating an rpm package that I could copy to the target hosts and install all of these files in their proper locations. Although the **rpm** tool was formerly used to build rpm packages, that function was removed and a new tool,was created to build new rpms.

When I started this project, I found very little information about creating rpm packages, but I managed to find a book, Maximum RPM, that helped me figure it out. That book is now somewhat out of date, as is the vast majority of information I have found. It is also out of print, and used copies go for hundreds of dollars. The online version of [Maximum RPM][1] is available at no charge and is kept up to date. The [RPM website][2] also has links to other websites that have a lot of documentation about rpm. What other information there is tends to be brief and apparently assumes that you already have a good deal of knowledge about the process.

In addition, every one of the documents I found assumes that the code needs to be compiled from sources as in a development environment. I am not a developer. I am a sysadmin, and we sysadmins have different needs because we don’t—or we shouldn’t—compile code to use for administrative tasks; we should use shell scripts. So we have no source code in the sense that it is something that needs to be compiled into binary executables. What we have is a source that is also the executable.

For the most part, this project should be performed as the non-root user student. Rpms should never be built by root, but only by non-privileged users. I will indicate which parts should be performed as root and which by a non-root, unprivileged user.

### Preparation

First, open one terminal session and `su` to root. Be sure to use the `-` option to ensure that the complete root environment is enabled. I do not believe that sysadmins should use `sudo` for any administrative tasks. Find out why in my personal blog post: [Real SysAdmins don’t sudo][3].

```
[student@testvm1 ~]$ su -
Password:
[root@testvm1 ~]#
```

Create a student user that can be used for this project and set a password for that user.

```
[root@testvm1 ~]# useradd -c "Student User" student
[root@testvm1 ~]# passwd student
Changing password for user student.
New password: <Enter the password>
Retype new password: <Enter the password>
passwd: all authentication tokens updated successfully.
[root@testvm1 ~]#
```

Building rpm packages requires the `rpm-build` package, which is likely not already installed. Install it now as root. Note that this command will also install several dependencies. The number may vary, depending upon the packages already installed on your host; it installed a total of 17 packages on my test VM, which is pretty minimal.

```
dnf install -y rpm-build
```

The rest of this project should be performed as the user student unless otherwise explicitly directed. Open another terminal session and use `su` to switch to that user to perform the rest of these steps. Download a tarball that I have prepared of a development directory structure, utils.tar, from GitHub using the following command:

```
wget https://github.com/opensourceway/how-to-rpm/raw/master/utils.tar
```

This tarball includes all of the files and Bash scripts that will be installed by the final rpm. There is also a complete spec file, which you can use to build the rpm. We will go into detail about each section of the spec file.

As user student, using your home directory as your present working directory (pwd), untar the tarball.

```
[student@testvm1 ~]$ cd ; tar -xvf utils.tar
```

Use the `tree` command to verify that the directory structure of ~/development and the contained files looks like the following output:

```
[student@testvm1 ~]$ tree development/
development/
├── license
│   ├── Copyright.and.GPL.Notice.txt
│   └── GPL_LICENSE.txt
├── scripts
│   ├── create_motd
│   ├── die
│   ├── mymotd
│   └── sysdata
└── spec
    └── utils.spec

3 directories, 7 files
[student@testvm1 ~]$
```

The `mymotd` script creates a “Message Of The Day” data stream that is sent to stdout. The `create_motd` script runs the `mymotd` scripts and redirects the output to the /etc/motd file. This file is used to display a daily message to users who log in remotely using SSH.

The `die` script is my own script that wraps the `kill` command in a bit of code that can find running programs that match a specified string and kill them. It uses `kill -9` to ensure that they cannot ignore the kill message.

The `sysdata` script can spew tens of thousands of lines of data about your computer hardware, the installed version of Linux, all installed packages, and the metadata of your hard drives. I use it to document the state of a host at a point in time. I can later use it for reference. I used to do this to maintain a record of hosts that I installed for customers.

You may need to change ownership of these files and directories to student.student. Do this, if necessary, using the following command:

```
chown -R student.student development
```

Most of the files and directories in this tree will be installed on Fedora systems by the rpm you create during this project.

### Creating the build directory structure

The `rpmbuild` command requires a very specific directory structure. You must create this directory structure yourself because no automated way is provided. Create the following directory structure in your home directory:

```
~ ─ rpmbuild
    ├── RPMS
    │   └── noarch
    ├── SOURCES
    ├── SPECS
    └── SRPMS
```

We will not create the rpmbuild/RPMS/X86_64 directory because that would be architecture-specific for 64-bit compiled binaries. We have shell scripts that are not architecture-specific. In reality, we won’t be using the SRPMS directory either, which would contain source files for the compiler.

### Examining the spec file

Each spec file has a number of sections, some of which may be ignored or omitted, depending upon the specific circumstances of the rpm build. This particular spec file is not an example of a minimal file required to work, but it is a good example of a moderately complex spec file that packages files that do not need to be compiled. If a compile were required, it would be performed in the `%build` section, which is omitted from this spec file because it is not required.

#### Preamble

This is the only section of the spec file that does not have a label. It consists of much of the information you see when the command `rpm -qi [Package Name]` is run. Each datum is a single line which consists of a tag, which identifies it and text data for the value of the tag.

```
###############################################################################
# Spec file for utils
################################################################################
# Configured to be built by user student or other non-root user
################################################################################
#
Summary: Utility scripts for testing RPM creation
Name: utils
Version: 1.0.0
Release: 1
License: GPL
URL: http://www.both.org
Group: System
Packager: David Both
Requires: bash
Requires: screen
Requires: mc
Requires: dmidecode
BuildRoot: ~/rpmbuild/

# Build with the following syntax:
# rpmbuild --target noarch -bb utils.spec
```

Comment lines are ignored by the `rpmbuild` program. I always like to add a comment to this section that contains the exact syntax of the `rpmbuild` command required to create the package. The Summary tag is a short description of the package. The Name, Version, and Release tags are used to create the name of the rpm file, as in utils-1.00-1.rpm. Incrementing the release and version numbers lets you create rpms that can be used to update older ones.

The License tag defines the license under which the package is released. I always use a variation of the GPL. Specifying the license is important to clarify the fact that the software contained in the package is open source. This is also why I included the license and GPL statement in the files that will be installed.

The URL is usually the web page of the project or project owner. In this case, it is my personal web page.

The Group tag is interesting and is usually used for GUI applications. The value of the Group tag determines which group of icons in the applications menu will contain the icon for the executable in this package. Used in conjunction with the Icon tag (which we are not using here), the Group tag allows adding the icon and the required information to launch a program into the applications menu structure.

The Packager tag is used to specify the person or organization responsible for maintaining and creating the package.

The Requires statements define the dependencies for this rpm. Each is a package name. If one of the specified packages is not present, the DNF installation utility will try to locate it in one of the defined repositories defined in /etc/yum.repos.d and install it if it exists. If DNF cannot find one or more of the required packages, it will throw an error indicating which packages are missing and terminate.

The BuildRoot line specifies the top-level directory in which the `rpmbuild` tool will find the spec file and in which it will create temporary directories while it builds the package. The finished package will be stored in the noarch subdirectory that we specified earlier. The comment showing the command syntax used to build this package includes the option `–target noarch`, which defines the target architecture. Because these are Bash scripts, they are not associated with a specific CPU architecture. If this option were omitted, the build would be targeted to the architecture of the CPU on which the build is being performed.

The `rpmbuild` program can target many different architectures, and using the `--target` option allows us to build architecture-specific packages on a host with a different architecture from the one on which the build is performed. So I could build a package intended for use on an i686 architecture on an x86_64 host, and vice versa.

Change the packager name to yours and the URL to your own website if you have one.

#### %description

The `%description` section of the spec file contains a description of the rpm package. It can be very short or can contain many lines of information. Our `%description` section is rather terse.

```
%description
A collection of utility scripts for testing RPM creation.
```

#### %prep

The `%prep` section is the first script that is executed during the build process. This script is not executed during the installation of the package.

This script is just a Bash shell script. It prepares the build directory, creating directories used for the build as required and copying the appropriate files into their respective directories. This would include the sources required for a complete compile as part of the build.

The $RPM_BUILD_ROOT directory represents the root directory of an installed system. The directories created in the $RPM_BUILD_ROOT directory are fully qualified paths, such as /user/local/share/utils, /usr/local/bin, and so on, in a live filesystem.

In the case of our package, we have no pre-compile sources as all of our programs are Bash scripts. So we simply copy those scripts and other files into the directories where they belong in the installed system.

```
%prep
################################################################################
# Create the build tree and copy the files from the development directories    #
# into the build tree.                                                         #
################################################################################
echo "BUILDROOT = $RPM_BUILD_ROOT"
mkdir -p $RPM_BUILD_ROOT/usr/local/bin/
mkdir -p $RPM_BUILD_ROOT/usr/local/share/utils

cp /home/student/development/utils/scripts/* $RPM_BUILD_ROOT/usr/local/bin
cp /home/student/development/utils/license/* $RPM_BUILD_ROOT/usr/local/share/utils
cp /home/student/development/utils/spec/* $RPM_BUILD_ROOT/usr/local/share/utils

exit
```

Note that the exit statement at the end of this section is required.

#### %files

This section of the spec file defines the files to be installed and their locations in the directory tree. It also specifies the file attributes and the owner and group owner for each file to be installed. The file permissions and ownerships are optional, but I recommend that they be explicitly set to eliminate any chance for those attributes to be incorrect or ambiguous when installed. Directories are created as required during the installation if they do not already exist.

```
%files
%attr(0744, root, root) /usr/local/bin/*
%attr(0644, root, root) /usr/local/share/utils/*
```

#### %pre

This section is empty in our lab project’s spec file. This would be the place to put any scripts that are required to run during installation of the rpm but prior to the installation of the files.

#### %post

This section of the spec file is another Bash script. This one runs after the installation of files. This section can be pretty much anything you need or want it to be, including creating files, running system commands, and restarting services to reinitialize them after making configuration changes. The `%post` script for our rpm package performs some of those tasks.

```
%post
################################################################################
# Set up MOTD scripts                                                          #
################################################################################
cd /etc
# Save the old MOTD if it exists
if [ -e motd ]
then
   cp motd motd.orig
fi
# If not there already, Add link to create_motd to cron.daily
cd /etc/cron.daily
if [ ! -e create_motd ]
then
   ln -s /usr/local/bin/create_motd
fi
# create the MOTD for the first time
/usr/local/bin/mymotd > /etc/motd
```

The comments included in this script should make its purpose clear.

#### %postun

This section contains a script that would be run after the rpm package is uninstalled. Using rpm or DNF to remove a package removes all of the files listed in the `%files` section, but it does not remove files or links created by the `%post` section, so we need to handle that in this section.

This script usually consists of cleanup tasks that simply erasing the files previously installed by the rpm cannot accomplish. In the case of our package, it includes removing the link created by the `%post` script and restoring the saved original of the motd file.

```
%postun
# remove installed files and links
rm /etc/cron.daily/create_motd

# Restore the original MOTD if it was backed up
if [ -e /etc/motd.orig ]
then
   mv -f /etc/motd.orig /etc/motd
fi
```

#### %clean

This Bash script performs cleanup after the rpm build process. The two lines in the `%clean` section below remove the build directories created by the `rpm-build` command. In many cases, additional cleanup may also be required.

```
%clean
rm -rf $RPM_BUILD_ROOT/usr/local/bin
rm -rf $RPM_BUILD_ROOT/usr/local/share/utils
```

#### %changelog

This optional text section contains a list of changes to the rpm and files it contains. The newest changes are recorded at the top of this section.

```
%changelog
* Wed Aug 29 2018 Your Name <Youremail@yourdomain.com>
  - The original package includes several useful scripts. it is
    primarily intended to be used to illustrate the process of
    building an RPM.
```

Replace the data in the header line with your own name and email address.

### Building the rpm

The spec file must be in the SPECS directory of the rpmbuild tree. I find it easiest to create a link to the actual spec file in that directory so that it can be edited in the development directory and there is no need to copy it to the SPECS directory. Make the SPECS directory your pwd, then create the link.

```
cd ~/rpmbuild/SPECS/
ln -s ~/development/spec/utils.spec
```

Run the following command to build the rpm. It should only take a moment to create the rpm if no errors occur.

```
rpmbuild --target noarch -bb utils.spec
```

Check in the ~/rpmbuild/RPMS/noarch directory to verify that the new rpm exists there.

```
[student@testvm1 ~]$ cd rpmbuild/RPMS/noarch/
[student@testvm1 noarch]$ ll
total 24
-rw-rw-r--. 1 student student 24364 Aug 30 10:00 utils-1.0.0-1.noarch.rpm
[student@testvm1 noarch]$
```

### Testing the rpm

As root, install the rpm to verify that it installs correctly and that the files are installed in the correct directories. The exact name of the rpm will depend upon the values you used for the tags in the Preamble section, but if you used the ones in the sample, the rpm name will be as shown in the sample command below:

```
[root@testvm1 ~]# cd /home/student/rpmbuild/RPMS/noarch/
[root@testvm1 noarch]# ll
total 24
-rw-rw-r--. 1 student student 24364 Aug 30 10:00 utils-1.0.0-1.noarch.rpm
[root@testvm1 noarch]# rpm -ivh utils-1.0.0-1.noarch.rpm
Preparing...                          ################################# [100%]
Updating / installing...
   1:utils-1.0.0-1                    ################################# [100%]
```

Check /usr/local/bin to ensure that the new files are there. You should also verify that the create_motd link in /etc/cron.daily has been created.

Use the `rpm -q --changelog utils` command to view the changelog. View the files installed by the package using the `rpm -ql utils` command (that is a lowercase L in `ql`.)

```
[root@testvm1 noarch]# rpm -q --changelog utils
* Wed Aug 29 2018 Your Name <Youremail@yourdomain.com>
- The original package includes several useful scripts. it is
    primarily intended to be used to illustrate the process of
    building an RPM.

[root@testvm1 noarch]# rpm -ql utils
/usr/local/bin/create_motd
/usr/local/bin/die
/usr/local/bin/mymotd
/usr/local/bin/sysdata
/usr/local/share/utils/Copyright.and.GPL.Notice.txt
/usr/local/share/utils/GPL_LICENSE.txt
/usr/local/share/utils/utils.spec
[root@testvm1 noarch]#
```

Remove the package.

```
rpm -e utils
```

### Experimenting

Now you will change the spec file to require a package that does not exist. This will simulate a dependency that cannot be met. Add the following line immediately under the existing Requires line:

```
Requires: badrequire
```

Build the package and attempt to install it. What message is displayed?

We used the `rpm` command to install and delete the `utils` package. Try installing the package with yum or DNF. You must be in the same directory as the package or specify the full path to the package for this to work.

### Conclusion

There are many tags and a couple sections that we did not cover in this look at the basics of creating an rpm package. The resources listed below can provide more information. Building rpm packages is not difficult; you just need the right information. I hope this helps you—it took me months to figure things out on my own.

We did not cover building from source code, but if you are a developer, that should be a simple step from this point.

Creating rpm packages is another good way to be a lazy sysadmin and save time and effort. It provides an easy method for distributing and installing the scripts and other files that we as sysadmins need to install on many hosts.

### Resources

  * Edward C. Baily, Maximum RPM, Sams Publishing, 2000, ISBN 0-672-31105-4

  * Edward C. Baily, [Maximum RPM][1], updated online version

  * [RPM Documentation][4]: This web page lists most of the available online documentation for rpm. It includes many links to other websites and information about rpm.




--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/how-build-rpm-packages

作者：[David Both][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[1]: http://ftp.rpm.org/max-rpm/
[2]: http://rpm.org/index.html
[3]: http://www.both.org/?p=960
[4]: http://rpm.org/documentation.html
