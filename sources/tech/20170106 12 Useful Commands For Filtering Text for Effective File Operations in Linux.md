12 Useful Commands For Filtering Text for Effective File Operations in Linux
============================================================

In this article, we will review a number of command line tools that act as filters in Linux. A filter is a program that reads standard input, performs an operation upon it and writes the results to standard output.

For this reason, it can be used to process information in powerful ways such as restructuring output to generate useful reports, modifying text in files and many other system administration tasks.

With that said, below are some of the useful file or text filters in Linux.

### 1\. Awk Command

Awk is a remarkable pattern scanning and processing language, it can be used to build useful filters in Linux. You can start using it by reading through our [Awk series Part 1 to Part 13][7].

Additionally, also read through the awk man page for more info and usage options:

```
$ man awk
```

### 2\. Sed Command

sed is a powerful stream editor for filtering and transforming text. We’ve already written a two useful articles on sed, that you can go through it here:

1.  [How to use GNU ‘sed’ Command to Create, Edit, and Manipulate files in Linux][1]
2.  [15 Useful ‘sed’ Command Tips and Tricks for Daily Linux System Administration Tasks][2]

The sed man page has added control options and instructions:

```
$ man sed
```

### 3\. Grep, Egrep, Fgrep, Rgrep Commands

These filters output lines matching a given pattern. They read lines from a file or standard input, and print all matching lines by default to standard output.

Note: The main program is [grep][8], the variations are simply the same as [using specific grep options][9] as below (and they are still being used for backward compatibility):

```
$ egrep = grep -E
$ fgrep = grep -F
$ rgrep = grep -r  
```

Below are some basic grep commands:

```
tecmint@TecMint ~ $ grep "aaronkilik" /etc/passwd
aaronkilik:x:1001:1001::/home/aaronkilik:
tecmint@TecMint ~ $ cat /etc/passwd | grep "aronkilik"
aaronkilik:x:1001:1001::/home/aaronkilik:
```

You can read more about [What’s Difference Between Grep, Egrep and Fgrep in Linux?][10].

### 4\. head Command

head is used to display the first parts of a file, it outputs the first 10 lines by default. You can use the `-n` num flag to specify the number of lines to be displayed:

```
tecmint@TecMint ~ $ head /var/log/auth.log  
Jan  2 10:45:01 TecMint CRON[3383]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan  2 10:45:01 TecMint CRON[3383]: pam_unix(cron:session): session closed for user root
Jan  2 10:51:34 TecMint sudo:  tecmint : TTY=unknown ; PWD=/home/tecmint ; USER=root ; COMMAND=/usr/lib/linuxmint/mintUpdate/checkAPT.py
Jan  2 10:51:34 TecMint sudo: pam_unix(sudo:session): session opened for user root by (uid=0)
Jan  2 10:51:39 TecMint sudo: pam_unix(sudo:session): session closed for user root
Jan  2 10:55:01 TecMint CRON[4099]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan  2 10:55:01 TecMint CRON[4099]: pam_unix(cron:session): session closed for user root
Jan  2 11:05:01 TecMint CRON[4138]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan  2 11:05:01 TecMint CRON[4138]: pam_unix(cron:session): session closed for user root
Jan  2 11:09:01 TecMint CRON[4146]: pam_unix(cron:session): session opened for user root by (uid=0)
tecmint@TecMint ~ $ head  -n 5 /var/log/auth.log  
Jan  2 10:45:01 TecMint CRON[3383]: pam_unix(cron:session): session opened for user root by (uid=0)
Jan  2 10:45:01 TecMint CRON[3383]: pam_unix(cron:session): session closed for user root
Jan  2 10:51:34 TecMint sudo:  tecmint : TTY=unknown ; PWD=/home/tecmint ; USER=root ; COMMAND=/usr/lib/linuxmint/mintUpdate/checkAPT.py
Jan  2 10:51:34 TecMint sudo: pam_unix(sudo:session): session opened for user root by (uid=0)
Jan  2 10:51:39 TecMint sudo: pam_unix(sudo:session): session closed for user root
```

Learn how to use [head command with tail and cat commands][11] for effective usage in Linux.

### 5\. tail Command

tail outputs the last parts (10 lines by default) of a file. Use the `-n` num switch to specify the number of lines to be displayed.

The command below will output the last 5 lines of the specified file:

```
tecmint@TecMint ~ $ tail -n 5 /var/log/auth.log
Jan  6 13:01:27 TecMint sshd[1269]: Server listening on 0.0.0.0 port 22.
Jan  6 13:01:27 TecMint sshd[1269]: Server listening on :: port 22.
Jan  6 13:01:27 TecMint sshd[1269]: Received SIGHUP; restarting.
Jan  6 13:01:27 TecMint sshd[1269]: Server listening on 0.0.0.0 port 22.
Jan  6 13:01:27 TecMint sshd[1269]: Server listening on :: port 22.
```

Additionally, tail has a special option `-f` for [watching changes in a file in real-time][12] (especially log files).

