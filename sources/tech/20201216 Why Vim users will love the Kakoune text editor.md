[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why Vim users will love the Kakoune text editor)
[#]: via: (https://opensource.com/article/20/12/kakoune)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Why Vim users will love the Kakoune text editor
======
This editor may be reminiscent of Vim, but it offers plenty of its own
unique functions and features.
![Typewriter keys in multicolor][1]

The [Kakoune][2] text editor takes inspiration from Vi. With a minimalistic interface, short keyboard shortcuts, and separate editing and insert modes, it does [look and feel a lot like Vi][3] at first. However, the Kakoune editor has its own unique style both in design and function and is better considered its own editor rather than yet another Vim.

### Install

On Linux and BSD, you can install Kakoune from your distribution’s software repository or ports tree. For example, on Fedora, CentOS, or RHEL:


```
`$ sudo dnf install kakoune`
```

On Debian, Ubuntu, or similar:


```
`$ sudo apt install kakoune`
```

On macOS, you can use Homebrew:


```
`$ brew install kakoune`
```

Alternatively, you can [build it from source code][4].

The command to start Kakoune is `kak`. You can start Kakoune empty, or you can include a file name for it to open upon launch:


```
`$ kak example.txt`
```

### Using Kakoune

When you launch Kakoune (without a file name), it opens a mostly empty buffer in your terminal, except for a small status bar at the bottom of the windows. Like Vim, Kakoune starts in "normal" mode, which accepts key presses as commands and does not enter text into the buffer. To enter _insert_ mode, you must press either **i** (for **insert**) or **a** (for **append**).

While in insert mode, Kakoune acts mostly like any other editor. You type on your keyboard, and the characters you type show up in the buffer. While in insert mode, you can use the arrow keys to navigate through the buffer.

### Normal mode

In normal mode, you can issue navigation and text editing commands. This is the most obvious borrowed feature from the Vi tradition. Editing commands include functions to copy, cut (or "yank," in traditional Unix editing vernacular), and paste words and lines, undo, transform characters to upper or lower case, and so on. Here are some of the basics:

  * **d**: yank and delete current selection ("cut" in modern terminology)
  * **c**: yank and delete current selection and enter insert mode
  * **Esc+Alt+d**: delete current selection
  * **y**: yank selection
  * **p**: paste
  * **&lt;**: unindent selected lines
  * **u**: undo
  * **U**: redo
  * **`**: transform to lower case
  * **~**: transform to upper case



### Selection

In Kakoune, your cursor is a single-character mobile selection. Unless you extend your selection, any commands affecting a selection apply to just your cursor. For instance, if your cursor is hovering over the letter **n**, then the yank command (**c** in normal mode) copies the letter **n** to your clipboard, and the paste command (**p** in normal mode) pastes the letter **n** into the buffer.

The easiest way to extend a selection from a single character is to enter normal mode and press the **Shift** key while moving your cursor with the arrow keys. There are, however, several methods of extending a selection based on certain criteria. For instance, **Alt+l** extends a selection region from your cursor to the end of the current line.

Full documentation is available at <https://github.com/mawww/kakoune/blob/master/README.asciidoc>.

### Functions

In addition to these basic interactions, you can also issue commands to invoke the built-in functions of Kakoune. To access the Kakoune’s command line, type `:` in normal mode. From the command line, you can issue commands, including the essential **edit** command to open a file, the **write** command to save your buffer to a file, and of course, **quit** to exit the application.

There are many more functions, including special options for specific programming languages and file formats, an option to use the [Ranger file navigator][5] to browse your file system, change your color theme, search and replace text, and much more.

![Kakoune][6]

### Try Kakoune

If you’re an experienced Vim user or even someone with just a passing competency, you might find Kakoune disorienting at first. It’s just similar enough to Vim to lull you into a false sense of familiarity—everything works exactly like Vim until it’s drastically different. However, if you’re new to Vim-like editors, or you’re a Vim user looking for a new challenge, then Kakoune could be an ideal editor for you.

Try it for yourself!

When I started using the vi text editor, I hated it. Now I've been using vi for more than 17 years...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/kakoune

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-docdish-typewriterkeys-3.png?itok=NyBwMdK_ (Typewriter keys in multicolor)
[2]: https://kakoune.org/
[3]: https://opensource.com/article/20/12/vi-text-editor
[4]: https://github.com/mawww/kakoune
[5]: https://opensource.com/article/20/3/ranger-file-navigator
[6]: https://opensource.com/sites/default/files/kakoune-screenshot.png (Kakoune)
