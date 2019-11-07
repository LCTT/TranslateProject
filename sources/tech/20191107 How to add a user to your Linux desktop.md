[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to add a user to your Linux desktop)
[#]: via: (https://opensource.com/article/19/11/add-user-gui-linux)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

How to add a user to your Linux desktop
======
It's easy to manage users from a graphical interface, whether during
installation or on the desktop.
![Team of people around the world][1]

Adding a user is one of the first things you do on a new computer system. And you often have to manage users throughout the computer's lifespan.

My article on the [**useradd** command][2] provides a deeper understanding of user management on Linux. Useradd is a command-line tool, but you can also manage users graphically on Linux. That's the topic of this article.

### Add a user during Linux installation

Most Linux distributions provide a step for creating a user during installation. For example, the Fedora 30 installer, Anaconda, creates the standard _root_ user and one other local user account. When you reach the **Configuration** screen during installation, click **User Creation** under **User Settings**.

![Fedora Anaconda Installer - Add a user][3]

On the Create User screen, enter the user's details: **Full name**, **User name**, and **Password**. You can also choose whether to make the user an administrator.

![Create a user during installation][4]

The **Advanced** button opens the **Advanced User Configuration** screen. Here, you can specify the path to the home directory and the user and group IDs if you need something besides the default. You can also type a list of secondary groups that the user will be placed into.

![Advanced user configuration][5]

### Add a user on the Linux desktop

#### GNOME

Many Linux distributions use the GNOME desktop. The following screenshots are from Red Hat Enterprise Linux 8.0, but the process is similar in other distros like Fedora, Ubuntu, or Debian.

Start by opening **Settings**. Then go to **Details**, select **Users**, click **Unlock**, and enter your password (unless you are already logged in as root). This will replace the **Unlock** button with an **Add User** button.

![GNOME user settings][6]

Now, you can add a user by clicking **Add User**,** **then selecting the account **Type** and the details **Name** and **Password**).

In the screenshot below, a user name has been entered, and settings are left as default. I did not have to enter the **Username**; it was created automatically as I typed in the **Full Name** field. You can still modify it though if the autocompletion is not to your liking.

![GNOME settings - add user][7]

This creates a standard account for a user named Sonny. Sonny will need to provide a password the first time he or she logs in.

Next, the users will be displayed. Each user can be selected and customized or removed from this screen. For instance, you might want to choose an avatar image or set the default language.

![GNOME new user][8]

#### KDE

KDE is another popular Linux desktop environment. Below is a screenshot of KDE Plasma on Fedora 30. You can see that adding a user in KDE is quite similar to doing it in GNOME.

![KDE settings - add user][9]

### Conclusion

Other desktop environments and window managers in addition to GNOME and KDE include graphical user management tools. Adding a user graphically in Linux is quick and simple, whether you do it at installation or afterward.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/add-user-gui-linux

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_global_people_gis_location.png?itok=Rl2IKo12 (Team of people around the world)
[2]: https://opensource.com/article/19/10/linux-useradd-command
[3]: https://opensource.com/sites/default/files/uploads/screenshot_fedora30_anaconda2.png (Fedora Anaconda Installer - Add a user)
[4]: https://opensource.com/sites/default/files/uploads/screenshot_fedora30_anaconda3.png (Create a user during installation)
[5]: https://opensource.com/sites/default/files/uploads/screenshot_fedora30_anaconda4.png (Advanced user configuration)
[6]: https://opensource.com/sites/default/files/uploads/gnome_settings_user_unlock.png (GNOME user settings)
[7]: https://opensource.com/sites/default/files/uploads/gnome_settings_adding_user.png (GNOME settings - add user)
[8]: https://opensource.com/sites/default/files/uploads/gnome_settings_user_new.png (GNOME new user)
[9]: https://opensource.com/sites/default/files/uploads/kde_settings_adding_user.png (KDE settings - add user)
