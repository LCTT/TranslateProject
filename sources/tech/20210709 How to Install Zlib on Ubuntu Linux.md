[#]: subject: (How to Install Zlib on Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-zlib-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install Zlib on Ubuntu Linux
======

[Zlib][1] is an open source library for used for data compression.

As an end user, you are likely to encounter the need of installing Zlib (or zlib devel package) as a dependency of another application.

But here comes the problem. If you try installing Zlib on Ubuntu, it will throw “unable to locate package zlib” error.

```
sudo apt install zlib
Reading package lists... Done
Building dependency tree
Reading state information... Done
E: Unable to locate package zlib
```

Why do you see this [unable to locate package error][2]? Because there is no package named zlib.

If you [use the apt search command][3], you’ll find that the there are a couple of packages that let you install zlib: **zlib1g and zlib1g-dev**. When you have that information, installing them is just one apt command away.

### Install Zlib on Ubuntu-based Linux distributions

Open a terminal and use the following command:

```
sudo apt install zlib1g
```

_**Please keep in mind that the the letter before g is 1 (one), not lowercase L. Many people make this mistake while typing the command.**_

The other package, zlib1g-dev is development package. Only install it if you require it otherwise you should be good with the main runtime zlib1g package.

```
sudo apt install zlib1g-dev
```

You may also download the source code of Zlib [from its website][1] and install it. However, I won’t recommend going the source code way just for installing zlib unless you have a good reason to do so. For example, if you need the latest or a specific version of zlib which is not available in the distribution’s repository.

It is interesting how a seemingly small stuff like installing zlib could become a pain for two reasons: a different package name and the package name containing a “hidden” numeral one (1) which is confused with lowercase L.

I hope this quick tip helps you. Feel free to drop your questions, suggestions or a simple “thank you” in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-zlib-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://zlib.net/
[2]: https://itsfoss.com/unable-to-locate-package-error-ubuntu/
[3]: https://itsfoss.com/apt-search-command/
