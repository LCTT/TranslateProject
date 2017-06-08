rdiff-backup：一个 Linux 中的远程增量备份工具
============================================================

rdiff-backup 是一个用于本地/远程增量备份的强大而易用的 Python 脚本，它适用于任何 POSIX 操作系统，如Linux、Mac OS X 或 [Cygwin][1]。它集合了镜像和增量备份的显著特性。

值得注意的是，它保留了子目录、dev 文件、硬链接，以及关键的文件属性，如权限、uid/gid 所有权、修改时间、扩展属性、acl 以及 resource fork。它可以通过管道以高效带宽的模式工作，这与流行的 [rsync 备份工具][2]类似。

rdiff-backup 通过使用 SSH 将单个目录备份到另一个目录，这意味着数据传输被加密并且是安全的。目标目录（在远程系统上）最终会得到源目录的完整副本，但是此外的反向差异会存储在目标目录的特殊子目录中，从而可以恢复前一段时间丢失的文件。

### 依赖

要在 Linux 中使用 rdiff-backup，你需要在系统上安装以下软件包：

* Python v2.2 或更高版本
* librsync v0.9.7 或更高版本
* pylibacl 和 pyxattr Python 模块是可选的，但它们分别是 POSIX 访问控制列表（ACL）和扩展属性支持必需的。
* rdiff-backup-statistics 需要 Python v2.4 或更高版本。

### 如何在 Linux 中安装 rdiff-backup

重要：如果你通过网络运行它，则必须在两个系统中都安装 rdiff-backup，两者最好是相同版本。

该脚本已经存在于主流 Linux 发行版的官方仓库中，只需运行以下命令来安装 rdiff-backup 及其依赖关系：

#### 在 Debian/Ubuntu 中

```
$ sudo apt-get update
$ sudo apt-get install librsync-dev rdiff-backup
```

#### 在 CentOS/RHEL 7 中

```
# wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
# rpm -ivh epel-release-7-9.noarch.rpm
# yum install librsync rdiff-backup
```

#### 在 CentOS/RHEL 6 中

```
# wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
# rpm -ivh epel-release-6-8.noarch.rpm
# yum install librsync rdiff-backup
```

#### 在 Fedora 中

```
# yum install librsync rdiff-backup
# dnf install librsync rdiff-backup [Fedora 22+]
```

### 如何在 Linux 中使用 rdiff-backup

如前所述，rdiff-backup 使用 SSH 连接到网络上的远程计算机，SSH 的默认身份验证方式是用户名/密码，这通常需要人工交互。

但是，要自动执行诸如脚本等自动备份之类的任务，那么你需要配置[使用 SSH 密钥无密码登录 SSH][3]，因为 SSH 密钥增加了两台 Linux服务器之间的信任来[简化文件同步或传输][4]。

在你设置了 [SSH 无密码登录][5]后，你可以使用下面的例子开始使用该脚本。

#### 备份文件到不同分区

下面的例子会备份 `/etc` 文件夹到另外一个分区的 `Backup` 文件夹内：

