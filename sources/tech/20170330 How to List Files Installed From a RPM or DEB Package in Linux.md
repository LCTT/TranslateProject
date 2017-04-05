translating---geekpi

How to List Files Installed From a RPM or DEB Package in Linux
============================================================

Have you ever wondered where the various files contained inside a package are installed (located) in the Linux file system? In this article, we’ll show how to list all files installed from or present in a certain package or group of packages in Linux.

This can help you to easily locate important package files like configurations files, documentation and more. Let’s look at the different methods of listing files in or installed from a package:

### How to List All Files of Installed Package in Linux

You can use the [repoquery command][6] which is part of the [yum-utils to list files installed][7] on a CentOS/RHEL system from a given package.

To install and use yum-utils, run the commands below:

```
# yum update 
# yum install yum-utils
```

Now you can list files of an installed RPM package, for example httpd web server (note that the package name is case-sensitive). The `--installed` flag means installed packages and `-l` flags enables listing of files:

```
# repoquery --installed -l httpd
# dnf repoquery --installed -l httpd  [On Fedora 22+ versions]
```
[
 ![Repoquery List Installed Files of Httpd](http://www.tecmint.com/wp-content/uploads/2017/03/Repoquery-List-Installed-Files-of-Httpd.png) 
][8]

Repoquery List Installed Files of Httpd

Important: In Fedora 22+ version, the repoquery command is integrated with [dnf package manager][9] for RPM based distribution to list files installed from a package as shown above.

Alternatively, you can as well use the [rpm command][10] below to list the files inside or installed on the system from a `.rpm` package as follows, where the `-g` and `-l` means to list files in package receptively:

```
# rpm -ql httpd
```
[
 ![RPM Query Package for Installed Files](http://www.tecmint.com/wp-content/uploads/2017/03/rpm-ql-httpd.png) 
][11]

RPM Query Package for Installed Files

Another useful option is used to use `-p` to list `.rpm` package files before installing it.

```
# rpm -qlp telnet-server-1.2-137.1.i586.rpm
```

On Debian/Ubuntu distributions, you can use the [dpkg command][12] with the `-L` flag to list files installed to your Debian system or its derivatives, from a given `.deb` package.

In this example, we will list files installed from apache2 web server:

```
$ dpkg -L apache2
```
[
 ![dpkg List Installed Packages](http://www.tecmint.com/wp-content/uploads/2017/03/dpkg-List-Installed-Packages.png) 
][13]

dpkg List Installed Packages

Don’t forget to check out following useful articles for package management in Linux.

1.  [20 Useful ‘Yum’ Commands for Package Management][1]
2.  [20 Useful RPM Commands for Package Management][2]
3.  [15 Useful APT Commands for Package Management in Ubuntu][3]
4.  [15 Useful Dpkg Commands for Ubuntu Linux][4]
5.  [5 Best Linux Package Managers for Linux Newbies][5]

That’s all! In this article, we showed you how to list/locate all files installed from a given package or group of packages in Linux. Share your thoughts with us using the feedback form below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/list-files-installed-from-rpm-deb-package-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/
[3]:http://www.tecmint.com/apt-advanced-package-command-examples-in-ubuntu/
[4]:http://www.tecmint.com/dpkg-command-examples/
[5]:http://www.tecmint.com/linux-package-managers/
[6]:http://www.tecmint.com/list-installed-packages-in-rhel-centos-fedora/
[7]:http://www.tecmint.com/linux-yum-package-management-with-yum-utils/
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Repoquery-List-Installed-Files-of-Httpd.png
[9]:http://www.tecmint.com/dnf-commands-for-fedora-rpm-package-management/
[10]:http://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/rpm-ql-httpd.png
[12]:http://www.tecmint.com/dpkg-command-examples/
[13]:http://www.tecmint.com/wp-content/uploads/2017/03/dpkg-List-Installed-Packages.png
[14]:http://www.tecmint.com/author/aaronkili/
[15]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[16]:http://www.tecmint.com/free-linux-shell-scripting-books/
