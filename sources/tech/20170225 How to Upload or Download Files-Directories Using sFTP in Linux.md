How to Upload or Download Files/Directories Using sFTP in Linux
============================================================

Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][10] | [4 Free Shell Scripting eBooks][11]

[sFTP (secure File Transfer Program)][1] is a secure and interactive file transfer program, which works in a similar way as FTP (File Transfer Protocol). However, sFTP is more secure than FTP; it handles all operations over an encrypted SSH transport.

It can be configured to use several useful SSH features, such as [public key authentication][2] and compression. It connects and logs into the specified remote machine, and switches to an interactive command mode where user can execute various commands.

In this article, we will show you how to upload/download a whole directory (including it’s subdirectories and subfiles) using sFTP.

### How to Use sFTP to Transfer Files/Directories in Linux

By default, SFTP adopts the same SSH transport for establishing a secure connection to a remote server. Although, passwords are used to authenticate users similar to the default SSH settings, but, it is recommended to [create and use SSH passwordless login][3] for simplified and more secure connection to remote hosts.

#### Connect to Remote FTP Server Securely

To connect to a remote sftp server, first establish an secure SSH connection and then create an SFTP session as shown.

```
$ sftp tecmint@192.168.56.10
```

Once you have logged into the remote host, you can run interactive sFTP commands as in the examples below:

```
sftp> ls			#list directory 
sftp> pwd			#print working directory on remote host
sftp> lpwd			#print working directory on local host
sftp> mkdir uploads		#create a new directory
```
[
 ![Run sFTP Commands on Remote Linux](http://www.tecmint.com/wp-content/uploads/2017/02/Run-sFTP-Commands-on-Remote-Linux.png) 
][4]

Run sFTP Commands on Remote Linux

#### How to Upload a Directory Using sFTP

In order to upload a whole directory to a remote Linux host, use the put command. However, you will get an error if the directory name doesn’t exist in the working directory on the remote host as shown in the screenshot below.

Therefore, first create a directory with the same name on the remote host, before uploading it from the local host, the `-r` does the magic, enabling subdirectories and subfile to be copied as well:

```
sftp> put -r  Tecmint.com-articles
sftp> mkdir Tecmint.com-articles
sftp> put -r Tecmint.com-articles
```
[
 ![Upload Directory using SFTP](http://www.tecmint.com/wp-content/uploads/2017/02/Upload-Directory-using-SFTP.png) 
][5]

Upload Directory using SFTP

To preserve the modification times, access times, and modes from the original files transferred, use the `-p` flag.

```
sftp> put -pr Tecmint.com-articles
```

#### How to Download a Directory Using sFTP

To download a whole directory called fstools-0.0 from remote Linux host to local machine, use the getcommand with the `-r` flag as follows:

```
sftp> get -r fstools-0.0
```
[
 ![Download Directory using sFTP](http://www.tecmint.com/wp-content/uploads/2017/02/Download-Directory-using-sFTP.png) 
][6]

Download Directory using sFTP

Then check in the current working directory on the local host, if the directory was downloaded with all the contents in it.

To quite the sFTP shell, type:

```
sftp> bye
OR
sftp> exit
```

Additionally, read through the [sFTP commands and usage tips][7].

Note that to prevent users from accessing the whole file system on the remote host, for security reasons, you can [restrict sFTP users to their home directories][8] using chroot Jail.

That’s it! In this article, we’ve showed you how to upload/download a whole directory using sFTP. Use the comment section below to offer us your thoughts about this article/topic.

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/sftp-upload-download-directory-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/sftp-command-examples/
[2]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[3]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/Run-sFTP-Commands-on-Remote-Linux.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Upload-Directory-using-SFTP.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Download-Directory-using-sFTP.png
[7]:http://www.tecmint.com/sftp-command-examples/
[8]:http://www.tecmint.com/restrict-sftp-user-home-directories-using-chroot/
[9]:http://www.tecmint.com/author/aaronkili/
[10]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[11]:http://www.tecmint.com/free-linux-shell-scripting-books/
