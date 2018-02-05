Oh My Fish! Make Your Shell Beautiful
======
![](https://www.ostechnix.com/wp-content/uploads/2017/12/oh-my-fish-720x340.jpg)

A few days ago, we discussed how to [**install** **Fish shell**][1], a robust, fully-usable shell that ships with many cool features out of the box such as autosuggestions, built-in search functionality, syntax highlighting, web based configuration and a lot more. Today, we are going to discuss how to make our Fish shell beautiful and elegant using **Oh My Fish** (shortly **omf** ). It is a Fishshell framework that allows you to install packages which extend or modify the look and feel of your shell. It is easy to use, fast and extensible. Using omf, you can easily install themes that enriches the look of your shell and install plugins to tweak your fish shell as per your wish.

#### Install Oh My Fish

Installing omf is not a big deal. All you have to do is just run the following command in your fish shell.
```
curl -L https://get.oh-my.fish | fish
```

![][3]

Once the installation has completed, you will see the the prompt has automatically changed as shown in the above picture. Also, you will notice that the current time on the right of the shell window.

That's it. Let us go ahead and tweak our fish shell.

#### Now, Let Us Make Our Fish Shell Beautiful

To list all installed packages, run:
```
omf list
```

This command will display both the installed themes and plugins. Please note that a package can be either a theme or plugin. Installing packages means installing themes or plugins.

All official and community supported packages (both plugins and themes) are hosted in the [**main Omf repository**][4]. In this repository, you can see a whole bunch of repositories that contains a lot of plugins and themes.

Now let us see the list of available and installed themes. To do so, run:
```
omf theme
```

[![][2]][5]

As you can see, we have only one installed theme, which is default, and a whole bunch of available themes. You can preview all available themes [**here**][6] before installing it. This page contains all theme details, features, a sample screenshot of each theme and which theme is suitable for whom.

**Installing a new theme**

Allow me to install a theme, for example **clearance theme - **a minimalist fish shell theme for people who use git a lot. To do so, run:
```
omf install clearance
```

[![][2]][7]

As you see in the above picture, the look of fish prompt has changed immediately after installing the new theme.

Let me browse through the file system and see how it looks like.

[![][2]][8]

Not bad! It is really simple theme. It distinguishes the current working directory, folders and files with different color. As you may notice, it also displays the current working directory on top of the prompt. Currently, **clearance** is my default theme.

**Changing theme**

Like I already said, the theme will be applied immediately after installing it. If you have more than one themes, you can switch to a different theme using the following command:
```
omf theme <theme-name>
```

Example:
```
omf theme agnoster
```

Now I am using "agnoster" theme. Here is how agnoster theme changed the look of my shell.

[![][2]][9]

**Installing Plugins**

For instance, I am going to install weather plugin. To do so, just run:
```
omf install weather
```

The weather plugin depends on [jq][10]. So, you might need to install jq as well. It is mostly available in the default repositories of any Linux distro. So, you can install it using the default package manager. For example, the following command will install jq in Arch Linux and its variants.
```
sudo pacman -S jq
```

Now, check your weather from your fish shell using command:
```
weather
```

[![][2]][11]

**Searching packages**

To search for a theme or plugin, do:
```
omf search <search_string>
```

Example:
```
omf search nvm
```

To limit the search to themes, use **-t** flag.
```
 omf search -t chain
```

This command will only search for themes that contains the string "chain".

To limit the search to plugins, use **-p** flag.
```
 omf search -p emacs
```

**Updating packages**

To update only the core (omf itself), run:
```
omf update omf
```

If it is up-to-date, you would see the following output:
```
Oh My Fish is up to date.
You are now using Oh My Fish version 6.
Updating https://github.com/oh-my-fish/packages-main master... Done!
```

To update all packages:
```
omf update
```

To selectively update packages, just include the packages names as shown below.
```
omf update clearance agnoster
```

**Displaying information about a package**

When you want to know the information about a theme or plugin, use this command:
```
omf describe clearance
```

This command will show the information about a package.
```
Package: clearance
Description: A minimalist fish shell theme for people who use git
Repository: https://github.com/oh-my-fish/theme-clearance
Maintainer:
```

**Removing packages**

To remove a package, for example emacs, run:
```
omf remove emacs
```

**Managing Repositories**

By default, the official repository is added automatically when you install Oh My Fish. This repository contains all packages built by the developers. To manage user-installed package repositories, use this command:
```
omf repositories [list|add|remove]
```

To list installed repositories, run:
```
omf repositories list
```

To add a repository:
```
omf repositories add <URL>
```

Example:
```
omf repositories add https://github.com/ostechnix/theme-sk
```

To remove a repository:
```
omf repositories remove <repository-name>
```

**Troubleshooting Oh My Fish**

Omf is smart enough to help you if things went wrong. It will list what to do to fix an issue. For example, I removed and installed clearance package and got file conflicting error. Luckily, Oh My Fish instructed me what to do before continuing. So, I simply ran the following to know how to fix the error:
```
omf doctor
```

And fixed the issued the error by running the following command:
```
rm ~/.config/fish/functions/fish_prompt.fish
```

[![][2]][12]

Whenever you ran into a problem, just run 'omf doctor' command and try all suggested workarounds.

**Getting help**

To display help section, run:
```
omf -h
```

Or,
```
omf --help
```

**Uninstalling Oh My Fish**

To uninstall Oh My Fish, run this command:
```
omf destroy
```

Go ahead and start customizing your fish shell. For more details, refer the project's GitHub page.

That's all for now folks. I will be soon here with another interesting guide. Until then, stay tuned with OSTechNix!

Cheers!



--------------------------------------------------------------------------------
via: https://www.ostechnix.com/oh-fish-make-shell-beautiful/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/install-fish-friendly-interactive-shell-linux/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-1-1.png ()
[4]:https://github.com/oh-my-fish
[5]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-5.png ()
[6]:https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md
[7]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-3.png ()
[8]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-4.png ()
[9]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-6.png ()
[10]:https://stedolan.github.io/jq/
[11]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-7.png ()
[12]:http://www.ostechnix.com/wp-content/uploads/2017/12/Oh-My-Fish-8.png ()
