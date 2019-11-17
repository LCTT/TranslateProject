[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (14 SCP Command Examples to Securely Transfer Files in Linux)
[#]: via: (https://www.linuxtechi.com/scp-command-examples-in-linux/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

14 SCP Command Examples to Securely Transfer Files in Linux
======

**SCP** (Secure Copy) is command line tool in Linux and Unix like systems which is used to transfer files and directories across the systems securely over the network. When we use scp command to copy files and directories from our local system to remote system then in the backend it makes **ssh connection** to remote system. In other words, we can say scp uses the same **SSH security mechanism** in the backend, it needs either password or keys for authentication.

[![scp-command-examples-linux][1]][2]

In this tutorial we will discuss 14 useful Linux scp command examples.

**Syntax of scp command:**

### scp &lt;options&gt; &lt;files_or_directories&gt; [root@linuxtechi][3]_host:/&lt;folder&gt;

### scp &lt;options&gt; [root@linuxtechi][3]_host:/files   &lt;folder_local_system&gt;

First syntax of scp command demonstrate how to copy files or directories from local system to target host under the specific folder.

Second syntax of scp command demonstrate how files from target host is copied into local system.

Some of the most widely used options in scp command are listed below,

  *  -C         Enable Compression
  *  -i           identity File or private key
  *  -l           limit the bandwidth while copying
  *  -P          ssh port number of target host
  *  -p          Preserves permissions, modes and access time of files while copying
  *  -q          Suppress warning message of SSH
  *   -r          Copy files and directories recursively
  *   -v          verbose output



Let’s jump into the examples now!!!!

###### Example:1) Copy a file from local system to remote system using scp

Let’s assume we want to copy jdk rpm package from our local Linux system to remote system (172.20.10.8) using scp command, use the following command,

```
[root@linuxtechi ~]$ scp jdk-linux-x64_bin.rpm root@linuxtechi:/opt
root@linuxtechi's password:
jdk-linux-x64_bin.rpm                          100%   10MB  27.1MB/s   00:00
[root@linuxtechi ~]$
```

Above command will copy jdk rpm package file to remote system under /opt folder.

###### Example:2) Copy a file from remote System to local system using scp

Let’s suppose we want to copy a file from remote system to our local system under the /tmp folder, execute the following scp command,

```
[root@linuxtechi ~]$ scp root@linuxtechi:/root/Technical-Doc-RHS.odt /tmp
root@linuxtechi's password:
Technical-Doc-RHS.odt                         100% 1109KB  31.8MB/s   00:00
[root@linuxtechi ~]$ ls -l /tmp/Technical-Doc-RHS.odt
-rwx------. 1 pkumar pkumar 1135521 Oct 19 11:12 /tmp/Technical-Doc-RHS.odt
[root@linuxtechi ~]$
```

######  Example:3) Verbose Output while transferring files using scp (-v)

In scp command, we can enable the verbose output using -v option, using verbose output we can easily find what exactly is happening in the background. This becomes very useful in **debugging connection**, **authentication** and **configuration problems**.

```
root@linuxtechi ~]$ scp -v jdk-linux-x64_bin.rpm root@linuxtechi:/opt
Executing: program /usr/bin/ssh host 172.20.10.8, user root, command scp -v -t /opt
OpenSSH_7.8p1, OpenSSL 1.1.1 FIPS  11 Sep 2018
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: Reading configuration data /etc/ssh/ssh_config.d/05-redhat.conf
debug1: Reading configuration data /etc/crypto-policies/back-ends/openssh.config
debug1: /etc/ssh/ssh_config.d/05-redhat.conf line 8: Applying options for *
debug1: Connecting to 172.20.10.8 [172.20.10.8] port 22.
debug1: Connection established.
…………
debug1: Next authentication method: password
root@linuxtechi's password:
```

###### Example:4) Transfer multiple files to remote system

Multiple files can be copied / transferred to remote system using scp command in one go, in scp command specify the multiple files separated by space, example is shown below

```
[root@linuxtechi ~]$ scp install.txt index.html jdk-linux-x64_bin.rpm root@linuxtechi:/mnt
root@linuxtechi's password:
install.txt                                      100%    0     0.0KB/s   00:00
index.html                                       100%   85KB   7.2MB/s   00:00
jdk-linux-x64_bin.rpm                            100%   10MB  25.3MB/s   00:00
[root@linuxtechi ~]$
```

###### Example:5) Transfer files across two remote hosts

Using scp command we can copy files and directories between two remote hosts, let’s suppose we have a local Linux system which can connect to two remote Linux systems, so from my local linux system I can use scp command to copy files across these two systems,

Syntax:

### scp [root@linuxtechi][3]_hosts1:/&lt;files_to_transfer&gt;  [root@linuxtechi][3]_host2:/&lt;folder&gt;

Example is shown below,

```
# scp root@linuxtechi:~/backup-Oct.zip root@linuxtechi:/tmp
# ssh root@linuxtechi "ls -l /tmp/backup-Oct.zip"
-rwx------. 1 root root 747438080 Oct 19 12:02 /tmp/backup-Oct.zip
```

###### Example:6) Copy files and directories recursively (-r)

Use -r option in scp command to recursively copy the entire directory from one system to another, example is shown below,

```
[root@linuxtechi ~]$ scp -r Downloads root@linuxtechi:/opt
```

Use below command to verify whether Download folder is copied to remote system or not,

```
[root@linuxtechi ~]$ ssh root@linuxtechi "ls -ld /opt/Downloads"
drwxr-xr-x. 2 root root 75 Oct 19 12:10 /opt/Downloads
[root@linuxtechi ~]$
```

###### Example:7) Increase transfer speed by enabling compression (-C)

In scp command, we can increase the transfer speed by enabling the compression using -C option, it will automatically enable compression at source and decompression at destination host.

```
root@linuxtechi ~]$ scp -r -C Downloads root@linuxtechi:/mnt
```

In the above example we are transferring the Download directory with compression enabled.

###### Example:8) Limit bandwidth while copying ( -l )

Use ‘-l’ option in scp command to put limit on bandwidth usage while copying. Bandwidth is specified in Kbit/s, example is shown below,

```
[root@linuxtechi ~]$ scp -l 500 jdk-linux-x64_bin.rpm  root@linuxtechi:/var
```

###### Example:9) Specify different ssh port while scp ( -P)

There can be some scenario where ssh port is changed on destination host, so while using scp command we can specify the ssh port number using ‘-P’ option.

```
[root@linuxtechi ~]$ scp -P 2022 jdk-linux-x64_bin.rpm  root@linuxtechi:/var
```

In above example, ssh port for remote host is “2022”

###### Example:10) Preserves permissions, modes and access time of files while copying (-p)

Use “-p” option in scp command to preserve permissions, access time and modes while copying from source to destination

```
[root@linuxtechi ~]$ scp -p jdk-linux-x64_bin.rpm  root@linuxtechi:/var/tmp
jdk-linux-x64_bin.rpm                            100%   10MB  13.5MB/s   00:00
[root@linuxtechi ~]$
```

###### Example:11) Transferring files in quiet mode ( -q) in scp

Use ‘-q’ option in scp command to suppress transfer progress, warning and diagnostic messages of ssh. Example is shown below,

```
[root@linuxtechi ~]$ scp -q -r Downloads root@linuxtechi:/var/tmp
[root@linuxtechi ~]$
```

###### Example:12) Use Identify file in scp while transferring ( -i )

In most of the Linux environments, keys-based authentication is preferred. In scp command we specify the identify file or private key file using ‘-i’ option, example is shown below,

```
[root@linuxtechi ~]$ scp -i my_key.pem -r Downloads root@linuxtechi:/root
```

In above example, “my_key.pem” is the identity file or private key file.

###### Example:13) Use different ‘ssh_config’ file in scp ( -F)

There are some scenarios where you use different networks to connect to Linux systems, may be some network is behind proxy servers, so in that case we must have different **ssh_config** file.

Different ssh_config file in scp command is specified via ‘-F’ option, example is shown below

```
[root@linuxtechi ~]$ scp -F /home/pkumar/new_ssh_config -r Downloads root@linuxtechi:/root
root@linuxtechi's password:
jdk-linux-x64_bin.rpm                     100%   10MB  16.6MB/s   00:00
backup-Oct.zip                            100%  713MB  41.9MB/s   00:17
index.html                                100%   85KB   6.6MB/s   00:00
[root@linuxtechi ~]$
```

###### Example:14) Use Different Cipher in scp command (-c)

By default, scp uses ‘AES-128’ cipher to encrypt the files. If you want to use another cipher in scp command then use ‘-c’ option followed by cipher name,

Let’s suppose we want to use ‘3des-cbc’ cipher in scp command while transferring the files, run the following scp command

```
[root@linuxtechi ~]# scp -c 3des-cbc -r Downloads root@linuxtechi:/root
```

Use the below command to list ssh and scp ciphers,

```
[root@linuxtechi ~]# ssh -Q cipher localhost | paste -d , -s -
3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc,root@linuxtechi,aes128-ctr,aes192-ctr,aes256-ctr,root@linuxtechi,root@linuxtechi,root@linuxtechi
[root@linuxtechi ~]#
```

That’s all from this tutorial, to get more details about scp command, kindly refer its man page. Please do share your feedback and comments in comments section below.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/scp-command-examples-in-linux/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/10/scp-command-examples-linux.jpg
[3]: https://www.linuxtechi.com/cdn-cgi/l/email-protection
