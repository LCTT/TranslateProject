How To Upgrade Everything Using A Single Command In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/topgrade-720x340.png)

As we all know already, keeping our Linux system up-to-date involves invoking more than one package manager. Say for instance, in Ubuntu you can’t upgrade everything using “sudo apt update && sudo apt upgrade” command. This command will only upgrade the applications which are installed using APT package manager. There are chances that you might have installed some other applications using **cargo** , [**pip**][1], **npm** , **snap** , **flatpak** or [**Linuxbrew**][2] package managers. You need to use the respective package manager in order to keep them all updated. Not anymore! Say hello to **“topgrade”** , an utility to upgrade all the things in your system in one go.

You need not to run every package manager to update the packages. The topgrade tool resolves this problem by detecting the installed packages, tools, plugins and run their appropriate package manager to update everything in your Linux box with a single command. It is free, open source and written using **rust programming language**. It supports GNU/Linux and Mac OS X.

### Upgrade Everything Using A Single Command In Linux

The topgrade is available in AUR. So, you can install it using [**Yay**][3] helper program in any Arch-based systems.
```
$ yay -S topgrade

```

On other Linux distributions, you can install topgrade utility using **cargo** package manager. To install cargo package manager, refer the following link.

And, then run the following command to install topgrade.
```
$ cargo install topgrade

```

Once installed, run the topgrade to upgrade all the things in your Linux system.
```
$ topgrade

```

Once topgrade is invoked, it will perform the following tasks one by one. You will be asked to enter root/sudo user password wherever necessary.

1 Run your system’s package manager:

  * Arch: Run **yay** or fall back to [**pacman**][4]
  * CentOS/RHEL: Run `yum upgrade`
  * Fedora – Run `dnf upgrade`
  * Debian/Ubuntu: Run `apt update && apt dist-upgrade`
  * Linux/macOS: Run `brew update && brew upgrade`



2\. Check if the following paths are tracked by Git. If so, pull them:

  * ~/.emacs.d (Should work whether you use **Spacemacs** or a custom configuration)
  * ~/.zshrc
  * ~/.oh-my-zsh
  * ~/.tmux
  * ~/.config/fish/config.fish
  * Custom defined paths



3\. Unix: Run **zplug** update

4\. Unix: Upgrade **tmux** plugins with **TPM**

5\. Run **Cargo install-update**

6\. Upgrade **Emacs** packages

7\. Upgrade Vim packages. Works with the following plugin frameworks:

  * NeoBundle
  * [**Vundle**][5]
  * Plug



8\. Upgrade [**NPM**][6] globally installed packages

9\. Upgrade **Atom** packages

10\. Update [**Flatpak**][7] packages

11\. Update [**snap**][8] packages

12\. **Linux:** Run **fwupdmgr** to show firmware upgrade. (View only. No upgrades will actually be performed)

13\. Run custom defined commands.

Finally, topgrade utility will run **needrestart** to restart all services. In Mac OS X, it will upgrade App Store applications.

Sample output from my Ubuntu 18.04 LTS test box:

![][10]

The good thing is if one task is failed, it will automatically run the next task and complete all other subsequent tasks. Finally, it will display the summary with details such as how many tasks did it run, how many succeeded and how many failed etc.

![][11]

**Suggested read:**

Personally, I liked this idea of creating an utility like topgrade and upgrade everything installed with various package managers with a single command. I hope you find it useful too. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-upgrade-everything-using-a-single-command-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/manage-python-packages-using-pip/
[2]:https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
[3]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]:https://www.ostechnix.com/getting-started-pacman/
[5]:https://www.ostechnix.com/manage-vim-plugins-using-vundle-linux/
[6]:https://www.ostechnix.com/manage-nodejs-packages-using-npm/
[7]:https://www.ostechnix.com/flatpak-new-framework-desktop-applications-linux/
[8]:https://www.ostechnix.com/install-snap-packages-arch-linux-fedora/
[9]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]:http://www.ostechnix.com/wp-content/uploads/2018/06/topgrade-1.png
[11]:http://www.ostechnix.com/wp-content/uploads/2018/06/topgrade-2.png
