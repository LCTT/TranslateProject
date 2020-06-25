[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Make the switch from Mac to Linux easier with Homebrew)
[#]: via: (https://opensource.com/article/20/6/homebrew-linux)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

Make the switch from Mac to Linux easier with Homebrew
======
Whether you want to ease your migration from Mac to Linux or just don't
like the standard Linux package managers, give Homebrew a try.
![Digital images of a computer desktop][1]

The [Homebrew][2] project began its life as an unofficial Linux-style package manager for the Mac. Its users quickly fell in love with its friendly interface and helpful prompts, and—in what may seem like a strange twist of fate—it got ported to Linux.

At first, there were two separate projects for macOS and Linux (Homebrew and Linuxbrew), but now Homebrew's core manages both operating systems. Because I've been on a journey to [migrate from Mac to Linux][3], I have been looking at how my favorite open source applications for macOS perform on Linux, and I've been happy to find that Homebrew's support for Linux truly shines.

### Why Homebrew on Linux?

A reasonable first response to Homebrew from long-time Linux users is: "Why not just use…" where the next word is a package manager for their preferred version of Linux. Debian-based systems already have `apt`, Fedora-systems have `dnf` and `yum`, and projects like Flatpak and AppImage work to span the gap by running smoothly on both. I have spent a decent amount of time using all these technologies, and I have to say each one is powerful in its own right.

So why do I [stick with Homebrew][4]? First off, it's incredibly familiar to me. I'm already learning a lot as I transition to more open source alternatives for my past proprietary tools, and keeping something familiar—like Homebrew—helps me focus on learning one thing at a time instead of being overwhelmed by all the differences between operating systems.

Also, I have yet to see a package manager that is as kind to the user as Homebrew. Commands are well organized, as the default Help output shows:


```
$ brew -h
Example usage:
  brew search [TEXT|/REGEX/]
  brew info [FORMULA...]
  brew install FORMULA...
  brew update
  brew upgrade [FORMULA...]
  brew uninstall FORMULA...
  brew list [FORMULA...]

Troubleshooting:
  brew config
  brew doctor
  brew install --verbose --debug FORMULA

Contributing:
  brew create [URL [--no-fetch]]
  brew edit [FORMULA...]

Further help:
  brew commands
  brew help [COMMAND]
  man brew
  <https://docs.brew.sh>
```

This short output might be mistaken as a limitation, but a quick look inside any of the subcommands reveals a wealth of functionality. The list above is just 23 lines long, but the `install` subcommand has a whopping 79 lines of information available for the advanced user:


```
$ brew --help | wc -l
23
$ brew install --help | wc -l
79
```

It has options for ignoring or installing dependencies, choosing to build from source and with what compiler, and using exact upstream Git commits versus the official "bottled" version of the application. Suffice it to say, Homebrew is for experts and novices alike.

### Get started with Homebrew on Linux

If you want to give Homebrew a try, there is a great one-liner script to install it on Mac or Linux:


```
`$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
```

This command executes the Homebrew installer script immediately. If you are more cautious, you can `curl` the file, then run it manually after a review:


```
$ curl -fsSL <https://raw.githubusercontent.com/Homebrew/install/master/install.sh> \--output homebrew_installer.sh
$ more homebrew_installer.sh # review the script until you feel comfortable
$ bash homebrew_installer.sh
```

The Linux instructions include configurations for dotfiles, particularly `~/.profile` on Debian systems and `~/.bash_profile` on Fedora:


```
$ test -d /home/linuxbrew/.linuxbrew &amp;&amp; eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
$ test -r ~/.bash_profile &amp;&amp; echo "eval \$($(brew --prefix)/bin/brew shellenv)" &gt;&gt;~/.bash_profile
$ echo "eval \$($(brew --prefix)/bin/brew shellenv)" &gt;&gt;~/.profile
```

To confirm the installation, the Homebrew team provides an empty `hello` formula for testing:


```
$ brew install hello
==&gt; Downloading <https://linuxbrew.bintray.com/bottles/hello-2.10.x86\_64\_linux.bottle.tar.gz>
######################################################################## 100.0%
==&gt; Pouring hello-2.10.x86_64_linux.bottle.tar.gz
🍺  /home/linuxbrew/.linuxbrew/Cellar/hello/2.10: 52 files, 595.6KB
```

It looks like my installation is working without any issues, so I'll explore a little more.

### Brew for command-line utilities

Homebrew boasts of being an application that "installs the stuff you need that [Linux] didn't" by default.

You use the `brew` command to install any of the command-line utilities packaged up in Homebrew. These package definitions are called "formulae," and they are compiled and shared through "bottles." There is a host of other beer-oriented terminology in the Homebrew universe, but the package manager's main takeaway is to make software easily accessible.

What kind of software? Think about the things that come in handy for nerds like me (and, since you're reading this, probably you, too). For example, the handy `tree` command that shows directory structures or `pyenv`, which I use to [manage multiple versions of Python on a Mac][5].

You can see all formulae available using the `search` command, and adding the `wc` command shows how many are available:


```
# -l counts the number of lines
$ brew search | wc -l
    5087
```

There are over 5,000 formulae to date, which is an incredible amount of software. The caveat is that not every formula will run on Linux. There is a section in the output of `brew search --help` that shows flags to filter software by the operating system it runs on. It launches each operating system's repository list to a browser. I'm running Fedora, so I'll give it a try with:


```
`$ brew search --fedora tree`
```

The browser loads `https://apps.fedoraproject.org/packages/s/tree`, which shows the options available for Fedora. There are other ways to browse, as well. Formulae are codified and centralized into the core repositories that are split out by operating system (Mac in [Homebrew Core][6] and [Linux Core][7] for Linux bits). They are also available through the Homebrew API and [listed on the website][8].

Even with all these options, I still find most of my new tools through recommendations from other users. Here are some of my favorites, if you're looking for inspiration:

  * `pyenv`, `rbenv`, and `nodenv` to manage Python, Ruby, and Node.js versions (respectively)
  * `imagemagick` for scriptable image edits
  * `pandoc` for scriptable document conversions (I often switch from .docx to .md or .html)
  * `hub` for a [better Git experience][9] for GitHub users
  * `tldr` for examples of how to use a command-line utility



To explore Homebrew, take a look at [tldr pages][10], which is a user-friendly alternative to scrolling through an application's man pages. Confirm it's available by running `search`:


```
$ brew search tldr
==&gt; Formulae
tldr ✔
```

Success! The checkmark lets you know it is available. Now you can install it:


```
$ brew install tldr
==&gt; Downloading <https://linuxbrew.bintray.com/bottles/tldr-1.3.0\_2.x86\_64\_linux.bottle.1.tar.gz>
######################################################################## 100.0%
==&gt; Pouring tldr-1.3.0_2.x86_64_linux.bottle.1.tar.gz
🍺  /home/linuxbrew/.linuxbrew/Cellar/tldr/1.3.0_2: 6 files, 63.2KB
```

Homebrew serves up prebuilt binaries, so you don't have to build from source code on your local machine. That saves a lot of time and CPU fan noise. Another thing I appreciate about Homebrew is that you can appreciate this feature without understanding exactly what it means. If you prefer to build it yourself, use the `-s` or `--build-from-source` flag with `brew install` to compile the formula from source (even if a bottle exists).

Similarly, the complexity under the hood can be interesting. Running `info` on `tldr` shows how dependency management happens, where the source code of the formula sits on disk, and even the public analytics are available:


```
$ brew info tldr
tldr: stable 1.3.0 (bottled), HEAD
Simplified and community-driven man pages
<https://tldr.sh/>
Conflicts with:
  tealdeer (because both install `tldr` binaries)
/home/linuxbrew/.linuxbrew/Cellar/tldr/1.3.0_2 (6 files, 63.2KB) *
  Poured from bottle on 2020-06-08 at 15:56:15
From: <https://github.com/Homebrew/linuxbrew-core/blob/master/Formula/tldr.rb>
==&gt; Dependencies
Build: pkg-config ✔
Required: libzip ✔, curl ✔
==&gt; Options
\--HEAD
        Install HEAD version
==&gt; Analytics
install: 197 (30 days), 647 (90 days), 1,546 (365 days)
install-on-request: 197 (30 days), 646 (90 days), 1,546 (365 days)
build-error: 0 (30 days)
```

### One limitation from Mac to Linux

On macOS, the Homebrew `cask` subcommand offers users a way to install and manage entire applications using the same great command-line utility. Unfortunately, `cask` does not yet work on any Linux distributions. I found this out while trying to install an open source tool:


```
$ brew cask install tusk
Error: Installing casks is supported only on macOS
```

I asked about it [on the forum][11] and got some quick feedback from other users. In short, the options are to:

  * Fork the project, build the feature, and show others that it's worthwhile
  * Write a formula for the application and build from source
  * Create a third-party repository for the application



The last one is the most interesting to me. Homebrew manages third-party repositories by [creating and maintaining "taps"][12] (another beer-influenced term). Taps are worth exploring as you get more familiar with the system and want to add to the ecosystem.

### Backing up Homebrew installs

One of my favorite Homebrew features is how you can back up your installation just like any other [dotfile in version control][13]. For this process, Homebrew offers a `bundle` subcommand that holds a `dump` subcommand that generates a Brewfile. This file is a reusable list of all your currently installed tools. To generate a Brewfile from your installation, go into whichever folder you want to use and run:


```
$ cd ~/Development/dotfiles # This is my dotfile folder
$ brew bundle dump
$ ls Brewfile
Brewfile
```

When I change machines and want to set up the same applications on it, I go to the folder with the Brewfile and reinstall them with:


```
$ ls Brewfile
Brewfile
$ brew bundle
```

It will install all the listed formulae on my new machine. 

#### Brewfile management across Mac and Linux

The Brewfile is a great way to backup your existing installation, but what if something on Mac doesn't run on Linux or vice versa? What I have found is that Homebrew will gracefully ignore the lines that don't work on a given operating system, whether Mac or Linux. As it comes across incompatible requests (like asking brew to install casks on Linux), it skips them and continues on its way: 


```
$ brew bundle --file=Brewfile.example

Skipping cask licecap (on Linux)
Skipping cask macdown (on Linux)
Installing fish
Homebrew Bundle complete! 1 Brewfile dependency now installed.
```

To keep my configuration as simple as possible, I use the same Brewfile across both operating systems and haven't run into an issue since it installs the OS-specific version each time I run it.

### Homebrew for package management

Homebrew has been my go-to manager for command-line utilities, and its familiarity makes my Linux experience that much more enjoyable. Homebrew keeps me organized and up to date, and I continue to appreciate its balance between ease of use and depth of functionality. I prefer to keep package management details to the minimal amount of information a user needs to know, and most people will benefit from that. If you're already comfortable with Linux package managers, Homebrew may come off as simple, but looking a little deeper reveals its advanced options that go far beyond what's in this article.

There are a lot of package management options for Linux users. If you are coming from the world of macOS, Homebrew will feel like home.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/homebrew-linux

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://brew.sh/
[3]: https://opensource.com/article/19/10/why-switch-mac-linux
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://opensource.com/article/20/4/pyenv
[6]: https://github.com/Homebrew/homebrew-core
[7]: https://github.com/Homebrew/linuxbrew-core
[8]: https://formulae.brew.sh/formula/
[9]: https://opensource.com/article/20/3/github-hub
[10]: https://github.com/tldr-pages/tldr
[11]: https://discourse.brew.sh/t/add-linux-support-to-existing-cask/5766
[12]: https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap
[13]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
