[#]: subject: "List Files and Directories in Style Using lsd and exa"
[#]: via: "https://www.debugpoint.com/list-files-directories-style/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

List Files and Directories in Style Using lsd and exa
======
Reimagine and style your file and directories list using two ls utilities – lsd and exa.

![][0]

The ls command in Linux is the most used command. This command lists files and directories in the terminal. So, as you can see, it’s pretty popular and perhaps used by everyone.

But the command outputs a large set of information, and it’s sometimes easier to view them colourfully.

For example, if you run the ls command in the most basic way, it should look somewhat like this.

![The default list files and directories view via ls command][1]

It seems a little bland, isn’t it? What if you can style it a bit so that it becomes more readable while looking nice?

### List Files and Directories in Style

#### lsd

The first application I want to show you is called “lsd” aka “LSDeluxe”. It’s a rewrite of the GNU `ls` command with additional features such as column heading, colours for various items, font and icon support.

Here’s how it looks after installation.

```
lsd -l --header
```

![lsd command showing list of files][2]

As you can see, it looks stunning with different colour codes for permission, file types, and folders and even adds icons beside a file name.

The application is full of features such as tree view (see below) which even gives you a list of files inside a folder as well in a single command.

```
lsd -l --header --tree
```

![lsd command showing a tree view][3]

You can learn more about its feature on the [official GitHub page][4].

I’m sure you are excited. Let’s see how you can install it.

You can download the deb file from here for Ubuntu and related distribution. And after that, simply run dpkg to install.

```
sudo dpkg -i lsd_vvvv_amd64.deb
```

For Fedora Linux, use the following command.

```
sudo dnf install lsd
```

And Arch Linux users can get it using the below command.

```
pacman -S lsd
```

The application is also available for other distros, macOS, BSD and Windows. For those instructions, you can [find them here][5].

For a better experience, use it with the [Zsh shell with Oh My Zsh][6] program.

#### exa

The next program is `exa`, similar to `lsd` but with more features. The `exa` command can colourize your ls output, detect various file types in Unix systems, headings, tree view and many more features.

Exa is a single binary and has a small resource footprint. Here’s how it looks with some sample commands.

```
exa -al
```

```
exa -abghHliS
```

```
exa -abghHliS --long --tree
```

![Various exa commands][7]

You can learn more about exa parameters and switches on [GitHub][8].

Installation of exa is easy and requires just one command. For Ubuntu and related distributions, you can install it using the below command.

```
sudo apt install exa
```

For Fedora and Arch Linux, use the following commands, respectively.

```
sudo dnf install exa
```

```
pacman -S exa
```

Likewise, all other installation instructions for various OSes can be [found here][9].

### Copying from the terminal as HTML

One of the interesting tips is that all the above colourful lists can be copied as HTML via the default Ubuntu terminal. And you can use it for your web pages or documents.

For example, I copied a sample from the above to a LibreOffice Writer document.

It’s one of the best features, although it depends on the terminal program and NOT the above utilities.

![Exporting the command output as HTML][10]

### Wrapping Up

I explained the inner workings of two programs – ls and exa to list files and directories in style. I hope you get to use them for different needs.

Do let me know in the comment box if you like them, Or if you know any such utility.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/list-files-directories-style/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[0]: https://www.debugpoint.com/wp-content/uploads/2022/08/cool-ls.jpg
[1]: https://www.debugpoint.com/wp-content/uploads/2022/08/The-default-list-files-and-directories-view-via-ls-command.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2022/08/lsd-command-showing-list-of-files-2.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/08/lsd-command-showing-a-tree-view.jpg
[4]: https://github.com/Peltoche/lsd
[5]: https://github.com/Peltoche/lsd#installation
[6]: https://www.debugpoint.com/install-use-zsh/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/08/Various-exa-commands.jpg
[8]: https://github.com/ogham/exa#command-line-options
[9]: https://github.com/ogham/exa#installation
[10]: https://www.debugpoint.com/wp-content/uploads/2022/08/Exporting-the-command-output-as-HTML.jpg
