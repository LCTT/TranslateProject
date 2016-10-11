GHLandy Translating

HOW TO USE FTP TO MOVE FILES BETWEEN YOUR COMPUTER AND YOUR ANDROID DEVICE
====

[![How to transfer files between Linux and Android using FTP](https://itsfoss.com/wp-content/uploads/2016/09/linux-ftp-android.jpg)](https://itsfoss.com/wp-content/uploads/2016/09/linux-ftp-android.jpg)

Everyone who has an Android device knows that you can [transfer files by plugging it into your computer with a USB cable](https://itsfoss.com/how-to-connect-kindle-fire-hd-with-ubuntu-12-10/). Not everyone knows that you can use FOSS software to connect to your Android devices wirelessly.

I know that it’s not the easiest method out there, but this is a fun and geeky way to do it. So if you are in some DIY mood, let me show you how to transfer files between Linux and Android using FTP.

### STEP 1: GET THE NECESSARY SOFTWARE

In order to connect to your Android device, you need two things: an FTP server and an FTP client. There are quite a few of both to choose from. I would recommend [Filezilla](https://filezilla-project.org/) as an FTP client because it is open-source and available on multiple platforms.

My favorite FOSS app store for Android is [F-Droid](https://f-droid.org/). F-Droid has two great FTP server apps: [primitive ftpd](https://f-droid.org/repository/browse/?fdfilter=ftp&fdid=org.primftpd) and [FTP Server (Free)](https://f-droid.org/repository/browse/?fdfilter=ftp&fdid=be.ppareit.swiftp_free). Both require Android 4.0 or newer. I will focus on primitive ftpd in this article, but similar steps can be used for FTP Sever (Free).

### STEP 2: GETTING FAMILIAR WITH THE FTP SERVER

Once you have both the FTP client and server installed, It’s time to set up the connection between the two. Let’s start with the FTP server on the Android device. First, open primitive ftpd from your app drawer.

[![android-1](https://itsfoss.com/wp-content/uploads/2016/09/android-1-169x300.png)](https://itsfoss.com/wp-content/uploads/2016/09/android-1.png)

Once the app opens, you’ll be confronted by a bunch of numbers. Don’t freak out. You’ll see that server has assigned an IP address (in this test case 192.168.1.131). If you look down further, you will see that both FTP and SFTP are currently not running (SFTP is a slightly different protocol that uses SSH to connect.). Below you can see the username, which is currently set to user.

At the top of the screen, there two buttons. One will start the FTP server and the other will take you to settings. Starting the server is self-explanatory.


[![android-2](https://itsfoss.com/wp-content/uploads/2016/09/android-2-169x300.png)](https://itsfoss.com/wp-content/uploads/2016/09/android-2.png)

In the setting menu, you can change the server’s username, password and which port the server uses. You can also prevent standby while the server is active, set the server to start on boot or change the theme.

![android-2-2](https://itsfoss.com/wp-content/uploads/2016/09/android-2.2-169x300.png)![android-3](https://itsfoss.com/wp-content/uploads/2016/09/android-3-169x300.png)![android-5](https://itsfoss.com/wp-content/uploads/2016/09/android-5-169x300.png)

### STEP 3: USING FILEZILLA

Now open FileZilla on your system of choice. You have two options on how you use Filezilla. You can either manually type in the IP address, username, password, and port every time you want to move a file or you can store that information on Filezilla. (Note: Every time you start the FTP server the IP address will be different, so you will have to update the number saved on Filezilla.) I will show you both ways.

If you want to do it manually, merely fill in the required spaced at the top of the FileZilla window and hit “quick connect”.

![filezilla-1-2](https://itsfoss.com/wp-content/uploads/2016/09/filezilla-1.2.png)

To save the information, click on the icon below the file menu. This will open the Site Manager dialog box. Fill out the information you want to save. I usually set “login type” to “ask for password” top be a little bit more secure. If you are going to use FTP, you can leave the default, but if you want to use SFTP you have to select it from the Protocol dropdown box.

![filezilla-2](https://itsfoss.com/wp-content/uploads/2016/09/filezilla-2.png)

Click connect, enter your password and you are in. You will see a warning that you are connecting to a new host. You can verify the fingerprint on the screen against what primitive ftpd says. If it’s correct (and it should be) select the box to add it to the cache, so you don’t see this message in the future.

![filezilla-5](https://itsfoss.com/wp-content/uploads/2016/09/filezilla-5.png)

### STEP 4: MOVING FILES

Now you’ll see an address box that says “local site” and another that says “remote site”. Those represent your computer and your Android device respectively. From here you can browse through your PC and move files to your Android device. I would recommend uploading files into your Downloads folder so you can keep track of them easier. You can either right-click on a file and select upload or download from the popup menu to move it or you can just double click on it.

![filezilla-6](https://itsfoss.com/wp-content/uploads/2016/09/filezilla-6.png)

### STEP 5: CLOSING UP SHOP

When you are done moving files, all you have to do is stop the FTP server on your Android device and close down Filezilla. As easy as that.

### CLOSING THOUGHTS

I’m sure that several people will point out that FTP isn’t really very secure. I think that this use case is different because the connection will be very short and in most cases, people will do it in the privacy of their own homes.

This is my favorite method of moving files between Linux and Android.

Did you find it helpful? Do you have any suggesting for similar programs? Let us know below in the comments.

[](https://itsfoss.com/how-to-open-run-install-or-execute-a-jar-file-in-ubuntu-linux/)[](https://itsfoss.com/solve-overheating-issue-in-ubuntu-12-10/)

If you found this article interesting, please take a minute to share it on your favorite social media sites.

--------------------------------------------------------------------------------

via: https://itsfoss.com/use-ftp-linux-android/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29

作者：[John Paul ][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
