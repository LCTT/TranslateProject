rtop – An Interactive Tool to Monitor Remote Linux Server Over SSH
============================================================

rtop is a straightforward and interactive, [remote system monitoring tool][2] based on SSH that collects and shows important system performance values such as CPU, disk, memory, network metrics.

It is written in [Go Language][3] and does not require any extra programs to be installed on the server that you want to monitor except SSH server and working credentials.

rtop basically functions by launching an SSH session, and [executing certain commands on the remote server][4] to gather various system performance information.

Once an SSH session is been established, it keeps refreshing the information collected from the remote server every few seconds (5 seconds by default), similar to all other [top-like utilities (like htop)][5] in Linux.

#### Prerequisites:

Make sure you have installed Go (GoLang) 1.2 or higher on your Linux system in order to install rtop, otherwise click on the link below to follow the GoLang installation steps:

1.  [Install GoLang (Go Programming Language) in Linux][1]

### How to Install rtop in Linux Systems

If you have Go installed, run the command below to build rtop:

```
$ go get github.com/rapidloop/rtop
```

The rtop executable binary will be saved in $GOPATH/bin or $GOBIN once the command completes executing.

[
 ![Build rtop in Linux](http://www.tecmint.com/wp-content/uploads/2017/02/Build-rtop-Tool.png) 
][6]

Build rtop in Linux

Note: You do not need any runtime dependencies or configurations to start using rtop.

### How to Use rtop in Linux Systems

Try to run rtop without any flags and arguments as below, it will display a usage message:

```
$ $GOBIN/rtop
```

##### Sample Output

```
rtop 1.0 - (c) 2015 RapidLoop - MIT Licensed - http://rtop-monitor.org
rtop monitors server statistics over an ssh connection
Usage: rtop [-i private-key-file] [user@]host[:port] [interval]
-i private-key-file
PEM-encoded private key file to use (default: ~/.ssh/id_rsa if present)
[user@]host[:port]
the SSH server to connect to, with optional username and port
interval
refresh interval in seconds (default: 5)
```

Now let’s monitor the remote Linux server using rtop as follows, while refreshing the information gathered after an interval of 5 seconds by default:

```
$ $GOBIN/rtop   aaronkilik@10.42.0.1 
```
[
 ![rtop - Monitor Remote Linux Server](http://www.tecmint.com/wp-content/uploads/2017/02/Monitor-Remote-Linux-Server.png) 
][7]

rtop – Monitor Remote Linux Server

The command below will refresh the system performance metrics collected after every 10 seconds:

```
$ $GOBIN/rtop aaronkilik@10.42.0.1 10
```

rtop can also connect using ssh-agent, [private keys][8] or password authentication.

Visit rtop Github repository: [https://github.com/rapidloop/rtop][9]

As a concluding remark, rtop is a simple and easy-to-use remote server monitoring tool, it uses very few and direct options. You can as well read about several other [command line tools to monitor your system][10] so as to improve your [Linux performance monitoring][11] skills.

Lastly, get in touch with us via the comment section below for any questions or remarks.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/rtop-monitor-remote-linux-server-over-ssh/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-go-in-linux/
[2]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[3]:http://www.tecmint.com/install-go-in-linux/
[4]:http://www.tecmint.com/execute-commands-on-multiple-linux-servers-using-pssh/
[5]:http://www.tecmint.com/install-htop-linux-process-monitoring-for-rhel-centos-fedora/
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Build-rtop-Tool.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Monitor-Remote-Linux-Server.png
[8]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[9]:https://github.com/rapidloop/rtop
[10]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[11]:http://www.tecmint.com/linux-performance-monitoring-tools/
