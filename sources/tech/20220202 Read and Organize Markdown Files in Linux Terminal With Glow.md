[#]: subject: "Read and Organize Markdown Files in Linux Terminal With Glow"
[#]: via: "https://itsfoss.com/glow-cli-tool-markdown/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Read and Organize Markdown Files in Linux Terminal With Glow
======

_**Brief: Glow is a CLI tool that lets you render Markdown files in the Linux terminal. You can also organize Markdown files with it.**_

I love Markdown. I am not an expert Markdown user but I can surely write most of my articles in Markdown.

If you are a regular at It’s FOSS, you might have come across [Markdown guides][1], editors and tools like Obsidian. I’ll add one more tool to this list. It’s called [Glow][2] and unlike previously covered applications, Glow enables you to read Markdown files in the terminal.

Wait! Can you not read Markdown in the terminal using the regular [Linux commands to read text files][3] like cat, less or even editors like Vim?

Yes, you can. But it will be the raw markdown file with all the codes displayed as it is, rather than showing a properly formatted text.

![Glow renders the Markdown file][4]

Do note that Glow is not an editor. You cannot use it to write in Markdown text.

### Glow features Markdown lovers will love

Glow can be used in two formats: [CLI and TUI][5].

Simply using Glow on a Markdown file will display the entire rendered content on the screen.

```

    glow markdown_file

```

![Markdown display with Glow][6]

That’s good but Glow can do even better. It has additional options that open up the TUI mode (terminal user interface) and allows you to do more with it.

You can use the pager option to display the rendered text in pager mode (like how the less command shows the text without cluttering the screen).

```

    glow -p markdown_file

```

In this pager view, you can use the **/ key and search** for a certain text the same way you do with the less command. You can press **q key to exit** the view.

![Pager view similar to the less command][7]

That’s not it. You can use the -a option and it will find all the Markdown files in the current directory and its subdirectories.

```

    glow -a

```

You can use the arrow keys to scroll the files in the display. Up and down keys to move up and down, left and right arrow keys to move by pages.

![With -a option, Glow finds and displays all Markdown files in current directory][8]

You can see the help options displayed at the bottom. The find option in this view allows you to search files by name (not their content).

![You can search files by their name][9]

There are also tabs. You can move between the tabs using the tab key, of course.

The stash tab works like a bookmark. You can create a stash/bookmark by pressing the s key while browsing files or while viewing their content. This bookmark will be visible only in the current directory.

You can press x key to remove bookmark (not file) or even add a memo by pressing the m key.

![You can bookmark files by stashing them with s key][10]

The News tabs shows changelogs and other messages from the Glow developer(s).

![The news tab shows messages from the developers][11]

When you have found your desired file, you can view it by pressing enter. Since you are in the TUI mode, you get additional keyboard options here. The options can be displayed by pressing the ? key.

![You can view keyboard shortcuts by pressing the ? key][12]

### Installing Glow on Linux

Glow is available for Linux and macOS. You can install it [using Homebrew on Linux][13] and macOS, however, I would advise using the Linux packages here.

Glow is available in the repository of Void, Solus and Arch Linux. You can use their package managers to install it.

On Arch-based distributions, use:

```

    sudo pacman -S glow

```

For Ubuntu, Debian, Fedora and SUSE, there are .DEB and .RPM binaries available for various architectures and you may find that on its release page.

[Download Glow for other Linux distros][14]

### Conclusion

Overall, Glow is a handy tool to beautifully view and organize Markdown files in the terminal. Like most other CLI tools, it is not for everyone. If you dwell in the terminal with a liking for Markdown files, you may give it a try. And when you do, please share your experience with it in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/glow-cli-tool-markdown/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/markdown-guide/
[2]: https://github.com/charmbracelet/glow
[3]: https://linuxhandbook.com/view-file-linux/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/markdown-display-with-cat.png?resize=1572%2C962&ssl=1
[5]: https://itsfoss.com/gui-cli-tui/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/markdown-display-with-glow.png?resize=800%2C490&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/pager-view-with-glow.png?resize=800%2C451&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/glow-collection.png?resize=800%2C451&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/find-files-in-glow.png?resize=800%2C451&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/stash-feature-glow.png?resize=800%2C374&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/glow-news-tab.png?resize=800%2C451&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/display-help-in-file-view-in-glow.png?resize=800%2C490&ssl=1
[13]: https://itsfoss.com/homebrew-linux/
[14]: https://github.com/charmbracelet/glow/releases
