##How to Install a Google Drive Client on Ubuntu

The following tutorial will teach all Ubuntu users how to install an unofficial Google Drive client, called Grive, on their healthy Ubuntu operating system(s). 

As you already know, Google (probably hates Linux users) does not provide a Linux client for its awesome Google Drive cloud storage service. But don't worry, as the open source community has its geniuses like Lorenzo Breda, who developed an unofficial Google Drive client for Linux, called Grive.

Before we start with the actual installation, we should warn you that the Grive application is in early stages of development and it has some limitations, such as folders and files with multiple parents, and the ability to download Google Documents.

Other than that, we should also mention that Grive is command-line client and it has no GUI (graphical user interface), therefore, for this installation we will use another tool created by another Linux genius, simply called Grive Tools, which will automatically download, compile and install the latest version of Grive on your Ubuntu machine.

The following Ubuntu distributions are supported: Ubuntu 12.10 (Quantal Quetzal), Ubuntu 13.04 (Raring Ringtail), and Ubuntu 13.10 (Saucy Salamander). 

###Installing the dependencies

This is an easy step, which requires you to open a Terminal by searching it in the Unity Dash, and to paste the following code in the Terminal window:

sudo apt-get install -y git cmake build-essential libgcrypt11-dev libjson0-dev libcurl4-openssl-dev libexpat1-dev libboost-filesystem-dev libboost-program-options-dev binutils-dev libboost-test-dev libqt4-dev libyajl-dev expect zenity gksu libnotify-bin

Hit the Enter key, type your password when asked, and hit Enter again to start the installation process. Keep in mind that some of these packages might be installed on your system from previous application that needed them.

Review image

###Installing Grive Tools and Grive

Download the Grive Tools package right now from [here](http://linux.softpedia.com/get/Utilities/Grive-Tools-102298.shtml), save it on your desktop, and double click it when the download is finished. Ubuntu Software Center will open, which will allow you to easily install the application.

Review image

Once installed, search the application on the Unity Dash by typing Grive, and open it. The application will ask for your password, so insert it and click OK, and then it will start to download and configure the latest version of the Grive application, which will take some time.

Review image

Review image

###Configure Google Drive for Grive

Now that the Grive Google Drive client for Linux has been installed, we need to configure it, in order to allow it to access your Google Drive account. Press the "Next" button when you see the following dialog...

Review image

A web browser window or tab will open, asking you to log-in into your Google account (in case you are not already logged in) and to give the app permission to access your Google Drive. Click the blue "Accept" button and you will see a Google authentication code that you need to copy and paste in the Grive Setup dialog.

Review image

Review image

That's it! Your Google Drive files will be immediately downloaded from your Google account and placed into a folder called "Google Drive" in your Home directory. You will also see a desktop notification when the synchronization takes place.

Review image

If you search "Google Drive" (without quotes) in the Unity Dash, you will see a Google Drive icon, which you can drag on your Unity Launcher. Right clicking on the Google Drive icon from the Unity Launcher will allow you to quickly sync your Google Drive account or access the local folder.

Review image

Do not hesitate to comment below if you run into problems during this tutorial.

via: http://news.softpedia.com/news/How-to-Install-a-Google-Drive-Client-on-Ubuntu-381532.shtml