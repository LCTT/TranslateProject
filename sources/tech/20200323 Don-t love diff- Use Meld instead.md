[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Don't love diff? Use Meld instead)
[#]: via: (https://opensource.com/article/20/3/meld)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

Don't love diff? Use Meld instead
======
Meld is a visual diff tool that makes it easier to compare and merge
changes in files, directories, Git repos, and more.
![Person drinking a hat drink at the computer][1]

Meld is one of my essential tools for working with code and data files. It's a graphical diff tool, so if you've ever used the **diff** command and struggled to make sense of the output, [Meld][2] is here to help.

Here is a brilliant description from the project's website:

> "Meld is a visual diff and merge tool targeted at developers. Meld helps you compare files, directories, and version controlled projects. It provides two- and three-way comparison of both files and directories, and has support for many popular version control systems.
>
> "Meld helps you review code changes and understand patches. It might even help you to figure out what is going on in that merge you keep avoiding."

You can install Meld on Debian/Ubuntu systems (including Raspbian) with:


```
`$ sudo apt install meld`
```

On Fedora or similar, it's:


```
`$ sudo dnf install meld`
```

Meld is cross-platform—there's a [Windows install][3] using the [Chocolately][4] package manager. While it's not officially supported on macOS, there are [builds available for Mac][5], and you can install it on Homebrew with:


```
`$ brew cask install meld`
```

See Meld's homepage for [additional options][2].

### Meld vs. the diff command

If you have two similar files (perhaps one is a modified version of the other) and want to see the changes between them, you could run the **diff** command to see their differences in the terminal:

![diff output][6]

This example shows the differences between **conway1.py** and **conway2.py**. It's showing that I:

  * Removed the [shebang][7] and second line
  * Removed **(object)** from the class declaration
  * Added a docstring to the class
  * Swapped the order of **alive** and **neighbours == 2** in a method



Here's the same example using the **meld** command. You can run the same comparison from the command line with:


```
`$ meld conway1.py conway2.py`
```

![Meld output][8]

Much clearer!

You can easily see changes and merge changes between files by clicking the arrows (they work both ways). You can even edit the files live (Meld doubles up as a simple text editor with live comparisons as you type)—just be sure to save before you close the window.

You can even compare and edit three different files:

![Comparing three files in Meld][9]

### Meld's Git-awareness

Hopefully, you're using a version control system like [Git][10]. If so, your comparison isn't between two different files but to find differences between the current working file and the one Git knows. Meld understands this, so if you run **meld conway.py**, where **conway.py** is known by Git, it'll show you any changes made since the last Git commit:

![Comparing Git files in Meld][11]

You can see changes made in the current version (on the right) and the repository version (on the left). You can see I deleted a method and added a parameter and a loop since the last commit.

If you run **meld .**, you'll see all the changes in the current directory (or the whole repository, if you're in its root):

![Meld . output][12]

You can see a single file is modified, another file is unversioned (meaning it's new to Git, so I need to **git add** the file before comparing it), and lots of other unmodified files. Various display options are provided by icons along the top.

You can also compare two directories, which is sometimes handy:

![Comparing directories in Meld][13]

### Conclusion

Even regular users can find comparisons with diff difficult to decipher. I find the visualizations Meld provides make a big difference in troubleshooting what's changed between files. On top of that, Meld comes with some helpful awareness of version control and helps you compare across Git commits without thinking much about it. Give Meld a go, and make troubleshooting a little easier on the eyes.

* * *

_This was originally published on Ben Nuttall's [Tooling blog][14] and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/meld

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hat drink at the computer)
[2]: https://meldmerge.org/
[3]: https://chocolatey.org/packages/meld
[4]: https://opensource.com/article/20/3/chocolatey
[5]: https://yousseb.github.io/meld/
[6]: https://opensource.com/sites/default/files/uploads/diff-output.png (diff output)
[7]: https://en.wikipedia.org/wiki/Shebang_(Unix)
[8]: https://opensource.com/sites/default/files/uploads/meld-output.png (Meld output)
[9]: https://opensource.com/sites/default/files/uploads/meld-3-files.png (Comparing three files in Meld)
[10]: https://opensource.com/resources/what-is-git
[11]: https://opensource.com/sites/default/files/uploads/meld-git.png (Comparing Git files in Meld)
[12]: https://opensource.com/sites/default/files/uploads/meld-directory-changes.png (Meld . output)
[13]: https://opensource.com/sites/default/files/uploads/meld-directory-compare.png (Comparing directories in Meld)
[14]: https://tooling.bennuttall.com/meld/
