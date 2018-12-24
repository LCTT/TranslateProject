[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An Easy Way To Remove Programs Installed From Source In Linux)
[#]: via: (https://www.ostechnix.com/an-easy-way-to-remove-programs-installed-from-source-in-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

An Easy Way To Remove Programs Installed From Source In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/12/stow-1-720x340.jpg)

Not all programs available in the official or third-party repositories, so you can’t install them using the regular package managers. Some times, you have to install the programs by manually compiling from source. As you may already know, when you install programs from source, the package files will be copied to multiple locations, such as **/usr/local/bin** , **/usr/local/etc/** , on the filesystem. If the installed program from source doesn’t have a built-in uninstaller, it is going to be a tedious task to remove the packages when you don’t need it anymore. You may need to spend couple (or several) minutes to find those package files and remove them manually. This is what I have been doing up until I stumbled upon a utility named **“GNU Stow”**. Thankfully, Stow has a fantastic way to easily manage programs installed from source.

To quote the official website,

> **GNU Stow is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place.**

To put this simply, Stow helps you to keep the package files organized in a way to easily manageable. In this method, the files will not be copied to multiple locations. Instead, all files are saved in a specific folder, usually under the program name itself, and Stow creates symbolic links to all the programs’ files into the appropriate places. For example, **/usr/local/bin** could contain symlinks to files within **/usr/local/stow/vim/bin** , **/usr/local/stow/python/bin** etc., and likewise recursively for any other subdirectories such as **…/share** , **…/man** , and so on. In this tutorial, I will show you how to easily manage programs installed from source using Stow with a practical example. Read on.

### Installing GNU Stow

GNU Stow is available in the default repositories of popular Linux operating systems.

On **Arch Linux** and its variants, run the following command to install Stow.

```
$ sudo pacman -S stow
```

On **Debian** , **Ubuntu** , **Linux Mint** :

```
$ sudo apt install stow
```

On **Fedora** :

```
$ sudo dnf install stow
```

On **RHEL/CentOS** :

```
$ sudo yum install epel-release

$ sudo yum install stow
```

### Easily Remove Programs Installed From Source In Linux

As I already mentioned earlier, all program files of a package will be saved in a root folder located in **/usr/local/stow/**. Under this root or parent directory, each package will be saved in its own private sub-directory. For example, if we install Vim editor from source, all program files and directories related to Vim will be saved under **/usr/local/stow/vim** folder. If you install python from source, all files related to python will be kept under **/usr/local/stow/python** and so on.

Let me install a program, for example **hello** , from source.

First download the ‘hello’ program’s tarball.

```
$ wget http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz
```

Extract the downloaded tarball using command:

```
$ tar -zxvf hello-2.10.tar.gz
```

The above command will create a directory named ‘hello-2.10’ in the current working directory and extract all contents in it.

Switch to the extracted directory:

```
$ cd hello-2.10/
```

Run the following command with –prefix option.

```
$ ./configure --prefix=/usr/local/stow/hello
```

The above command will save the build files in the specified location i.e **/usr/local/stow/hello** in our case.

Finally, build and install the hello program using the following commands:

```
$ make

$ sudo make install
```

That’s it. The hello program has been installed in **/usr/local/stow/hello/** location. You can verify it with ‘ls’ command as shown below.

```
$ ls /usr/local/stow/hello/
bin share
```

Finally, go to the **/usr/local/stow/** directory and run the following command to generate the necessary symlinks.

```
$ cd /usr/local/stow/

$ sudo stow hello
```

All done!

What just happened is all the files and directories contained in the hello package have been symlinked to the directory **/usr/local/**. In other words, **/usr/local/stow/hello/bin** has been symlinked to **/usr/local/bin** and **/usr/local/stow/hello/share** has been symlinked to **/usr/local/share** and **/usr/local/stow/hello/share/man** has been symlinked to **/usr/local/share/man** and so on.

You can verify them using ‘ls’ command:

```
$ ls /usr/local/bin/
hello
```

Let us check if the hello program is working or not using command:

```
$ hello
Hello, world!
```

Yeah, it is working!!

Similarly, you can install programs as described above under its own sub-directory.

Here is the contents of the Stow root directory:

```
$ tree /usr/local/stow/
```

![][2]

See? The hello program is installed /usr/local/stow/hello/ location. Like wise, all packages will be kept under their own directory.

Here comes the main part. Let us remove the hello program. To do so, go to **/usr/local/stow/** directory:

```
$ cd /usr/local/stow/
```

..and run the following command:

```
$ sudo stow --delete hello
```

The hello program has just been removed. You can verify if it is really removed using command:

```
$ hello
-bash: /usr/local/bin/hello: No such file or directory
```

![][3]

See? Hello program is removed!

Please note that Stow has removed the symlinks only. All program files and directories related to hello program are still available in **/usr/local/stow/hello** folder. So, you can install the hello program again without having to download the actual source file. If you don’t want it anymore, simply delete the folder.

```
$ sudo rm -fr /usr/local/stow/hello/
```

To know more details about Stow, refer the man pages.

```
$ man stow
```


Stow helps you to uninstall the programs as easily as you install them. If you are wondering how to effectively manage a lot of programs installed from source, GNU Stow is one such program to make this task a lot easier. Give it a try, you won’t be disappointed.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/an-easy-way-to-remove-programs-installed-from-source-in-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2018/12/tree-command.png
[3]: http://www.ostechnix.com/wp-content/uploads/2018/12/hello-world.png
