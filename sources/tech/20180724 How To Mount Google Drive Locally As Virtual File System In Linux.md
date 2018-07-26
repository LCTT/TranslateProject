How To Mount Google Drive Locally As Virtual File System In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/07/Google-Drive-720x340.png)

[**Google Drive**][1] is the one of the popular cloud storage provider on the planet. As of 2017, over 800 million users are actively using this service worldwide. Even though the number of users have dramatically increased, Google haven’t released a Google drive client for Linux yet. But it didn’t stop the Linux community. Every now and then, some developers had brought few google drive clients for Linux operating system. In this guide, we will see three unofficial google drive clients for Linux. Using these clients, you can mount Google drive locally as a virtual file system and access your drive files in your Linux box. Read on.

### 1. Google-drive-ocamlfuse

The **google-drive-ocamlfuse** is a FUSE filesystem for Google Drive, written in OCaml. For those wondering, FUSE, stands for **F** ilesystem in **Use** rspace, is a project that allows the users to create virtual file systems in user level. **google-drive-ocamlfuse** allows you to mount your Google Drive on Linux system. It features read/write access to ordinary files and folders, read-only access to Google docks, sheets, and slides, support for multiple google drive accounts, duplicate file handling, access to your drive trash directory, and more.

#### Installing google-drive-ocamlfuse

google-drive-ocamlfuse is available in the [**AUR**][2], so you can install it using any AUR helper programs, for example [**Yay**][3].
```
$ yay -S google-drive-ocamlfuse

```

On Ubuntu:
```
$ sudo add-apt-repository ppa:alessandro-strada/ppa
$ sudo apt-get update
$ sudo apt-get install google-drive-ocamlfuse

```

To install latest beta version, do:
```
$ sudo add-apt-repository ppa:alessandro-strada/google-drive-ocamlfuse-beta
$ sudo apt-get update
$ sudo apt-get install google-drive-ocamlfuse

```

#### Usage

Once installed, run the following command to launch **google-drive-ocamlfuse** utility from your Terminal:
```
$ google-drive-ocamlfuse

```

When you run this first time, the utility will open your web browser and ask your permission to authorize your google drive files. Once you gave authorization, all necessary config files and folders it needs to mount your google drive will be automatically created.

![][5]

After successful authentication, you will see the following message in your Terminal.
```
Access token retrieved correctly.

```

You’re good to go now. Close the web browser and then create a mount point to mount your google drive files.
```
$ mkdir ~/mygoogledrive

```

Finally, mount your google drive using command:
```
$ google-drive-ocamlfuse ~/mygoogledrive

```

Congratulations! You can access access your files either from Terminal or file manager.

From **Terminal** :
```
$ ls ~/mygoogledrive

```

From **File manager** :

![][6]

If you have more than one account, use **label** option to distinguish different accounts like below.
```
$ google-drive-ocamlfuse -label label [mountpoint]

```

Once you’re done, unmount the FUSE flesystem using command:
```
$ fusermount -u ~/mygoogledrive

```

For more details, refer man pages.
```
$ google-drive-ocamlfuse --help

```

Also, do check the [**official wiki**][7] and the [**project GitHub repository**][8] for more details.

### 2. GCSF

**GCSF** is a FUSE filesystem based on Google Drive, written using **Rust** programming language. The name GCSF has come from the Romanian word “ **G** oogle **C** onduce **S** istem de **F** ișiere”, which means “Google Drive Filesystem” in English. Using GCSF, you can mount your Google drive as a local virtual file system and access the contents from the Terminal or file manager. You might wonder how it differ from other Google Drive FUSE projects, for example **google-drive-ocamlfuse**. The developer of GCSF replied to a similar [comment on Reddit][9] “GCSF tends to be faster in several cases (listing files recursively, reading large files from Drive). The caching strategy it uses also leads to very fast reads (x4-7 improvement compared to google-drive-ocamlfuse) for files that have been cached, at the cost of using more RAM“.

#### Installing GCSF

GCSF is available in the [**AUR**][10], so the Arch Linux users can install it using any AUR helper, for example [**Yay**][3].
```
$ yay -S gcsf-git

```

For other distributions, do the following.

Make sure you have installed Rust on your system.

