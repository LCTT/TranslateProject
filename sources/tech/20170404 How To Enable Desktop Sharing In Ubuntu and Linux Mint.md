How To Enable Desktop Sharing In Ubuntu and Linux Mint
============================================================


Desktop sharing refers to technologies that enable remote access and remote collaboration on a computer desktop via a graphical terminal emulator. Desktop sharing allows two or more Internet-enabled computer users to work on the same files from different locations.

In this article, we will show you how to enable desktop sharing in Ubuntu and Linux Mint, with a few vital security features.

### Enabling Desktop Sharing in Ubuntu and Linux Mint

1. In the Ubuntu Dash or Linux Mint Menu, search for “desktop sharing” as shown in the following screenshot, once you get it, launch it.

[
 ![Search for Desktop Sharing in Ubuntu](http://www.tecmint.com/wp-content/uploads/2017/03/search-for-desktop-sharing.png) 
][1]

Search for Desktop Sharing in Ubuntu

2. Once you launch Desktop sharing, there are three categories of desktop sharing settings: sharing, security and notification settings.

Under sharing, check the option “Allow others users to view your desktop” to enable desktop sharing. Optionally, you can also permit other users to remotely control your desktops by checking the option “Allow others users to control your desktop”.

[
 ![Desktop Sharing Preferences](http://www.tecmint.com/wp-content/uploads/2017/03/desktop-sharing-settings-inte.png) 
][2]

Desktop Sharing Preferences

3. Next in security section, you can choose to manually confirm each remote connection by checking the option “You must confirm each access to this computer”.

Again, another useful security feature is creating a certain shared password using the option “Require user to enter this password”, that remote users must know and enter each time they want to access your desktop.

4. Concerning notifications, you can keep an eye on remote connections by choosing to show the notification area icon each time there is a remote connection to your desktops by selecting “Only when someone is connected”.

[
 ![Configure Desktop Sharing Set](http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Desktop-Sharing-Set.png) 
][3]

Configure Desktop Sharing Set

When you have set all the desktop sharing options, click Close. Now you have successfully permitted desktop sharing on your Ubuntu or Linux Mint desktop.

### Testing Desktop Sharing in Ubuntu Remotely

You can test to ensure that it’s working using a remote connection application. In this example, I will show you how some of the options we set above work.

5. I will connect to my Ubuntu PC using VNC (Virtual Network Computing) protocol via [remmina remote connection application][4].

[
 ![Remmina Desktop Sharing Tool](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Desktop-Sharing-Tool.png) 
][5]

Remmina Desktop Sharing Tool

6. After clicking on Ubuntu PC item, I get the interface below to configure my connection settings.

[
 ![Remmina Desktop Sharing Preferences](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Configure-Remote-Desk.png) 
][6]

Remmina Desktop Sharing Preferences

7. After performing all the settings, I will click Connect. Then provide the SSH password for the username and click OK.

[
 ![Enter SSH User Password](http://www.tecmint.com/wp-content/uploads/2017/03/shared-pass.png) 
][7]

Enter SSH User Password

I have got this black screen after clicking OK because, on the remote machine, the connection has not been confirmed yet.

[
 ![Black Screen Before Confirmation](http://www.tecmint.com/wp-content/uploads/2017/03/black-screen-before-confirmat.png) 
][8]

Black Screen Before Confirmation

8. Now on the remote machine, I have to accept the remote access request by clicking on “Allow” as shown in the next screenshot.

[
 ![Allow Remote Desktop Sharing](http://www.tecmint.com/wp-content/uploads/2017/03/accept-remote-access-request.png) 
][9]

Allow Remote Desktop Sharing

9. After accepting the request, I have successfully connected, remotely to my Ubuntu desktop machine.

[
 ![Remote Ubuntu Desktop](http://www.tecmint.com/wp-content/uploads/2017/03/successfully-connected-to-rem.png) 
][10]

Remote Ubuntu Desktop

That’s it! In this article, we described how to enable desktop sharing in Ubuntu and Linux Mint. Use the comment section below to write back to us.

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/enable-desktop-sharing-in-ubuntu-linux-mint/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/wp-content/uploads/2017/03/search-for-desktop-sharing.png
[2]:http://www.tecmint.com/wp-content/uploads/2017/03/desktop-sharing-settings-inte.png
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Desktop-Sharing-Set.png
[4]:http://www.tecmint.com/remmina-remote-desktop-sharing-and-ssh-client
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Desktop-Sharing-Tool.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Configure-Remote-Desk.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/shared-pass.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/black-screen-before-confirmat.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/accept-remote-access-request.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/successfully-connected-to-rem.png
[11]:http://www.tecmint.com/author/aaronkili/
[12]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[13]:http://www.tecmint.com/free-linux-shell-scripting-books/
