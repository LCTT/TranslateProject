scp command in Linux
=======================

![](https://www.unixmen.com/wp-content/uploads/2016/05/SCP-LOGO-1.jpg)


scp means Secure Copy Protocol, already every  Linux/Unix  user known about cp command well. scp also works like cp command, cp command copies files or folders  from one location i.e source to other location i.e target in local system, but scp copies the files from one host to another host in network.

The usage of the scp command is as follows, here i copy a file named importantfile from local system(10.10.16.147) to Remote system(10.0.0.6)  here instead of ip address you can also use System name.

```
[root@localhost ~]# scp importantfile admin@10.0.0.6:/home/admin/
The authenticity of host '10.0.0.6 (10.0.0.6)' can't be established.
RSA key fingerprint is SHA256:LqBzkeGa6K9BfWWKgcKlQoE0u+gjorX0lPLx5YftX1Y.
RSA key fingerprint is MD5:ed:44:42:59:3e:dd:4c:12:43:4a:89:b1:5d:bd:9e:20.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.0.0.6' (RSA) to the list of known hosts.
admin@10.0.0.6's password:
importantfile                                 100%    0     0.0KB/s   00:00
[root@localhost ~]#
```

Similarly if you want to get a file from remote system you can use scp command as follows

```
[root@localhost ~]# scp root@10.10.16.137:/root/importantfile /home/admin/
The authenticity of host '10.10.16.137 (10.10.16.137)' can't be established.
RSA key fingerprint is b0:b0:a3:c3:2e:94:13:0c:29:2e:ba:0b:d3:d6:12:8f.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.10.16.137' (RSA) to the list of known hosts.
root@10.10.16.137's password:
importantfile 100% 0 0.0KB/s 00:00
[root@localhost ~]#
```

You can also use various options along with scp command like cp command,The man page of the scp command clearly explain about the usage of various options  and advantages of that.

**Sample Output.**

![](https://www.unixmen.com/wp-content/uploads/2016/05/scp.jpg)

```
The options are as follows:

     -B      Selects batch mode (prevents asking for passwords or passphrases).

     -C      Compression enable.  Passes the -C  to enable compression.

     -c cipher
             Selects the cipher to use for encrypting the data transfer.  This
             option is directly passed to ssh(1).

     -F ssh_config
             Specifies an alternative per-user configuration file for ssh.
             This option is directly passed to ssh(1).

     -l limit
             Limits the used bandwidth, specified in Kbit/s.

     -P port
             Specifies the port to connect to on the remote host.  Note that
             this option is written with a capital ‘P’, because -p is already
             reserved for preserving the times and modes of the file.

     -p      Preserves modification times, access times, and modes from the
             original file.

     -q      Quiet mode: disables the progress meter as well as warning and
             diagnostic messages from ssh(1).

     -r      Recursively copy entire directories.  Note that scp follows sym‐
             bolic links encountered in the tree traversal.

     -v      Verbose mode.  Causes scp and ssh(1) to print debugging messages
             about their progress.  This is helpful in debugging connection,
             authentication, and configuration problems.

```

The scp command along with -v option you can get detailed information about authentication, debugging information etc.

![](http://www.unixmen.com/wp-content/uploads/2016/05/scp-v.jpg)

Sample output is like when we pass the option `-v`

```
[root@localhost ~]# scp -v abc.txt admin@10.0.0.6:/home/admin
Executing: program /usr/bin/ssh host 10.0.0.6, user admin, 
command scp -v -t/home/admin
OpenSSH_7.1p1, OpenSSL 1.0.2d-fips 9 Jul 2015
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 56: Applying options for *
debug1: Connecting to 10.0.0.6 [10.0.0.6] port 22.
debug1: Connection established.
debug1: Server host key: ssh-rsa SHA256:LqBzkeGa6K9BfWWKgcKlQoE0u+gjorX0lPLx5YftX1Y
debug1: Next authentication method: publickey
debug1: Trying private key: /root/.ssh/id_rsa
debug1: Trying private key: /root/.ssh/id_dsa
debug1: Trying private key: /root/.ssh/id_ecdsa
debug1: Trying private key: /root/.ssh/id_ed25519
debug1: Next authentication method: password
admin@10.0.0.6's password:
debug1: Authentication succeeded (password).
Authenticated to 10.0.0.6 ([10.0.0.6]:22).
debug1: channel 0: new [client-session]
debug1: Requesting no-more-sessions@openssh.com
debug1: Entering interactive session.
debug1: Sending environment.
debug1: Sending command: scp -v -t /home/admin
Sending file modes: C0644 174 abc.txt
Sink: C0644 174 abc.txt
abc.txt                                                                                                                               100%  174     0.2KB/s   00:00
Transferred: sent 3024, received 2584 bytes, in 0.3 seconds
Bytes per second: sent 9863.3, received 8428.1
debug1: Exit status 0
[root@localhost ~]#
```

If we need to copy the Directories or folders we can use the option –r. It Recursively copy entire directories

![](http://www.unixmen.com/wp-content/uploads/2016/05/scp-with-r.jpg)

Quiet mode:

If you want  disables the progress meter as well as warning and diagnostic messages pass the argument -q along with scp command.

![](http://www.unixmen.com/wp-content/uploads/2016/05/scp-with-q.jpg)

last time we pass the argument -r only then it shows the information file by file, but when we pass the argument -q it disables the progress meter this time.

Preserves modification times, access times, and modes from the original file by passing the option -p along with scp.

![](http://www.unixmen.com/wp-content/uploads/2016/05/scp-with-p.jpg)

Specifies the port to connect to on the remote host by using the option -P.
scp uses the ssh to transfer the files between hosts, ssh uses the port number 22 so the scp also uses the same port number 22.

If we want to change the port number we can pass the particular port number along with -P(capital P because small p uses for preserving access time etc.)

for example if we want to use port number 2222 then the command is as follows

```
[root@localhost ~]# scp -P 2222  abcd1 root@10.10.16.137:/root/
```

**Limits the used bandwidth, specified in Kbit/s**

we can limit the bandwidth by using the argument -l option as follows. here i used the limit is 512kbit/s

![](http://www.unixmen.com/wp-content/uploads/2016/05/scp-with-l.jpg)

**Compression enable**

we can enable the compression mode when we transfer the data through scp command to save tha bandwidth and time as follows

![](https://www.unixmen.com/wp-content/uploads/2016/05/scp-with-C.jpg)

**Selects the cipher to use for encrypting the data**

By default scp uses AES-128, if we want to change the encryption then we can pass the argument -c(small c) along with scp.

![](http://www.unixmen.com/wp-content/uploads/2016/05/scp-with-cipher.jpg)

Now you can transfer the files between different nodes in your network securely by using scp(Secure copy).

--------------------------------------------------------------------------------

via: https://www.unixmen.com/scp-command-linuxunix/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+unixmenhowtos+%28Unixmen+Howtos+%26+Tutorials%29

作者：[Naga Ramesh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.unixmen.com/author/naga/
