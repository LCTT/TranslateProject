[#]: subject: (4 steps to customizing your Mac terminal theme with open source tools)
[#]: via: (https://opensource.com/article/21/4/zsh-mac)
[#]: author: (Bryant Son https://opensource.com/users/brson)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

4 steps to customizing your Mac terminal theme with open source tools
======
Make your terminal window pretty on your Mac with open source tools.
![4 different color terminal windows with code][1]

Do you ever get bored with seeing the same old terminal window on your macOS computer? If so, add some bells and whistles to your view with the open source Oh My Zsh framework and Powerlevel10k theme.

This basic step-by-step walkthrough (including a video tutorial at the end) will get you started customizing your macOS terminal. If you're a Linux user, check out Seth Kenlon's guide to [Adding themes and plugins to Zsh][2] for in-depth guidance.

### Step 1: Install Oh My Zsh

[Oh My Zsh][3] is an open source, community-driven framework for managing your Z shell (Zsh) configuration.

![Oh My Zsh][4]

(Bryant Son, [CC BY-SA 4.0][5])

Oh My Zsh is released under the MIT License. Install it with:


```
`$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
```

### Step 2: Install Powerlevel10k fonts

![Powerlevel10k][6]

(Bryant Son, [CC BY-SA 4.0][5])

Powerlevel10k is an MIT-Licensed Zsh theme. Before installing Powerlevel10k, you will want to install custom fonts for your terminal.

Go to the [Powerlevel10 GitHub][7] page, and search for "fonts" in the README. The steps for installing the custom fonts will vary depending on your operating system; the video at the bottom of this page explains how to do it on macOS. It should be just a simple click–download–install series of operations.

![Powerlevel10k fonts][8]

(Bryant Son, [CC BY-SA 4.0][5])

### Step 3: Install the Powerlevel10k theme

Next, install Powerlevel10k by running:


```
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
```

After you finish, open a `~/.zshrc` configuration file with a text editor, such as [Vim][9], set the line `ZSH_THEME="powerlevel10k/powerlevel10k`, then save the file.

### Step 4: Finalize your Powerlevel10k setup

Open a new terminal, and you should see the Powerlevel10k configuration wizard. If not, run `p10k configure` to bring up the configuration wizard. If you installed the custom fonts in Step 2, the icons and symbols should display correctly. Change the default font to **MeslowLG NF** (see the video below for instructions).

![Powerlevel10k configuration][10]

(Bryant Son, [CC BY-SA 4.0][5])

Once you complete the configuration, you should see a beautiful terminal.

![Oh My Zsh/Powerlevel10k theme][11]

(Bryant Son, [CC BY-SA 4.0][5])

If you want to see an interactive tutorial, please check out this video:

That's it! You should be ready to enjoy your beautiful new terminal. Be sure to check out other Opensource.com articles for more tips and articles on using the shell, Linux administration, and more.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/zsh-mac

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos.png?itok=aOBLy7Ky (4 different color terminal windows with code)
[2]: https://opensource.com/article/19/9/adding-plugins-zsh
[3]: https://ohmyz.sh/
[4]: https://opensource.com/sites/default/files/uploads/1_ohmyzsh.jpg (Oh My Zsh)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/2_powerlevel10k.jpg (Powerlevel10k)
[7]: https://github.com/romkatv/powerlevel10k
[8]: https://opensource.com/sites/default/files/uploads/3_downloadfonts.jpg (Powerlevel10k fonts)
[9]: https://opensource.com/resources/what-vim
[10]: https://opensource.com/sites/default/files/uploads/4_p10kconfiguration.jpg (Powerlevel10k configuration)
[11]: https://opensource.com/sites/default/files/uploads/5_finalresult.jpg (Oh My Zsh/Powerlevel10k theme)
