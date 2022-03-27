[#]: subject: "Using FileZilla for Connecting to SFTP Server Via GUI"
[#]: via: "https://itsfoss.com/filezilla-ubuntu/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using FileZilla for Connecting to SFTP Server Via GUI
======

If you ask the geeky sysadmins, they will swear by [rsync or scp commands for transferring files between remote server and local system][1].

However, those are command line methods and not everyone feels comfortable.

Thankfully, there are some GUI tools available that let you transfer files to or from the remote servers.

[FileZilla][2] is a popular, cross-platform, open-source tool for this purpose. It supports transferring file using FTP over TLS or SSL (FTPS) and also FTP over SSH (SFTP) along with old FTP protocol.

Let me show how to install FileZilla on Linux and then use it for file transfer.

So, let’s get started!

### Installing FileZilla on Ubuntu and other Linux distributions

You can get the source code tarball but it is always recommended to use your distribution provided package. Since it is a popular software, it should be available in the software repository of most Linux distributions (if not all). _**Please use your distribution’s software center and package manager**_.

On Ubuntu, you can install it from the software center:

![FileZilla is available in the Ubuntu Software Center][3]

You can also use the command line method to install it.

```

    sudo apt install filezilla

```

If you see the [package not found error][4], you should [enable the Universe repository][5].

Once installed, go to the menu (by pressing the windows key), type FileZilla and start it.

![Start FileZilla from the system menu][6]

### Using FileZilla

When you first run FileZilla, you’ll see an interface like the picture below.

![Screenshot of FileZilla running][7]

The left side pane shows the files and directory from your local system. The right side pane is empty for now. When you connect to a remote server, the files from your remote system will be displayed there.

Before I show you that, let me share a few details on understanding the important aspects of FileZilla interface.

#### Understaing the FileZilla interface

The image below give you an overview of the different sections of the window layout of FileZilla.

![FileZilla Window Layout | image credit][8]

The GUI is split in 6 different zones/window layout. Let me briefly explain them to you.

**1\. Toolbar:** It has a variety of options like opening the Site Manager, refreshing local and/or remote directory file and folder lists, start processing current queue of files to be transferred, stop all transfers and discard files from queue, etc.

**2\. The Quick connect bar:** As its name suggests, allows you to quickly connect to a remote site without specifying many details about it except the host, username, password and port.

**3\. The Message log:** It shows you a log, regardless if the connection was successful or not. The errors are in red, normal messages are in white, and commands are in blue.

**4 &amp; 5\. The Local pane and remote panes**: Both are very similar except for the fact that the Local pane shows contents of a local directory and a context menu has options for uploading files. Whereas, the remote pane shows contents of a remote directory and has options for downloading files from a remote directory to your local storage.

**6\. Transfer queue**: Lastly, the Transfer queue pane shows the status of items being transferred, their transfer speeds, items in queue and the file transfer history (limited to current instance

#### Connecting to a SFTP server using FileZilla

_**You need to know the username, password and the IP address of the remote server. The remote server should also be configured to accept connections with the provided details. You also need to have correct access settings in the destination folder.**_

To add a new SFTP connection, you need to open the site manager. There are two ways to open it.

There is a “Site Manager” item under the “Files” menu option on the menu bar. Or, you can click on the “Site manager” icon on the toolbar.

![the Site Manager button on the toolbar][9]

Once the Site Manager dialog pops up, click on the “New site” button and [optionally] rename the new site that is added to the entry. I have called mine “test8”.

![screenshot of the Site Manager][10]

To the right, under the General tab, ensure that the protocol used is appropriate to what the server administer has set for you. In my case, I set up a SFTP server (FTP over SSH) so I will proceed by choosing the option “SFTP – SSH File Transfer Protocol”.

The next field is for the IP address of the remote server.

If you do not mention the port number, FileZilla will assume that the port number to be used is the default SSH port 22.

There are a few options for the “Logon Type” drop-down. In the Normal logon method, you provide the username and password.

The Key file authentication method is useful for you if you have a pair of public and private keys set up to authenticate your SSH connection for the user.

Once you have filled all the appropriate details for the remote server and authentication, click on the “Connect” button positioned at the bottom to connect to the site. Do not worry, the new site you just established a connection to, will be saved in compliance to the “Logon Type”.

![Remote pane being populated after a successful connection][11]

If you see a status message as “Connected to &lt;host IP address&gt;” and the most recent status message as “Directory listing of “/” was successful”, you have successfully connected to the remote SFTP server (FTP using the SSH protocol).

Another indicator of a successful SFTP connection is that the remote directory pane gets populated when a connection is successfully established.

#### Sending files to remote system

You must **make sure to be in the directories where you have to transfer the file**. Transferring files is as simple as **double-clicking on the file** without explicitly specifying the target location.

If you click on a file from the left pane, it immediately gets transferred (or added to the queue if there are pending transfers) to the directory visible in the right pane.

The same goes from transferring files from right to left, i.e., from remote server to local. **This is why it is important to be in the correct locations in both local and remote systems**.

Alternatively, you can right-click on the file(s) and upload them (or add them to the upload queue). The destination is always the directory displayed in FileZilla interface.

![Transfer queue pane showing the local file name, remote destination, transfer speed and an ETA][12]

There isn’t much difference in either way of uploading files except for convenience and timing.

#### Downloading files from remote system

Just like uploading files, you get two options when transferring file from a remote server to local storage, but instead of “Upload” it is “Download”.

Downloading a file will download that file in the local directory that you currently have open in the Local directory pane.

You will notice a consistent behavior in downloading and uploading files, except for the sender and receiver. The file transfers will be in done in parallel unless the number of connections is restricted.

### Conclusion

Awesome! With the basics covered, you should be able to transfer files to and from your computer to your server. I hope you learnt something new :)

If you have any queries, please ask them in the [It’s FOSS community forums][13]. If you felt this was helpful to you, do let me know with a comment down below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/filezilla-ubuntu/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/transfer-files-ssh/
[2]: https://filezilla-project.org/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/filezilla-ubuntu-software-center.png?resize=751%2C382&ssl=1
[4]: https://itsfoss.com/unable-to-locate-package-error-ubuntu/
[5]: https://itsfoss.com/ubuntu-repositories/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/filezilla-ubuntu.png?resize=763%2C224&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/01_filezilla.webp?resize=800%2C431&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/02_filezilla_layout.webp?resize=800%2C504&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/03_site_manager_annotated.webp?resize=386%2C170&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/04_site_manager.webp?resize=800%2C577&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/05_successful_connection.webp?resize=800%2C431&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/07_transfer_pane_populated-1.webp?resize=800%2C431&ssl=1
[13]: https://itsfoss.community/
