yujianxuechuan is translating this 
Daily Ubuntu Tips – Ubuntu One Shuts Down, Switch To Dropbox Or Box Cloud Services
================================================================================
With Canonical’s [decision to shutdown Ubuntu One cloud file services][1], you may be looking for other services to host your data. Although there are many cloud services, just few of the big players support Linux, including Ubuntu.

Dropbox fully supports Ubuntu. It has a Linux client that integrates well with Ubuntu desktop and other notification services. Box, formally Box.net also support Linux via WebDav protocol.

Here’s an excerpt from Canonical’s announcement about Ubuntu One:

> As of today (April 2), it will no longer be possible to purchase storage or music from the Ubuntu One store. The Ubuntu One file services will not be included in the upcoming Ubuntu 14.04 LTS release, and the Ubuntu One apps in older version of Ubuntu and in the Ubuntu, Google and Apple stores will be updated appropriately.

It’s sad that we lost this useful service in Ubuntu. One the other hand, moving your data to a more stabled and reputable storage provider is the best decision you can make going forward.

This brief tutorial shows you how to starting using DropBox or Box cloud services in Ubuntu.

### Installing DropBox Cloud storage in Ubuntu ###

We’ve written a lot on this topic. To install DropBox in Ubuntu, all you have to do is follow the steps in the tutorial. It provides a step by step guide in installing and using DropBox in Ubuntu.

To view the tutorial, [click here][2]. Or use the link below:

[http://www.liberiangeek.net/2013/03/how-to-install-dropbox-in-ubuntu-13-04-raring-ringtail/][2]

### Using Box Cloud storage in Ubuntu ###

Since Box doesn’t have a full feature client for Linux systems, including Ubuntu, you must use WebDav protocol to access and store your content automatically to your account.

To do that, press **Ctrl – Alt – T** on your keyboard to open the terminal. When the terminal console opens, run the commands below to install these packages.

    sudo apt-get install davfs2

Next, run the commands below to reconfigure davfs2 and choose **Yes** to allow unprivileged users to be allowed to mount WebDav resources.

    sudo dpkg-reconfigure davfs2

Next, copy davfs2 folder to your home directory by running the commands below

    sudo cp -r /etc/davfs2/ $HOME/.davfs2

Then take ownership of the content by running the commands below

    sudo chown -R username $HOME/.davfs2/

 replace username with your account name.

Next, open the password file so you can enter your login credentials

    gedit ~/.davfs2/secrets

Then type your username (email address) and password in the file as shown below. Add the line below at the end of the file and save.

    https://dav.box.com/dav richard@liberiangeek.net  <box_password>

replace the the email address and password with your account info

Next, run the commands below to add your account to the davfs2 group

    sudo adduser <username> davfs2

Next, open the /etc/fstab tab and add the line below in it.

    sudo gedit /etc/fstab

Add this line at the end of the file and save.

    https://dav.box.com/dav/ /home/<username>/box  davfs _netdev,rw,user 0 0 

Finally, create a mount point to mount Box’s content

    mkdir ~/box

Restart your computer and your Box content should be mounted on the launcher.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/04/daily-ubuntu-tips-ubuntu-one-shuts-down-switch-to-dropbox-or-box-cloud-services/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://blog.canonical.com/2014/04/02/shutting-down-ubuntu-one-file-services/
[2]:http://www.liberiangeek.net/2013/03/how-to-install-dropbox-in-ubuntu-13-04-raring-ringtail/
