Set up zsh on your Fedora system
======

![](https://fedoramagazine.org/wp-content/uploads/2017/12/zsh-816x345.jpg)

For some people, the terminal can be scary. But a terminal is more than just a black screen to type in. It usually runs a shell, so called because it wraps around the kernel. The shell is a text-based interface that lets you run commands on the system. It’s also sometimes called a command line interpreter or CLI. Fedora, like most Linux distributions, comes with bash as the default shell. However, it isn’t the only shell available; several other shells can be installed. This article focuses on the Z Shell, or zsh.

Bash is a rewrite of the old Bourne shell (sh) that shipped in UNIX. Zsh is intended to be friendlier than bash, through better interaction. Some of its useful features are:

  * Programmable command line completion
  * Shared command history between running shell sessions
  * Spelling correction
  * Loadable modules
  * Interactive selection of files and folders



Zsh is available in the Fedora repositories. To install, run this command:
```
$ sudo dnf install zsh

```

### Using zsh

To start using it, just type zsh and the new shell prompts you with a first run wizard. This wizard helps you configure initial features, like history behavior and auto-completion. Or you can opt to keep the [rc file][1] empty:

![zsh First Run Wizzard][2]

If you type 1 the configuration wizard starts. The other options launch the shell immediately.

Note that the user prompt is **%** and not **$** as with bash. A significant feature here is the auto-completion that allows you to move among files and directories with the Tab key, much like a menu:

![zsh cd Feature][3]

Another interesting feature is spelling correction, which helps when writing filenames with mixed cases:

![zsh Auto Completion][4]

## Making zsh your default shell

Zsh offers a lot of plugins, like zsh-syntax-highlighting, and the famous “Oh my zsh” ([check out its page here][5]). You might want to make it the default, so it runs whenever you start a session or open a terminal. To do this, use the chsh (“change shell”) command:
```
$ chsh -s $(which zsh)

```

This command tells your system that you want to set (-s) your default shell to the correct location of the shell (which zsh).

Photo by [Kate Ter Haar][6] from [Flickr][7] (CC BY-SA).


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/set-zsh-fedora-system/

作者：[Eduard Lucena][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/x3mboy/
[1]:https://en.wikipedia.org/wiki/Configuration_file
[2]:https://fedoramagazine.org/wp-content/uploads/2017/12/zshFirstRun.gif
[3]:https://fedoramagazine.org/wp-content/uploads/2017/12/zshChangingFeature-1.gif
[4]:https://fedoramagazine.org/wp-content/uploads/2017/12/zshAutoCompletion.gif
[5]:http://ohmyz.sh/
[6]:https://www.flickr.com/photos/katerha/
[7]:https://www.flickr.com/photos/katerha/34714051013/
