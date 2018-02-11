Ansible 教程：简单 Ansible 命令介绍
======

在我们之前的 Ansible 教程中，我们讨论了 [Ansible 的安装和配置][1]。在这个 Ansible 教程中，我们将学习一些基本的 Ansible 命令的例子，我们将用它来管理基础设施。所以让我们先看看一个完整的 Ansible 命令的语法：

```
$ ansible <group> -m <module> -a <arguments>
```

在这里，我们可以用单个主机或用 `<group>` 代替一组主机，`<arguments>` 是可选的参数。现在我们来看看一些 Ansible 的基本命令。	

### 检查主机的连通性

我们在之前的教程中也使用了这个命令。检查主机连接的命令是：

```
$ ansible <group> -m ping
```

### 重启主机

```
$ ansible <group> -a "/sbin/reboot"
```

### 检查主机的系统信息

Ansible 收集所有连接到它主机的信息。要显示主机的信息，请运行：

```
$ ansible <group> -m setup | less
```

其次，通过传递参数来从收集的信息中检查特定的信息：

```
$ ansible <group> -m setup -a "filter=ansible_distribution"
```

### 传输文件

对于传输文件，我们使用模块 “copy” ，完整的命令是这样的：

```
$ ansible <group> -m copy -a "src=/home/dan dest=/tmp/home"
```

### 管理用户

要管理已连接主机上的用户，我们使用一个名为 “user” 的模块，并如下使用它。

#### 创建新用户

```
$ ansible <group> -m user -a "name=testuser password=<encrypted password>"
```

#### 删除用户

```
$ ansible <group> -m user -a "name=testuser state=absent"
```

**注意：** 要创建加密密码，请使用 `"mkpasswd -method=sha-512"`。

### 更改权限和所有者

要改变已连接主机文件的所有者，我们使用名为 ”file“ 的模块，使用如下。

#### 更改文件权限

```
$ ansible <group> -m file -a "dest=/home/dan/file1.txt mode=777"
```

#### 更改文件的所有者

```
$ ansible <group> -m file -a "dest=/home/dan/file1.txt mode=777 owner=dan group=dan"
```

### 管理软件包

我们可以通过使用 ”yum“ 和 ”apt“ 模块来管理所有已连接主机的软件包，完整的命令如下：

#### 检查包是否已安装并更新

```
$ ansible <group> -m yum -a "name=ntp state=latest"
```

#### 检查包是否已安装，但不更新

```
$ ansible <group> -m yum -a "name=ntp state=present"
```

#### 检查包是否是特定的版本

```
$ ansible <group> -m yum -a "name= ntp-1.8 state=present"
```

#### 检查包是否没有安装

```
$ ansible <group> -m yum -a "name=ntp state=absent"
```

### 管理服务

要管理服务，我们使用模块 “service” ，完整命令如下：

#### 启动服务

```
$ansible <group> -m service -a "name=httpd state=started"
```

#### 停止服务

```
$ ansible <group> -m service -a "name=httpd state=stopped"
```

#### 重启服务

```
$ ansible <group> -m service -a "name=httpd state=restarted"
```

这样我们简单的，单行 Ansible 命令的教程就完成了。此外，在未来的教程中，我们将学习创建 playbook，来帮助我们更轻松高效地管理主机。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/ansible-tutorial-simple-commands/

作者：[SHUSAIN][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/create-first-ansible-server-automation-setup/
[2]:https://www.facebook.com/linuxtechlab/
[3]:https://twitter.com/LinuxTechLab
[4]:https://plus.google.com/+linuxtechlab
[5]:http://linuxtechlab.com/contact-us-2/
