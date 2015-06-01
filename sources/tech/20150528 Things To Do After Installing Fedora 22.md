Things To Do After Installing Fedora 22
================================================================================
Fedora 22 the latest entrant in the community developed line of Red hat operating systems is released on the 26th of May 2015. A lot of speculation and anticipation has been associated with this release of the venerable fedora. Well there are some major changes that are being proposed for Fedora 22.

Systemd is the new kid in the block when it comes to initialization daemons, it is poised to replace the venerable sysvinit module that has long been a part of the Linux ecosystem. Another major change that users will come across in the base python version. Its just that python in available in two different flavors the 2.x and 3.x lines. Each has its fair share of quirks and benefits. So users who might prefer the 2.x flavor might want to install their favorite python. The dandified Yum installer that has been around since Fedora 18 is all set to replace the age old YUM installer. Fedora has finally decided that it is time that DNF replace YUM.

### 1) Install VLC media player ###

Fedora 22 comes with a default media player viz. gnome videos (previously known as totem). If that is fine by you we can skip this step and move ahead. However if you like me prefer the most widely used VLC you can go ahead and install it from the RPMFusion repos. You can do that with :

    sudo dnf install vlc -y

### 2) Configure RPMFusion Repos ###

As I already mentioned Fedora is very strict with its ideologies, it does not ship with any non-free components with it. The official repositories does not provide some essential software containing non-free components like multimedia codes. So it is necessary to install some 3rd party repositories which will provide us some essential software. Luckily RPMFusion repositories come to the rescue.

    $ sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-22.noarch.rpm

### 3) Install Multimedia Codecs ###

As is said some multimedia codecs and plugins don't ship with fedora. Now who would like to miss out on their favorite shows and movies just because the codes are proprietary. Try this:

    $ sudo dnf install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1

### 4) Update your system ###

Fedora is a bleeding edge distribution and hence it releases updates which will fix bugs and loopholes present in your system continuously. Hence it is a good practice to keep your system up to date.

    $ sudo dnf update -y

### 5) Uninstall software you may not need ###

Fedora comes with a set of pre-chosen packages that most users can utilize, however for more advanced users, you may recognize that you do not need all of it.  It's easy enough to remove any packages you don't need using the following command - I chose to uninstall rhythmbox because I know I won't use it:

    $ sudo dnf remove rhythmbox

### 6) Install Adobe Flash ###

We all wish Adobe Flash didn't exist anymore since it is not always know for being the most secure or resource efficient, but for awhile it's here to stay.  The only way to install Adobe Flash for Fedora 22 is to install the official RPM from Adobe, as shown below.

You can download the RPM [here][1]. After downloading the file, you can right click and open it like this:

![Install Adobe Flash](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-9.50.42-PM.png)

Right click and select "Open With Software Install"

Then, simply click install on the window that pops up:

![Install Adobe](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-9.51.07-PM.png)

Click on "Install" to complete the process of installing the custom RPM from Adobe

Once the process completes, the "Install" button will change to "Remove" and the installation should have finished.  If your browser is open during the process, it may ask you to close it first or restart it after the install for the changes to take effect.

### 7) Spin Up a VM with Gnome Boxes ###

So you just installed Fedora and you're loving it, but maybe you need Windows still for something proprietary, or maybe you just want to play with another Linux distro.  In any situation, you can use Gnome Boxes, provided with Fedora 22, to easily create a VM or use a live distribution.  Follow the steps below to get started using an ISO of your choice!  Who knows, maybe you can even check out a [Fedora Spin][2].

First open Gnome Boxes and select "New" in the top left:

![Add a new virtual machine (box)](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-10.24.46-PM.png)

Click "New" to start the process of adding a new virtual machine.

Next, click to open a file and choose an ISO:

![Choose ISO](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-10.28.44-PM.png)

After choosing to select a file or ISO, select your ISO. In this case, I had a Debian ISO I installed

Finally, customize the VM settings or use the defaults and click "Create."  The VM will start by default and the available VMs will be available in Gnome Boxes as little thumbnails.

![Create VM](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-10.31.11-PM.png)

Customize the settings to whatever you choose, or keep the defaults. Click "Create" when you are done and the VM will be ready to go.

### 8) Install Google Chrome ###

Firefox is included with Fedora 22, but as with most software, everyone has their browser of choice.  If yours happens to be Google Chrome, you can follow the instructions above for Adobe Flash player, however, obviously use the RPM from Google for whichever version of Chrome you download. The latest version can usually be found [here][3].

### 9) Add Social Media and Other Online Accounts ###

Gnome has some nice built in functionality to accommodate accounts for things like Facebook, Google, and other online accounts.  You can access the Online Accounts settings through the main Gnome Settings application.  You can access the settings by right clicking on the desktop or by finding it in the applications.  Then, simply click on Online Accounts and add the accounts of your choosing.  If you add an account like Google, for example, you can use it as the default for things like sending email, calendar appointments, interacting with photos and documents, and more.

### 10) Install KDE or another Desktop Environment ###

Some of us just don't like Gnome, and that's okay.  Run the following command in Terminal to install everything necessary to use KDE instead.  The same instructions can be applied to xfce, lxde, or other desktop environments as well.

    $ sudo dnf install @kde-desktop

After the install finishes, log out.  When you click on your username, notice the little gear wheel that indicates settings.  Click it and select "Plasma."  When you log in again, you will be greeted by a fresh KDE desktop.

![Plasma on Fedora 22](http://blog.linoxide.com/wp-content/uploads/2015/05/Screen-Shot-2015-05-27-at-11.32.27-PM.png)

The Plasma environment after just installing it on Fedora 22

### Conclusion ###

That’s it you are all set to go. Use the system and try out things. If you don't find something according to your liking, linux gives you the freedom to change them. Fedora comes with the latest Gnome shell as its desktop environment, too heavy for you and don't like it. Try KDE or some light weight DE like cinnamon, xfce etc. Wish you a very happy and hassle free Fedora experience. !!

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/things-do-after-installing-fedora-22/

作者：[Jonathan DeMasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/jonathande/
[1]:https://get.adobe.com/flashplayer/
[2]:http://spins.fedoraproject.org/
[3]:https://www.google.com/intl/en/chrome/browser/desktop/index.html