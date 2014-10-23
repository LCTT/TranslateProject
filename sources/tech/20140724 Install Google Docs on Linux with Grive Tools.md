Install Google Docs on Linux with Grive Tools
================================================================================
Google Drive is two years old now and Google’s cloud storage solution seems to be still going strong thanks to its integration with Google Docs and Gmail. There’s one thing still missing though: a lack of an official Linux client. Apparently Google has had one floating around their offices for a while now, however it’s not seen the light of day on any Linux system.

Thankfully, there is an alternative solution using Grive Tools. We’ve covered Grive once before when it was in its infancy, but it’s received a fair few upgrades since then thanks to Grive Tools and is now compatible with Fedora and OpenSUSE to cover a better selection of distros. Over the course of this tutorial, we’ll show you how to set up Grive Tools and get it syncing files to and from Google Drive on a regular basis, so your work is always perfectly backed up. With the death of Ubuntu One, it’s a great alternative to Canonical’s own cloud storage solution.

![Accesss your backed up Linux files from anywhere with an internet connection by making use of the Drive connection](http://www.linuxuser.co.uk/wp-content/uploads/2014/07/griveanno.png)
Accesss your backed up Linux files from anywhere with an internet connection by making use of the Drive connection

### Resources ###

A Google account

- [Grive Tools][1]

### Step-by-step ###

#### Step 01 Ubuntu repository ####

Grive Tools is not included in Ubuntu or Ubuntu-based distros yet, so you’ll need to add a third-party repository to access it. Add this with:

    $ sudo add-apt-repository ppa:thefanclub/grive-tools

Follow this up with the usual sudo apt-get update before we continue.

#### Step 02 Ubuntu install ####

After the apt-get update, Grive Tools will appear in the software centre. If you want to go there and install it you can, however as we already have a terminal open we might as well use:

    $ sudo apt-get install grive-tools

#### Step 03 Fedora dependencies ####

You’ll need to install some specific dependencies for OpenSUSE, Fedora and other RHEL-based distros. In Fedora specifically, open a terminal and install them with:

    $ sudo yum install json-c json-c-devel qt-devel boost-devel openssl-devel libxslt libcurl libcurl-devel

The same packages will need to be installed on the other distros.

#### Step 04 Grive package ####

Grive is not in the repositories of any of
these distros, however binaries exist if you won’t want to build it from source. Go to RPMSEEK.com and search for Grive; look out for the version for your distro and download it.

#### Step 05 Install the download ####

Once downloaded, install the package; you can either do it graphical or install with:

    $ sudo yum install grive-tools-1.9.noarch.rpm

After that, go to the Resources link for Grive Tools and locate the Fedora package on the website: download this binary and install it alongside Grive.

#### Step 06 Start the setup ####

The method to actually get Grive and Grive Tools working on both systems is basically the same, so we’ll cover both at once while mentioning any extras that need to be done for a specific distro. The first thing you’ll need to do is look for Grive Setup in your list of programs.

#### Step 07 Log into your account ####

If you haven’t already created a Google account, you’ll need to get one sorted now before continuing. Otherwise, click Next to bring up a browser that will point you towards Google and ask you to log in. Make sure you’re logged in to the correct email address before continuing.

#### Step 08 Connect your account ####

You’ll be asked if the specific info it can look at is okay – you’ll need to confirm to continue, otherwise it can’t download or sync your Drive data. It will then give you a code to paste into a pop-up that launched when the browser opened.

#### Step 09 Code input ####

Press Next for Grive to accept the code. It will automatically open up a new Google Drive window and show your files being synced straight to your PC. This may take a while depending on how much you have stored on your account.

#### Step 10 Desktop notifications ####

Once the sync is complete, search again for Grive in your programs and look for Google Drive Indicator. Click on this and it will automatically launch a Dropbox-style toolbar notifier for Google Drive. This is also similar to the kind of notifier on desktops with an official client.

#### Step 11 Access Google Drive ####

You can quick access the contents of your Google Drive by finding the app of the same name in your program list. It links straight to your folder for ease of access, so you can add it to favourites or quick bar if you wish. There’s also an option to open it from the notifier.

#### Step 12 Drive options ####

You can access syncing options from the indicator to make sure Grive works as you want it to. Access them by clicking on the toolbar icon and select preferences. A couple of options you’d probably want checked are ‘Start Drive when computer turns on’, and ‘On screen notifications’.

#### Step 13 Auto-syncing ####

Unlike the official clients, you cannot select which folders do and do not get synced on your client. Depending on how you plan to use it, you can turn on Auto-sync so that everything is synced up and down at all times, or you can turn it off and sync manually when everything is ready.

#### Step 14 Large file tip ####

Google Drive – not just Grive – always seems to have issues with uploading larger files. We suggest splitting them up into smaller files using split on a compressed file to make them all a specific size. You can do it in a terminal with:

    split -b 500m file.mp4 newfilename

#### Step 15 File types ####

One of the major things you may have noticed is which documents have and have not been downloaded by Grive. On the official clients, links will be added that can let you jump straight to pure Google Docs files, while files that are actually DOC, ODF or PDF will be downloaded outright to the system. Only the latter files are downloaded with Grive as they’re purely stored in the cloud on Drive. The upside is they’re properly stored locally and will still sync between the cloud and other systems.

#### Step 16 Location ####

Very simply, the Google Drive folder is kept in the home folder under Google Drive. If you’re using standard GNOME it’s actually opening the files in the GNOME file manager; for some reason it also does that in Unity and any non-GNOME desktop environment.

#### Step 17 Backup to Grive ####

One of the benefits of cloud storage for files is that the storage itself is off-site and difficult to lose. This makes it ideal for backing up other important documents and settings. The simplest and quickest way to do this is to periodically copy a file over to the Drive folder and watch it upload.

#### Step 18 Better backup ####

This is not the most efficient way to backup such files though; fortunately Linux comes with many tools to back up data that also includes backup scheduling thanks to cron. We’ll be using luckyBackup for this: find it in your package manager and install it.

#### Step 19 Set up the backup ####

Click Add to create a new task and name it however you wish. Keep the Type setting to ‘Backup Source inside Destination’, choose your Source and finally set the Destination as the Google Drive folder. Click OK to save it, followed by the checkbox next to the task to activate it.

#### Step 20 First backup ####

Click Run at the top to do the first backup operation. It will print out a verbose list of the files and operations and will inform you once it’s finished, along with any errors that occurred along the way. If you have automatic sync on, it will start uploading the backed up files to Drive.

#### Step 21 Timed backup ####

Click Done to return to the main menu. Click Profile followed by Schedule to bring up the scheduling dialog. The schedules are done by profiles, which can all contain a number of different backup tasks. Click Add to start creating a schedule for our Drive backup.

#### Step 22 To schedule ####

The schedule creates a cron job, so you can set it to occur on specific days of the week or specific months of the year and at what time the backup should occur. You can have it do so every hour at a specific minute past the hour if you need it to back up so frequently.

#### Step 23 Reverse backup ####

Google Drive helpfully keeps a record of past versions of files on its servers; however they do not extend forever. If you’re backing up or saving to the cloud you may want to consider creating a backup of the Drive files to your PC or network as well.

#### Step 24 Driven ####

While there are no official tools for Linux just yet, Grive and Grive Tools at least enable you to emulate what they should be relatively well. Look out for updates to Drive and Grive Tools to see if any new functions would work well for you.

--------------------------------------------------------------------------------

via: http://www.linuxuser.co.uk/tutorials/install-google-docs-on-linux-with-grive-tools

原文作者：Rob Zwetsloot

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.thefanclub.co.za/