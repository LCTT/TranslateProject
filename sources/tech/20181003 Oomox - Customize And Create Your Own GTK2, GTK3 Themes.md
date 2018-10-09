Oomox – Customize And Create Your Own GTK2, GTK3 Themes
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-720x340.png)

Theming and Visual customization is one of the main advantages of Linux. Since all the code is open, you can change how your Linux system looks and behaves to a greater degree than you ever could with Windows/Mac OS. GTK theming is perhaps the most popular way in which people customize their Linux desktops. The GTK toolkit is used by a wide variety of desktop environments like Gnome, Cinnamon, Unity, XFCE, and budgie. This means that a single theme made for GTK can be applied to any of these Desktop Environments with little changes.

There are a lot of very high quality popular GTK themes out there, such as **Arc** , **Numix** , and **Adapta**. But if you want to customize these themes and create your own visual design, you can use **Oomox**.

The Oomox is a graphical app for customizing and creating your own GTK theme complete with your own color, icon and terminal style. It comes with several presets, which you can apply on a Numix, Arc, or Materia style theme to create your own GTK theme.

### Installing Oomox

On Arch Linux and its variants:

Oomox is available on [**AUR**][1], so you can install it using any AUR helper programs like [**Yay**][2].

```
$ yay -S oomox

```

On Debian/Ubuntu/Linux Mint, download `oomox.deb`package from [**here**][3] and install it as shown below. As of writing this guide, the latest version was **oomox_1.7.0.5.deb**.

```
$ sudo dpkg -i oomox_1.7.0.5.deb
$ sudo apt install -f

```

On Fedora, Oomox is available in third-party **COPR** repository.

```
$ sudo dnf copr enable tcg/themes
$ sudo dnf install oomox

```

Oomox is also available as a [**Flatpak app**][4]. Make sure you have installed Flatpak as described in [**this guide**][5]. And then, install and run Oomox using the following commands:

```
$ flatpak install flathub com.github.themix_project.Oomox

$ flatpak run com.github.themix_project.Oomox

```

For other Linux distributions, go to the Oomox project page (Link is given at the end of this guide) on Github and compile and install it manually from source.

### Customize And Create Your Own GTK2, GTK3 Themes

**Theme Customization**

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-1-1.png)

You can change the colour of practically every UI element, like:

  1. Headers
  2. Buttons
  3. Buttons inside Headers
  4. Menus
  5. Selected Text



To the left, there are a number of presets, like the Cars theme, modern themes like Materia, and Numix, and retro themes. Then, at the top of the main window, there’s an option called **Theme Style** , that lets you set the overall visual style of the theme. You can choose from between Numix, Arc, and Materia.

With certain styles like Numix, you can even change things like the Header Gradient, Outline Width and Panel Opacity. You can also add a Dark Mode for your theme that will be automatically created from the default theme.

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-2.png)

**Iconset Customization**

You can customize the iconset that will be used for the theme icons. There are 2 options – Gnome Colors and Archdroid. You an change the base, and stroke colours of the iconset.

**Terminal Customization**

You can also customize the terminal colours. The app has several presets for this, but you can customize the exact colour code for each colour value like red, green,black, and so on. You can also auto swap the foreground and background colours.

**Spotify Theme**

A unique feature this app has is that you can theme the spotify app to your liking. You can change the foreground, background, and accent color of the spotify app to match the overall GTK theme.

Then, just press the **Apply Spotify Theme** button, and you’ll get this window:

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-3.png)

Just hit apply, and you’re done.

**Exporting your Theme**

Once you’re done customizing the theme to your liking, you can rename it by clicking the rename button at the top left:

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-4.png)

And then, just hit **Export Theme** to export the theme to your system.

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Oomox-5.png)

You can also just export just the Iconset or the terminal theme.

After this, you can open any Visual Customization app for your Desktop Environment, like Tweaks for Gnome based DEs, or the **XFCE Appearance Settings** , and select your exported GTK and Shell theme.

### Verdict

If you are a Linux theme junkie, and you know exactly how each button, how each header in your system should look like, Oomox is worth a look. For extreme customizers, it lets you change virtually everything about how your system looks. For people who just want to tweak an existing theme a little bit, it has many, many presets so you can get what you want without a lot of effort.

Have you tried it? What are your thoughts on Oomox? Put them in the comments below!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/oomox-customize-and-create-your-own-gtk2-gtk3-themes/

作者：[EDITOR][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[1]: https://aur.archlinux.org/packages/oomox/
[2]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[3]: https://github.com/themix-project/oomox/releases
[4]: https://flathub.org/apps/details/com.github.themix_project.Oomox
[5]: https://www.ostechnix.com/flatpak-new-framework-desktop-applications-linux/
