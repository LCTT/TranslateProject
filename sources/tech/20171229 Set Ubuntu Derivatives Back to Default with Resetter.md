translating by stevenzdg988

Set Ubuntu Derivatives Back to Default with Resetter
======
How many times have you dived deep into Ubuntu (or a Ubuntu derivative), configuring things and installing software, only to find that your desktop (or server) platform isn't exactly what you wanted. This situation can be problematic when you already have all of your user files on the machine. In this case, you have a choice, you can either back up all your data, reinstall the operating system, and copy your data back onto the machine, or you can give a tool like [Resetter][1] a go.

Resetter is a new tool (written by Canadian developer that goes by the name "[gaining][2]"), written in Python and pyqt, that will reset Ubuntu, Linux Mint (and a few other, Ubuntu-based distributions) back to stock configurations. Resetter offers two different reset options: Automatic and Custom. With the Automatic option, the tool will:

  * Remove user-installed apps

  * Delete users and home directories

  * Create default backup user

  * Auto install missing pre-installed apps (MPIAs)

  * Remove non-default users

  * Remove snap packages




The Custom option will:

  * Remove user-installed apps or allow you to select which apps to remove

  * Remove  old kernels

  * Allow you to choose users to delete

  * Delete users and home directories

  * Create default backup user

  * Allow you to create custom backup user

  * Auto install MPIAs or chose which MPIAs to install

  * Remove non-default users

  * View all dependent packages

  * Remove snap packages




I'm going to walk you through the process of installing and using Resetter. However, I must tell you that this tool is very much in beta. Even so, resetter is definitely worth a go. In fact, I would encourage you to test the app and submit bug reports (you can either submit them via [GitHub][3] or send them directly to the developer's email address, [gaining7@outlook.com][4]).

It should also be noted that, at the moment, the only supported distributions are:

  * Debian 9.2 (stable) Gnome edition

  * Linux Mint 17.3+ (support for mint 18.3 coming soon)

  * Ubuntu 14.04+ (Although I found 17.10 not supported)

  * Elementary OS 0.4+

  * Linux Deepin 15.4+




With that said, let's install and use Resetter. I'll be demonstrating on [Elementary OS Loki][5].

### Installation

There are a couple of ways to install Resetter. The method I chose is by way of the gdebi helper app. Why? Because it will pick up all the necessary dependencies for installation. First, we must install that particular tool. Open up a terminal window and issue the command:
```
sudo apt install gdebi
```

Once that is installed, point your browser to the [Resetter Download Page][6] and download the most recent version of the software. Once it has downloaded, open up the file manager, navigate to the downloaded file, and click (or double-click, depending on how you've configured your desktop) on the resetter_XXX-stable_all.deb file (where XXX is the release number). The gdebi app will open (Figure 1). Click on the Install Package button, type your sudo password, and Resetter will install.

## [resetter_1.jpg][7]

![gdebi][8]

Figure 1: Installing Resetter with gdebi.

[Used with permission][9]

Once Resetter is installed, you're ready to go.

### Using Resetter

Remember, before you do this, you must back up your data. You've been warned.

From your terminal window, issue the command sudo resetter. You'll be prompted for your sudo password. Once Resetter opens, it will automatically detect your distribution (Figure 2).

## [resetter_2.jpg][10]

![Resetter][11]

Figure 2: The Resetter main window.

[Used with permission][9]

We're going to test the Resetter waters by running an automatic reset. From the main window, click Automatic Reset. The app will offer up a clear warning that it is about to reset your operating system (in my case, Elementary OS 0.4.1 Loki) to its factory defaults (Figure 3).

## [resetter_3.jpg][12]

![warning][13]

Figure 3: Resetter warns you before you continue on.

[Used with permission][9]

Once you click Yes, Resetter will display all of the packages it will remove (Figure 4). If you're okay with that, click OK and the reset will begin.

## [resetter_4.jpg][14]

![remove packages][15]

Figure 4: All of the packages to be removed, in order to reset Elementary OS to factory defaults.

[Used with permission][9]

During the reset, the application will display a progress window (Figure 5). Depending upon how much you've installed, the process shouldn't take too long.

## [resetter_5.jpg][16]

![progress][17]

Figure 5: The Resetter progress window.

[Used with permission][9]

When the process completes, Resetter will display a new username and password for you to use, in order to log back into your newly reset distribution (Figure 6).

## [resetter_6.jpg][18]

![new username][19]

Figure 6: New username and password.

[Used with permission][9]

Click OK and then, when prompted, click Yes to reboot the system. Once you are prompted to login, use the new credentials given to you by the Resetter app. After a successful login, you'll need to recreate your original user. That user's home directory will still be intact, so all you need to do is issue the command sudo useradd USERNAME (where USERNAME is the name of the user). Once you've done that, issue the command sudo passwd USERNAME (where USERNAME is the name of the user). With the user/password set, you can log out and log back in as your old user (enjoying the same home directory you had before resetting the operating system).

### My results

I have to confess, after adding the password back to my old user (and testing it by using the su command to change to that user), I was unable to log into the Elementary OS desktop with that user. To solve that problem, I logged in with the Resetter-created user, moved the old user home directory, deleted the old user (with the command sudo deluser jack), and recreated the old user (with the command sudo useradd -m jack).

After doing that, I checked the original home directory, only to find out the ownership had been changed from jack.jack to 1000.1000. That could have been fixed simply by issuing the command sudo chown -R jack.jack /home/jack. The lesson? If you use Resetter and find you cannot log in with your old user (after you've re-created user and given it a new password), make sure to change the ownership of the user's home directory.

Outside of that on issue, Resetter did a great job of taking Elementary OS Loki back to a default state. Although Resetter is in beta, it's a rather impressive tool. Give it a try and see if you don't have the same outstanding results I did.

Learn more about Linux through the free ["Introduction to Linux" ][20]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/12/set-ubuntu-derivatives-back-default-resetter

作者：[Jack Wallen][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://github.com/gaining/Resetter
[2]:https://github.com/gaining
[3]:https://github.com
[4]:mailto:gaining7@outlook.com
[5]:https://elementary.io/
[6]:https://github.com/gaining/Resetter/releases/tag/v1.1.3-stable
[7]:/files/images/resetter1jpg-0
[8]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_1_0.jpg?itok=3c_qrApr (gdebi)
[9]:/licenses/category/used-permission
[10]:/files/images/resetter2jpg
[11]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_2.jpg?itok=bmawiCYJ (Resetter)
[12]:/files/images/resetter3jpg
[13]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_3.jpg?itok=2wlbC3Ue (warning)
[14]:/files/images/resetter4jpg-1
[15]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_4_1.jpg?itok=f2I3noDM (remove packages)
[16]:/files/images/resetter5jpg
[17]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_5.jpg?itok=3FYs5_2S (progress)
[18]:/files/images/resetter6jpg
[19]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/resetter_6.jpg?itok=R9SVZgF1 (new username)
[20]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
