What Is sosreport? How To Create sosreport
======
### What Is sosreport

The sosreport command is a tool that collects bunch of configuration details, system information and diagnostic information from running system (especially RHEL & OEL system).

It helps technical support engineer to analyze the system in many aspect.

This reports contains bunch of information about the system such as boot information, filesystem, memory, hostname, installed rpms, system IP, networking details, OS version, installed kernel, loaded kernel modules, list of open files, list of PCI devices, mount point and it’s details, running process information, process tree output, system routing, all the configuration files which is located in /etc folder, and all the log files which is located in /var folder.

This will take a while to generate a report and it’s depends on your system installation and configuration.

Once completed, sosreport will generate a compressed archive file under /tmp directory.

We have to provide the sosreport to RHEL (Red Hat Enterprise Linux) & OEL (Oracle Enterprise Linux) technical support engineer whenever we raise a case with them for initial analyze. This helps support engineer to verify if anything is wrong on the system.

### How To Install sosreport

sosreport installation is not a big deal, just run the following command to install it.
```
# yum install sos

```

### How To Generate sosreport

Also generating sosreport is not a big deal so, just run the sosreport command without any options.

By default it doesn’t shows much information while generating sosreport and only display how many reports are generated. If you want to see detailed information just add `-v` option while generating the sosreport.

It will ask you to enter your name and the support case information.
```
# sosreport

sosreport (version 3.2)

This command will collect diagnostic and configuration information from this Oracle Linux system and installed applications.

An archive containing the collected information will be generated in /tmp/sos.3pt1yJ and may be provided to a Oracle USA support representative.

Any information provided to Oracle USA will be treated in accordance with the published support policies at:

 http://linux.oracle.com/

The generated archive may contain data considered sensitive and its content should be reviewed by the originating organization before being passed to any third party.

No changes will be made to system configuration.

Press ENTER to continue, or CTRL-C to quit.

Please enter your first initial and last name [oracle.2daygeek.com]: 2daygeek
Please enter the case id that you are generating this report for []: 3-16619296812

Setting up archive ...
Setting up plugins ...
dbname must be supplied to dump a database.
Running plugins. Please wait ...

 Running 86/86: yum...
[plugin:kvm] could not unmount /sys/kernel/debug
Creating compressed archive...

Your sosreport has been generated and saved in:

 /tmp/sosreport-2daygeek.3-16619296812-20180307124921.tar.xz

The checksum is: 4e80226ae175bm185c0o2d7u2yoac52o

Please send this file to your support representative.

```

### What Are The Details There In The Archive File

I’m just curious, what kind of details are there in the archive file. To understand this, i gonna extract a archive file on my system.

Run the following command to extract an archive file.
```
# tar -xf /tmp/sosreport-2daygeek.3-16619296812-20180307124921.tar.xz

```

