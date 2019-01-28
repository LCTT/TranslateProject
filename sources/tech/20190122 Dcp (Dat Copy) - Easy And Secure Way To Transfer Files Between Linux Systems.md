[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Dcp (Dat Copy) – Easy And Secure Way To Transfer Files Between Linux Systems)
[#]: via: (https://www.2daygeek.com/dcp-dat-copy-secure-way-to-transfer-files-between-linux-systems/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

Dcp (Dat Copy) – Easy And Secure Way To Transfer Files Between Linux Systems
======

Linux has native command to perform this task nicely using scp and rsync. However, we need to try new things.

Also, we need to encourage the developers who is working new things with different concept and new technology.

We also written few articles about these kind of topic, you can navigate those by clicking the below appropriate links.

Those are **[OnionShare][1]** , **[Magic Wormhole][2]** , **[Transfer.sh][3]** and **ffsend**.

### What’s Dcp?

[dcp][4] copies files between hosts on a network using the peer-to-peer Dat network.

dcp can be seen as an alternative to tools like scp, removing the need to configure SSH access between hosts.

This lets you transfer files between two remote hosts, without you needing to worry about the specifics of how said hosts reach each other and regardless of whether hosts are behind NATs.

dcp requires zero configuration and is secure, fast, and peer-to-peer. Also, this is not production-ready software. Use at your own risk.

### What’s Dat Protocol?

Dat is a peer-to-peer protocol. A community-driven project powering a next-generation Web.

### How dcp works:

dcp will create a dat archive for a specified set of files or directories and, using the generated public key, lets you download said archive from a second host.

Any data shared over the network is encrypted using the public key of the archive, meaning data access is limited to those who have access to said key.

### dcp Use cases:

  * Send files to multiple colleagues – just send the generated public key via chat and they can receive the files on their machine.
  * Sync files between two physical computers on your local network, without needing to set up SSH access.
  * Easily send files to a friend without needing to create a zip and upload it the cloud.
  * Copy files to a remote server when you have shell access but not SSH, for example on a kubernetes pod.
  * Share files between Linux/macOS and Windows, which isn’t exactly known for great SSH support.



### How To Install NodeJS & npm in Linux?

dcp package was written in JavaScript programming language so, we need to install NodeJS as a prerequisites to install dcp. Use the following command to install NodeJS in Linux.

For **`Fedora`** system, use **[DNF Command][5]** to install NodeJS  & npm.

```
$ sudo dnf install nodejs npm
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][6]** or **[APT Command][7]** to install NodeJS  & npm.

```
$ sudo apt install nodejs npm
```

For **`Arch Linux`** based systems, use **[Pacman Command][8]** to install NodeJS  & npm.

```
$ sudo pacman -S nodejs npm
```

For **`RHEL/CentOS`** systems, use **[YUM Command][9]** to install NodeJS  & npm.

```
$ sudo yum install epel-release
$ sudo yum install nodejs npm
```

For **`openSUSE Leap`** system, use **[Zypper Command][10]** to install NodeJS  & npm.

```
$ sudo zypper nodejs6
```

### How To Install dcp in Linux?

Once you have installed the NodeJS, use the following npm command to install dcp.

npm is a package manager for the JavaScript programming language. It is the default package manager for the JavaScript runtime environment Node.js.

```
# npm i -g dat-cp
```

### How to Send Files Through dcp?

Enter the files or folders which you want to transfer to remote server followed by the dcp command, And no need to mention the destination machine name.

```
# dcp [File Name Which You Want To Transfer]
```

It will generate a dat archive for the given file when you ran the dcp command. Once it’s done then it will geerate a public key at the bottom of the page.

### How To Receive Files Through dcp?

Enter the generated the public key on remote server to receive the files or folders.

```
# dcp [Public Key]
```

To recursively copy directories.

```
# dcp [Folder Name Which You Want To Transfer] -r
```

In the following example, we are going to transfer a single file.
![][12]

Output for the above file transfer.
![][13]

If you want to send more than one file, use the following format.
![][14]

Output for the above file transfer.
![][15]

To recursively copy directories.
![][16]

Output for the above folder transfer.
![][17]

It won’t allow you to download the files or folders in second time. It means once you downloaded the files or folders then immediately the link will be expired.
![][18]

Navigate to man page to know about other options.

```
# dcp --help
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/dcp-dat-copy-secure-way-to-transfer-files-between-linux-systems/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/onionshare-secure-way-to-share-files-sharing-tool-linux/
[2]: https://www.2daygeek.com/wormhole-securely-share-files-from-linux-command-line/
[3]: https://www.2daygeek.com/transfer-sh-easy-fast-way-share-files-over-internet-from-command-line/
[4]: https://github.com/tom-james-watson/dat-cp
[5]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[6]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[7]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[8]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[9]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[10]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[11]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[12]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-1.png
[13]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-2.png
[14]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-3.jpg
[15]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-4.jpg
[16]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-6.jpg
[17]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-7.jpg
[18]: https://www.2daygeek.com/wp-content/uploads/2019/01/Dcp-Dat-Copy-Easy-And-Secure-Way-To-Transfer-Files-Between-Linux-Systems-5.jpg
