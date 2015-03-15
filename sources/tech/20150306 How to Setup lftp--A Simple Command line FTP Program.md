zpl1025
How to Setup lftp - A Simple Command line FTP Program
================================================================================
Hi everyone, this article is about Lftp and how we can install Lftp in our Linux Operating System. [Lftp][1] is a command line based File Transfer Software also known as FTP Client which was developed by Alexander Lukyanov and was distributed as GNU General Public License. Besides FTP, it also supports FTPS, HTTP, HTTPS, HFTP, FISH, and SFTP. The program also supports FXP, allowing for data transfers between two FTP servers bypassing the client machine.

It has some awesome advanced features such as recursively mirroring entire directory trees and resuming downloads. Transfers can be scheduled for execution at a later time, bandwidth can be throttled, transfer queues can be created, and Unix shell-like job control is supported. The client can also be used interactively or automated with scripts.

### Installing Lftp ###

Before we try to run lftp, we have make sure that it is properly installed in our Linux Distribution. Here are some commands mentioned for installing lftp in the list common distribution of Linux.

**On Ubuntu 14.04 LTS**

In Ubuntu 14.04 LTS and its derivatives, we can install lftp using apt manager. So, to install it, we'll need to run the following commands in a shell or a terminal under sudo privilege.

    $ sudo apt-get install lftp

![ubuntu install lftp](http://blog.linoxide.com/wp-content/uploads/2015/03/ubuntu-install-lftp.png)

**On CentOS/Fedora/RHEL**

As lftp is also available in the repository of Fedora, CentOS and RHEL, we can use **yum** manager to install it.

    $ sudo yum install lftp

![fedora lftp](http://blog.linoxide.com/wp-content/uploads/2015/03/fedora-lftp.png)

**On Arch Linux**

It is also available in Arch Linux Package Repository so, we can simply use pacman to install it.

    $ sudo pacman -S lftp

![archlinux install lftp](http://blog.linoxide.com/wp-content/uploads/2015/03/archlinux-install-lftp.png)

**On OpenSuse**

Zypper, package management software for OpenSuse can be used to install lftp. Here is the command with which one can install it on their OpenSuse machine.

    $ sudo zypper install lftp

![opensuse lftp install](http://blog.linoxide.com/wp-content/uploads/2015/03/lftp_install.png)

### Logging in ###

To login to a ftp server or sftp server, we'll first need to know about the required credential for the login like username, password, ports.

After that, we'll want to login using lftp client as basic usage.

    $ lftp ftp://linoxide@localhost

![ftp login](http://blog.linoxide.com/wp-content/uploads/2015/03/lftp-login.png)

If we need to point a port to the login then, we'll need to add port as shown below.

    $ lftp ftp://linoxide@localhost:21

![ftp login with ports](http://blog.linoxide.com/wp-content/uploads/2015/03/lftp-login-port.png)

### Navigation ###

We can use **ls** to list files and directories, **cd** to enter into a directory.

![ls and cd](http://blog.linoxide.com/wp-content/uploads/2015/03/ls-cd-lftp.png)

### Uploading and Download Files ###

We can use **pget** for downloading files from the remote server.

    > pget linspeed.svg

![pget lftp](http://blog.linoxide.com/wp-content/uploads/2015/03/pget-lftp.png)

We can use **put** for uploading files to the remote server.

    > put linoxide.tar

![upload with put](http://blog.linoxide.com/wp-content/uploads/2015/03/put-upload.png)

To resume partially downloaded files/directories, we will use the -c switch:

    > mirror -c Directory

    >pget -c linoxide.tar

    > put -c upload.tar

### Using Mirror ###

We can use mirror to download the whole directory pointed as the source.

    > mirror remote local

![download with mirror](http://blog.linoxide.com/wp-content/uploads/2015/03/mirror.png)

There is also reverse mirror (mirror -R) which uploads or updates a directory tree on server.

    > mirror -R local remote

![upload or update with mirror reverse](http://blog.linoxide.com/wp-content/uploads/2015/03/mirror-reverse.png)

To resume partially downloaded files/directories, we will use the -c switch:

    > mirror -c Directory

### To Queue Items to Download ###

We can use queue option with lftp so that we can download selected files in a queue one by one as there is an option in GUI based clients to select and download in a queue. Here's an example on it.

To prevent queue from auto transferring while you add to it :

    > queue stop

Now, we'll add them into queue.

    > queue mirror "directory"

    > queue pget "file.tar"

After the queue has been added, we should run queue start  command.

    > queue start

To remove the entire queue run the following command.

    > queue -d

### Segmented Downloading ###

Here, in this example we are segmenting files into 3 segments, one can change it according to their own need.

A pget command using segmentation is **pget -n 3 file.tar**, where 3 is the number of segments.

    > pget -n 3 file.tar

A mirror command using segmentation is **mirror --use-pget-n=3 directory**, where 3 is the number of segments.

    > mirror --use-pget-n=3 linxoxide

We can use jobs -v to see the speeds of the individual segments as well as the total speed.

### To Stop, Resume or Kill a Transfer ###

To cancel a transfer we can press Ctrl+c . And to resume a download we can use the -c (--continue) switch as shown below.

    > mirror -c directory

And to kill an active transfer we should run **kill** and to kill and delete all we'll need to run **kill all** as shown below.

    > kill

    > kill all

### Exiting ###

To quit from lftp, we should run exit command in the terminal or inside lftp interface.

    > exit

### Conclusion ###

Hurray! We have successfully installed lftp and learned some basic major ways to use it. lftp is an awesome command line ftp client which supports a lot of additional functionality and cool features. It has a lot stuffs more than the other common ftp client. So, if you have any questions, suggestions, feedback please write them in the comment box below. Thank you ! Enjoy lftp :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-lftp-command-line-ftp/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://lftp.yar.ru/
