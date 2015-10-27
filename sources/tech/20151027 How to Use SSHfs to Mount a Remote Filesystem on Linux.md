ictlyh Translating
How to Use SSHfs to Mount a Remote Filesystem on Linux
================================================================================
Have you ever wanted to mount remote file systems locally over secure shell? If so, SSHfs may be just what you’re looking for. It makes use of SSH and Fuse to allow you to mount remote computers (or servers) locally.

**Note**: this article assumes that you understand [how SSH works and that it is already set up on your system][1].

### Preparation ###

Before SSHfs can be mounted, things must be set up – installing SSHfs, as well as installing the fuse package to your system. You’ll also need to create a group for fuse, add your user to said group and create the folder where the remote file system will reside.

To install the packages on your Ubuntu Linux installation, just enter this command into a terminal window:

    sudo apt-get install sshfs fuse

![sshfs-install-fuse-ubuntu](https://www.maketecheasier.com/assets/uploads/2015/10/sshfs-install-fuse-ubuntu.jpg)

If you’re not using Ubuntu, just search for the package names in your distribution’s package manager. It would be best to just search for terms relating to fuse or SSHfs, since the package could be named slightly different depending on what you’re running.

After installing the packages to your system, it’s time to create the fuse group. When you install fuse, a group should be created on your system. If this isn’t the case, enter this command into a terminal window to create it on your Linux installation:

    sudo groupadd fuse

After the group has been added, add your user to it.

    sudo gpasswd -a "$USER" fuse

![sshfs-add-user-to-fuse-group](https://www.maketecheasier.com/assets/uploads/2015/10/sshfs-add-user-to-fuse-group.png)

Don’t worry about `$USER` in the command above. The shell will replace it with your own username automatically. Now that the group stuff is taken care of, it’s time to create the folder where the the remote files will mount to.

    mkdir ~/remote_folder

With the local folder created on your computer, your remote file system is now set up to be mounted over SSHfs.

### Mounting the remote file system ###

To mount your remote file system to your machine, you’ll need to enter a lengthy command into your terminal window.

    sshfs -o idmap=user username@ip.address:/remote/file/system/ ~/remote

![sshfs-mount-file-system-to-local-folder](https://www.maketecheasier.com/assets/uploads/2015/10/sshfs-mount-file-system-to-local-folder.png)

**Note**: It is also possible to mount your SSHfs file system with an SSH keyfile. Just replace the `sshfs -o idmap=user` part of the command above with `sshfs -o IdentityFile=~/.ssh/keyfile`, and you’ll be good to go.

When this command has been entered, you’ll be prompted to enter the remote user’s password. If the login is successful, your remote file system will be mounted in the `~/remote_folder` directory that was created earlier.

![sshfs-mount-file-system-to-local-folder-2](https://www.maketecheasier.com/assets/uploads/2015/10/sshfs-mount-file-system-to-local-folder-2.jpg)

Done with your remote file system and want to un-mount it? It’s easy? Just enter this command into the terminal:

    sudo umount ~/remote_folder

This simple command will disconnect your remote connection as well as empty out your remote folder.

### Conclusion ###

There are many tools for accessing remote files to mount locally on Linux. With that being said, few, if any, take advantage of the powerful feature-set that SSH has. I hope that with the help of this tutorial, you, too, will learn just how powerful of a tool SSHfs can be.

What are your thoughts on SSHfs? Let us know in the comment section below!

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/sshfs-mount-remote-filesystem-linux/

作者：[Derrik Diener][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/setup-ssh-ubuntu/