如何在 Linux / Unix 上使用 awk 打印文件名
=================

Q：我想在 Linux / 类Unix 系统上使用 awk 打印文件名。 如何使用 awk 的 `BEGIN` 特殊模式打印文件名？ 我可以使用 gawk/awk 打印当前输入文件的名称吗？（LCTT 译注：读者最好能有一些 awk 的背景知识，否则阅读本文的时候会有一些困惑）

在 `FILENAME` 变量中存放着当前输入文件的名称。 您可以使用 `FILENAME` 显示或打印当前输入文件名，如果在命令行中未指定文件，则 `FILENAME` 的值为 `-` （标准输入）（LCTT 译注：多次按下回车键即可看到效果）。 但是，除非由 `getline` 设置，否则 `FILENAME` 在 `BEGIN` 特殊模式中未定义。

### 使用 awk 打印文件名

使用语法如下：

```
awk '{ print FILENAME }' fileNameHere 
awk '{ print FILENAME }' /etc/hosts
```

因 awk 逐行读取文件，因此，你可能看到多个文件名，为了避免这个情况，你可以使用如下的命令：（LCTT 译注：`FNR` 表示当前记录数，只在文件中有效）

```
awk 'FNR == 1{ print FILENAME } ' /etc/passwd 
awk 'FNR == 1{ print FILENAME } ' /etc/hosts
```

![](https://www.cyberciti.biz/media/new/faq/2018/02/How-to-print-filename-using-awk-on-Linux-or-Unix.jpg)

### 使用 awk 的 BEGIN 特殊规则打印文件名

使用下面的语法：（LCTT 译注：`ARGV[I]` 表示输入的第 i 个参数）

```
awk 'BEGIN{print ARGV[1]}' fileNameHere 
awk 'BEGIN{print ARGV[1]}{ print "someting or do something on data" }END{}' fileNameHere 
awk 'BEGIN{print ARGV[1]}' /etc/hosts
```

示例输出：

```
/etc/hosts
```

然而，`ARGV[1]` 并不是每一次都能奏效，例如：

```
ls -l /etc/hosts | awk 'BEGIN{print ARGV[1]} { print }'
```

你需要将它修改如下（假设 `ls -l` 只产生一行输出）：

```
ls -l /etc/hosts | awk '{ print "File: " $9 ", Owner:" $3 ", Group: " $4 }'
```

示例输出：

```
File: /etc/hosts, Owner:root, Group: root
```

### 处理由通配符指定的多个文件名

使用如下的示例语法：

```
awk '{ print FILENAME; nextfile } ' *.c 
awk 'BEGIN{ print "Starting..."} { print FILENAME; nextfile }END{ print "....DONE"} ' *.conf
```

示例输出：

```
Starting...
blkid.conf
cryptconfig.conf
dhclient6.conf
dhclient.conf
dracut.conf
gai.conf
gnome_defaults.conf
host.conf
idmapd.conf
idnalias.conf
idn.conf
insserv.conf
iscsid.conf
krb5.conf
ld.so.conf
logrotate.conf
mke2fs.conf
mtools.conf
netscsid.conf
nfsmount.conf
nscd.conf
nsswitch.conf
openct.conf
opensc.conf
request-key.conf
resolv.conf
rsyncd.conf
sensors3.conf
slp.conf
smartd.conf
sysctl.conf
vconsole.conf
warnquota.conf
wodim.conf
xattr.conf
xinetd.conf
yp.conf
....DONE
```

`nextfile` 告诉 awk 停止处理当前的输入文件。 下一个输入记录读取来自下一个输入文件。 更多信息，请参见 awk/[gawk][1] 命令手册页：

```
man awk 
man gawk
```

### 关于作者

作者是 nixCraft 的创立者，也是经验丰富的系统管理员和 Linux/Unix shell 脚本的培训师。 他曾与全球各行各业的客户合作，涉及 IT，教育，国防和空间研究以及非营利部门等多个行业。 您可以在 [Twitter][2]，[Facebook][3] 和 [Google+][4]上关注他。 可以通过订阅我的 [RSS][5] 来获取更多的关于**系统管理，Linux/Unix ，和开源主题**的相关资料。

-------------

via: https://www.cyberciti.biz/faq/how-to-print-filename-with-awk-on-linux-unix/

作者：[Vivek Gite][a]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.gnu.org/software/gawk/manual/
[2]:https://twitter.com/nixcraft
[3]:https://facebook.com/nixcraft
[4]:https://plus.google.com/+CybercitiBiz
[5]:https://www.cyberciti.biz/atom/atom.xml
