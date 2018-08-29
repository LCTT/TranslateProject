How to install software from the Linux command line
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/suitcase_container_bag.png?itok=q40lKCBY)

If you use Linux for any amount of time, you'll soon learn there are many different ways to do the same thing. This includes installing applications on a Linux machine via the command line. I have been a Linux user for roughly 25 years, and time and time again I find myself going back to the command line to install my apps.

The most common method of installing apps from the command line is through software repositories (a place where software is stored) using what's called a package manager. All Linux apps are distributed as packages, which are nothing more than files associated with a package management system. Every Linux distribution comes with a package management system, but they are not all the same.

### What is a package management system?

A package management system is comprised of sets of tools and file formats that are used together to install, update, and uninstall Linux apps. The two most common package management systems are from Red Hat and Debian. Red Hat, CentOS, and Fedora all use the `rpm` system (.rpm files), while Debian, Ubuntu, Mint, and Ubuntu use `dpkg` (.deb files). Gentoo Linux uses a system called Portage, and Arch Linux uses nothing but tarballs (.tar files). The primary difference between these systems is how they install and maintain apps.

You might be wondering what's inside an `.rpm`, `.deb`, or `.tar` file. You might be surprised to learn that all are nothing more than plain old archive files (like `.zip`) that contain an application's code, instructions on how to install it, dependencies (what other apps it may depend on), and where its configuration files should be placed. The software that reads and executes all of those instructions is called a package manager.

### Debian, Ubuntu, Mint, and others

Debian, Ubuntu, Mint, and other Debian-based distributions all use `.deb` files and the `dpkg` package management system. There are two ways to install apps via this system. You can use the `apt` application to install from a repository, or you can use the `dpkg` app to install apps from `.deb` files. Let's take a look at how to do both.

Installing apps using `apt` is as easy as:
```
$ sudo apt install app_name

```

Uninstalling an app via `apt` is also super easy:
```
$ sudo apt remove app_name

```

To upgrade your installed apps, you'll first need to update the app repository:
```
$ sudo apt update

```

Once finished, you can update any apps that need updating with the following:
```
$ sudo apt upgrade

```

What if you want to update only a single app? No problem.
```
$ sudo apt update app_name

```

Finally, let's say the app you want to install is not available in the Debian repository, but it is available as a `.deb` download.
```
$ sudo dpkg -i app_name.deb

```

### Red Hat, CentOS, and Fedora

Red Hat, by default, uses several package management systems. These systems, while using their own terminology, are still very similar to each other and to the one used in Debian. For example, we can use either the `yum` or `dnf` manager to install apps.
```
$ sudo yum install app_name

$ sudo dnf install app_name

```

Apps in the `.rpm` format can also be installed with the `rpm` command.
```
$ sudo rpm -i app_name.rpm

```

Removing unwanted applications is just as easy.
```
$ sudo yum remove app_name

$ sudo dnf remove app_name

```

Updating apps is similarly easy.
```
$ yum update

$ sudo dnf upgrade --refresh

```

As you can see, installing, uninstalling, and updating Linux apps from the command line isn't hard at all. In fact, once you get used to it, you'll find it's faster than using desktop GUI-based management tools!

For more information on installing apps from the command line, please visit the Debian [Apt wiki][1], the [Yum cheat sheet][2], and the [DNF wiki][3].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/how-install-software-linux-command-line

作者：[Patrick H.Mullins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pmullins
[1]:https://wiki.debian.org/Apt
[2]:https://access.redhat.com/articles/yum-cheat-sheet
[3]:https://fedoraproject.org/wiki/DNF?rd=Dnf
