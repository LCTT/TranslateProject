HOW TO INSTALL AND REMOVE SOFTWARE IN UBUNTU [COMPLETE GUIDE]
============================================================

 ![Complete guide for installing and removing applications in Ubuntu](https://itsfoss.com/wp-content/uploads/2016/12/Managing-Software-in-Ubuntu-1.jpg) 

_Brief: This detailed guide shows you various ways to install software_ _in Ubuntu Linux and it also demonstrates how to remove installed software in Ubuntu._

When you [switch to Linux][14], the experience could be overwhelming at the start. Even the basic things like installing applications in Ubuntu could seem confusing.

Don’t worry. Linux provides so many ways to do the same task that it is only natural that you may seem lost, at least in the beginning. You are not alone. We have all been to that stage.

In this beginner’s guide, I’ll show most popular ways to install software in Ubuntu. I’ll also show you how to uninstall the software you had installed earlier.

I’ll also provide my recommendation about which method you should be using for installing software in Ubuntu. Sit tight and pay attention. This is a long article, a detailed one which is surely going to add to your knowledge.

### INSTALLING AND UNINSTALLING SOFTWARE IN UBUNTU

I am using Ubuntu 16.04 running with Unity desktop environment in this guide. Apart from a couple of screenshots, this guide is applicable to all other flavors of Ubuntu.

### 1.1 INSTALL SOFTWARE USING UBUNTU SOFTWARE CENTER [RECOMMENDED]

The easiest and most convenient way to find and install software in Ubuntu is by using Ubuntu Software Center. In Ubuntu Unity, you can search for Ubuntu Software Center in Dash and click on it to open it:

[
 ![Run Ubuntu Software Center](https://itsfoss.com/wp-content/uploads/2016/12/Ubuntu-Software-Center.png) 
][15]


You can think of Ubuntu Software Center as Google’s Play Store or Apple’s App Store. It showcases all the software available for your Ubuntu system. You can either search for an application by its name or just browse through various categories of software. You can also opt for the editor’s pick. Your choice mainly.

 ![Installing software in Ubuntu using Ubuntu Software Center](https://itsfoss.com/wp-content/uploads/2016/12/install-software-Ubuntu-linux.jpeg) 

Once you have found the application you are looking for, simply click on it. This will open a page inside Software Center with a description of the application. You can read the description, see its raiting and also read reviews. You can also write a review if you want.

Once you are convinced that you want the application, you can click on the install button to install the selected application. You’ll have to enter your password in order to install applications in Ubuntu.

[
 ![Installing software in Ubuntu: The easy way](https://itsfoss.com/wp-content/uploads/2016/12/install-software-Ubuntu-linux-1.jpg) 
][16]

Can it be any easier than this? I doubt that.

Tip: As I had mentioned in [things to do after installing Ubuntu 16.04][17], you should enable Canonical partner repository. By default, Ubuntu provides only those softwares that come from its own repository (verified by Ubuntu).

But there is also a Canonical Partner repository which is not directly controlled by Ubuntu and includes closed source proprietary software. Enabling this repository gives you access to more software. [Installing Skype in Ubuntu][18] is achieved by this method.

In Unity Dash, look for Software & Updates.

[
 ![Ubuntu Software Update Settings](https://itsfoss.com/wp-content/uploads/2014/08/Software_Update_Ubuntu.jpeg) 
][19]

And in here, under Other Software tab, check the options of Canonical Partners.

[
 ![Enable Canonical partners in Ubuntu 14.04](https://itsfoss.com/wp-content/uploads/2014/04/Enable_Canonical_Partner.jpeg) 
][20]



### 1.2 REMOVE SOFTWARE USING UBUNTU SOFTWARE CENTER [RECOMMENDED]

We just saw how to install software using Ubuntu Software Center. How about removing software that you had installed using this method?

Uninstalling software with Ubuntu Software Center is as easy as the installation process itself.

Open the Software Center and click on the Installed tab. It will show you all the installed software. Alternatively, you can just search for the application by its name.

To remove the application from Ubuntu, simply click on Remove button. Again you will have to provide your password here.

[
 ![Uninstall software installed in Ubuntu](https://itsfoss.com/wp-content/uploads/2016/12/Uninstall-Software-Ubuntu.jpeg) 
][22]

### 2.1 INSTALL SOFTWARE IN UBUNTU USING .DEB FILES

.deb files are similar to the .exe files in Windows. This is an easy way to provide software installation. Many software vendors provide their software in .deb format. Google Chrome is such an example.

You can download .deb file from the official website.

[
 ![Downloading deb packaging](https://itsfoss.com/wp-content/uploads/2016/12/install-software-deb-package.png) 
][23]

Once you have downloaded the .deb file, just double click on it to run it. It will open in Ubuntu Software Center and you can install it in the same way as we saw in section 1.1.

Alternatively, you can use a lightweight program [Gdebi to install .deb files in Ubuntu][24].

Once you have installed the software, you are free to delete the downloaded .deb file.

Tip: A few things to keep in mind while dealing with .deb file.

*   Make sure that you are downloading the .deb file from the official source. Only rely on the official website or GitHub pages.
*   Make sure that you are downloading the .deb file for correct system type (32 bit or 64 bit). Read our quick guide to [know if your Ubuntu system is 32 bit or 64 bit][8].

### 2.2 REMOVE SOFTWARE THAT WAS INSTALLED USING .DEB

Removing software that was installed by a .deb file is the same as we saw earlier in section 1.2\. Just go to Ubuntu Software Center, search for the application name and click on remove to uninstall it.

Alternatively, you can use [Synaptic Package Manager][25]. Not necessarily but this may happen that the installed application is not visible in Ubuntu Software Center. Synaptic Package Manager is lists all the software that are available for your system and all the software that are already installed on your system.This is a very powerful and very useful tool.

This is a very powerful and very useful tool. Before Ubuntu Software Center came into existence to provide a more user-friendly approach to software installation, Synaptic was the default program for installing and uninstalling software in Ubuntu.

You can install Synaptic package manager by clicking on the link below (it will open Ubuntu Software Center).

[Install Synaptic Package Manager][26]

Open Synaptic Manager and then search for the software you want to uninstall. Installed softwares are marked with a green button. Click on it and select “mark for removal”. Once you do that, click on “apply” to remove the selected software.

[
 ![Using Synaptic to remove software in Ubuntu](https://itsfoss.com/wp-content/uploads/2016/12/uninstall-software-ubuntu-synaptic.jpeg) 
][27]

### 3.1 INSTALL SOFTWARE IN UBUNTU USING APT COMMANDS [RECOMMENDED]

You might have noticed a number of websites giving you a command like “sudo apt-get install” to install software in Ubuntu.

This is actually the command line equivalent of what we saw in section 1\. Basically, instead of using the graphical interface of Ubuntu Software Center, you are using the command line interface. Nothing else changes.

Using the apt-get command to install software is extremely easy. All you need to do is to use a command like:

```
sudo apt-get install package_name
```

Here sudo gives ‘admin’ or ‘root’ (in Linux term) privileges. You can replace package_name with the desired software name.

apt-get commands have auto-completion so if you type a few letters and hit tab, it will provide all the programs matching with those letters.

### 3.2 REMOVE SOFTWARE IN UBUNTU USING APT COMMANDS [RECOMMENDED]

You can easily remove softwares that were installed using Ubuntu Software Center, apt command or .deb file using the command line.

All you have to do is to use the following command, just replace the package_name with the software name you want to delete.

```
sudo apt-get remove package_name
```

Here again, you can benefit from auto completion by pressing the tab key.

Using apt-get commands is not rocket science. This is in fact very convenient. With these simple commands, you get acquainted with the command line part of Ubuntu Linux and it does help in long run. I recommend reading my detailed [guide on using apt-get commands][28] to learn in detail about it.

[Suggested ReadUsing apt-get Commands In Linux [Complete Beginners Guide]][29]

### 4.1 INSTALL APPLICATIONS IN UBUNTU USING PPA

PPA stands for [Personal Package Archive][30]. This is another way that developers use to provide their software to Ubuntu users.

In section 1, you came across a term called ‘repository’. Repository basically contains a collection of software. Ubuntu’s official repository has the softwares that are approved by Ubuntu. Canonical partner repository contains the softwares from partnered vendors.

In the same way, PPA enables a developer to create its own APT repository. When an end user (i.e you) adds this repository to the system (sources.list is modified with this entry), software provided by the developer in his/her repository becomes available for the user.

Now you may ask what’s the need of PPA when we already have the official Ubuntu repository?

The answer is that not all software automatically get added to Ubuntu’s official repository. Only the trusted software make it to that list. Imagine that you developed a cool Linux application and you want to provide regular updates to your users but it will take months before it could be added to Ubuntu’s repository (if it could). PPA comes handy in those cases.

Apart from that, Ubuntu’s official repository often doesn’t include the latest version of a software. This is done to secure the stability of the Ubuntu system. A brand new software version might have a [regression][31] that could impact the system. This is why it takes some time before a new version makes it to the official repository, sometimes it takes months.

But what if you do not want to wait till the latest version comes to the Ubuntu’s official repository? This is where PPA saves your day. By using PPA, you get the newer version.

Typically PPA are used in three commands. First to add the PPA repository to the sources list. Second to update the cache of software list so that your system could be aware of the new available software. And third to install the software from the PPA.

I’ll show you an example by using [Numix theme][32] PPA:

```
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle
```

In the above example, we added a PPA provided [Numix project][33]. And after updating the software information, we add two programs available in Numix PPA.

If you want a GUI application, you can use [Y-PPA application][34]. It lets you search for PPA, add and remove software in a better way.

Tip: Security of PPA has often debated. My advice is that you should add PPA from a trusted source, preferably from the official sources.

### 4.2 REMOVE APPLICATIONS INSTALLED USING PPA

I have discussed [removing PPA in Ubuntu][35] in detail earlier. You should refer to that article to get more insights about handling PPA removal.

To quickly discuss it here, you can use the following two commands.

```
sudo apt-get remove numix-gtk-theme numix-icon-theme-circle
```

```
sudo add-apt-repository --remove ppa:numix/ppa
```

First command removes the software installed via the PPA. Second command removes the PPA from sources.list.

### 5.1 INSTALLING SOFTWARE USING SOURCE CODE IN UBUNTU LINUX [NOT RECOMMENDED]

Installing a software using the [source code][36] is not something I would recommend to you. It’s tedious, troublesome and not very convenient. You’ll have to fight your way through dependencies and what not. You’ll have to keep the source code files else you won’t be able to uninstall it later.

But building from source code is still liked by a few, even if they are not developing software of their own. To tell you the truth, last I used source code extensively was 5 years ago when I was an intern and I had to develop a software in Ubuntu. I have preferred the other ways to install applications in Ubuntu since then. For normal desktop Linux user, installing from source code should be best avoided.

I’ll be short in this section and just list out the steps to install a software from source code:

*   Download the source code of the program you want to install.
*   Extract the downloaded file.
*   Go to extracted directory and look for a README or INSTALL file. A well-developed software may include such a file to provide installation and/or removal instructions.
*   Look for a file called configure. If it’s present, run the file using the command: ./configure This will check if your system has all the required softwares (called ‘dependencies’ in software term) to install the program. Note that not all software include configure file which is, in my opinion, bad development practice.
*   If configure notifies you of missing dependencies, install them.
*   Once you have everything, use the command make to compile the program.
*   Once the program is compiled, run the command sudo make install to install the software.

Do note that some softwares provide you with an install script and just running that files will install the software for you. But you won’t be that lucky most of the time.

Also note that the program you installed using this way won’t be updated automatically like programs installed from Ubuntu’s repository or PPAs or .deb.

I recommend reading this detailed article on [using the source code in Ubuntu][37] if you insist on using source code.

### 5.2 REMOVING SOFTWARE INSTALLED USING SOURCE CODE [NOT RECOMMENDED]

If you thought installing software from source code was difficult, think again. Removing the software installed using source code could be a bigger pain.

*   First, you should not delete the source code you used to install the program.
*   Second, you should make sure at the installation time that there is a way to uninstall the program. A badly configured program might not provide a way to uninstall the program and then you’ll have to manually remove all the files installed by the software.

Normally, you should be able to uninstall the program by going to its extracted directory and using this command:

```
sudo make uninstall
```

But this is not a guarantee that you’ll get this uninstall all the time.

You see, there are lots of ifs and buts attached with source code and not that many advantages. This is the reason why I do not recommend using the source code to install the software in Ubuntu.

### FEW MORE WAYS TO INSTALL APPLICATIONS IN UBUNTU

There are a few more (not so popular) ways you can install software in Ubuntu. Since this article is already way too long, I won’t cover them. I am just going to list them here:

*   Ubuntu’s new [Snap packaging][9].
*   [dpkg][10] commands
*   [AppImage][11]
*   [pip][12] : used for installing Python based programs

### HOW DO YOU INSTALL APPLICATIONS IN UBUNTU?

If you have already been using Ubuntu, what’s your favorite way to install software in Ubuntu Linux? Did you find this guide useful? Do share your views, suggestions and questions.

--------------------

作者简介：
![](https://secure.gravatar.com/avatar/20749c268f5d3e4d2c785499eb6a17c0?s=70&d=mm&r=g)

I am Abhishek Prakash, 'creator' of It's F.O.S.S. Working as a software professional. I am an avid Linux lover and Open Source enthusiast. I use Ubuntu and believe in sharing knowledge. Apart from Linux, I love classic detective mystery. Huge fan of Agatha Christie work.

--------------------------------------------------------------------------------

via: https://itsfoss.com/remove-install-software-ubuntu/

作者：[ABHISHEK PRAKASH][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/author/abhishek/
[2]:https://itsfoss.com/remove-install-software-ubuntu/#comments
[3]:http://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Fremove-install-software-ubuntu%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[4]:https://twitter.com/share?original_referer=/&text=How+To+Install+And+Remove+Software+In+Ubuntu+%5BComplete+Guide%5D&url=https://itsfoss.com/remove-install-software-ubuntu/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=abhishek_pc
[5]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Fremove-install-software-ubuntu%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[6]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Fremove-install-software-ubuntu%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[7]:https://www.reddit.com/submit?url=https://itsfoss.com/remove-install-software-ubuntu/&title=How+To+Install+And+Remove+Software+In+Ubuntu+%5BComplete+Guide%5D
[8]:https://itsfoss.com/32-bit-64-bit-ubuntu/
[9]:https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[10]:https://help.ubuntu.com/lts/serverguide/dpkg.html
[11]:http://appimage.org/
[12]:https://pypi.python.org/pypi/pip
[13]:https://itsfoss.com/remove-install-software-ubuntu/managing-software-in-ubuntu-1/
[14]:https://itsfoss.com/reasons-switch-linux-windows-xp/
[15]:https://itsfoss.com/wp-content/uploads/2016/12/Ubuntu-Software-Center.png
[16]:https://itsfoss.com/remove-install-software-ubuntu/install-software-ubuntu-linux-1/
[17]:https://itsfoss.com/things-to-do-after-installing-ubuntu-16-04/
[18]:https://itsfoss.com/install-skype-ubuntu-1404/
[19]:https://itsfoss.com/ubuntu-notify-updates-frequently/software_update_ubuntu/
[20]:https://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/enable_canonical_partner/
[21]:https://itsfoss.com/essential-linux-applications/
[22]:https://itsfoss.com/remove-install-software-ubuntu/uninstall-software-ubuntu/
[23]:https://itsfoss.com/remove-install-software-ubuntu/install-software-deb-package/
[24]:https://itsfoss.com/gdebi-default-ubuntu-software-center/
[25]:http://www.nongnu.org/synaptic/
[26]:apt://synaptic
[27]:https://itsfoss.com/remove-install-software-ubuntu/uninstall-software-ubuntu-synaptic/
[28]:https://itsfoss.com/apt-get-linux-guide/
[29]:https://itsfoss.com/apt-get-linux-guide/
[30]:https://help.launchpad.net/Packaging/PPA
[31]:https://en.wikipedia.org/wiki/Software_regression
[32]:https://itsfoss.com/install-numix-ubuntu/
[33]:https://numixproject.org/
[34]:https://itsfoss.com/easily-manage-ppas-ubuntu-1310-ppa-manager/
[35]:https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[36]:https://en.wikipedia.org/wiki/Source_code
[37]:http://www.howtogeek.com/105413/how-to-compile-and-install-from-source-on-ubuntu/
