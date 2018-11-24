[^#]: source: lujun9972
[^#]: translate: 译者ID
[^#]: review: 校对者ID
[^#]: published: 发布者ID
[^#]: subject: How to install extensions via the Software application
[^#]: via: https://fedoramagazine.org/install-extensions-via-software-application/
[^#]: author: [Ryan Lerch](https://fedoramagazine.org/introducing-flatpak/)
[^#]: url: 

How to install extensions via the Software application
====== 

![](https://fedoramagazine.org/wp-content/uploads/2018/11/installing-extensions-816x345.jpg)

GNOME is the default desktop environment shipped with Fedora Workstation. GNOME Shell provides an awesome, minimal, default experience that is easy to pick up and use. However, GNOME Shell Extensions make it easy to add to and change the behavior of GNOME.

The [extensions.gnome.org][1] website is the canonical source for quality GNOME extensions, and previously, the easiest way to install was directly from the website. However, recent updates to the GNOME Software application now allow you to browse, search, install, and update extensions from extensions.gnome.org. This how to covers the basics of installing these extensions using GNOME Software.

### Check the Software Sources

On a Fedora Workstation install, extensions.gnome.org should already be enabled by default as a software source. However, it pays to check that it is enabled before proceeding.

First open the Software Repositories dialog by in Software’s application menu:

![software application app menu][2]

Then scroll down, finding the extensions.gnome.org item, and checking it is enabled, and enabling it if needed.

![][3]

### Browse Extensions

With the correct software source enabled, extensions from extensions.gnome.org will start appearing in searches in the Software application. To browse just the extensions, click on the Add-Ons category on the main Software page:

![][4]

The Shell Extension tab then lists all the available extensions:

![][5]

Note that some of the extensions above are doubled-up. This is because these extensions are also available as RPMs in the official Fedora repositories.

### Installing an Extension

Installing an extension is done in the same manner as any other item in the Software Application — simply press the install button and you will be right to go. Note too, that once an extension is installed, you are easily able to launch the extension settings from the details page. Additionally, note the Source item in the details. This shows you if the extension you are installing is from the official Fedora repos, or the extensions.gnome.org source.

![][6]


--------------------------------------------------------------------------------

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
[1]: http://extensions.gnome.org
[2]: https://fedoramagazine.org/wp-content/uploads/2018/11/menu.png
[3]: https://fedoramagazine.org/wp-content/uploads/2018/11/repositories-list.png
[4]: https://fedoramagazine.org/wp-content/uploads/2018/11/Screenshot-from-2018-11-21-12-37-45.png
[5]: https://fedoramagazine.org/wp-content/uploads/2018/11/Screenshot-from-2018-11-21-12-38-25.png
[6]: https://fedoramagazine.org/wp-content/uploads/2018/11/Screenshot-from-2018-11-21-13-04-08.png
