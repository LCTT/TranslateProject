[#]: subject: "How to Completely Uninstall Google Chrome From Ubuntu"
[#]: via: "https://itsfoss.com/uninstall-chrome-from-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Completely Uninstall Google Chrome From Ubuntu
======

So, you managed to [install Google Chrome on Ubuntu][1]. It is the most popular web browser in the world, after all.

But perhaps you dislike Google products for the heavy tracking and data mining they employ on its users. You decided to opt for [other web browsers on Ubuntu][2], perhaps a [non-Chromium browser][3].

Now that you are no longer using it, it would be wise to remove [Google Chrome][4] from Ubuntu.

How to do that? Let me show you the steps.

### Remove Google Chrome completely from Ubuntu

![Illustration for removing Google Chrome from Ubuntu][5]

You probably installed Google Chrome graphically. Unfortunately, you’ll have to resort to command line for removing it, unless you opt to [use Synaptic Package Manager][6].

It is not too difficult. Press the [Ctrl+Alt+T keyboard shortcut in Ubuntu to open a terminal][7].

Type the following command in the terminal:

```
sudo apt purge google-chrome-stable
```

It asks for a password. It is your user account’s password, the one which you use to log in to your Ubuntu system.

When you type the password, nothing is displayed on the screen. This is normal behavior in Linux. Just type the password blindly and press enter.

It will ask you to confirm the removal of Google Chrome by entering Y or simply pressing the enter key.

![Removing Google Chrome for Ubuntu][8]

This will remove Google Chrome from your Ubuntu Linux system along with most of the system files.

However, the personal setting files remain in your home directory. This includes things like cookie sessions, bookmarks and other Chrome related settings for your user account. If you install Google Chrome again, the same files could be used by Chrome again.

![Google Chrome leftover settings in Ubuntu][9]

If you want to completely uninstall Google Chrome, you may want to remove these files as well. Here’s what you should do.

Change to the .config directory. _**Mind the dot before config**_. That’s the [way to hide files and folders in Linux][10].

```
cd ~/.config
```

And now remove the google-chrome directory:

```
rm -rf google-chrome
```

![Removing the leftover Google Chrome settings from Ubuntu][11]

You could have also used rm -rf ~/.config/google-chrome to delete it in one single command. Since this tutorial is focused on absolute beginners, I made it in two steps to reduce the error margin because of a typo.

Tip

Want to make your terminal look beautiful like the ones in the screenshot? Use these [terminal customization tips][12].

I hope this quick beginner tip helped you to get rid of Google Chrome from Ubuntu Linux.

--------------------------------------------------------------------------------

via: https://itsfoss.com/uninstall-chrome-from-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-chrome-ubuntu/
[2]: https://itsfoss.com/best-browsers-ubuntu-linux/
[3]: https://itsfoss.com/open-source-browsers-linux/
[4]: https://www.google.com/chrome/index.html
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/removing-google-chrome-ubuntu.png?resize=800%2C450&ssl=1
[6]: https://itsfoss.com/synaptic-package-manager/
[7]: https://itsfoss.com/open-terminal-ubuntu/
[8]: https://itsfoss.com/wp-content/uploads/2021/09/remove-google-chrome-ubuntu.webp
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/google-chrome-ubuntu-leftover-settings.png?resize=800%2C518&ssl=1
[10]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/remove-google-chrome-leftover-settings-from-Ubuntu.png?resize=800%2C277&ssl=1
[12]: https://itsfoss.com/customize-linux-terminal/
