[#]: subject: (Converting Multiple Markdown Files into HTML or Other Formats in Linux)
[#]: via: (https://itsfoss.com/convert-markdown-files/)
[#]: author: (Bill Dyer https://itsfoss.com/author/bill/)
[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Converting Multiple Markdown Files into HTML or Other Formats in Linux
======

Many times, when I use Markdown, I work on one file and when I’m done with it, I convert it to HTML or some other format. Occasionally, I have to create a few files. When I do work with more than one Markdown file, I usually wait until I have finished them before I convert them.

I use pandoc to convert files, and it’s possible convert all the Markdown files in one shot.

Markdown can convert its files to .html, but if there’s a chance that I will have to convert to other formats like epub, [pandoc][1] is the tool to use. I prefer to use the command line, so I will cover that first, but you can also do this in [VSCodium][2] without the command line. I’ll cover that too.

### Converting multiple Markdown files to another format with Pandoc [command line method]

To get started quickly, Ubuntu, and other Debian distros can type the following commands in the terminal:

```
sudo apt-get install pandoc
```

In this example, I have four Markdown files in a directory called md_test.

```
[email protected]:~/Documents/md_test$ ls -l *.md
-rw-r--r-- 1 bdyer bdyer 3374 Apr  7  2020 file01.md
-rw-r--r-- 1 bdyer bdyer  782 Apr  2 05:23 file02.md
-rw-r--r-- 1 bdyer bdyer 9257 Apr  2 05:21 file03.md
-rw-r--r-- 1 bdyer bdyer 9442 Apr  2 05:21 file04.md
[email protected]:~/Documents/md_test$
```

There are no HTML files yet. Now I’ll use Pandoc to do its magic on the collection of files. To do this, I run a one-line command that:

  * calls pandoc
  * reads the .md files and exports them as .html



This is the command:

```
for i in *.md ; do echo "$i" && pandoc -s $i -o $i.html ; done
```

If you are not aware already, `;` is used for [running multiple commands at once in Linux][3].

Here’s what the display looks like once I have executed the command:

```
[email protected]:~/Documents/md_test$ for i in *.md ; do echo "$i" && pandoc -s $i -o $i.html ; done
file01.md
file02.md
file03.md
file04.md
[email protected]:~/Documents/md_test$
```

Let me use the `ls` command once more to see if HTML files were created:

```
[email protected]:~/Documents/md_test$ ls -l *.html
-rw-r--r-- 1 bdyer bdyer  4291 Apr  2 06:08 file01.md.html
-rw-r--r-- 1 bdyer bdyer  1781 Apr  2 06:08 file02.md.html
-rw-r--r-- 1 bdyer bdyer 10272 Apr  2 06:08 file03.md.html
-rw-r--r-- 1 bdyer bdyer 10502 Apr  2 06:08 file04.md.html
[email protected]:~/Documents/md_test$
```

The conversion was a success, and you have four HTML files ready to go on the Web server.

Pandoc is quite versatile and you can convert the markdown files to some other supported format by specifying the extension of the output files. You can understand why it is considered among the [best open source tools for writers][4].

**Recommended Read:**

![][5]

#### [11 Best Markdown Editors for Linux][6]

A list of best Markdown Editors for Linux distributions that not only look good but are also feature rich.

### Converting Markdown files to HTML using VSCodium [GUI method]

Like I’ve said earlier, I normally use the command line, but I don’t always use it for batch conversions, and you don’t have to either. VSCode or [VSCodium][7] can do the job. You just need to add one extension, called: _Markdown-All-in-One_ which will allow you to convert more than one Markdown file in one run.

There are two ways to install the extension:

  * VSCodium’s terminal
  * VSCodium’s plug-in manager



To install the extension through VSCodium’s terminal:

  1. Click on `Terminal` on the menu bar. The terminal panel will open
  2. Type, or [copy-and-paste, the following command in the terminal][8]:



```
codium --install-extension yzhang.markdown-all-in-one
```

**Note**: If you’re using VSCode instead of VSCodium, replace the word, `codium`, in the above command, with `code`

![][9]

The second way to install is through VSCodium’s plug-in, or extension, manager:

  1. Click on the blocks on the left side of the VSCodium window. A list of extensions will appear. At the top of the list, there will be a search bar.
  2. In the search bar, type: `Markdown All in One`. The extension will be listed at the top of the list. Click on the `Install` button to install it. If it is already installed, a gear icon will appear in place of the install button.



![][10]

Once the extension is installed, you can open the folder that contains the Markdown files you want to convert.

Click on the paper icon located on the left side of the VSCodium window. You’ll be given the opportunity to choose your folder. Once a folder is open, you’ll need to open at least one file. You can open as many files as you want, but one is the minimum.

Once a file is open, bring up the Command Palette by pressing `CTRL+SHIFT+P`. Then, start typing `Markdown`in the search bar that will appear. As you do this, a list of Markdown related commands will appear. One of these will be `Markdown All in One: Print documents to HTML` command. Click on that one.

![][11]

You’ll be asked to choose a folder containing the files. This is so an output directory (called `out`) can be made and this is where the HTML files will go. The image below shows that the HTML was made after exporting the Markdown documents. From here, you can open, view, and edit the HTML as you wish.

![][12]

By waiting to convert your Markdown files, you can concentrate more on writing. Conversion to HTML can come when you’re ready – and you have two ways to get that done.

--------------------------------------------------------------------------------

via: https://itsfoss.com/convert-markdown-files/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://pandoc.org/
[2]: https://vscodium.com/
[3]: https://itsfoss.com/run-multiple-commands-linux/
[4]: https://itsfoss.com/open-source-tools-writers/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2016/10/Best-Markdown-Editors-for-Linux.jpg?fit=800%2C450&ssl=1
[6]: https://itsfoss.com/best-markdown-editors-linux/
[7]: https://itsfoss.com/vscodium/
[8]: https://itsfoss.com/copy-paste-linux-terminal/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/vscodium_terminal.jpg?resize=800%2C564&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/vscodium_extension_select.jpg?resize=800%2C564&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/vscodium_markdown_function_options.jpg?resize=800%2C564&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/vscodium_html_filelist_shown.jpg?resize=800%2C564&ssl=1
