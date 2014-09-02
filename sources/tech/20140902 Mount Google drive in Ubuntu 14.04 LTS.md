Mount Google drive in Ubuntu 14.04 LTS
================================================================================
Google has not released its **official linux client** for accessing its drive from the ubuntu. But open source community has developed unofficial package called '**grive-tools**'.

Grive is a Google Drive (**online storage service**) client for GNU/Linux systems.It allows the **synchronization** of all your files on the cloud with a directory of your choice and the upload of new files to Google Drive. 

### Installation Steps of grive-tools ###

Step:1 Add grive-tools PPA using below Command :

    # sudo add-apt-repository ppa:thefanclub/grive-tools

Step:2 Update the list

    #sudo apt-get update

Step:3 Install grive-tools

    # sudo apt-get install grive-tools 

### Steps to Access Google Drive ###

**Step:1** Once the installation is completed , search the application on the **Unity Dash** by typing **Grive**, and open it.

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/access-grive-setup.png)

**Step:2** Sign in to google drive , you will be asked to give the permissions to access google drive

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/gdrive.png)

When we click on **Next**, a new broswer will open with **Google login page**

Log in to your Google Account and Click on **Accept** , as shown below : 

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/thrid-party-grive.png)

**Step:3** You will be provided a **google code** , copy this code and paste it into the **Grive Setup box**. 

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/gdrive-code.png)

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/code-in-grive.png)

When we Click on Next , it will start syncing your google drive with ' **Google Drive**' folder under your's **home directory**. Below window will appear when the installation is completed.

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/grive-installation-completed.png)

Google Drive folder created under **user's home directory**

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/google-drive-folder.png)

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/mount-google-drive-in-ubuntu/

作者：[Pradeep Kumar ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/