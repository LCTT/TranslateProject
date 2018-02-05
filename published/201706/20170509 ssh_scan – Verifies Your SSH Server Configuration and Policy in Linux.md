ssh_scan：远程验证你 SSH 服务的配置和策略
============================================================

`ssh_scan` 是一个面向 Linux 和 UNIX 服务器的易用的 SSH 服务参数配置和策略的扫描器程序，其思路来自[Mozilla OpenSSH 安全指南][6]，这个指南为 SSH 服务参数配置提供了一个可靠的安全策略基线的建议，如加密算法（Ciphers），报文认证信息码算法（MAC），密钥交换算法（KexAlgos）和其它。

`ssh_scan` 有如下好处：

* 它的依赖是最小化的，`ssh_scan` 只引入了本地 Ruby 和 BinData 来进行它的工作，没有太多的依赖。
* 它是可移植的，你可以在其它的项目中使用 `ssh_scan` 或者将它用在[自动化任务][1]上。
* 它是易于使用的，只需要简单的将它指向一个 SSH 服务就可以获得一个该服务所支持的选项和策略状态的 JSON 格式报告。
* 它同时也是易于配置的，你可以创建适合你策略需求的策略。

**建议阅读:** [如何在 Linux 上安装配置 OpenSSH 服务][7]

### 如何在 Linux 上安装 ssh_scan

有如下三种安装 `ssh_scan` 的方式：

使用 Ruby gem 来安装运行，如下：

```
----------- 在 Debian/Ubuntu ----------- 
$ sudo apt-get install ruby gem
$ sudo gem install ssh_scan
----------- 在 CentOS/RHEL ----------- 
# yum install ruby rubygem
# gem install ssh_scan
```

使用[docker 容器][8]来运行，如下：

```
# docker pull mozilla/ssh_scan
# docker run -it mozilla/ssh_scan /app/bin/ssh_scan -t github.com
```

使用源码安装运行，如下：

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

### 如何在 Linux 上使用 ssh_scan

使用 `ssh_scan` 的语法如下：

```
$ ssh_scan -t ip地址
$ ssh_scan -t 主机名
```

举个例子来扫描 192.168.43.198 这台服务器的 SSH 配置和策略，键入：

```
$ ssh_scan -t 192.168.43.198
```

注意你同时也可以像下方展示的给 `-t` 选项传入一个[IP地址/地址段/主机名]：

```
$ ssh_scan -t 192.168.43.198,200,205
$ ssh_scan -t test.tecmint.lan
```

输出示例：

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

你可以使用 `-p` 选项来指定不同的端口，`-L` 选项来开启日志记录配合 `-V` 选项来指定日志级别：

```
$ ssh_scan -t 192.168.43.198 -p 22222 -L ssh-scan.log -V INFO
```

另外，可以使用 `-P` 或 `--policy` 选项来指定一个策略文件（默认是 Mozilla Modern）（LCTT 译注：这里的 Modern 可能指的是 https://wiki.mozilla.org/Security/Server_Side_TLS 中提到的 Modern compatibility ）：

```
$ ssh_scan -t 192.168.43.198 -L ssh-scan.log -V INFO -P /path/to/custom/policy/file
```

ssh_scan 使用帮助与其它示例：

```
$ ssh_scan -h
```

输出示例：

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

SSH 服务器相关参考阅读：

1.  [使用 SSH Keygen（ssh-keygen）五步实现 SSH 免密登录][2]
2.  [安全 SSH 服务器的 5 个最佳实践][3]
3.  [使用 Chroot 来限制 SSH 用户进入某些目录][4]
4.  [如何配置 SSH 连接来简化远程登录][5]

如果需要更详细的信息可以访问 `ssh_scan` 的 Github 仓库：[https://github.com/mozilla/ssh_scan][9]


--------------------------------------------------------------------------------
作者简介：

Aaron Kili 是 Linux 与 F.O.S.S （自由及开源软件）爱好者，一位将来的 Linux 系统管理员，网站开发者，现在是一个热爱与计算机一起工作并且拥有强烈知识分信念的 TecMint 内容贡献者。

------------------

via: https://www.tecmint.com/ssh_scan-ssh-configuration-and-policy-scanner-for-linux/

作者：[Aaron Kili][a]
译者：[wcnnbdk1](https://github.com/wcnnbdk1)
校对：[wxy](https://github.com/wxy)

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
[15]:https://www.tecmint.com/author/aaronkili/
