johnhoow translating...
How to Install Lightweight Budgie ( v8) Desktop in Ubuntu 14.04
================================================================================
Budgie is the flagship desktop of the Evolve OS Linux Distribution, and is an Evolve OS project. Designed with the modern user in mind, it focuses on simplicity and elegance. A huge advantage for the Budgie desktop is that it is not a fork of another project, but rather one written from scratch with integration in mind.

The [Budgie Desktop][1] tightly integrates with the GNOME stack, employing underlying technologies to offer an alternative desktop experience. In the spirit of open source, the project is compatible with and available for other Linux distributions.

Also note that Budgie can now emulate the look and feel of the GNOME 2 desktop, optionally, via a setting in the panel preferences.

### Features in the 0.8 release ###

- IconTasklist: Add pinning support
- IconTasklist: Use .desktop files for quicklists
- IconTasklist: Use .desktop files for icon resolution
- IconTasklist: Support “attention” hint (blue blink)
- Panel: Support dark theme (used by default)
- Add Menubar applet
- Panel: Initial autohide support (manual, not automatic)
- Panel: Support shadow onall screen edges
- Panel: Dynamic support for gnome panel theming
- RunDialog: Complete visual refresh (bootiful)
- BudgieMenu: Add compact mode, use by default
- BudgieMenu: Sort items by usage
- BudgieMenu: Remove old power option
- Editor: Add all menu options to UI
- Support from GNOME 3.10 up to 3.16 (unreleased, git)
- wm: Kill workspace animation (resolve after v8)
- wm: Better animations for changing of wallpapers

### Important information ###

- Budgie [released version 0.8][2] so it is still in development and a beta.
- No nnative network management; can be fixed by using Ubuntu's applet.
- Budgie is intended for the Evolve OS so even with this PPA it might be buggy.
- GNOME themes work better than the native Ubuntu themes.
- Ubuntu’s overlay scrollbars are not working.
- If you want to read more visit the Evolve OS website.

### Installation ###

Now, we'll install our Lightweight Budgie Desktop in our Ubuntu 14.04 LTS "Trusty" distribution of Linux Operating System. First of all, we'll need to add ppa repository to our Ubuntu PC. To do so, we'll need to execute the below command in a shell or terminal.

    $ sudo add-apt-repository ppa:evolve-os/ppa

![Add Budgie Desktop PPA Repo](http://blog.linoxide.com/wp-content/uploads/2015/01/budgie-desktop-ppa.png)

Now, after we finish adding PPA to our Ubuntu Computer, we'll need to update the local repository index in it. It can be done by running the following command in the same terminal or shell after above is done.

    $ sudo apt-get update

Then, finally, we'll install the one and only Budgie Desktop Environment in our Ubuntu machine running the latest version 14.04 LTS.

    $ sudo apt-get install budgie-desktop

![Install Budgie Desktop](http://blog.linoxide.com/wp-content/uploads/2015/02/install-budgie-desktop.png)

**Notes**

It is in active development and features remain missing, including, but not limited to: no network management support, no volume control applet (keyboard keys will work fine), no notification system and no way to ‘pin’ apps to the task bar.

As a workaround you can disable overlay scrollbars, set a different default theme and quit a session from the terminal using the following command:

    $ gnome-session-quit

![Quitting Gnome Session](http://blog.linoxide.com/wp-content/uploads/2015/02/gnome-seesion-quit.png)

### Log into the Budgie Session ###

After installation is completed, we’ll be able to select ‘Budgie’ from the session selector of the Unity Greeter. For that, we'll need to logout the current user and get back  to the login screen. Then, we'll be able to switch to Budgie Desktop Environment.

![Select Desktop Session](http://blog.linoxide.com/wp-content/uploads/2015/02/session-select.png)

### Budgie Desktop Environment ###

![Budgie Desktop Environment](http://blog.linoxide.com/wp-content/uploads/2015/02/budgie-desktop.png)

### Logging Out ###

You can simply execute **budgie-session --logout** in a shell or terminal to logout it.

    $ budgie-sessioon --logout

### Conclusion ###

Hurray! We have successfully installed our Lightweight Budgie Desktop Environment in our Ubuntu 14.04 LTS "Trusty" box. As we know, Budgie Desktop is still underdevelopment which makes it a lot of stuffs missing. Though it’s based on Gnome’s GTK3, it’s not a fork. The desktop is written completely from scratch, and the design is elegant and well thought out. If you have any questions, comments, feedback please do write on the comment box below and let us know what stuffs needs to be added or improved. Thank You! Enjoy Budgie Desktop 0.8 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-lightweight-budgie-v8-desktop-ubuntu/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://evolve-os.com/budgie/
[2]:https://evolve-os.com/2014/11/16/courageous-budgie-v8-released/
