How to Configure Custom SSH Connections to Simplify Remote Access
============================================================

SSH (SSH client) is a program for remotely accessing a machine, it enables a user to [execute commands on a remote host][2]. It is one of the most recommended method for logging in to a remote host, since it is designed to provide secure encrypted communications between two untrusted hosts over an insecure network.

SSH uses both a system-wide as well as a user-specific (custom) configuration file. In this tutorial, we will explain how to create a custom ssh configuration file and use certain options to connect to remote hosts.

#### Requirements:

1.  You must have installed [OpenSSH client on your Linux desktop][1].
2.  Understand the common options used for remote connections via ssh.

#### SSH Client Config Files

Below are the locations of the ssh client configuration files:

1.  `/etc/ssh/ssh_config` – this is the default, system-wide configuration file. It contains settings that apply to all users of ssh client machine.
2.  `~/.ssh/config` or `$HOME/.ssh/config` – is the user-specific/custom configuration file. It has configurations that apply to a specific user. It therefore overrides default settings in the system-wide config file. This is the file we will create and use.

By default, users are authenticated in ssh using passwords, however, you can setup [ssh passwordless login using ssh keygen][3] in 5 simple steps.

Note: In case the directory `~/.ssh` does not exist on your desktop system, create it with the following permissions.

```
$ mkdir -p ~/.ssh
$ chmod 0700 ~/.ssh   
```

The chmod command above implies that only the user can have read, write and execute permissions on the directory as required by ssh settings.

### How To Create User Specific SSH Configuration File

This file is usually not created by default, so you need to create it with the read/write permissions for only the user.

```
$ touch ~/.ssh/config
$ chmod 0700 ~/.ssh/config
```

The above file contains sections defined by hosts specifications, and a section is only applied to hosts that match one of the patterns set in the specification.

The conventional format of `~/.ssh/config` is as follows, and all empty lines as well as lines starting with `‘#’` are considered as comments:

```
Host    host1
ssh_option1=value1
ssh_option2=value1 value2
ssh_option3=value1 
Host    host2
ssh_option1=value1
ssh_option2=value1 value2
Host  *
ssh_option1=value1
ssh_option2=value1 value2
```

From the format above:

1.  Host host1 – is a header definition for host1, this is where a host specification starts and it ends with the next header definition, Host host2 making a section.
2.  host1, host2 are simply host aliases to use on the command line, they are not the actual hostnames of the remote hosts.
3.  The configuration options such as ssh_option1=value1, ssh_option2=value1 value2 apply to a matched host and should be indented for well organized formatting.
4.  For an option such as ssh_option2=value1 value2, the value value1 is considered first, then value2.
5.  The header definition Host * (where `*` is a pattern – wildcard that matches zero or more characters) will match zero or more hosts.

Still considering the format above, this is how ssh reads the config file. If you execute a ssh command to remotely access host1 like so:

```
$ ssh host1
```

The above ssh command will does the following things:

1.  match the host alias host1 in the config file and applies the options set under the definition header, Host host1.
2.  then moves to the next host section, Host host2 and finds that the name provided on the command line doesn’t match, so no options are used from here.
3.  It proceeds to the last section, Host *, which matches all hosts. Here, it applies all the options in this section to the host connection. But it can not override any values of options that where already used in the previous section(s).
4.  The same applies to host2.

### How To Use User Specific SSH Configuration File

Once you have understood how the ssh client config file works, you can create it as follows. Remember to use options and values (host aliases, port numbers, usernames and so on) applicable to your server environment.

Open the config file with your favorite editor:

```
$ vi ~/.ssh/config
```

And define the necessary sections:

```
Host fedora25
HostName 192.168.56.15
Port 22
ForwardX11 no
Host centos7
HostName 192.168.56.10
Port 22
ForwardX11 no
Host ubuntu
HostName 192.168.56.5
Port 2222
ForwardX11 yes
Host *
User tecmint
IdentityFile ~/.ssh/id_rsa
Protocol 2
Compression yes
ServerAliveInterval 60
ServerAliveCountMax 20
LogLevel INFO
```

A detailed explanation of the above ssh configuration options.

1.  HostName – defines the real host name to log into, alternatively, you can use a numeric IP addresses, it is also permitted (both on the command line and in HostName specifications).
2.  User – specifies the user to log in as.
3.  Port – sets the port number to connect on the remote host, the default is 22. Use the port number configured in the remote host’s sshd config file.
4.  Protocol – this option defines the protocol versions ssh should support in order of preference. The usual values are ‘1’ and ‘2’, multiple versions must be comma-separated.
5.  IdentityFile – specifies a file from which the user’s DSA, Ed25519, RSA or ECDSA authentication identity is read.
6.  ForwardX11 – defines whether X11 connections will be automatically redirected over the secure channel and DISPLAY set. It has two possible values “yes” or “no”.
7.  Compression – it’s used to set compression during the remote connection with the “yes” value. The default is “no”.
8.  ServerAliveInterval – sets a timeout interval in seconds after which if no response (or data) has been received from the server, ssh will send a message through the encrypted channel to request a response from the server. The default value is 0, meaning no messages will be sent to the server, or 300 if the BatchMode option has been defined.
9.  ServerAliveCountMax – sets the number of server alive messages which may be sent without ssh receiving any response from the server.
10.  LogLevel – defines the verbosity level that is used when logging messages from ssh. The allowed values includes: QUIET, FATAL, ERROR, INFO, VERBOSE, DEBUG, DEBUG1, DEBUG2, and DEBUG3\. And the default is INFO.

The standard way of connecting to any remote Linux host (CentOS 7 – in my case), defined in section two of the config file above, we would normally type the command below:

```
$ ssh -i ~/.ssh/id_rsa -p 22 tecmint@192.168.56.10
```

However, with the use of the ssh client configuration file, we can simply type the following command:

```
$ ssh centos7 
```

You can find more options and usage examples in the ssh client config man page:

```
$man ssh_config
```

That’s it for now, in this guide, we explained you how to use a user-specific (custom) ssh client config file in Linux. Use the feedback form below to write back to us concerning this article.

--------------------------------------------------------------------------------

译者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/configure-custom-ssh-connection-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-openssh-server-in-linux/
[2]:http://www.tecmint.com/execute-commands-on-multiple-linux-servers-using-pssh/
[3]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
