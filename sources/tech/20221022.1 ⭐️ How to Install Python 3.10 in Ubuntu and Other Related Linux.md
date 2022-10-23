[#]: subject: "How to Install Python 3.10 in Ubuntu and Other Related Linux"
[#]: via: "https://www.debugpoint.com/install-python-3-10-ubuntu/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Python 3.10 in Ubuntu and Other Related Linux
======

**Planning to get Python 3.10 installed for your work? Here’s how to install Python 3.10 in Ubuntu and related distributions.**

Python 3.10 was released on Oct 25, 2021 with additional features and updates. This release brings better handling of error messages, new pattern-matching features, TypeAlias, user-defined type guards and more. You can read the release highlights [here][1].

As of writing this guide, Python 3.10 is adopted by most of the current distros. For example, Ubuntu 22.04 LTS, and Fedora 36 all have Python 3.10 by default.

That said, if you need Python 3.10 in any non-supported releases right now, you can use the [below reliable PPA][2] to install the latest Python 3.10 in Ubuntu. Here’s how.

### How to Install Python 3.10 on Ubuntu

This PPA can be used for Ubuntu 21.10, Ubuntu 21.04, Ubuntu 20.04 LTS, Ubuntu 18.04 LTS, and Linux Mint 20.x, Elementary OS 6 and other related Ubuntu-based distributions. Mostly those don’t support 3.10 by default.

- Open a terminal prompt and add the following PPA.

```
sudo add-apt-repository ppa:deadsnakes/ppa
```

- Refresh the cache using the below command.

```
sudo apt update 
```

- And install Python 3.10 using the below command.

```
sudo apt install python3.10
```

### Set Python Versions

Setting up Python 3.10 as default require some additional steps. Follow along.

**Warning**: Many applications in your Ubuntu system depend on the stock version of Python 3.9. Hence, be very sure that your work applications (e.g. GIMP, GNOME Terminal etc.) are compatible with Python 3.10. So, be cautious.

**Quick Tip:** If you want to check which of your installed system packages depends on a specific version, use the following `rdepends` switch of `apt-cache` command. In the below example, I am checking which of the installed packages depends on Python 3.8.

```
apt-cache rdepends python3.8
```

```
[~]$ apt-cache rdepends python3.8
python3.8
Reverse Depends:
python3.8-dbg
virtualbox
python3.8-venv
python3.8-full
libpython3.8-testsuite
libglib2.0-tests
idle-python3.8
idle-python3.8
python3.8-minimal
python3.8-doc
python3.8-dev
python3.8-dbg
python3-uno
gedit
virtualbox
stimfit
python3.8-venv
python3-stfio
python3-escript-mpi
python3-escript
python3-csound
pitivi
obs-studio
liferea
libpython3.8-testsuite
libglib2.0-tests
kitty
kdevelop-python
idle-python3.8
idle-python3.8
rhythmbox-plugins
python3.8-minimal
python3.8-doc
python3.8-dev
python3
python3-uno
python3-all
cluster-glue
gedit
[~]$
```

#### Use Python 3.10 as the default Python3

- First, check the current default version using the below command from the terminal.

```
python3 --version
```

- Use `update-alternatives` to create symbolic links to python3

```
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
```

```
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 2
```

- And choose which one to use as Python3 via the command:

```
sudo update-alternatives --config python3
```

![Install Python 3.10 in Ubuntu][3]

That’s all for the steps. Now you can start using the latest Python in your current Ubuntu version for your work/study. You switch over to the stock version using the above commands and changing the version numbers at any given time.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/install-python-3-10-ubuntu/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://docs.python.org/3.10/whatsnew/3.10.html
[2]: https://github.com/deadsnakes
[3]: https://www.debugpoint.com/wp-content/uploads/2021/10/Installed-Python-3.10-in-Ubuntu-1024x472.jpeg
