Top 20 OpenSSH Server Best Security Practices
======
![OpenSSH Security Tips][1]

OpenSSH is the implementation of the SSH protocol. OpenSSH is recommended for remote login, making backups, remote file transfer via scp or sftp, and much more. SSH is perfect to keep confidentiality and integrity for data exchanged between two networks and systems. However, the main advantage is server authentication, through the use of public key cryptography. From time to time there are [rumors][2] about OpenSSH zero day exploit. This **page shows how to secure your OpenSSH server running on a Linux or Unix-like system to improve sshd security**.


#### OpenSSH defaults

  * TCP port - 22
  * OpenSSH server config file - sshd_config (located in /etc/ssh/)



#### 1. Use SSH public key based login

OpenSSH server supports various authentication. It is recommended that you use public key based authentication. First, create the key pair using following ssh-keygen command on your local desktop/laptop:

DSA and RSA 1024 bit or lower ssh keys are considered weak. Avoid them. RSA keys are chosen over ECDSA keys when backward compatibility is a concern with ssh clients. All ssh keys are either ED25519 or RSA. Do not use any other type.

```
$ ssh-keygen -t key_type -b bits -C "comment"
$ ssh-keygen -t ed25519 -C "Login to production cluster at xyz corp"
$ ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_aws_$(date +%Y-%m-%d) -C "AWS key for abc corp clients"
```
Next, install the public key using ssh-copy-id command:
```
$ ssh-copy-id -i /path/to/public-key-file user@host
$ ssh-copy-id user@remote-server-ip-or-dns-name
$ ssh-copy-id vivek@rhel7-aws-server
```
When promoted supply user password. Verify that ssh key based login working for you:
`$ ssh vivek@rhel7-aws-server`
[![OpenSSH server security best practices][3]][3]
For more info on ssh public key auth see:

*   [keychain: Set Up Secure Passwordless SSH Access For Backup Scripts][48]

*   [sshpass: Login To SSH Server / Provide SSH Password Using A Shell Script][49]

*   [How To Setup SSH Keys on a Linux / Unix System][50]

*   [How to upload ssh public key to as authorized_key using Ansible DevOPS tool][51]


#### 2. Disable root user login

Before we disable root user login, make sure regular user can log in as root. For example, allow vivek user to login as root using the sudo command.

##### How to add vivek user to sudo group on a Debian/Ubuntu

Allow members of group sudo to execute any command. [Add user vivek to sudo group][4]:
`$ sudo adduser vivek sudo`
Verify group membership with [id command][5]
`$ id vivek`

##### How to add vivek user to sudo group on a CentOS/RHEL server

Allows people in group wheel to run all commands on a CentOS/RHEL and Fedora Linux server. Use the usermod command to add the user named vivek to the wheel group:
```
$ sudo usermod -aG wheel vivek
$ id vivek
```

##### Test sudo access and disable root login for ssh

Test it and make sure user vivek can log in as root or run the command as root:
```
$ sudo -i
$ sudo /etc/init.d/sshd status
$ sudo systemctl status httpd
```
Once confirmed disable root login by adding the following line to sshd_config:
```
PermitRootLogin no
ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
```
See "[How to disable ssh password login on Linux to increase security][6]" for more info.

#### 3. Disable password based login

All password-based logins must be disabled. Only public key based logins are allowed. Add the following in your sshd_config file:
```
AuthenticationMethods publickey
PubkeyAuthentication yes
```
Older version of SSHD on CentOS 6.x/RHEL 6.x user should use the following setting:
```
PubkeyAuthentication yes
```

#### 4. Limit Users' ssh access

