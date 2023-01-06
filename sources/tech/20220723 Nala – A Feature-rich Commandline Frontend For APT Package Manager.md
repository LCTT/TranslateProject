[#]: subject: "Nala – A Feature-rich Commandline Frontend For APT Package Manager"
[#]: via: "https://ostechnix.com/nala-commandline-frontend-for-apt/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Nala – A Feature-rich Commandline Frontend For APT Package Manager
======
Nala is a feature-rich package management tool for Debian, Ubuntu and its derivatives

**Apt**, stands for "**A**dvanced **P**ackage **T**ool", is the default, command line package manager for Debian, Ubuntu and its derivatives such as Elementary OS, Linux Mint and Pop!_OS. Using apt, we can search, install, update, upgrade and remove packages in a DEB-based system. There are a few APT frontends exists. Two popular APT front-ends are Aptitude and Synaptic. Today, we will talk about yet another APT frontend tool called **"Nala"**.

### What Is Nala?

Nala is a commandline frontend for the APT package manager. Nala uses `python-apt` api to interact with APT.

The main goal of Nala is to format the output better, use colors to show what will happen with a package during install, removal, and upgrade.

The functionality of Nala is same as APT, however Nala includes a few additional features. The developer of Nala took the inspiration from DNF package manager and implemented some of its features in Nala.

Nala formats the output to be more human readable i.e. **prettier output**. Also, Nala hides unnecessary redundant messages that you will see in APT output.

Nala supports the **history function**, just like Fedora's `dnf history` feature. Using the Nala's history function, we can see the past transactions and easily undo or redo them. You can easily undo the previous transaction and/or rollback to previous working version when something goes wrong.

Another notable feature of Nala is **Parallel downloads**. As far as I know, APT package manager doesn't has this feature yet. We should rely on third-party tools like **["Apt-fast"][1]** to speed up the package downloads in Ubuntu. Fortunately, the parallel download feature is enabled by default in Nala. So package download process is bit faster when using Nala.

The other useful feature included in Nala is **fetching fastest APT mirrors**. Currently, we can use Synaptic or some third-party tools to **[choose the best APT mirror][2]** in Ubuntu. If you use Nala, you don't need to rely on any external tools. By default, Nala will help you to choose the fastest mirrors and write them in a file.

In summary, Nala ships with the following distinct features out of the box.

* Pretty output formatting,
* History function,
* Parallel downloads,
* Fetch fastest mirror.

Nala is an opensource program written in **Python**. The code is freely hosted in GitLab.

### How To Install Nala

We can install Nala from a PPA, or using Pacstall or apt/dpkg package managers.

#### Install Nala Using PPA

Nala can be installed from **Volian Scar repository** in Debian, Ubuntu and its variants such as Linux Mint, Pop!_OS.

To add Volian Scar repo in Debian, Ubuntu and its derivatives, run the following command:

```
$ echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
```

Add the GPG key:

```
$ wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
```

Update the sources list:

```
$ sudo apt update
```

And install Nala in Ubuntu 22.04 / Debian Sid and newer using command:

```
$ sudo apt install nala
```

For Debian 11 stable, Ubuntu 21.04 and older versions, you need to install the `nala-legacy` package

```
$ sudo apt install nala-legacy
```

**Heads Up:** It looks like Nala is added to the Debian [Testing] repository and the default repositories of Debian Sid. I don't have Debian Sid, so I can't confirm it though.

#### Install Nala Using Pacstall

Nala developer has created a pacscript for **[Pacstall][3]**.

First, install Pacstall as described in the link above.

Once that is complete, simply run the following command to install Nala.

```
$ pacstall -I nala-deb
```

#### Install Nala From Binaries

Download Nala latest `.deb` file from the **[releases][4]** page.

And install it locally through `apt` or `dpkg`.

```
$ sudo apt install /path/to/nala_version_arch.deb
$ sudo apt install -f
```

Or

```
$ sudo dpkg -i /path/to/nala_version_arch.deb$ sudo apt install -f
```

### Nala Commands Usage

As stated already, Nala usage is pretty much same as Apt. The Nala commands are identical to the apt variant, but the output is formatted differently.

Let us start by displaying Nala help manual.

#### View Nala Help

To display nala command help section, use `-h` or `--help` flag like below:

```
$ nala --help
```

**Sample output:**

```
Usage: nala [OPTIONS] COMMAND [ARGS]...

  Each command has its own help page.

  For Example: `nala history --help`

Options:
  --version             Show program's version number and exit.
  --license             Reads the GPLv3 which Nala is licensed under.
  --install-completion  Install completion for the current shell.
  --show-completion     Show completion for the current shell, to copy it or
                        customize the installation.
  -h, --help            Show this message and exit.

Commands:
  autopurge   Autopurge packages that are no longer needed.
  autoremove  Autoremove packages that are no longer needed.
  clean       Clear out the local archive of downloaded package files.
  fetch       Fetch fast mirrors to speed up downloads.
  history     Show transaction history.
  install     Install packages.
  list        List packages based on package names.
  purge       Purge packages.
  remove      Remove packages.
  search      Search package names and descriptions.
  show        Show package details.
  update      Update package list.
  upgrade     Update package list and upgrade the system.
```

As you can see in the above output, Nala has all essential commands for basic package management operations in Debian-based systems.

Each Nala sub-command has its own help section. For instance, to view the help section of the `update` command, you can use the following command:

```
$ nala update -h
```

#### Update Repositories

To update the software repositories using Nala, run:

```
$ sudo nala update
```

**Sample output:**

```
$ sudo nala update
╭─ Updating Package List ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│No Change: http://in.archive.ubuntu.com/ubuntu jammy InRelease                                                                                  │
│No Change: https://download.docker.com/linux/ubuntu jammy InRelease                                                                             │
│No Change: http://in.archive.ubuntu.com/ubuntu jammy-updates InRelease                                                                          │
│No Change: http://in.archive.ubuntu.com/ubuntu jammy-backports InRelease                                                                        │
│No Change: http://deb.volian.org/volian scar InRelease                                                                                          │
│Updated:   http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]                                                                  │
│No Change: https://ppa.launchpadcontent.net/flexiondotorg/quickemu/ubuntu jammy InRelease                                                       │
│No Change: https://ppa.launchpadcontent.net/yannick-mauray/quickgui/ubuntu jammy InRelease                                                      │
│Fetched 110 kB in 6s (2555 B/s)                                                                                                                 │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
1 packages can be upgraded. Run 'nala list --upgradable' to see them.
```

![Nala Update Command][5]

Now, run the actual `apt update` command and compare the output of both commands:

```
$ sudo apt update
```

![Nala Update Vs Apt Update Command][6]

Did you get the difference? The `nala update` command's output is more human-friendly than the `apt update` command's output.

Nala displays a title to describe the actual purpose of the given command. As you in the above output, Nala displays "Updating Package List" on the top. The user will easily understand know what the given command will do.

The other minor difference is Nala displays "No change" message if the repository is not changed or updated. It also eliminates the following lines from the output.

```
[...]
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
[...]
```

Apt will display these three lines in all commands.

#### Upgrade Packages

To upgrade your Debian or Ubuntu system, run:

```
$ sudo nala upgrade
```

**Sample output:**

```
╭─ Updating Package List ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│No Change: http://in.archive.ubuntu.com/ubuntu jammy InRelease                                                                                  │
│Updated:   https://download.docker.com/linux/ubuntu jammy InRelease [48.9 kB]                                                                   │
│No Change: http://in.archive.ubuntu.com/ubuntu jammy-updates InRelease                                                                          │
│No Change: http://in.archive.ubuntu.com/ubuntu jammy-backports InRelease                                                                        │
│Updated:   http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]                                                                  │
│No Change: http://deb.volian.org/volian scar InRelease                                                                                          │
│No Change: https://ppa.launchpadcontent.net/flexiondotorg/quickemu/ubuntu jammy InRelease                                                       │
│No Change: https://ppa.launchpadcontent.net/yannick-mauray/quickgui/ubuntu jammy InRelease                                                      │
│Fetched 159 kB in 0s (0 B/s)                                                                                                                    │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
==================================================================================================================================================
 Upgrading                                                                                                                                        
==================================================================================================================================================
  Package:                                        Old Version:                    New Version:                                             Size:  
  libfreetype6                                    2.11.1+dfsg-1build1             2.11.1+dfsg-1ubuntu0.1                                  389 kB  
                                                                                                                                                  
==================================================================================================================================================
 Summary                                                                                                                                          
==================================================================================================================================================
 Upgrade 1 Packages                                                                                                                               
                                                                                                                                                  
      
Do you want to continue? [Y/n] y
╭─ Updating Packages ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│Unpacking:  libfreetype6:amd64 (2.11.1+dfsg-1ubuntu0.1) over (2.11.1+dfsg-1build1)                                                              │
│Setting up: libfreetype6:amd64 (2.11.1+dfsg-1ubuntu0.1)                                                                                         │
│Processing: triggers for libc-bin (2.35-0ubuntu3)                                                                                               │
│╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮│
││✔ Running dpkg … ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 100.0% • 0:00:00 • 3/3││
│╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯│
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
Finished Successfully
```

![Nala Upgrade Command][7]

The output is quite descriptive and self-explanatory, right? Indeed! You won't see these details in Apt command.

Nala will display a descriptive title for each action, for example "Updating Package List", "Downloading", "Installing Packages" etc.

#### Install Packages

To install a package using Nala, for example **Vim**, simply run:

```
$ sudo nala install vim
```

**Sample output:**

![Nala Install Command][8]

To view the usage of and available options in `nala install` command, simply run:

```
$ nala install -h
```

#### List Packages

You can list all packages or specific packages based on their name with `nala list` command.

To list all packages, simply run `nala list` without any flags.

```
$ nala list
```

You can also list only the packages that are installed with `-i` , `--installed` flag.

```
$ nala list -i
```

What if you want to list only the packages that are **explicitly** installed with Nala? That's also possible. Use `-N`, `--nala-installed` flag.

```
$ nala list -N
```

**Sample output:**

```
vim 2:8.2.3995-1ubuntu2 [Ubuntu/jammy main]
├── is installed
└── Vi IMproved - enhanced vi editor
```

To view only packages that are upgradable, use `-u`, `--upgradable` option.

```
$ nala list -u
```

To show all versions of a given package, you can use `-a`, `--all-versions` flag.

```
$ nala list -a
```

#### Search Packages

You can search package names and descriptions using a word or REGEX. This command has the same options as the `nala list` command. The only additional flag it has is `-A`, `--all-arches` flag which shows all architectures of a package.

To search for packages that has "vim" in their name, run:

```
$ nala search vim
```

When you run nala search without any options, it will show both package names and descriptions.

To search only the names, use `-n`, `--names` flag.

```
$ nala search -n vim
```

To show all architectures of a given package, use `-A` (Note it is Uppercase A).

```
$ nala search -n -A vim
```

Similarly, you can use `-i` to list only the installed packages, use `-N` to list only packages explicitly with Nala, use `-u` to list only upgradable packages.

You can view all supported options from the `nala search` help section by running the following command.

```
$ nala search -h
```

#### Show Package Details

The `show` command displays the information about the given package such as the name, version and dependencies etc.

```
$ nala show vim
```

![Nala Show Command][9]

As you see, the `nala show` command is very similar to `apt show` except the package information is highlighted for better readability.

#### Parallel Downloads

This is an useful feature of Nala.

Currently, Apt package manager doesn't has parallel downloads support. However, we can enhance the Apt download speed using a third-party tool called **Apt-fast**. The Apt-fast application is used to **[speed up downloading of packages in Ubuntu][10]** and its derivatives.

Nala supports parallel downloads out of the box. So we don't need any external tools. By default, Nala will **download 3 packages per unique mirror** in your `sources.list` file.

#### Fetch Fastest Mirrors

The another useful addition in Nala features list is fetching the fastest APT mirror. The `nala fetch` command works very similar to **apt-select**, **apt-smart**, **netselect**, and **netselect-apt** CLI tools.

Before I know about Nala, I used the aforementioned tools to **[find the best and fastest APT mirror][11]** in my Ubuntu systems. Fortunately, Nala has included this feature by default.

First, Nala will check if your distribution is either Debian or Ubuntu. And then, it get all the mirrors from the respective master list. After getting the master list, it will test the latency and score each mirror.

Depending on the latency and speed, Nala will list the fastest 16 mirrors. Type the index number of the mirrors (separated by space) that you want to keep and hit ENTER key

![List Fastest APT Mirrors With Nala][12]

Nala will display a confirmation message. If you're OK with the selected mirrors, press Y to confirm and ENTER.

![Confirm Selected Mirrors][13]

The selected sources will be written to `/etc/apt/sources.list.d/nala-sources.list` file.

Update the sources list by running the following command:

```
$ sudo nala update
```

If you don't want the mirrors selected by Nala, simply delete it.

```
$ sudo rm /etc/apt/sources.list.d/nala-sources.list
```

#### Show Transaction History

This is one of the flagship feature of Nala package manager. This feature is actually inspired by the **history** function from the **[DNF][14]** package manager.

Using the `nala history` command, we can easily undo or redo previous APT transactions.

Whenever, you install, remove or upgrade packages, the APT transaction is stored in `/var/lib/nala/history.json` file with a unique **ID** number.

Let us view the current history using command:

```
$ nala history
  ID    Command                 Date and Time              Altered    Requested-By      
  1     upgrade libfreetype6    2022-07-22 18:14:55 IST          1    ostechnix (1000)  
  2     install vim             2022-07-22 18:20:11 IST          2    ostechnix (1000)
```

As you can see, we have done two APT transactions using Nala. Here, 1 and 2 are the transaction IDs.

You can show information about a specific transaction using `nala history info [ID]` command.

```
$ nala history info 2
```

**Sample output:**

```
==================================================================================================================================================
 Installed                                                                                                                                        
==================================================================================================================================================
  Package:                                        Version:                                                                                 Size:  
  vim                                             2:8.2.3995-1ubuntu2                                                                     1.7 MB  
  vim-runtime                                     2:8.2.3995-1ubuntu2                                                                     6.8 MB  
                                                                                                                                                  
==================================================================================================================================================
 Summary                                                                                                                                          
==================================================================================================================================================
 Installed 2 Packages
```

![View Apt Transaction Details][15]

Now let me undo the installation Vim package.

To do so, simply run:

```
$ sudo nala history undo 2
```

Here, 2 is the index of the "install vim" command.

![Nala History Undo Command][16]

See? We just undo the Vim installation. In other words, we simply removed the Vim package.

Let us run the history command again:

```
$ nala history
  ID    Command                 Date and Time              Altered    Requested-By      
  1     upgrade libfreetype6    2022-07-22 18:14:55 IST          1    ostechnix (1000)  
  2     install vim             2022-07-22 18:20:11 IST          2    ostechnix (1000)  
  3     history undo 2          2022-07-23 17:12:34 IST          2    ostechnix (1000)
```

![Nala History Command][17]

As you see in the above output, we have a new entry (i.e. `history undo 2` ) in the `nala history` output.

Let us install the vim package again. To put it another way, let us **redo** the "install vim" command.

To redo the "install vim" transaction, run:

```
$ sudo nala history redo 2
```

![Nala History Redo Command][18]

Now, the Vim package is installed again.

If you don't want any transaction in the history, you can remove it using `nala history clear` command:

```
$ sudo nala history clear 3
```

#### Remove Packages

To remove or purge an installed package that are no longer needed with Nala, run:

```
$ sudo nala purge vim
```

Or,

```
$ sudo nala remove --purge vim
```

if you want to automatically remove any packages that are no longer needed, add `--autoremove` flag.

```
$ sudo nala purge vim --autoremove
```

### Conclusion

Using Nala, we can have prettier output, faster downloads of packages, and a history! If you do only a basic package management operations, such as install, update, upgrade, list, search, and remove etc., you can use Nala. For other advanced package management operations, use Apt.

The developer of Nala has also planned to rewrite Nala in **Rust** programming language. Let us hope it will be out soon and with more features.

**Resource:**

* [Nala GitLab Repository][19]

--------------------------------------------------------------------------------

via: https://ostechnix.com/nala-commandline-frontend-for-apt/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/apt-fast-speed-up-downloading-of-packages-in-ubuntu/
[2]: https://ostechnix.com/how-to-find-best-ubuntu-apt-repository-mirror/
[3]: https://github.com/pacstall/pacstall
[4]: https://gitlab.com/volian/nala/-/releases
[5]: https://ostechnix.com/wp-content/uploads/2022/07/Nala-Update-Command.png
[6]: https://ostechnix.com/wp-content/uploads/2022/07/Nala-Update-Vs-Apt-Update-Command.png
[7]: https://ostechnix.com/wp-content/uploads/2022/07/Nala-Upgrade-Command.png
[8]: https://ostechnix.com/wp-content/uploads/2022/07/Nala-Install-Command.png
[9]: https://ostechnix.com/wp-content/uploads/2022/07/Nala-Show-Command.png
[10]: https://ostechnix.com/how-to-speed-up-dnf-package-manager-in-fedora/
[11]: https://ostechnix.com/how-to-find-best-ubuntu-apt-repository-mirror/
[12]: https://ostechnix.com/wp-content/uploads/2022/07/List-Fastest-APT-Mirrors-With-Nala.png
[13]: https://ostechnix.com/wp-content/uploads/2022/07/Confirm-Selected-Mirrors.png
[14]: https://ostechnix.com/dnf-command-examples-beginners/
[15]: https://ostechnix.com/wp-content/uploads/2022/07/View-Apt-Transaction-Details.png
[16]: https://ostechnix.com/wp-content/uploads/2022/07/Nala-History.png
[17]: https://ostechnix.com/wp-content/uploads/2022/07/Nala-History-Command.png
[18]: https://ostechnix.com/wp-content/uploads/2022/07/Nala-History-Redo-Command.png
[19]: https://gitlab.com/volian/nala
