[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tuning your bash or zsh shell on Fedora Workstation and Silverblue)
[#]: via: (https://fedoramagazine.org/tuning-your-bash-or-zsh-shell-in-workstation-and-silverblue/)
[#]: author: (George Luiz Maluf https://fedoramagazine.org/author/georgelmaluf/)

Tuning your bash or zsh shell on Fedora Workstation and Silverblue
======

![][1]

This article shows you how to set up some powerful tools in your command line interpreter (CLI) shell on Fedora. If you use _bash_ (the default) or _zsh_, Fedora lets you easily setup these tools.

### Requirements

Some installed packages are required. On Workstation, run the following command:

```
sudo dnf install git wget curl ruby ruby-devel zsh util-linux-user redhat-rpm-config gcc gcc-c++ make
```

On Silverblue run:

```
sudo rpm-ostree install git wget curl ruby ruby-devel zsh util-linux-user redhat-rpm-config gcc gcc-c++ make
```

**Note**: On Silverblue you need to restart before proceeding.

### Fonts

You can give your terminal a new look by installing new fonts. Why not fonts that display characters and icons together?

##### Nerd-Fonts

Open a new terminal and type the following commands:

```
git clone https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts
cd .nerd-fonts
sudo ./install.sh
```

##### Awesome-Fonts

On Workstation, install using the following command:

```
sudo dnf fontawesome-fonts
```

On Silverblue, type:

```
sudo rpm-ostree install fontawesome-fonts
```

### Powerline

Powerline is a statusline plugin for vim, and provides statuslines and prompts for several other applications, including bash, zsh, tmus, i3, Awesome, IPython and Qtile.

Fedora Magazine previously posted an [article about powerline][2] that includes instructions on how to install it in the vim editor. You can also find more information on the official [documentation site][3].

#### Installation

To install powerline utility on Fedora Workstation, open a new terminal and run:

```
sudo dnf install powerline vim-powerline tmux-powerline powerline-fonts
```

On Silverblue, the command changes to:

```
sudo rpm-ostree install powerline vim-powerline tmux-powerline powerline-fonts
```

**Note**: On Silverblue, before proceeding you need restart.

#### Activating powerline

To make the powerline active by default, place the code below at the end of your _~/.bashrc_ file

```
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi
```

Finally, close the terminal and open a new one. It will look like this:

![][4]

### Oh-My-Zsh

[Oh-My-Zsh][5] is a framework for managing your Zsh configuration. It comes bundled with helpful functions, plugins, and themes. To learn how set Zsh as your default shell this [article][6].

#### Installation

Type this in the terminal:

```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Alternatively, you can type this:

```
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

At the end, you see the terminal like this:

![][7]

Congratulations, Oh-my-zsh is installed.

#### Themes

Once installed, you can select your theme. I prefer to use the Powerlevel10k. One advantage is that it is 100 times faster than powerlevel9k theme. To install run this line:

```
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
```

And set ZSH_THEME in your _~/.zshrc_ file

```
ZSH_THEME=powerlevel10k/powerlevel10k
```

Close the terminal. When you open the terminal again, the Powerlevel10k configuration wizard will ask you a few questions to configure your prompt properly.

![][8]

After finish Powerline10k configuration wizard, your prompt will look like this:

![][9]

If you don’t like it. You can run the powerline10k wizard any time with the command _p10k configure_.

#### Enable plug-ins

Plug-ins are stored in _.oh-my-zsh/plugins_ folder. You can visit this site for more information. To activate a plug-in, you need edit your _~/.zshrc_ file. Install plug-ins means that you are going create a series of aliases or shortcuts that execute a specific function.

For example, to enable the firewalld and git plugins, first edit ~/.zshrc:

```
plugins=(firewalld git)
```

**Note**: use a blank space to separate the plug-ins names list.

Then reload the configuration

```
source ~/.zshrc
```

To see the created aliases, use the command:

```
alias | grep firewall
```

![][10]

#### Additional configuration

I suggest the install syntax-highlighting and syntax-autosuggestions plug-ins.

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Add them to your plug-ins list in your file _~/.zshrc_

```
plugins=( [plugins...] zsh-syntax-highlighting zsh-autosuggestions)
```

Reload the configuration

```
source ~/.zshrc
```

See the results:

![][11]

### Colored folders and icons

Colorls is a Ruby gem that beautifies the terminal’s ls command, with colors and font-awesome icons. You can visit the official [site][12] for more information.

Because it’s a ruby gem, just follow this simple step:

```
sudo gem install colorls
```

To keep up to date, just do:

```
sudo gem update colorls
```

To prevent type colorls everytime you can make aliases in your _~/.bashrc_ or _~/.zshrc_.

```
alias ll='colorls -lA --sd --gs --group-directories-first'
alias ls='colorls --group-directories-first'
```

Also, you can enable tab completion for colorls flags, just entering following line at end of your shell configuration:

```
source $(dirname ($gem which colorls))/tab_complete.sh
```

Reload it and see what it happens:

![][13]

![][14]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/tuning-your-bash-or-zsh-shell-in-workstation-and-silverblue/

作者：[George Luiz Maluf][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/georgelmaluf/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/tuning-shell-816x345.jpg
[2]: https://fedoramagazine.org/add-power-terminal-powerline/
[3]: https://powerline.readthedocs.io/en/latest/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/10/terminal_bash_powerline.png
[5]: https://ohmyz.sh
[6]: https://fedoramagazine.org/set-zsh-fedora-system/
[7]: https://fedoramagazine.org/wp-content/uploads/2019/10/oh-my-zsh.png
[8]: https://fedoramagazine.org/wp-content/uploads/2019/10/powerlevel10k_config_wizard.png
[9]: https://fedoramagazine.org/wp-content/uploads/2019/10/powerlevel10k.png
[10]: https://fedoramagazine.org/wp-content/uploads/2019/10/aliases_plugin.png
[11]: https://fedoramagazine.org/wp-content/uploads/2019/10/sintax.png
[12]: https://github.com/athityakumar/colorls
[13]: https://fedoramagazine.org/wp-content/uploads/2019/10/ls-1024x495.png
[14]: https://fedoramagazine.org/wp-content/uploads/2019/10/ll-1024x495.png
