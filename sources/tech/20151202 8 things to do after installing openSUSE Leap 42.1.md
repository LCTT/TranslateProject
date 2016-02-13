#name1e5s Translating 
8 things to do after installing openSUSE Leap 42.1
================================================================================
![Credit: Metropolitan Transportation/Flicrk](http://images.techhive.com/images/article/2015/11/things-to-do-100626947-primary.idge.jpg)
Credit: [Metropolitan Transportation/Flicrk][1] 

> You've installed openSUSE on your PC. Here's what to do next.

[openSUSE Leap is indeed a huge leap][2], allowing users to run a distro that has the same DNA of SUSE Linux Enterprise. Like any other operating system, some work is needed to get it set up for optimal use.

Following are some of the things that I did after installing openSUSE Leap on my PC (these are not applicable for server installations). None of them are mandatory, and you may be fine with the basic install. But if you need more out of your openSUSE Leap, follow me. 

### 1. Adding Packman repository ###

Due to software patents and licences, openSUSE, like many Linux distributions, doesn't offer many applications, codecs, and drivers through official repositories (repos). Instead, these are made available through 3rd party or community repos. The first and most important repository is 'Packman'. Since these repos are not enabled by default, we have to add them. You can do so either using YaST (one of the gems of openSUSE) or by command line (instructions below).

![o42 yast repo](http://images.techhive.com/images/article/2015/11/o42-yast-repo-100626952-large970.idge.png)
Adding Packman repositories.

Using YaST, go to the Software Repositories section. Click on the 'Add’ button and select 'Community Repositories.' Click 'next.' And once the repos are loaded, select the Packman Repository. Click 'OK,' then import the trusted GnuPG key by clicking on the 'Trust' button.

Or, using the terminal you can add and enable the Packman repo using the following command:

    zypper ar -f -n packmanhttp://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_42.1/ packman

Once the repo is added, you have access to many more packages. To install any application or package, open YaST Software Manager, search for the package and install it.

### 2. Install VLC ###

VLC is the Swiss Army knife of media players and can play virtually any media file. You can install VLC from YaST Software Manager or from software.opensuse.org. You will need to install two packages: vlc and vlc-codecs.

If using terminal, run the following command:

    sudo zypper install vlc vlc-codecs

### 3. Install Handbrake ###

If you need to transcode or convert your video files from one format to another, [Handbrake is the tools for you][3]. Handbrake is available through repositories we enabled, so just search for it in YaST and install.

If you are using the terminal, run the following command:

    sudo zypper install handbrake-cli handbrake-gtk

(Pro tip: VLC can also transcode audio and video files.)

### 4. Install Chrome ###

OpenSUSE comes with Firefox as the default browser. But since Firefox isn't capable of playing restricted media such as Netflix, I recommend installing Chrome. This takes some extra work. First you need to import the trusted key from Google. Open the terminal app and run the 'wget' command to download the key:

    wget https://dl.google.com/linux/linux_signing_key.pub

Then import the key:

    sudo rpm --import linux_signing_key.pub

Now head over to the [Google Chrome website][4] and download the 64 bit .rpm file. Once downloaded run the following command to install the browser:

    sudo zypper install /PATH_OF_GOOGLE_CHROME.rpm

### 5. Install Nvidia drivers ###

OpenSUSE Leap will work out of the box even if you have Nvidia or ATI graphics cards. However, if you do need the proprietary drivers for gaming or any other purpose, you can install such drivers, but some extra work is needed.

First you need to add the Nvidia repositories; it's the same procedure we used to add Packman repositories using YaST. The only difference is that you will choose Nvidia from the Community Repositories section. Once it's added, go to **Software Management > Extras** and select 'Extras/Install All Matching Recommended Packages'.

![o42 nvidia](http://images.techhive.com/images/article/2015/11/o42-nvidia-100626950-large.idge.png)

It will open a dialogue box showing all the packages it's going to install, click OK and follow the instructions. You can also run the following command after adding the Nvidia repository to install the needed Nvidia drivers:

    sudo zypper inr

(Note: I have never used AMD/ATI cards so I have no experience with them.)

### 6. Install media codecs ###

Once you have VLC installed you won't need to install media codecs, but if you are using other apps for media playback you will need to install such codecs. Some developers have written scripts/tools which makes it a much easier process. Just go to [this page][5] and install the entire pack by clicking on the appropriate button. It will open YaST and install the packages automatically (of source you will have to give the root password and trust the GnuPG key, as usual).

### 7. Install your preferred email client ###

OpenSUSE comes with Kmail or Evolution, depending on the Desktop Environment you installed on the system. I run Plasma, which comes with Kmail, and this email client leaves a lot to be desired.  I suggest trying Thunderbird or Evolution mail. All major email clients are available through official repositories. You can also check my [handpicked list of the best email clients for Linux][7].

### 8. Enable Samba services from Firewall ###

OpenSUSE offers a much more secure system out of the box, compared to other distributions. But it also requires a little bit more work for a new user. If you are using Samba protocol to share files within your local network then you will have to allow that service from the Firewall.

![o42 firewall](http://images.techhive.com/images/article/2015/11/o42-firewall-100626948-large970.idge.png)
Allow Samba Client and Server from Firewall settings.

Open YaST and search for Firewall. Once in Firewall settings, go to 'Allowed Services' where you will see a drop down list under 'Service to allow.' Select 'Samba Client,' then click 'Add.' Do the same with the 'Samba Server' option. Once both are added, click 'Next,' then click 'Finish,' and now you will be able to share folders from your openSUSE system and also access other machines over the local network.

That's pretty much all that I did on my new openSUSE system to set it up just the way I like it. If you have any questions, please feel free to ask in the comments below. 

--------------------------------------------------------------------------------

via: http://www.itworld.com/article/3003865/open-source-tools/8-things-to-do-after-installing-opensuse-leap-421.html

作者：[Swapnil Bhartiya][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.itworld.com/author/Swapnil-Bhartiya/
[1]:https://www.flickr.com/photos/mtaphotos/11200079265/
[2]:https://www.linux.com/news/software/applications/865760-opensuse-leap-421-review-the-most-mature-linux-distribution
[3]:https://www.linux.com/learn/tutorials/857788-how-to-convert-videos-in-linux-using-the-command-line
[4]:https://www.google.com/intl/en/chrome/browser/desktop/index.html#brand=CHMB&utm_campaign=en&utm_source=en-ha-na-us-sk&utm_medium=ha
[5]:http://opensuse-community.org/
[6]:http://www.itworld.com/article/2875981/the-5-best-open-source-email-clients-for-linux.html
