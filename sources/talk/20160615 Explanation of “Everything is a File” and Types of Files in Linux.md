(翻译中 by runningwater)
Explanation of “Everything is a File” and Types of Files in Linux
====================================================================

![](http://www.tecmint.com/wp-content/uploads/2016/05/Everything-is-a-File-in-Linux.png)
>Everything is a File and Types of Files in Linux

That is in fact true although it is just a generalization concept, in Unix and its derivatives such as Linux, everything is considered as a file. If something is not a file, then it must be running as a process on the system.

To understand this, take for example the amount of space on your root (/) directory is always consumed by different types of Linux files. When you create a file or transfer a file to your system, it occupies some space on the physical disk and it is considered to be in a specific format (file type).

And also the Linux system does not differentiate between files and directories, but directories do one important job, that is store other files in groups in a hierarchy for easy location. All your hardware components are represented as files and the system communicates with them using these files.

The idea is an important description of a great property of Linux, where input/output resources such as your documents, directories (folders in Mac OS X and Windows), keyboard, monitor, hard-drives, removable media, printers, modems, virtual terminals and also inter-process and network communication are streams of bytes defined by file system space.

A notable advantage of everything being a file is that the same set of Linux tools, utilities and APIs can be used on the above input/output resources.

Although everything in Linux is a file, there are certain special files that are more than just a file for example [sockets and named pipes][1].

### What are the different types of files in Linux?

In Linux there are basically three types of files:

- Ordinary/Regular files
- Special files
- Directories

#### Ordinary/Regular Files

These are files data contain text, data or program instructions and they are the most common type of files you can expect to find on a Linux system and they include:

- Readable files
- Binary files
- Image files
- Compressed files and so on.

#### Special Files

Special files include the following:

Block files : These are device files that provide buffered access to system hardware components. They provide a method of communication with device drivers through the file system.

One important aspect about block files is that they can transfer a large block of data and information at a given time.

Listing block files sockets in a directory:

```
# ls -l /dev | grep "^b"
```

Sample Output

```
brw-rw----  1 root disk        7,   0 May 18 10:26 loop0
brw-rw----  1 root disk        7,   1 May 18 10:26 loop1
brw-rw----  1 root disk        7,   2 May 18 10:26 loop2
brw-rw----  1 root disk        7,   3 May 18 10:26 loop3
brw-rw----  1 root disk        7,   4 May 18 10:26 loop4
brw-rw----  1 root disk        7,   5 May 18 10:26 loop5
brw-rw----  1 root disk        7,   6 May 18 10:26 loop6
brw-rw----  1 root disk        7,   7 May 18 10:26 loop7
brw-rw----  1 root disk        1,   0 May 18 10:26 ram0
brw-rw----  1 root disk        1,   1 May 18 10:26 ram1
brw-rw----  1 root disk        1,  10 May 18 10:26 ram10
brw-rw----  1 root disk        1,  11 May 18 10:26 ram11
brw-rw----  1 root disk        1,  12 May 18 10:26 ram12
brw-rw----  1 root disk        1,  13 May 18 10:26 ram13
brw-rw----  1 root disk        1,  14 May 18 10:26 ram14
brw-rw----  1 root disk        1,  15 May 18 10:26 ram15
brw-rw----  1 root disk        1,   2 May 18 10:26 ram2
brw-rw----  1 root disk        1,   3 May 18 10:26 ram3
brw-rw----  1 root disk        1,   4 May 18 10:26 ram4
brw-rw----  1 root disk        1,   5 May 18 10:26 ram5
...
```

Character files : These are also device files that provide unbuffered serial access to system hardware components. They work by providing a way of communication with devices by transferring data one character at a time.

Listing character files sockets in a directory:

```
# ls -l /dev | grep "^c"
```

Sample Output

```
crw-------  1 root root       10, 235 May 18 15:54 autofs
crw-------  1 root root       10, 234 May 18 15:54 btrfs-control
crw-------  1 root root        5,   1 May 18 10:26 console
crw-------  1 root root       10,  60 May 18 10:26 cpu_dma_latency
crw-------  1 root root       10, 203 May 18 15:54 cuse
crw-------  1 root root       10,  61 May 18 10:26 ecryptfs
crw-rw----  1 root video      29,   0 May 18 10:26 fb0
crw-rw-rw-  1 root root        1,   7 May 18 10:26 full
crw-rw-rw-  1 root root       10, 229 May 18 10:26 fuse
crw-------  1 root root      251,   0 May 18 10:27 hidraw0
crw-------  1 root root       10, 228 May 18 10:26 hpet
crw-r--r--  1 root root        1,  11 May 18 10:26 kmsg
crw-rw----+ 1 root root       10, 232 May 18 10:26 kvm
crw-------  1 root root       10, 237 May 18 10:26 loop-control
crw-------  1 root root       10, 227 May 18 10:26 mcelog
crw-------  1 root root      249,   0 May 18 10:27 media0
crw-------  1 root root      250,   0 May 18 10:26 mei0
crw-r-----  1 root kmem        1,   1 May 18 10:26 mem
crw-------  1 root root       10,  57 May 18 10:26 memory_bandwidth
crw-------  1 root root       10,  59 May 18 10:26 network_latency
crw-------  1 root root       10,  58 May 18 10:26 network_throughput
crw-rw-rw-  1 root root        1,   3 May 18 10:26 null
crw-r-----  1 root kmem        1,   4 May 18 10:26 port
crw-------  1 root root      108,   0 May 18 10:26 ppp
crw-------  1 root root       10,   1 May 18 10:26 psaux
crw-rw-rw-  1 root tty         5,   2 May 18 17:40 ptmx
crw-rw-rw-  1 root root        1,   8 May 18 10:26 random
```

Symbolic link files : A symbolic link is a reference to another file on the system. Therefore, symbolic link files are files that point to other files, and they can either be directories or regular files.

Listing symbolic link sockets in a directory:

```
# ls -l /dev/ | grep "^l"
```

Sample Output

```
lrwxrwxrwx  1 root root             3 May 18 10:26 cdrom -> sr0
lrwxrwxrwx  1 root root            11 May 18 15:54 core -> /proc/kcore
lrwxrwxrwx  1 root root            13 May 18 15:54 fd -> /proc/self/fd
lrwxrwxrwx  1 root root             4 May 18 10:26 rtc -> rtc0
lrwxrwxrwx  1 root root             8 May 18 10:26 shm -> /run/shm
lrwxrwxrwx  1 root root            15 May 18 15:54 stderr -> /proc/self/fd/2
lrwxrwxrwx  1 root root            15 May 18 15:54 stdin -> /proc/self/fd/0
lrwxrwxrwx  1 root root            15 May 18 15:54 stdout -> /proc/self/fd/1
```

You can make symbolic links using the `ln` utility in Linux as in the example below.

```
# touch file1.txt
# ln -s file1.txt /home/tecmint/file1.txt  [create symbolic link]
# ls -l /home/tecmint/ | grep "^l"         [List symbolic links]
```

In the above example, I created a file called `file1.txt` in `/tmp` directory, then created the symbolic link, `/home/tecmint/file1.txt` to point to `/tmp/file1.txt`.

Pipes or Named pipes : These are files that allow inter-process communication by connecting the output of one process to the input of another.

A named pipe is actually a file that is used by two process to communicate with each and it acts as a Linux pipe.

Listing pipes sockets in a directory:

```
# ls -l | grep "^p"
```

Sample Output

```
prw-rw-r-- 1 tecmint tecmint    0 May 18 17:47 pipe1
prw-rw-r-- 1 tecmint tecmint    0 May 18 17:47 pipe2
prw-rw-r-- 1 tecmint tecmint    0 May 18 17:47 pipe3
prw-rw-r-- 1 tecmint tecmint    0 May 18 17:47 pipe4
prw-rw-r-- 1 tecmint tecmint    0 May 18 17:47 pipe5
```

You can use the mkfifo utility to create a named pipe in Linux as follows.

```
# mkfifo pipe1
# echo "This is named pipe1" > pipe1
```

In the above example, I created a named pipe called pipe1, then I passed some data to it using the [echo command][2], after that the shell became un-interactive while processing the input.

Then I opened another shell and run the another command to print out what was passed to pipe.

```
# while read line ;do echo "This was passed-'$line' "; done<pipe1
```

Socket files : These are files that provide a means of inter-process communication, but they can transfer data and information between process running on different environments.

This means that sockets provide data and information transfer between process running on different machines on a network.

An example to show the work of sockets would be a web browser making a connection to a web server.

```
# ls -l /dev/ | grep "^s"
```

Sample Output

```
srw-rw-rw-  1 root root             0 May 18 10:26 log
```

This is an example of a socket create in C by using the `socket()` system call.

```
int socket_desc= socket(AF_INET, SOCK_STREAM, 0 );
```

In the above:

- `AF_INET` is the address family(IPv4)
- `SOCK_STREAM` is the type (connection is TCP protocol oriented)
- `0` is the protocol(IP Protocol)

To refer to the socket file, use the `socket_desc`, which is the same as the file descriptor, and use `read()` and `write()` system calls to read and write from the socket respectively.

### Directories

These are special files that store both ordinary and other special files and they are organized on the Linux file system in a hierarchy starting from the root (/) directory.

Listing sockets in a directory:

```
# ls -l / | grep "^d" 
```

Sample Output

```
drwxr-xr-x   2 root root  4096 May  5 15:49 bin
drwxr-xr-x   4 root root  4096 May  5 15:58 boot
drwxr-xr-x   2 root root  4096 Apr 11  2015 cdrom
drwxr-xr-x  17 root root  4400 May 18 10:27 dev
drwxr-xr-x 168 root root 12288 May 18 10:28 etc
drwxr-xr-x   3 root root  4096 Apr 11  2015 home
drwxr-xr-x  25 root root  4096 May  5 15:44 lib
drwxr-xr-x   2 root root  4096 May  5 15:44 lib64
drwx------   2 root root 16384 Apr 11  2015 lost+found
drwxr-xr-x   3 root root  4096 Apr 10  2015 media
drwxr-xr-x   3 root root  4096 Feb 23 17:54 mnt
drwxr-xr-x  16 root root  4096 Apr 30 16:01 opt
dr-xr-xr-x 223 root root     0 May 18 15:54 proc
drwx------  19 root root  4096 Apr  9 11:12 root
drwxr-xr-x  27 root root   920 May 18 10:54 run
drwxr-xr-x   2 root root 12288 May  5 15:57 sbin
drwxr-xr-x   2 root root  4096 Dec  1  2014 srv
dr-xr-xr-x  13 root root     0 May 18 15:54 sys
drwxrwxrwt  13 root root  4096 May 18 17:55 tmp
drwxr-xr-x  11 root root  4096 Mar 31 16:00 usr
drwxr-xr-x  12 root root  4096 Nov 12  2015 var
```

You can make a directory using the mkdir command.

```
# mkdir -m 1666 tecmint.com
# mkdir -m 1666 news.tecmint.com
# mkdir -m 1775 linuxsay.com
```

### Summary

You should now be having a clear understanding of why everything in Linux is a file and the different types of files that can exit on your Linux system.

You can add more to this by reading more about the individual file types and they are created. I hope this find this guide helpful and for any questions and additional information that you would love to share, please leave a comment and we shall discuss more.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/explanation-of-everything-is-a-file-and-types-of-files-in-linux/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Aaron Kili][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/manage-file-types-and-set-system-time-in-linux/
[2]: http://www.tecmint.com/echo-command-in-linux/
