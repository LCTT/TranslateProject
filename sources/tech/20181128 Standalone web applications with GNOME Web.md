[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Standalone web applications with GNOME Web)
[#]: via: (https://fedoramagazine.org/standalone-web-applications-gnome-web/)
[#]: author: ([Ryan Lerch](https://fedoramagazine.org/introducing-flatpak/))
[#]: url: ( )

Standalone web applications with GNOME Web
======
![](https://fedoramagazine.org/wp-content/uploads/2018/11/gnome-web-816x345.jpg)

Do you regularly use a single-page web application, but miss some of the benefits of a full-fledged desktop application? The GNOME Web browser, simply named Web (aka Epiphany) has an awesome feature that allows you to ‘install’ a web application. By doing this, the web application is then presented in the applications menus, GNOME shell search, and is a separate item when switching windows. This short tutorial walks you through the steps of ‘installing’ a web application with GNOME Web.

### Install GNOME Web

GNOME Web is not included in the default Fedora install. To install, search in the Software application for ‘web’, and install.

![][1]

Alternatively, use the following command in the terminal:

```
sudo dnf install epiphany
```

### Install as Web Application

Next, launch GNOME Web, and browse to the web application you wish to install. Connect to the application using the browser, and choose ‘Install site as Web Application’ from the menu:

![][2]

GNOME Web next presents a dialog to edit the name of the application. Either leave it as the default (the URL) or change to something more descriptive:

![][3]

Finally, press **Create** to ‘install’ your new web application. After creating the web application, close GNOME Web.

### Using the new web application

Launch the web application as you would with any typical desktop application. Search for it in the GNOME Shell Overview:

![][4]

Additionally, the web application will appear as a separate application in the alt-tab application switcher:

![][5]

One additional feature this adds is that all web notifications from the ‘installed’ web application are presented as regular GNOME notifications.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/standalone-web-applications-gnome-web/

作者：[Ryan Lerch][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/introducing-flatpak/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/11/gnome-web-in-gnome-software.png
[2]: https://fedoramagazine.org/wp-content/uploads/2018/11/freenode-page-in-gnome-web.png
[3]: https://fedoramagazine.org/wp-content/uploads/2018/11/edit-web-application-in-GNOME-web.png
[4]: https://fedoramagazine.org/wp-content/uploads/2018/11/web-application-in-overview.jpg
[5]: https://fedoramagazine.org/wp-content/uploads/2018/11/web-app-in-app-switcher.jpg
