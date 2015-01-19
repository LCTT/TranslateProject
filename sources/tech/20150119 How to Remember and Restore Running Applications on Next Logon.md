How to Remember and Restore Running Applications on Next Logon
================================================================================
You have made some apps running in your Ubuntu and don't want to stop the process, just managed your windows and opened your stuffs needed to work. Then, something else demands your attention or you have battery low in your machine and you have to shut down. No worries. You can have Ubuntu remember all your running applications and restore them the next time you log in.

Now, to make our Ubuntu remember the applications you have running in our current session and restore them the next time our log in, We will use the dconf-editor. This tool replaces the gconf-editor available in previous versions of Ubuntu but is not available by default. To install the dconf-editor, you need to run sudo apt-get install dconf-editor.

    $ sudo apt-get install dconf-tools

Once the dconf-editor is installed, you can open dconf-editor from Application Menu. Or you can run it from terminal or run command (alt+f2):

    $ dconf-editor

In the “dconf Editor” window, click the right arrow next to “org” in the left pane to expand that branch of the tree.

![Dconf Editor Apps, org](http://blog.linoxide.com/wp-content/uploads/2015/01/dconf-editor-clicking-org-300x146.png)

Under “org”, click the right arrow next to “gnome.”

![dconf editor clicking gnome](http://blog.linoxide.com/wp-content/uploads/2015/01/dconf-editor-clicking-gnome.png)

Under “gnome,” click “gnome-session”. In the right pane, select the “auto-save-session” check box to turn on the option.

![dconf-editor selecting auto save session](http://blog.linoxide.com/wp-content/uploads/2015/01/dconf-editor_selecting_auto_save_session.png)

After you check or tick it, close the “Dconf Editor” by clicking the close button (X) in the upper-left corner of the window which is by default.

![dconf-editor closing dconf editor](http://blog.linoxide.com/wp-content/uploads/2015/01/dconf-editor_closing_dconf_editor.png)

The next time you log out and log back in, all of your running applications will be restored.

Hurray, we have successfully configured our Ubuntu 14.04 LTS "Trusty" to remember automatically running applications from our last session.

Now, on this same tutorial, we'll gonna also learn **how to enable hibernation in our Ubuntu 14.04 LTS**:

Before getting started, press Ctrl+ALt+T on your keyboard to open the terminal. When it opens, run:

    sudo pm-hibernate

After your computer turns off, switch it back on. Did your open applications re-open? If hibernate doesn’t work, check if your swap partition is at least as large as your available RAM.

You can check your Swap Area Partition Size from System Monitor, you can get it from the App Menu or run command in terminal.

    $ gnome-system-monitor

### Enable Hibernate in System Tray Menu: ###

The indicator-session was updated to use logind instead of upower. Hibernate is disabled by default in both upower and logind.

To re-enable hibernate, run the commands below one by one to edit the config file:

    sudo -i

    cd /var/lib/polkit-1/localauthority/50-local.d/

    gedit com.ubuntu.enable-hibernate.pkla

**Tips: if the config file does not work for you, try another one by changing /var/lib to /etc in the code.**

Copy and paste below lines into the file and save it.

    [Re-enable hibernate by default in upower]
     Identity=unix-user:*
     Action=org.freedesktop.upower.hibernate
     ResultActive=yes

    [Re-enable hibernate by default in logind]
     Identity=unix-user:*
     Action=org.freedesktop.login1.hibernate
     ResultActive=yes

Restart your computer and done.

### Hibernate your laptop when lid is closed: ###

1.Edit “/etc/systemd/logind.conf” via command:

    $ sudo nano /etc/systemd/logind.conf

2. Change the line **#HandleLidSwitch=suspend to HandleLidSwitch=hibernate** and save the file.

3. Run command below or just restart your computer to apply changes:

    $ sudo restart systemd-logind

That’s it. Enjoy! Now, we have both dconf and hibernation on :) Now, your Ubuntu will completely remember your opened apps and stuffs.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/remember-running-applications-ubuntu/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/