Make sure **pkg-config** and the **fuse** packages are installed. They are available in the default repositories of most Linux distributions. For example, on Ubuntu and derivatives, you can install them using command:
```
$ sudo apt-get install -y libfuse-dev pkg-config

```

Once all dependencies installed, run the following command to install GCSF:
```
$ cargo install gcsf

```

#### Usage

First, we need to authorize our google drive. To do so, simply run:
```
$ gcsf login ostechnix

```

You must specify a session name. Replace **ostechnix** with your own session name. You will see an output something like below with an URL to authorize your google drive account.

![][11]

Just copy and navigate to the above URL from your browser and click **allow** to give permission to access your google drive contents. Once you gave the authentication you will see an output like below.
```
Successfully logged in. Credentials saved to "/home/sk/.config/gcsf/ostechnix".

```

GCSF will create a configuration file in **$XDG_CONFIG_HOME/gcsf/gcsf.toml** , which is usually defined as **$HOME/.config/gcsf/gcsf.toml**. Credentials are stored in the same directory.

Next, create a directory to mount your google drive contents.
```
$ mkdir ~/mygoogledrive

```

Then, edit **/etc/fuse.conf** file:
```
$ sudo vi /etc/fuse.conf

```

Uncomment the following line to allow non-root users to specify the allow_other or allow_root mount options.
```
user_allow_other

```

Save and close the file.

Finally, mount your google drive using command:
```
$ gcsf mount ~/mygoogledrive -s ostechnix

```

Sample output:
```
INFO gcsf > Creating and populating file system...
INFO gcsf > File sytem created.
INFO gcsf > Mounting to /home/sk/mygoogledrive
INFO gcsf > Mounted to /home/sk/mygoogledrive
INFO gcsf::gcsf::file_manager > Checking for changes and possibly applying them.
INFO gcsf::gcsf::file_manager > Checking for changes and possibly applying them.

```

Again, replace **ostechnix** with your session name. You can view the existing sessions using command:
```
$ gcsf list
Sessions:
- ostechnix

```

You can now access your google drive contents either from the Terminal or from File manager.

From **Terminal** :
```
$ ls ~/mygoogledrive

```

From **File manager** :

![][12]

If you don’t know where your Google drive is mounted, use **df** or **mount** command as shown below.
```
$ df -h
Filesystem Size Used Avail Use% Mounted on
udev 968M 0 968M 0% /dev
tmpfs 200M 1.6M 198M 1% /run
/dev/sda1 20G 7.5G 12G 41% /
tmpfs 997M 0 997M 0% /dev/shm
tmpfs 5.0M 4.0K 5.0M 1% /run/lock
tmpfs 997M 0 997M 0% /sys/fs/cgroup
tmpfs 200M 40K 200M 1% /run/user/1000
GCSF 15G 857M 15G 6% /home/sk/mygoogledrive

$ mount | grep GCSF
GCSF on /home/sk/mygoogledrive type fuse (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000,allow_other)

```

Once done, unmount the google drive using command:
```
$ fusermount -u ~/mygoogledrive

```

Check the [**GCSF GitHub repository**][13] for more details.

### 3. Tuxdrive

**Tuxdrive** is yet another unofficial google drive client for Linux. We have written a detailed guide about Tuxdrive a while ago. Please check the following link.

Of course, there were few other unofficial google drive clients available in the past, such as Grive2, Syncdrive. But it seems that they are discontinued now. I will keep updating this list when I come across any active google drive clients.

And, that’s all for now, folks. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-mount-google-drive-locally-as-virtual-file-system-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.google.com/drive/
[2]:https://aur.archlinux.org/packages/google-drive-ocamlfuse/
[3]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]:http://www.ostechnix.com/wp-content/uploads/2018/07/google-drive.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/07/google-drive-2.png
[7]:https://github.com/astrada/google-drive-ocamlfuse/wiki/Configuration
[8]:https://github.com/astrada/google-drive-ocamlfuse
[9]:https://www.reddit.com/r/DataHoarder/comments/8vlb2v/google_drive_as_a_file_system/e1oh9q9/
[10]:https://aur.archlinux.org/packages/gcsf-git/
[11]:http://www.ostechnix.com/wp-content/uploads/2018/07/google-drive-3.png
[12]:http://www.ostechnix.com/wp-content/uploads/2018/07/google-drive-4.png
[13]:https://github.com/harababurel/gcsf
