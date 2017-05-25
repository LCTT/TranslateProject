wcnnbdk1 translating
ssh_scan – Verifies Your SSH Server Configuration and Policy in Linux
============================================================


ssh_scan is an easy-to-use prototype SSH configuration and policy scanner for Linux and UNIX servers, inspired by [Mozilla OpenSSH Security Guide][6], which provides a reasonable baseline policy recommendation for SSH configuration parameters such as Ciphers, MACs, and KexAlgos and much more.

It has some of the following benefits:

*   It has minimal dependencies, ssh_scan only employs native Ruby and BinData to do its work, no heavy dependencies.

*   It’s portable, you can use ssh_scan in another project or for [automation of tasks][1].

*   It’s easy to use, simply point it at an SSH service and get a JSON report of what it supports and it’s policy status.

*   It’s also configurable, you can create your own custom policies that fit your specific policy requirements.

**Suggested Read:** [How to Install and Configure OpenSSH Server in Linux][7]

### How to Install ssh_scan in Linux

There are three ways you can install ssh_scan and they are:

To install and run as a gem, type:

```
----------- On Debian/Ubuntu ----------- 
$ sudo apt-get install ruby gem
$ sudo gem install ssh_scan
----------- On CentOS/RHEL ----------- 
# yum install ruby rubygem
# gem install ssh_scan
```

To run from a [docker container][8], type:

```
# docker pull mozilla/ssh_scan
# docker run -it mozilla/ssh_scan /app/bin/ssh_scan -t github.com
```

To install and run from source, type:

```
# git clone https://github.com/mozilla/ssh_scan.git
# cd ssh_scan
# gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# curl -sSL https://get.rvm.io | bash -s stable
# rvm install 2.3.1
# rvm use 2.3.1
# gem install bundler
# bundle install
# ./bin/ssh_scan
```

### How to Use ssh_scan in Linux

The syntax for using ssh_scan is as follows:

```
$ ssh_scan -t ip-address
$ ssh_scan -t server-hostname
```

For example to scan SSH configs and policy of server 92.168.43.198, enter:

```
$ ssh_scan -t 192.168.43.198
```

Note you can also pass a [IP/Range/Hostname] to the `-t` option as shown in the options below:

```
$ ssh_scan -t 192.168.43.198,200,205
$ ssh_scan -t test.tecmint.lan
```

##### Sample Output

```
I, [2017-05-09T10:36:17.913644 #7145]  INFO -- : You're using the latest version of ssh_scan 0.0.19
[
{
"ssh_scan_version": "0.0.19",
"ip": "192.168.43.198",
"port": 22,
"server_banner": "SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.1",
"ssh_version": 2.0,
"os": "ubuntu",
"os_cpe": "o:canonical:ubuntu:16.04",
"ssh_lib": "openssh",
"ssh_lib_cpe": "a:openssh:openssh:7.2p2",
"cookie": "68b17bcca652eeaf153ed18877770a38",
"key_algorithms": [
"curve25519-sha256@libssh.org",
"ecdh-sha2-nistp256",
"ecdh-sha2-nistp384",
"ecdh-sha2-nistp521",
"diffie-hellman-group-exchange-sha256",
"diffie-hellman-group14-sha1"
],
"server_host_key_algorithms": [
"ssh-rsa",
"rsa-sha2-512",
"rsa-sha2-256",
"ecdsa-sha2-nistp256",
"ssh-ed25519"
],
"encryption_algorithms_client_to_server": [
"chacha20-poly1305@openssh.com",
"aes128-ctr",
"aes192-ctr",
"aes256-ctr",
"aes128-gcm@openssh.com",
"aes256-gcm@openssh.com"
],
"encryption_algorithms_server_to_client": [
"chacha20-poly1305@openssh.com",
"aes128-ctr",
"aes192-ctr",
"aes256-ctr",
"aes128-gcm@openssh.com",
"aes256-gcm@openssh.com"
],
"mac_algorithms_client_to_server": [
"umac-64-etm@openssh.com",
"umac-128-etm@openssh.com",
"hmac-sha2-256-etm@openssh.com",
"hmac-sha2-512-etm@openssh.com",
"hmac-sha1-etm@openssh.com",
"umac-64@openssh.com",
"umac-128@openssh.com",
"hmac-sha2-256",
"hmac-sha2-512",
"hmac-sha1"
],
"mac_algorithms_server_to_client": [
"umac-64-etm@openssh.com",
"umac-128-etm@openssh.com",
"hmac-sha2-256-etm@openssh.com",
"hmac-sha2-512-etm@openssh.com",
"hmac-sha1-etm@openssh.com",
"umac-64@openssh.com",
"umac-128@openssh.com",
"hmac-sha2-256",
"hmac-sha2-512",
"hmac-sha1"
],
"compression_algorithms_client_to_server": [
"none",
"zlib@openssh.com"
],
"compression_algorithms_server_to_client": [
"none",
"zlib@openssh.com"
],
"languages_client_to_server": [
],
"languages_server_to_client": [
],
"hostname": "tecmint",
"auth_methods": [
"publickey",
"password"
],
"fingerprints": {
"rsa": {
"known_bad": "false",
"md5": "0e:d0:d7:11:f0:9b:f8:33:9c:ab:26:77:e5:66:9e:f4",
"sha1": "fc:8d:d5:a1:bf:52:48:a6:7e:f9:a6:2f:af:ca:e2:f0:3a:9a:b7:fa",
"sha256": "ff:00:b4:a4:40:05:19:27:7c:33:aa:db:a6:96:32:88:8e:bf:05:a1:81:c0:a4:a8:16:01:01:0b:20:37:81:11"
}
},
"start_time": "2017-05-09 10:36:17 +0300",
"end_time": "2017-05-09 10:36:18 +0300",
"scan_duration_seconds": 0.221573169,
"duplicate_host_key_ips": [
],
"compliance": {
"policy": "Mozilla Modern",
"compliant": false,
"recommendations": [
"Remove these Key Exchange Algos: diffie-hellman-group14-sha1",
"Remove these MAC Algos: umac-64-etm@openssh.com, hmac-sha1-etm@openssh.com, umac-64@openssh.com, hmac-sha1",
"Remove these Authentication Methods: password"
],
"references": [
"https://wiki.mozilla.org/Security/Guidelines/OpenSSH"
]
}
}
]
```

