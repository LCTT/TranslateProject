[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn to use the JOE text editor on Linux)
[#]: via: (https://opensource.com/article/20/12/joe)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Learn to use the JOE text editor on Linux
======
Joe's Own Editor (JOE) is a general text editor that is easy to learn
and use.
![Person programming on a laptop on a building][1]

I’m a fan of text editors that make it easy for you to learn how to use them. GNU nano is my favorite example of this: you launch nano, and you see a list of the most common commands along the bottom of the window throughout your entire session. Joe’s Own Editor (that’s `joe` for short) is another great example.

The `joe` editor uses a terminal-based interface, providing simple text editing capabilities and an easily accessible help screen. It’s written in C, it’s small with a hard dependency only on libc (ncurses is optional), and it’s licensed under the GPL.

### Installing

On Linux, you may be able to find JOE in your distribution’s software repository. It’s a little obscure, though, so not all distributions have packaged it. If that’s the case, you can download the source code from [SourceForge][2] and compile it yourself. It’s an easy process:


```
$ ./configure
$ make
$ sudo make install
```

### Using JOE

According to its author, JOE takes inspiration from an application called WordStar and from [GNU Emacs][3]. Most of its basic editing keys are the same as WordStar shortcuts, and the editor itself strives to approximate WordStar. JOE also has some of the key bindings and features of GNU Emacs. This mix of two sources of inspiration can sometimes be disorienting, but then again, weaning yourself off Emacs (or your usual text editor of choice) under any circumstance can be disorienting. The important thing is that JOE offers help, and it’s easy to reach.

In the top right corner of JOE’s interface, there’s a persistent reminder that you can press **Ctrl+K** followed immediately by **H** to view a help screen. This is a toggle, so once you activate it, the help screen remains displayed at the top of your editor window until dismissed with the same key combo (**^KH** in JOE’s keyboard notation).

### Keyboard shortcuts

For all the pride JOE’s author takes in simulating a WordStar user experience, I have to admit it’s lost on me. I’d never heard of WordStar until I read about it in JOE’s documentation, and to me, it seemed to have a completely arbitrary keyboard shortcut scheme. Some are prefixed with **Ctrl+K** as an escape sequence, while others use **Esc** as the prefix, and still others require no escape sequence at all. I couldn’t determine the logic. Editing operations were just as likely as application options to require an escape sequence or not, and few of the letter associations made sense to me (**Ctrl+K** **D** for **save as**, for instance).

Luckily, JOE lets you cheat on keyboard shortcuts. Upon installation, JOE quietly creates a few symlinks for the `joe` executable. Included are:

  * `jmacs` JOE with Emacs key bindings
  * `jpico` JOE with Pico (or GNU nano) key bindings
  * `rjoe` JOE with editing restricted only to the file passed to JOE at launch
  * `jstar` JOE with WordStar key bindings



![Black terminal with white text showing WordStar key bindings][4]

The persistent help menu remains, so if you’re ever unclear as to what functions you have available to you, refer to them with the help prompt at the top right of the screen. Of course, in Pico/nano mode, the main commands are always visible.

### Try JOE

JOE isn’t intended as a text editor you’ll never leave. It won’t become your IDE, email client, web browser, and file manager. In fact, it may not even be your main text editor for all tasks. It focuses on being good at one thing, and that’s general text editing.

JOE has all of the essential functions you need, like the ability to navigate your text quickly, the ability to select text, copy and paste, and so on. Give JOE a try, using your preferred symlink.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/joe

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: https://joe-editor.sourceforge.io/
[3]: https://opensource.com/article/20/12/emacs
[4]: https://opensource.com/sites/default/files/uploads/joe-jstar-31_days-joe-opensource.png (Black terminal with white text showing WordStar key bindings)
