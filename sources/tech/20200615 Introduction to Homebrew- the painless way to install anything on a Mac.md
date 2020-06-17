[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introduction to Homebrew: the painless way to install anything on a Mac)
[#]: via: (https://opensource.com/article/20/6/homebrew-mac)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberg)

Introduction to Homebrew: the painless way to install anything on a Mac
======
The Homebrew package manager makes it easy to install and update
applications and utilities on a Mac.
![Gift box opens with colors coming out][1]

In my quest to "automate all the things," I have been on a journey to manage my Mac laptop as the code it inherently is. Instead of pointing and clicking to manually manage my applications and utilities, I prefer to use package management software to install, update, and remove unneeded software.

That's a challenge for Mac users. One place where the Mac operating system, macOS, has always been behind Linux is in package management. There is no default package manager for Mac users, while Linux users have many options—from the familiar `yum` and `apt` to the modern choice of [Flatpak][2]. But what about us?

This is where [Homebrew][3] comes in. Homebrew fills the void as the de facto package manager for macOS (and as another option for Linux). It provides an incredibly smooth and straightforward experience for anyone familiar with the command line, and it's a good way to learn the command line if you're new to it.

If you're on a Mac and don't already have Homebrew, you can install it with:


```
`$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
```

This command executes the installer script provided by the Homebrew team. If you prefer to be more cautious, you can `curl` the file, then run it manually after reviewing it:


```
$ curl -fsSL <https://raw.githubusercontent.com/Homebrew/install/master/install.sh> \--output homebrew_installer.sh
$ more homebrew_installer.sh # review the script until you feel comfortable
$ bash homebrew_installer.sh
```

### Manage your command-line utilities with brew

Homebrew boasts that it "installs the stuff you need that Apple (or your Linux system) didn't" install by default. Installation happens with the `brew` command, which gives us access to thousands of command-line utilities, but not more complex applications.

For us nerds, the utilities that fit into "the stuff you need" category include the handy `tree` command that shows directory structures and `pyenv`, which I use to [manage multiple versions of Python][4].

You can see all the "formulae" that are available from Homebrew using the `search` command, and I use the `wc` command shows how many formulae there are:


```
# -l counts the number of lines
$ brew search | wc -l
    5013
```

There are over 5,000 formulae, which is an incredible amount of software. So it's best to have an idea of what you want before searching that huge list. Thankfully, it is easy enough to browse. Formulae are codified and centralized into the core repositories that are split by operating system (Mac in [Homebrew Core][5] and Linux in [Linux Core][6]). They are also available through the Homebrew API and [listed on the website][7].

Word of mouth is another great method to find utilitites. With that in mind, here are some of my favorites if you're looking for inspiration:

  * `pyenv`, `rbenv`, and `nodenv` to manage Python, Ruby, and Node.js versions (respectively)
  * `imagemagick` for scriptable image edits
  * `pandoc` for scriptable document conversions (I often switch from .docx to .md or .html)
  * `hub` for a [better Git experience][8] for GitHub users
  * `tldr` for examples of how to use a command-line utility



As an example, take a look at [tldr pages][9], a user-friendly alternative to scrolling through an application's man pages. You can confirm it's available by running `search` again:


```
$ brew search tldr
==&gt; Formulae
tldr ✔
```

Success! The checkmark lets you know it is available. Now you can install it:


```
$ brew install tldr
==&gt; Downloading <https://homebrew.bintray.com/bottles/tldr-1.3.0\_2.catalina.bottle.tar.gz>
Already downloaded: /Users/mbbroberg/Library/Caches/Homebrew/downloads/901bc14594a9283e9ab20aec942dc5a9a2befb7e96e1b0fcccb4e3257918813c--tldr-1.3.0_2.catalina.bottle.tar.gz
==&gt; Installing tldr
==&gt; Pouring tldr-1.3.0_2.catalina.bottle.tar.gz
🍺  /usr/local/Cellar/tldr/1.3.0_2: 6 files, 35.5KB
```

Homebrew, thankfully, prebuilds the binaries, so you don't have to build from source code on your local machine. That saves a lot of time and CPU fan noise. Another thing I appreciate about Homebrew is that you can appreciate this feature without understanding exactly what it means.

But if you're into it, it can be fun to look at the complexity. Run `info` on `tldr`, and you can see all the dependency management, the source code, and even public analytics:


```
$ brew info tldr
tldr: stable 1.3.0 (bottled), HEAD
Simplified and community-driven man pages
<https://tldr.sh/>
Conflicts with:
  tealdeer (because both install `tldr` binaries)
/usr/local/Cellar/tldr/1.3.0_2 (6 files, 35.5KB) *
  Poured from bottle on 2020-05-20 at 15:12:12
From: <https://github.com/Homebrew/homebrew-core/blob/master/Formula/tldr.rb>
==&gt; Dependencies
Build: pkg-config ✔
Required: libzip ✔
==&gt; Options
\--HEAD
        Install HEAD version
==&gt; Analytics
install: 2,811 (30 days), 7,875 (90 days), 27,105 (365 days)
install-on-request: 2,806 (30 days), 7,860 (90 days), 27,080 (365 days)
build-error: 0 (30 days)
```

Finally, as in any good package manager, Homebrew's `brew uninstall` is available to quickly clean and remove unused utilities.

### Manage your applications with brew casks

Command-line utilities are a blast, but what about full-blown applications? Homebrew keeps its standard commands simple and installs only single-file applications through its default `brew` command-line interface. Applications don't fit that structure. They have a more complex directory hierarchy that is much more than a single binary.

Fortunately, Homebrew on Mac includes a subcommand called "casks" for more complex multi-directory structures. What's especially nice is that `cask` uses a similar command structure to the standard `brew` commands, so you can use similar `search`, `install`, and `info` steps:


```
brew search --cask | wc -l
    4772
```

Wow, there are nearly 5,000 more applications to browse, which are easier to peruse on [Homebrew's website][10].

I'll walk you through `cask` with one of my new favorite applications: [Meld][11] (which I [read about on Opensource.com][12]). It's a feature-rich editor that helps manage merge conflicts. There is a download on its website, and I could run through the installer and drag-and-drop it into my Applications folder, but I don't do that anymore. I use Homebrew.

First, I confirm it's available through a slightly different syntax:


```
$ brew search --casks meld
==&gt; Casks
meld
```

Then I use the `cask` sub-command to install it:


```
$ brew cask install meld
==&gt; Downloading <https://github.com/yousseb/meld/releases/download/osx-19/meldmerge.dmg>
==&gt; Downloading from <https://github-production-release-asset-2e65be.s3.amazonaws.com/28624006/66cb25>
######################################################################## 100.0%
==&gt; Verifying SHA-256 checksum for Cask 'meld'.
==&gt; Installing Cask meld
==&gt; Moving App 'Meld.app' to '/Applications/Meld.app'.
==&gt; Linking Binary 'meld.wrapper.sh' to '/usr/local/bin/meld'.
🍺  meld was successfully installed!
```

Homebrew not only installs the application but also makes it available in my current path under `/usr/local/bin/`. Now I can run `meld` from the command line or launch the application from the Applications folder.

### Update everything with brew upgrade

The main reason I consistently use a package manager is so that I can consistently upgrade my software to avoid known security bugs and ensure I always have the latest features. If I install everything by hand, I have to keep an eye on each tool and application to know whether it has an auto-updater and, if not, pull down the latest releases myself.

Upgrades are where great package management shines. Since I don't have any special version requirements, I run only one command to update everything smoothly:


```
$ brew upgrade
==&gt; Upgrading 6 outdated packages:
helm 3.2.1 -&gt; 3.2.2
python@3.8 3.8.2_4 -&gt; 3.8.3
ipython 7.14.0 -&gt; 7.15.0
go 1.14.2_1 -&gt; 1.14.3
libzip 1.6.1 -&gt; 1.6.1_1
sqlite 3.31.1 -&gt; 3.32.1
```

If you have more complex needs or want to keep an eye on upgrades before installing them, there are plenty of feature flags available. For instance, `-n` offers a "dry run" that lists available upgrades without installing them. You can also ["pin"][13] an application version to prevent upgrades.

### Back up your installation

The command-line utility and application management jumps to a whole new level when tools allow you to back up your installation like any other [dotfile in version control][14]. Homebrew has that kind of functionality available to use under the `dump` subcommand. It generates a `Brewfile`, which is a reusable list of all the currently installed tools. To generate one from your installation, go into your preferred folder and run:


```
$ cd ~/Development/dotfiles # This is my dotfile folder
$ brew bundle dump
```

When I change machines and want to install the same applications with Homebrew, I go to the folder with the Brewfile and run:


```
`$ brew bundle`
```

It will install all the listed formulae and casks on my new machine.

### Go to Homebrew for package management

Homebrew is my go-to manager for command-line utilities and applications. It keeps me organized and up-to-date, and its design is a beautiful balance between ease of use and depth of functionality. Homebrew minimizes package management details to only what you need to know, and most users will benefit from that.

If you're already comfortable with Linux package managers, you may think Homebrew is too simple, but don't mistake Homebrew's ease of use for lack of features. Looking a little deeper reveals many advanced options that go far beyond what I showed you here. Adding `-h` to any `brew` subcommand shows the rich features available to upgrade, remove, troubleshoot, and even contribute new formulas using templates.

Overall, Homebrew makes being a command-line wielding Mac user a joy. In addition, it's open source, so you can [contribute back to the code][15] if you're so inclined. Give it a try, and let me know what you think by leaving a comment below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/homebrew-mac

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1 (Gift box opens with colors coming out)
[2]: https://opensource.com/article/19/10/how-build-flatpak-packaging
[3]: https://brew.sh
[4]: https://opensource.com/article/20/4/pyenv
[5]: https://github.com/Homebrew/homebrew-core
[6]: https://github.com/Homebrew/linuxbrew-core
[7]: https://formulae.brew.sh/formula/
[8]: https://opensource.com/article/20/3/github-hub
[9]: https://github.com/tldr-pages/tldr
[10]: https://formulae.brew.sh/cask/
[11]: https://meldmerge.org/
[12]: https://opensource.com/article/20/3/meld
[13]: https://docs.brew.sh/FAQ#how-do-i-stop-certain-formulae-from-being-updated
[14]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
[15]: https://github.com/Homebrew/brew