You can use `-p` to specify a different port, `-L` to enable the logger and `-V` to define the verbosity level as shown below:

```
$ ssh_scan -t 192.168.43.198 -p 22222 -L ssh-scan.log -V INFO
```

Additionally, use a custom policy file (default is Mozilla Modern) with the `-P` or `--policy [FILE]` like so:

```
$ ssh_scan -t 192.168.43.198 -L ssh-scan.log -V INFO -P /path/to/custom/policy/file
```

Type this to view all ssh_scan usage options and more examples:

```
$ ssh_scan -h
```

##### Sample Output

```
ssh_scan v0.0.17 (https://github.com/mozilla/ssh_scan)
Usage: ssh_scan [options]
-t, --target [IP/Range/Hostname] IP/Ranges/Hostname to scan
-f, --file [FilePath]            File Path of the file containing IP/Range/Hostnames to scan
-T, --timeout [seconds]          Timeout per connect after which ssh_scan gives up on the host
-L, --logger [Log File Path]     Enable logger
-O, --from_json [FilePath]       File to read JSON output from
-o, --output [FilePath]          File to write JSON output to
-p, --port [PORT]                Port (Default: 22)
-P, --policy [FILE]              Custom policy file (Default: Mozilla Modern)
--threads [NUMBER]           Number of worker threads (Default: 5)
--fingerprint-db [FILE]      File location of fingerprint database (Default: ./fingerprints.db)
--suppress-update-status     Do not check for updates
-u, --unit-test [FILE]           Throw appropriate exit codes based on compliance status
-V [STD_LOGGING_LEVEL],
--verbosity
-v, --version                    Display just version info
-h, --help                       Show this message
Examples:
ssh_scan -t 192.168.1.1
ssh_scan -t server.example.com
ssh_scan -t ::1
ssh_scan -t ::1 -T 5
ssh_scan -f hosts.txt
ssh_scan -o output.json
ssh_scan -O output.json -o rescan_output.json
ssh_scan -t 192.168.1.1 -p 22222
ssh_scan -t 192.168.1.1 -p 22222 -L output.log -V INFO
ssh_scan -t 192.168.1.1 -P custom_policy.yml
ssh_scan -t 192.168.1.1 --unit-test -P custom_policy.yml
```

Check out some useful artilces on SSH Server:

1.  [SSH Passwordless Login Using SSH Keygen in 5 Easy Steps][2]

2.  [5 Best Practices to Secure SSH Server][3]

3.  [Restrict SSH User Access to Certain Directory Using Chrooted Jail][4]

4.  [How to Configure Custom SSH Connections to Simplify Remote Access][5]

For more details visit ssh_scan Github repository: [https://github.com/mozilla/ssh_scan][9]

In this article, we showed you how to set up and use ssh_scan in Linux. Do you know of any similar tools out there? Let us know via the feedback form below, including any other thoughts concerning this guide.

SHARE[+][10][0][11][20][12][25][13] [![Ask Anything](https://www.tecmint.com/wp-content/themes/tecmint/images/help.png)][14]

--------------------------------------------------------------------------------
作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

------------------

via: https://www.tecmint.com/ssh_scan-ssh-configuration-and-policy-scanner-for-linux/

作者：[Aaron Kili  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/automating-linux-system-administration-tasks/
[2]:https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[3]:https://www.tecmint.com/5-best-practices-to-secure-and-protect-ssh-server/
[4]:https://www.tecmint.com/restrict-ssh-user-to-directory-using-chrooted-jail/
[5]:https://www.tecmint.com/configure-custom-ssh-connection-in-linux/
[6]:https://wiki.mozilla.org/Security/Guidelines/OpenSSH
[7]:https://www.tecmint.com/install-openssh-server-in-linux/
[8]:https://www.tecmint.com/install-docker-and-learn-containers-in-centos-rhel-7-6/
[9]:https://github.com/mozilla/ssh_scan
[10]:https://www.tecmint.com/ssh_scan-ssh-configuration-and-policy-scanner-for-linux/#
[11]:https://www.tecmint.com/ssh_scan-ssh-configuration-and-policy-scanner-for-linux/#
[12]:https://www.tecmint.com/ssh_scan-ssh-configuration-and-policy-scanner-for-linux/#
[13]:https://www.tecmint.com/ssh_scan-ssh-configuration-and-policy-scanner-for-linux/#
[14]:https://www.tecmint.com/ssh_scan-ssh-configuration-and-policy-scanner-for-linux/#comments
[15]:https://www.tecmint.com/author/aaronkili/
[16]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[17]:https://www.tecmint.com/free-linux-shell-scripting-books/
