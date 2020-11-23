[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Compare Files and Folders Graphically in Linux With Meld)
[#]: via: (https://itsfoss.com/meld-gui-diff/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Compare Files and Folders Graphically in Linux With Meld
======

How do you compare two similar files to check for differences? The obvious answer is [to use the diff command in Linux][1].

The problem is that not everyone would be comfortable comparing files in Linux terminal. And the diff command output could be confusing for some.

Take this diff command output for example:

![][2]

There is definitely a learning curve involved here. However, if you are using desktop Linux, you can use [GUI][3] applications to easily compare two files for any differences.

There are several GUI diff tools available for Linux. I am going to highlight my favorite tool Meld in this week’s Linux application highlight.

### Meld: Visual Diff and Merge tool for Linux (and Windows)

With [Meld][4], you can compare two files in side by side view. Not only that, you may also modify the files to make changes accordingly. That’s what you would want to do in most situations, right?

![File Comparison][5]

Meld is also capable of comparing directories and show which files are different. It will also show while files are new or missing.

![Directory Comparison][6]

You may also use Meld for a three-way comparison.

![Three Way File Comparison][7]

The graphical side-by-side comparison helps in a number of situations. If you are a developer, you can use it to understand code patches. Meld also supports version control systems like Git, [Mercurial][8], [Subversion][9] etc.

### Features of Meld

![][10]

The open source Meld tools has the following main features:

  * Perform two and three-way difference comparison
  * Edit files in-place and the difference comparison updates immediately
  * Navigate between differences and conflicts
  * Visualize global and local differences with insertions, changes and conflicts marked accordingly
  * Use regex text filtering to ignore certain differences
  * Syntax highlighting
  * Compare two or three directories for newly added, missing and altered files
  * Exclude some files from comparison
  * Support for popular version control systems like Git, Mercurial, Bazaar and SVN
  * Support for many international languages
  * Open source GPL v2 license
  * Available for Linux as well as Windows



### Installing Meld on Linux

Meld is a popular application and it is available in the official repositories of most Linux distributions.

Check your distribution’s software center and see if Meld is available.

![Meld In Ubuntu Software Center][11]

Alternatively, you can also use command line package manager of your distribution to install Meld. On [Ubuntu, it is available in the Universe repository][12] and can be [installed using the apt command][13]:

```
sudo apt install meld
```

You may find the source code of Meld on GNOME’s GitLab repository:

[Meld Source Code][14]

### Worth it?

I know that [most modern open source code editors][15] come with this feature but sometimes you just want a simple interface without the trouble of installing additional add-ons for comparing files. Meld provides you just that.

Do you use some other tools for checking differences between files? Which tool would that be? What’s your experience with Meld, if you ever used it? The comment sections is all yours for sharing your opinion.

--------------------------------------------------------------------------------

via: https://itsfoss.com/meld-gui-diff/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/diff-command/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/diff-command-complicated-output.png?resize=795%2C551&ssl=1
[3]: https://itsfoss.com/gui-cli-tui/
[4]: https://meldmerge.org
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/file-comaprison-in-Linux-with-meld.png?resize=800%2C498&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/directory-comparison-in-Linux-with_meld.png?resize=800%2C497&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/three-way-file-comaprison-with-meld-in-linux.png?resize=800%2C466&ssl=1
[8]: https://www.mercurial-scm.org/
[9]: https://subversion.apache.org/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/meld-visual-diff.png?resize=786%2C455&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/Meld-in-Ubuntu-Software-Center.png?resize=800%2C384&ssl=1
[12]: https://itsfoss.com/ubuntu-repositories/
[13]: https://itsfoss.com/apt-command-guide/
[14]: https://gitlab.gnome.org/GNOME/meld
[15]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
