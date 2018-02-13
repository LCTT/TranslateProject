How to print filename with awk on Linux / Unix
======

I would like to print filename with awk on Linux / Unix-like system. How do I print filename in BEGIN section of awk? Can I print the name of the current input file using gawk/awk?

The name of the current input file set in FILENAME variable. You can use FILENAME to display or print current input file name If no files are specified on the command line, the value of FILENAME is “-” (stdin). However, FILENAME is undefined inside the BEGIN rule unless set by getline.

### How to print filename with awk

The syntax is:
```
awk '{ print FILENAME }' fileNameHere 
awk '{ print FILENAME }' /etc/hosts
```
You might see file name multiple times as awk read file line-by-line. To avoid this problem update your awk/gawk syntax as follows:
```
awk 'FNR == 1{ print FILENAME } ' /etc/passwd 
awk 'FNR == 1{ print FILENAME } ' /etc/hosts
```
![](https://www.cyberciti.biz/media/new/faq/2018/02/How-to-print-filename-using-awk-on-Linux-or-Unix.jpg)

### How to print filename in BEGIN section of awk

Use the following syntax:
```
awk 'BEGIN{print ARGV[1]}' fileNameHere 
awk 'BEGIN{print ARGV[1]}{ print "someting or do something on data" }END{}' fileNameHere 
awk 'BEGIN{print ARGV[1]}' /etc/hosts
```
Sample outputs:
```
/etc/hosts

```

However, ARGV[1] might not always work. For example:
`ls -l /etc/hosts | awk 'BEGIN{print ARGV[1]} { print }'`
So you need to modify it as follows (assuming that ls -l only produced a single line of output):
`ls -l /etc/hosts | awk '{ print "File: " $9 ", Owner:" $3 ", Group: " $4 }'`
Sample outputs:
```
File: /etc/hosts, Owner:root, Group: roo

```

### How to deal with multiple filenames specified by a wild card

Use the following simple syntax:
```
awk '{ print FILENAME; nextfile } ' *.c 
awk 'BEGIN{ print "Starting..."} { print FILENAME; nextfile }END{ print "....DONE"} ' *.conf
```
Sample outputs:
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

nextfile tells awk to stop processing the current input file. The next input record read comes from the next input file. For more information see awk/[gawk][1] command man page:
```
man awk 
man gawk
```

### about the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][2], [Facebook][3], [Google+][4]. Get the **latest tutorials on SysAdmin, Linux/Unix and open source topics via[my RSS/XML feed][5]**.

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-print-filename-with-awk-on-linux-unix/

作者：Vivek GIte[][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.gnu.org/software/gawk/manual/
[2]:https://twitter.com/nixcraft
[3]:https://facebook.com/nixcraft
[4]:https://plus.google.com/+CybercitiBiz
[5]:https://www.cyberciti.biz/atom/atom.xml
