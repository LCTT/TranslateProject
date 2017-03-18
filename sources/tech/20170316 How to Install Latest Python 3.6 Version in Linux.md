ucasFL translating
How to Install Latest Python 3.6 Version in Linux
============================================================

In this article we will show how to install and use Python 3.x in CentOS/RHEL 7, Debian and its derivatives such as Ubuntu (latest LTS version already has latest Python installed) or Linux Mint. Our focus will be installing the core language tools that can be used in the command line.

However, we will also explain how to install the Python IDLE – a GUI-based tool that allows us to run Python code and create standalone functions.

### Install Python 3.6 in Linux

At the time of this writing (mid-March 2017), the latest Python 3.x versions available in CentOS 7 and Debian 8are 3.4 and 3.5 respectively.

Although we can install the core packages and their dependencies using [yum][1] and [aptitude][2] (or [apt-get][3]), we will explain how to perform the installation from source instead.

Why? The reason is simple: this allows us to have the latest stable release of the language (3.6) and to provide a distribution-agnostic installation method.

Prior to installing Python in CentOS 7, let’s make sure our system has all the necessary development dependencies:

```
# yum -y groupinstall development
# yum -y install zlib-devel
```

In Debian we will need to install gcc, make, and the zlib compression / decompression library:

```
# aptitude -y install gcc make zlib1g-dev
```

To install Python 3.6, run the following commands:

```
# wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tar.xz
# tar xJf Python-3.6.0.tar.xz
# cd Python-3.6.0
# ./configure
# make
# make install
```

Now relax and go grab a sandwich because this may take a while. When the installation is complete, use which to verify the location of the main binary:

```
# which python3
# python3 -V
```

The output of the above command should be similar to:

[
 ![Check Python Version in Linux](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Python-Version-in-Linux.png) 
][4]

Check Python Version in Linux

To exit the Python prompt, simply type.

```
quit()
or
exit()
```

and press Enter.

Congratulations! Python 3.6 is now installed on your system.

### Install Python IDLE in Linux

Python IDLE is a GUI-based tool for Python. If you wish to install the Python IDLE, grab the package named idle (Debian) or python-tools (CentOS).

```
# apt-get install idle       [On Debian]
# yum install python-tools   [On CentOS]
```

Type the following command to start the Python IDLE.

```
# idle
```

##### Summary

In this article we have explained how to install the latest Python stable version from source.

Last, but not least, if you’re coming from Python 2, you may want to take a look at the [2to3 official documentation][5]. This is a program that reads Python 2 code and transforms it into valid Python 3 code.

Do you have any questions or comments about this article? Feel free to get in touch with us using the form below.

--------------------------------------------------------------------------------

作者简介：

Gabriel Cánepa is a GNU/Linux sysadmin and web developer from Villa Mercedes, San Luis, Argentina. He works for a worldwide leading consumer product company and takes great pleasure in using FOSS tools to increase productivity in all areas of his daily work.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-python-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/

[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/linux-package-management/
[3]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Python-Version-in-Linux.png
[5]:https://docs.python.org/3.6/library/2to3.html
