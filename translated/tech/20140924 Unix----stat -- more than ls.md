Unix: stat -- 获取比 ls 更多的信息
================================================================================
> 厌倦了 ls 命令, 并且想查看更多有关你的文件的有趣的信息? 试一试 stat!

![](http://www.itworld.com/sites/default/files/imagecache/large_thumb_150x113/stats.jpg)

ls 命令可能是每一个 Unix 使用者第一个学习的命令之一, 但它仅仅显示了 stat 命令能给出的信息的一小部分.

stat 命令从文件的索引节点获取信息. 正如你可能已经了解的那样, 每一个系统里的文件都存有三组日期和时间, 它们包括最近修改时间(即使用 ls -l 命令时显示的日期和时间), 最近状态改变时间(包括重命名文件)和最近访问时间.

使用长列表模式查看文件信息, 你会看到类似下面的内容:

    $ ls -l trythis
    -rwx------ 1 shs unixdweebs 109 Nov 11  2013 trythis

使用 stat 命令, 你会看到下面这些:

    $ stat trythis
      File: `trythis'
      Size: 109      Blocks: 8   IO Block: 262144 regular file
    Device: 18h/24d Inode: 12731691    Links: 1
    Access: (0700/-rwx------)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-09-09 19:27:58.000000000 -0400
    Modify: 2013-11-11 08:40:10.000000000 -0500
    Change: 2013-11-11 08:40:10.000000000 -0500

在上面的情形中, 文件的状态改变和文件修改的日期/时间是相同的, 而访问时间则是相当近的时间. 我们还可以看到文件使用了 8 个块, 以及两种格式显示的文件权限 -- 八进制(0700)格式和 rwx 格式. 在第三行显示的索引节点是 12731681. 文件没有其它的硬链接(Links: 1). 而且, 这个文件是一个常规文件.

重命名文件, 你会看到状态改变时间发生变化.

这里的 ctime 信息, 最早设计用来存储文件的创建日期和时间, 但之前的某个时间变为用来存储状态修改时间.

    $ mv trythis trythat
    $ stat trythat
      File: `trythat'
      Size: 109      Blocks: 8   IO Block: 262144 regular file
    Device: 18h/24d Inode: 12731691    Links: 1
    Access: (0700/-rwx------)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-09-09 19:27:58.000000000 -0400
    Modify: 2013-11-11 08:40:10.000000000 -0500
    Change: 2014-09-21 12:46:22.000000000 -0400

改变文件的权限也会改变 ctime 域.

你也可以配合通配符来使用 stat 命令以列出一组文件的状态:

    $ stat myfile*
      File: `myfile'
      Size: 20              Blocks: 8          IO Block: 262144 regular file
    Device: 18h/24d Inode: 12731803    Links: 1
    Access: (0640/-rw-r-----)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-08-23 03:00:36.000000000 -0400
    Modify: 2014-08-22 12:02:12.000000000 -0400
    Change: 2014-08-22 12:02:12.000000000 -0400
      File: `myfile2'
      Size: 20              Blocks: 8          IO Block: 262144 regular file
    Device: 18h/24d Inode: 12731806    Links: 1
    Access: (0640/-rw-r-----)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-08-23 03:00:36.000000000 -0400
    Modify: 2014-08-22 12:03:30.000000000 -0400
    Change: 2014-08-22 12:03:30.000000000 -0400
      File: `myfile3'
      Size: 40              Blocks: 8          IO Block: 262144 regular file
    Device: 18h/24d Inode: 12730533    Links: 1
    Access: (0640/-rw-r-----)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-08-23 03:00:36.000000000 -0400
    Modify: 2014-08-22 12:03:59.000000000 -0400
    Change: 2014-08-22 12:03:59.000000000 -0400

如果我们喜欢的话, 我们也可以通过其他命令来获取这些信息.

向 ls -l 命令添加 "u" 选项, 你会获得下面的结果. 注意这个选项会显示最后访问时间, 而添加 "c" 选项则会显示状态改变时间(在本例中, 是我们重命名文件的时间).

    $ ls -lu trythat
    -rwx------ 1 shs unixdweebs 109 Sep  9 19:27 trythat
    $ ls -lc trythat
    -rwx------ 1 shs unixdweebs 109 Sep 21 12:46 trythat

stat 命令也可应用与文件夹.

在这个例子中, 我们可以看到有许多的链接.

    $ stat bin
      File: `bin'
      Size: 12288    Blocks: 24  IO Block: 262144 directory
    Device: 18h/24d Inode: 15089714    Links: 9
    Access: (0700/drwx------)  Uid: (  263/     shs)   Gid: (  100/ unixdweebs)
    Access: 2014-09-21 03:00:45.000000000 -0400
    Modify: 2014-09-15 17:54:41.000000000 -0400
    Change: 2014-09-15 17:54:41.000000000 -0400

在这里, 我们查看一个文件系统.

    $ stat -f /dev/cciss/c0d0p2
      File: "/dev/cciss/c0d0p2"
        ID: 0 Namelen: 255     Type: tmpfs
    Block size: 4096Fundamental block size: 4096
    Blocks: Total: 259366     Free: 259337     Available: 259337
    Inodes: Total: 223834     Free: 223531

注意 Namelen (文件名长度)域, 如果文件名长于 255 个字符的话, 你会很幸运地在文件名处看到心形符号!

stat 命令还可以一次显示所有我们想要的信息. 下面的例子中, 我们只想查看文件类型, 然后是硬连接数.

    $ stat --format=%F trythat
    regular file
    $ stat --format=%h trythat
    1

在下面的例子中, 我们查看了文件权限 -- 分别以两种可用的格式 -- 然后是文件的 SELinux 安全环境.

译者注: 原文到这里就结束了, 但很明显缺少结尾. 最后一段的例子可以分别用

	$ stat --format=%a trythat
	$ stat --format=%A trythat
	$ stat --format=%C trythat

来实现.

--------------------------------------------------------------------------------

via: http://www.itworld.com/operating-systems/437351/unix-stat-more-ls

作者：[Sandra Henry-Stocker][a]
译者：[wangjiezhe](https://github.com/wangjiezhe)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.itworld.com/sandra-henry-stocker
