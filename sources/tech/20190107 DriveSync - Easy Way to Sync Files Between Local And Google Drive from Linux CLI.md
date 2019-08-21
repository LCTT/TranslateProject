[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (DriveSync – Easy Way to Sync Files Between Local And Google Drive from Linux CLI)
[#]: via: (https://www.2daygeek.com/drivesync-google-drive-sync-client-for-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

DriveSync – Easy Way to Sync Files Between Local And Google Drive from Linux CLI
======

Google Drive is an one of the best cloud storage compared with other cloud storage.

It’s one of the application which is used by millions of users in daily basics.

It allow users to access the application anywhere irrespective of devices.

We can upload, download & share documents, photo, files, docs, spreadsheet, etc to anyone with securely.

We had already written few articles in 2daygeek website about google drive mapping with Linux.

If you would like to check those, navigate to the following link.

GNOME desktop offers easy way to **[Integrate Google Drive Using Gnome Nautilus File Manager in Linux][1]** without headache.

Also, you can give a try with **[Google Drive Ocamlfuse Client][2]**.

### What’s DriveSync?

[DriveSync][3] is a command line utility that synchronizes your files between local system and Google Drive via command line.

Downloads new remote files, uploads new local files to your Drive and deletes or updates files both locally and on Drive if they have changed in one place.

Allows blacklisting or whitelisting of files and folders that should not / should be synced.

It was written in Ruby scripting language so, make sure your system should have ruby installed. If it’s not installed then install it as a prerequisites for DriveSync.

### DriveSync Features

  * Downloads new remote files
  * Uploads new local files
  * Delete or Update files in both locally and Drive
  * Allow blacklist to disable sync for files and folders
  * Automate the sync using cronjob
  * Allow us to set file upload/download size (Defautl 512MB)
  * Allow us to modify Timeout threshold



### How to Install Ruby Scripting Language in Linux?

Ruby is an interpreted scripting language for quick and easy object-oriented programming. It has many features to process text files and to do system management tasks (like in Perl). It is simple, straight-forward, and extensible.

It’s available in all the Linux distribution official repository. Hence we can easily install it with help of distribution official **[Package Manager][4]**.

For **`Fedora`** system, use **[DNF Command][5]** to install Ruby.

```
$ sudo dnf install ruby rubygem-bundler
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][6]** or **[APT Command][7]** to install Ruby.

```
$ sudo apt install ruby ruby-bundler
```

For **`Arch Linux`** based systems, use **[Pacman Command][8]** to install Ruby.

```
$ sudo pacman -S ruby ruby-bundler
```

For **`RHEL/CentOS`** systems, use **[YUM Command][9]** to install Ruby.

```
$ sudo yum install ruby ruby-bundler
```

For **`openSUSE Leap`** system, use **[Zypper Command][10]** to install Ruby.

```
$ sudo zypper install ruby ruby-bundler
```

### How to Install DriveSync in Linux?

DriveSync installation also easy to do it. Follow the below procedure to get it done.

```
$ git clone https://github.com/MStadlmeier/drivesync.git
$ cd drivesync/
$ bundle install
```

### How to Set Up DriveSync in Linux?

As of now, we had successfully installed DriveSync and still we need to perform few steps to use this.

Run the following command to set up this and Sync the files.

```
$ ruby drivesync.rb
```

When you ran the above command you will be getting the below url.
![][12]

Navigate to the given URL in your preferred Web Browser and follow the instruction. It will open a google sign-in page in default web browser. Enter your credentials then hit Sign in button.
![][13]

Input your password.
![][14]

Hit **`Allow`** button to allow DriveSync to access your Google Drive.
![][15]

Finally, it will give you an authorization code.
![][16]

Just copy and past it on the terminal and hit **`Enter`** button to start the sync.
![][17]

Yes, it’s syncing the files from Google Drive to my local folder.

```
$ ruby drivesync.rb
Warning: Could not find config file at /home/daygeek/.drivesync/config.yml . Creating default config...
Open the following URL in the browser and enter the resulting code after authorization
https://accounts.google.com/o/oauth2/auth?access_type=offline&approval_prompt=force&client_id=xxxxxxxxxxxxxxxxxxxxxxxxxxxx.apps.googleusercontent.com&include_granted_scopes=true&redirect_uri=urn:ietf:wg:oauth:2.0:oob&response_type=code&scope=https://www.googleapis.com/auth/drive
4/ygAxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Local folder is 1437 files behind and 0 files ahead of remote
Starting sync at 2019-01-06 19:48:49 +0530
Downloading file 2018-07-31-17-48-54-635_1533039534635_XXXPM0534X_ITRV.zip ...
Downloading file 5459XXXXXXXXXX25_11-03-2018.PDF ...
Downloading file 2g-image-design/new-design-28-Mar-2018/new-base-format-icon-theme.svg ...
Downloading file 2g-image-design/new-design-28-Mar-2018/2g-banner-format.svg ...
Downloading file 2g-image-design/new-design-28-Mar-2018/new-base-format.svg ...
Downloading file documents/Magesh_Resume_Updated_26_Mar_2018.doc ...
Downloading file documents/Magesh_Resume_updated-new.doc ...
Downloading file documents/Aadhaar-Thanu.PNG ...
Downloading file documents/Aadhaar-Magesh.PNG ...
Downloading file documents/Copy of PP-docs.pdf ...
Downloading file EAadhaar_2189821080299520170807121602_25082017123052_172991.pdf ...
Downloading file Tanisha/VID_20170223_113925.mp4 ...
Downloading file Tanisha/VID_20170224_073234.mp4 ...
Downloading file Tanisha/VID_20170304_170457.mp4 ...
Downloading file Tanisha/IMG_20170225_203243.jpg ...
Downloading file Tanisha/IMG_20170226_123949.jpg ...
Downloading file Tanisha/IMG_20170226_123953.jpg ...
Downloading file Tanisha/IMG_20170304_184227.jpg ...
.
.
.
Sync complete.
```

It will create the **`drive`** folder under **`/home/user/Documents/`** and sync all the files in it.
![][18]

DriveSync configuration files are located in the following location **`/home/user/.drivesync/`** if you had installed it on your **home** directory.

```
$ ls -lh ~/.drivesync/
total 176K
-rw-r--r-- 1 daygeek daygeek 1.9K Jan 6 19:42 config.yml
-rw-r--r-- 1 daygeek daygeek 170K Jan 6 21:31 manifest
```

You can make your changes by modifying the **`config.yml`** file.

### How to Verify Whether Sync is Working Fine or Not?

To test this, we are going to create a new folder called **`2g-docs-2019`**. Also, adding an image file in it. Once it’s done, run the **`drivesync.rb`** command again.

```
$ ruby drivesync.rb
Local folder is 0 files behind and 1 files ahead of remote
Starting sync at 2019-01-06 21:59:32 +0530
Uploading file 2g-docs-2019/Asciinema - Record And Share Your Terminal Activity On The Web.png ...
```

Yes, it has been synced to Google Drive. The same has been verified through Web Browser.
![][19]

Create the below **CronJob** to enable an auto sync. The following “CronJob” will be running an every mins.

```
$ vi crontab
*/1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated ruby ~/drivesync/drivesync.rb
```

I have added one more file to test this. Yes, it got success.

```
Jan 07 09:36:01 daygeek-Y700 crond[590]: (daygeek) RELOAD (/var/spool/cron/daygeek)
Jan 07 09:36:01 daygeek-Y700 crond[20942]: pam_unix(crond:session): session opened for user daygeek by (uid=0)
Jan 07 09:36:01 daygeek-Y700 CROND[20943]: (daygeek) CMD (ruby ~/drivesync/drivesync.rb)
Jan 07 09:36:29 daygeek-Y700 CROND[20942]: (daygeek) CMDOUT (Local folder is 0 files behind and 1 files ahead of remote)
Jan 07 09:36:29 daygeek-Y700 CROND[20942]: (daygeek) CMDOUT (Starting sync at 2019-01-07 09:36:26 +0530)
Jan 07 09:36:29 daygeek-Y700 CROND[20942]: (daygeek) CMDOUT (Uploading file 2g-docs-2019/Check CPU And HDD Temperature In Linux.png ...)
Jan 07 09:36:29 daygeek-Y700 CROND[20942]: (daygeek) CMDOUT ()
Jan 07 09:36:29 daygeek-Y700 CROND[20942]: (daygeek) CMDOUT (Sync complete.)
Jan 07 09:36:29 daygeek-Y700 CROND[20942]: pam_unix(crond:session): session closed for user daygeek
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/drivesync-google-drive-sync-client-for-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/mount-access-setup-google-drive-in-linux/
[2]: https://www.2daygeek.com/mount-access-google-drive-on-linux-with-google-drive-ocamlfuse-client/
[3]: https://github.com/MStadlmeier/drivesync
[4]: https://www.2daygeek.com/category/package-management/
[5]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[6]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[7]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[8]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[9]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[10]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[11]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[12]: https://www.2daygeek.com/wp-content/uploads/2019/01/drivesync-easy-way-to-sync-files-between-local-and-google-drive-from-linux-cli-1.jpg
[13]: https://www.2daygeek.com/wp-content/uploads/2019/01/drivesync-easy-way-to-sync-files-between-local-and-google-drive-from-linux-cli-2.png
[14]: https://www.2daygeek.com/wp-content/uploads/2019/01/drivesync-easy-way-to-sync-files-between-local-and-google-drive-from-linux-cli-3.png
[15]: https://www.2daygeek.com/wp-content/uploads/2019/01/drivesync-easy-way-to-sync-files-between-local-and-google-drive-from-linux-cli-4.png
[16]: https://www.2daygeek.com/wp-content/uploads/2019/01/drivesync-easy-way-to-sync-files-between-local-and-google-drive-from-linux-cli-5.png
[17]: https://www.2daygeek.com/wp-content/uploads/2019/01/drivesync-easy-way-to-sync-files-between-local-and-google-drive-from-linux-cli-6.jpg
[18]: https://www.2daygeek.com/wp-content/uploads/2019/01/drivesync-easy-way-to-sync-files-between-local-and-google-drive-from-linux-cli-7.jpg
[19]: https://www.2daygeek.com/wp-content/uploads/2019/01/drivesync-easy-way-to-sync-files-between-local-and-google-drive-from-linux-cli-8.png