```
$ sudo rdiff-backup /etc /media/aaronkilik/Data/Backup/mint_etc.backup
```
[
 ![Backup Files to Different Partition](http://www.tecmint.com/wp-content/uploads/2017/03/Backup-Files-to-Different-Partition.png) 
][6]

*备份文件到不同分区*

要排除一个特定文件夹和它的子目录，你可以如下使用 `--exclude` 选项：

```
$ sudo rdiff-backup --exclude /etc/cockpit --exclude /etc/bluetooth /media/aaronkilik/Data/Backup/mint_etc.backup
```

我们可以如下使用 `--include-special-files` 包含所有的设备文件、fifo 文件、socket 文件和链接文件：

```
$ sudo rdiff-backup --include-special-files --exclude /etc/cockpit /media/aaronkilik/Data/Backup/mint_etc.backup
```

还有另外两个重要标志来用于选择文件，`--max-file-size` 用来排除大于给定字节大小的文件，`--min-file-size` 用于排除小于给定字节大小的文件：

```
$ sudo rdiff-backup --max-file-size 5M --include-special-files --exclude /etc/cockpit /media/aaronkilik/Data/Backup/mint_etc.backup
```

#### 在本地 Linux 服务器上备份远程文件

要这么做，我们使用：

```
Remote Server (tecmint)	        : 192.168.56.102 
Local Backup Server (backup) 	: 192.168.56.10
```

如前所述，你必须在两台机器上安装相同版本的 rdiff-backup，如下所示，请尝试在两台机器上检查版本：

```
$ rdiff-backup -V
```
[
 ![Check rdiff Version on Servers](http://www.tecmint.com/wp-content/uploads/2017/03/check-rdif-versions-on-servers.png) 
][7]

*检查服务器中 rdiff 版本*

在备份服务器中，像这样创建一个存储备份文件的目录：

```
# mkdir -p /backups
```

现在在备份服务器中，运行下面的命令来将远程 Linux 服务器 192.168.56.102 中的 `/var/log/` 和 `/root` 备份到 `/backups` 中：

```
# rdiff-backup root@192.168.56.102::/var/log/ /backups/192.168.56.102_logs.backup
# rdiff-backup root@192.168.56.102::/root/ /backups/192.168.56.102_rootfiles.backup
```

下面的截图展示了远程服务器 192.168.56.102 中的 `root` 文件夹以及 192.168.56.10 备份服务器中的已备份文件：

[
 ![Backup Remote Directory on Local Server](http://www.tecmint.com/wp-content/uploads/2017/03/Backup-Remote-Linux-Directory-on-Local-Server.png) 
][8]

*在本地服务器备份远程目录*

注意截图中 “backup” 目录中创建的 rdiff-backup-data 文件夹，它包含了备份过程和增量文件的重要数据。

[
 ![rdiff-backup - Backup Process Files](http://www.tecmint.com/wp-content/uploads/2017/03/rdiff-backup-data-directory-contents.png) 
][9]

*rdiff-backup – 备份过程文件*

现在，在 192.168.56.102 服务器中，如下所示 `root` 目录已经添加了额外的文件：

[
 ![Verify Backup Directory](http://www.tecmint.com/wp-content/uploads/2017/03/additional-files-in-root-directory.png) 
][10]

*验证备份目录*

让我们再次运行备份命令以获取更改的数据，我们可以使用 `-v[0-9]`（其中数字指定详细程度级别，默认值为 3，这是静默模式）选项设置详细功能：

```
# rdiff-backup -v4 root@192.168.56.102::/root/ /backups/192.168.56.102_rootfiles.backup 
```
[
 ![Incremental Backup with Summary](http://www.tecmint.com/wp-content/uploads/2017/03/incremental-backup-of-root-files.png) 
][11]

*带有摘要的增量备份*

要列出 `/backups/192.168.56.102_rootfiles.backup` 目录中包含的部分增量备份的数量和日期，我们可以运行：

```
# rdiff-backup -l /backups/192.168.56.102_rootfiles.backup/
```

#### 使用 cron 自动进行  rdiff-back 备份

使用 `--print-statistics` 成功备份后，我们可以打印摘要统计信息。但是，如果我们不设置此选项，我们可以仍从会话统计中获得。在手册页的 “STATISTICS” 部分中阅读有关此选项的更多信息。

`-remote-schema` 选项使我们能够指定使用替代方法连接到远程计算机。

现在，我们开始在备份服务器 192.168.56.10 上创建一个 `backup.sh` 脚本，如下所示：

```
# cd ~/bin
# vi backup.sh
```

添加下面的行到脚本中。

```
#!/bin/bash
#This is a rdiff-backup utility backup script
#Backup command
rdiff-backup --print-statistics --remote-schema 'ssh -C %s "sudo /usr/bin/rdiff-backup --server --restrict-read-only  /"'  root@192.168.56.102::/var/logs  /backups/192.168.56.102_logs.back
#Checking rdiff-backup command success/error
status=$?
if [ $status != 0 ]; then
#append error message in ~/backup.log file
echo "rdiff-backup exit Code: $status - Command Unsuccessful" >>~/backup.log;
exit 1;
fi
#Remove incremental backup files older than one month
rdiff-backup --force --remove-older-than 1M /backups/192.168.56.102_logs.back
```

保存文件并退出，接着运行下面的命令在服务器 192.168.56.10 上的 crontab 中添加此脚本：

```
# crontab -e
```

添加此行在每天午夜运行你的备份脚本：

```
0   0  *  *  * /root/bin/backup.sh > /dev/null 2>&1
```

保存 crontab 并退出，现在我们已经成功自动化了备份过程。确保一切如希望那样工作。

阅读 rdiff-backup 的手册页获取更多信息、详尽的使用选项以及示例：

```
# man rdiff-backup
```

rdiff-backup 主页： [http://www.nongnu.org/rdiff-backup/][12]

就是这样了！在本教程中，我们向你展示了如何安装并基础地使用 rdiff-backup 这个易于使用的 Python 脚本，用于 Linux 中的本地/远程增量备份。 请通过下面的反馈栏与我们分享你的想法。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin 和 web 开发人员，目前是 TecMint 的内容创建者，他喜欢用电脑工作，并坚信分享知识。


------------

via: http://www.tecmint.com/rdiff-backup-remote-incremental-backup-for-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/install-cygwin-to-run-linux-commands-on-windows-system/
[2]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[3]:https://linux.cn/article-6901-1.html
[4]:http://www.tecmint.com/sync-new-changed-modified-files-rsync-linux/
[5]:https://linux.cn/article-6901-1.html
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Backup-Files-to-Different-Partition.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/check-rdif-versions-on-servers.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Backup-Remote-Linux-Directory-on-Local-Server.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/rdiff-backup-data-directory-contents.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/additional-files-in-root-directory.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/incremental-backup-of-root-files.png
[12]:http://www.nongnu.org/rdiff-backup/
[13]:http://www.tecmint.com/author/aaronkili/
[14]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[15]:http://www.tecmint.com/free-linux-shell-scripting-books/
