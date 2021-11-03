[#]: subject: "Flatpak Apps Look Out of Place? Here’s How to Apply GTK Themes on Flatpak Applications"
[#]: via: "https://itsfoss.com/flatpak-app-apply-theme/"
[#]: author: "Community https://itsfoss.com/author/itsfoss/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Flatpak Apps Look Out of Place? Here’s How to Apply GTK Themes on Flatpak Applications
======

One of the reasons why some users avoid installing Flatpak apps is that most [Flatpak][1] apps don’t change their appearance as per the current system theme. This makes the applications look out of the place in your otherwise beautiful set up.

![Flatpak apps do not match system theme][2]

The official way to apply GTK themes to Flatpak apps is by [installing the desired theme as a flatpak][3]. However, there are only a few GTK themes that can be installed as Flatpak.

This means that if you found a [beautiful GTK theme][4], your Flatpak applications will still be using their default appearance. But wait! There is a workaround.

In this tutorial, I am going to introduce you a way to make flatpak apps aware of external GTK themes.

### Applying GTK themes to Flatpak applications (intermediate level)

Before we proceed, let’s understand why flatpak apps have this behavior.

Flatpak apps run inside a ‘container’, so they don’t have access to the host filesystem, network, or physical devices without explicitly setting the appropriate permission, and that is what we are going to do.

As I said earlier, this is a workaround, not a flawless solution. **Don’t expect it to change the themes of Flatpak apps automatically when you change the system theme.** You can, however, change it for all Flatpak apps in one single command.

Let’s see how to achieve that. Please note that this tutorial requires that you are a bit familiar with the Linux command line and you can find your way around the terminal.

#### Step 1: Give Flatpak apps access to GTK themes location

GTK themes are located in /usr/share/themes for all users, and in ~/.themes for a specific user.

To **give all flatpak packages permission** to access ~/.themes run the following command:

```
sudo flatpak override --filesystem=$HOME/.themes
```

Notice that you can’t give access to /usr/share/themes because according to [flatpak documentaion they are black listed][5].

**Alternatively**, you can do this at per-application base as well. You need to specify the application ID for which you are going to change the theme.

```
sudo flatpak override org.gnome.Calculator --filesystem=$HOME/.themes
```

#### Step 2:Tell Flatpak apps which theme to use

Giving access to ~/.themes is not enough because this directory may contain multiple themes. To tell flatpak which GTK theme to use, first get the name of the desired theme and then apply the following command:

```
sudo flatpak override --env=GTK_THEME=my-theme
```

As you can see in the screenshot below, there is two themes available, Ant-Bloody and Orchis-dark. _**Copy and paste the exact theme name**_ in the above command:

![Set GTK themes for all Flatpak apps][6]

Alternatively, for individual application, run:

```
sudo flatpak override org.gnome.Calculator --env=GTK_THEME=my-theme
```

and replace my-theme with the folder name of the theme you want to apply (and it must be located in ~/.themes).

#### Step 3: Test the theme change by running a Flatpak app

If the application was already running, you’ll have to close and start it again. You’ll see that the newly started application uses the theme that you had specified earlier.

Here is a screenshot of GNOME calculator and GNOME builder (Flatpak version) before the above steps:

![Flatpak applications with default Adwaita theme][7]

And after the above steps (With Canta GTK theme):![][8]![][8]

![Flatpak applications with Canta Dark theme][9]

That’s better, right? Now, I could leave you here but it would be appropriate to mention the steps for reverting the changes.

### Revert the changes

You can reset the changes by resetting all the overrides at once. Please note that this will reset any previous overrides you had explicitly set.

```
sudo flatpak override --reset
```

Alternatively, you can reset permissions at package level as well:

```
sudo flatpak override --reset org.example.app
```

If you have previously overridden the GTK_THEME or filesystem for a specific Flatpak package using “flatpak override” resetting will help you set it again.

### Additional information

Normal GTK applications load GTK theme specified by gsettings, you can run the following command to get currently applied GTK themes:

```
gsettings get org.gnome.desktop.interface gtk-theme
```

And to set the GTK theme, run:

```
gsettings set org.gnome.desktop.interface gtk-theme my-theme
```

To do the above with Flatpak, you have to enter a shell session inside the container of the desired application by running:

```
flatpak run --command=bash org.gnome.Calculator
```

And inside this session, run the above command:

```
gsettings set org.gnome.desktop.interface gtk-theme my-theme
```

But that did not work with me, so I resorted to use GTK_THEME environment variable, which is supposed to be used for debugging purpose. If you managed to make gsettings work, then tell me in the comments.

I know it’s not an automated solution but at least it gives you the option to change the themes for the Flatpak applications with a couple of commands. This way, you can make the Flatpak application integrate with the rest of the system.

I hope this helped you. If you face any issues, please mention them in the comments.

_**Author Info: This article has been contributed by It’s FOSS reader Hamza Algohary and edited by Abhishek Prakash. Hamza is a computer engineering student and a Linux and open source enthusiast. He also develops apps for Linux desktop. You can find his work on [his GitHub profile][10].**_

--------------------------------------------------------------------------------

via: https://itsfoss.com/flatpak-app-apply-theme/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-flatpak/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatpak-apps-not-matching-system-theme.jpg?resize=800%2C450&ssl=1
[3]: https://docs.flatpak.org/en/latest/desktop-integration.html#theming
[4]: https://itsfoss.com/best-gtk-themes/
[5]: https://docs.flatpak.org/en/latest/sandbox-permissions.html#filesystem-access
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/set-gtk-theme-to-flatpak-apps.png?resize=800%2C277&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatpak-adwaita.webp?resize=800%2C450&ssl=1
[8]: https://itsfoss.com/flatpak-app-apply-theme/flatpak-canta-dark.png
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/flatpak-canta-dark.webp?resize=800%2C450&ssl=1
[10]: https://github.com/hamza-Algohary
