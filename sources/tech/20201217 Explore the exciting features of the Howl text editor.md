[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Explore the exciting features of the Howl text editor)
[#]: via: (https://opensource.com/article/20/12/howl)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Explore the exciting features of the Howl text editor
======
Howl is a general-purpose text editor with a super-efficient workflow
and plenty of features to keep it fun and interesting.
![Typewriter in the grass][1]

Howl is a general-purpose text editor written in Moonscript and Lua. It’s not focused on a specific programming language, and instead features support for many different languages and formats. In fact, it takes inspiration from "traditional" Unix editors like [Emacs][2] and [Vim][3], so it feels familiar to anyone accustomed to that style of editing. It’s primarily a text-oriented interface, without dialogue boxes, toolbars, or a menu, and yet, it has many exciting features that make it feel a little like an IDE for authors, regardless of whether you write code or prose.

![Howl][4]

### Install

Howl is developed on Linux and for Linux. However, it’s written in Lua with some GTK wrapping, both of which are cross-platform, so if you’re keen to compile code, you can test Howl on Windows or macOS.

The compile process is relatively simple, provided you have LuaJIT and GTK development libraries installed. In this sample command, `X.Y` represents a version number in tag form:


```
$ git clone --depth 1
–branch X.Y
<https://github.com/howl-editor/howl.git>
$ cd howl-X.Y/src
$ make
$ make install
```

You can launch Howl from your application menu or from a terminal.

### Using Howl

Howl is a lightweight editor. It has a fast startup time and a small overall footprint. This is, in part, thanks to LuaJIT, a just-in-time (JIT) compiler for the [Lua programming language][5].

When you first launch it, the Howl interface is a single empty window. The Howl window contains one view by default, but it can contain more. For instance, you can press **Alt+X** to bring up a command-line view in your Howl window.

![Black Howl command line box with cursor][6]

The command line lets you enter editor commands. You use it a lot because Howl has no menu bar and no toolbar. Conveniently, you can press **Tab** for suggested command completion as you type, so it’s actually much faster than a traditional menu for locating a function, even when you don’t know the exact name of the function you’re looking for.

To dismiss the command-line view, press **Esc** on your keyboard.

### Opening a file

To open a file in Howl, press **Alt+X** to bring up a command line and then type `open` followed by a **Space**. Howl displays a new temporary view: a view into your file system so you can choose a file to open. You can choose a file by either typing its path or by clicking on the file you want.

### Editing text with Howl

Howl’s interface is optimized for its primary function: to edit text. It makes composing words, whether in code or in a natural language, sublimely efficient. As you type, regardless of what you’re typing, Howl offers predictive completion of the current word. To complete a word as it’s being suggested, press **Return** or **Enter** on your keyboard.

Everything that happens in the Howl editor view is a function. For instance, when you select a word and press **Ctrl+C** to copy it, you are invoking the `editor-copy` function, which is assigned the **Ctrl+C** key binding. You might be surprised at how many functions are available. For instance, you can copy an entire line of text with the `editor-copy-line` function by typing **Alt+X** to bring up the command-line view and then `editor-copy-line`. If you hadn’t already just read about it here, you might have discovered the function on your own the same way I did: open a command-line view, type a keyword, such as "copy," and press **Tab** for relevant suggestions.

When you discover functions through the command-line view, you’re also provided with the function’s default keyboard shortcut, if there is one.

![Black Howl terminal box with white, gray and pink code][7]

### Saving a file

After you’re done writing or programming (or both), you probably want to save your work. You can do that, as you might guess, with the `save` function. Open a command-line view with **Alt+X** and then type `save`, or just press **Ctrl+S** on your keyboard.

### Quit

Howl is such a great editor, you probably won’t want to quit. However, sometimes you want to experience the joy of opening Howl to see how quickly it loads, and in order to do that, you have to exit. To exit the application, open a command-line view with **Alt+X** and then type `quit`.

### Extensions and configuration

Howl doesn’t have an extension language because it’s written in Moonscript and Lua, using the same API available for everyone else. Said another way: Howl is its own extension. Should you find the Howl API insufficient, you can code directly in C by using LuaJIT’s [FFI library][8].

You can configure Howl in a file called `~/.howl/init.moon` (for Moonscript) or `~/.howl/init.lua` (for Lua).

Configurable options in Howl are displayed as configuration variables. You can set these variables interactively from within Howl using the `set` command, or you can define them in your Howl init file. To discover new configuration variables, type the `set` command into Howl’s command line, and then press the **Spacebar** to see potential completions.

If you’re not familiar with Lua, check out my [Lua cheat sheet][9]. Moonscript is arguably even easier if you’re not familiar with Lua yet.

### Use this editor

Howl is a pleasure to use and exciting to explore. It’s a lean, focused, and efficient editor with lots of features and an extensible design. If you’re a fan of text, text editing, Lua, or just plain good application design, start using Howl. You won’t `quit` any time soon (but not because you don’t know how).

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/howl

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/doc-dish-lead.png?itok=h3fCkVmU (Typewriter in the grass)
[2]: https://opensource.com/article/20/2/who-cares-about-emacs
[3]: https://opensource.com/article/20/3/vim-skills
[4]: https://opensource.com/sites/default/files/31-howl.jpg (Howl)
[5]: https://opensource.com/article/20/2/lua-cheat-sheet
[6]: https://opensource.com/sites/default/files/uploads/howl-command-31-howl-opensource.jpg (Black Howl command line box with cursor)
[7]: https://opensource.com/sites/default/files/uploads/howl-tab-31-howl-opensource.jpg (Black Howl terminal box with white, gray and pink code)
[8]: https://luajit.org/ext_ffi.html
[9]: http://opensource.com/article/20/2/lua-cheat-sheet
