Personal Backups with Duplicati on Linux
======

This tutorial is for performing personal backups to local USB hard drives, having encryption, deduplication and compression.

The procedure was tested using [Duplicati 2.0.2.1][1] on [Debian 9.2][2]

### Duplicati Installation

Download the latest version from <https://www.duplicati.com/download>

The software requires several libraries to work, mostly mono libraries. The easiest way to install the software is to let it fail the installation through dpkg and then install the missing packages with apt-get:

sudo dpkg -i duplicati_2.0.2.1-1_all.deb
sudo apt-get --fix-broken install

Note that the installation of the package fails on the first instance, then we use apt to install the dependencies.

Start the daemon:

sudo systemctl start duplicati.service

And if you wish for it to start automatically with the OS use:

sudo systemctl enable duplicati.service

To check that the service is running:

netstat -ltn | grep 8200

And you should receive a response like this one:

[![][3]][4]

After these steps you should be able to run the browser and access the local web service at http://localhost:8200

[![][5]][6]

### Create a Backup Job

Go to "Add backup" to configure a new backup job:

[![][7]][8]

Set a name for the job and a passphrase for encryption. You will need the passphrase to restore files, so pick a strong password and make sure you don't forget it:

[![][9]][10]

Set the destination: the directory where you are going to store the backup files:

[![][11]][12]

Select the source files to backup. I will pick just the Desktop folder for this example:

[![][13]][14]

Specify filters and exclusions if necessary:

[![][15]][16]

Configure a schedule, or disable automatic backups if you prefer to run them manually:

[![][17]][18]

I like to use manual backups when using USB drive destinations, and scheduled if I have a server to send backups through SSH or a Cloud based destination.

Specify the versions to keep, and the Upload volume size (size of each partial file):

[![][19]][20]

Finally you should see the job created in a summary like this:

[![][21]][22]

### Run the Backup

In the last seen summary, under Home, click "run now" to start the backup job. A progress bar will be seen by the top of the screen.

After finishing the backup, you can see in the destination folder, a set of files called something like:
```
duplicati-20171206T143926Z.dlist.zip.aes
duplicati-bdfad38a0b1f34b5db56c1de166260cd8.dblock.zip.aes
duplicati-i00d8dff418a749aa9d67d0c54b0e4149.dindex.zip.aes
```

The size of the blocks will be the one specified in the Upload volume size option. The files are compressed, and encrypted using the previously set passphrase.

Once finished, you will see in the summary the last backup taken and the size:

[![][23]][24]

In this case it is only 1MB because I took a test folder.

### Restore Files

To restore files, simply access the web administration in http://localhost:8200, go to the "Restore" menu and select the backup job name. Then select the files to restore and click "continue":

[![][25]][26]

Select the restore files or folders and the restoration options:

[![][27]][28]

The restoration will start running, showing a progress bar on the top of the user interface.

### Fixate the backup destination

If you use a USB drive to perform the backups, it is a good idea to specify in the /etc/fstab the UUID of the drive, so that it always mount automatically in the /mnt/backup directory (or the directory of your choosing).

To do so, connect your drive and check for the UUID:

sudo blkid
```
...
/dev/sdb1: UUID="4d608d85-e138-4546-9f22-4d78bef0b6a7" TYPE="ext4" PARTUUID="983a72cb-01"
...
```

And copy the UUID to include an entry in the /etc/fstab file:
```
...
UUID=4d608d85-e138-4546-9f22-4d78bef0b6a7 /mnt/backup ext4 defaults 0 0
...
```

### Remote Access to the GUI

By default, Duplicati listens on localhost only, and it's meant to be that way. However it includes the possibility to add a password and to be accessible from the network:

[![][29]][30]

This setting is not recommended, as Duplicati has no SSL capabilities yet. What I would recommend if you need to use the backup GUI remotely, is using an SSH tunnel.

To accomplish this, first enable SSH server in case you don't have it yet, the easiest way is running:

sudo tasksel

[![][31]][32]

Once you have the SSH server running on the Duplicati host. Go to the computer from where you want to connect to the GUI and set the tunnel

Let's consider that:

  * Duplicati backups and its GUI are running in the remote host 192.168.0.150 (that we call the server).
  * The GUI on the server is listening on port 8200.
  * jorge is a valid user name in the server.
  * I will access the GUI from a host on the local port 12345.



Then to open an SSH tunnel I run on the client:

ssh -f jorge@192.168.0.150  -L 12345:localhost:8200 -N

With netstat it can be checked that the port is open for localhost:

netstat -ltn | grep :12345
```
tcp 0 0 127.0.0.1:12345 0.0.0.0:* LISTEN
tcp6 0 0 ::1:12345 :::* LISTEN
```

And now I can access the remote GUI by accessing http://127.0.0.1:12345 from the client browser

[![][34]][35]

Finally if you want to close the connection to the SSH tunnel you may kill the ssh process. First identify the PID:

ps x | grep "[s]sh -f"
```
26348 ? Ss 0:00 ssh -f [[email protected]][33] -L 12345:localhost:8200 -N
```

And kill it:

kill -9 26348

Or you can do it all in one:

kill -9 $(ps x | grep "[s]sh -f" | cut -d" " -f1)

### Other Backup Repository Options

