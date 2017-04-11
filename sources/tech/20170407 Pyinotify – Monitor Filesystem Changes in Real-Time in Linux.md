translating---geekpi

Pyinotify – Monitor Filesystem Changes in Real-Time in Linux
============================================================

Pyinotify is a simple yet useful Python module for [monitoring filesystems changes][1] in real-time in Linux.

As a System administrator, you can use it to monitor changes happening to a directory of interest such as web directory or application data storage directory and beyond.

**Suggested Read:** [fswatch – Monitors Files and Directory Changes or Modifications in Linux][2]

It depends on inotify (a Linux kernel feature incorporated in kernel 2.6.13), which is an event-driven notifier, its notifications are exported from kernel space to user space via three system calls.

The purpose of pyinotiy is to bind the three system calls, and support an implementation on top of them providing a common and abstract means to manipulate those functionalities.

In this article, we will show you how to install and use pyinotify in Linux to monitor filesystem changes or modifications in real-time.

#### Dependencies

In order to use pyinotify, your system must be running:

1.  Linux kernel 2.6.13 or higher
2.  Python 2.4 or higher

### How to Install Pyinotify in Linux

First start by checking the kernel and Python versions installed on your system as follows:

```
# uname -r 
# python -V
```

Once dependencies are met, we will use pip to install pynotify. In most Linux distributions, Pip is already installed if you’re using Python 2 >=2.7.9 or Python 3 >=3.4 binaries downloaded from python.org, otherwise, install it as follows:

```
# yum install python-pip      [On CentOS based Distros]
# apt-get install python-pip  [On Debian based Distros]
# dnf install python-pip      [On Fedora 22+]
```

Now, install pyinotify like so:

```
# pip install pyinotify
```

It will install available version from the default repository, if you are looking to have a latest stable version of pyinotify, consider cloning it’s git repository as shown.

```
# git clone https://github.com/seb-m/pyinotify.git
# cd pyinotify/
# ls
# python setup.py install
```

### How to Use pyinotify in Linux

In the example below, I am monitoring any changes to the user tecmint’s home (/home/tecmint) directory as root user (logged in via ssh) as shown in the screenshot:

```
# python -m pyinotify -v /home/tecmint
```
[
 ![Monitor Directory Changes](http://www.tecmint.com/wp-content/uploads/2017/03/Monitor-Directory-File-Changes.png) 
][3]

Monitor Directory Changes

Next, we will keep a watch for any changes to the web directory (/var/www/html/tecmint.com):

```
# python -m pyinotify -v /var/www/html/tecmint.com
```

To exit the program, simply hit `[Ctrl+C]`.

Note: When you run pyinotify without specifying any directory to monitor, the `/tmp` directory is considered by default.

Find more about Pyinotify on Github: [https://github.com/seb-m/pyinotify][4]

That’s all for now! In this article, we showed you how to install and use pyinotify, a useful Python module for monitoring filesystems changes in Linux.

Have you come across any similar Python modules or related [Linux tools/utilities][5]? Let us know in the comments, perhaps you can as well ask any question in relation to this article.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/pyinotify-monitor-filesystem-directory-changes-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/fswatch-monitors-files-and-directory-changes-modifications-in-linux/
[2]:http://www.tecmint.com/fswatch-monitors-files-and-directory-changes-modifications-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Monitor-Directory-File-Changes.png
[4]:https://github.com/seb-m/pyinotify
[5]:http://tecmint.com/tag/commandline-tools
[6]:http://www.tecmint.com/author/aaronkili/
[7]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[8]:http://www.tecmint.com/free-linux-shell-scripting-books/
