[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Experience the useful features of the Xedit text editor)
[#]: via: (https://opensource.com/article/20/12/xedit)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Experience the useful features of the Xedit text editor
======
Xedit, part of the X11 graphic server, isn't much to look at but has
enough hidden features to make it a serious text editor.
![Computer screen with files or windows open][1]

The X11 graphic server, distributed by [X.org][2], has a few token applications that show how to program with its provided tools. These range from the [TWM][3] desktop to the silly but hypnotic Xeyes. It also includes a text editor called Xedit, a seemingly simple application with enough hidden features to make it a serious editor.

### Install Xedit

If you're on Linux or BSD, you can install Xedit from your distribution's software repository or ports tree. It sometimes appears in a package called X11-apps bundled with other X11 apps.

On macOS, you can install [XQuartz][4], which provides Xedit, Xeyes, and a few other small applications (along with an X11 graphics server).

### Launch Xedit

You can launch Xedit from your application menu, if it's listed. Some distributions treat it more as a command than a GUI app, even though it is definitely a GUI app, so it may not be listed in your application menu. In that case, you can launch Xedit from the terminal. If you type `xedit &` to launch the application, it launches an empty Xedit editor ready for text. If you enter the launch command along with an existing file's name, Xedit starts with the file loaded into its buffer:


```
`$ xedit example.txt &`
```

![Xedit][5]

(Seth Kenlon, [CC BY-SA 4.0][6])

### Load a file

From an open Xedit instance, you can load a file by typing the file's path in the top text field. Click the **Load** button (to the left of the text field) to read the file into the Xedit window.

![Load Xedit][7]

(Seth Kenlon, [CC BY-SA 4.0][6])

You can have several files open at once. When one file is loaded, it takes focus and appears in your main Xedit buffer (the big text field in the main window) and shuffles any existing file into a hidden buffer.

You can navigate between buffers using a key combo familiar to Emacs users but sometimes confusing to others: First, press **Ctrl+X**. Release those keys, and then press **Ctrl+B**.

### Key combos

It feels strange at first to perform actions that require _two_ keyboard shortcuts in a row, but after a while, you get used to it. In fact, as a frequent Emacs user, I find the compound key combinations comfortingly rhythmic. I was surprised and pleased to find that some of my favorite shortcuts were valid in Xedit.

It turns out that Xedit borrows keyboard shortcuts from several sources of inspiration. If you're an Emacs user, you'll find that the most common combinations are valid in Xedit. For instance, **C-x** **C-f** (that's **Ctrl+X** followed **Ctrl+F**) takes you to the top text field to load a file, and **C-x** **C-s** (**Ctrl+X** followed by **Ctrl+S**) saves a file. Surprisingly, **C-x** **3** even splits the window vertically, while **C-x** **2** splits it horizontally, and **C-x** **0** or **1** removes the split.

Edit commands familiar to Emacs or Bash users also apply:

  * **Ctrl+A** moves to the beginning of a line.
  * **Ctrl+E** moves to the end of a line.
  * **Alt+B** moves back a word.
  * **Ctrl+B** moves back a character.
  * **Ctrl+F** moves forward a character.
  * **Alt+F** moves forward a word.
  * **Ctrl+D** deletes the next character.



There are many more, and they're listed on the Xedit man page.

### Use line-editing mode

Xedit also includes a line editor, similar to **ex**, which ought to be familiar to [Vi][8] and `ed` or even `sed` users. To enter line-editing mode, press the **Esc** key. This places you in the top text field but in a command mode. Edit commands use the syntax: _line number_ followed by a _command_ and _parameters_.

Say you have this text file:


```
ed is the standard Unix text editor.
This is line number two.
```

You decide you want to change `ed` to `Xedit` in line 1. In Xedit, move to line 1, press **Esc**, and then type `.,s/ed/Xedit/`.


```
Xedit is the standard Unix text editor.
This is line number two.
```

Without moving your cursor to the next line, you could change `two` to `the second`: Press **Esc** and then type `2,s/two/the second/`.

Possible commands and valid parameters are listed in Xedit's man page.

### Simple but robust

Xedit isn't much to look at. It's simple, it has no menus to speak of, but it borrows some popular conveniences from some of the best Unix editors. The next time you're looking for a new editor, try Xedit.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/xedit

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://www.x.org/wiki/
[3]: https://opensource.com/article/19/12/twm-linux-desktop
[4]: http://xquartz.org
[5]: https://opensource.com/sites/default/files/uploads/xedit.jpeg (Xedit)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/xedit-load.jpg (Load Xedit)
[8]: https://opensource.com/article/20/12/vi-text-editor
