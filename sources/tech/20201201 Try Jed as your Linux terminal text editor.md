[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Try Jed as your Linux terminal text editor)
[#]: via: (https://opensource.com/article/20/12/jed)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Try Jed as your Linux terminal text editor
======
Jed's handy drop-down menu makes it easy for users who are new to
terminal text editors.
![Person using a laptop][1]

You may have heard about Emacs and Vim and Nano, the quintessential Linux text editors, but Linux has an abundance of open source text editors, and it's my goal to spend December giving 31 of them a fair go.

In this article, I look at [Jed][2], a terminal-based editor featuring a handy drop-down menu, which makes it especially easy for users who are new to terminal editors, as well as those who just don't like remembering keyboard combinations for every function.

### Install Jed

On Linux, your distribution's software repository may make Jed available to install through your package manager:


```
`$ sudo dnf install jed`
```

Not all do, but it's an easy application to compile from source code. First, download [S-Lang][3] (the language Jed is written in) and install it:


```
$ wget <https://www.jedsoft.org/releases/slang/slang-x.y.z.tar.bz2>
$ tar xvf slang*bz2
$ cd slang-x.y.z
$ ./configure ; make
$ sudo make install
```

Once that's installed, do the same with the [Jed source code][4]:


```
$ wget <https://www.jedsoft.org/releases/jed/jed-x.y.z.tar.bz2>
$ tar xvf jed*bz2
$ cd jed-x.y.z
$ ./configure ; make
$ sudo make install
```

### Launch Jed

Jed runs in a terminal, so to start it, just open a terminal and type `jed`:


```
F10 key ==&gt; File   Edit   Search   Buffers   Windows   System   Help

     This is a scratch buffer.  It is NOT saved when you exit.

     To access the menus, press F10 or ESC-m and the use the arrow
     keys to navigate.

     Latest version information is available on the web from
     &lt;[http://www.jedsoft.org/jed/\&gt;][5].  Other sources of JED
     information include the usenet newsgroups comp.editors and
     alt.lang.s-lang.  To subscribe to the jed-users mailing list, see
     &lt;[http://www.jedsoft.org/jed/mailinglists.html\&gt;][6].

     Copyright (C) 1994, 2000-2009  John E. Davis
     Email comments or suggestions to &lt;[jed@jedsoft.org][7]&gt;.

[ (Jed 0.99.19U) Emacs: *scratch*    ()  1/16   8:49am ]
```

### How to use Jed

The instructions that Jed auto-loads are clear and helpful. You can press either the **F10** key or the **Esc** key followed by the letter **M** to enter the top menu. This places your cursor into the menu bar at the top of the Jed screen, but it doesn't open a menu. To open a menu, press **Enter** or **Return** on your keyboard. Use the arrow keys to navigate through each menu.

The onscreen menu is not only helpful for first-time users, it also provides great reminders of keyboard shortcuts for experienced users. For instance, you can probably guess how to save a file you've been working on: Go to the **File** menu and select **Save**. If you want to speed that process up, you can learn the keyboard combination of **Ctrl**+**X** and then **Ctrl**+**S** (yes, that's two keyboard shortcuts in succession).

### Explore Jed's features

For a simple editor, Jed has a surprising list of useful features. It's got a built-in multiplexer, allowing you to have multiple files open at once but "stacked" on top of one another, so you can shuffle through them. You can split your Jed window to have multiple files onscreen at once, change your color theme, or open a shell.

For anyone experienced with Emacs, many of Jed's "unadvertised" features, such as keyboard combinations for navigation and control, are instantly familiar. Then again, there's a slight learning (or maybe unlearning) curve when a keyboard combination is drastically different from what you expect. For example, **Alt**+**B** in GNU Emacs moves the cursor back a word, but in Jed, by default, it's a shortcut for the **Buffers** menu. This caught me off-guard about once each sentence of this article.

![Jed][8]

Jed also has **modes** that allow you to load modules or plugins to help you write specific kinds of text. For instance, I wrote this article using the default `text_mode`, but I was able to switch over to `lua` mode when hacking on a [Lua][9] script. These modes offer syntax highlighting and help with matching parentheses and other delimiting characters. You can see which modes are bundled with Jed by looking in `/usr/share/jed/lib` and because they're written in S-Lang, you can review the code and possibly learn a new language.

### Try Jed

Jed is a pleasant and refreshingly clear text editor for your Linux terminal. It's lightweight, easy to use, and relatively uncomplicated in design. As an alternative to Vi for quick edits, you can set Jed as `EDITOR` and `VISUAL` in your `~/.bashrc` file (and in your root user's `~/.bashrc` file if you're root). Try Jed today.

Want to become a master of text editing in the terminal, and beyond? These tips for getting started...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/jed

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://www.jedsoft.org/jed
[3]: https://www.jedsoft.org/releases/slang/
[4]: https://www.jedsoft.org/releases/jed
[5]: http://www.jedsoft.org/jed/\>
[6]: http://www.jedsoft.org/jed/mailinglists.html\>
[7]: mailto:jed@jedsoft.org
[8]: https://opensource.com/sites/default/files/jed.png (Jed)
[9]: https://opensource.com/article/20/2/lua-cheat-sheet