To see what are the information captured by sosreport, go to file extracted directory.
```
# ls -lh sosreport-2daygeek.3-16619296812-20180307124921

total 60K
dr-xr-xr-x 4 root root 4.0K Sep 30 10:56 boot
lrwxrwxrwx 1 root root 37 Oct 20 07:25 chkconfig -> sos_commands/startup/chkconfig_--list
lrwxrwxrwx 1 root root 25 Oct 20 07:25 date -> sos_commands/general/date
lrwxrwxrwx 1 root root 27 Oct 20 07:25 df -> sos_commands/filesys/df_-al
lrwxrwxrwx 1 root root 31 Oct 20 07:25 dmidecode -> sos_commands/hardware/dmidecode
drwxr-xr-x 43 root root 4.0K Oct 20 07:21 etc
lrwxrwxrwx 1 root root 24 Oct 20 07:25 free -> sos_commands/memory/free
lrwxrwxrwx 1 root root 29 Oct 20 07:25 hostname -> sos_commands/general/hostname
lrwxrwxrwx 1 root root 130 Oct 20 07:25 installed-rpms -> sos_commands/rpm/sh_-c_rpm_--nodigest_-qa_--qf_NAME_-_VERSION_-_RELEASE_._ARCH_INSTALLTIME_date_awk_-F_printf_-59s_s_n_1_2_sort_-f
lrwxrwxrwx 1 root root 34 Oct 20 07:25 ip_addr -> sos_commands/networking/ip_-o_addr
lrwxrwxrwx 1 root root 45 Oct 20 07:25 java -> sos_commands/java/alternatives_--display_java
drwxr-xr-x 4 root root 4.0K Sep 30 10:56 lib
lrwxrwxrwx 1 root root 35 Oct 20 07:25 lsb-release -> sos_commands/lsbrelease/lsb_release
lrwxrwxrwx 1 root root 25 Oct 20 07:25 lsmod -> sos_commands/kernel/lsmod
lrwxrwxrwx 1 root root 36 Oct 20 07:25 lsof -> sos_commands/process/lsof_-b_M_-n_-l
lrwxrwxrwx 1 root root 22 Oct 20 07:25 lspci -> sos_commands/pci/lspci
lrwxrwxrwx 1 root root 29 Oct 20 07:25 mount -> sos_commands/filesys/mount_-l
lrwxrwxrwx 1 root root 38 Oct 20 07:25 netstat -> sos_commands/networking/netstat_-neopa
drwxr-xr-x 3 root root 4.0K Oct 19 16:16 opt
dr-xr-xr-x 10 root root 4.0K Jun 23 2017 proc
lrwxrwxrwx 1 root root 30 Oct 20 07:25 ps -> sos_commands/process/ps_auxwww
lrwxrwxrwx 1 root root 27 Oct 20 07:25 pstree -> sos_commands/process/pstree
dr-xr-x--- 2 root root 4.0K Oct 17 12:09 root
lrwxrwxrwx 1 root root 32 Oct 20 07:25 route -> sos_commands/networking/route_-n
dr-xr-xr-x 2 root root 4.0K Sep 30 10:55 sbin
drwx------ 54 root root 4.0K Oct 20 07:21 sos_commands
drwx------ 2 root root 4.0K Oct 20 07:21 sos_logs
drwx------ 2 root root 4.0K Oct 20 07:21 sos_reports
dr-xr-xr-x 6 root root 4.0K Jun 23 2017 sys
lrwxrwxrwx 1 root root 28 Oct 20 07:25 uname -> sos_commands/kernel/uname_-a
lrwxrwxrwx 1 root root 27 Oct 20 07:25 uptime -> sos_commands/general/uptime
drwxr-xr-x 6 root root 4.0K Sep 25 2014 var
-rw------- 1 root root 1.7K Oct 20 07:21 version.txt
lrwxrwxrwx 1 root root 62 Oct 20 07:25 vgdisplay -> sos_commands/lvm2/vgdisplay_-vv_--config_global_locking_type_0

```

To double confirm what exactly sosreport captured, i’m gonna to see uname output file which was captured by sosreport.
```
# more uname_-a
Linux oracle.2daygeek.com 2.6.32-042stab127.2 #1 SMP Thu Jan 4 16:41:44 MSK 2018 x86_64 x86_64 x86_64 GNU/Linux

```

### Additional Options

Visit help page to view all available options for sosreport.
```
# sosreport --help
Usage: sosreport [options]

Options:
 -h, --help show this help message and exit
 -l, --list-plugins list plugins and available plugin options
 -n NOPLUGINS, --skip-plugins=NOPLUGINS
 disable these plugins
 -e ENABLEPLUGINS, --enable-plugins=ENABLEPLUGINS
 enable these plugins
 -o ONLYPLUGINS, --only-plugins=ONLYPLUGINS
 enable these plugins only
 -k PLUGOPTS, --plugin-option=PLUGOPTS
 plugin options in plugname.option=value format (see
 -l)
 --log-size=LOG_SIZE set a limit on the size of collected logs
 -a, --alloptions enable all options for loaded plugins
 --all-logs collect all available logs regardless of size
 --batch batch mode - do not prompt interactively
 --build preserve the temporary directory and do not package
 results
 -v, --verbose increase verbosity
 --verify perform data verification during collection
 --quiet only print fatal errors
 --debug enable interactive debugging using the python debugger
 --ticket-number=CASE_ID
 specify ticket number
 --case-id=CASE_ID specify case identifier
 -p PROFILES, --profile=PROFILES
 enable plugins selected by the given profiles
 --list-profiles
 --name=CUSTOMER_NAME specify report name
 --config-file=CONFIG_FILE
 specify alternate configuration file
 --tmp-dir=TMP_DIR specify alternate temporary directory
 --no-report Disable HTML/XML reporting
 -z COMPRESSION_TYPE, --compression-type=COMPRESSION_TYPE
 compression technology to use [auto, gzip, bzip2, xz]
 (default=auto)

Some examples:

 enable cluster plugin only and collect dlm lockdumps:
 # sosreport -o cluster -k cluster.lockdump

 disable memory and samba plugins, turn off rpm -Va collection:
 # sosreport -n memory,samba -k rpm.rpmva=off

```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-create-collect-sosreport-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
