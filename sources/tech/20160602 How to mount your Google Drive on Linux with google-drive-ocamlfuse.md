How to mount your Google Drive on Linux with google-drive-ocamlfuse
========================================================================

>If you're looking for an easy way to mount your Google Drive folders to a Linux box, Jack Wallen shows you how with the help of google-drive-ocamlfuse.

![](http://tr4.cbsistatic.com/hub/i/2016/05/18/ee5d7b81-e5be-4b24-843d-d3ca99230a63/651be96ac8714698f8100afa6883e64d/linuxcloudhero.jpg)
>Image: Jack Wallen

Google has yet to release a Linux version of its Google Drive app, though there are plenty of ways to gain access to your Drive files from Linux.

If you prefer a GUI tool, you've got Insync. If you prefer the command line, there are tools such as Grive2 and the incredibly easy to use FUSE-based system written in Ocaml. I'll show how to use the latter to mount your Google Drive account on your Linux desktop. Although it's done via the command line, you'll be surprised at how easy it is to pull off. It's so easy, anyone can do it.

This system features:

- Full read/write access to ordinary files/folders
- Read-only access to Google Docs, sheets, and slides
- Access to your Drive's Trash (.trash) Directory
- Duplicate file handling
- Support for multiple accounts

Let's walk through the installation and setup of google-drive-ocamlfuse on a Ubuntu 16.04 desktop so you can gain access to your Drive files.

### Installation

1. Open a terminal window.
2. Add the necessary PPA with the command sudo add-apt-repository ppa:alessandro-strada/ppa.
3. When prompted, type your sudo password and hit Enter.
4. Update app with the command sudo apt-get update.
5. Install the software by issuing the command sudo apt-get install google-drive-ocamlfuse.

### Authorization

The next step is to authorize google-drive-ocamlfuse so it will have access to your Google account. To do this, go back to the terminal window and issue the command google-drive-ocamlfuse. This command will open a browser window that will either prompt you to log into your Google account or, if you're already logged in, ask you to allow google-drive-ocamlfuse access to your Google account. If you've not logged in, do so and then click Allow. The next window (which appeared on a Ubuntu 16.04 desktop, but not an Elementary OS Freya desktop) will ask you to grant permission for both gdfuse and OAuth2 Endpoint to access your Google account. Click Allow again. The next browser screen will inform you to wait until the authorization tokens have downloaded; you can minimize the browser at this point. When your terminal prompt returns (Figure A), you know the tokens have been downloaded, and you're ready to mount.

**Figure A**

![](http://tr4.cbsistatic.com/hub/i/r/2016/05/18/a493122b-445f-4aca-8974-5ec41192eede/resize/620x/6ae5907ad2c08dc7620b7afaaa9e389c/googledriveocamlfuse3.png)
>Image: Jack Wallen

**The app has been authorized, and you're ready to go.**

### Mounting your Google Drive

Before you mount your Google Drive, you must create a folder to serve as the mount point. From the terminal, issue the command mkdir ~/google-drive to create a new folder in your home directory. Finally, issue the command google-drive-ocamlfuse ~/google-drive to mount your Google Drive to the google-drive folder.

At this point, you should see your Google Drive files/folders populate in the google-drive folder. You can work with Google Drive as if it were a local folder system.

When you want to unmount the google-drive folder, issue the command fusermount -u ~/google-drive.

### It's no GUI, but it works like a champ

I find this particular system really handy to use. It's incredibly fast at syncing with Google Drive, and it can make for an elegant means of backing up your Google Drive account locally.

Give google-drive-ocamlfuse a go, and see what kind of magic you can make with it.

--------------------------------------------------------------------------------

via: http://www.techrepublic.com/article/how-to-mount-your-google-drive-on-linux-with-google-drive-ocamlfuse/

作者：[Jack Wallen ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.techrepublic.com/search/?a=jack+wallen
