translating---geekpi

Incomplete Path Expansion (Completion) For Bash
======

![](https://4.bp.blogspot.com/-k2pRIKTzcBU/W1BpFtzzWuI/AAAAAAAABOE/pqX4XcOX8T4NWkKOmzD0T0OioqxzCmhLgCLcBGAs/s1600/Gnu-bash-logo.png)

[bash-complete-partial-path][1] enhances the path completion in Bash (on Linux, macOS with gnu-sed, and Windows with MSYS) by adding incomplete path expansion, similar to Zsh. This is useful if you want this time-saving feature in Bash, without having to switch to Zsh.

Here is how this works. When the `Tab` key is pressed, bash-complete-partial-path assumes each component is incomplete and tries to expand it. Let's say you want to navigate to `/usr/share/applications` . You can type `cd /u/s/app` , press `Tab` , and bash-complete-partial-path should expand it into `cd /usr/share/applications` . If there are conflicts, only the path without conflicts is completed upon pressing `Tab` . For instance Ubuntu users should have quite a few folders in `/usr/share` that begin with "app" so in this case, typing `cd /u/s/app` will only expand the `/usr/share/` part.

Here is another example of deeper incomplete file path expansion. On an Ubuntu system type `cd /u/s/f/t/u` , press `Tab` , and it should be automatically expanded to cd `/usr/share/fonts/truetype/ubuntu` .

Features include:

*   Escapes special characters

*   If the user starts the path with quotes, character escaping is not applied and instead, the quote is closed with a matching character after expending the path

*   Properly expands ~ expressions

*   If bash-completion package is already in use, this code will safely override its _filedir function. No extra configuration is required, just make sure you source this project after the main bash-completion.

Check out the [project page][2] for more information and a demo screencast.

### Install bash-complete-partial-path

The bash-complete-partial-path installation instructions specify downloading the bash_completion script directly. I prefer to grab the Git repository instead, so I can update it with a simple `git pull` , therefore the instructions below will use this method of installing bash-complete-partial-path. You can use the [official][3] instructions if you prefer them.

1. Install Git (needed to clone the bash-complete-partial-path Git repository).

In Debian, Ubuntu, Linux Mint and so on, use this command to install Git:

```
sudo apt install git
```

2. Clone the bash-complete-partial-path Git repository in `~/.config/`:

```
cd ~/.config && git clone https://github.com/sio/bash-complete-partial-path
```

3. Source `~/.config/bash-complete-partial-path/bash_completion` in your `~/.bashrc` file,

Open ~/.bashrc with a text editor. You can use Gedit for example:

```
gedit ~/.bashrc
```

At the end of the `~/.bashrc` file add the following (as a single line):

```
[ -s "$HOME/.config/bash-complete-partial-path/bash_completion" ] && source "$HOME/.config/bash-complete-partial-path/bash_completion"
```

I mentioned adding it at the end of the file because this needs to be included below (after) the main bash-completion from your `~/.bashrc` file. So make sure you don't add it above the original bash-completion as it will cause issues.

4\. Source `~/.bashrc`:

```
source ~/.bashrc
```

And you're done, bash-complete-partial-path should now be installed and ready to be used.



--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/07/incomplete-path-expansion-completion.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://github.com/sio/bash-complete-partial-path
[2]:https://github.com/sio/bash-complete-partial-path
[3]:https://github.com/sio/bash-complete-partial-path#installation-and-updating
