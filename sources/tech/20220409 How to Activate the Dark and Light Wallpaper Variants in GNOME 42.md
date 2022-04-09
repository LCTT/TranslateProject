[#]: subject: "How to Activate the Dark and Light Wallpaper Variants in GNOME 42"
[#]: via: "https://itsfoss.com/dark-light-wallpaper-gnome/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Activate the Dark and Light Wallpaper Variants in GNOME 42
======

One of the main [features in GNOME 42][1] is the availability of a dual tone wallpapers for dark and light mode.

![GNOME 42 features dark and light variants of wallpapers][2]

Basically, with this feature, if you select the light mode, the light version of the wallpaper is selected. When you [switch to dark mode in GNOME][3], wallpaper changes to the dark version.

Here’s a sample of such a wallpaper. You can move the slider to compare.

![Dark and light variants of wallpapers in GNOME][4]

This dual themed wallpaper is available under the Background section in the Settings -&gt; Appearance.

However, it may not be present in some cases and you may see an empty Background section like this:

![no dark light wallpaper in gnome][5]

This is what my teammate Sreenath noticed when he updated his Endeavour OS system and got the new GNOME 42 desktop.

### Enable dark and light themed wallapers in GNOME 42

If you are also facing the same situation with GNOME 42, there is a quick and easy solution. Use your distribution’s package manager and install gnome-backgrounds package. That’s it.

First, please [check the desktop environment details][6] and ensure that you are running GNOME 42. You can find it in the About section of system settings.

Once you have made sure that your system has GNOME 42, go on with the rest of the steps.

For [Arch-based distributions][7], use the [pacman command][8] like this:

```

    sudo pacman -S gnome-backgrounds

```

Wait for the command to finish.

![][9]

No need to restart or even log out. The changes will take place immediately.

Just go to the Appearance in the Settings and look under the Background section. You should see various wallpapers with dual modes.

Select a pair and it sets the image based on your system theme.

![dark light wallpapers gnome][10]

That’s cool. But you only get a handful of dual themed wallpapers made available by the GNOME or your distro’s developers. What if you want to have your own set of dark and light mode wallpapers? Well, you can achieve that with a little tweaking and patience.

### Making your own dual themed wallpapers (for advanced users)

I presume that you know your things while trying these steps to add additional wallpapers in dark and light mode variants.

  * Download two images
  * Rename it as (say) **image-l.jpg** for light and **image-d.jpg** for dark
  * Create a folder called **gnome-background-properties** in /usr/share for systemwide or .local/share for single user
  * Copy the [code of GNOME from its GitLab repo][11] to a text editor and change the location of respective light and dark image files inside &lt;filename&gt; tag
  * Save it in the gnome-background-properties folder you created earlier
  * Backgrounds can be changed now from system settings



Need more help? baby WOGUE has a good video showing the steps in action:

I hope you liked this quick little tip. Enjoy it.

--------------------------------------------------------------------------------

via: https://itsfoss.com/dark-light-wallpaper-gnome/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/gnome-42-features/
[2]: https://itsfoss.com/wp-content/uploads/2022/04/fedora-36-gnome-42-dark-800x450.jpg
[3]: https://itsfoss.com/fedora-dark-mode/
[4]: https://itsfoss.com/wp-content/uploads/2022/04/GNOME_Light_Desktop.jpg
[5]: https://itsfoss.com/wp-content/uploads/2022/04/no-dark-light-wallpaper-in-gnome-800x326.png
[6]: https://itsfoss.com/find-desktop-environment/
[7]: https://itsfoss.com/arch-based-linux-distros/
[8]: https://itsfoss.com/pacman-command/
[9]: https://itsfoss.com/wp-content/uploads/2022/04/add-dark-light-wallpapers-gnome-800x366.png
[10]: https://itsfoss.com/wp-content/uploads/2022/04/dark-light-wallpapers-gnome-800x370.jpg
[11]: https://gitlab.gnome.org/GNOME/gnome-backgrounds/-/blob/main/backgrounds/adwaita.xml.in
