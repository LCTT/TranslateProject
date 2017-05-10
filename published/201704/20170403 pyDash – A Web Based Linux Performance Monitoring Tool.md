pyDash：一个基于 web 的 Linux 性能监测工具
============================================================

`pyDash` 是一个轻量且[基于 web 的 Linux 性能监测工具][1]，它是用 Python 和 [Django][2] 加上 Chart.js 来写的。经测试，在下面这些主流 Linux 发行版上可运行：CentOS、Fedora、Ubuntu、Debian、Raspbian 以及 Pidora 。

你可以使用这个工具来监视你的 Linux 个人电脑/服务器资源，比如 CPU、内存、网络统计，包括在线用户的进程以及更多。仪表盘完全由主要的 Python 发行版本所提供的 Python 库开发，因此它的依赖关系很少，你不需要安装许多包或库来运行它。

在这篇文章中，我将展示如何安装 `pyDash` 来监测 Linux 服务器性能。

### 如何在 Linux 系统下安装 pyDash

1、首先，像下面这样安装需要的软件包 `git` 和 `Python pip`：

```
-------------- 在 Debian/Ubuntu 上 --------------
$ sudo apt-get install git python-pip
-------------- 在 CentOS/RHEL 上 --------------
# yum install epel-release
# yum install git python-pip
-------------- 在 Fedora 22+ 上 --------------
# dnf install git python-pip
```

2、如果安装好了 git 和 Python pip，那么接下来，像下面这样安装 `virtualenv`，它有助于处理针对 Python 项目的依赖关系：

```
# pip install virtualenv
或
$ sudo pip install virtualenv
```

3、现在，像下面这样使用 `git` 命令，把 pyDash 仓库克隆到 home 目录中：

```
# git clone https://github.com/k3oni/pydash.git
# cd pydash
```

4、下一步，使用下面的 `virtualenv` 命令为项目创建一个叫做 `pydashtest` 虚拟环境：

```
$ virtualenv pydashtest #give a name for your virtual environment like pydashtest
```
[
 ![Create Virtual Environment](http://www.tecmint.com/wp-content/uploads/2017/03/create-virtual-environment.png)
][3]

*创建虚拟环境*

重要：请注意，上面的屏幕截图中，虚拟环境的 `bin` 目录被高亮显示，你的可能和这不一样，取决于你把 pyDash 目录克隆到什么位置。

5、创建好虚拟环境（`pydashtest`）以后，你需要在使用前像下面这样激活它：

```
$ source /home/aaronkilik/pydash/pydashtest/bin/activate
```
[
 ![Active Virtual Environment](http://www.tecmint.com/wp-content/uploads/2017/03/after-activating-virtualenv.png)
][4]

*激活虚拟环境*

从上面的屏幕截图中，你可以注意到，提示字符串 1（`PS1`）已经发生改变，这表明虚拟环境已经被激活，而且可以开始使用。

6、现在，安装 pydash 项目 requirements；如何你好奇的话，可以使用 [cat 命令][5]查看 `requirements.txt` 的内容，然后像下面所示那样进行安装：

```
$ cat requirements.txt
$ pip install -r requirements.txt
```

7、现在，进入 `pydash` 目录，里面包含一个名为 `settings.py` 的文件，也可直接运行下面的命令打开这个文件，然后把 `SECRET_KEY` 改为一个特定值：

```
$ vi pydash/settings.py
```
[
 ![Set Secret Key](http://www.tecmint.com/wp-content/uploads/2017/03/change-secret-key.png)
][6]

*设置密匙*

保存文件然后退出。

8、之后，运行下面的命令来创建一个项目数据库和安装 Django 的身份验证系统，并创建一个项目的超级用户：

```
$ python manage.py syncdb
```

根据你的情况回答下面的问题：

```
Would you like to create one now? (yes/no): yes
Username (leave blank to use 'root'): admin
Email address: aaronkilik@gmail.com
Password: ###########
Password (again): ############
```
[
 ![Create Project Database](http://www.tecmint.com/wp-content/uploads/2017/03/python-manage.py-syncdb.png)
][7]

*创建项目数据库*

9、这个时候，一切都设置好了，然后，运行下面的命令来启用 Django 开发服务器：

```
$ python manage.py runserver
```

10、接下来，打开你的 web 浏览器，输入网址：`http://127.0.0.1:8000/` 进入 web 控制台登录界面，输入你在第 8 步中创建数据库和安装 Django 身份验证系统时创建的超级用户名和密码，然后点击登录。

[
 ![pyDash Login Interface](http://www.tecmint.com/wp-content/uploads/2017/03/pyDash-web-login-interface.png)
][8]

*pyDash 登录界面*

11、登录到 pydash 主页面以后，你将会可以看到监测系统的基本信息，包括 CPU、内存和硬盘使用量以及系统平均负载。

向下滚动便可查看更多部分的信息。

[
 ![pyDash Server Performance Overview](http://www.tecmint.com/wp-content/uploads/2017/03/pyDash-Server-Performance-Overview.png)
][9]

*pydash 服务器性能概述*

12、下一个屏幕截图显示的是一段 pydash 的跟踪界面，包括 IP 地址、互联网流量、硬盘读/写、在线用户以及 netstats 。

[
 ![pyDash Network Overview](http://www.tecmint.com/wp-content/uploads/2017/03/pyDash-Network-Overview.png)
][10]

*pyDash 网络概述*

13、下一个 pydash 主页面的截图显示了一部分系统中被监视的活跃进程。


[
 ![pyDash Active Linux Processes](http://www.tecmint.com/wp-content/uploads/2017/03/pyDash-Active-Linux-Processes.png)
][11]

*pyDash 监视活跃 Linux 进程*

如果想了解更多信息，请在 GitHub 上查看 pydash：[https://github.com/k3oni/pydash][12]

这就是全部内容了。在这篇文章中，我们展示了在 Linux 中如何安装 pyDash 并测试它的主要特性。如果你有什么想法，可以通过下面的反馈部分联系我们；如果你知道任何有用或类似的工具，也可以在评论中告知我们。

--------------------------------------------------------------------------------


作者简介：

我叫 Ravi Saive，是 TecMint 的原创作者，是一个喜欢在网上分享技巧和知识的计算机极客和 Linux Guru。我的大多数服务器都运行在 Linux 开源平台上。请关注我：[Twitter][10]、[Facebook][01] 以及 [Google+][02] 。

--------------------------------------------------------------------------------


via: http://www.tecmint.com/pydash-a-web-based-linux-performance-monitoring-tool/

作者：[Ravi Saive][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[00]:https://twitter.com/ravisaive
[01]:https://www.facebook.com/ravi.saive
[02]:https://plus.google.com/u/0/+RaviSaive

[1]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[2]:http://www.tecmint.com/install-and-configure-django-web-framework-in-centos-debian-ubuntu/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/create-virtual-environment.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/after-activating-virtualenv.png
[5]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/change-secret-key.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/python-manage.py-syncdb.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/pyDash-web-login-interface.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/pyDash-Server-Performance-Overview.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/pyDash-Network-Overview.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/pyDash-Active-Linux-Processes.png
[12]:https://github.com/k3oni/pydash
[13]:http://www.tecmint.com/author/admin/
[14]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[15]:http://www.tecmint.com/free-linux-shell-scripting-books/
