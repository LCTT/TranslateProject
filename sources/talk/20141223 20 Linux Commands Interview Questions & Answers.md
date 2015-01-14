20条Linux命令面试问答
================================================================================
**问:1 如何查看当前的Linux服务器的运行级别？**

答: ‘who -r’ 和 ‘runlevel’ 命令可以用来查看当前的Linux服务器的运行级别。

**问:2 如何查看Linux的默认网关？**

答: 用 “route -n” 和 “netstat -nr” 命令，我们可以查看默认网关。除了默认的网关信息，这两个命令还可以显示当前的路由表。

**问:3 如何在Linux上重建初始化内存盘影响文件？**

答: 在CentOS 5.X / RHEL 5.X中，可以用mkinitrd命令来创建初始化内存盘文件，举例如下：

    # mkinitrd -f -v /boot/initrd-$(uname -r).img $(uname -r)

如果你想要给特定的内核版本创建初始化内存盘，你就用所需的内核名替换掉 ‘uname -r’ 。

在CentOS 6.X / RHEL 6.X中，则用dracut命令来创建初始化内存盘文件，举例如下：

    # dracut -f

以上命令能给当前的系统版本创建初始化内存盘，给特定的内核版本重建初始化内存盘文件则使用以下命令：

    # dracut -f initramfs-2.x.xx-xx.el6.x86_64.img 2.x.xx-xx.el6.x86_64

**问:4 cpio命令是什么？**

答: cpio就是复制入和复制出的意思。cpio可以向一个归档文件（或单个文件）复制文件、列表，还可以从中提取文件。

**问:5 patch命令是什么？如何使用？**

答: As the name suggest patch command is used to apply changes ( or patches) to the text file. Patch command generally accept output from the diff and convert older version of files into newer versions. For example Linux kernel source code consists of number of files with millions of lines , so whenever any contributor contribute the changes , then he/she will be send the only changes instead of sending the whole source code. Then the receiver will apply the changes with patch command to its original source code.

Create a diff file for use with patch,

    # diff -Naur old_file new_file > diff_file

Where old_file and new_file are either single files or directories containing files. The r option supports recursion of a directory tree.

Once the diff file has been created, we can apply it to patch the old file into the new file:

    # patch < diff_file

**问:6 What is use of aspell ?**

答: As the name suggest aspell is an interactive spelling checker in linux operating system. The aspell command is the successor to an earlier program named ispell, and can be used, for the most part, as a drop-in replacement. While the aspell program is mostly used by other programs that require spell-checking capability, it can also be used very effectively as a stand-alone tool from the command line.

**问:7 How to check the SPF record of domain from command line ?**

答: We can check SPF record of a domain using dig command. Example is shown below :

    linuxtechi@localhost:~$ dig -t TXT google.com

**问:8 How to identify which package the specified file (/etc/fstab) is associated with in linux ?**

答: # rpm -qf /etc/fstab

Above command will list the package which provides file “/etc/fstab”

**问:9 Which command is used to check the status of bond0 ?**

答: cat /proc/net/bonding/bond0

**问:10 What is the use of /proc file system in linux ?**

答: The /proc file system is a RAM based file system which maintains information about the current state of the running kernel including details on CPU, memory, partitioning, interrupts, I/O addresses, DMA channels, and running processes. This file system is represented by various files which do not actually store the information, they point to the information in the memory. The /proc file system is maintained automatically by the system.

**问:11 How to find files larger than 10MB in size in /usr directory ?**

答: # find /usr -size +10M

**问:12 How to find files in the /home directory that were modified more than 120 days ago ?**

答: # find /home -mtime +l20

**问:13 How to find files in the /var directory that have not been accessed in the last 90 days ?**

答: # find /var -atime -90

**问:14 Search for core files in the entire directory tree and delete them as found without prompting for confirmation**

答: # find / -name core -exec rm {} \;

**问:15 What is the purpose of strings command ?**

答: The strings command is used to extract and display the legible contents of a non-text file.

**问:16 What is the use tee filter ?**

答: The tee filter is used to send an output to more than one destination. It can send one copy of the output to a file and another to the screen (or some other program) if used with pipe.

    linuxtechi@localhost:~$ ll /etc | nl | tee /tmp/ll.out

In the above example, the output from ll is numbered and captured in /tmp/ll.out file. The output is also displayed on the screen.

**问:17 What would the command export PS1 = ”$LOGNAME@`hostname`:\$PWD: do ?**

答: The export command provided will change the login prompt to display username, hostname, and the current working directory.

**问:18 What would the command ll | awk ‘{print $3,”owns”,$9}’ do ?**

答: The ll command provided will display file names and their owners.

**问:19 What is the use of at command in linux ?**

答: The at command is used to schedule a one-time execution of a program in the future. All submitted jobs are spooled in the /var/spool/at directory and executed by the atd daemon when the scheduled time arrives.

**问:20 What is the role of lspci command in linux ?**

答: The lspci command displays information about PCI buses and the devices attached to your system. Specify -v, -vv, or -vvv for detailed output. With the -m option, the command produces more legible output.

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/20-linux-commands-interview-questions-answers/

作者：[Pradeep Kumar][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
