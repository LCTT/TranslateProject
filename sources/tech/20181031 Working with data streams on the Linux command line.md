Working with data streams on the Linux command line
======
Learn to connect data streams from one utility to another using STDIO.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pipe-pipeline-grid.png?itok=kkpzKxKg)

**Author’s note:** Much of the content in this article is excerpted, with some significant edits to fit the Opensource.com article format, from Chapter 3: Data Streams, of my new book, [The Linux Philosophy for SysAdmins][1].

Everything in Linux revolves around streams of data—particularly text streams. Data streams are the raw materials upon which the [GNU Utilities][2], the Linux core utilities, and many other command-line tools perform their work.

As its name implies, a data stream is a stream of data—especially text data—being passed from one file, device, or program to another using STDIO. This chapter introduces the use of pipes to connect streams of data from one utility program to another using STDIO. You will learn that the function of these programs is to transform the data in some manner. You will also learn about the use of redirection to redirect the data to a file.

I use the term “transform” in conjunction with these programs because the primary task of each is to transform the incoming data from STDIO in a specific way as intended by the sysadmin and to send the transformed data to STDOUT for possible use by another transformer program or redirection to a file.

The standard term, “filters,” implies something with which I don’t agree. By definition, a filter is a device or a tool that removes something, such as an air filter removes airborne contaminants so that the internal combustion engine of your automobile does not grind itself to death on those particulates. In my high school and college chemistry classes, filter paper was used to remove particulates from a liquid. The air filter in my home HVAC system removes particulates that I don’t want to breathe.

Although they do sometimes filter out unwanted data from a stream, I much prefer the term “transformers” because these utilities do so much more. They can add data to a stream, modify the data in some amazing ways, sort it, rearrange the data in each line, perform operations based on the contents of the data stream, and so much more. Feel free to use whichever term you prefer, but I prefer transformers. I expect that I am alone in this.

Data streams can be manipulated by inserting transformers into the stream using pipes. Each transformer program is used by the sysadmin to perform some operation on the data in the stream, thus changing its contents in some manner. Redirection can then be used at the end of the pipeline to direct the data stream to a file. As mentioned, that file could be an actual data file on the hard drive, or a device file such as a drive partition, a printer, a terminal, a pseudo-terminal, or any other device connected to a computer.

The ability to manipulate these data streams using these small yet powerful transformer programs is central to the power of the Linux command-line interface. Many of the core utilities are transformer programs and use STDIO.

In the Unix and Linux worlds, a stream is a flow of text data that originates at some source; the stream may flow to one or more programs that transform it in some way, and then it may be stored in a file or displayed in a terminal session. As a sysadmin, your job is intimately associated with manipulating the creation and flow of these data streams. In this post, we will explore data streams—what they are, how to create them, and a little bit about how to use them.

### Text streams—a universal interface

The use of Standard Input/Output (STDIO) for program input and output is a key foundation of the Linux way of doing things. STDIO was first developed for Unix and has found its way into most other operating systems since then, including DOS, Windows, and Linux.

> “This is the Unix philosophy: Write programs that do one thing and do it well. Write programs to work together. Write programs to handle text streams, because that is a universal interface.”
>
> — Doug McIlroy, Basics of the Unix Philosophy

### STDIO

STDIO was developed by Ken Thompson as a part of the infrastructure required to implement pipes on early versions of Unix. Programs that implement STDIO use standardized file handles for input and output rather than files that are stored on a disk or other recording media. STDIO is best described as a buffered data stream, and its primary function is to stream data from the output of one program, file, or device to the input of another program, file, or device.

There are three STDIO data streams, each of which is automatically opened as a file at the startup of a program—well, those programs that use STDIO. Each STDIO data stream is associated with a file handle, which is just a set of metadata that describes the attributes of the file. File handles 0, 1, and 2 are explicitly defined by convention and long practice as STDIN, STDOUT, and STDERR, respectively.

**STDIN, File handle 0** , is standard input which is usually input from the keyboard. STDIN can be redirected from any file, including device files, instead of the keyboard. It is not common to need to redirect STDIN, but it can be done.

**STDOUT, File handle 1** , is standard output which sends the data stream to the display by default. It is common to redirect STDOUT to a file or to pipe it to another program for further processing.

**STDERR, File handle 2**. The data stream for STDERR is also usually sent to the display.

