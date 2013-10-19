crowner翻译
Daily Ubuntu Tips – Understanding The App Menus And Buttons
================================================================================
Ubuntu is a decent operating system. It can do almost anything a modern OS can do and sometimes, even better. If you’re new to Ubuntu, there are some things you won’t know right away. Things that are common to power users may not be so common to you and this series called ‘Daily Ubuntu Tips’ is here to help you, the new users learn how to configure and manage Ubuntu easily.

Ubuntu comes with a menu bar. The main menu bar is the dark strip at the top of your screen which contains the status menu or indicator with (Date/Time, volume button), the App menus and Windows management buttons.

Windows management buttons are at the top left corner of the main menu (dark strip). When you open an application, the buttons on the main menu at the top left corner with close, minimize, maximize and restore is called Windows management buttons.

The App menus is located at the right of the Windows management button. It shows application menus when they are opened.

By default, Ubuntu hides the app menus  and windows management buttons unless you move your mouse to the left corner, you wouldn’t be able to see them. If you open an application and can’t find the menu, just move your mouse to the left corner of your screen to show it.

If this is confusing and you want to disable the app menus so that each application can have its own menu, then continue below.

To uninstall or remove the app menus, run the commands below.

    sudo apt-get autoremove indicator-appmenu

Running the command above will remove the app menu also known as global-menu. Now for the change to take effect, log out and log back in.

Now when you open applications in Ubuntu, each application will show its own menus instead of hiding it on the global menu or main menu.

![](http://www.liberiangeek.net/wp-content/uploads/2013/09/ubuntuappmenuglobalmenu.png)

That’s it! To go back to what it was, run the commands below

    sudo apt-get install indicator-appmenu

Enjoy!
--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/09/daily-ubuntu-tips-understanding-app-menus-buttons/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)
