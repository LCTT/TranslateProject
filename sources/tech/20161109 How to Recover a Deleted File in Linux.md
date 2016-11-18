# How to Recover a Deleted File in Linux
# 在 Linux 中如何还原一个删除了的文件

Did this ever happen to you? You realized that you had mistakenly deleted a file – either through the Del key, or using `rm` in the command line.
你曾经是否遇到这样的事？你意识到你已经通过删除键或者在命令行中使用 ‘rm’ 命令错误的删除了一个不该删除的文件。

In the first case, you can always go to the Trash, [search for the file][6], and restore it to its original location. But what about the second case? As I am sure you probably know, the Linux command line does not send removed files anywhere – it REMOVES them. Bum. They’re gone.
在第一种情况下，你可以到垃圾箱，[搜索文件][6]，然后把它重新存储到它原始的位置。但是第二种情况又该怎么办呢？我想你可能也知道，Linux 命令行不会把被删除的文件放到任何位置，而是直接把它们清除了，于是它们不再存在了。

In this article we will share a tip that may be helpful to prevent this from happening to you, and a tool that you may consider using if at any point you are careless enough to do it anyway.、
在这篇文章里，我将分享一个可能很有帮助的技巧来阻止这件事发生在你身上。同时，我也会分享一个你可能会考虑使用的工具，当你由于过分粗心而删除了某些不该删除的文件时。

### Create an alias to ‘rm -i’
### 为 ’rm -i‘ 创建一个别名

The `-i` switch, when used with rm (and also other [file-manipulation tools such as cp or mv][5]) causes a prompt to appear before removing a file.
当 ‘-i' 选项和 rm 命令（也包括其他[文件处理命令比如 cp 或者 mv][5]）同时使用时，在删除文件前会出现一个提示。

The same applies to [copying, moving, or renaming a file][4] in a location where one with the same name exists already.
这同样也可以运用到[复制，移动或重命名一个文件][4]，当所在位置已经存在一个和目标文件同名的文件时。

This prompt gives you a second chance to consider if you actually want to remove the file – if you confirm the prompt, it will be gone. In that case, I’m sorry but this tip will not protect you from your own carelessness.
这个提示给你第二次机会来考虑你是否真的想删除该文件 - 如果你在这个提示上选择确定，那么文件就被删除了。在那种情况下，很抱歉，这个技巧没能保护你远离粗心。

To replace rm with an alias to `'rm -i'`, do:
为了让 rm 成为 ‘rm -i’ 别名，这样做：

```
alias rm='rm -i'

```

The alias command will confirm that rm is now aliased:
别名命令将确定 rm 现在已经成为了别名：

[
 ![增加 rm 别名的命令](http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-rm-Command.png) 
][3]

Add Alias rm Command
增加 rm 别名的命令

However, this will only last during the current user session in the current shell. To make the change permanent, you will have to save it to `~/.bashrc` (some distributions may use `~/.profile` instead) as shown below:
然而，这样做只在当前用户对话的当前 shell 上有效。为了永久改变，你必须像下面展示的这样把它保存到　'~/.bashrc'　中（一些版本的　Linux 系统可能使用的是　'~/.profile'）。

[
 ![在 Linux 中永久增添别名](http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-Permanently-in-Linux.png) 
][2]

在 Linux 中永久增添别名

In order for the changes in `~/.bashrc` (or `~/.profile`) to take effect immediately, source the file from the current shell:
为了使在 '~/.bashrc'（或 '~/.profile'）中的改变立即生效，从当前 shell 中搜索文件：

```
. ~/.bashr

```
[
 ![在 Linux 中激活别名](http://www.tecmint.com/wp-content/uploads/2016/11/Active-Alias-in-Linux.png) 
][1]

在 Linux 中激活别名

### The forensics tool – Foremost
### 取证工具　－　Foremost

Hopefully, you will be careful with your files and will only need to use this tool while recovering a lost file from an external disk or USB drive.
但愿你对于你的文件足够小心，只有需要恢复一个来自外部磁盘或 USB 设备的丢失文件时才使用这个工具。

However, if you realize you accidentally removed a file in your system and are going to panic – don’t. Let’s take a look at foremost, a forensics tool that was designed for this kind of scenarios.
然而，当你意识到你意外的删除了系统中的一个文件并将要感到恐慌时－不用担心。让我们来看一看 Foremost，　一个被设计用来处理这种状况的取证工具。

To install foremost in CentOS/RHEL 7, you will need to enable Repoforge first:
为了在 CentOS/RHEL 7　中安装　Foremost，　你需要首先启用 Repoforge：

```
# rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
# yum install foremost

```

Whereas in Debian and derivatives, just do
然而在 Debian 及其派生系统中，只需这样：

```
# aptitude install foremost

```

Once the installation has completed, let’s proceed with a simple test. We will begin by removing an image file named `nosdos.jpg` from the /boot/images directory:
安装完成以后，让我们以一个简单的测试开始。我们首先删除 /boot/images 目录下一个名为 'nosdos.jpg' 的图像文件：

```
# cd images
# rm nosdos.jpg

```

To recover it, use foremost as follows (you’ll need to identify the underlying partition first – `/dev/sda1` is where `/boot` resides in this case):
为了恢复这个文件，像下面这样使用 Foremost（你需要首先确认潜在分区 - 在这种情况下， '/boot' 位于 '/dev/sda1' 分区中）

```
# foremost -t jpg -i /dev/sda1 -o /home/gacanepa/rescued

```

where /home/gacanepa/rescued is a directory on a separate disk – keep in mind that recovering files on the same drive where the removed ones were located is not a wise move.
/home/gacanepa/rescued 是单独磁盘中的一个目录－记住恢复的文件位于和删除的文件相同的驱动中

If, during the recovery, you occupy the same disk sectors where the removed files used to be, it may not be possible to recover anything. Additionally, it is essential to stop all your activities before performing the recovery.

After foremost has finished executing, the recovered file (if recovery was possible) will be found inside the /home/gacanepa/rescued/jpg directory.

##### Summary

In this article we have explained how to avoid removing a file accidentally and how to attempt to recover it if such an undesired event happens. Be warned, however, that foremost can take quite a while to run depending on the size of the partition.

As always, don’t hesitate to let us know if you have questions or comments. Feel free to drop us a note using the form below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/recover-deleted-file-in-linux/

作者：[ Gabriel Cánepa][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/wp-content/uploads/2016/11/Active-Alias-in-Linux.png
[2]:http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-Permanently-in-Linux.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/11/Add-Alias-rm-Command.png
[4]:http://www.tecmint.com/rename-multiple-files-in-linux/
[5]:http://www.tecmint.com/progress-monitor-check-progress-of-linux-commands/
[6]:http://www.tecmint.com/linux-find-command-to-search-multiple-filenames-extensions/
