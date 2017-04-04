Remmina – A Feature Rich Remote Desktop Sharing Tool for Linux
============================================================



Remmina is a is free and open-source, feature-rich and powerful remote desktop client for Linux and other Unix-like systems, written in GTK+3\. It’s intended for system administrators and travelers, who need to remotely access and work with many computers.

It supports several network protocols in a simple, unified, homogeneous and easy-to-use user interface.

#### Remmina Features

*   Supports RDP, VNC, NX, XDMCP and SSH.
*   Enables users to maintain a list of connection profiles, organized by groups.
*   Supports quick connections by users directly putting in the server address.
*   Remote desktops with higher resolutions are scrollable/scalable in both window and fullscreen mode.
*   Supports viewport fullscreen mode; here the remote desktop automatically scrolls when the mouse moves over the screen edge.
*   Also supports floating toolbar in fullscreen mode; enables you to switch between modes, toggle keyboard grabbing, minimize and beyond.
*   Offers tabbed interface, optionally managed by groups.
*   Also offers tray icon, allows you to quickly access configured connection profiles.

In this article, we will show you how to install and use Remmina with a few supported protocols in Linux for desktop sharing.

#### Prerequisites

*   Allow desktop sharing in remote machines (enable remote machines to permit remote connections).
*   Setup SSH services on the remote machines.

### How to Install Remmina Desktop Sharing Tool in Linux

Remmina and its plugin packages are already provided in the official repositories of the all if not most of the mainstream Linux distributions. Run the commands below to install it with all supported plugins:

```
------------ On Debian/Ubuntu ------------ 
$ sudo apt-get install remmina remmina-plugin-*
```

```
------------ On CentOS/RHEL ------------ 
# yum install remmina remmina-plugin-*
```

```
------------ On Fedora 22+ ------------ 
$ sudo dnf copr enable hubbitus/remmina-next
$ sudo dnf upgrade --refresh 'remmina*' 'freerdp*'
```

Once you have installed it, search for remmina in the Ubuntu Dash or Linux Mint Menu, then launch it:

[
 ![Remmina Desktop Sharing Client](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Desktop-Sharing-Client.png) 
][1]

Remmina Desktop Sharing Client

You can perform any configurations via the graphical interface or by editing the files under `$HOME/.remmina` or `$HOME/.config/remmina`.

To setup a new connection to a remote server press `[Ctrl+N]` or go to Connection -> New, configure the remote connection profile as shown in the screenshot below. This is the basic settings interface.

[
 ![Remmina Basic Desktop Preferences](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Basic-Desktop-Preferences.png) 
][2]

Remmina Basic Desktop Preferences

Click on Advanced from the interface above to configure advanced connection settings.

[
 ![Remmina Advance Desktop Settings](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Advance-Desktop-Settings.png) 
][3]

Remmina Advance Desktop Settings

To configure SSH settings, click on the SSH from the profile interface above.

[
 ![Remmina SSH Settings](http://www.tecmint.com/wp-content/uploads/2017/03/ssh-remote-desktop-preferences.png) 
][4]

Remmina SSH Settings

Once you have configured all the necessary settings, save the settings by clicking on Save button and from the main interface, you’ll be able to view all your configured remote connection profiles as shown below.

[
 ![Remmina Configured Servers](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Configured-Servers.png) 
][5]

Remmina Configured Servers

#### Connecting to Remote Machine Using sFTP

Choose the connection profile and edit the settings, choose SFTP – Secure File Transfer from the Protocols down menu. Then set a startup path (optional) and specify the SSH authentication details. Lastly, click Connect.

[
 ![Remmina sftp Connection](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-sftp-connection.png) 
][6]

Remmina sftp Connection

Enter your SSH user password here.

[
 ![Enter SSH Password](http://www.tecmint.com/wp-content/uploads/2017/03/enter-userpasswd.png) 
][7]

Enter SSH Password

If you see the interface below, then the SFTP connection is successful, you can now [transfer files between your machines][8].

[
 ![Remmina Remote sFTP Filesystem](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-sFTP-Filesystem.png) 
][9]

Remmina Remote sFTP Filesystem

#### Connect to Remote Machine Using SSH

Select the connection profile and edit the settings, then choose SSH – Secure Shell from the Protocolsdown menu and optionally set a startup program and SSH authentication details. Lastly, click Connect, and enter the user SSH password.

[
 ![Remmina SSH Connection](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-SSH-Connection.png) 
][10]

Remmina SSH Connection

When you see the interface below, it means your connection is successful, you can now control the remote machine using SSH.

[
 ![Remmina Remote SSH Connection](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-SSH-Connection.png) 
][11]

Remmina Remote SSH Connection

#### Connect to Remote Machine Using VNC

Choose the connection profile from the list and edit the settings, then select VNC – Virtual Network Computing from the Protocols down menu. Configure basic, advanced and ssh settings for the connection and click Connect, then enter the user SSH password.

[
 ![Remmina VNC Connection](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-VNC-Connection.png) 
][12]

Remmina VNC Connection

Once you see the following interface, it implies that you have successfully connected to the remote machine using VNC protocol.

Enter the user login password from the desktop login interface as shown in the screenshot below.

[
 ![Remmina Remote Desktop Login](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-Desktop-Login.png) 
][13]

Remmina Remote Desktop Login

[
 ![Remmina Remote Desktop Sharing](http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-Desktop-Sharing.png) 
][14]

Remmina Remote Desktop Sharing

Simply follow the steps above to use the other remaining protocols to access remote machines, it’s that simple.

Remmina Homepage: [https://www.remmina.org/wp/][15]

That’s all! In this article, we showed you how to install and use Remmina remote connection client with a few supported protocols in Linux. You can share any thoughts in the comments via the feedback form below.

--------------------------------------------------------------------------------
作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/remmina-remote-desktop-sharing-and-ssh-client/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Desktop-Sharing-Client.png
[2]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Basic-Desktop-Preferences.png
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Advance-Desktop-Settings.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/ssh-remote-desktop-preferences.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Configured-Servers.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-sftp-connection.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/enter-userpasswd.png
[8]:http://www.tecmint.com/sftp-upload-download-directory-in-linux/
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-sFTP-Filesystem.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-SSH-Connection.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-SSH-Connection.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-VNC-Connection.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-Desktop-Login.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/03/Remmina-Remote-Desktop-Sharing.png
[15]:https://www.remmina.org/wp/
[16]:http://www.tecmint.com/author/aaronkili/
[17]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[18]:http://www.tecmint.com/free-linux-shell-scripting-books/
