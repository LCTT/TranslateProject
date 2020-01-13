[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use Stow for configuration management of multiple machines)
[#]: via: (https://opensource.com/article/20/1/configuration-management-stow)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

Use Stow for configuration management of multiple machines
======
Learn how to use Stow to manage configurations across machines in the
second article in our series on 20 ways to be more productive with open
source in 2020.
![A person programming][1]

Last year, I brought you 19 days of new (to you) productivity tools for 2019. This year, I'm taking a different approach: building an environment that will allow you to be more productive in the new year, using tools you may or may not already be using.

### Manage symlinks with Stow

Yesterday, I explained how I keep my files in sync across multiple machines with [Syncthing][2]. But that's only one of the tools I use to keep my configurations consistent. The other is a seemingly simple tool called [Stow][3].

![Stow help screen][4]

Stow manages symlinks. By default, it makes symlinks from the directory it is in to the directory below it. There are also options to set a source and target directory, but I don't usually use them.

As I mentioned in the Syncthing [article][5], I use Syncthing to keep a directory called **myconfigs** consistent across all of my machines. The **myconfigs** directory has several subdirectories underneath it. Each subdirectory contains the configuration files for one of the applications I use regularly.

![myconfigs directory][6]

On each machine, I change to the **myconfigs** directory and run **stow -S &lt;directory name&gt;** to symlink the files inside the directory to my home directory. For example, under the **vim** directory, I have my **.vimrc** and **.vim** directories. On each machine, I run **stow -S vim** to create the symlinks **~/.vimrc** and **~/.vim**. When I make a change to my Vim configuration on one machine, it applies to ALL of my machines.

Sometimes, though, I need something machine-specific, which is why I have directories like **msmtp-personal** and **msmtp-elastic** (my employer). Since my **msmtp** SMTP client needs to know what email server to relay through, and each one has different setups and credentials, I can use Stow to swap between the two by "unstowing" one with the **-D** flag and then putting the other in place.

![Unstow one, stow the other][7]

Sometimes I find myself adding files to a configuration. For that, there is the "restow" option with **-R**. For example, I like to use a specific font when I use Vim as a graphical application and not a console. The **.gvimrc** file lets me set options that apply only to the graphical version, in addition to the standard **.vimrc** file. When I first set this up, I moved **~/.gvimrc** to **~/myconfigs/vim** and then ran **stow -R vim**, which unlinks and relinks everything in that directory.

Stow lets me switch between several configurations with a simple command line and, in combination with Syncthing, I can be sure that I have the setup I like for the tools I use ready to go, no matter where I am or where I make changes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/configuration-management-stow

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: https://syncthing.net/
[3]: https://www.gnu.org/software/stow/
[4]: https://opensource.com/sites/default/files/uploads/productivity_2-1.png (Stow help screen)
[5]: https://opensource.com/article/20/1/20-productivity-tools-syncthing
[6]: https://opensource.com/sites/default/files/uploads/productivity_2-2.png (myconfigs directory)
[7]: https://opensource.com/sites/default/files/uploads/productivity_2-3.png (Unstow one, stow the other)
