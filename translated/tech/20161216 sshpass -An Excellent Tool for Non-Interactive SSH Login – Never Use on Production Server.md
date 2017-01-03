sshpass：一个很棒的无交互SSH登录工具 - 不要在生产服务器上使用
============================================================

在大多数情况下，Linux系统管理员使用SSH通过密码或[无密码SSH登录][1]或基于密钥的SSH身份验证登录到远程Linux服务器。

如果你想自动在SSH中提供密码和用户名怎么办？这是可以用sshpass了。

sshpass是一个简单、轻量级的命令行工具，使我们能够向命令提示符本身提供密码（非交互式密码验证），以便可以通过[cron调度器][2]执行自动化的shell脚本进行备份。

ssh直接使用TTY访问，以确保密码是用户键盘输入的。 sshpass在专门的tty中运行ssh，以误导它相信它是从用户接收到的密码。

重要：使用sshpass被认为是最不安全的，因为它通过简单的“ps”命令就可在命令行上显示所有系统用户的密码。我强烈建议使用[SSH无密码身份验证][3]。

### 在Linux中安装sshpass

在基于RedHat/CentOS的系统中，首先需要[启用Epel仓库][4]并使用[yum命令安装][5]它。

```
# yum install sshpass
# dnf install sshpass    [On Fedora 22+ versions]
```

在Debian/Ubuntu和它的衍生版中，你可以使用[apt-get命令][6]来安装。

```
$ sudo apt-get install sshpass
```

另外你也可以从最新的源码安装sshpass，首先下载源码并从tar文件中解压出内容：

```
$ wget http://sourceforge.net/projects/sshpass/files/latest/download -O sshpass.tar.gz
$ tar -xvf sshpass.tar.gz
$ cd sshpass-1.06
$ ./configure
# sudo make install 
```

### 如何在Linux中使用sshpass

sshpass与ssh一起使用，可以使用下面的命令查看sshpass的使用使用选项的完整描述：

```
$ sshpass -h
```
sshpass Help
```
Usage: sshpass [-f|-d|-p|-e] [-hV] command parameters
-f filename   Take password to use from file
-d number     Use number as file descriptor for getting password
-p password   Provide password as argument (security unwise)
-e            Password is passed as env-var "SSHPASS"
With no parameters - password will be taken from stdin
-h            Show help (this screen)
-V            Print version information
At most one of -f, -d, -p or -e should be used
```

正如我之前提到的，sshpass在用于脚本时才更可靠及更有用，考虑下面的示例命令。

使用用户名和密码登录到远程Linux ssh服务器（10.42.0.1），并如图所示[检查文件系统磁盘使用情况] [7]。

```
$ sshpass -p 'my_pass_here' ssh aaronkilik@10.42.0.1 'df -h' 
```

重要提示：此处，密码在命令行中提供，实际上不安全，不建议使用此选项。

[
 ![sshpass - Linux Remote Login via SSH](http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Linux-Remote-Login.png) 
][8]

sshpass – 使用SSH远程登录Linux

但是，为了防止在屏幕上显示密码，可以使用`-e`标志，并输入密码作为SSHPASS环境变量的值，如下所示：

```
$ export SSHPASS='my_pass_here'
$ echo $SSHPASS
$ sshpass -e ssh aaronkilik@10.42.0.1 'df -h' 
```
[
 ![sshpass - Hide Password in Prompt](http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Hide-Password-in-Prompt.png) 
][9]

sshpass – 在终端中隐藏密码

注意：在上面的示例中，SSHPASS环境变量仅用于临时目的，并将在重新启动后删除。

要永久设置SSHPASS环境变量，打开/etc/profile文件，并在文件开头输入export语句：

```
export SSHPASS='my_pass_here'
```

保存文件并退出，接着运行下面的命令使更改生效：

```
$ source /etc/profile 
```

另一方面，你也可以使用`-f'标志，并把密码放在一个文件中。 这样，您可以从文件中读取密码，如下所示：

```
$ sshpass -f password_filename ssh aaronkilik@10.42.0.1 'df -h'
```
[
 ![sshpass - Supply Password File to Login](http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Provide-Password-File.png) 
][10]

sshpass – 在登录时提供密码文件

你也可以使用sshpass[使用scp传输文件][11]或者[使用rsync备份/同步文件][12]，如下所示：

```
------- Transfer Files Using SCP ------- 
$ scp -r /var/www/html/example.com --rsh="sshpass -p 'my_pass_here' ssh -l aaronkilik" 10.42.0.1:/var/www/html
------- Backup or Sync Files Using Rsync -------
$ rsync --rsh="sshpass -p 'my_pass_here' ssh -l aaronkilik" 10.42.0.1:/data/backup/ /backup/
```

更多的用法，我建议你阅读一下sshpass的man页面，输入：

```
$ man sshpass
```

在本文中，我们解释了sshpass是一个启用非交互式密码验证的简单工具。 虽然这个工具可能是有帮助的，但是强烈建议使用更安全的ssh公钥认证机制。

请在下面的评论栏写下任何问题或评论，以便可以进一步讨论。

--------------------------------------------------------------------------------

作者简介：Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

-----------

via: http://www.tecmint.com/sshpass-non-interactive-ssh-login-shell-script-ssh-password/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[2]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[3]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[4]:http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[5]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[6]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[7]:http://www.tecmint.com/how-to-check-disk-space-in-linux/
[8]:http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Linux-Remote-Login.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Hide-Password-in-Prompt.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Provide-Password-File.png
[11]:http://www.tecmint.com/scp-commands-examples/
[12]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
