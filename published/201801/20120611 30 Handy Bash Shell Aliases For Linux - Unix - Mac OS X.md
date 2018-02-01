30 个方便的 Bash shell 别名
======

bash <ruby>别名<rt>alias</rt></ruby>只不过是指向命令的快捷方式而已。`alias` 命令允许用户只输入一个单词就运行任意一个命令或一组命令（包括命令选项和文件名）。执行 `alias` 命令会显示一个所有已定义别名的列表。你可以在 [~/.bashrc][1] 文件中自定义别名。使用别名可以在命令行中减少输入的时间，使工作更流畅，同时增加生产率。

本文通过 30 个 bash shell 别名的实际案例演示了如何创建和使用别名。

![30 Useful Bash Shell Aliase For Linux/Unix Users][2]

### bash alias 的那些事

bash shell 中的 alias 命令的语法是这样的：

```
alias [alias-name[=string]...]
```

#### 如何列出 bash 别名

输入下面的 [alias 命令][3]：

```
alias
```

结果为：

```
alias ..='cd ..'
alias amazonbackup='s3backup'
alias apt-get='sudo apt-get'
...
```

`alias` 命令默认会列出当前用户定义好的别名。

#### 如何定义或者创建一个 bash shell 别名

使用下面语法 [创建别名][4]：

```
alias name =value
alias name = 'command'
alias name = 'command arg1 arg2' 
alias name = '/path/to/script' 
alias name = '/path/to/script.pl arg1'
```

举个例子，输入下面命令并回车就会为常用的 `clear`（清除屏幕）命令创建一个别名 `c`：

```
alias c = 'clear'
```

然后输入字母 `c` 而不是 `clear` 后回车就会清除屏幕了：

```
c
```

#### 如何临时性地禁用 bash 别名

下面语法可以[临时性地禁用别名][5]：

```
## path/to/full/command
/usr/bin/clear
## call alias with a backslash ##
\c
## use /bin/ls command and avoid ls alias ##
command ls
```

#### 如何删除 bash 别名

使用 [unalias 命令来删除别名][6]。其语法为：

```
unalias aliasname
unalias foo
```

例如，删除我们之前创建的别名 `c`：

```
unalias c
```

你还需要用文本编辑器删掉 [~/.bashrc 文件][1] 中的别名定义（参见下一部分内容）。

#### 如何让 bash shell 别名永久生效

别名 `c` 在当前登录会话中依然有效。但当你登出或重启系统后，别名 `c` 就没有了。为了防止出现这个问题，将别名定义写入 [~/.bashrc file][1] 中，输入：

```
vi ~/.bashrc
```

输入下行内容让别名 `c` 对当前用户永久有效：

```
alias c = 'clear'
```

保存并关闭文件就行了。系统级的别名（也就是对所有用户都生效的别名）可以放在 `/etc/bashrc` 文件中。请注意，`alias` 命令内建于各种 shell 中，包括 ksh，tcsh/csh，ash，bash 以及其他 shell。

#### 关于特权权限判断

可以将下面代码加入 `~/.bashrc`：

```
# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt-get upgrade'
fi
```

#### 定义与操作系统类型相关的别名

可以将下面代码加入 `~/.bashrc` [使用 case 语句][7]：

```
### Get os name via uname ###
_myos="$(uname)"
 
### add alias as per os using $_myos ###
case $_myos in
   Linux) alias foo='/path/to/linux/bin/foo';;
   FreeBSD|OpenBSD) alias foo='/path/to/bsd/bin/foo' ;;
   SunOS) alias foo='/path/to/sunos/bin/foo' ;;
   *) ;;
esac
```

### 30 个 bash shell 别名的案例

你可以定义各种类型的别名来节省时间并提高生产率。

#### #1：控制 ls 命令的输出

[ls 命令列出目录中的内容][8] 而你可以对输出进行着色：

```
## Colorize the ls output ##
alias ls = 'ls --color=auto'

## Use a long listing format ##
alias ll = 'ls -la'

## Show hidden files ##
alias l.= 'ls -d . .. .git .gitignore .gitmodules .travis.yml --color=auto'
```

