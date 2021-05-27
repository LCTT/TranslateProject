[#]: subject: (Make Command Not Found? Here’s How to Fix it)
[#]: via: (https://itsfoss.com/make-command-not-found-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Make Command Not Found? Here’s How to Fix it
======

The other day I was trying to compile a program on a fresh new Ubuntu system and it threw me an error when I tried to use the make command:

```
The program 'make' is currently not installed. You can install it by typing:
sudo apt install make
```

This is an indication that the make command is not installed. You may install make on Ubuntu using these commands one by one:

```
sudo apt update
sudo apt install make
```

The first command updates the local package cache. It is necessary specially if it is a freshly installed Ubuntu system. With the refreshed package cache, your system would know about the repository from where make package should be downloaded.

And verify that make has been properly installed:

```
make --version
```

![Checking make version][1]

### A better way to install make on Ubuntu

An even better way to install make command is to use the build essential package. This package contains make, gcc, g++ and several other compilers and developer tools.

```
sudo apt install build-essential
```

![Installing Build Essential package][2]

With this build-essential package installed, you can [easily run C/C++ programs in Linux][3].

### What if make is installed but it doesn’t work

In some rare cases, it may happen that make is installed and yet it doesn’t work.

The reason is that make command is not in the $PATH variable. You can either reinstall make with this command:

```
sudo apt install --reinstall make
```

If that doesn’t work, you may try to [manually add the binary to your PATH][4] but it shouldn’t come to this manual effort.

I hope this quick tip helped you. Still have the problem or question on the related topic? Feel free to use the comment section. I’ll try to help you in my capacity. If you want an even more rapid response, you may [join It’s FOSS Community forum][5]. Enjoy :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/make-command-not-found-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/check-make-version-linux.png?resize=800%2C293&ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/install-build-essentials-800x410.png?resize=800%2C410&ssl=1
[3]: https://itsfoss.com/c-plus-plus-ubuntu/
[4]: https://itsfoss.com/add-directory-to-path-linux/
[5]: https://itsfoss.community/