By default, all systems user can login via SSH using their password or public key. Sometimes you create UNIX / Linux user account for FTP or email purpose. However, those users can log in to the system using ssh. They will have full access to system tools including compilers and scripting languages such as Perl, Python which can open network ports and do many other fancy things. Only allow root, vivek and jerry user to use the system via SSH, add the following to sshd_config:
`AllowUsers vivek jerry`
Alternatively, you can allow all users to login via SSH but deny only a few users, with the following line in sshd_config:
`DenyUsers root saroj anjali foo`
You can also [configure Linux PAM][7] allows or deny login via the sshd server. You can allow [list of group name][8] to access or deny access to the ssh.

#### 5. Disable Empty Passwords

You need to explicitly disallow remote login from accounts with empty passwords, update sshd_config with the following line:
`PermitEmptyPasswords no`

#### 6. Use strong passwords and passphrase for ssh users/keys

It cannot be stressed enough how important it is to use strong user passwords and passphrase for your keys. Brute force attack works because user goes to dictionary based passwords. You can force users to avoid [passwords against a dictionary][9] attack and use [john the ripper tool][10] to find out existing weak passwords. Here is a sample random password generator (put in your ~/.bashrc):
```
genpasswd() {
	local l=$1
       	[ "$l" == "" ] && l=20
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
```

Run it:
`genpasswd 16`
Output:
```
uw8CnDVMwC6vOKgW
```
*   [Generating Random Password With mkpasswd / makepasswd / pwgen][52]

*   [Linux / UNIX: Generate Passwords][53]

*   [Linux Random Password Generator Command][54]

--------------------------------------------------------------------------------

#### 7. Firewall SSH TCP port # 22

You need to firewall ssh TCP port # 22 by updating iptables/ufw/firewall-cmd or pf firewall configurations. Usually, OpenSSH server must only accept connections from your LAN or other remote WAN sites only.

##### Netfilter (Iptables) Configuration

Update [/etc/sysconfig/iptables (Redhat and friends specific file) to accept connection][11] only from 192.168.1.0/24 and 202.54.1.5/29, enter:
```
-A RH-Firewall-1-INPUT -s 192.168.1.0/24 -m state --state NEW -p tcp --dport 22 -j ACCEPT
-A RH-Firewall-1-INPUT -s 202.54.1.5/29 -m state --state NEW -p tcp --dport 22 -j ACCEPT
```

If you've dual stacked sshd with IPv6, edit /etc/sysconfig/ip6tables (Redhat and friends specific file), enter:
```
-A RH-Firewall-1-INPUT -s ipv6network::/ipv6mask -m tcp -p tcp --dport 22 -j ACCEPT

```

Replace ipv6network::/ipv6mask with actual IPv6 ranges.

##### UFW for Debian/Ubuntu Linux

[UFW is an acronym for uncomplicated firewall. It is used for managing a Linux firewall][12] and aims to provide an easy to use interface for the user. Use the [following command to accept port 22 from 202.54.1.5/29][13] only:
`$ sudo ufw allow from 202.54.1.5/29 to any port 22`
Read "[Linux: 25 Iptables Netfilter Firewall Examples For New SysAdmins][14]" for more info.

##### *BSD PF Firewall Configuration

If you are using PF firewall update [/etc/pf.conf][15] as follows:
```
pass in on $ext_if inet proto tcp from {192.168.1.0/24, 202.54.1.5/29} to $ssh_server_ip port ssh flags S/SA synproxy state
```

#### 8. Change SSH Port and limit IP binding

