20条Linux命令面试问答
================================================================================
**Q:1 How to check current run level of a linux server ?**

Ans: ‘who -r’ & ‘runlevel’ commands are used to check the current runlevel of a linux box.

**Q:2 怎么检查Linux的默认网关？**

Ans: Using the commands “route -n” and “netstat -nr” , we can check default gateway. Apart from the default gateway info , these commands also display the current routing tables .

**Q:3 How to rebuild initrd image file on Linux ?**

Ans: In case of CentOS 5.X / RHEL 5.X , mkinitrd command is used to create initrd file , example is shown below :

    # mkinitrd -f -v /boot/initrd-$(uname -r).img $(uname -r)

If you want to create initrd for a specific kernel version , then replace ‘uname -r’ with desired kernel

In Case of CentOS 6.X / RHEL 6.X , dracut command is used to create initrd file example is shown below :

    # dracut -f

Above command will create the initrd file for the current version. To rebuild the initrd file for a specific kernel , use below command :

    # dracut -f initramfs-2.x.xx-xx.el6.x86_64.img 2.x.xx-xx.el6.x86_64

**Q:4 What is cpio command ?**

Ans: cpio stands for Copy in and copy out. Cpio copies files, lists and extract files to and from a archive ( or a single file).

**Q:5 What is patch command and where to use it ?**

Ans: As the name suggest patch command is used to apply changes ( or patches) to the text file. Patch command generally accept output from the diff and convert older version of files into newer versions. For example Linux kernel source code consists of number of files with millions of lines , so whenever any contributor contribute the changes , then he/she will be send the only changes instead of sending the whole source code. Then the receiver will apply the changes with patch command to its original source code.

Create a diff file for use with patch,

    # diff -Naur old_file new_file > diff_file

Where old_file and new_file are either single files or directories containing files. The r option supports recursion of a directory tree.

Once the diff file has been created, we can apply it to patch the old file into the new file:

    # patch < diff_file

**Q:6 What is use of aspell ?**

Ans: As the name suggest aspell is an interactive spelling checker in linux operating system. The aspell command is the successor to an earlier program named ispell, and can be used, for the most part, as a drop-in replacement. While the aspell program is mostly used by other programs that require spell-checking capability, it can also be used very effectively as a stand-alone tool from the command line.

**Q:7 How to check the SPF record of domain from command line ?**

Ans: We can check SPF record of a domain using dig command. Example is shown below :

    linuxtechi@localhost:~$ dig -t TXT google.com

**Q:8 How to identify which package the specified file (/etc/fstab) is associated with in linux ?**

Ans: # rpm -qf /etc/fstab

Above command will list the package which provides file “/etc/fstab”

**Q:9 Which command is used to check the status of bond0 ?**

Ans: cat /proc/net/bonding/bond0

**Q:10 What is the use of /proc file system in linux ?**

Ans: The /proc file system is a RAM based file system which maintains information about the current state of the running kernel including details on CPU, memory, partitioning, interrupts, I/O addresses, DMA channels, and running processes. This file system is represented by various files which do not actually store the information, they point to the information in the memory. The /proc file system is maintained automatically by the system.

**Q:11 How to find files larger than 10MB in size in /usr directory ?**

Ans: # find /usr -size +10M

**Q:12 How to find files in the /home directory that were modified more than 120 days ago ?**

Ans: # find /home -mtime +l20

**Q:13 How to find files in the /var directory that have not been accessed in the last 90 days ?**

Ans: # find /var -atime -90

**Q:14 Search for core files in the entire directory tree and delete them as found without prompting for confirmation**

Ans: # find / -name core -exec rm {} \;

**Q:15 What is the purpose of strings command ?**

Ans: The strings command is used to extract and display the legible contents of a non-text file.

**Q:16 What is the use tee filter ?**

Ans: The tee filter is used to send an output to more than one destination. It can send one copy of the output to a file and another to the screen (or some other program) if used with pipe.

    linuxtechi@localhost:~$ ll /etc | nl | tee /tmp/ll.out

In the above example, the output from ll is numbered and captured in /tmp/ll.out file. The output is also displayed on the screen.

**Q:17 What would the command export PS1 = ”$LOGNAME@`hostname`:\$PWD: do ?**

Ans: The export command provided will change the login prompt to display username, hostname, and the current working directory.

**Q:18 What would the command ll | awk ‘{print $3,”owns”,$9}’ do ?**

Ans: The ll command provided will display file names and their owners.

**Q:19 What is the use of at command in linux ?**

Ans: The at command is used to schedule a one-time execution of a program in the future. All submitted jobs are spooled in the /var/spool/at directory and executed by the atd daemon when the scheduled time arrives.

**Q:20 What is the role of lspci command in linux ?**

Ans: The lspci command displays information about PCI buses and the devices attached to your system. Specify -v, -vv, or -vvv for detailed output. With the -m option, the command produces more legible output.

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
