5 Awesome Open Source Backup Software For Linux and Unix-like Systems
================================================================================
A good backup plan is essential in order to have the ability to recover from

- Human errors
- RAID or disk failure
- File system corruption
- Data center destruction and more.

In this post I'm going to list amazingly awesome open source Backup software for you.

### What to look for when choosing backup software for an enterprise? ###

Make sure the following features are supported backup software you deploy:

1. **Open source software** - You must use software for which the original source code is made freely available and may be and modified. This ensures that you can recover your data in case vendor/project stopped working on software or refused to provide patches.
1. **Cross-platform support** - Make sure backup software works well on the OS deployed on all desktop and server operating systems.
1. **Data format** - Open data format ensures that you can recover data in case vendor or project stopped working on software.
1. **Autochangers** - Autochangers are nothing but a variety of backup devices, including library, near-line storage, and autoloader. Autochangers allows you to automate the task of loading, mounting, and labeling backup media such as tape.
1. **Backup media** - Make sure you can backup data on tape, disk, DVD and in cloud storage such as AWS.
1. **Encryption datastream** - Make sure all client-to-server traffic will be encrypted to ensure transmission integrity over the LAN/WAN/Internet.
1. **Database support** - Make sure backup software can backup database server such as MySQL or Oracle.
1. **Backup span multiple volumes** - Backup software can split each backup (dumpfile) into a series of parts, allowing for different parts to existing on different volumes. This ensures that large backups (such as 100TB file) can be stored on larger than a single backup device such as disk or tape volume.
1. **VSS (Volume Shadow Copy)** - It is [Microsoft's Volume Shadow Copy Service (VSS)][1] and it is used to create snapshots of data that is to be backed up. Make sure backup software support VSS for MS-Windows client/server.
1. **[Deduplication][2]** - It is a data compression technique for eliminating duplicate copies of repeating data (for example, images).
1. **License and cost** - Make sure you [understand and use of open source license][3] under which the original backup software is made available to you.
1. **Commercial support** - Open source software can provide community based (such as email list or fourm) or professional (such as subscriptions provided at additional cost) based support. You can use paid professional support for training and consulting purpose.
1. **Reports and alerts** - Finally, you must able to see backup reports, current job status, and get alert when something goes wrong while making backups.

### Bacula - Client/server backup tool for heterogeneous networks ###

I personally use this software to manage backup and recovery across a network of computers including Linux, OSX and Windows. You can configure it via a CLI, GUI or web interface.

![](http://s0.cyberciti.org/uploads/cms/2014/11/bacula-network-backup.jpg)

- Operating system : Cross-platform
- Backup Levels : Full, differential, incremental, and consolidation.
- Data format: Custom but fully open.
- Autochangers: Yes
- Backup media: Tape/Disk/DVD
- Encryption datastream: Yes
- Database support: MSSQL/PostgreSQL/Oracle/
- Backup span multiple volumes: Yes
- VSS: Yes
- License : Affero General Public License v3.0
- Download url : [bacula.org][4]

### Amanda - Another good client/server backup tool ###

AMANDA is an acronym for Advanced Maryland Automatic Network Disk Archiver. It allows the sysadmin to set up a single backup server to back up other hosts over network to tape drives or disk or authchangers.

- Operating system : Cross-platform
- Backup Levels : Full, differential, incremental, and consolidation.
- Data format: Open (can be recovered using tool such as tar).
- Autochangers: Yes
- Backup media: Tape/Disk/DVD
- Encryption datastream: Yes
- Database support: MSSQL/Oracle
- Backup span multiple volumes: Yes
- VSS: Yes
- License : GPL, LGPL, Apache, Amanda License
- Download url : [amanda.org][5]

### Backupninja - Lightweight backup system ###

Backupninja is a simple and easy to use backup system. You can simply drop a config files into /etc/backup.d/ to backup multiple hosts.

![](http://s0.cyberciti.org/uploads/cms/2014/11/ninjabackup-helper-script.jpg)

- Operating system : Linux/Unix
- Backup Levels : Full and incremental (rsync+hard links)
- Data format: Open
- Autochangers: N/A
- Backup media: Disk/DVD/CD/ISO images
- Encryption datastream: Yes (ssh) and [encrypted remote backups via duplicity][6]
- Database support: MySQL/PostgreSQL/OpenLDAP and subversion or trac repositories.
- Backup span multiple volumes: ??
- VSS: ??
- License : GPL
- Download url : [riseup.net][7]

### Backuppc - High-performance client/server tool ###

Backuppc is can be used to backup Linux and Windows based systems to a master server's disk. It comes with a clever pooling scheme minimizes disk storage, disk I/O and network I/O.

![](http://s0.cyberciti.org/uploads/cms/2014/11/BackupPCServerStatus.jpg)

- Operating system : Linux/Unix and Windows
- Backup Levels : Full and incremental (rsync+hard links and pooling scheme)
- Data format: Open
- Autochangers: N/A
- Backup media: Disk/RAID storage
- Encryption datastream: Yes
- Database support: Yes (via custom shell scripts)
- Backup span multiple volumes: ??
- VSS: ??
- License : GPL
- Download url : [backuppc.sourceforge.net][8]

### UrBackup - Easy to setup client/server system ###

It is an easy to setup open source client/server backup system, that through a combination of image and file backups accomplishes both data safety and a fast restoration time. Your files can be restored through the web interface or the Windows Explorer while the backups of drive volumes can be restored with a bootable CD or USB-Stick (bare metal restore). A web interface makes setting up your own backup server really easy.

![](http://s0.cyberciti.org/uploads/cms/2014/11/urbackup.jpg)

- Operating system : Linux/FreeBSD/Unix/Windows/several Linux based NAS operating systems. Client only runs on Linux and Windows.
- Backup Levels : Full and incremental
- Data format: Open
- Autochangers: N/A
- Backup media: Disk/Raid storage/DVD
- Encryption datastream: Yes
- Database support: ??
- Backup span multiple volumes: ??
- VSS: ??
- License : GPL v3+
- Download url : [urbackup.org][9]

### Other awesome open source backup software for your consideration ###

The Amanda, Bacula and above-mentioned software are feature rich but can be complicated to set for small network or a single server. I recommend that you study and use the following backup software:

1. [Rsnapshot][10] - I recommend this tool for local and remote filesystem snapshot utility. See how to set and use [this tool on Debian/Ubuntu Linux][11] and [CentOS/RHEL based systems][12].
1. [rdiff-backup][13] - Another great remote incremental backup tool for Unix-like systems.
1. [Burp][14] - Burp is a network backup and restore program. It uses librsync in order to save network traffic and to save on the amount of space that is used by each backup. It also uses VSS (Volume Shadow Copy Service) to make snapshots when backing up Windows computers.
1. [Duplicity][15] - Great encrypted bandwidth-efficient backup for Unix-like system. See how to [Install Duplicity for encrypted backup in cloud][16] for more infomation.
1. [SafeKeep][17] - SafeKeep is a centralized and easy to use backup application that combines the best features of a mirror and an incremental backup.
1. [DREBS][18] - DREBS is a tool for taking periodic snapshots of EBS volumes. It is designed to be run on the EC2 host which the EBS volumes to be snapshoted are attached.
1. Old good unix programs like rsync, tar, cpio, mt and dump.

### Conclusion ###

I hope you will find this post useful to backup your important data. Do not forgot to verify your backups and make multiple backup copies of your data. Also, RAID is not a backup solution. Use any one of the above-mentioned programs to backup your servers, desktop/laptop and personal mobile devices. If you know of any other open source backup software I didn't mention, share them in the comments below.

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/open-source/awesome-backup-software-for-linux-unix-osx-windows-systems/

作者：[nixCraft][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.cyberciti.biz/tips/about-us
[1]:http://technet.microsoft.com/en-us/library/cc785914(v=ws.10).aspx
[2]:http://en.wikipedia.org/wiki/Data_deduplication
[3]:http://opensource.org/licenses
[4]:http://www.bacula.org/
[5]:http://www.amanda.org/
[6]:http://www.cyberciti.biz/faq/duplicity-installation-configuration-on-debian-ubuntu-linux/
[7]:https://labs.riseup.net/code/projects/backupninja
[8]:http://backuppc.sourceforge.net/
[9]:http://www.urbackup.org/
[10]:http://www.rsnapshot.org/
[11]:http://www.cyberciti.biz/faq/linux-rsnapshot-backup-howto/
[12]:http://www.cyberciti.biz/faq/redhat-cetos-linux-remote-backup-snapshot-server/
[13]:http://www.nongnu.org/rdiff-backup/
[14]:http://burp.grke.org/
[15]:http://www.cyberciti.biz/open-source/awesome-backup-software-for-linux-unix-osx-windows-systems/
[16]:http://www.cyberciti.biz/faq/duplicity-installation-configuration-on-debian-ubuntu-linux/
[17]:http://safekeep.sourceforge.net/
[18]:https://github.com/dojo4/drebs