If you prefer to store your backups on a remote server rather than on a local hard drive, Duplicati has several options. Standard protocols such as:

  * FTP
  * OpenStack Object Storage / Swift
  * SFTP (SSH)
  * WebDAV



And a wider list of proprietary protocols, such as:

  * Amazon Cloud Drive
  * Amazon S3
  * Azure
  * B2 Cloud Storage
  * Box.com
  * Dropbox
  * Google Cloud Storage
  * Google Drive
  * HubiC
  * Jottacloud
  * mega.nz
  * Microsoft One Drive
  * Microsoft One Drive for Business
  * Microsoft Sharepoint
  * OpenStack Simple Storage
  * Rackspace CloudFiles



For FTP, SFTP, WebDAV is as simple as setting the server hostname or IP address, adding credentials and then using the whole previous process. As a result, I don't believe it is of any value describing them.

However, as I find it useful for personal matters having a cloud based backup, I will describe the configuration for Dropbox, which uses the same procedure as for Google Drive and Microsoft OneDrive.

#### Dropbox

Let's create a new backup job and set the destination to Dropbox. All the configurations are exactly the same except for the destination that should be set like this:

[![][36]][37]

Once you set up "Dropbox" from the drop-down menu, and configured the destination folder, click on the OAuth link to set the authentication.

A pop-up will emerge for you to login to Dropbox (or Google Drive or OneDrive depending on your choosing):

[![][38]][39]

After logging in you will be prompted to allow Duplicati app to your cloud storage:

[![][40]][41]

After finishing the last process, the AuthID field will be automatically filled in:

[![][42]][43]

Click on "Test Connection". When testing the connection you will be asked to create the folder in the case it does not exist:

[![][44]][45]

And finally it will give you a notification that the connection is successful:

[![][46]][47]

If you access your Dropbox account you will see the files, in the same format that we have seen before, under the defined folder:

[![][48]][49]

### Conclusions

Duplicati is a multi-platform, feature-rich, easy to use backup solution for personal computers. It supports a wide variety of backup repositories what makes it a very versatile tool that can adapt to most personal needs.


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/personal-backups-with-duplicati-on-linux/

作者：[][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://updates.duplicati.com/beta/duplicati_2.0.2.1-1_all.deb
[2]:https://www.debian.org/releases/stable/
[3]:https://www.howtoforge.com/images/personal_backups_with_duplicati/installation-netstat.png
[4]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/installation-netstat.png
[5]:https://www.howtoforge.com/images/personal_backups_with_duplicati/installation-web.png
[6]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/installation-web.png
[7]:https://www.howtoforge.com/images/personal_backups_with_duplicati/create-1.png
[8]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/create-1.png
[9]:https://www.howtoforge.com/images/personal_backups_with_duplicati/create-2.png
[10]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/create-2.png
[11]:https://www.howtoforge.com/images/personal_backups_with_duplicati/create-3.png
[12]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/create-3.png
[13]:https://www.howtoforge.com/images/personal_backups_with_duplicati/create-4.png
[14]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/create-4.png
[15]:https://www.howtoforge.com/images/personal_backups_with_duplicati/create-5.png
[16]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/create-5.png
[17]:https://www.howtoforge.com/images/personal_backups_with_duplicati/create-6.png
[18]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/create-6.png
[19]:https://www.howtoforge.com/images/personal_backups_with_duplicati/create-7.png
[20]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/create-7.png
[21]:https://www.howtoforge.com/images/personal_backups_with_duplicati/create-8.png
[22]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/create-8.png
[23]:https://www.howtoforge.com/images/personal_backups_with_duplicati/run-1.png
[24]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/run-1.png
[25]:https://www.howtoforge.com/images/personal_backups_with_duplicati/restore-1.png
[26]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/restore-1.png
[27]:https://www.howtoforge.com/images/personal_backups_with_duplicati/restore-2.png
[28]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/restore-2.png
[29]:https://www.howtoforge.com/images/personal_backups_with_duplicati/remote-1.png
[30]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/remote-1.png
[31]:https://www.howtoforge.com/images/personal_backups_with_duplicati/remote-sshd.png
[32]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/remote-sshd.png
[33]:https://www.howtoforge.com/cdn-cgi/l/email-protection
[34]:https://www.howtoforge.com/images/personal_backups_with_duplicati/remote-sshtun.png
[35]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/remote-sshtun.png
[36]:https://www.howtoforge.com/images/personal_backups_with_duplicati/db-1.png
[37]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/db-1.png
[38]:https://www.howtoforge.com/images/personal_backups_with_duplicati/db-2.png
[39]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/db-2.png
[40]:https://www.howtoforge.com/images/personal_backups_with_duplicati/db-4.png
[41]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/db-4.png
[42]:https://www.howtoforge.com/images/personal_backups_with_duplicati/db-5.png
[43]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/db-5.png
[44]:https://www.howtoforge.com/images/personal_backups_with_duplicati/db-6.png
[45]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/db-6.png
[46]:https://www.howtoforge.com/images/personal_backups_with_duplicati/db-7.png
[47]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/db-7.png
[48]:https://www.howtoforge.com/images/personal_backups_with_duplicati/db-8.png
[49]:https://www.howtoforge.com/images/personal_backups_with_duplicati/big/db-8.png