The following command will enable you monitor changes in the specified file:

```
tecmint@TecMint ~ $ tail -f /var/log/auth.log
Jan  6 12:58:01 TecMint sshd[1269]: Server listening on :: port 22.
Jan  6 12:58:11 TecMint sshd[1269]: Received SIGHUP; restarting.
Jan  6 12:58:12 TecMint sshd[1269]: Server listening on 0.0.0.0 port 22.
Jan  6 12:58:12 TecMint sshd[1269]: Server listening on :: port 22.
Jan  6 13:01:27 TecMint sshd[1269]: Received SIGHUP; restarting.
Jan  6 13:01:27 TecMint sshd[1269]: Server listening on 0.0.0.0 port 22.
Jan  6 13:01:27 TecMint sshd[1269]: Server listening on :: port 22.
Jan  6 13:01:27 TecMint sshd[1269]: Received SIGHUP; restarting.
Jan  6 13:01:27 TecMint sshd[1269]: Server listening on 0.0.0.0 port 22.
Jan  6 13:01:27 TecMint sshd[1269]: Server listening on :: port 22.
```

Read through the tail man page for a complete list of usage options and instructions:

```
$ man tail
```

### 6\. sort Command

sort is used to sort lines of a text file or from standard input.

Below is the content of a file named domains.list:

```
tecmint@TecMint ~ $ cat domains.list
tecmint.com
tecmint.com
news.tecmint.com
news.tecmint.com
linuxsay.com
linuxsay.com
windowsmint.com
windowsmint.com
```

You can run a simple [sort command][13] to sort the file content like so:

```
tecmint@TecMint ~ $ sort domains.list
linuxsay.com
linuxsay.com
news.tecmint.com
news.tecmint.com
tecmint.com
tecmint.com
windowsmint.com
windowsmint.com
```

You can use sort command in many ways, go through some of the useful articles on sort command as follows:

