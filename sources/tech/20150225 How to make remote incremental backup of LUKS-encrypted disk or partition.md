How to make remote incremental backup of LUKS-encrypted disk/partition
================================================================================
Some of us have our hard drives at home or on a [VPS][1] encrypted by [Linux Unified Key Setup (LUKS)][2] for security reasons, and these drives can quickly grow to tens or hundreds of GBs in size. So while we enjoy the security of our LUKS device, we may start to think about a possible remote backup solution. For secure off-site backup, we will need something that operates at the block level of the encrypted LUKS device, and not at the un-encrypted file system level. So in the end we find ourselves in a situation where we will need to transfer the entire LUKS device (let's say 200GB for example) each time we want to make a backup. Clearly not feasible. How can we deal with this problem?

### A Solution: Bdsync ###

This is when a brilliant open-source tool called [Bdsync][3] (thanks to Rolf Fokkens) comes to our rescue. As the name implies, Bdsync can synchronize "block devices" over network. For fast synchronization, Bdsync generates and compares MD5 checksums of blocks in the local/remote block devices, and sync only the differences. What rsync can do at the file system level, Bdsync can do it at the block device level. Naturally, it works with encrypted LUKS devices as well. Pretty neat!

Using Bdsync, the first-time backup will copy the entire LUKS block device to a remote host, so it will take a lot of time to finish. However, after that initial backup, if we make some new files on the LUKS device, the second backup will be finished quickly because we will need to copy only that blocks which have been changed. Classic incremental backup at play!

### Install Bdsync on Linux ###

Bdsync is not included in the standard repositories of [Linux][4] distributions. Thus you need to build it from the source. Use the following distro-specific instructions to install Bdsync and its man page on your system.

#### Debian, Ubuntu or Linux Mint ####

    $ sudo apt-get install git gcc libssl-dev
    $ git clone https://github.com/TargetHolding/bdsync.git
    $ cd bdsync
    $ make
    $ sudo cp bdsync /usr/local/sbin
    $ sudo mkdir -p /usr/local/man/man1
    $ sudo sh -c 'gzip -c bdsync.1 > /usr/local/man/man1/bdsync.1.gz'

#### Fedora or CentOS/RHEL ####

    $ sudo yum install git gcc openssl-devel
    $ git clone https://github.com/TargetHolding/bdsync.git
    $ cd bdsync
    $ make
    $ sudo cp bdsync /usr/local/sbin
    $ sudo mkdir -p /usr/local/man/man1
    $ sudo sh -c 'gzip -c bdsync.1 > /usr/local/man/man1/bdsync.1.gz'

### Perform Off-site Incremental Backup of LUKS-Encrypted Device ###

I assume that you have already provisioned a LUKS-encrypted block device as a backup source (e.g., /dev/LOCDEV). I also assume that you have a remote host where the source device will be backed up (e.g., as /dev/REMDEV).

You need to access the root account on both systems, and set up [password-less SSH access][5] from the local host to a remote host. Finally, you need to install Bdsync on both hosts.

To initiate a remote backup process on the local host, we execute the following command as the root:

    # bdsync "ssh root@remote_host bdsync --server" /dev/LOCDEV /dev/REMDEV | gzip > /some_local_path/DEV.bdsync.gz 

Some explanations are needed here. Bdsync client will open an SSH connection to the remote host as the root, and execute Bdsync client with --server option. As clarified, /dev/LOCDEV is our source LUKS block device on the local host, and /dev/REMDEV is the target block device on the remote host. They could be /dev/sda (for an entire disk) or /dev/sda2 (for a single partition). The output of the local Bdsync client is then piped to gzip, which creates DEV.bdsync.gz (so-called binary patch file) in the local host.

The first time you run the above command, it will take very long time, depending on your Internet/LAN speed and the size of /dev/LOCDEV. Remember that you must have two block devices (/dev/LOCDEV and /dev/REMDEV) with the same size. 

The next step is to copy the generated patch file from the local host to the remote host. Using scp is one possibility:

    # scp /some_local_path/DEV.bdsync.gz root@remote_host:/remote_path 

The final step is to execute the following command on the remote host, which will apply the patch file to /dev/REMDEV:

    # gzip -d < /remote_path/DEV.bdsync.gz | bdsync --patch=/dev/DSTDEV 

I recommend doing some tests with small partitions (without any important data) before deploying Bdsync with real data. After you fully understand how the entire setup works, you can start backing up real data.

### Conclusion ###

In conclusion, we showed how to use Bdsync to perform incremental backups for LUKS devices. Like rsync, only a fraction of data, not the entire LUKS device, is needed to be pushed to an off-site backup site at each backup, which saves bandwidth and backup time. Rest assured that all the data transfer is secured by SSH or SCP, on top of the fact that the device itself is encrypted by LUKS. It is also possible to improve this setup by using a dedicated user (instead of the root) who can run bdsync. We can also use bdsync for ANY block device, such as LVM volumes or RAID disks, and can easily set up Bdsync to back up local disks on to USB drives as well. As you can see, its possibility is limitless!

Feel free to share your thought.

--------------------------------------------------------------------------------

via: http://xmodulo.com/remote-incremental-backup-luks-encrypted-disk-partition.html

作者：[Iulian Murgulet][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/iulian
[1]:http://xmodulo.com/go/digitalocean
[2]:http://xmodulo.com/how-to-create-encrypted-disk-partition-on-linux.html
[3]:http://bdsync.rolf-fokkens.nl/
[4]:http://xmodulo.com/recommend/linuxbook
[5]:http://xmodulo.com/how-to-enable-ssh-login-without.html