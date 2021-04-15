[#]: subject: (3 essential Linux cheat sheets for productivity)
[#]: via: (https://opensource.com/article/21/4/linux-cheat-sheets)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

3 essential Linux cheat sheets for productivity
======
Download cheat sheets for sed, grep, and parted to integrate new
processes into your work.
![Hand putting a Linux file folder into a drawer][1]

Linux is famous for its commands. This is partially because nearly everything that Linux does can also be invoked from a terminal, but it's also that Linux as an operating system is highly modular. Its tools are designed to produce fairly specific results, and when you know a lot about a few commands, you can combine them in interesting ways for useful output. Learning Linux is equal parts learning commands and learning how to string those commands together in interesting combinations.

With so many Linux commands to learn, though, taking the first step can seem daunting. What command should you learn first? Which commands should you learn well, and which commands require only a passing familiarity? I've thought about these questions a lot, and I'm not convinced there's a universal answer. The "basic" commands are probably the same for anyone:

  * `ls`
  * `cd`
  * `mv`



These amount to being able to navigate your Linux file system.

Beyond the basics, though, the "default" commands vary from industry to industry. Sysadmins need tools for [system introspection and monitoring][2]. Artists need tools for [media conversion][3] and [graphic processing][4]. Home users might want tools for [PDF processing][5], or [calendaring][6], or [document conversion][7]. The list goes on and on.

However, some Linux commands stand out as being particularly important—either because they're common low-level tools that everyone needs on occasion or they're all-purpose tools that anyone might find useful most of the time.

Here are three to add to your list.

### Sed

**Purpose:** The `sed` command is a good, all-purpose tool that any Linux user can benefit from knowing. On the surface, it's just a terminal-based "find and replace." That makes it great for quick and easy corrections across multiple documents. The `sed` command has saved me hours (or possibly cumulative days) of opening individual files, searching and replacing a word, saving the file, and closing the file. It alone justifies my investment in learning the Linux terminal. Once you get to know `sed` well, you're likely to discover a whole world of potential editing tricks that make your life easier.

**Strength:** The command's strength is in repetition. If you have just one file to edit, it's easy to open it and do a "find and replace" in a traditional [text editor][8]. However, when you're faced with five or 50 files, a good `sed` command (maybe combined with [GNU Parallel][9] for extra speed) can reclaim hours of your day.

**Weakness:** You have to balance the time you expect to spend making a change with how long it may take you to construct the right `sed` command. Simple edits with the common `sed 's/foo/bar/g` syntax are almost always worth the trivial amount of time it takes to type the command, but complex `sed` commands that utilize a hold space and any of the `ed` style subcommands can take serious concentration combined with several rounds of trial and error. It can be, as it turns out, better to do some edits the new-fashioned way.

**Cheat:** Download our [sed cheat sheet][10] for quick reference to its single-letter subcommands and an overview of its syntax.

### Grep

**Purpose:** The `grep` command comes from its admittedly clunky description: global regular expression print. In other words, `grep` prints to the terminal any matching pattern it finds in files (or other forms of input). That makes it a great search tool, especially adept at scrubbing through vast amounts of text.

You might use it to find URLs:


```
$ grep --only-matching \
http\:\/\/.* example.txt
```

You could use it to find a specific config option:


```
$ grep --line-number \
foo= example.ini
2:foo=true
```

And of course, you can combine it with other commands:


```
$ grep foo= example.ini | cut -d= -f2
true
```

**Strength:** The `grep` command is a straightforward search command. If you've read the few examples above, then you've essentially learned the command. For even more flexibility, you can use its extended regular expression syntax.

**Weakness:** The problem with `grep` is also one of its strengths: It's just a search function. Once you've found what you're looking for, you might be faced with the larger question of what to do with it. Sometimes the answer is as easy as redirecting the output to a file, which becomes your filtered list of results. However, more complex use cases mean further processing with any number of commands like [awk][11], [curl][12] (incidentally, [we have a cheat sheet for curl][13], too), or any of the thousands of other options you have on a modern computer.

**Cheat:** Download our [grep cheat sheet][14] for a quick reference to its many options and regex syntax.

### Parted

**Purpose:** GNU `parted` isn't a daily-use command for most people, but it is one of the most powerful tools for hard-drive manipulation. The frustrating thing about hard drives is that you spend years ignoring them until you get a new one and have to set it up for your computer. It's only then that you remember that you have no idea how to best format your drive. That's when familiarity with `parted` can be useful. GNU `parted` can create disk labels and create, back up, and rescue partitions. In addition, it can provide you with lots of information about a drive and its layout and generally prepare a drive for a filesystem.

**Strength:** The reason I love `parted` over `fdisk` and similar tools is for its combination of an easy interactive mode and its fully noninteractive option. Regardless of how you choose to use `parted`, its commands follow a consistent syntax, and its help menus are well-written and informative. Better still, the command itself is _smart_. When partitioning a drive, you can specify sizes in anything from sectors to percentages, and `parted` does its best to figure out the finer points of partition table placement.

**Weakness:** It took me a long while to learn GNU `parted` after switching to Linux because, for a very long time, I didn't have a good understanding of how drives actually work. GNU `parted` and most terminal-based drive utilities assume you know what a partition is, that drives have sectors and need disk labels and partition tables that initially lack filesystems, and so on. There's a steep learning curve—not to the command so much as to the foundations of hard-drive technology, and GNU `parted` doesn't do much to bridge the potential gap. It's arguably not the command's job to step you through the process because there are [graphical applications][15] for that, but a workflow-focused option for GNU `parted` could be an interesting addition to the utility.

**Cheat:** Download our [parted cheat sheet][16] for a quick reference to its many subcommands and options.

### Learn more

These are some of my favorite commands, but the list is naturally biased to how I use my computer. I do a lot of shell scripting, so I make heavy use of `grep` to find configuration options, I use `sed` for text editing, and I use `parted` because when I'm working on multimedia projects, there are usually a lot of hard drives involved. You either already have, or you'll soon develop, your own workflows with your own favorite (or at least _frequent_) commands.

When I'm integrating new processes into my daily work, I create or download a cheat sheet (like the ones linked above), and then I practice. We all learn in our own way, though, so find what works best for you, and learn a new essential command. The more you learn about your most frequent commands, the more you can make them work harder for you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/linux-cheat-sheets

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/life/16/2/open-source-tools-system-monitoring
[3]: https://opensource.com/article/17/6/ffmpeg-convert-media-file-formats
[4]: https://opensource.com/article/17/8/imagemagick
[5]: https://opensource.com/article/20/8/reduce-pdf
[6]: https://opensource.com/article/19/4/calendar-git
[7]: https://opensource.com/article/20/5/pandoc-cheat-sheet
[8]: https://opensource.com/article/21/2/open-source-text-editors
[9]: https://opensource.com/article/18/5/gnu-parallel
[10]: https://opensource.com/downloads/sed-cheat-sheet
[11]: https://opensource.com/article/20/9/awk-ebook
[12]: https://www.redhat.com/sysadmin/social-media-curl
[13]: https://opensource.com/article/20/5/curl-cheat-sheet
[14]: https://opensource.com/downloads/grep-cheat-sheet
[15]: https://opensource.com/article/18/11/partition-format-drive-linux#gui
[16]: https://opensource.com/downloads/parted-cheat-sheet
