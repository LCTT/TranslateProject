[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Tweaks to Customize the Look of Your Linux Terminal)
[#]: via: (https://itsfoss.com/customize-linux-terminal/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

5 Tweaks to Customize the Look of Your Linux Terminal
======

The terminal emulator or simply the terminal is an integral part of any Linux distribution.

When you change the theme of your distribution, often the terminal also gets a makeover automatically. But that doesn’t mean you cannot customize the terminal further.

In fact, many It’s FOSS readers have asked us how come the terminal in our screenshots or videos look so cool, what fonts do we use, etc.

To answer this frequent question, I’ll show you some simple and some complex tweaks to change the appearance of the terminal. You can compare the visual difference in the image below:

![][1]

### Customizing Linux Terminal

_This tutorial utilizes a GNOME terminal on Pop!_OS to customize and tweak the look of the terminal. But, most of the advice should be applicable to other terminals as well._

For most of the elements like color, transparency, and fonts, you can utilize the GUI to tweak it without requiring to enter any special commands.

Open your terminal. In the top right corner, look for the hamburger menu. In here, click on “**Preferences**” as shown in the screenshot below:

![][2]

This is where you’ll find all the settings to change the appearance of the terminal.

#### Tip 0: Use separate terminal profiles for your customization

I would advise you to create a new profile for your customization. Why? Because this way, your changes won’t impact the main terminal profile. Suppose you make some weird change and cannot recall the default value? Profiles help separate the customization.

As you can see, Abhishek has separate profiles for taking screenshots and making videos.

![Terminal Profiles][3]

You can easily change the terminal profiles and open a new terminal window with the new profile.

![Change Terminal Profile][4]

That was the suggestion I wanted to put forward. Now, let’s see those tweaks.

#### Tip 1: Use a dark/light terminal theme

You may change the system theme and the terminal theme gets changed. Apart from that, you may switch between the dark theme or light theme, if you do not want to change the system theme.

Once you head in to the preferences, you will notice the general options to change the theme and other settings.

![][5]

#### Tip 2: Change the font and size

Select the profile that you want to customize. Now you’ll get the option to customize the text appearance, font size, font style, spacing, cursor shape, and toggle the terminal bell sound as well.

For the fonts, you can only change to what’s available on your system. If you want something different, download and install the font on your Linux system first.

One more thing! Use monospaced fonts otherwise fonts might overlap and the text may not be clearly readable. If you want suggestions, go with [Share Tech Mono][6] (open source) or [Larabiefont][7] (not open source).

Under the Text tab, select Custom font and then change the font and its size (if required).

![][8]

#### Tip 3: Change the color pallet and transparency

Apart from the text and spacing, you can access the “Colors” tab and change the color of the text and background of your terminal. You can also adjust the transparency to make it look even cool.

As you can notice, you can change the color palette from a set of pre-configured options or tweak it yourself.

![][9]

If you want to enable transparency just like I did, you click on “**Use transparent background**” option.

You can also choose to use colors from your system theme, if you want a similar color setting with your theme.

![][10]

#### Tip 4: Tweaking the bash prompt variables

Usually, you will see your username along with the hostname (your distribution) as the bash prompt when launching the terminal without any changes.

For instance, it would be “ankushdas**@**pop-os**:~$**” in my case. However, I [permanently changed the hostname][11] to “**itsfoss**“, so now it looks like:

![][12]

To change the hostname, you can type in:

```
hostname CUSTOM_NAME
```

However, this will be applicable only for the current sessions. So, when you restart, it will revert to the default. To permanently change the hostname, you need to type in:

```
sudo hostnamectl set-hostname CUSTOM_NAME
```

Similarly, you can also change your username, but it requires some additional configuration that includes killing all the current processes associated with the active username, so we’ll avoid it to change the look/feel of the terminal.

#### Tip 5: NOT RECOMMENDED: Changing the font and color of the bash prompt (for advanced users)

However, you can tweak the font and color of the bash prompt (**[[email protected]][13]:~$**) using commands.

You will need to utilize the **PS1** environment variable which controls what is being displayed as the prompt. You can learn more about it in the [man page][14].

For instance, when you type in:

```
echo $PS1
```

The output in my case is:

```
\[\e]0;\[email protected]\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[email protected]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$
```

We need to focus on the first part of the output:

```
\[\e]0;\[email protected]\h: \w\a\]$
```

Here, you need to know the following:

  * **\e** is a special character that denotes the start of a color sequence
  * **\u** indicates the username followed by the @ symbol
  * **\h** denotes the hostname of the system
  * **\w** denotes the base directory
  * **\a** indicates the active directory
  * **$** indicates non-root user



The output in your case can be different, but the variables will be the same, so you need to play with the commands mentioned below depending on your output.

Before you do that, keep these in mind:

  * Codes for text format: **0** for normal text, **1** for bold, **3** for italic and **4** for underline text
  * Color range for background colors: **40-47**
  * Color range for text color: **30-37**



You just need to type in the following to change the color and font:

```
PS1="\e[41;3;32m[\[email protected]\h:\w\a\$]"
```

This is how your bash prompt will look like after typing the command:

![][15]

If you notice the command properly, as mentioned above, \e helps us assign a color sequence.

In the command above, I’ve assigned a **background color first**, then the **text style**, and then the **font color** followed by “**m**“.

Here, “**m**” indicates the end of the color sequence.

So, all you have to do is, play around with this part:

```
41;3;32
```

Rest of the command should remain the same, you just need to assign different numbers to change the background color, text style, and text color.

Do note that this is in no particular order, you can assign the text style first, background color next, and the text color at the end as “**3;41;32**“, where the command becomes:

```
PS1="\e[3;41;32m[\[email protected]\h:\w\a\$]"
```

![][16]

As you can notice, the color customization is the same no matter the order. So, just keep in mind the codes for customization and play around with it till you’re sure you want this as a permanent change.

The above command that I mentioned temporarily customizes the bash prompt for the current session. If you close the session, you will lose the customization.

So, to make this a permanent change, you need to add it to **.bashrc** file (this is a configuration file that loads up every time you load up a session).

![][17]

You can access the file by simply typing:

```
nano ~/.bashrc
```

Unless you’re sure what you’re doing, do not change anything. And, just for the sake of restoring the settings back, you should keep a backup of the PS1 environment variable (copy-paste what’s in it by default) to a text file.

So, even if you need the default font and color, you can again edit the **.bashrc file** and paste the PS1 environment variable.

#### Bonus Tip: Change the terminal color pallet based on your wallpaper

If you want to change the background and text color of the terminal but you are not sure which colors to pick, you can use a Python-based tool Pywal. It [automatically changes the color of the terminal based on your wallpaper][18] or the image you provide to it.

![][19]

I have written about it in details if you are interested in using this tool.

**Recommended Read:**

![][20]

#### [Automatically Change Color Scheme of Your Linux Terminal Based on Your Wallpaper][18]

### Wrapping Up

Of course, it is easy to customize using the GUI while getting a better control of what you can change. But, the need to know the commands is also necessary in case you start [using WSL][21] or access a remote server using SSH, you can customize your experience no matter what.

How do you customize the Linux terminal? Share your secret ricing recipe with us in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/customize-linux-terminal/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/default-terminal.jpg?resize=773%2C493&ssl=1
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/linux-terminal-preferences.jpg?resize=800%2C350&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/terminal-profiles.jpg?resize=800%2C619&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/change-terminal-profile.jpg?resize=796%2C347&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/terminal-theme.jpg?resize=800%2C363&ssl=1
[6]: https://fonts.google.com/specimen/Share+Tech+Mono
[7]: https://www.dafont.com/larabie-font.font
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/terminal-customization-1.jpg?resize=800%2C500&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/terminal-color-customization.jpg?resize=759%2C607&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/linux-terminal.jpg?resize=800%2C571&ssl=1
[11]: https://itsfoss.com/change-hostname-ubuntu/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/itsfoss-hostname.jpg?resize=800%2C188&ssl=1
[13]: https://itsfoss.com/cdn-cgi/l/email-protection
[14]: https://linux.die.net/man/1/bash
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/terminal-bash-prompt-customization.jpg?resize=800%2C190&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/linux-terminal-customization-1s.jpg?resize=800%2C158&ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/bashrch-customization-terminal.png?resize=800%2C615&ssl=1
[18]: https://itsfoss.com/pywal/
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/wallpy-2.jpg?resize=800%2C442&ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/pywal-linux.jpg?fit=800%2C450&ssl=1
[21]: https://itsfoss.com/install-bash-on-windows/
