translating by Flowsnow

How to Install Pip on Ubuntu
======
**Pip is a command line tool that allows you to install software packages written in Python. Learn how to install Pip on Ubuntu and how to use it for installing Python applications.**

There are numerous ways to [install software on Ubuntu][1]. You can install applications from the software center, from downloaded DEB files, from PPA, from [Snap packages][2], [using Flatpak][3], using [AppImage][4] and even from the good old source code.

There is one more way to install packages in [Ubuntu][5]. It’s called Pip and you can use it to install Python-based applications.

### What is Pip

[Pip][6] stands for “Pip Installs Packages”. [Pip][7] is a command line based package management system. It is used to install and manage software written in [Python language][8].

You can use Pip to install packages listed in the Python Package Index ([PyPI][9]).

As a software developer, you can use pip to install various Python module and packages for your own Python projects.

As an end user, you may need pip in order to install some applications that are developed using Python and can be installed easily using pip. One such example is [Stress Terminal][10] application that you can easily install with pip.

Let’s see how you can install pip on Ubuntu and other Ubuntu-based distributions.

### How to install Pip on Ubuntu

![Install pip on Ubuntu Linux][11]

Pip is not installed on Ubuntu by default. You’ll have to install it. Installing pip on Ubuntu is really easy. I’ll show it to you in a moment.

Ubuntu 18.04 has both Python 2 and Python 3 installed by default. And hence, you should install pip for both Python versions.

Pip, by default, refers to the Python 2. Pip in Python 3 is referred by pip3.

Note: I am using Ubuntu 18.04 in this tutorial. But the instructions here should be valid for other versions like Ubuntu 16.04, 18.10 etc. You may also use the same commands on other Linux distributions based on Ubuntu such as Linux Mint, Linux Lite, Xubuntu, Kubuntu etc.

#### Install pip for Python 2

First, make sure that you have Python 2 installed. On Ubuntu, use the command below to verify.

```
python2 --version

```

If there is no error and a valid output that shows the Python version, you have Python 2 installed. So now you can install pip for Python 2 using this command:

```
sudo apt install python-pip

```

It will install pip and a number of other dependencies with it. Once installed, verify that you have pip installed correctly.

```
pip --version

```

It should show you a version number, something like this:

```
pip 9.0.1 from /usr/lib/python2.7/dist-packages (python 2.7)

```

This mans that you have successfully installed pip on Ubuntu.

#### Install pip for Python 3

You have to make sure that Python 3 is installed on Ubuntu. To check that, use this command:

```
python3 --version

```

If it shows you a number like Python 3.6.6, Python 3 is installed on your Linux system.

Now, you can install pip3 using the command below:

```
sudo apt install python3-pip

```

You should verify that pip3 has been installed correctly using this command:

```
pip3 --version

```

It should show you a number like this:

```
pip 9.0.1 from /usr/lib/python3/dist-packages (python 3.6)

```

It means that pip3 is successfully installed on your system.

### How to use Pip command

Now that you have installed pip, let’s quickly see some of the basic pip commands. These commands will help you use pip commands for searching, installing and removing Python packages.

To search packages from the Python Package Index, you can use the following pip command:

```
pip search <search_string>

```

For example, if you search or stress, it will show all the packages that have the string ‘stress’ in its name or description.

```
pip search stress
stress (1.0.0) - A trivial utility for consuming system resources.
s-tui (0.8.2) - Stress Terminal UI stress test and monitoring tool
stressypy (0.0.12) - A simple program for calling stress and/or stress-ng from python
fuzzing (0.3.2) - Tools for stress testing applications.
stressant (0.4.1) - Simple stress-test tool
stressberry (0.1.7) - Stress tests for the Raspberry Pi
mobbage (0.2) - A HTTP stress test and benchmark tool
stresser (0.2.1) - A large-scale stress testing framework.
cyanide (1.3.0) - Celery stress testing and integration test support.
pysle (1.5.7) - An interface to ISLEX, a pronunciation dictionary with stress markings.
ggf (0.3.2) - global geometric factors and corresponding stresses of the optical stretcher
pathod (0.17) - A pathological HTTP/S daemon for testing and stressing clients.
MatPy (1.0) - A toolbox for intelligent material design, and automatic yield stress determination
netblow (0.1.2) - Vendor agnostic network testing framework to stress network failures
russtress (0.1.3) - Package that helps you to put lexical stress in russian text
switchy (0.1.0a1) - A fast FreeSWITCH control library purpose-built on traffic theory and stress testing.
nx4_selenium_test (0.1) - Provides a Python class and apps which monitor and/or stress-test the NoMachine NX4 web interface
physical_dualism (1.0.0) - Python library that approximates the natural frequency from stress via physical dualism, and vice versa.
fsm_effective_stress (1.0.0) - Python library that uses the rheological-dynamical analogy (RDA) to compute damage and effective buckling stress in prismatic shell structures.
processpathway (0.3.11) - A nifty little toolkit to create stress-free, frustrationless image processing pathways from your webcam for computer vision experiments. Or observing your cat.

```

If you want to install an application using pip, you can use it in the following manner:

```
pip install <package_name>

```

Pip doesn’t support tab completion so the package name should be exact. It will download all the necessary files and installed that package.

If you want to remove a Python package installed via pip, you can use the remove option in pip.

```
pip uninstall <installed_package_name>

```

You can use pip3 instead of pip in the above commands.

I hope this quick tip helped you to install pip on Ubuntu. If you have any questions or suggestions, please let me know in the comment section below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-pip-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://itsfoss.com/how-to-add-remove-programs-in-ubuntu/
[2]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[3]: https://itsfoss.com/flatpak-guide/
[4]: https://itsfoss.com/use-appimage-linux/
[5]: https://www.ubuntu.com/
[6]: https://en.wikipedia.org/wiki/Pip_(package_manager)
[7]: https://pypi.org/project/pip/
[8]: https://www.python.org/
[9]: https://pypi.org/
[10]: https://itsfoss.com/stress-terminal-ui/
[11]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/install-pip-ubuntu.png
