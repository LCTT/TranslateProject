[#]: subject: (6 open source tools and tips to securing a Linux server for beginners)
[#]: via: (https://opensource.com/article/21/4/securing-linux-servers)
[#]: author: (Sahana Sreeram https://opensource.com/users/sahanasreeram01gmailcom)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

6 open source tools and tips to securing a Linux server for beginners
======
Use open source tools to protect your Linux environment from breaches.
![People work on a computer server with devices][1]

Because so much of our personal and professional data is available online today, it is important for everyone—from professionals to general internet users—to learn the basics of security and privacy. As a student, I've been able to gain experience in this area through my school's CyberPatriot initiative, where I've had the opportunity to interact with industry experts to learn about cyber breaches and the basic steps to establish a system's security.

This article details six simple steps to improve the security of your Linux environment for personal use, based on what I have learned thus far as a beginner. Throughout my journey, I have utilized open source tools to accelerate my learning process and familiarize myself with higher-level concepts related to securing my Linux server.

I have tested these steps using Ubuntu 18.04, the version I am most familiar with, but these steps will also work for other Linux distributions.

### 1\. Run updates

Developers are constantly finding ways to make servers more stable, fast, and secure by patching known vulnerabilities. Running updates regularly is a good habit to get into to maximize security. Run them with:


```
`sudo apt-get update && apt-get upgrade`
```

### 2\. Enable firewall protection

[Enabling a firewall][2] makes it easier to control incoming and outgoing traffic on your server. There are many firewall applications you can use on Linux, including [firewall-cmd][3] and Uncomplicated Firewall ([UFW][4]). I use UFW, so my examples are specific to it, but these principles apply to any interface you choose.

Install UFW:


```
`sudo apt-get install ufw`
```

If you want to secure your server even more, you can deny incoming and outgoing connections. Be warned: This cuts your server off from the world, so once you've blocked all traffic, you must specify which outgoing connections are allowed from your system:


```
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

You can also write rules for allowing incoming connections you need for personal use:


```
`ufw allow <service>`
```

For example, to allow SSH connections:


```
`ufw allow ssh`
```

Finally, enable your firewall with:


```
`sudo ufw enable`
```

### 3\. Strengthen password protection

Implementing a strong password policy is an important aspect of keeping a server secure from cyberattacks and data breaches. Some best practices for password policies include enforcing a minimum length and specifying password age. I use the libpam-cracklib package to accomplish these tasks.

Install the libpam-cracklib package:


```
`sudo apt-get install libpam-cracklib`
```

To enforce password length:

  * Open the `/etc/pam.d/common-password` file.
  * Change the minimum character length of all passwords by changing the `minlen=12` line to however many characters you want.



To prevent password reuse:

  * In the same file (`/etc/pam.d/common-password`), add the line `remember=x`.
  * For example, if you want to prevent a user from reusing one of their last five passwords, use: `remember=5`.



To enforce password age:

  * Find the following lines in the `/etc/login.defs` file and replace them with your preferred amount of time (days). For example: [code] PASS_MIN_AGE: 3
PASS_MAX_AGE: 90
PASS_WARN_AGE: 14 
```
To enforce character specifications:

  * The four parameters to enforce character specifications in passwords are `lcredit` (lowercase), `ucredit` (uppercase), `dcredit` (digit), and `ocredit` (other characters).
  * In the same file (`/etc/pam.d/common-password`), locate the line containing `pam_cracklib.so`.
    * Add the following to the end of this line: [code]`lcredit=-a ucredit=-b dcredit=-c ocredit=-d`
```
    * For example, the following line requires passwords to contain _one_ of each parameter. You can change the numbers based on your preferred level of password security: [code]`lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1`
```
## 4\. Disable nonessential services that are prone to exploitation

It's a best practice to disable unnecessary services. This allows fewer ports to be open for exploitation.

Install the systemd package:
```
`sudo apt-get install systemd`
```
See which services are running:
```
`systemctl list-units`
```
[Recognize][5] which services could cause potential vulnerabilities to your system. For each service:

  * Stop the service if it's currently running: [code]`systemctl stop <service>`
```
  * Disable the service from starting on boot: [code]`systemctl disable <service>`
```
* After running these commands, check the status of the service: [code]`systemctl status <service>`
```



### 5\. Check for listening ports

Open ports might pose security risks, so it's important to check for ports that are listening on your server. I use the [netstat][6] command to show all network connections:


```
`netstat -tulpn`
```

Look at the address columns to determine the [port number][7]. Once you've found open ports, review them to make sure they're all necessary. If they aren't, [adjust what services you have running][8], or adjust your firewall settings.

### 6\. Scan for malware

Antivirus scanning software can be useful to keep viruses out of your system. Using them is a simple way to keep your server free from malware. My preferred tool is the open source software [ClamAV][9].

Install ClamAV:


```
`sudo apt-get install clamav`
```

Update virus signatures:


```
`sudo freshclam`
```

Scan all files and print out infected files, ringing a bell when one is found:


```
`sudo clamscan -r --bell -i /`
```

You can and should automate scans so that you don't have to remember or spend time doing them manually. For simple automation like this, you can use [systemd timers][10] or your [favorite cron][11].

### Keep your server safe

We cannot leave the responsibility for securing servers to a single person or organization. As the threat landscape continues to expand rapidly, it is up to each of us to be aware of the importance of server security and to employ some simple, effective security best practices.

These are just a few of the many steps you can take to keep your Linux server safe. Of course, prevention is only part of the solution. These policies should be combined with rigorous monitoring for denial of service attacks, doing system analysis with [Lynis][12], and creating frequent backups.

What open source tools do you use to keep your server safe? Tell us about them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/securing-linux-servers

作者：[Sahana Sreeram][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sahanasreeram01gmailcom
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server with devices)
[2]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[3]: https://opensource.com/article/20/2/firewall-cheat-sheet
[4]: https://wiki.ubuntu.com/UncomplicatedFirewall
[5]: http://www.yorku.ca/infosec/Administrators/UNIX_disable.html
[6]: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/netstat
[7]: https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
[8]: https://opensource.com/article/20/5/systemd-units
[9]: https://www.clamav.net/
[10]: https://opensource.com/article/20/7/systemd-timers
[11]: https://opensource.com/article/21/2/linux-automation
[12]: https://opensource.com/article/20/5/linux-security-lynis
