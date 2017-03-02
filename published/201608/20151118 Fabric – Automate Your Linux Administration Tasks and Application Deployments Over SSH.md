Fabric - 通过 SSH 来自动化管理 Linux 任务和布署应用
===========================

当要管理远程机器或者要布署应用时，虽然你有多种命令行工具可以选择，但是其中很多工具都缺少详细的使用文档。

在这篇教程中，我们将会一步一步地向你介绍如何使用 fabric 来帮助你更好得管理多台服务器。

![](http://www.tecmint.com/wp-content/uploads/2015/11/Automate-Linux-Administration-Tasks-Using-Fabric.png)

*使用 Fabric 来自动化地管理 Linux 任务*

Fabric 是一个用 Python 编写的命令行工具库，它可以帮助系统管理员高效地执行某些任务，比如通过 SSH 到多台机器上执行某些命令，远程布署应用等。

在使用之前，如果你拥有使用 Python 的经验能帮你更好的使用 Fabric。当然，如果没有那也不影响使用 Fabric。

我们为什么要选择 Fabric：

- 简单
- 完备的文档
- 如果你会 Python，不用增加学习其他语言的成本
- 易于安装使用
- 使用便捷
- 支持多台机器并行操作

### 在 Linux 上如何安装 Fabric

Fabric 有一个特点就是要远程操作的机器只需要支持标准的 OpenSSH 服务即可。只要保证在机器上安装并开启了这个服务就能使用 Fabric 来管理机器。

#### 依赖

- Python 2.5 或更新版本，以及对应的开发组件
- Python-setuptools 和 pip（可选，但是非常推荐）gcc

我们推荐使用 pip 安装 Fabric，但是你也可以使用系统自带的包管理器如 `yum`, `dnf` 或 `apt-get` 来安装，包名一般是 `fabric` 或 `python-fabric`。

如果是基于 RHEL/CentOS 的发行版本的系统，你可以使用系统自带的 [EPEL 源][1] 来安装 fabric。

```
# yum install fabric   [适用于基于 RedHat 系统]
# dnf install fabric   [适用于 Fedora 22+ 版本]
```

如果你是 Debian 或者其派生的系统如 Ubuntu 和 Mint 的用户，你可以使用 apt-get 来安装，如下所示：

```
# apt-get install fabric
```

如果你要安装开发版的 Fabric，你需要安装 pip 来安装 master 分支上最新版本。

```
# yum install python-pip       [适用于基于 RedHat 系统]
# dnf install python-pip       [适用于Fedora 22+ 版本]
# apt-get install python-pip   [适用于基于 Debian 系统]
```

安装好 pip 后，你可以使用 pip 获取最新版本的 Fabric。

```
# pip install fabric
```

### 如何使用 Fabric 来自动化管理 Linux 任务

现在我们来开始使用 Fabric，在之前的安装的过程中，Fabric Python 脚本已经被放到我们的系统目录，当我们要运行 Fabric 时输入 `fab` 命令即可。

#### 在本地 Linux 机器上运行命令行

按照惯例，先用你喜欢的编辑器创建一个名为 fabfile.py 的 Python 脚本。你可以使用其他名字来命名脚本，但是就需要指定这个脚本的路径，如下所示：

```
# fabric --fabfile /path/to/the/file.py
```

Fabric 使用 `fabfile.py` 来执行任务，这个文件应该放在你执行 Fabric 命令的目录里面。

**例子 1**：创建入门的 `Hello World` 任务：

```
# vi fabfile.py
```

在文件内输入如下内容：

```
def hello():
    print('Hello world, Tecmint community')
```

保存文件并执行以下命令：

```
# fab hello
```

![](http://www.tecmint.com/wp-content/uploads/2015/11/Create-Fabric-Fab-Python-File.gif)

*Fabric 工具使用说明*

**例子 2**：新建一个名为 fabfile.py 的文件并打开：

粘贴以下代码至文件：

```
#!  /usr/bin/env python
from fabric.api import local
def uptime():
    local('uptime')
```

保存文件并执行以下命令：

```
# fab uptime
```

![](http://www.tecmint.com/wp-content/uploads/2015/11/Fabric-Uptime.gif)

*Fabric: 检查系统运行时间*

让我们看看这个例子，fabfile.py 文件在本机执行了 uptime 这个命令。

#### 在远程 Linux 机器上运行命令来执行自动化任务

Fabric API 使用了一个名为 `env` 的关联数组（Python 中的词典）作为配置目录，来储存 Fabric 要控制的机器的相关信息。

`env.hosts` 是一个用来存储你要执行 Fabric 任务的机器的列表，如果你的 IP 地址是 192.168.0.0，想要用 Fabric 来管理地址为 192.168.0.2 和 192.168.0.6 的机器，需要的配置如下所示：

```
#!/usr/bin/env python
from fabric.api import env
    env.hosts = [ '192.168.0.2', '192.168.0.6' ]
```

上面这几行代码只是声明了你要执行 Fabric 任务的主机地址，但是实际上并没有执行任何任务，下面我们就来定义一些任务。Fabric 提供了一系列可以与远程服务器交互的方法。

Fabric 提供了众多的方法，这里列出几个经常会用到的：

- run - 可以在远程机器上运行的 shell 命令
- local - 可以在本机上运行的 shell 命令
- sudo - 使用 root 权限在远程机器上运行的 shell 命令
- get - 从远程机器上下载一个或多个文件
- put - 上传一个或多个文件到远程机器

**例子 3**：在多台机子上输出信息，新建新的 fabfile.py 文件如下所示

```
#!/usr/bin/env python
from fabric.api import env, run
env.hosts = ['192.168.0.2','192.168.0.6']
def echo():
    run("echo -n 'Hello, you are tuned to Tecmint ' ")
```

运行以下命令执行 Fabric 任务

```
# fab echo
```

![](http://www.tecmint.com/wp-content/uploads/2015/11/Fabrick-Automate-Linux-Tasks.gif)

*fabric: 自动在远程 Linux 机器上执行任务*

**例子 4**：你可以继续改进之前创建的执行 uptime 任务的 fabfile.py 文件，让它可以在多台服务器上运行 uptime 命令，也可以检查其磁盘使用情况，如下所示：

```
#!/usr/bin/env python
from fabric.api import env, run
env.hosts = ['192.168.0.2','192.168.0.6']
def uptime():
    run('uptime')
def disk_space():
    run('df -h')
```

保存并执行以下命令

```
# fab uptime
# fab disk_space
```

![](http://www.tecmint.com/wp-content/uploads/2015/11/Fabric-Run-Multiple-Commands-on-Multiple-Linux-Systems.gif)

*Fabric：自动在多台服务器上执行任务*

#### 在远程服务器上自动化布署 LAMP

**例子 5**：我们来尝试一下在远程服务器上布署 LAMP（Linux, Apache, MySQL/MariaDB and PHP）

我们要写个函数在远程使用 root 权限安装 LAMP。

##### 在 RHEL/CentOS 或 Fedora 上

```
#!/usr/bin/env python
from fabric.api import env, run
env.hosts = ['192.168.0.2','192.168.0.6']
def deploy_lamp():
    run ("yum install -y httpd mariadb-server php php-mysql")
```

##### 在 Debian/Ubuntu 或 Linux Mint 上

```
#!/usr/bin/env python
from fabric.api import env, run
env.hosts = ['192.168.0.2','192.168.0.6']
def deploy_lamp():
    sudo("apt-get install -q apache2 mysql-server libapache2-mod-php5 php5-mysql")
```

保存并执行以下命令：

```
# fab deploy_lamp
```

注：由于安装时会输出大量信息，这个例子我们就不提供屏幕 gif 图了

现在你可以使用 Fabric 和上文例子所示的功能来[自动化的管理 Linux 服务器上的任务][2]了。

#### 一些 Fabric 有用的选项

- 你可以运行 `fab -help` 输出帮助信息，里面列出了所有可以使用的命令行信息
- `–fabfile=PATH` 选项可以让你定义除了名为 fabfile.py 之外的模块
- 如果你想用指定的用户名登录远程主机，请使用 `-user=USER` 选项
- 如果你需要密码进行验证或者 sudo 提权，请使用 `–password=PASSWORD` 选项
- 如果需要输出某个命令的详细信息，请使用 `–display=命令名` 选项
- 使用 `--list` 输出所有可用的任务
- 使用 `--list-format=FORMAT` 选项能格式化 `-list` 选项输出的信息，可选的有 short、normal、 nested
- `--config=PATH` 选项可以指定读取配置文件的地址
- `-–colorize-errors` 能显示彩色的错误输出信息
- `--version` 输出当前版本

### 总结

Fabric 是一个强大并且文档完备的工具，对于新手来说也能很快上手，阅读提供的文档能帮助你更好的了解它。如果你在安装和使用 Fabric 时发现什么问题可以在评论区留言，我们会及时回复。

参考：[Fabric 文档][3]


--------------------------------------------------------------------------------

via: http://www.tecmint.com/automating-linux-system-administration-tasks/

作者：[Aaron Kili][a]
译者：[NearTan](https://github.com/NearTan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: https://linux.cn/article-2324-1.html
[2]: http://www.tecmint.com/use-ansible-playbooks-to-automate-complex-tasks-on-multiple-linux-servers/
[3]: http://docs.fabfile.org/en/1.4.0/usage/env.html