1.  [14 Useful Examples of Linux ‘sort’ Command – Part 1][3]
2.  [7 Interesting Linux ‘sort’ Command Examples – Part 2][4]
3.  [How to Find and Sort Files Based on Modification Date and Time][5]
4.  [http://www.tecmint.com/sort-ls-output-by-last-modified-date-and-time/][6]

### 7\. uniq Command

uniq command is used to report or omit repeated lines, it filters lines from standard input and writes the outcome to standard output.

After running sort on an input stream, you can remove repeated lines with uniq as in the example below.

To indicate the number of occurrences of a line, use the `-c` option and ignore differences in case while comparing by including the `-i` option:

```
tecmint@TecMint ~ $ cat domains.list
tecmint.com
tecmint.com
news.tecmint.com
news.tecmint.com
linuxsay.com
linuxsay.com
windowsmint.com
tecmint@TecMint ~ $ sort domains.list | uniq -c 
2 linuxsay.com
2 news.tecmint.com
2 tecmint.com
1 windowsmint.com 
```

Read through the uniq man page for further usage info and flags:

```
$ man uniq
```

### 8\. fmt Command

fmt simple optimal text formatter, it reformats paragraphs in specified file and prints results to the standard output.

The following is the content extracted from the file domain-list.txt:

```
1.tecmint.com 2.news.tecmint.com 3.linuxsay.com 4.windowsmint.com
```

To reformat the above content to a standard list, run the following command with `-w` switch is used to define the maximum line width:

```
tecmint@TecMint ~ $ cat domain-list.txt 
1.tecmint.com 2.news.tecmint.com 3.linuxsay.com 4.windowsmint.com
tecmint@TecMint ~ $ fmt -w 1 domain-list.txt
1.tecmint.com 
2.news.tecmint.com 
3.linuxsay.com 
4.windowsmint.com
```

### 9\. pr Command

pr command converts text files or standard input for printing. For instance on Debian systems, you can list all installed packages as follows:

```
$ dpkg -l
```

To organize the list in pages and columns ready for printing, issue the following command.

```
tecmint@TecMint ~ $ dpkg -l | pr --columns 3 -l 20  
2017-01-06 13:19                                                  Page 1
Desired=Unknown/Install ii  adduser		ii  apg
| Status=Not/Inst/Conf- ii  adwaita-icon-theme	ii  app-install-data
|/ Err?=(none)/Reinst-r ii  adwaita-icon-theme- ii  apparmor
||/ Name		ii  alsa-base		ii  apt
+++-=================== ii  alsa-utils		ii  apt-clone
ii  accountsservice	ii  anacron		ii  apt-transport-https
ii  acl			ii  apache2		ii  apt-utils
ii  acpi-support	ii  apache2-bin		ii  apt-xapian-index
ii  acpid		ii  apache2-data	ii  aptdaemon
ii  add-apt-key		ii  apache2-utils	ii  aptdaemon-data
2017-01-06 13:19                                                  Page 2
ii  aptitude		ii  avahi-daemon	ii  bind9-host
ii  aptitude-common	ii  avahi-utils		ii  binfmt-support
ii  apturl		ii  aview		ii  binutils
ii  apturl-common	ii  banshee		ii  bison
ii  archdetect-deb	ii  baobab		ii  blt
ii  aspell		ii  base-files		ii  blueberry
ii  aspell-en		ii  base-passwd		ii  bluetooth
ii  at-spi2-core	ii  bash		ii  bluez
ii  attr		ii  bash-completion	ii  bluez-cups
ii  avahi-autoipd	ii  bc			ii  bluez-obexd
.....
```

The flags used here are:

1.  `--column` defines number of columns created in the output.
2.  `-l` specifies page length (default is 66 lines).

### 10\. tr Command

This tool translates or deletes characters from standard input and writes results to standard output.

The syntax for using tr is as follows:

```
$ tr options set1 set2
```

Take a look at the examples below, in the first command, `set1( [:upper:] )` represents the case of input characters (all upper case).

Then `set2([:lower:])` represents the case in which the resultant characters will be. It’s same thing in the second example and the escape sequence `\n` means print output on a new line:

```
tecmint@TecMint ~ $ echo "WWW.TECMINT.COM" | tr [:upper:] [:lower:]
www.tecmint.com
tecmint@TecMint ~ $ echo "news.tecmint.com" | tr [:lower:] [:upper:]
NEWS.TECMINT.COM
```

### 11\. more Command

more command is a useful file perusal filter created basically for certificate viewing. It shows file content in a page like format, where users can press [Enter] to view more information.

You can use it to view large files like so:

```
tecmint@TecMint ~ $ dmesg | more
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 4.4.0-21-generic (buildd@lgw01-21) (gcc version 5.3.1 20160413 (Ubuntu 5.3.1-14ubuntu2) ) #37-Ubuntu SMP Mon Apr 18 18:33:37 UTC 2016 (Ubuntu 4.4.0-21.37-generic
4.4.6)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.4.0-21-generic root=UUID=bb29dda3-bdaa-4b39-86cf-4a6dc9634a1b ro quiet splash vt.handoff=7
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Centaur CentaurHauls
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Supporting XSAVE feature 0x01: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x02: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x04: 'AVX registers'
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
[    0.000000] x86/fpu: Using 'eager' FPU context switches.
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d3ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d400-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000a56affff] usable
[    0.000000] BIOS-e820: [mem 0x00000000a56b0000-0x00000000a5eaffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000a5eb0000-0x00000000aaabefff] usable
--More--
```

### 12\. less Command

less is the opposite of more command above but it offers extra features and it’s a little faster with large files.

Use it in the same way as more:

```
tecmint@TecMint ~ $ dmesg | less
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 4.4.0-21-generic (buildd@lgw01-21) (gcc version 5.3.1 20160413 (Ubuntu 5.3.1-14ubuntu2) ) #37-Ubuntu SMP Mon Apr 18 18:33:37 UTC 2016 (Ubuntu 4.4.0-21.37-generic
4.4.6)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.4.0-21-generic root=UUID=bb29dda3-bdaa-4b39-86cf-4a6dc9634a1b ro quiet splash vt.handoff=7
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Centaur CentaurHauls
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Supporting XSAVE feature 0x01: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x02: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x04: 'AVX registers'
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
[    0.000000] x86/fpu: Using 'eager' FPU context switches.
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d3ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d400-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000a56affff] usable
[    0.000000] BIOS-e820: [mem 0x00000000a56b0000-0x00000000a5eaffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000a5eb0000-0x00000000aaabefff] usable
:
```

Learn Why [‘less’ is Faster Than ‘more’ Command][14] for effective file navigation in Linux.

That’s all for now, do let us know of any [useful command line tools][15] not mentioned here, that act as a text filters in Linux via the comment section below.

--------------------------------------------------------------------------------

作者简介：Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-file-operations-commands/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[2]:http://www.tecmint.com/linux-sed-command-tips-tricks/
[3]:http://www.tecmint.com/sort-command-linux/
[4]:http://www.tecmint.com/linux-sort-command-examples/
[5]:http://www.tecmint.com/find-and-sort-files-modification-date-and-time-in-linux/
[6]:http://how%20to%20sort%20output%20of%20%E2%80%98ls%E2%80%99%20command%20by%20last%20modified%20date%20and%20time/
[7]:http://www.tecmint.com/category/awk-command/
[8]:http://www.tecmint.com/12-practical-examples-of-linux-grep-command/
[9]:http://www.tecmint.com/linux-grep-commands-character-classes-bracket-expressions/
[10]:http://www.tecmint.com/difference-between-grep-egrep-and-fgrep-in-linux/
[11]:http://www.tecmint.com/view-contents-of-file-in-linux/
[12]:http://www.tecmint.com/fswatch-monitors-files-and-directory-changes-modifications-in-linux/
[13]:http://www.tecmint.com/sort-command-linux/
[14]:http://www.tecmint.com/linux-more-command-and-less-command-examples/
[15]:http://www.tecmint.com/tag/linux-tricks/
