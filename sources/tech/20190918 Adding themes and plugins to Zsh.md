[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Adding themes and plugins to Zsh)
[#]: via: (https://opensource.com/article/19/9/adding-plugins-zsh)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/seth)

Adding themes and plugins to Zsh
======
Expand Z-shell's capabilities with themes and plugins installed with Oh
My Zsh.
![Someone wearing a hardhat and carrying code ][1]

In my [previous article][2], I explained how to get started with [Z-shell][2] (Zsh). For some users, the most exciting thing about Zsh is its ability to adopt new themes. It's so easy to theme Zsh both because of the active community designing visuals for the shell and also because of the [Oh My Zsh][3] project, which makes it trivial to install them.

Theming is one of those changes you notice immediately, so if you don't feel like you changed shells when you installed Zsh, you'll definitely feel it once you've adopted one of the 100+ themes bundled with Oh My Zsh. There's a lot more to Oh My Zsh than just pretty themes, though; there are also hundreds of plugins that add features to your Z-shell environment.

### Installing Oh My Zsh

The [ohmyz.sh][3] website encourages you to install the framework by running a script over the internet from your computer. While the Oh My Zsh project is almost certainly trustworthy, it's generally ill-advised to blindly run scripts on your system. If you want to run the install script, you can download it, read it, and run it after you're satisfied you understand what it's doing.

If you download the script and read it, you may notice that installation is only a three-step process:

#### 1\. Clone oh-my-zsh

First, clone the oh-my-zsh repository into a directory called **~/.oh-my-zsh**:


```
`% git clone http://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh`
```

#### 2\. Switch the config file

Next, back up your existing **.zshrc** file and move the default one from the oh-my-zsh install into its place. You can do this in one command using the **-b** (backup) option for **mv**, as long as your version of the **mv** command includes that option:


```
% mv -b \
~/.oh-my-zsh/templates/zshrc.zsh-template \
~/.zshrc
```

#### 3\. Edit the config

By default, Oh My Zsh's configuration is pretty bland, so you might want to reintegrate your custom **~/.zshrc** into the **.oh-my-zsh** config. To do that, append your old config to the end of the new one using the [cat command][4]:


```
`% cat ~/.zshrc~ >> ~/.zshrc`
```

To see the default configuration and learn about some of the options it provides, open **~/.zshrc** in your favorite text editor. The file is well-commented, so it's a great way to get a good idea of what's possible.

For instance, you can change the location of your **.oh-my-zsh** directory. At installation, it resides at the base of your home directory, but modern Linux convention, as defined by the [Free Desktop][5] specification, is to place directories that extend the functionality of applications in the **~/.local/share** directory. You can change it in **~/.zshrc** by editing the line:


```
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.local/share/oh-my-zsh
```

then moving the directory to that location:


```
% mv ~/.oh-my-zsh \
$HOME/.local/share/oh-my-zsh
```

If you're using MacOS, the specification is less clear, but arguably the most appropriate place for the directory is **$HOME/Library/Application\ Support**.

### Relaunching Zsh

After editing the config, you have to relaunch your shell. Before you do that, make sure you've finished any in-progress config changes; for instance, don't change the path of **.oh-my-zsh** then forget to move the directory to its new location. If you don't want to relaunch your shell, you can **source** the config file, just as you can with Bash:


```
% source ~/.zshrc
➜  .oh-my-zsh git:(master) ✗
```

You can ignore any warnings about missing update files; they will be resolved upon relaunch.

### Changing your theme

Installing Oh My Zsh sets your Z-shell theme to **robbyrussell**, a theme by the project's maintainer. This theme's changes are minimal, mostly involving the color of your prompt.

To view all the available themes, list the contents of the **.oh-my-zsh** theme directory:


```
➜  .oh-my-zsh git:(master) ✗ ls \
~/.local/share/oh-my-zsh/themes
3den.zsh-theme
adben.zsh-theme
af-magic.zsh-theme
afowler.zsh-theme
agnoster.zsh-theme
[...]
```

To see screenshots of themes before trying them, visit the Oh My Zsh [wiki][6]. For even more themes, visit the [External themes][7] wiki page.

Most themes are simple to set up and use. Just change the value of the theme name in **.zshrc** and reload the config:


```
➜ ~ sed -i \
's/_THEME=\"robbyrussel\"/_THEME=\"linuxonly\"/g' \
~/.zshrc
➜ ~ source ~/.zshrc
seth@darkstar:pts/0-&gt;/home/skenlon (0) ➜
```

Other themes require extra configuration. For example, to use the **agnoster** theme, you must first install the Powerline font. This is an open source font, and it's probably in your software repository if you're running Linux. Install it with:


```
`➜ ~ sudo dnf install powerline-fonts`
```

Set your theme in the config:


```
➜ ~ sed -i \
's/_THEME=\"linuxonly\"/_THEME=\"agnoster\"/g' \
~/.zshrc
```

and then relaunch (a simple **source** won't work). Upon relaunch, you will see the new theme:

![agnoster theme][8]

### Installing plugins

Over 200 plugins ship with Oh My Zsh, and you can see them by looking in **.oh-my-zsh/plugins**. Each plugin directory has a README file explaining what the plugin does.

Some plugins are relatively simple. For instance, the **dnf**, **ubuntu**, **brew**, and **macports** plugins are collections of aliases to simplify interactions with the DNF, Apt, Homebrew, and MacPorts package managers.

Others are more complex. The **git** plugin, active by default, detects when you're working in a [Git repository][9] and updates your shell prompt so that it lists the current branch and even indicates whether there are unmerged changes.

To activate a plugin, add it to the plugin setting in **~/.zshrc**. For example, to add the **dnf** and **pass** plugins, open **~/.zshrc** in your favorite text editor:


```
`plugins=(git dnf pass)`
```

Save your changes and reload your Zsh session:


```
`% source ~/.zshrc`
```

The plugins are now active. You can test the **dnf** plugin by using one of the aliases it provides:


```
% dnfs fop
====== Name Exactly Matched: fop ======
fop.noarch : XSL-driven print formatter
```

Different plugins do different things, so you may want to install only one or two at a time to help you learn the new capabilities of your shell.

#### Cheating

Some Oh My Zsh plugins are pretty generic. If you look at a plugin that claims to be a Z-shell plugin and the code is also compatible with Bash, then you can use it in your Bash shell. Some plugins require Z-shell-specific functions, so this won't work with all of them. But you can load plugins like **dnf**, **ubuntu**, **[firewalld][10]**, and others into a Bash shell by using **source** to load the plugin of your choice. For example:


```
if [ -d $HOME/.local/share/oh-my-zsh/plugins ]; then
        source $HOME/.local/share/oh-my-zsh/plugins/dnf/dnf.plugin.zsh
fi
```

### To Z or not to Z

Z-shell is a powerful shell both for its built-in features and the plugins contributed by its passionate community. Whether you use it as your primary shell or just as a shell you visit on weekends or holidays, you owe it to yourself to try it out.

What are your favorite Z-shell themes and plugins? Tell us in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/adding-plugins-zsh

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag (Someone wearing a hardhat and carrying code )
[2]: https://opensource.com/article/19/9/getting-started-zsh
[3]: https://ohmyz.sh/
[4]: https://opensource.com/article/19/2/getting-started-cat-command
[5]: http://freedesktop.org
[6]: https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
[7]: https://github.com/robbyrussell/oh-my-zsh/wiki/External-themes
[8]: https://opensource.com/sites/default/files/uploads/zsh-agnoster.jpg (agnoster theme)
[9]: https://opensource.com/resources/what-is-git
[10]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
