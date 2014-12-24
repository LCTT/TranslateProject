Linux FAQs with Answers--How to check SSH protocol version on Linux
================================================================================
> **Question**: I am aware that there exist SSH protocol version 1 and 2 (SSH1 and SSH2). What is the difference between SSH1 and SSH2, and how can I check which SSH protocol version is supported on a Linux server? 

Secure Shell (SSH) is a network protocol that enables remote login or remote command execution between two hosts over a cryptographically secure communication channel. SSH was designed to replace insecure clear-text protocols such as telnet, rsh or rlogin. SSH provides a number of desirable features such as authentication, encryption, data integrity, authorization, and forwarding/tunneling.

### SSH1 vs. SSH2 ###

The SSH protocol specification has a number of minor version differences, but there are two major versions of the protocol: **SSH1** (SSH version 1.XX) and **SSH2** (SSH version 2.00).

In fact, SSH1 and SSH2 are two entirely different protocols with no compatibility in between. SSH2 is a significantly improved version of SSH1 in many respects. First of all, while SSH1 is a monolithic design where several different functions (e.g., authentication, transport, connection) are packed into a single protocol, SSH2 is a layered architecture designed with extensibility and flexibility in mind. In terms of security, SSH2 comes with a number of stronger security features than SSH1, such as MAC-based integrity check, flexible session re-keying, fully-negotiable cryptographic algorithms, public-key certificates, etc.

SSH2 is standardized by IETF, and as such its implementation is widely deployed and accepted in the industry. Due to SSH2's popularity and cryptographic superiority over SSH1, many products are dropping support for SSH1. As of this writing, OpenSSH still [supports][1] both SSH1 and SSH2, while on all modern Linux distributions, OpenSSH server comes with SSH1 disabled by default.

### Check Supported SSH Protocol Version ###

#### Method One ####

If you want to check what SSH protocol version(s) are supported by a local OpenSSH server, you can refer to **/etc/ssh/sshd_config** file. Open /etc/ssh/sshd_config with a text editor, and look for "Protocol" field.

If it shows the following, it means that OpenSSH server supports SSH2 only.

    Protocol 2

If it displays the following instead, OpenSSH server supports both SSH1 and SSH2.

    Protocol 1,2

#### Method Two ####

If you cannot access /etc/ssh/sshd_config because OpenSSH server is running on a remote server, you can test its SSH protocol support by using SSH client program called ssh. More specifically, we force ssh to use a specific SSH protocol, and see how the remote SSH server responds.

The following command will force ssh command to use SSH1:

    $ ssh -1 user@remote_server

The following command will force ssh command to use SSH2:

    $ ssh -2 user@remote_server

If the remote SSH server supports SSH2 only, the first command with "-1" option will fails with an error message like this:

    Protocol major versions differ: 1 vs. 2

If the SSH server supports both SSH1 and SSH2, both commands should work successfully.

### Method Three ###

Another method to check supported SSH protocol version of a remote SSH server is to run an SSH scanning tool called [scanssh][2]. This command-line tool is useful when you want to check SSH protocol versions for a bulk of IP addresses or the entire local network to upgrade SSH1-capable SSH servers.

Here is the basic syntax of scanssh for SSH version scanning.

    $ sudo scanssh -s ssh -n [ports] [IP addresses or CIDR prefix] 

The "-n" option can specify the SSH port number(s) to scan. You can specify multiple port numbers separated by comma. Without this option, scanssh will scan port 22 by default.

Use the following command to discover SSH servers on 192.168.1.0/24 local nework, and detect their SSH protocol versions:

    $ sudo scan -s ssh 192.168.1.0/24 

![](https://farm8.staticflickr.com/7550/15460750074_95f83217a2_b.jpg)

If scanssh reports "SSH-1.XX-XXXX" for a particular IP address, it implies that the minimum SSH protocol version supported by the corresponding SSH server is SSH1. If the remote server supports SSH2 only, scanssh will show "SSH-2.0-XXXX".

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-ssh-protocol-version-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.openssh.com/specs.html
[2]:http://www.monkey.org/~provos/scanssh/