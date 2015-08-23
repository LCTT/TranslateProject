translating by tnuoccalanosrep

Linux file system hierarchy v2.0
================================================================================
What is a file in Linux? What is file system in Linux? Where are all the configuration files? Where do I keep my downloaded applications? Is there really a filesystem standard structure in Linux? Well, the above image explains Linux file system hierarchy in a very simple and non-complex way. It’s very useful when you’re looking for a configuration file or a binary file. I’ve added some explanation and examples below, but that’s TL;DR.
Linux中的文件是什么？它的文件系统又是什么？那些配置文件又在哪里？我下载好的程序保存在哪里了？好了，上图简明地阐释了Linux的
文件系统的层次关系。当你苦于寻找配置文件或者二进制文件的时候，这便显得十分有用了。我在下方添加了一些解释以及例子，但“篇幅过长，没有阅读”。
Another issue is when you got configuration and binary files all over the system that creates inconsistency and if you’re a large organization or even an end user, it can compromise your system (binary talking with old lib files etc.) and when you do [security audit of your Linux system][1], you find it is vulnerable to different exploits. So keeping a clean operating system (no matter Windows or Linux) is important.
另外一种情况便是当你在系统中获取配置以及二进制文件时，出现了不一致性问题，如果你是一个大型组织，或者只是一个终端用户，这也有可能会破坏你的系统（比如，二进制文件运行在就旧的库文件上了）。若然你对你的Linux系统做安全审计的话，你将会发现它很容易遭到不同的攻击。所以，清洁操作（无论是Windows还是Linux）都显得十分重要。
### What is a file in Linux? ###
Linux的文件是什么？
A simple description of the UNIX system, also applicable to Linux, is this:
对于UNIX系统，同样适用于Linux，以下便是一个简单的描述：
> On a UNIX system, everything is a file; if something is not a file, it is a process.
> 在UNIX系统中，一切皆为文件；若非文件，则为进程
This statement is true because there are special files that are more than just files (named pipes and sockets, for instance), but to keep things simple, saying that everything is a file is an acceptable generalization. A Linux system, just like UNIX, makes no difference between a file and a directory, since a directory is just a file containing names of other files. Programs, services, texts, images, and so forth, are all files. Input and output devices, and generally all devices, are considered to be files, according to the system.
这个声明是对的，因为有些特殊的文件不仅仅是普通文件（比如命名管道和套接字）,不过为了让事情变的简单，“一切皆为文件”也是一个让人可以接受的概述。Linux系统也像UNXI系统一样，将文件和目录视如同物，因为目录只是一个包含了其他文件名的文件而已。
程序，服务，文本，图片等等，都是文件。对于系统来说，输入和输出设备，基本上所有的设备，都被当做是文件。
![](http://www.blackmoreops.com/wp-content/uploads/2015/06/Linux-file-system-hierarchy-v2.0-2480px-blackMORE-Ops.png)

- Version 2.0 – 17-06-2015
    - – Improved: Added title and version history.添加标题以及版本历史
    - – Improved: Added /srv, /media and /proc.添加/srv,/meida和/proc
    - – Improved: Updated descriptions to reflect modern Linux File Systems.更新了描述以反映当前的Linux文件系统
    - – Fixed: Multiple typo’s.多处的打印错误
    - – Fixed: Appearance and colour.外观和颜色
- Version 1.0 – 14-02-2015
    - – Created: Initial diagram.基本的图
    - – Note: Discarded lowercase version.摒弃更低的版本

### Download Links ###

Following are two links for download. If you need this in any other format, let me know and I will try to create that and upload it somewhere.
以下是结构图的下载地址。如果你需要其他结构，请跟原作者联系，他会尝试创建并且上传到某个地方以供下载
- [Large (PNG) Format – 2480×1755 px – 184KB][2]
- [Largest (PDF) Format – 9919x7019 px – 1686KB][3]

**Note**: PDF Format is best for printing and very high in quality
**注意**: PDF格式文件是打印的最好选择，它画质很高。
### Linux file system description ###
### Linux 文件系统描述 ###
In order to manage all those files in an orderly fashion, man likes to think of them in an ordered tree-like structure on the hard disk, as we know from `MS-DOS` (Disk Operating System) for instance. The large branches contain more branches, and the branches at the end contain the tree’s leaves or normal files. For now we will use this image of the tree, but we will find out later why this is not a fully accurate image.
为了有序地管理那些文件，人们习惯把这些文件当做是硬盘上的有序的类树结构体，正如我们从'MS-DOS'(硬盘操作系统)所获知的一样。
大的分枝包括更多的分枝，分枝的末梢是树的叶子或者普通的文件。现在我们将会引用这个树形图，但晚点我们会发现为什么这不是一个完全准确的一幅图。
注：表格
<table cellspacing="2" border="4" style="border-collapse: collapse; width: 731px; height: 2617px;">
  <thead>
    <tr>
      <th scope="col">Directory(目录)</th>
      <th scope="col">Description(描述)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><dl>
          <dd><code>/</code></dd>
        </dl></td>
      <td><i>Primary hierarchy主层次</i> root and root directory of the entire file system hierarchy.的根，也是整个文件系统层次结构的根目录</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/bin</code></dd>
        </dl></td>
      <td>Essential command binaries that need to be available in single user mode; for all users, <i>e.g.</i>, cat, ls, cp.在单用户模式可用的必要命令二进制文件，对于所有用户而言，则是像cat,ls,cp等等的文件</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/boot</code></dd>
        </dl></td>
      <td>Boot loader files, <i>e.g.</i>, kernels, initrd.引导加载程序文件，例如kernels,initrd等</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/dev</code></dd>
        </dl></td>
      <td>Essential devices, <i>e.g.</i>, <code>/dev/null</code>.必要的设备文件</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/etc</code></dd>
        </dl></td>
      <td>Host-specific system-wide configuration filesThere has been controversy over the meaning of the name itself. In early versions of the UNIX Implementation Document from Bell labs, /etc is referred to as the <i>etcetera directory</i>, as this directory historically held everything that did not belong elsewhere (however, the FHS restricts /etc to static configuration files and may not contain binaries). Since the publication of early documentation, the directory name has been re-designated in various ways. Recent interpretations include backronyms such as “Editable Text Configuration” or “Extended Tool Chest”.</td>
      <td>主机特定的系统范围内的配置文件。其实这里有个关于它名字本身意义上的的争议。在贝尔实验室的早期UNIX实施文档版本中，/etc表示是“其他目录”，因为从历史上看，这个目录是存放各种不属于其他目录的文件（然而，FSH(文件系统目录标准)限定 /ect是用于存放静态配置文件，这里不该存有二进制文件）。早期文档出版后，这个目录名又重新定义成不同的形式。近期的解释中包含着诸如“可编辑文本配置”或者“额外的工具箱”这样的重定义</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/opt</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Configuration files for add-on packages that are stored in <code>/opt/</code>.</td>
      <td>存储着新增包的配置文件 <code>/opt/</code>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/sgml</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Configuration files, such as catalogs, for software that processes SGML.</td>
      <td>配置文件，比如目录，还有那些处理SGML(译者注：标准通用标记语言)的软件的配置文件</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/X11</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Configuration files for the X Window System, version 11.</td>
      <td>X窗口系统的配置文件,版本号为11</td>
      <td></td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/xml</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Configuration files, such as catalogs, for software that processes XML.</td>
      <td>配置文件，比如目录，处理XML(译者注：可扩展标记语言)的软件的配置文件</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/home</code></dd>
        </dl></td>
      <td>Users’ home directories, containing saved files, personal settings, etc.</td>
      <td>用户的主目录,包括保存的文件, 个人配置, 等等.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/lib</code></dd>
        </dl></td>
      <td>Libraries essential for the binaries in <code>/bin/</code> and <code>/sbin/</code>.</td>
      <td><code>/bin/</code> and <code>/sbin/</code>中的二进制文件必不可少的库文件</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/lib&lt;qual&gt;</code></dd>
        </dl></td>
      <td>Alternate format essential libraries. Such directories are optional, but if they exist, they have some requirements.</td>
      <td>备用格式的必要库文件. 这样的目录视可选的,但如果他们存在的话, 他们还有一些要求.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/media</code></dd>
        </dl></td>
      <td>Mount points for removable media such as CD-ROMs (appeared in FHS-2.3).</td>
      <td>可移动的多媒体(如CD-ROMs)的挂载点.(出现于 FHS-2.3)</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/mnt</code></dd>
        </dl></td>
      <td>Temporarily mounted filesystems.</td>
      <td>临时挂载的文件系统</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/opt</code></dd>
        </dl></td>
      <td>Optional application software packages.</td>
      <td>自定义应用程序软件包</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/proc</code></dd>
        </dl></td>
      <td>Virtual filesystem providing process and kernel information as files. In Linux, corresponds to a procfs mount.</td>
      <td>提供进程以及内核信息的虚拟文件系统(以文件形式)，在Linux中，对应进程文件系统的挂载点</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/root</code></dd>
        </dl></td>
      <td>Home directory for the root user.</td>
      <td>根用户的主目录</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/sbin</code></dd>
        </dl></td>
      <td>Essential system binaries, <i>e.g.</i>, init, ip, mount.</td>
      <td>必要系统二进制文件, <i>比如</i>, init, ip, mount.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/srv</code></dd>
        </dl></td>
      <td>Site-specific data which are served by the system.</td>
      <td>系统提供的站点特定数据</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/tmp</code></dd>
        </dl></td>
      <td>Temporary files (see also <code>/var/tmp</code>). Often not preserved between system reboots.</td>
      <td>临时文件 (另见 <code>/var/tmp</code>). 通常在系统重启后消失</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/usr</code></dd>
        </dl></td>
      <td><i>Secondary hierarchy</i> for read-only user data; contains the majority of (multi-)user utilities and applications.</td>
      <td><i>二级层级</i> 存储用户的只读数据; 包含(多)用户主要的公共文件以及应用程序</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/bin</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Non-essential command binaries (not needed in single user mode); for all users.</td>
      <td>非必要的命令二进制文件 (在单用户模式中不需要用到的); 用于所有用户.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/include</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Standard include files.</td>
      <td>标准的包含文件</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/lib</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Libraries for the binaries in <code>/usr/bin/</code> and <code>/usr/sbin/</code>.</td>
      <td>库文件，用于<code>/usr/bin/</code> 和 <code>/usr/sbin/</code>.中的二进制文件</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/lib&lt;qual&gt;</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Alternate format libraries (optional).</td>
      <td>备用格式库(可选的).</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/local</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td><i>Tertiary hierarchy</i> for local data, specific to this host. Typically has further subdirectories, <i>e.g.</i>, <code>bin/</code>, <code>lib/</code>, <code>share/</code>.</td>
      <td><i>三级层次</i> 用于本地数据, 具体到该主机上的.通常会有下一个子目录, <i>比如</i>, <code>bin/</code>, <code>lib/</code>, <code>share/</code>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/sbin</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Non-essential system binaries, <i>e.g.</i>, daemons for various network-services.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/share</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Architecture-independent (shared) data.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/src</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Source code, <i>e.g.</i>, the kernel source code with its header files.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/X11R6</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>X Window System, Version 11, Release 6.</td>
    </tr>
    <tr>
      <td><dl>
          <dd><code>/var</code></dd>
        </dl></td>
      <td>Variable files&mdash;files whose content is expected to continually change during normal operation of the system&mdash;such as logs, spool files, and temporary e-mail files.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/cache</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Application cache data. Such data are locally generated as a result of time-consuming I/O or calculation. The application must be able to regenerate or restore the data. The cached files can be deleted without loss of data.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/lib</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>State information. Persistent data modified by programs as they run, <i>e.g.</i>, databases, packaging system metadata, etc.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/lock</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Lock files. Files keeping track of resources currently in use.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/log</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Log files. Various logs.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/mail</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Users’ mailboxes.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/opt</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Variable data from add-on packages that are stored in <code>/opt/</code>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/run</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Information about the running system since last boot, <i>e.g.</i>, currently logged-in users and running <a href="http://en.wikipedia.org/wiki/Daemon_%28computing%29">daemons</a>.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/spool</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Spool for tasks waiting to be processed, <i>e.g.</i>, print queues and outgoing mail queue.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd>
                <dl>
                  <dd><code>/mail</code></dd>
                </dl>
              </dd>
            </dl>
          </dd>
        </dl></td>
      <td>Deprecated location for users’ mailboxes.</td>
    </tr>
    <tr>
      <td><dl>
          <dd>
            <dl>
              <dd><code>/tmp</code></dd>
            </dl>
          </dd>
        </dl></td>
      <td>Temporary files to be preserved between reboots.</td>
    </tr>
  </tbody>
</table>

### Types of files in Linux ###

Most files are just files, called `regular` files; they contain normal data, for example text files, executable files or programs, input for or output from a program and so on.

While it is reasonably safe to suppose that everything you encounter on a Linux system is a file, there are some exceptions.

- `Directories`: files that are lists of other files.
- `Special files`: the mechanism used for input and output. Most special files are in `/dev`, we will discuss them later.
- `Links`: a system to make a file or directory visible in multiple parts of the system’s file tree. We will talk about links in detail.
- `(Domain) sockets`: a special file type, similar to TCP/IP sockets, providing inter-process networking protected by the file system’s access control.
- `Named pipes`: act more or less like sockets and form a way for processes to communicate with each other, without using network socket semantics.

### File system in reality ###

For most users and for most common system administration tasks, it is enough to accept that files and directories are ordered in a tree-like structure. The computer, however, doesn’t understand a thing about trees or tree-structures.

Every partition has its own file system. By imagining all those file systems together, we can form an idea of the tree-structure of the entire system, but it is not as simple as that. In a file system, a file is represented by an `inode`, a kind of serial number containing information about the actual data that makes up the file: to whom this file belongs, and where is it located on the hard disk.

Every partition has its own set of inodes; throughout a system with multiple partitions, files with the same inode number can exist.

Each inode describes a data structure on the hard disk, storing the properties of a file, including the physical location of the file data. When a hard disk is initialized to accept data storage, usually during the initial system installation process or when adding extra disks to an existing system, a fixed number of inodes per partition is created. This number will be the maximum amount of files, of all types (including directories, special files, links etc.) that can exist at the same time on the partition. We typically count on having 1 inode per 2 to 8 kilobytes of storage.At the time a new file is created, it gets a free inode. In that inode is the following information:

- Owner and group owner of the file.
- File type (regular, directory, …)
- Permissions on the file
- Date and time of creation, last read and change.
- Date and time this information has been changed in the inode.
- Number of links to this file (see later in this chapter).
- File size
- An address defining the actual location of the file data.

The only information not included in an inode, is the file name and directory. These are stored in the special directory files. By comparing file names and inode numbers, the system can make up a tree-structure that the user understands. Users can display inode numbers using the -i option to ls. The inodes have their own separate space on the disk.

--------------------------------------------------------------------------------

via: http://www.blackmoreops.com/2015/06/18/linux-file-system-hierarchy-v2-0/

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.blackmoreops.com/2015/02/15/in-light-of-recent-linux-exploits-linux-security-audit-is-a-must/
[2]:http://www.blackmoreops.com/wp-content/uploads/2015/06/Linux-file-system-hierarchy-v2.0-2480px-blackMORE-Ops.png
[3]:http://www.blackmoreops.com/wp-content/uploads/2015/06/Linux-File-System-Hierarchy-blackMORE-Ops.pdf