If STDOUT is redirected to a file, STDERR continues to be displayed on the screen. This ensures that when the data stream itself is not displayed on the terminal, that STDERR is, thus ensuring that the user will see any errors resulting from execution of the program. STDERR can also be redirected to the same or passed on to the next transformer program in a pipeline.

STDIO is implemented as a C library, **stdio.h** , which can be included in the source code of programs so that it can be compiled into the resulting executable.

### Simple streams

You can perform the following experiments safely in the **/tmp** directory of your Linux host. As the root user, make **/tmp** the PWD, create a test directory, and then make the new directory the PWD.

```
# cd /tmp ; mkdir test ; cd test
```

Enter and run the following command line program to create some files with content on the drive. We use the `dmesg` command simply to provide data for the files to contain. The contents don’t matter as much as just the fact that each file has some content.

```
# for I in 0 1 2 3 4 5 6 7 8 9 ; do dmesg > file$I.txt ; done
```

Verify that there are now at least 10 files in **/tmp/** with the names **file0.txt** through **file9.txt**.

```
# ll
total 1320
-rw-r--r-- 1 root root 131402 Oct 17 15:50 file0.txt
-rw-r--r-- 1 root root 131402 Oct 17 15:50 file1.txt
-rw-r--r-- 1 root root 131402 Oct 17 15:50 file2.txt
-rw-r--r-- 1 root root 131402 Oct 17 15:50 file3.txt
-rw-r--r-- 1 root root 131402 Oct 17 15:50 file4.txt
-rw-r--r-- 1 root root 131402 Oct 17 15:50 file5.txt
-rw-r--r-- 1 root root 131402 Oct 17 15:50 file6.txt
-rw-r--r-- 1 root root 131402 Oct 17 15:50 file7.txt
-rw-r--r-- 1 root root 131402 Oct 17 15:50 file8.txt
-rw-r--r-- 1 root root 131402 Oct 17 15:50 file9.txt
```

We have generated data streams using the `dmesg` command, which was redirected to a series of files. Most of the core utilities use STDIO as their output stream and those that generate data streams, rather than acting to transform the data stream in some way, can be used to create the data streams that we will use for our experiments. Data streams can be as short as one line or even a single character, and as long as needed.

### Exploring the hard drive

It is now time to do a little exploring. In this experiment, we will look at some of the filesystem structures.

Let’s start with something simple. You should be at least somewhat familiar with the `dd` command. Officially known as “disk dump,” many sysadmins call it “disk destroyer” for good reason. Many of us have inadvertently destroyed the contents of an entire hard drive or partition using the `dd` command. That is why we will hang out in the **/tmp/test** directory to perform some of these experiments.

Despite its reputation, `dd` can be quite useful in exploring various types of storage media, hard drives, and partitions. We will also use it as a tool to explore other aspects of Linux.

Log into a terminal session as root if you are not already. We first need to determine the device special file for your hard drive using the `lsblk` command.

```
[root@studentvm1 test]# lsblk -i
NAME                                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                                    8:0    0   60G  0 disk
|-sda1                                 8:1    0    1G  0 part /boot
`-sda2                                 8:2    0   59G  0 part
  |-fedora_studentvm1-pool00_tmeta   253:0    0    4M  0 lvm  
  | `-fedora_studentvm1-pool00-tpool 253:2    0    2G  0 lvm  
  |   |-fedora_studentvm1-root       253:3    0    2G  0 lvm  /
  |   `-fedora_studentvm1-pool00     253:6    0    2G  0 lvm  
  |-fedora_studentvm1-pool00_tdata   253:1    0    2G  0 lvm  
  | `-fedora_studentvm1-pool00-tpool 253:2    0    2G  0 lvm  
  |   |-fedora_studentvm1-root       253:3    0    2G  0 lvm  /
  |   `-fedora_studentvm1-pool00     253:6    0    2G  0 lvm  
  |-fedora_studentvm1-swap           253:4    0   10G  0 lvm  [SWAP]
  |-fedora_studentvm1-usr            253:5    0   15G  0 lvm  /usr
  |-fedora_studentvm1-home           253:7    0    2G  0 lvm  /home
  |-fedora_studentvm1-var            253:8    0   10G  0 lvm  /var
  `-fedora_studentvm1-tmp            253:9    0    5G  0 lvm  /tmp
sr0                                   11:0    1 1024M  0 rom
```