#### #2：控制 cd 命令的行为

```
## get rid of command not found ##
alias cd..= 'cd ..'

## a quick way to get out of current directory ##
alias ..= 'cd ..'
alias ...= 'cd ../../../'
alias ....= 'cd ../../../../'
alias .....= 'cd ../../../../'
alias .4= 'cd ../../../../'
alias .5= 'cd ../../../../..'
```

#### #3：控制 grep 命令的输出

[grep 命令是一个用于在纯文本文件中搜索匹配正则表达式的行的命令行工具][9]：

```
## Colorize the grep command output for ease of use (good for log files)##
alias grep = 'grep --color=auto'
alias egrep = 'egrep --color=auto'
alias fgrep = 'fgrep --color=auto'
```

#### #4：让计算器默认开启 math 库

```
alias bc = 'bc -l'
```

#### #4：生成 sha1 数字签名

```
alias sha1 = 'openssl sha1'
```

#### #5：自动创建父目录

[mkdir 命令][10] 用于创建目录：

```
alias mkdir = 'mkdir -pv'
```

#### #6：为 diff 输出着色

你可以[使用 diff 来一行行第比较文件][11] 而一个名为 `colordiff` 的工具可以为 diff 输出着色：

```
# install colordiff package :)
alias diff = 'colordiff'
```

#### #7：让 mount 命令的输出更漂亮，更方便人类阅读

```
alias mount = 'mount |column -t'
```

#### #8：简化命令以节省时间

```
# handy short cuts #
alias h = 'history' 
alias j = 'jobs -l'
```

#### #9：创建一系列新命令

```
alias path = 'echo -e ${PATH//:/\\n}'
alias now = 'date +"%T"'
alias nowtime =now
alias nowdate = 'date +"%d-%m-%Y"'
```

#### #10：设置 vim 为默认编辑器

```
alias vi = vim
alias svi = 'sudo vi'
alias vis = 'vim "+set si"'
alias edit = 'vim'
```

#### #11：控制网络工具 ping 的输出

```
# Stop after sending count ECHO_REQUEST packets #
alias ping = 'ping -c 5'

# Do not wait interval 1 second, go fast #
alias fastping = 'ping -c 100 -s.2'
```

#### #12：显示打开的端口

使用 [netstat 命令][12] 可以快速列出服务区中所有的 TCP/UDP 端口：

```
alias ports = 'netstat -tulanp'
```

#### #13：唤醒休眠的服务器

[Wake-on-LAN (WOL) 是一个以太网标准][13]，可以通过网络消息来开启服务器。你可以使用下面别名来[快速激活 nas 设备][14] 以及服务器：

```
## replace mac with your actual server mac address #
alias wakeupnas01 = '/usr/bin/wakeonlan 00:11:32:11:15:FC'
alias wakeupnas02 = '/usr/bin/wakeonlan 00:11:32:11:15:FD'
alias wakeupnas03 = '/usr/bin/wakeonlan 00:11:32:11:15:FE'
```

#### #14：控制防火墙 (iptables) 的输出

[Netfilter 是一款 Linux 操作系统上的主机防火墙][15]。它是 Linux 发行版中的一部分，且默认情况下是激活状态。[这里列出了大多数 Liux 新手防护入侵者最常用的 iptables 方法][16]。

```
## shortcut for iptables and pass it via sudo#
alias ipt = 'sudo /sbin/iptables'

# display all rules #
alias iptlist = 'sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin = 'sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout = 'sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw = 'sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall =iptlist
```

#### #15：使用 curl 调试 web 服务器 / CDN 上的问题

```
# get web server headers #
alias header = 'curl -I'

# find out if remote server supports gzip / mod_deflate or not #
alias headerc = 'curl -I --compress'
```

#### #16：增加安全性

```
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm = 'rm -I --preserve-root'

# confirmation #
alias mv = 'mv -i'
alias cp = 'cp -i'
alias ln = 'ln -i' 

# Parenting changing perms on / #
alias chown = 'chown --preserve-root'
alias chmod = 'chmod --preserve-root'
alias chgrp = 'chgrp --preserve-root'
```

