[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Try GNU nano, a lightweight alternative to Vim)
[#]: via: (https://opensource.com/article/20/12/gnu-nano)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Try GNU nano, a lightweight alternative to Vim
======
Lightweight and straightforward, nano delivers a simple, intuitive
editor with no extra fuss.
![A pink typewriter][1]

Many Linux distributions bundle [Vim][2] as their default text editor. This appeals to many longtime Linux users, and those who don’t like it can change it promptly after install anyway. Vim is a funny editor, though, as it’s one of the few that opens to a mode that doesn’t permit text entry. That’s a puzzling choice for any user, and it’s confusing for a new one.

Thanks to GNU nano, there’s a common alternative to Vim for a lightweight terminal-based text editor, and it’s so easy to use—it has its most important commands listed at the bottom of its window.

![Black nano terminal with white text][3]

### Installing

On Linux and macOS, you probably already have GNU nano installed. You can verify with the `which` command:


```
$ which nano
/bin/nano
```

If you don’t have it installed, you can install it from your software repository, or you can [download its source code and compile it][4] yourself.

On Windows, you can [install GNU nano][5] using [Chocolatey][6].

### Launching nano

Launch nano from the terminal, either alone:


```
`$ nano`
```

Or you can also open a specific file by following your command with a path to a file. If the file you name doesn’t already exist, it’s created:


```
`$ nano example.txt`
```

### Using nano

Nano is, with just a little reading, pretty self-explanatory. When you launch it, nano opens to either an empty buffer or the file you opened. At the bottom of the screen, there’s a list of functions and their corresponding keyboard shortcuts. More functions are available by pressing **Ctrl+G** for Get Help.

Here are the most important application commands:

  * **Ctrl+S** saves your work
  * **Ctrl+W** save as
  * **Ctrl+R** loads a file ("Read")
  * **Ctrl+X** quits, or exits
  * **Ctrl+G** get help



Here are the most common editing commands:

  * **Alt+A** select ("mark") a region
  * **Ctrl+K** cut marked text
  * **Ctrl+U** paste ("uncut")
  * **Alt+F** undo
  * **Alt+E** redo



### Customizable

Nano isn’t as extensible as Emacs or Vim, but you can make some significant customizations in a file called `~/.nanorc`. In this file, you can set global preferences, including word wrap settings, color schemes, line numbering, and more. You can also create your own key bindings, so if you want to use **Ctrl+V** to paste instead of nano’s default **Ctrl+U**, you can change the binding assigned to the **paste** function:


```
`bind ^V paste all`
```

You can get a list of all available functions in the [GNU nano documentation][7].

### Simple and effective

GNU nano is a no-nonsense, straightforward text editor. It’s easy to use and provides all the functionality you expect from a text editor. Try it out, and enjoy the simplicity of intuitive editing.

Vim offers great benefits to writers, regardless of whether they are technically minded or not.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/gnu-nano

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-docdish-typewriter-pink.png?itok=OXJBtyYf (A pink typewriter)
[2]: https://opensource.com/article/20/12/vi-text-editor
[3]: https://opensource.com/sites/default/files/uploads/nano-31_days-nano-opensource.png (Black nano terminal with white text)
[4]: http://nano-editor.org
[5]: https://opensource.com/article/20/12/%C2%A0https://chocolatey.org/packages/nano
[6]: https://opensource.com/article/20/3/chocolatey
[7]: https://www.nano-editor.org/dist/latest/nanorc.5.html