We can see from this that there is only one hard drive on this host, that the device special file associated with it is **/dev/sda** , and that it has two partitions. The **/dev/sda1** partition is the boot partition, and the **/dev/sda2** partition contains a volume group on which the rest of the host’s logical volumes have been created.

As root in the terminal session, use the `dd` command to view the boot record of the hard drive, assuming it is assigned to the **/dev/sda** device. The `bs=` argument is not what you might think; it simply specifies the block size, and the `count=` argument specifies the number of blocks to dump to STDIO. The `if=` argument specifies the source of the data stream, in this case, the **/dev/sda** device. Notice that we are not looking at the first block of the partition, we are looking at the very first block of the hard drive.

```
[root@studentvm1 test]# dd if=/dev/sda bs=512 count=1
�c�#�м���؎���|�#�#���!#��8#u
                            ��#���u��#�#�#�|���t#�L#�#�|���#�����t��pt#���y|1��؎м ��d|<�t#��R�|1��D#@�D��D#�##f�#\|f�f�#`|f�\
                                      �D#p�B�#r�p�#�K`#�#��1��������#a`���#f��u#����f1�f�TCPAf�#f�#a�&Z|�#}�#�.}�4�3}�.�#��GRUB GeomHard DiskRead Error
�#��#�<u��ܻޮ�###��� ������ �_U�1+0 records in
1+0 records out
512 bytes copied, 4.3856e-05 s, 11.7 MB/s
```

This prints the text of the boot record, which is the first block on the disk—any disk. In this case, there is information about the filesystem and, although it is unreadable because it is stored in binary format, the partition table. If this were a bootable device, stage 1 of GRUB or some other boot loader would be located in this sector. The last three lines contain data about the number of records and bytes processed.

Starting with the beginning of **/dev/sda1** , let’s look at a few blocks of data at a time to find what we want. The command is similar to the previous one, except that we have specified a few more blocks of data to view. You may have to specify fewer blocks if your terminal is not large enough to display all of the data at one time, or you can pipe the data through the less utility and use that to page through the data—either way works. Remember, we are doing all of this as root user because non-root users do not have the required permissions.

Enter the same command as you did in the previous experiment, but increase the block count to be displayed to 100, as shown below, in order to show more data.

```
[root@studentvm1 test]# dd if=/dev/sda1 bs=512 count=100
##33��#:�##�� :o�[:o�[#��S�###�q[#
                                  #<�#{5OZh�GJ͞#t�Ұ##boot/bootysimage/booC�dp��G'�*)�#A�##@
     #�q[
�## ##  ###�#���To=###<#8���#'#�###�#�����#�'  �����#Xi  �#��`  qT���
  <���
      �  r����  ]�#�#�##�##�##�#�##�##�##�#�##�##�#��#�#�##�#�##�##�#��#�#����#       �     �#    �#    �#
�
�#
�#
�#
  �
   �#
     �#
       �#
         �
          �#
            �#
              �#100+0 records in
