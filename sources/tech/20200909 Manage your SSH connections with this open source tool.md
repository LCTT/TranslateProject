[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage your SSH connections with this open source tool)
[#]: via: (https://opensource.com/article/20/9/ssh-connection-manager)
[#]: author: (Kenneth Aaron https://opensource.com/users/flyingrhino)

Manage your SSH connections with this open source tool
======
This open source project makes connecting to any SSH session quick and
seamless, and downright relaxing.
![Penguins][1]

OpenSSH is widely used, but there isn't a well-known connection manager, so I developed the ncurses SSH connection manager (`nccm`) to fill that significant gap in the process. `nccm` is a simple SSH connection manager with an ultra-portable terminal interface (written in ncurses, as the project name suggests). And best of all, it's straightforward to use. With `nccm`, you can connect to an SSH session of your choice with minimum distraction and minimal keystrokes.

### Install nccm

The quickest way to get going is to clone the project from its [Git repository][2]:


```
`$ git clone https://github.com/flyingrhinonz/nccm nccm.git`
```

In the `nccm.git/nccm` directory, there are two files—`nccm` itself and an `nccm.yml` configuration file.

First, copy the nccm script to `/usr/local/bin/` and grant it executable permissions. You can do this in one step with the `install` command:


```
$ sudo install -m755 nccm
–target-directory /usr/local/bin
```

The `nccm.yml` file can be copied to any one of these locations, and is loaded from the first location found:

  * `~/.config/nccm/nccm.yml`
  * `~/.nccm.yml`
  * `~/nccm.yml`
  * `/etc/nccm.yml`



The `nccm` command requires Python 3 to be installed on your machine, which shouldn't be a problem on most Linux boxes. Most Python library dependencies are already present as part of Python 3; however, there are some YAML dependencies and utilities you must install.

If you don't have `pip` installed, you can install it with your package manager. And while you're at it, install the `yamllint` application to help you validate the `nccm.yml` file.

On Debian or similar, use `apt`:


```
`$ sudo apt install python3-pip yamllint`
```

On Fedora or similar, use `dnf`:


```
`$ sudo dnf install python3-pip yamllint`
```

You also need PyYAML, which you can install with the `pip` command:


```
`$ pip3 install --user PyYAML`
```

### Using nccm

Before starting, edit the `nccm.yml` file and add your SSH configuration. Formatting YAML is easy, and there are examples provided in the file. Just follow the structure—provide the connection name at the beginning of the line, with config items indented two spaces. Don't forget the colons—these are part of the YAML language.

Don't worry about ordering your SSH session blocks in any specific way, because `nccm` gives you "sort by" options within the program.

Once you've finished editing, check your work with `yamllint`:


```
`$ yamllint ~/.config/nccm/nccm.yml`
```

If no errors are returned, then you've formatted your file correctly, and it's safe to continue.

If `nccm` is accessible [from your path][3] and is executable, then typing `nccm` is all that's required to launch the TUI (terminal user interface). If you see Python 3 exceptions, check whether you have satisfied the dependencies. Any exceptions should mention any package that's missing.

As long as you're using the YAML config file without changing `nccm_config_control mode`, then you can use these keyboard controls:

  * Up/Down arrows - Move the marker the traditional way
  * Home/End - Jump marker to list first/last entry
  * PgUp/PgDn - Page up/down in the list
  * Left/Right arrows - Scroll the list horizontally
  * TAB - Moves the cursor between text boxes
  * Enter - Connect to the selected entry
  * Ctrl-h - Display this help menu
  * Ctrl-q or Ctrl-c - Quit the program
  * F1-F5 or !@#$% - Sort by respective column (1-5)



Use keys F1 through F5 to sort by columns 1 through 5. If your desktop captures F-key input, you can instead sort by pressing **!@#$%** in the "Conn" text box. The display shows 4 visible columms but we treat username and server address as separate columns for sorting purposes giving us 5 controls for sorting. You can reverse the order by pressing the same "sort" key a second time. A connection can be made by pressing **Enter** on the highlighted line.

![nccm screenshot terminal view][4]

Typing text into the "Filter" text box filters the output with an "and" function between everything entered. This is case-insensitive, and a blank space delimits entries. The same is true for the "Conn" text box, but pressing **Enter** here connects to that specific entry number.

There are a few more interesting features to discover, such as focus mode, but I'll leave it up to you to explore the details. See the project page or built-in help for more details.

The config YAML file is well-documented, so you'll know how to edit the settings to make `nccm` work best for you. The `nccm` program is highly commented, too, so you may wish to fork or mod it to add more features. Pull requests are welcome!

### Relax into SSH with nccm

I hope this program serves you well and is as useful to you as it is to me. Thanks for being part of the open source community, and please accept `nccm` as my contribution to the ongoing efforts toward seamless, painless, and efficient computing experiences.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/ssh-connection-manager

作者：[Kenneth Aaron][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/flyingrhino
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux-penguins.png?itok=yKOpaJM_ (Penguins)
[2]: https://github.com/flyingrhinonz/nccm
[3]: https://opensource.com/article/17/6/set-path-linux
[4]: https://opensource.com/sites/default/files/uploads/nccm_screenshot.png (nccm screenshot terminal view)