#### #17：更新 Debian Linux 服务器

[apt-get 命令][17] 用于通过因特网安装软件包 (ftp 或 http)。你也可以一次性升级所有软件包：

```
# distro specific - Debian / Ubuntu and friends #
# install with apt-get
alias apt-get= "sudo apt-get"
alias updatey = "sudo apt-get --yes"

# update on one command
alias update = 'sudo apt-get update && sudo apt-get upgrade'
```

#### #18：更新 RHEL / CentOS / Fedora Linux 服务器

[yum 命令][18] 是 RHEL / CentOS / Fedora Linux 以及其他基于这些发行版的 Linux 上的软件包管理工具：

```
## distrp specifc RHEL/CentOS ##
alias update = 'yum update'
alias updatey = 'yum -y update'
```

#### #19：优化 sudo 和 su 命令

```
# become root #
alias root = 'sudo -i' 
alias su = 'sudo -i'
```

#### #20：使用 sudo 执行 halt/reboot 命令

[shutdown 命令][19] 会让 Linux / Unix 系统关机：
```
# reboot / halt / poweroff
alias reboot = 'sudo /sbin/reboot'
alias poweroff = 'sudo /sbin/poweroff' 
alias halt = 'sudo /sbin/halt'
alias shutdown = 'sudo /sbin/shutdown'
```

#### #21：控制 web 服务器

```
# also pass it via sudo so whoever is admin can reload it without calling you #
alias nginxreload = 'sudo /usr/local/nginx/sbin/nginx -s reload' 
alias nginxtest = 'sudo /usr/local/nginx/sbin/nginx -t'
alias lightyload = 'sudo /etc/init.d/lighttpd reload' 
alias lightytest = 'sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
alias httpdreload = 'sudo /usr/sbin/apachectl -k graceful' 
alias httpdtest = 'sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'
```

#### #22：与备份相关的别名

```
# if cron fails or if you want backup on demand just run these commands #
# again pass it via sudo so whoever is in admin group can start the job #
# Backup scripts #
alias backup = 'sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type local --taget /raid1/backups' 
alias nasbackup = 'sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type nas --target nas01'
alias s3backup = 'sudo /home/scripts/admin/scripts/backup/wrapper.backup.sh --type nas --target nas01 --auth /home/scripts/admin/.authdata/amazon.keys'
alias rsnapshothourly = 'sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys --config /home/scripts/admin/scripts/backup/config/adsl.conf'
alias rsnapshotdaily = 'sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys --config /home/scripts/admin/scripts/backup/config/adsl.conf'
alias rsnapshotweekly = 'sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys --config /home/scripts/admin/scripts/backup/config/adsl.conf' 
alias rsnapshotmonthly = 'sudo /home/scripts/admin/scripts/backup/wrapper.rsnapshot.sh --type remote --target nas03 --auth /home/scripts/admin/.authdata/ssh.keys --config /home/scripts/admin/scripts/backup/config/adsl.conf' 
alias amazonbackup =s3backup
```

#### #23：桌面应用相关的别名 - 按需播放的 avi/mp3 文件

```
## play video files in a current directory ##
# cd ~/Download/movie-name
# playavi or vlc
alias playavi = 'mplayer *.avi' 
alias vlc = 'vlc *.avi' 

# play all music files from the current directory #
alias playwave = 'for i in *.wav; do mplayer "$i"; done'
alias playogg = 'for i in *.ogg; do mplayer "$i"; done'
alias playmp3 = 'for i in *.mp3; do mplayer "$i"; done'

# play files from nas devices #
alias nplaywave = 'for i in /nas/multimedia/wave/*.wav; do mplayer "$i"; done'
alias nplayogg = 'for i in /nas/multimedia/ogg/*.ogg; do mplayer "$i"; done' 
alias nplaymp3 = 'for i in /nas/multimedia/mp3/*.mp3; do mplayer "$i"; done'

# shuffle mp3/ogg etc by default # 
alias music = 'mplayer --shuffle *'
```

