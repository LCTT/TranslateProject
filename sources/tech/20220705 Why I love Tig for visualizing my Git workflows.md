[#]: subject: "Why I love Tig for visualizing my Git workflows"
[#]: via: "https://opensource.com/article/22/7/visualize-git-workflow-tig"
[#]: author: "Sumantro Mukherjee https://opensource.com/users/sumantro"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why I love Tig for visualizing my Git workflows
======
Tig is an excellent tool for reviewing your Git repository by encouraging you to explore the logs without having to construct long and sometimes complex queries.

![][1]

Image by: opensource.com

If you find navigating your Git repositories frustratingly complex, have I got the tool for you. Meet Tig.

Tig is an [ncurses-based][2] text-mode interface for Git that allows you to browse changes in a Git repository. It also acts as a pager for the output of various Git commands. I use this tool to give me a good idea of what’s been changed in which commit by whom, the latest commit merged, and so much more. Try it for yourself, starting with this brief tutorial.

### Installing Tig

On Linux, you can install Tig using your package manager. For instance, on Fedora and Mageia:

```
$ sudo dnf install tig
```

On Debian, Linux Mint, Elementary, Pop_OS, and other Debian-based distributions:

```
$ sud apt install tig
```

On macOS, use [MacPorts][3] or [Homebrew][4]. Tig’s complete installation guide can be found in the [Tig Manual][5].

### Using Tig

Tig provides an interactive view of common Git output. For instance, with Git you can view all refs with the command `git show-ref` :

```
$ git show-ref
98b108... refs/heads/master
6dae95... refs/remotes/origin/1010-internal-share-partition-format-reflexion
84e1f8... refs/remotes/origin/1015-add-libretro-openlara
e62c7c... refs/remotes/origin/1016-add-support-for-retroarch-project-cd
1c29a8... refs/remotes/origin/1066-add-libretro-mess
ffd3f53... refs/remotes/origin/1155-automatically-generate-assets-for-external-installers
ab4d14... refs/remotes/origin/1160-release-on-bare-metal-servers
28baa9... refs/remotes/origin/1180-ipega-pg-9118
8dff1d... refs/remotes/origin/1181-add-libretro-dosbox-core-s
81a7fe... refs/remotes/origin/1189-allow-manual-build-on-master
[...]
```

With Tig, you can get that information and much more in a scrollable list, plus keyboard shortcuts to open additional views with details about each ref.

![Screenshot of a terminal using Tig. On the left there is a scrollable list of outputs, on the right the details of the selected output (add become an ambassador page) is shown, such as author, date, commit date, sign off, etc.][6]

Image by: (Sumantro Mukherjee, CC BY-SA 4.0)

### Pager mode

Tig enters pager mode when input is provided to stdin (standard input). When the `show` subcommand is specified and the `--stdin` option is given, stdin is assumed to be a list of commit IDs, which is forwarded to `git-show` :

```
$ git rev-list --author=sumantrom HEAD | tig show –stdin
```

### Log and diff views

When you're in Tig's log view, you can press the d key on your keyboard to display diffs. This displays the files changed in the commit and the lines that were removed and added.

### Interactive Git data

Tig is an excellent addition to Git. It makes it easy to review your Git repository by encouraging you to explore the logs without having to construct long and sometimes complex queries.

Add Tig to your Git toolkit today!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/visualize-git-workflow-tig

作者：[Sumantro Mukherjee][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sumantro
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/images/life/computer_code_programming_laptop_0.jpg
[2]: https://opensource.com/article/21/8/ncurses-linux
[3]: https://opensource.com/article/20/11/macports
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://jonas.github.io/tig/doc/manual.html
[6]: https://opensource.com/sites/default/files/2022-06/tig%201.png