By default, SSH listens to all available interfaces and IP address on the system. Limit ssh port binding and change ssh port (many brutes forcing scripts only try to connect to TCP port # 22). To bind to 192.168.1.5 and 202.54.1.5 IPs and port 300, add or correct the following line in sshd_config:
```
Port 300 
ListenAddress 192.168.1.5
ListenAddress 202.54.1.5
```

Port 300 ListenAddress 192.168.1.5 ListenAddress 202.54.1.5

A better approach to use proactive approaches scripts such as fail2ban or denyhosts when you want to accept connection from dynamic WAN IP address.

#### 9. Use TCP wrappers (optional)

TCP Wrapper is a host-based Networking ACL system, used to filter network access to the Internet. OpenSSH does support TCP wrappers. Just update your /etc/hosts.allow file as follows to allow SSH only from 192.168.1.2 and 172.16.23.12 IP address:
```
sshd : 192.168.1.2 172.16.23.12
```

See this [FAQ about setting and using TCP wrappers][16] under Linux / Mac OS X and UNIX like operating systems.

#### 10. Thwart SSH crackers/brute force attacks

Brute force is a method of defeating a cryptographic scheme by trying a large number of possibilities (combination of users and passwords) using a single or distributed computer network. To prevents brute force attacks against SSH, use the following software:

  * [DenyHosts][17] is a Python based security tool for SSH servers. It is intended to prevent brute force attacks on SSH servers by monitoring invalid login attempts in the authentication log and blocking the originating IP addresses.
  * Explains how to setup [DenyHosts][18] under RHEL / Fedora and CentOS Linux.
  * [Fail2ban][19] is a similar program that prevents brute force attacks against SSH.
  * [sshguard][20] protect hosts from brute force attacks against ssh and other services using pf.
  * [security/sshblock][21] block abusive SSH login attempts.
  * [ IPQ BDB filter][22] May be considered as a fail2ban lite.



#### 11. Rate-limit incoming traffic at TCP port # 22 (optional)

Both netfilter and pf provides rate-limit option to perform simple throttling on incoming connections on port # 22.

##### Iptables Example

The following example will drop incoming connections which make more than 5 connection attempts upon port 22 within 60 seconds:
```
#!/bin/bash
inet_if=eth1
ssh_port=22
$IPT -I INPUT -p tcp --dport ${ssh_port} -i ${inet_if} -m state --state NEW -m recent  --set
$IPT -I INPUT -p tcp --dport ${ssh_port} -i ${inet_if} -m state --state NEW -m recent  --update --seconds 60 --hitcount 5
```

Call above script from your iptables scripts. Another config option:
```
$IPT -A INPUT  -i ${inet_if} -p tcp --dport ${ssh_port} -m state --state NEW -m limit --limit 3/min --limit-burst 3 -j ACCEPT
$IPT -A INPUT  -i ${inet_if} -p tcp --dport ${ssh_port} -m state --state ESTABLISHED -j ACCEPT
$IPT -A OUTPUT -o ${inet_if} -p tcp --sport ${ssh_port} -m state --state ESTABLISHED -j ACCEPT
# another one line example
# $IPT -A INPUT -i ${inet_if} -m state --state NEW,ESTABLISHED,RELATED -p tcp --dport 22 -m limit --limit 5/minute --limit-burst 5-j ACCEPT
```

See iptables man page for more details.

##### *BSD PF Example

The following will limits the maximum number of connections per source to 20 and rate limit the number of connections to 15 in a 5 second span. If anyone breaks our rules add them to our abusive_ips table and block them for making any further connections. Finally, flush keyword kills all states created by the matching rule which originate from the host which exceeds these limits.
```
sshd_server_ip = "202.54.1.5" 
table <abusive_ips> persist
block in quick from <abusive_ips>
pass in on $ext_if proto tcp to $sshd_server_ip port ssh flags S/SA keep state (max-src-conn 20, max-src-conn-rate 15/5, overload <abusive_ips> flush) 
```

#### 12. Use port knocking (optional)

[Port knocking][23] is a method of externally opening ports on a firewall by generating a connection attempt on a set of prespecified closed ports. Once a correct sequence of connection attempts is received, the firewall rules are dynamically modified to allow the host which sent the connection attempts to connect to the specific port(s). A sample port Knocking example for ssh using iptables:
```
$IPT -N stage1
$IPT -A stage1 -m recent --remove --name knock
$IPT -A stage1 -p tcp --dport 3456 -m recent --set --name knock2
 
$IPT -N stage2
$IPT -A stage2 -m recent --remove --name knock2
$IPT -A stage2 -p tcp --dport 2345 -m recent --set --name heaven
 
$IPT -N door
$IPT -A door -m recent --rcheck --seconds 5 --name knock2 -j stage2
$IPT -A door -m recent --rcheck --seconds 5 --name knock -j stage1
$IPT -A door -p tcp --dport 1234 -m recent --set --name knock
 
$IPT -A INPUT -m --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p tcp --dport 22 -m recent --rcheck --seconds 5 --name heaven -j ACCEPT
$IPT -A INPUT -p tcp --syn -j door
```


For more info see:
[Debian / Ubuntu: Set Port Knocking With Knockd and Iptables][55]

#### 13. Configure idle log out timeout interval

A user can log in to the server via ssh, and you can set an idle timeout interval to avoid unattended ssh session. Open sshd_config and make sure following values are configured:
```
ClientAliveInterval 300
ClientAliveCountMax 0
```
You are setting an idle timeout interval in seconds (300 secs == 5 minutes). After this interval has passed, the idle user will be automatically kicked out (read as logged out). See [how to automatically log BASH / TCSH / SSH users][24] out after a period of inactivity for more details.

#### 14. Enable a warning banner for ssh users

Set a warning banner by updating sshd_config with the following line:
`Banner /etc/issue`
Sample /etc/issue file:
```
----------------------------------------------------------------------------------------------
You are accessing a XYZ Government (XYZG) Information System (IS) that is provided for authorized use only.
By using this IS (which includes any device attached to this IS), you consent to the following conditions:

+ The XYZG routinely intercepts and monitors communications on this IS for purposes including, but not limited to,
penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM),
law enforcement (LE), and counterintelligence (CI) investigations.

+ At any time, the XYZG may inspect and seize data stored on this IS.

+ Communications using, or data stored on, this IS are not private, are subject to routine monitoring,
interception, and search, and may be disclosed or used for any XYZG authorized purpose.

+ This IS includes security measures (e.g., authentication and access controls) to protect XYZG interests--not
for your personal benefit or privacy.

+ Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching
or monitoring of the content of privileged communications, or work product, related to personal representation
or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work
product are private and confidential. See User Agreement for details.
----------------------------------------------------------------------------------------------

```

Above is a standard sample, consult your legal team for specific user agreement and legal notice details.

#### 15. Disable .rhosts files (verification)

Don't read the user's ~/.rhosts and ~/.shosts files. Update sshd_config with the following settings:
`IgnoreRhosts yes`
SSH can emulate the behavior of the obsolete rsh command, just disable insecure access via RSH.

#### 16. Disable host-based authentication (verification)

To disable host-based authentication, update sshd_config with the following option:
`HostbasedAuthentication no`

#### 17. Patch OpenSSH and operating systems

It is recommended that you use tools such as [yum][25], [apt-get][26], [freebsd-update][27] and others to keep systems up to date with the latest security patches:

#### 18. Chroot OpenSSH (Lock down users to their home directories)

By default users are allowed to browse the server directories such as /etc/, /bin and so on. You can protect ssh, using os based chroot or use [special tools such as rssh][28]. With the release of OpenSSH 4.8p1 or 4.9p1, you no longer have to rely on third-party hacks such as rssh or complicated chroot(1) setups to lock users to their home directories. See [this blog post][29] about new ChrootDirectory directive to lock down users to their home directories.

#### 19. Disable OpenSSH server on client computer

Workstations and laptop can work without OpenSSH server. If you do not provide the remote login and file transfer capabilities of SSH, disable and remove the SSHD server. CentOS / RHEL users can disable and remove openssh-server with the [yum command][30]:
`$ sudo yum erase openssh-server`
Debian / Ubuntu Linux user can disable and remove the same with the [apt command][31]/[apt-get command][32]:
`$ sudo apt-get remove openssh-server`
You may need to update your iptables script to remove ssh exception rule. Under CentOS / RHEL / Fedora edit the files /etc/sysconfig/iptables and /etc/sysconfig/ip6tables. Once done [restart iptables][33] service:
```
# service iptables restart
# service ip6tables restart
```

#### 20. Bonus tips from Mozilla

If you are using OpenSSH version 6.7+ or newer try [following][34] settings:
```
#################[ WARNING ]########################
# Do not use any setting blindly. Read sshd_config #
# man page. You must understand cryptography to    #
# tweak following settings. Otherwise use defaults #
####################################################
 
# Supported HostKey algorithms by order of preference.
HostKey /etc/ssh/ssh_host_ed25519_key
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
 
# Specifies the available KEX (Key Exchange) algorithms.
KexAlgorithms curve25519-sha256@libssh.org,ecdh-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group-exchange-sha256
 
# Specifies the ciphers allowed
Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr
 
#Specifies the available MAC (message authentication code) algorithms
MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com
 
# LogLevel VERBOSE logs user's key fingerprint on login. Needed to have a clear audit track of which key was using to log in.
LogLevel VERBOSE
 
# Log sftp level file access (read/write/etc.) that would not be easily logged otherwise.
Subsystem sftp  /usr/lib/ssh/sftp-server -f AUTHPRIV -l INFO
```

You can grab list of cipher and alog supported by your OpenSSH server using the following commands:
```
$ ssh -Q cipher
$ ssh -Q cipher-auth
$ ssh -Q mac
$ ssh -Q kex
$ ssh -Q key
```
[![OpenSSH Security Tutorial Query Ciphers and algorithms choice][35]][35]

#### How do I test sshd_config file and restart/reload my SSH server?

To [check the validity of the configuration file and sanity of the keys][36] for any errors before restarting sshd, run:
`$ sudo sshd -t`
Extended test mode:
`$ sudo sshd -T`
Finally [restart sshd on a Linux or Unix like systems][37] as per your distro version:
```
$ [sudo systemctl start ssh][38] ## Debian/Ubunt Linux##
$ [sudo systemctl restart sshd.service][39] ## CentOS/RHEL/Fedora Linux##
$ doas /etc/rc.d/sshd restart ## OpenBSD##
$ sudo service sshd restart ## FreeBSD## 
```

#### Other susggesions

  1. [Tighter SSH security with 2FA][40] - Multi-Factor authentication can be enabled with [OATH Toolkit][41] or [DuoSecurity][42].
  2. [Use keychain based authentication][43] - keychain is a special bash script designed to make key-based authentication incredibly convenient and flexible. It offers various security benefits over passphrase-free keys



#### See also:

  * The [official OpenSSH][44] project.
  * Man pages: sshd(8),ssh(1),ssh-add(1),ssh-agent(1)



If you have a technique or handy software not mentioned here, please share in the comments below to help your fellow readers keep their OpenSSH based server secure.

#### About the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][45], [Facebook][46], [Google+][47].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/tips/2009/07/openSSH_logo.png
[2]:https://isc.sans.edu/diary/OpenSSH+Rumors/6742
[3]:https://www.cyberciti.biz/tips/wp-content/uploads/2009/07/OpenSSH-server-security-best-practices.png
[4]:https://www.cyberciti.biz/faq/how-to-create-a-sudo-user-on-ubuntu-linux-server/
[5]:https://www.cyberciti.biz/faq/unix-linux-id-command-examples-usage-syntax/ (See Linux/Unix id command examples for more info)
[6]:https://www.cyberciti.biz/faq/how-to-disable-ssh-password-login-on-linux/
[7]:https://www.cyberciti.biz/tips/linux-pam-configuration-that-allows-or-deny-login-via-the-sshd-server.html
[8]:https://www.cyberciti.biz/tips/openssh-deny-or-restrict-access-to-users-and-groups.html
[9]:https://www.cyberciti.biz/tips/linux-check-passwords-against-a-dictionary-attack.html
[10]:https://www.cyberciti.biz/faq/unix-linux-password-cracking-john-the-ripper/
[11]:https://www.cyberciti.biz/faq/rhel-fedorta-linux-iptables-firewall-configuration-tutorial/
[12]:https://www.cyberciti.biz/faq/howto-configure-setup-firewall-with-ufw-on-ubuntu-linux/
[13]:https://www.cyberciti.biz/faq/ufw-allow-incoming-ssh-connections-from-a-specific-ip-address-subnet-on-ubuntu-debian/
[14]:https://www.cyberciti.biz/tips/linux-iptables-examples.html
[15]:https://bash.cyberciti.biz/firewall/pf-firewall-script/
[16]:https://www.cyberciti.biz/faq/tcp-wrappers-hosts-allow-deny-tutorial/
[17]:https://www.cyberciti.biz/faq/block-ssh-attacks-with-denyhosts/
[18]:https://www.cyberciti.biz/faq/rhel-linux-block-ssh-dictionary-brute-force-attacks/
[19]:https://www.fail2ban.org
[20]:https://sshguard.sourceforge.net/
[21]:http://www.bsdconsulting.no/tools/
[22]:https://savannah.nongnu.org/projects/ipqbdb/
[23]:https://en.wikipedia.org/wiki/Port_knocking
[24]:https://www.cyberciti.biz/faq/linux-unix-login-bash-shell-force-time-outs/
[25]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/
[26]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html
[27]:https://www.cyberciti.biz/tips/howto-keep-freebsd-system-upto-date.html
[28]:https://www.cyberciti.biz/tips/rhel-centos-linux-install-configure-rssh-shell.html
[29]:https://www.debian-administration.org/articles/590
[30]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[31]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[32]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[33]:https://www.cyberciti.biz/faq/howto-rhel-linux-open-port-using-iptables/
[34]:https://wiki.mozilla.org/Security/Guidelines/OpenSSH
[35]:https://www.cyberciti.biz/tips/wp-content/uploads/2009/07/OpenSSH-Security-Tutorial-Query-Ciphers-and-algorithms-choice.jpg
[36]:https://www.cyberciti.biz/tips/checking-openssh-sshd-configuration-syntax-errors.html
[37]:https://www.cyberciti.biz/faq/howto-restart-ssh/
[38]:https://www.cyberciti.biz/faq/howto-start-stop-ssh-server/ (Restart sshd on a Debian/Ubuntu Linux)
[39]:https://www.cyberciti.biz/faq/centos-stop-start-restart-sshd-command/ (Restart sshd on a CentOS/RHEL/Fedora Linux)
[40]:https://www.cyberciti.biz/open-source/howto-protect-linux-ssh-login-with-google-authenticator/
[41]:http://www.nongnu.org/oath-toolkit/
[42]:https://duo.com
[43]:https://www.cyberciti.biz/faq/ssh-passwordless-login-with-keychain-for-scripts/
[44]:https://www.openssh.com/
[45]:https://twitter.com/nixcraft
[46]:https://facebook.com/nixcraft
[47]:https://plus.google.com/+CybercitiBiz
[48]:https://www.cyberciti.biz/faq/ssh-passwordless-login-with-keychain-for-scripts/
[49]:https://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/
[50]:https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/
[51]:https://www.cyberciti.biz/faq/how-to-upload-ssh-public-key-to-as-authorized_key-using-ansible/
[52]:https://www.cyberciti.biz/faq/generating-random-password/
[53]:https://www.cyberciti.biz/faq/linux-unix-generating-passwords-command/
[54]:https://www.cyberciti.biz/faq/linux-random-password-generator/
[55]:https://www.cyberciti.biz/faq/debian-ubuntu-linux-iptables-knockd-port-knocking-tutorial/
