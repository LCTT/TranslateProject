[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to create a personal file server with SSH on Linux)
[#]: via: (https://opensource.com/article/20/3/personal-file-server-ssh)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

How to create a personal file server with SSH on Linux
======
Connecting to a remote Linux system over SSH is just plain easy. Here's
how to do it.
![Hand putting a Linux file folder into a drawer][1]

The Raspberry Pi makes for a useful and inexpensive home server for lots of things. I most often use the [Raspberry Pi as a print server][2] to share a laser printer with other devices in our home or as a personal file server to store copies of projects and other data.

I use this file server in various ways. Let's say I'm working on a project, such as a new book, and I want to make a snapshot copy of my work and all my associated files. In that case, I simply copy my **BookProject** folder to a **BookBackup** folder on the file server.

Or if I'm cleaning up my local files, and I discover some files that I don't really need but I'm not yet ready to delete, I'll copy them to a **KeepForLater** folder on the file server. That's a convenient way to remove clutter from my everyday Linux system and offload infrequently used files to my personal file server.

Setting up a Raspberry Pi—or any Linux system—as a personal file server doesn't require configuring Network File System (NFS) or Common Internet File System (CIFS) or tinkering with other file-sharing systems such as WebDAV. You can easily set up a remote file server using SSH. And here's how.

### Set up SSHD on the remote system

Your Linux system probably has the SSH daemon (sshd) installed. It may even be running by default. If not, you can easily set up SSH through whatever control panel you prefer on your Linux distribution. I run [Fedora ARM][3] on my Raspberry Pi, and I can access the control panel remotely by pointing my Pi's web browser to port 9090. (On my home network, the Raspberry Pi's IP address is **10.0.0.11**, so I connect to **10.0.0.11:9090**.) If the SSH daemon isn't running by default, you can set it to start automatically in Services in the control panel.

![sshd in the list of system services][4]

You can find sshd in the list of system services.

![slider to activate sshd][5]

Click the slider to activate **sshd** if it isn't already.

### Do you have an account?

Make sure you have an account on the remote system. It might be the same as the username you use on your local system, or it could be something different.

On the popular Raspbian distribution, the default account username is **pi**. But other Linux distributions may require you to set up a unique new user when you install it. If you don't know your username, you can use your distribution's control panel to create one. On my Raspberry Pi, I set up a **jhall** account that matches the username on my everyday Linux desktop machine.

![Set up a new account on Fedora Server][6]

If you use Fedora Server, click the **Create New Account** button to set up a new account.

![Set password or SSH key][7]

Don't forget to set a password or add a public SSH key.

### Optional: Share your SSH public key

If you exchange your public SSH key with the remote Linux system, you can log in without having to enter a password. This step is optional; you can use a password if you prefer.

You can learn more about SSH keys in these Opensource.com articles:

  * [Tools for SSH key management][8]
  * [Graphically manage SSH keys with Seahorse][9]
  * [How to manage multiple SSH keys][10]
  * [How to enable SSH access using a GPG key for authentication][11]



### Make a file manager shortcut

Since you've started the SSH daemon on the remote system and set up your account username and password, all that's left is to map a shortcut to the other Linux system from your file manager. I use GNOME as my desktop, but the steps are basically the same for any Linux desktop.

#### Make the initial connection

In the GNOME file manager, look for the **+Other Locations** button in the left-hand navigation. Click that to open a **Connect to Server** prompt. Enter the address of the remote Linux server here, starting with the SSH connection protocol.

![Creating a shortcut in GNOME file manager][12]

The GNOME file manager supports a variety of connection protocols. To make a connection over SSH, start your server address with **sftp://** or **ssh://**.

If your username is the same on your local Linux system and your remote Linux system, you can just enter the server's address and the folder location. To make my connection to the **/home/jhall** directory on my Raspberry Pi, I use:


```
`sftp://10.0.0.11/home/jhall`
```

![GNOME file manager Connect to Server][13]

If your username is different, you can specify your remote system's username with an **@** sign before the remote system's address. To connect to a Raspbian system on the other end, you might use:


```
`sftp://pi@10.0.0.11/home/pi`
```

![GNOME file manager Connect to Server][14]

If you didn't share your public SSH key, you may need to enter a password. Otherwise, the GNOME file manager should automatically open the folder on the remote system and let you navigate.

![GNOME file manager connection][15]

#### Create a shortcut so you can easily connect to the server later

This is easy in the GNOME file manager. Right-click on the remote system's name in the navigation list, and select **Add Bookmark**. This creates a shortcut to the remote location.

![GNOME file manager - adding bookmark][16]

If you want to give the bookmark a more memorable name, you can right-click on the shortcut and choose **Rename**.

### That's it!

Connecting to a remote Linux system over SSH is just plain easy. And you can use the same method to connect to systems other than home file servers. I also have a shortcut that allows me to instantly access files on my provider's web server and another that lets me open a folder on my project server. SSH makes it a secure connection; all of my traffic is encrypted. Once I've opened the remote system over SSH, I can use the GNOME file manager to manage my remote files as easily as I'd manage my local folders.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/personal-file-server-ssh

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/article/18/3/print-server-raspberry-pi
[3]: https://arm.fedoraproject.org/
[4]: https://opensource.com/sites/default/files/uploads/fedora-server-control-panel-sshd.png (sshd in the list of system services)
[5]: https://opensource.com/sites/default/files/uploads/fedora-server-control-panel-sshd-service.png (slider to activate sshd)
[6]: https://opensource.com/sites/default/files/uploads/fedora-server-control-panel-accounts_create-user.png (Set up a new account on Fedora Server)
[7]: https://opensource.com/sites/default/files/uploads/fedora-server-control-panel-accounts.png (Set password or SSH key)
[8]: https://opensource.com/article/20/2/ssh-tools
[9]: https://opensource.com/article/19/4/ssh-keys-seahorse
[10]: https://opensource.com/article/19/4/gpg-subkeys-ssh-manage
[11]: https://opensource.com/article/19/4/gpg-subkeys-ssh
[12]: https://opensource.com/sites/default/files/uploads/gnome-file-manager-other-locations.png (Creating a shortcut in GNOME file manager)
[13]: https://opensource.com/sites/default/files/uploads/gnome-file-manager-other-sftp.png (GNOME file manager Connect to Server)
[14]: https://opensource.com/sites/default/files/uploads/gnome-file-manager-other-sftp-username.png (GNOME file manager Connect to Server)
[15]: https://opensource.com/sites/default/files/uploads/gnome-file-manager-remote-jhall.png (GNOME file manager connection)
[16]: https://opensource.com/sites/default/files/uploads/gnome-file-manager-remote-jhall-add-bookmark.png (GNOME file manager - adding bookmark)
