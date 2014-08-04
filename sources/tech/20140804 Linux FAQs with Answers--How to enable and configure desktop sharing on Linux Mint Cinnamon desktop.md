Linux FAQs with Answers--How to enable and configure desktop sharing on Linux Mint Cinnamon desktop
================================================================================
> **Question**: I was trying to enable desktop sharing via Vino VNC server (vino-server) on Linux Mint 17 Cinnamon desktop. However, I notice that vino-preferences tool which allows us to configure vino-server (e.g., sharing option, security, notification on/off) no longer exists. Also, I cannot find desktop sharing menu on Cinnamon desktop. How can I configure desktop sharing via vino-server on the latest Linux Mint 17 Cinnamon desktop? 

The latest Linux Mint Cinnamon desktop comes with vino-server pre-installed for VNC desktop sharing, but it's reported that desktop sharing configuration menu is missing.

An alternative way to configure vino-server and enable desktop sharing is to use dconf-editor's graphical interface.

First install dconf-editor:

    $ sudo apt-get install dconf-editor

Launch dconf-editor.

    $ dconf-editor

Navigate to "org->gnome->desktop->remote-access" on the left panel of dconf-editor. Then you will see various desktop sharing options.

![](https://farm4.staticflickr.com/3916/14843965473_e68598b01b_z.jpg)

Most importantly, click on "enabled" to activate desktop remote access. Besides this, you can customize other options.

For example, you can enable VNC password authentication by changing the following fields:

- **authentication-methods**: set it to ['vnc']
- **vnc-password**: change it to Base64-encoded string of a preferred password. 

In this example, we choose VNC password as "password", and its Base64-encoded string is "cGFzc3dvcmQ=".

Optionally, you can enable other options:

- notify-on-connect: shows a desktop notification when vino-server receives a connection request.
- prompt-enabled: a remote user is not allowed to access a desktop via VNC until the VNC request is approved by the desktop owner. 

### Troubleshoot ###

1. I am getting the following error when attempting to start vino-server.

    ** (vino-server:4280): WARNING **: The desktop sharing service is not enabled, so it should not be run.

To enable desktop sharing service, use dconf-editor as described above. Alternatively, run the following command.

     # gsettings set org.gnome.Vino enabled true 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/enable-configure-desktop-sharing-linux-mint-cinnamon-desktop.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出