#### #24：设置系统管理相关命令的默认网卡

[vnstat 一款基于终端的网络流量检测器][20]。[dnstop 是一款分析 DNS 流量的终端工具][21]。[tcptrack 和 iftop 命令显示][22] TCP/UDP 连接方面的信息，它监控网卡并显示其消耗的带宽。

```
## All of our servers eth1 is connected to the Internets via vlan / router etc ##
alias dnstop = 'dnstop -l 5 eth1'
alias vnstat = 'vnstat -i eth1'
alias iftop = 'iftop -i eth1' 
alias tcpdump = 'tcpdump -i eth1' 
alias ethtool = 'ethtool eth1' 

# work on wlan0 by default #
# Only useful for laptop as all servers are without wireless interface
alias iwconfig = 'iwconfig wlan0'
```

#### #25：快速获取系统内存，cpu 使用，和 gpu 内存相关信息

```
## pass options to free ##
alias meminfo = 'free -m -l -t' 

## get top process eating memory
alias psmem = 'ps auxf | sort -nr -k 4' 
alias psmem10 = 'ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu = 'ps auxf | sort -nr -k 3'
alias pscpu10 = 'ps auxf | sort -nr -k 3 | head -10' 

## Get server cpu info ##
alias cpuinfo = 'lscpu'

## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##

## get GPU ram on desktop / laptop##
alias gpumeminfo = 'grep -i --color memory /var/log/Xorg.0.log'
```

#### #26：控制家用路由器

`curl` 命令可以用来 [重启 Linksys 路由器][23]。

```
# Reboot my home Linksys WAG160N / WAG54 / WAG320 / WAG120N Router / Gateway from *nix.
alias rebootlinksys = "curl -u 'admin:my-super-password' 'http://192.168.1.2/setup.cgi?todo=reboot'"

# Reboot tomato based Asus NT16 wireless bridge
alias reboottomato = "ssh admin@192.168.1.1 /sbin/reboot"
```

#### #27 wget 默认断点续传

[GNU wget 是一款用来从 web 下载文件的自由软件][25]。它支持 HTTP，HTTPS，以及 FTP 协议，而且它也支持断点续传：

```
## this one saved by butt so many times ##
alias wget = 'wget -c'
```

#### #28 使用不同浏览器来测试网站

```
## this one saved by butt so many times ##
alias ff4 = '/opt/firefox4/firefox' 
alias ff13 = '/opt/firefox13/firefox' 
alias chrome = '/opt/google/chrome/chrome' 
alias opera = '/opt/opera/opera'

#default ff
alias ff =ff13

#my default browser
alias browser =chrome
```

#### #29：关于 ssh 别名的注意事项

不要创建 ssh 别名，代之以 `~/.ssh/config` 这个 OpenSSH SSH 客户端配置文件。它的选项更加丰富。下面是一个例子：

```
Host server10
 Hostname 1.2.3.4
 IdentityFile ~/backups/.ssh/id_dsa
 user foobar
 Port 30000
 ForwardX11Trusted yes
 TCPKeepAlive yes
```

然后你就可以使用下面语句连接 server10 了：

```
$ ssh server10
```

#### #30：现在该分享你的别名了

```
## set some other defaults ##
alias df = 'df -H'
alias du = 'du -ch'

# top is atop, just like vi is vim
alias top = 'atop'

## nfsrestart - must be root ##
## refresh nfs mount / cache etc for Apache ##
alias nfsrestart = 'sync && sleep 2 && /etc/init.d/httpd stop && umount netapp2:/exports/http && sleep 2 && mount -o rw,sync,rsize=32768,wsize=32768,intr,hard,proto=tcp,fsc natapp2:/exports /http/var/www/html && /etc/init.d/httpd start'

## Memcached server status ##
alias mcdstats = '/usr/bin/memcached-tool 10.10.27.11:11211 stats'
alias mcdshow = '/usr/bin/memcached-tool 10.10.27.11:11211 display'

## quickly flush out memcached server ##
alias flushmcd = 'echo "flush_all" | nc 10.10.27.11 11211'

## Remove assets quickly from Akamai / Amazon cdn ##
alias cdndel = '/home/scripts/admin/cdn/purge_cdn_cache --profile akamai'
alias amzcdndel = '/home/scripts/admin/cdn/purge_cdn_cache --profile amazon'

## supply list of urls via file or stdin
alias cdnmdel = '/home/scripts/admin/cdn/purge_cdn_cache --profile akamai --stdin' 
alias amzcdnmdel = '/home/scripts/admin/cdn/purge_cdn_cache --profile amazon --stdin'
```

