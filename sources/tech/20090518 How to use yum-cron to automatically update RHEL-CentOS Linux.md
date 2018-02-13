How to use yum-cron to automatically update RHEL/CentOS Linux
======
The yum command line tool is used to install and update software packages under RHEL / CentOS Linux server. I know how to apply updates using [yum update command line][1], but I would like to use cron to update packages where appropriate manually. How do I configure yum to install software patches/updates [automatically with cron][2]?

You need to install yum-cron package. It provides files needed to run yum updates as a cron job. Install this package if you want auto yum updates nightly via cron.

### How to install yum cron on a CentOS/RHEL 6.x/7.x

Type the following [yum command][3] on:
`$ sudo yum install yum-cron`
![](https://www.cyberciti.biz/media/new/faq/2009/05/How-to-install-yum-cron-on-CentOS-RHEL-server.jpg)

Turn on service using systemctl command on **CentOS/RHEL 7.x** :
```
$ sudo systemctl enable yum-cron.service 
$ sudo systemctl start yum-cron.service 
$ sudo systemctl status yum-cron.service
```
If you are using **CentOS/RHEL 6.x** , run:
```
$ sudo chkconfig yum-cron on 
$ sudo service yum-cron start
```
![](https://www.cyberciti.biz/media/new/faq/2009/05/How-to-turn-on-yum-cron-service-on-CentOS-or-RHEL-server.jpg)

yum-cron is an alternate interface to yum. Very convenient way to call yum from cron. It provides methods to keep repository metadata up to date, and to check for, download, and apply updates. Rather than accepting many different command line arguments, the different functions of yum-cron can be accessed through config files.

### How to configure yum-cron to automatically update RHEL/CentOS Linux

You need to edit /etc/yum/yum-cron.conf and /etc/yum/yum-cron-hourly.conf files using a text editor such as vi command:
`$ sudo vi /etc/yum/yum-cron.conf`
Make sure updates should be applied when they are available
`apply_updates = yes`
You can set the address to send email messages from. Please note that ‘localhost’ will be replaced with the value of system_name.
`email_from = root@localhost`
List of addresses to send messages to.
`email_to = your-it-support@some-domain-name`
Name of the host to connect to to send email messages.
`email_host = localhost`
If you [do not want to update kernel package add the following on CentOS/RHEL 7.x][4]:
`exclude=kernel*`
For RHEL/CentOS 6.x add [the following to exclude kernel package from updating][5]:
`YUM_PARAMETER=kernel*`
[Save and close the file in vi/vim][6]. You also need to update /etc/yum/yum-cron-hourly.conf file if you want to apply update hourly. Otherwise /etc/yum/yum-cron.conf will run on daily using the following cron job (us [cat command][7]:
`$ cat /etc/cron.daily/0yum-daily.cron`
Sample outputs:
```
#!/bin/bash
 
# Only run if this flag is set. The flag is created by the yum-cron init
# script when the service is started -- this allows one to use chkconfig and
# the standard "service stop|start" commands to enable or disable yum-cron.
if [[ ! -f /var/lock/subsys/yum-cron ]]; then
 exit 0
fi
 
# Action!
exec /usr/sbin/yum-cron /etc/yum/yum-cron-hourly.conf
[root@centos7-box yum]# cat /etc/cron.daily/0yum-daily.cron
#!/bin/bash
 
# Only run if this flag is set. The flag is created by the yum-cron init
# script when the service is started -- this allows one to use chkconfig and
# the standard "service stop|start" commands to enable or disable yum-cron.
if [[ ! -f /var/lock/subsys/yum-cron ]]; then
 exit 0
fi
 
# Action!
exec /usr/sbin/yum-cron
```

That is all. Now your system will update automatically everyday using yum-cron. See man page of yum-cron for more details:
`$ man yum-cron`

### Method 2 – Use shell scripts

**Warning** : The following method is outdated. Do not use it on RHEL/CentOS 6.x/7.x. I kept it below for historical reasons only when I used it on CentOS/RHEL version 4.x/5.x.

Let us see how to configure CentOS/RHEL for yum automatic update retrieval and installation of security packages. You can use yum-updatesd service provided with CentOS / RHEL servers. However, this service provides a few overheads. You can create daily or weekly updates with the following shell script. Create

  * **/etc/cron.daily/yumupdate.sh** to apply updates one a day.
  * **/etc/cron.weekly/yumupdate.sh** to apply updates once a week.



#### Sample shell script to update system

A shell script that instructs yum to update any packages it finds via [cron][8]:
```
#!/bin/bash
YUM=/usr/bin/yum
$YUM -y -R 120 -d 0 -e 0 update yum
$YUM -y -R 10 -e 0 -d 0 update
```

(Code listing -01: /etc/cron.daily/yumupdate.sh)

Where,

  1. First command will update yum itself and next will apply system updates.
  2. **-R 120** : Sets the maximum amount of time yum will wait before performing a command
  3. **-e 0** : Sets the error level to 0 (range 0 – 10). 0 means print only critical errors about which you must be told.
  4. -d 0 : Sets the debugging level to 0 – turns up or down the amount of things that are printed. (range: 0 – 10).
  5. **-y** : Assume yes; assume that the answer to any question which would be asked is yes.



Make sure you setup executable permission:
`# chmod +x /etc/cron.daily/yumupdate.sh`


### about the author

Posted by:

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][9], [Facebook][10], [Google+][11]. Get the **latest tutorials on SysAdmin, Linux/Unix and open source topics via[my RSS/XML feed][12]**.

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/fedora-automatic-update-retrieval-installation-with-cron/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/
[2]:https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses
[3]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[4]:https://www.cyberciti.biz/faq/yum-update-except-kernel-package-command/
[5]:https://www.cyberciti.biz/faq/redhat-centos-linux-yum-update-exclude-packages/
[6]:https://www.cyberciti.biz/faq/linux-unix-vim-save-and-quit-command/
[7]:https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-cat-command-examples/ (See Linux/Unix cat command examples for more info)
[8]:https://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses
[9]:https://twitter.com/nixcraft
[10]:https://facebook.com/nixcraft
[11]:https://plus.google.com/+CybercitiBiz
[12]:https://www.cyberciti.biz/atom/atom.xml
