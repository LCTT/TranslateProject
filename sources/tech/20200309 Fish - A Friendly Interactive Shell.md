[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fish – A Friendly Interactive Shell)
[#]: via: (https://fedoramagazine.org/fish-a-friendly-interactive-shell/)
[#]: author: (Michal Konečný https://fedoramagazine.org/author/zlopez/)

Fish – A Friendly Interactive Shell
======

![Fish — A Friendly Interactive Shell][1]

Are you looking for an alternative to bash? Are you looking for something more user-friendly? Then look no further because you just found the golden fish!

Fish (friendly interactive shell) is a smart and user-friendly command line shell that works on Linux, MacOS, and other operating systems. Use it for everyday work in your terminal and for scripting. Scripts written in fish are less cryptic than their equivalent bash versions.

### Fish’s user-friendly features

  * **Suggestions**
Fish will suggest commands that you have written before. This boosts productivity when typing same commands often.
  * **Sane scripting**
Fish avoids using cryptic characters. This provides a clearer and friendlier syntax.
  * **Completion based on man pages**
Fish will autocomplete parameters based on the the command’s man page.
  * **Syntax highlighting**
Fish will highlight command syntax to make it visually friendly.



### Installation

#### Fedora Workstation

Use the _dnf_ command to install fish:

```
$ sudo dnf install fish
```

Make fish your default shell by installing the _util-linux-user_ package and then running the _chsh_ (change shell) command with the appropriate parameters:

```
$ sudo dnf install util-linux-user
$ chsh -s /usr/bin/fish
```

You will need to log out and back in for this change to take effect.

#### Fedora Silverblue

Because this is not GUI application, you will need to layer it using _rpm-ostree_. Use the following command to install fish on Fedora Silverblue:

```
$ rpm-ostree install fish
```

On Fedora Silverblue you will need to reboot your PC to switch to the new ostree image.

If you want to make fish your main shell on Fedora Silverblue, the easiest way is to update the _/etc/passwd_ file. Find your user and change _/bin/bash_ to _/usr/bin/fish_.

You will need [root privileges][2] to edit the _/etc/passwd_ file. Also you will need to log out and back in for this change to take effect.

### Configuration

The per-user configuration file for fish is _~/.config/fish/config.fish_. To make configuration changes for all users, edit _/etc/fish/config.fish_ instead.

The per-user configuration file must be created manually. The installation scripts will not create _~/.config/fish/config.fish_.

Here are a couple configuration examples shown alongside their bash equivalents to get you started:

#### Creating aliases

  * _~/.bashrc_: alias ll='ls -lh'
  * _~/.config/fish/config.fish_: alias ll='ls -lh'



#### Setting environment variables

  * _~/.bashrc_: export PATH=$PATH:~/bin
  * _~/.config/fish/config.fish_: set -gx PATH $PATH ~/bin



### Working with fish

When fish is configured as your default shell, the command prompt will look similar to what is shown in the below image. If you haven’t configured fish to be your default shell, just run the _fish_ command to start it in your current terminal session.

![][3]

As you start typing commands, you will notice the syntax highlighting:

![][4]

Cool, isn’t it? 🙂

You will also see commands being suggested as you type. For example, start typing the previous command a second time:

![][5]

Notice the gray text that appears as you type. The gray text is fish suggesting the command you wrote before. To autocomplete it, just press **CTRL+F**.

Get argument suggestions based on the preceding command’s man page by typing a dash (**–**) and then the **TAB** key:

![][6]

If you press **TAB** once, it will show you the first few suggestions (or every suggestion, if there are only a few arguments available). If you press **TAB** a second time, it will show you all suggestions. If you press **TAB** three times consecutively, it will switch to interactive mode and you can select an argument using the arrow keys.

Otherwise, fish works similar to most other shells. The remaining differences are well documented. So it shouldn’t be difficult to find other features that you may be interested in.

### Make fish even more powerful

Make the fish even more powerful with [powerline][7]. Powerline adds command execution time, colored git status, current git branch and much more to fish’s interface.

Before installing powerline for fish, you must install [Oh My Fish][8]. Oh My Fish extends fish’s core infrastructure to enable the installation of additional plugins. The easiest way to install Oh My Fish is to use the _curl_ command:

```
> curl -L https://get.oh-my.fish | fish
```

If you don’t want to pipe the installation commands directly to _curl_, see the installation section of Oh My Fish’s [README][9] for alternative installation methods.

Fish’s powerline plugin is [bobthefish][7]. Bobthefish requires the _powerline-fonts_ package.

**On Fedora Workstation**:

```
> sudo dnf install powerline-fonts
```

**On Fedora Silverblue**:

```
> rpm-ostree install powerline-fonts
```

On Fedora Silverblue you will have to reboot to complete the installation of the fonts.

After you have installed the _powerline-fonts_ package, install _bobthefish_:

```
> omf install bobthefish
```

Now you can experience the full awesomeness of fish with powerline:

![][10]

### Additional resources

Check out these web pages to learn even more about fish:

  * [Official page][11]
  * [Documentation][12]
  * [Tutorial][13]
  * [FAQ][14]
  * [Web playground][15]
  * [Mailing lists][16]
  * [GitHub][17]



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fish-a-friendly-interactive-shell/

作者：[Michal Konečný][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zlopez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/03/fish-816x345.jpg
[2]: https://fedoramagazine.org/howto-use-sudo/
[3]: https://fedoramagazine.org/wp-content/uploads/2020/03/Screenshot-from-2020-03-03-14-00-35.png
[4]: https://fedoramagazine.org/wp-content/uploads/2020/03/Screenshot-from-2020-03-03-14-19-24.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/03/Screenshot-from-2020-03-03-14-25-31.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/03/Screenshot-from-2020-03-03-14-58-07.png
[7]: https://github.com/oh-my-fish/theme-bobthefish
[8]: https://github.com/oh-my-fish/oh-my-fish
[9]: https://github.com/oh-my-fish/oh-my-fish/blob/master/README.md#installation
[10]: https://fedoramagazine.org/wp-content/uploads/2020/03/Screenshot-from-2020-03-03-15-38-07.png
[11]: https://fishshell.com/
[12]: https://fishshell.com/docs/current/index.html
[13]: https://fishshell.com/docs/current/tutorial.html
[14]: https://fishshell.com/docs/current/faq.html
[15]: https://rootnroll.com/d/fish-shell/
[16]: https://sourceforge.net/projects/fish/lists/fish-users
[17]: https://github.com/fish-shell/fish-shell/
