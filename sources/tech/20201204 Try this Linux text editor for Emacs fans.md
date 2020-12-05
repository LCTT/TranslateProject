[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Try this Linux text editor for Emacs fans)
[#]: via: (https://opensource.com/article/20/12/jove-emacs)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Try this Linux text editor for Emacs fans
======
If you're looking for a fast, easy Emacs editor without a long list of
dependencies, give Jove a try.
![Text editor on a browser, in blue][1]

GNU Emacs is a very famous editor, but not everyone knows that emacs is a _tradition_ of text editors rather than just one specific application.

The term "emacs" is actually a portmanteau of "Editor Macros," and the first one was programmed in 1976 as a set of macros for the TECO editor. GNU Emacs was developed as an interpretation of this style of visual text editor, and it was notably released as free, hackable, and redistributable software (called "free software" by the [Free Software Foundation][2], although the term "free" in this context means "liberated" rather than "gratis").

Other versions have been developed over the years, including [Jove][3], an acronym for "Jonathan Payne's Own Version of Emacs." Jove is a small (it's only 250K) and minimalistic version of Emacs that can prove useful when you find GNU Emacs too bloated for what you need.

### Install Jove

Fedora and Debian both have packages available for Jove, so it's easy to install on Linux. For instance, on Fedora:


```
`$ sudo dnf install jove`
```

You can also compile it yourself from [its source code][3]. You must have development tools and libraries installed (such as LLVM on macOS or [MinGW][4] on Windows).


```
$ wget <ftp://ftp.cs.toronto.edu/pub/moraes/jove/jove-X.Y.Z.tgz>
$ tar xvf jove*z
$ make
$ sudo make install
```

### Launch Jove

Jove is a terminal-based application (there is legacy code to provide a rudimentary GUI, but the library it's based on isn't 64-bit capable). If you're new to Jove or emacs, then you can learn about both from the `teachjove` tutorial. Start the tutorial by typing `teachjove` into a terminal:


```
`$ teachjove`
```

The tutorial is an interactive and guided tour introducing you to the _emacs way_ of entering and manipulating text. This is the easiest way to get started with Jove—and with emacs in general.

After you've done the tutorial, you can launch Jove by just typing `jove` into a terminal.

![Jove][5]

(Seth Kenlon, [CC BY-SA 4.0][6])

### Use Jove

As you might expect, most of what you do in Jove is type text. That's essentially the same regardless of what editor you're using. Working with that text, though, is where things get interesting. For instance, you might find that navigation in Jove feels integrated with other actions you perform because they're built around the **Ctrl** and **Alt** keys, like Copy, Paste, or Select. You can use the **Arrow** keys if you prefer, but try navigating with key combinations like **Ctrl**+**F** (forward) and **Ctrl**+**B** (back), or **Ctrl**+**P** (previous line) and **Ctrl**+**N** (next line). You might find that the unfamiliarity of these key combos is offset by how useful it is to be able to move your cursor around the same way you move text. It's a unified user experience that can help you optimize the way you work with text, whether you deal in prose or code.

Key combinations in Jove, as in GNU Emacs, invoke functions or commands. You can list all available commands with **Alt**+**?**, and you can press the **Space bar** to scroll through the list. This gives you some idea of what you can make your cursor do in the application or how you can make the application behave.

To get more information about any command, type **Alt**+**X** and **describe-command** followed by a command's name, and then press **Enter**. At the top of the Jove screen, you get basic information about the command and any key combinations assigned to it.

For a list of all key combinations, type **Alt**+**X**, then **describe-bindings**, and press **Enter**.

### Simple Emacs

Jove is a small, almost minimal emacs. It doesn't have all the functions and modes that GNU Emacs has, but in a way, that's its strength. Jove is a fast, easy editor to compile, start, and use, without a long list of dependencies. Thanks to Jove, you can set `EDITOR` and `VISUAL` to something in the emacs tradition and still get the responsiveness and speed of something like Vi or Nano.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/jove-emacs

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: http://fsf.org
[3]: ftp://ftp.cs.toronto.edu/pub/moraes/jove
[4]: https://opensource.com/article/20/8/gnu-windows-mingw
[5]: https://opensource.com/sites/default/files/uploads/jove.jpg (Jove)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