100+0 records out
51200 bytes (51 kB, 50 KiB) copied, 0.00117615 s, 43.5 MB/s
```

Now try this command. I won’t reproduce the entire data stream here because it would take up huge amounts of space. Use **Ctrl-C** to break out and stop the stream of data.

```
[root@studentvm1 test]# dd if=/dev/sda
```

This command produces a stream of data that is the complete content of the hard drive, **/dev/sda** , including the boot record, the partition table, and all of the partitions and their content. This data could be redirected to a file for use as a complete backup from which a bare metal recovery can be performed. It could also be sent directly to another hard drive to clone the first. But do not perform this particular experiment.

```
[root@studentvm1 test]# dd if=/dev/sda of=/dev/sdx
```

You can see that the `dd` command can be very useful for exploring the structures of various types of filesystems, locating data on a defective storage device, and much more. It also produces a stream of data on which we can use the transformer utilities in order to modify or view.

The real point here is that `dd`, like so many Linux commands, produces a stream of data as its output. That data stream can be searched and manipulated in many ways using other tools. It can even be used for ghost-like backups or disk duplication.

### Randomness

It turns out that randomness is a desirable thing in computers—who knew? There are a number of reasons that sysadmins might want to generate a stream of random data. A stream of random data is sometimes useful to overwrite the contents of a complete partition, such as **/dev/sda1** , or even the entire hard drive, as in **/dev/sda**.

Perform this experiment as a non-root user. Enter this command to print an unending stream of random data to STDIO.

```
[student@studentvm1 ~]$ cat /dev/urandom
```

Use **Ctrl-C** to break out and stop the stream of data. You may need to use **Ctrl-C** multiple times.

Random data is also used as the input seed to programs that generate random passwords and random data and numbers for use in scientific and statistical calculations. I will cover randomness and other interesting data sources in a bit more detail in Chapter 24: Everything is a file.

### Pipe dreams

Pipes are critical to our ability to do the amazing things on the command line, so much so that I think it is important to recognize that they were invented by Douglas McIlroy during the early days of Unix (thanks, Doug!). The Princeton University website has a fragment of an [interview][3] with McIlroy in which he discusses the creation of the pipe and the beginnings of the Unix philosophy.

Notice the use of pipes in the simple command-line program shown next, which lists each logged-in user a single time, no matter how many logins they have active. Perform this experiment as the student user. Enter the command shown below:

```
[student@studentvm1 ~]$ w | tail -n +3 | awk '{print $1}' | sort | uniq
root
student
[student@studentvm1 ~]$
```

The results from this command produce two lines of data that show that the user's root and student are both logged in. It does not show how many times each user is logged in. Your results will almost certainly differ from mine.

Pipes—represented by the vertical bar ( | )—are the syntactical glue, the operator, that connects these command-line utilities together. Pipes allow the Standard Output from one command to be “piped,” i.e., streamed from Standard Output of one command to the Standard Input of the next command.

The |& operator can be used to pipe the STDERR along with STDOUT to STDIN of the next command. This is not always desirable, but it does offer flexibility in the ability to record the STDERR data stream for the purposes of problem determination.

A string of programs connected with pipes is called a pipeline, and the programs that use STDIO are referred to officially as filters, but I prefer the term “transformers.”

Think about how this program would have to work if we could not pipe the data stream from one command to the next. The first command would perform its task on the data and then the output from that command would need to be saved in a file. The next command would have to read the stream of data from the intermediate file and perform its modification of the data stream, sending its own output to a new, temporary data file. The third command would have to take its data from the second temporary data file and perform its own manipulation of the data stream and then store the resulting data stream in yet another temporary file. At each step, the data file names would have to be transferred from one command to the next in some way.

I cannot even stand to think about that because it is so complex. Remember: Simplicity rocks!

### Building pipelines

When I am doing something new, solving a new problem, I usually do not just type in a complete Bash command pipeline from scratch off the top of my head. I usually start with just one or two commands in the pipeline and build from there by adding more commands to further process the data stream. This allows me to view the state of the data stream after each of the commands in the pipeline and make corrections as they are needed.

It is possible to build up very complex pipelines that can transform the data stream using many different utilities that work with STDIO.

### Redirection

Redirection is the capability to redirect the STDOUT data stream of a program to a file instead of to the default target of the display. The “greater than” ( > ) character, aka “gt”, is the syntactical symbol for redirection of STDOUT.

Redirecting the STDOUT of a command can be used to create a file containing the results from that command.

```
[student@studentvm1 ~]$ df -h > diskusage.txt
```

There is no output to the terminal from this command unless there is an error. This is because the STDOUT data stream is redirected to the file and STDERR is still directed to the STDOUT device, which is the display. You can view the contents of the file you just created using this next command:

```
[student@studentvm1 test]# cat diskusage.txt
Filesystem                          Size  Used Avail Use% Mounted on
devtmpfs                            2.0G     0  2.0G   0% /dev
tmpfs                               2.0G     0  2.0G   0% /dev/shm
tmpfs                               2.0G  1.2M  2.0G   1% /run
tmpfs                               2.0G     0  2.0G   0% /sys/fs/cgroup
/dev/mapper/fedora_studentvm1-root  2.0G   50M  1.8G   3% /
/dev/mapper/fedora_studentvm1-usr    15G  4.5G  9.5G  33% /usr
/dev/mapper/fedora_studentvm1-var   9.8G  1.1G  8.2G  12% /var
/dev/mapper/fedora_studentvm1-tmp   4.9G   21M  4.6G   1% /tmp
/dev/mapper/fedora_studentvm1-home  2.0G  7.2M  1.8G   1% /home
/dev/sda1                           976M  221M  689M  25% /boot
tmpfs                               395M     0  395M   0% /run/user/0
tmpfs                               395M   12K  395M   1% /run/user/1000
```

When using the > symbol to redirect the data stream, the specified file is created if it does not already exist. If it does exist, the contents are overwritten by the data stream from the command. You can use double greater-than symbols, >>, to append the new data stream to any existing content in the file.

```
[student@studentvm1 ~]$ df -h >> diskusage.txt
```

You can use `cat` and/or `less` to view the **diskusage.txt** file in order to verify that the new data was appended to the end of the file.

The < (less than) symbol redirects data to the STDIN of the program. You might want to use this method to input data from a file to STDIN of a command that does not take a filename as an argument but that does use STDIN. Although input sources can be redirected to STDIN, such as a file that is used as input to grep, it is generally not necessary as grep also takes a filename as an argument to specify the input source. Most other commands also take a filename as an argument for their input source.

### Just grep’ing around

The `grep` command is used to select lines that match a specified pattern from a stream of data. `grep` is one of the most commonly used transformer utilities and can be used in some very creative and interesting ways. The `grep` command is one of the few that can correctly be called a filter because it does filter out all the lines of the data stream that you do not want; it leaves only the lines that you do want in the remaining data stream.

If the PWD is not the **/tmp/test** directory, make it so. Let’s first create a stream of random data to store in a file. In this case, we want somewhat less random data that would be limited to printable characters. A good password generator program can do this. The following program (you may have to install `pwgen` if it is not already) creates a file that contains 50,000 passwords that are 80 characters long using every printable character. Try it without redirecting to the **random.txt** file first to see what that looks like, and then do it once redirecting the output data stream to the file.

```
$ pwgen -sy 80 50000 > random.txt
```

Considering that there are so many passwords, it is very likely that some character strings in them are the same. First, `cat` the **random.txt** file, then use the `grep` command to locate some short, randomly selected strings from the last ten passwords on the screen. I saw the word “see” in one of those ten passwords, so my command looked like this: `grep see random.txt`, and you can try that, but you should also pick some strings of your own to check. Short strings of two to four characters work best.

```
$ grep see random.txt
        R=p)'s/~0}wr~2(OqaL.S7DNyxlmO69`"12u]h@rp[D2%3}1b87+>Vk,;4a0hX]d7see;1%9|wMp6Yl.
        bSM_mt_hPy|YZ1<TY/Hu5{g#mQ<u_(@8B5Vt?w%i-&C>NU@[;zV2-see)>(BSK~n5mmb9~h)yx{a&$_e
        cjR1QWZwEgl48[3i-(^x9D=v)seeYT2R#M:>wDh?Tn$]HZU7}j!7bIiIr^cI.DI)W0D"'vZU@.Kxd1E1
        z=tXcjVv^G\nW`,y=bED]d|7%s6iYT^a^Bvsee:v\UmWT02|P|nq%A*;+Ng[$S%*s)-ls"dUfo|0P5+n
```

### Summary

It is the use of pipes and redirection that allows many of the amazing and powerful tasks that can be performed with data streams on the Linux command line. It is pipes that transport STDIO data streams from one program or file to another. The ability to pipe streams of data through one or more transformer programs supports powerful and flexible manipulation of data in those streams.

Each of the programs in the pipelines demonstrated in the experiments is small, and each does one thing well. They are also transformers; that is, they take Standard Input, process it in some way, and then send the result to Standard Output. Implementation of these programs as transformers to send processed data streams from their own Standard Output to the Standard Input of the other programs is complementary to, and necessary for, the implementation of pipes as a Linux tool.

STDIO is nothing more than streams of data. This data can be almost anything from the output of a command to list the files in a directory, or an unending stream of data from a special device like **/dev/urandom** , or even a stream that contains all of the raw data from a hard drive or a partition.

Any device on a Linux computer can be treated like a data stream. You can use ordinary tools like `dd` and `cat` to dump data from a device into a STDIO data stream that can be processed using other ordinary Linux tools.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/linux-data-streams

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://www.apress.com/us/book/9781484237298
[2]: https://www.gnu.org/software/coreutils/coreutils.html
[3]: https://www.princeton.edu/~hos/mike/transcripts/mcilroy.htm
