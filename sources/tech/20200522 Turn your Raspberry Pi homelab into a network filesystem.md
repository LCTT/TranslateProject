[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Turn your Raspberry Pi homelab into a network filesystem)
[#]: via: (https://opensource.com/article/20/5/nfs-raspberry-pi)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

Turn your Raspberry Pi homelab into a network filesystem
======
Add shared filesystems to your homelab with an NFS server.
![Blue folders flying in the clouds above a city skyline][1]

A shared filesystem is a great way to add versatility and functionality to a homelab. Having a centralized filesystem shared to the clients in the lab makes organizing data, doing backups, and sharing data considerably easier. This is especially useful for web applications load-balanced across multiple servers and for persistent volumes used by [Kubernetes][2], as it allows pods to be spun up with persistent data on any number of nodes.

Whether your homelab is made up of ordinary computers, surplus enterprise servers, or Raspberry Pis or other single-board computers (SBCs), a shared filesystem is a useful asset, and a network filesystem (NFS) server is a great way to create one.

I have written before about [setting up a "private cloud at home][3]," a homelab made up of Raspberry Pis or other SBCs and maybe some other consumer hardware or a desktop PC. An NFS server is an ideal way of sharing data between these components. Since most SBCs' operating systems (OSes) run off an SD card, there are some challenges. SD cards suffer from increased failures, especially when used as the OS disk for a computer, and they are not made to be constantly read from and written to. What you really need is a real hard drive: they are generally cheaper per gigabyte than SD cards, especially for larger disks, and they are less likely to sustain failures. Raspberry Pi 4's now come with USB 3.0 ports, and USB 3.0 hard drives are ubiquitous and affordable. It's a perfect match. For this project, I will use a 2TB USB 3.0 external hard drive plugged into a Raspberry Pi 4 running an NFS server.

![Raspberry Pi with a USB hard disk][4]

(Chris Collins, [CC BY-SA 4.0][5])

### Install the NFS server software

I am running Fedora Server on a Raspberry Pi, but this project can be done with other distributions as well. To run an NFS server on Fedora, you need the nfs-utils package, and luckily it is already installed (at least in Fedora 31). You also need the rpcbind package if you are planning to run NFSv3 services, but it is not strictly required for NFSv4.

If these packages are not already on your system, install them with the **dnf** command:


```
# Intall nfs-utils and rpcbind
$ sudo dnf install nfs-utils rpcbind
```

Raspbian is another popular OS used with Raspberry Pis, and the setup is almost exactly the same. The package names differ, but that is about the only major difference. To install an NFS server on a system running Raspbian, you need the following packages:

  * **nfs-common:** These files are common to NFS servers and clients
  * **nfs-kernel-server:** The main NFS server software package



Raspbian uses **apt-get** for package management (not **dnf**, as Fedora does), so use that to install the packages:


```
# For a Raspbian system, use apt-get to install the NFS packages
$ sudo apt-get install nfs-common nfs-kernel-server
```

### Prepare a USB hard drive as storage

As I mentioned above, a USB hard drive is a good choice for providing storage for Raspberry Pis or other SBCs, especially because the SD card used for the OS disk image is not ideal. For your private cloud at home, you can use cheap USB 3.0 hard drives for large-scale storage. Plug the disk in and use **fdisk** to find out the device ID assigned to it, so you can work with it.


```
# Find your disk using fdisk
# Unrelated disk content omitted
$ sudo fdisk -l

Disk /dev/sda: 1.84 TiB, 2000398933504 bytes, 3907029167 sectors
Disk model: BUP Slim BK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xe3345ae9

Device     Boot Start        End    Sectors  Size Id Type
/dev/sda1        2048 3907028991 3907026944  1.8T 83 Linux
```

For clarity, in the example output above, I omitted all the disks except the one I'm interested in. You can see the USB disk I want to use was assigned the device **/dev/sda**, and you can see some information about the model (**Disk model: BUP Slim BK**), which helps me identify the correct disk. The disk already has a partition, and its size confirms it is the disk I am looking for.

_Note:_ Make sure to identify the correct disk and partition for your device. It may be different than the example above.

Each partition created on a drive gets a special universally unique identifier (UUID). The computer uses the UUID to make sure it is mounting the correct partition to the correct location using the **/etc/fstab** config file. You can retrieve the UUID of the partition using the **blkid** command:


```
# Get the block device attributes for the partition
# Make sure to use the partition that applies in your case.  It may differ.
$ sudo blkid /dev/sda1

/dev/sda1: LABEL="backup" UUID="bd44867c-447c-4f85-8dbf-dc6b9bc65c91" TYPE="xfs" PARTUUID="e3345ae9-01"
```

In this case, the UUID of **/dev/sda1** is **bd44867c-447c-4f85-8dbf-dc6b9bc65c91**. Yours will be different, so make a note of it.

### Configure the Raspberry Pi to mount this disk on startup, then mount it

Now that you have identified the disk and partition you want to use, you need to tell the computer how to mount it, to do so whenever it boots up, and to go ahead and mount it now. Because this is a USB disk and might be unplugged, you will also configure the Raspberry Pi to not wait on boot if the disk is not plugged in or is otherwise unavailable.

In Linux, this is done by adding the partition to the **/etc/fstab** configuration file, including where you want it to be mounted and some arguments to tell the computer how to treat it. This example will mount the partition to **/srv/nfs**, so start by creating that path:


```
# Create the mountpoint for the disk partition
$ sudo mkdir -p /srv/nfs
```

Next, modify the **/etc/fstab** file using the following syntax format:


```
`<disk id>     <mountpoint>      <filesystem type>     <options>     <fs_freq> <fs_passno>`
```

Use the UUID you identified earlier for the disk ID. As I mentioned in the prior step, the mountpoint is **/srv/nfs**. For the filesystem type, it is usually best to select the actual filesystem, but since this will be a USB disk, use **auto**.

For the options values, use **nosuid,nodev,nofail**.

#### An aside about man pages:

That said, there are a _lot_ of possible options, and the manual (man) pages are the best way to see what they are. Investigating the man page for for fstab is a good place to start:


```
# Open the man page for fstab
$ man fstab
```

This opens the manual/documentation associated with the fstab command. In the man page, each of the options is broken down to show what it does and the common selections. For example, **The fourth field (fs_mntopts)** gives some basic information about the options that work in that field and directs you to **man (8) mount** for more in-depth description of the mount options. That makes sense, as the **/etc/fstab** file, in essence, tells the computer how to automate mounting disks, in the same way you would manually use the mount command.

You can get more information about the options you will use from mount's man page. The numeral 8, in parentheses, indicates the man page section. In this case, section 8 is for _System Administration tools and Daemons_.

Helpfully, you can get a list of the standard sections from the man page for **man**.

Back to mountng the disk, take a look at **man (8) mount**:


```
# Open Section 8 of the man pages for mount
$ man (8) mount
```

In this man page, you can examine what the options listed above do:

  * **nosuid:** Do not honor the suid/guid bit. Do not allow any files that might be on the USB disk to be executed as root. This is a good security practice.
  * **nodev:** Do not interpret characters or block special devices on the file system; i.e., do not honor any device nodes that might be on the USB disk. Another good security practice.
  * **nofail:** Do not log any errors if the device does not exist. This is a USB disk and might not be plugged in, so it will be ignored if that is the case.



Returning to the line you are adding to the **/etc/fstab** file, there are two final options: **fs_freq** and **fs_passno**. Their values are related to somewhat legacy options, and _most_ modern systems just use a **0** for both, especially for filesystems on USB disks. The fs_freq value relates to the dump command and making dumps of the filesystem. The fs_passno value defines which filesystems to **fsck** on boot and their order. If it's set, usually the root partition would be **1** and any other filesystems would be **2**. Set the value to **0** to skip using **fsck** on this partition.

In your preferred editor, open the **/etc/fstab** file and add the entry for the partition on the USB disk, replacing the values here with those gathered in the previous steps.


```
# With sudo, or as root, add the partition info to the /etc/fstab file
UUID="bd44867c-447c-4f85-8dbf-dc6b9bc65c91"    /srv/nfs    auto    nosuid,nodev,nofail,noatime 0 0
```

### Enable and start the NFS server

With the packages installed and the partition added to your **/etc/fstab** file, you can now go ahead and start the NFS server. On a Fedora system, you need to enable and start two services: **rpcbind** and **nfs-server**. Use the **systemctl** command to accomplish this:


```
# Start NFS server and rpcbind
$ sudo systemctl enable rpcbind.service
$ sudo systemctl enable nfs-server.service
$ sudo systemctl start rpcbind.service
$ sudo systemctl start nfs-server.service
```

On Raspbian or other Debian-based distributions, you just need to enable and start the **nfs-kernel-server** service using the **systemctl** command the same way as above.

#### RPCBind

The rpcbind utility is used to map remote procedure call (RPC) services to ports on which they listen. According to the rpcbind man page:

> "When an RPC service is started, it tells rpcbind the address at which it is listening, and the RPC program numbers it is prepared to serve. When a client wishes to make an RPC call to a given program number, it first contacts rpcbind on the server machine to determine the address where RPC requests should be sent."

In the case of an NFS server, rpcbind maps the protocol number for NFS to the port on which the NFS server is listening. However, NFSv4 does not require the use of rpcbind. If you use _only_ NFSv4 (by removing versions two and three from the configuration), rpcbind is not required. I've included it here for backward compatibility with NFSv3.

### Export the mounted filesystem

The NFS server decides which filesystems are shared with (exported to) which remote clients based on another configuration file, **/etc/exports**. This file is just a map of host internet protocol (IP) addresses (or subnets) to the filesystems to be shared and some options (read-only or read-write, root squash, etc.). The format of the file is:


```
`<directory>     <host or hosts>(options)`
```

In this example, you will export the partition mounted to **/srv/nfs**. This is the "directory" piece.

The second part, the host or hosts, includes the hosts you want to export this partition to. These can be specified as a single host with a fully qualified domain name or hostname, the IP address of the host, a number of hosts using wildcard characters to match domains (e.g., *.example.org), IP networks (e.g., classless inter-domain routing, or CIDR, notation), or netgroups.

The third piece includes options to apply to the export:

  * **ro/rw:** Export the filesystem as read only or read write
  * **wdelay:** Delay writes to the disk if another write is imminent to improve performance (this is _probably_ not as useful with a solid-state USB disk, if that is what you are using)
  * **root_squash:** Prevent any root users on the client from having root access on the host, and set the root UID to **nfsnobody** as a security precaution



Test exporting the partition you have mouted at **/srv/nfs** to a single client—for example, a laptop. Identify your client's IP address (my laptop's is **192.168.2.64**, but yours will likely be different). You could share it to a large subnet, but for testing, limit it to the single IP address. The CIDR notation for just this IP is **192.168.2.64/32**; a **/32** subnet is just a single IP.

Using your preferred editor, edit the **/etc/exports** file with your directory, host CIDR, and the **rw** and **root_squash** options:


```
# Edit your /etc/exports file like so, substituting the information from your systems
/srv/nfs    192.168.2.64/32(rw,root_squash)
```

_Note:_ If you copied the **/etc/exports** file from another location or otherwise overwrote the original with a copy, you may need to restore the SELinux context for the file. You can do this with the **restorecon** command:


```
# Restore the SELinux context of the /etc/exports file
$ sudo restorecon /etc/exports
```

Once this is done, restart the NFS server to pick up the changes to the **/etc/exports** file:


```
# Restart the nfs server
$ sudo systemctl restart nfs-server.service
```

### Open the firewall for the NFS service

Some systems, by default, do not run a [firewall service][6]. Raspbian, for example, defaults to open iptables rules, with ports opened by different services immediately available from outside the machine. Fedora server, by contrast, runs the firewalld service by default, so you must open the port for the NFS server (and rpcbind, if you will be using NFSv3). You can do this with the **firewall-cmd** command.

Check the zones used by firewalld and get the default zone. For Fedora Server, this will be the FedoraServer zone:


```
# List the zones
# Output omitted for brevity
$ sudo firewall-cmd --list-all-zones

# Retrieve just the default zone info
# Make a note of the default zone
$ sudo firewall-cmd --get-default-zone

# Permanently add the nfs service to the list of allowed ports
$ sudo firewall-cmd --add-service=nfs --permanent

# For NFSv3, we need to add a few more ports, nfsv3, rpc-mountd, rpc-bind
$ sudo firewall-cmd --add-service=(nfs3,mountd,rpc-bind)

# Check the services for the zone, substituting the default zone in use by your system
$ sudo firewall-cmd --list-services --zone=FedoraServer

# If all looks good, reload firewalld
$ sudo firewall-cmd --reload
```

And with that, you have successfully configured the NFS server with your mounted USB disk partition and exported it to your test system for sharing. Now you can test mounting it on the system you added to the exports list.

### Test the NFS exports

First, from the NFS server, create a file to read in the **/srv/nfs** directory:


```
# Create a test file to share
echo "Can you see this?" &gt;&gt; /srv/nfs/nfs_test
```

Now, on the client system you added to the exports list, first make sure the NFS client packages are installed. On Fedora systems, this is the **nfs-utils** package and can be installed with **dnf**. Raspbian systems have the **libnfs-utils** package that can be installed with **apt-get**.

Install the NFS client packages:


```
# Install the nfs-utils package with dnf
$ sudo dnf install nfs-utils
```

Once the client package is installed, you can test out the NFS export. Again on the client, use the mount command with the IP of the NFS server and the path to the export, and mount it to a location on the client, which for this test is the **/mnt** directory. In this example, my NFS server's IP is **192.168.2.109**, but yours will likely be different:


```
# Mount the export from the NFS server to the client host
# Make sure to substitute the information for your own hosts
$ sudo mount 192.168.2.109:/srv/nfs /mnt

# See if the nfs_test file is visible:
$ cat /mnt/nfs_test
Can you see this?
```

Success! You now have a working NFS server for your homelab, ready to share files with multiple hosts, allow multi-read/write access, and provide centralized storage and backups for your data. There are many options for shared storage for homelabs, but NFS is venerable, efficient, and a great option to add to your "private cloud at home" homelab. Future articles in this series will expand on how to automatically mount NFS shares on clients and how to use NFS as a storage class for Kubernetes Persistent Volumes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/nfs-raspberry-pi

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_cloud21x_cc.png?itok=5UwC92dO (Blue folders flying in the clouds above a city skyline)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://opensource.com/article/20/5/disk-image-raspberry-pi
[4]: https://opensource.com/sites/default/files/uploads/raspberrypi_with_hard-disk.jpg (Raspberry Pi with a USB hard disk)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/18/9/linux-iptables-firewalld
