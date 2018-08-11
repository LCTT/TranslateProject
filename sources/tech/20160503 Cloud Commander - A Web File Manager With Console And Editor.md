Cloud Commander – A Web File Manager With Console And Editor
======

![](https://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-A-Web-File-Manager-With-Console-And-Editor-720x340.png)

**Cloud commander** is a web-based file manager application that allows you to view, access, and manage the files and folders of your system from any computer, mobile, and tablet Pc via a web browser. It has two simple and classic panels, and automatically converts it’s size as per your device’s display size. It also has two built-in editors namely **Dword** and **Edward** with support of Syntax-highlighting and one **Console** with support of your system’s command line. So you can edit your files on the go. Cloud Commander server is a cross-platform application that runs on Linux, Windows and Mac OS X operating systems, and the client will run on any web browser. It is written using **JavaScript/Node.Js** , and is licensed under **MIT**.

In this brief tutorial, let us see how to install Cloud Commander in Ubuntu 18.04 LTS server.

### Prerequisites

As I mentioned earlier, Cloud Commander is written using Node.Js. So, in order to install Cloud Commander we need to install Node.Js first. To do so, refer the following guide.

### Install Cloud Commander

After installing Node.Js, run the following command to install Cloud Commander:
```
$ npm i cloudcmd -g

```

Congratulations! Cloud Commander has been installed. Let us go ahead and see the basic usage of Cloud Commander.

### Getting started with Cloud Commander

Run the following command to start Cloud Commander:
```
$ cloudcmd

```

**Sample output:**
```
url: http://localhost:8000

```

Now, open your web browser and navigate to the URL: **<http://localhost:8000** or> **<http://IP-address:8000>**.

From now on, you can create, delete, view, manage files or folders right in the web browser from the local system or remote system, or mobile, tablet etc.

![][2]

As you can see in the above screenshot, Cloud Commander has two panels, ten hotkeys (F1 to F10), and Console.

Each hotkey does a unique job.

  * F1 – Help
  * F2 – Rename file/folder
  * F3 – View files and folders
  * F4 – Edit files
  * F5 – Copy files/folders
  * F6 – Move files/folders
  * F7 – Create new directory
  * F8 – Delete file/folder
  * F9 – Open Menu
  * F10 – Open config



#### Cloud Commander console

Click on the Console icon. This will open your default system’s shell.

![][3]

From this console you can do all sort of administration tasks such as installing packages, removing packages, update your system etc. You can even shutdown or reboot system. Therefore, Cloud Commander is not just a file manager, but also has the functionality of a remote administration tool.

#### Creating files/folders

To create a new file or folder Right click on any empty place and go to **New - >File or Directory**.

![][4]

#### View files

You can view pictures, watch audio and video files.

![][5]

#### Upload files

The other cool feature is we can easily upload a file to Cloud Commander system from any system or device.

To upload a file, right click on any empty space in the Cloud Commander panel, and click on the **Upload** option.

![][6]

Select the files you want to upload.

Also, you can upload files from the Cloud services like Google drive, Dropbox, Amazon cloud drive, Facebook, Twitter, Gmail, GtiHub, Picasa, Instagram and many.

To upload files from Cloud, right click on any empty space in the panel and select **Upload from Cloud**.

![][7]

Select any web service of your choice, for example Google drive. Click **Connect to Google drive** button.

![][8]

In the next step, authenticate your google drive with Cloud Commander. Finally, select the files from your Google drive and click **Upload**.

![][9]

#### Update Cloud Commander

To update Cloud Commander to the latest available version, run the following command:
```
$ npm update cloudcmd -g

```

#### Conclusion

As far as I tested Cloud Commander, It worked like charm. I didn’t face a single issue during the testing in my Ubuntu server. Also, Cloud Commander is not just a web-based file manager, but also acts as a remote administration tool that performs most Linux administration tasks. You can create a files/folders, rename, delete, edit, and view them. Also, You can install, update, upgrade, and remove any package as the way you do in the local system from the Terminal. And, of course, you can even shutdown or restart the system from the Cloud Commander console itself. What do you need more? Give it a try, you will find it useful.

That’s all for now. I will be here soon with another interesting article. Until then, stay tuned with OSTechNix.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cloud-commander-a-web-file-manager-with-console-and-editor/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-Google-Chrome_006-4.jpg
[3]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-Google-Chrome_007-2.jpg
[4]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-commander-file-folder-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-home-sk-Google-Chrome_008-1.jpg
[6]:http://www.ostechnix.com/wp-content/uploads/2016/05/cloud-commander-upload-2.png
[7]:http://www.ostechnix.com/wp-content/uploads/2016/05/upload-from-cloud-1.png
[8]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-home-sk-Google-Chrome_009-2.jpg
[9]:http://www.ostechnix.com/wp-content/uploads/2016/05/Cloud-Commander-home-sk-Google-Chrome_010-1.jpg
