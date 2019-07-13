Sound themes in Linux: What every user should know
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22)

Like all modern operating systems, Linux has a set of specifications for sound themes. Sound themes are sets of similar sounds coordinated into themes that sound good together. They signal events such as switching to a different workspace, opening a new application, plugging and unplugging hardware, and alerting you when your battery is low or fully charged. The sounds that play is determined by which themes you have installed and which ones you’re currently using. If your desktop tries to play a sound your theme doesn’t have, it will play a sound from another sound theme if it can find one.

### How do I select a sound theme?

This is where things can get tricky. Most desktops make it easy to select a sound theme, but some are more challenging, and others can't do this at all. I’ll detail the steps for [MATE][1], my personal favorite desktop. If you use another desktop, consult your desktop’s help by pressing F1.

#### MATE

To select a sound theme in MATE, open the sound settings by either pressing Alt+F1, or right-arrowing to the Settings menu, down-arrowing to Preferences, right-arrowing twice to the Hardware menu and selecting the Sound menu item. If you have a Search menu installed, such as MATE menu or [Linux Mint][2] menu, simply open that menu, search for "Sound settings," and press Enter on the first result. Once the dialog is opened, tab over to the "Sound theme" combo box and select your sound theme. If you want sounds for windows and buttons to play, check the checkbox; if not, clear it. Then press Close.

### How many sound themes are available in Linux?

There are several sound theme options in Linux, but most are included only in select distros because those distro’s developers made the theme. There is only one theme available in all distros by default, as I'll discuss later in this article. If you want a sound theme that's not available in your distribution, you'll need to download it and copy it into the proper place. For all users, this folder is `/usr/share/sounds`; for your own personal use, it is `~/.local/share/sounds`. Most sound themes can legally be used in any Linux distribution, including the sound themes in the [Ubuntu][3], [Linux Mint][4], [elementary OS][5] and [Trisquel][6] distributions.

### Where can I get sound themes?

There are several websites dedicated to sound themes, desktop background themes, icon sets, and more. These include:

#### Gnome-look

In my opinion, [Gnome-look.org][7] is the best site in terms of selection and variety. It hosts a wide variety of sound themes, icon sets, desktop themes, desktop backgrounds, and so on. Its name is misleading; the site works for all desktops, not just GNOME.

#### Mate-Look

[Mate-Look.org][8], another site specific to the MATE desktop, offers a smaller but still respectable collection of sound themes, icon sets, backgrounds, and more.

#### Linux a11y sound theme

This is the main sound theme for the Linux accessibility organization, and I maintain the site, which you can find at [Linux-a11y-sound-theme][9]. All these sounds are free to use, and the entire sound theme is open source. It is a bit of a hodgepodge mixture, but it sounds decent.

#### Chihuahua sound theme

This theme is composed of various adorable sounds my chihuahua-Pekinese mix makes, recorded on GNU/Linux using various programs and converted into the proper formats. This sound theme can be cloned at `git://github.com/coffeeking/chihuahua-sound-theme`.

#### Free desktop sound theme

Available in all Linux distributions, this sound theme is usually installed along with your desktop of choice. I don’t have a link for this sound theme, but it is usually available in your package manager as "sound-theme-freedesktop" or something similar. This theme is meant to demonstrate what themes can do rather than as an all-inclusive theme.

### The bad

While the selection of sound themes is quite good, there are some problems—not with the sound themes themselves, but with the knowledge of how sound themes work and how to create them. A common problem concerns people using sounds they are not legally allowed to use, such as the sounds included in Microsoft Windows operating systems. These sounds, which are licensed (usually by Creative Commons), are legal for use only with Windows; using them with Linux is illegal.

To address this problem, websites that offer sound themes should include clear guidelines specifying what is and is not legal to post. They should also include credit guidelines so those who create sound themes receive credit when others use their sounds. Many users don't know where to find high-quality sounds, so they use what they know. The solution is to make accessible websites offering a wide selection of sounds with clear licenses so users understand how they can and can't use these sounds.

I’ve detailed two such sites below, but these are not the only ones.

#### SoundBible

[SoundBible][10] offers a plethora of good sounds, most of which are the right length for short clip tasks, like desktop sounds. All are free, though not all are free to use commercially—check the specific license that comes with a sound for details.

#### Freesound

[Freesound][11] also provides a wide variety of sound effects for desktop tasks and other uses. Both Freesound and SoundBible include clear licenses as well as author credits so users know who made the sound and what they can do with it. This cuts down on confusion and accidental (or deliberate) misuse of sounds.

### Theme and naming specifications

A big problem in open source is that many users do not know how sound themes work or how to create them. To address this, below I will link to two specifications: sound theme specifications, which explain what should be included in a sound themes index.theme file (mandatory for all sound themes), and sound-naming guidelines, which detail how sounds should be named for your desktop to find and play them.

#### Sound theme specs

[This specification][12] explains what’s in a sound theme’s index file, which is the file that describes the sound theme and lists the theme's name, what files it contains, and so on. Click on the `html` link under "The Sound Theme Spec" heading (ignore the "draft" comment; this specification is stable and has become standardized).

#### Sound-naming specs

[This specification][12] explains how sounds should be named for your desktop to find and play them. Click on the `html` link under the "The Sound Naming Spec" heading (this also has a "draft" comment, and this theme is also standardized). The site also details what file format sounds should be in. If you come across a file that is not in a proper format, you can easily convert it using applications like [SoundConverter][13] and [FFmpeg][14].

### Conclusion

Like most things in open source, sound themes generally get little attention; most users don’t even notice that they are there. But for us visually impaired people and others who prefer unique computer experiences, sound themes provide a nice touch. Along with icon themes and desktop backgrounds, they showcase the talent and variety for which open source is famous. But it's important for users to understand how sound themes work and what they can and cannot do with them.

I hope this article has been helpful. Looking forward to the next big sound theme!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/sound-themes-linux

作者：[Kendell Clark][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kendell-clark
[1]:https://mate-desktop.org/themes/
[2]:https://linuxmint.com/
[3]:http://www.ubuntu.com/
[4]:http://www.Linuxmint.com/
[5]:http://www.elementaryos.org/
[6]:http://www.trisquel.info/
[7]:http://www.gnome-look.org/
[8]:http://www.mate-look.org/
[9]:http://www.github.com/coffeeking/Linux-a11y-sound-theme
[10]:http://www.soundbible.com/
[11]:http://www.freesound.org/
[12]:https://www.freedesktop.org/wiki/Specifications/sound-theme-spec/
[13]:http://www.soundconverter.org/
[14]:http://www.ffmpeg.org/
