[#]: subject: "6 Tips and Tools to Enhance Your Flatpak Experience in Linux"
[#]: via: "https://itsfoss.com/flatpak-tips-tweaks/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

6 Tips and Tools to Enhance Your Flatpak Experience in Linux
======

Slowly and steadily, [Flatpak][1] has a growing acceptance in the desktop Linux world.

It is well integrated into Fedora and many other distributions like Linux Mint, elementary, Solus, etc. prefer it over Ubuntu’s Snap.

If you love using Flatpak applications, let me share a few tips, tools, and tweaks to make your Flatpak experience better and smoother.

### 1. Use Flathub to explore new Flatpak applications

This one goes without saying.

If you are looking for new applications in Flatpak packaging, browse the [Flathub website][2].

This is the official website from the Flatpak project and it lists and distributes a huge number of Flatpak applications.

You can look for recommended apps in the “Editor’s choice” section, recently updated apps, new apps and popular apps.

![Flathub website homepage][3]

You can have the application screenshots, description, developer information, and installation instructions on the individual application webpages.

**Bonus tip**: Make sure to add the Flathub repo in your system. Otherwise, you’ll see [“no remote refs found similar to flathub][4]” error while installing applications from Flathub.

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

### 2. Use Flatline extension to install Flatpak from the browser

The Flathub website provides command line instructions to install the application.

There is also an Install button but it doesn’t install the application for you. It downloads a .flatpakref file and then you’ll have to use the command line to install from the flatpakref file.

![The install button doesn’t provide a quick installation by default][5]

If you have to use the command line ultimately, it doesn’t make sense to download the fltapakref file.

You can make things better by using [Flatline][6]. It’s a Mozilla Firefox extension and it makes that Install button useful by converting it into appstream link. One more reason to use Firefox?

![Flatline browser extension][7]

This way, when you click on the Install button for any application on the Flathub website, it will ask you to open the link in an XDG application like the Software Center.

![You can choose to install Flatpak package in software center][8]

This also means that you should have the Fltapak support integrated into the software center.

### 3. Integrate Flatpak with the software center (for GNOME)

Apart from Fedora, a handful of distributions provide Flatpak support by default. You can find and install Flatpak apps from the graphical software manager.

Not all distros have that. If you are running some other distribution with GNOME desktop environment, you can enable Flatpak support in the software center.

```
sudo apt install gnome-software-plugin-flatpak
```

Note that Ubuntu has switched to Snap for the software center. The above command will also install a deb version of GNOME Software Center. You’ll have two software center applications in the system.

If you enable the Flatpak support in the software, you can couple it with Flatline and install Fltapak apps from the web browser directly.

Recently, there was an independent, standalone Flatpak app store called [Souk][9]. However, it is no longer actively developed.

![Souk GUI software manager for Flatpak][10]

There is also [Bauh][11] that can manage Flatpak, Snap and AppImages from a single interface.

### 4. Manage Flatpak permissions graphically With Flatseal

[Flatseal][12] is a graphical utility to review and modify your Flatpak applications’ permissions. This makes things a lot easier than going through the commands.

![Control permissions of individual Flatpak apps][13]

It lists all the installed Flatpak applications and shows what kind of permissions the selected application has.

You may enable or disable the permissions. Please bear in mind that disabling some permissions might impact the normal functioning of the application. You should know what you are doing.

You can install Flatseal using Flatpak, of course.

```
flatpak install flathub com.github.tchx84.Flatseal
```

### 5. Apply GTK system themes to Flatpak applications

You might have already noticed that most Flatpak apps don’t change their appearance as per the current system theme.

Why? Because Flatpak apps run inside a ‘container’ and don’t have access to the host filesystem, network, or physical devices.

You can choose to install themes as Flatpak to solve this issue. However, your favorite theme might not be available in Flatpak format.

Alternatively, you can make some manual effort and force the Flatpak applications to use a given theme. Here’s how to do that.

**Step 1**: Give Flatpak access to the folder where theme files are kept:

```
sudo flatpak override --filesystem=$HOME/.themes
```

**Step 2**: List all the themes available in ~/.themes location and then provide the folder name of the selected theme to Flatpak:

```
sudo flatpak override --env=GTK_THEME=chosen-theme
```

![flatpak adwaita][14]

![flatpak canta dark][15]

If you change the system theme later, you can change the theme for Flatpak in the same manner.

You can revert the changes using this command:

```
sudo flatpak override --reset
```

Read more about [applying GTK theme to Flatpak apps in this article][16].

### 6. Update Flatpak apps and clean them

This is more for Flatpak unfriendly distributions like Ubuntu. If your distro doesn’t come baked in with Flatpak and you don’t have it integrated with the Software center, your installed Flatpak apps won’t be updated with system updates.

You can update all your installed Flatpak apps simultaneously with:

```
flatpak update
```

![Update Flatpak applications][17]

Not only it will update the applications, but it will also [remove any unused runtimes][18]. You**don’t need to run this command manually anymore**.

```
flatpak uninstall –unused
```

**Bonus tip**: While removing a Flatpak application, you can make it remove personal application data that are usually left behind in the home directory.

```
flatpak uninstall --delete-data package_name
```

### Conclusion

I deliberately didn’t add [more Flatpak command tips][19] though I was tempted to. Probably there are a few more applications and tweaks for Flatpak packages. I shared my favorite ones.

If you know any good tips related to Flatpak packages, do share them with us in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/flatpak-tips-tweaks/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/what-is-flatpak/
[2]: https://flathub.org/home
[3]: https://itsfoss.com/wp-content/uploads/2022/07/flathub-website.png
[4]: https://itsfoss.com/no-remote-ref-found-flatpak/
[5]: https://itsfoss.com/wp-content/uploads/2022/07/apps-on-flathub.png
[6]: https://addons.mozilla.org/en-US/firefox/addon/flatline-flatpak/
[7]: https://itsfoss.com/wp-content/uploads/2022/07/flatline-extension.png
[8]: https://itsfoss.com/wp-content/uploads/2022/07/installing-flatpak-from-web-browser.png
[9]: https://gitlab.gnome.org/haecker-felix/souk
[10]: https://itsfoss.com/wp-content/uploads/2022/07/souk-app-details.png
[11]: https://itsfoss.com/bauh-package-manager/
[12]: https://flathub.org/apps/details/com.github.tchx84.Flatseal
[13]: https://itsfoss.com/wp-content/uploads/2021/11/flatpak-permission-control-flatseal.png
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatpak-adwaita.webp?ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatpak-canta-dark.webp?ssl=1
[16]: https://itsfoss.com/flatpak-app-apply-theme/
[17]: https://itsfoss.com/wp-content/uploads/2022/07/update-flatpak-applications.png
[18]: https://blogs.gnome.org/mwleeds/2021/01/11/cleaning-up-unused-flatpak-runtimes/
[19]: https://docs.flatpak.org/en/latest/tips-and-tricks.html
