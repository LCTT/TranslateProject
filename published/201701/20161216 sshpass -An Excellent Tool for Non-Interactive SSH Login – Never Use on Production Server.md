sshpass：一个很棒的免交互 SSH 登录工具，但不要用在生产服务器上
============================================================

在大多数情况下，Linux 系统管理员使用 SSH 登录到程 Linux 服务器时，要么是通过密码，要么是[无密码 SSH 登录][1]或基于密钥的 SSH 身份验证。

如果你想自动在 SSH 登录提示符中提供**密码**和**用户名**怎么办？这时 **sshpass** 就可以帮到你了。

sshpass 是一个简单、轻量级的命令行工具，通过它我们能够向命令提示符本身提供密码（非交互式密码验证），这样就可以通过 [cron 调度器][2]执行自动化的 shell 脚本进行备份。

ssh 直接使用 TTY 访问，以确保密码是用户键盘输入的。 sshpass 在专门的 tty 中运行 ssh，以误导 ssh 相信它是从用户接收到的密码。

重要：使用 **sshpass** 是最不安全的，因为所有系统上的用户在命令行中通过简单的 “**ps**” 命令就可看到密码。因此，如果必要，比如说在生产环境，我强烈建议使用 [SSH 无密码身份验证][3]。

### 在 Linux 中安装 sshpass

在基于 **RedHat/CentOS** 的系统中，首先需要[启用 Epel 仓库][4]并使用 [yum 命令][5]安装它。

```
# yum install sshpass
# dnf install sshpass    [Fedora 22 及以上版本]
```

在 Debian/Ubuntu 和它的衍生版中，你可以使用 [apt-get 命令][6]来安装。

```
$ sudo apt-get install sshpass
```

另外，你也可以从最新的源码安装 `sshpass`，首先下载源码并从 tar 文件中解压出内容：

```
$ wget http://sourceforge.net/projects/sshpass/files/latest/download -O sshpass.tar.gz
$ tar -xvf sshpass.tar.gz
$ cd sshpass-1.06
$ ./configure
# sudo make install 
```

### 如何在 Linux 中使用 sshpass

**sshpass** 与 **ssh** 一起使用，使用下面的命令可以查看 `sshpass` 的使用选项的完整描述：

```
$ sshpass -h
```

下面为显示的 sshpass 帮助内容：

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

正如我之前提到的，**sshpass** 在用于脚本时才更可靠及更有用，请看下面的示例命令。

使用用户名和密码登录到远程 Linux ssh 服务器（10.42.0.1），并[检查文件系统磁盘使用情况][7]，如图所示。

```
$ sshpass -p 'my_pass_here' ssh aaronkilik@10.42.0.1 'df -h' 
```

**重要提示**：此处，在命令行中提供了密码，这是不安全的，不建议使用此选项。

[
 ![sshpass - Linux Remote Login via SSH](http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Linux-Remote-Login.png) 
][8]

*sshpass – 使用 SSH 远程登录 Linux*

但是，为了防止在屏幕上显示密码，可以使用 `-e` 标志，并将密码作为 SSHPASS 环境变量的值输入，如下所示：

```
$ export SSHPASS='my_pass_here'
$ echo $SSHPASS
$ sshpass -e ssh aaronkilik@10.42.0.1 'df -h' 
```

[
 ![sshpass - Hide Password in Prompt](http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Hide-Password-in-Prompt.png) 
][9]

*sshpass – 在终端中隐藏密码*

**注意：**在上面的示例中，`SSHPASS` 环境变量仅用于临时目的，并将在重新启动后删除。

要永久设置 `SSHPASS` 环境变量，打开 `/etc/profile` 文件，并在文件开头输入 `export` 语句：

```
export SSHPASS='my_pass_here'
```

保存文件并退出，接着运行下面的命令使更改生效：

```
$ source /etc/profile 
```

另外，也可以使用 `-f` 标志，并把密码放在一个文件中。 这样，您可以从文件中读取密码，如下所示：

```
$ sshpass -f password_filename ssh aaronkilik@10.42.0.1 'df -h'
```
[
 ![sshpass - Supply Password File to Login](http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Provide-Password-File.png) 
][10]

*sshpass – 在登录时提供密码文件*

你也可以使用 `sshpass` [通过 scp 传输文件][11]或者 [rsync 备份/同步文件][12]，如下所示：

```
------- Transfer Files Using SCP ------- 
$ scp -r /var/www/html/example.com --rsh="sshpass -p 'my_pass_here' ssh -l aaronkilik" 10.42.0.1:/var/www/html
------- Backup or Sync Files Using Rsync -------
$ rsync --rsh="sshpass -p 'my_pass_here' ssh -l aaronkilik" 10.42.0.1:/data/backup/ /backup/
```

更多的用法，建议阅读 `sshpass` 的 man 页面，输入：

```
$ man sshpass
```

在本文中，我们解释了 `sshpass` 是一个非交互式密码验证的简单工具。 虽然这个工具可能是有帮助的，但还是强烈建议使用更安全的 ssh 公钥认证机制。

请在下面的评论栏写下任何问题或评论，以便可以进一步讨论。

--------------------------------------------------------------------------------

作者简介：Aaron Kili 是一位 Linux 和 F.O.S.S 爱好者，未来的 Linux 系统管理员，web 开发人员， 还是 TecMint 原创作者，热爱电脑工作，并乐于分享知识。

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
[4]:https://linux.cn/article-2324-1.html
[5]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[6]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[7]:http://www.tecmint.com/how-to-check-disk-space-in-linux/
[8]:http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Linux-Remote-Login.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Hide-Password-in-Prompt.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/sshpass-Provide-Password-File.png
[11]:http://www.tecmint.com/scp-commands-examples/
[12]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