### 总结

本文总结了 *nix bash 别名的多种用法：

1. 为命令设置默认的参数（例如通过 `alias ethtool='ethtool eth0'` 设置 ethtool 命令的默认参数为 eth0）。
2. 修正错误的拼写（通过 `alias cd..='cd ..'`让 `cd..` 变成 `cd ..`）。
3. 缩减输入。
4. 设置系统中多版本命令的默认路径（例如 GNU/grep 位于 `/usr/local/bin/grep` 中而 Unix grep 位于 `/bin/grep` 中。若想默认使用 GNU grep 则设置别名 `grep='/usr/local/bin/grep'` )。
5. 通过默认开启命令（例如 `rm`，`mv` 等其他命令）的交互参数来增加 Unix 的安全性。
6. 为老旧的操作系统（比如 MS-DOS 或者其他类似 Unix 的操作系统）创建命令以增加兼容性（比如 `alias del=rm`）。

我已经分享了多年来为了减少重复输入命令而使用的别名。若你知道或使用的哪些 bash/ksh/csh 别名能够减少输入，请在留言框中分享。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

作者：[nixCraft][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://bash.cyberciti.biz/guide/~/.bashrc
[2]:https://www.cyberciti.biz/tips/wp-content/uploads/2012/06/Getting-Started-With-Bash-Shell-Aliases-For-Linux-Unix.jpg
[3]:https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html (See Linux/Unix alias command examples for more info)
[4]:https://bash.cyberciti.biz/guide/Create_and_use_aliases
[5]:https://www.cyberciti.biz/faq/bash-shell-temporarily-disable-an-alias/
[6]:https://bash.cyberciti.biz/guide/Create_and_use_aliases#How_do_I_remove_the_alias.3F
[7]:https://bash.cyberciti.biz/guide/The_case_statement
[8]:https://www.cyberciti.biz/faq/ls-command-to-examining-the-filesystem/
[9]:https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/
[10]:https://www.cyberciti.biz/faq/linux-make-directory-command/
[11]:https://www.cyberciti.biz/faq/how-do-i-compare-two-files-under-linux-or-unix/
[12]:https://www.cyberciti.biz/faq/how-do-i-find-out-what-ports-are-listeningopen-on-my-linuxfreebsd-server/
[13]:https://www.cyberciti.biz/tips/linux-send-wake-on-lan-wol-magic-packets.html
[14]:https://bash.cyberciti.biz/misc-shell/simple-shell-script-to-wake-up-nas-devices-computers/
[15]:https://www.cyberciti.biz/faq/rhel-fedorta-linux-iptables-firewall-configuration-tutorial/ (iptables CentOS/RHEL/Fedora tutorial)
[16]:https://www.cyberciti.biz/tips/linux-iptables-examples.html
[17]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html
[18]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/
[19]:https://www.cyberciti.biz/faq/howto-shutdown-linux/
[20]:https://www.cyberciti.biz/tips/keeping-a-log-of-daily-network-traffic-for-adsl-or-dedicated-remote-linux-box.html
[21]:https://www.cyberciti.biz/faq/dnstop-monitor-bind-dns-server-dns-network-traffic-from-a-shell-prompt/
[22]:https://www.cyberciti.biz/faq/check-network-connection-linux/
[23]:https://www.cyberciti.biz/faq/reboot-linksys-wag160n-wag54-wag320-wag120n-router-gateway/
[24]:https:/cdn-cgi/l/email-protection
[25]:https://www.cyberciti.biz/tips/wget-resume-broken-download.html
