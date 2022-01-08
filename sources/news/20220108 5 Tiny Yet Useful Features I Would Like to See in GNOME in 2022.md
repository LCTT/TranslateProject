[#]: subject: "5 Tiny Yet Useful Features I Would Like to See in GNOME in 2022"
[#]: via: "https://news.itsfoss.com/gnome-features-i-want/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 Tiny Yet Useful Features I Would Like to See in GNOME in 2022
======

GNOME is the default choice of desktop environment on many Linux distributions. It’s also my favorite one as it gives a modern desktop experience.

But that doesn’t mean GNOME is perfect and doesn’t need improvements. In fact, here are a few suggestions to improve the overall user experience.

### 1\. Easy application uninstall option

Desktop Linux is fragmented. To add to the mess, the packaging is also fragmented. And the worst part is removing an application from the system.

Take this, for example. You install an application using the DEB package and install it using the GNOME Software Center screen.

But what if you don’t like the application and want to remove it?

You won’t find the application listed in the software center. Instead, you will have to use the command-line method.

That is not the end of the story. There are Snap and [Flatpak][1] packages as well. If you have used one of them, you’ll have to figure out that first and then use the correct command for the installation.

GNOME has adopted an Android/iOS-like approach to display the applications in a grid and organize them in folders. The mobile operating systems provide an option for the users to hold the icon and remove the app. It would be nice to have a similar option to right-click on the application icon and choose to uninstall.

![][2]

This way, the end-users won’t have to worry whether the installed application is Deb package or Snap. There is no need to go into the terminal for that, and it happens right where the application is accessible, makes sense?

Linux Mint Cinnamon edition has this feature where you right-click on an application entry in the menu and select remove to install it.

![Right-click removal option is available in Linux Mint Cinnamon][3]

If Cinnamon can do it, GNOME should be able to do it as well, right?

### 2\. Set default software source in app store

GNOME Software center lets you choose the software source if an application is available in more than one format. At least that’s what I have seen in GNOME Software in Fedora but not in Ubuntu.

![][4]

Say someone has added both Flatpak and Snap support to the software center. If an application is available in Flatpak, Snap, and the package manager (apt, DNF, etc.), it will probably be shown multiple times in the search results.

It would be good to have the ability to set a default packaging format that takes precedence over other formats. If you put Flatpak as default, it doesn’t show the Snap version, and only the Flatpak version is installed by default.

### 3\. Syncing installed applications across systems

This one is probably dependent on the distributions and more complicated from both technical and policy point of view.

Android, iOS, macOS, and Windows have this feature, making it easier to start using a new device or the same device after a reset. The applications you install from their official applications stores are linked to your profile. You reinstall/reset the OS, or you get a new system, log in to the application store, and it shows the applications you had used previously.

On Linux, if you reinstall your system for some reason, you lose the applications you had installed. You can, of course, reinstall them, but you also have to recall which applications you had installed previously.

I remember Ubuntu had the Ubuntu One cloud once upon a time and I thought they would introduce this feature, but they shut down the cloud service. However, Ubuntu One is still alive and used as SSO login. In fact, you can see the sign-in option to Ubuntu One in Ubuntu Software Center, but it doesn’t do anything.

![Sign in option in Ubuntu Software Center][5]

Knowing which software you previously installed from the GNOME software center will make formatting the computer and moving between computers easier. Don’t you think?

Of course, many Linux users don’t necessarily rely on the software center for getting the applications, but this could be a helpful feature for some.

### 4\. Face unlock and/or pin login

I like the option to log in and unlock Windows with a pin. Yes, I use Windows occasionally. No, not for gaming, but watch streaming content in Ultra HD. I have been using it more frequently for the past couple of weeks because I am in another city, and I have to rely on my laptop to watch Netflix in 4K instead of using my TV.

Typing the entire 8/10 characters long password with special characters always feels like a chore. Thankfully, my laptop has a fingerprint reader, but not everyone has that luxury.

Using a pin or face to unlock the device could be interesting for many users who have grown accustomed to these methods on their mobile devices.

There are already a few projects that allow you to use face unlock on Linux, and GNOME could indeed consider adding it to its offering.

### 5\. Bring back ‘add new document’ option

A few years ago, GNOME removed the capability to create a new document from the right-click menu.

It is still possible to achieve that. You have to create a template document first in the Templates folder of your home directory. All the templates documents are then available in the right-click context menu.

![][6]

But this should have been a default feature. People should not be fiddling around, trying to figure out where the ‘create new document’ option went.

Its high time GNOME brings this feature back.

### What features do you want to see in GNOME?

Since I primarily use Ubuntu, the customized GNOME differs from the vanilla GNOME. The vanilla GNOME should also bring back the applet indicator so that applications like Dropbox etc can be quickly accessed.

It’s less likely that GNOME developers will pay attention to what ordinary Linux users like us think, but I’ll still ask your opinion.

What new feature would you like to see in GNOME or desktop Linux? You may also share some of your favorite features that have been removed from GNOME, and you would like to have them back.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-features-i-want/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-flatpak/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU2MiIgd2lkdGg9Ijc5OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUwMSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQxNSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ3OSIgd2lkdGg9IjgwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
