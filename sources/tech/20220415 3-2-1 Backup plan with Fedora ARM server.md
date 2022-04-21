[#]: subject: "3-2-1 Backup plan with Fedora ARM server"
[#]: via: "https://fedoramagazine.org/3-2-1-backup-plan-with-fedora-arm-server/"
[#]: author: "Hanku Lee https://fedoramagazine.org/author/hankuoffroad/"
[#]: collector: "lujun9972"
[#]: translator: "hwllife"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3-2-1 Backup plan with Fedora ARM server
======

![][1]

Photo by [Markus Winkler][2] on [Unsplash][3]

Fedora Server Edition works on Single Board Computers (SBC) like Raspberry Pi. This article is aimed at data backup and restoration of personal data for users who want to take advantage of solid server systems and built-in tools like Cockpit. It describes 3 levels of backup.

### Pre-requisites

To use this guide, all you need is a working Fedora Linux workstation and the following items.

  * You should read, understand, and practice the requirements as documented in the Fedora Docs for [server installation][4] and [administration][5]
  * An SBC (Single Board Computer), tested for Fedora Linux. Check [hardware status here][6].
  * [Fedora ARM][7] [server][7] raw image &amp; ARM image installer
  * A choice of microSD Card (64 GB / Class 10) and SSD device
  * Ethernet cable / DHCP reserved IP or static IP
  * A Linux client workstation with ssh keys prepared
  * Make a choice of cloud storage services
  * Have an additional Linux workstation available



With this setup, I opted for Raspberry Pi 3B+/4B+ (one for hot-swap) because of the price and availability at the time of writing this article. While the Pi server is remotely connected using Cockpit, you can position the Pi near the router for a neat set-up.

### Harden server security

After following through with server installation and administration on the SBC, it is a good practice to harden the server security with firewalld.

You must configure the firewall as soon as the server is online before connecting the storage device to the server. Firewalld is a zone-based firewall. It creates one pre-defined zone ‘FedoraServer’ after following through with the installation and administration guide in the Fedora Docs.

#### Rich rules in firewalld

Rich rules are used to block or allow a particular IP address or address range. The following rule accepts SSH connections only from the host with the registered IP (of client workstation) and drops other connections. Run the commands in Cockpit Terminal or terminal in client workstation connect to the server via ssh.

```

    firewall-cmd --add-rich-rule='rule family=ipv4 source address=<registered_ip_address>/24 service name=ssh log prefix="SSH Logs" level="notice" accept'

```

#### Reject ping requests from all hosts

Use this command to set the icmp reject and disallow ping requests

```

    firewall-cmd --add-rich-rule='rule protocol value=icmp reject'

```

To carry out additional firewall controls, such as managing ports and zones, please refer to the link below. Please be aware that misconfiguring the firewall may make it vulnerable to security breaches.

[Managing firewall in Cockpit][8]
[firewalld rules][9]

### Configure storage for file server

The next step is to connect a storage device to the SBC and partition a newly attached storage device using Cockpit. With Cockpit’s graphical server management interface, managing a home lab (whether a single server or several servers) is much simpler than before. Fedora Linux server offers Cockpit as standard.

In this setup, an SSD device, powered by the USB port of the SBC, is placed in service without the need for an additional power supply.

  * Connect the storage device to a USB port of the SBC
  * After Cockpit is running (as set up in the pre-requisites), visit **ip-address-of-machine:9090** in the web browser of your client workstation
  * After logging into Cockpit, click ‘Turn on administrative access’ at the top of the Cockpit page
  * Click the “Storage” on the left pane
  * Select the device under “Drives” section to format and partition a blank storage device



![Cockpit Storage management][10]

  * On the screen of the selected storage device create a new partition table or format and create new partitions. When prompted to initialize disk, in the “Partitioning” type, select GPT partition
  * For a file system type from the drop-down list (XFS and ext4), choose ext4. This is suitable for an SBC with limited I/O capability (like USB 2.0 port) and limited bandwidth (less than 200MB/s)



![Create a partition in Cockpit][11]

  * To create a single partition taking up all the storage space on the device, specify its mount point, such as “/media” and click “Ok”
  * Click “Create partition”, which creates a new partition mounted at “/media”.



### Create backups and restore from backups

Backups are rarely one-size-fits-all. There are a few choices to make such as where the data is backed up, the steps you take to backup data, identify any automation, and determine how to restore backed-up data.

![Backup workflow – version 1.0][12]

#### Backup 1. rsync from client to file server (Raspberry Pi)

The command used for this transfer was:

```

    rsync -azP ~/source syncuser@host1:/destination

```

```

    Options:
    -a, --archive
    -z, --compress
    -P, --progress

```

To run rsync with additional options, set the following flags:

Update destination files in-place

```

    --inplace

```

Append data onto shorter files

```

    --append

```

Source-side deduplication combined with compression is the most effective way to reduce the size of data to be backed up before it goes to backup storage.

I run this manually at the end of the day. Automation scripts are advantageous once I settled in with the cloud backup workflow.

For details on rsync, please visit the Fedora magazine article [here][13].

#### Backup 2. rsync from file server to primary cloud storage

Factors to consider when selecting cloud storage are;

  * Cost: Upload, storage, and download fee
  * rsync, sftp supported
  * Data redundancy (RAID 10 or data center redundancy plan in place)
  * Snapshots



One of the cloud storage fitting these criteria is Hetzner’s hosted Nextcloud – [Storage Box][14]. You are not tied to a supplier and are free to switch without an exit penalty.

##### Generate SSH keys and create authorized key files in the file server

Use ssh-keygen to generate a new pair of SSH keys for the file server and cloud storage.

```

    ssh-keygen
    Generating public/private rsa key pair.
    Enter file in which to save the key . . .

```

Insert the required public SSH keys into a new local authorized_keys file.

```

    cat .ssh/id_rsa.pub >> storagebox_authorized_keys

```

##### Transfer keys to cloud storage

The next step is to upload the generated authorized_keys file to the Storage Box. To do this, create the directory .ssh with permission 700 and create the file authorized_keys with the public SSH keys and permission 600. Run the following command.

```

    echo -e "mkdir .ssh \n chmod 700 .ssh \n put storagebox_authorized_keys .ssh/authorized_keys \n chmod 600 .ssh/authorized_keys" | sftp <username>@<username>.your-storagebox.de

```

##### Use rsync over ssh

Use rsync to synchronize the current state of your file directories to Storage Box.

```

    rsync --progress -e 'ssh -p23' --recursive <local_directory> <username>@<username>.your-storagebox.de:<target_directory>

```

This process is called a push operation because it “pushes” a directory from the local system to a remote system.

##### Restore a directory from cloud storage

To restore a directory from the Storage Box, swap the directories:

```

    rsync --progress -e 'ssh -p23' --recursive <username>@<username>.your-storagebox.de:<remote_directory> <local_directory>

```

#### Backup 3. Client backup to secondary cloud storage

[Deja Dup][15] is in the Fedora software repo, making it a quick backup solution for Fedora Workstation. It handles the GPG encryption, scheduling, and file inclusion (which directories to back up).

![Backing up to the secondary cloud][16]

![Restoring files from cloud storage][17]

### Archive personal data

Not every data needs a 3-2-1 backup strategy. That is personal data share. I repurposed a hand-me-down laptop with a 1TB HDD as an archive of personal data (family photos).

Go to “Sharing” in settings (in my case, the GNOME file manager) and toggle the slider to enable sharing.

![][18]

Turn on “file sharing”, “Networks” and “Required password”, which allows you to share your public folders with other workstations on your local network using WebDAV.

![][19]

### Prepare fallback options

Untested backups are no better than no backups at all. I take the ‘hot swap’ approach in a home lab environment where disruptions like frequent power outages or liquid damages do happen. However, my recommendations are far from disaster recovery plans or automatic failover in corporate IT.

  * Dry run restoration of files on a regular basis
  * Backup ssh/GPG keys onto an external storage device
  * Copy a raw image of the Fedora ARM server onto an SD card
  * Keep snapshots of full backups at primary cloud storage
  * Automate backup process to minimize human error or oversight



### Track activity and troubleshoot with Cockpit

As your project grows, so does the number of servers you manage. Activity and alert tracking in Cockpit ease your administrative burden. You can achieve this in three ways using Cockpit’s graphical interface.

#### SELinux menu

How to diagnose network issues, find logs and troubleshoot in Cockpit

  * Go to SELinux to check logs
  * Check “solution details”
  * Select “Apply this solution” when necessary
  * View automation script and run it if necessary



![SELinux logs][20]

#### Network or storage logs

Server logs track detailed metrics that correlate CPU load, memory usage, network activity, and storage performance with the system’s journal. Logs are organized under the network or storage dashboard.

![Storage logs in Cockpit][21]

#### Software updates

Cockpit helps security updates on preset time and frequency. You can run all updates when you need them.

![Software updates][22]

Congratulations on setting up a file/backup server with the Fedora ARM server edition.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/3-2-1-backup-plan-with-fedora-arm-server/

作者：[Hanku Lee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hankuoffroad/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/04/3-2-1_backup-816x345.jpg
[2]: https://unsplash.com/@markuswinkler?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/computer-backup?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://docs.fedoraproject.org/en-US/fedora-server/server-installation-sbc/
[5]: https://docs.fedoraproject.org/en-US/fedora-server/sysadmin-postinstall/
[6]: https://docs.fedoraproject.org/en-US/quick-docs/raspberry-pi/
[7]: https://arm.fedoraproject.org/
[8]: https://fedoramagazine.org/managing-network-interfaces-and-firewalld-in-cockpit/
[9]: https://www.redhat.com/sysadmin/firewalld-rules-and-scenarios
[10]: https://fedoramagazine.org/wp-content/uploads/2022/03/Screenshot-from-2022-03-29-22-05-00b-1024x576.png
[11]: https://fedoramagazine.org/wp-content/uploads/2022/03/Screenshot-from-2022-03-29-22-03-36a.png
[12]: https://fedoramagazine.org/wp-content/uploads/2022/04/Backups3-1-1024x525.jpg
[13]: https://fedoramagazine.org/copying-large-files-with-rsync-and-some-misconceptions/
[14]: https://docs.hetzner.com/robot/storage-box/
[15]: https://fedoramagazine.org/easy-backups-with-deja-dup/
[16]: https://fedoramagazine.org/wp-content/uploads/2022/03/Screenshot-from-2022-03-29-22-47-30.png
[17]: https://fedoramagazine.org/wp-content/uploads/2022/03/Screenshot-from-2022-03-29-22-41-57.png
[18]: https://fedoramagazine.org/wp-content/uploads/2022/04/Screenshot-from-2022-04-14-20-48-49-1024x733.png
[19]: https://fedoramagazine.org/wp-content/uploads/2022/04/Screenshot-from-2022-04-14-20-51-18st.png
[20]: https://fedoramagazine.org/wp-content/uploads/2022/04/Screenshot-from-2022-04-02-11-24-30b-1024x441.png
[21]: https://fedoramagazine.org/wp-content/uploads/2022/04/Screenshot-from-2022-04-04-21-47-06SL-1024x259.png
[22]: https://fedoramagazine.org/wp-content/uploads/2022/04/Screenshot-from-2022-04-04-21-35-42b.png
