translating---geekpi

Use of du & df commands (with examples)
======
In this article I will discuss du & df commands. Both du & df commands are important utilities of Linux system & shows disk usage of Linux filesystem. Here we will share usage of both commands with some examples.

**(Recommended Read:[Files transfer using scp & rsync commands][1])**

 **(Also Read:[Cloning Disks using dd & cat commands for Linux systems][2])**

### du COMMAND

du command (short for disk usage) is useful command which is used to find disk usage for files & directories. du command when used with various options provides results in many formats.

Some of the examples are mentioned below:-

 **1- To find out summary of disk usage for a directory with all its sub-directories**

```
 $ du /home
```

![du command][4]

Output of the command shows all the files & directories in /home with block size.

**2- Disk usage with file/directory sizes in human readable format I.e. in kb, mb etc**

```
 $ du -h /home
```

![du command][6]

**3- Total disk size of a directory**

```
 $ du -s /home
```

![du command][8]

It will total size of /home directory.

### df COMMAND

df command (short for disk filesystem) is used to show disk utilization for a Linux system.

Some examples are shared below.

 **1- To display information of device name, total blocks, total disk space, used disk space, available disk space and mount points on a file system.**

```
 $ df
```


![df command][10]

**2- Information in human readable format**

```
 $ df -h
```

![df command][12]

Above command displays information in human readable format.

**3- Display information of a particular partition**

```
 $ df -hT /etc
```

![df command][14]

Using -hT with a target directory will show information of /etc/ in human readable format.

Though there are many more options that can be used with du & df commands, but these should get you started. If you don't find what you are looking for here then you can always refer to man pages for the concerned command.

Also, read my other posts [**HERE**][15] where i have shared some other important & frequently used Linux.

And as always your comments/queries are really appreciated, so please leave your comments/queries down below & I will get back to you.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/du-df-commands-examples/

作者：[SHUSAIN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/files-transfer-scp-rsync-commands/
[2]:http://linuxtechlab.com/linux-cloning-disks-using-dd-cat-commands/
[3]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=453%2C162
[4]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/du1.jpg?resize=453%2C162
[5]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=491%2C163
[6]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/du2.jpg?resize=491%2C163
[7]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=584%2C61
[8]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/du3.jpg?resize=584%2C61
[9]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=638%2C157
[10]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/df1.jpg?resize=638%2C157
[11]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=641%2C149
[12]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/df2.jpg?resize=641%2C149
[13]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=638%2C62
[14]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/df3-1.jpg?resize=638%2C62
[15]:http://linuxtechlab.com/tips-tricks/
