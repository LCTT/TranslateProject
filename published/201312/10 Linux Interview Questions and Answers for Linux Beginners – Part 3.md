Linux 面试基础问题 - 3
================================================================================

在有关**面试问题**的这一系列话题的前两篇文章中，我们收到了许多好的反馈，在此表示极大的感谢，同时，我们将延续这一系列话题。在这里，我们将再次展示**10个问题**来进行相互学习。

- [11个基本的Linux面试问题及答案 – 第一部分][1]
- [10个基本的Linux面试问题及答案 – 第二部分][2]

![](http://www.tecmint.com/wp-content/uploads/2013/12/Basic-Interview-Questions-Part-3.png)

### Q.1. 你如何向你的系统中添加一个新的用户(例如，tux)？ ###

- 使用useradd指令
- 使用adduser 指令
- 使用linuxconf指令
- 以上全是
- 以上答案全都不对

> **答** : 以上全是，即useradd,  adduser 和 linuxconf 都可向你的linux系统添加新用户。

### Q.2. 在一个硬盘上，可能有多少主分区？ ###

- 1
- 2
- 4
- 16

> **答** : 一个硬盘上最多可能有4个主分区。

### Q.3. Apache/Http 的默认端口号是多少？ ###

- 8080
- 80
- 8443
- 91
- 以上答案全都不对

> **答** : Apache/Http默认配置是**80**端口

### Q.4. GNU代表什么？ ###

- GNU's not Unix
- General Unix
- General Noble Unix
- Greek Needed Unix
- 以上答案全都不对

> **答** : GNU意为**GNU's not Unix**.

### Q.5. 如果你在shell提示符中输入mysql并得到“can’t connect to local MySQL server through socket ‘/var/mysql/mysql.sock’ ”的提示，你首先应该检查什么？ ###

> **答** : 看到这条错误消息，我首先会使用**service mysql status**或者**service mysqld status**指令来检查mysql服务是否正在运行。如果mysql服务没有运行，就启动所需服务。

**注意**:上面的错误消息可能是由于**my.cnf**或者mysql的**用户权限**错误配置导致的。如果启动mysql服务之后仍不管用，你需要检查这两项。

### Q.6. 如何将windows ntfs分区挂载到Linux上面？ ###

> **答** : 首先，使用**apt**或者**yum**工具安装ntfs3g包，然后使用
“**sudo mount ­t ntfs­3g /dev/<Windows ntfs的分区号> /<挂载点­>**” 命令来将windows分区挂载到Linux上面


### Q.7. 下面哪一个不是基于RPM的操作系统？ ###

- RedHat Linux
- Centos
- Scientific Linux
- Debian
- Fedora

> **答** : ‘**Debian**’ 系统不是基于**RPM**的，其它的几个都是

### Q.8. Linux中，哪一个指令用来重命名文件？ ###

- mv
- ren
- rename
- change
- 以上答案全都不对

> **答** : 在Linux中，**mv** 指令用来重命名一个文件。例如：**mv /path_to_File/original_file_name.extension /Path_to_File/New_name.extension**

### Q.9. 在Linux中，哪个命令用来创建并显示文件？ ###

- ed
- vi
- cat
- nano
- 以上答案全都不对

> **答** : ‘**cat**‘ 命令用来创建并且显示文件

### 10. 哪层协议用于支持用户和程序，如支持密码、资源分享、文件传输和网络管理？ ###

- 第四层协议
- 第五层协议
- 第六层协议
- 第七层协议
- 以上答案全都不对

> **答** : ‘**第七层协议**‘

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-interview-questions-and-answers-for-linux-beginners/

译者：[tomatoKiller](https://github.com/tomatoKiller) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-2315-1.html
[2]:http://linux.cn/article-2370-1.html
