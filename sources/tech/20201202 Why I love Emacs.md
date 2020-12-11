[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why I love Emacs)
[#]: via: (https://opensource.com/article/20/12/emacs)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Why I love Emacs
======
Emacs isn't a mere text editor; it places you in control and allows you
to solve nearly any problem you encounter.
![Emoji keyboard][1]

I'm a habitual [Emacs][2] user. I didn't choose Emacs as much as it chose me. Back when I was first learning about Unix, I stumbled upon a little-known feature in a strange application called Emacs, which was apparently hidden away on my computer. Legend had it (and was proven true) that if you typed `emacs` into a terminal, pressed **Alt**+**X**, and typed `tetris`, you could play a falling-blocks game.

![Tetris in Emacs][3]

That was my introduction to GNU Emacs. While it was frivolous, it was also an accurate indication of what Emacs is all about—the idea that users can reprogram their (virtual) worlds and do _whatever_ they want with an application. Playing Tetris in your text editor is probably not your primary goal on an everyday basis, but it goes to show that Emacs is, proudly, a programming platform. In fact, you might think of it as a kind of precursor to [Jupyter][4], combining a powerful programming language (called `elisp`, to be exact) with its own live environment. As a consequence, Emacs is flexible as a text editor, customizable, and powerful.

Elisp (and Common Lisp, by extension) aren't necessarily the easiest languages to start out on, if you're used to Bash or Python or similar languages. But LISP dialects are powerful, and because Emacs is a LISP interpreter, you can build applications, whether they're Emacs plugins or prototypes of something you want to develop into a stand-alone project. The wildly popular [org-mode project][5] is just one example: it's an Emacs plugin as well as a markdown syntax with mobile apps to interpret and extend its capabilities. There are many examples of similarly useful applications-within-Emacs, including an email client, a PDF viewer, web browser, a shell, and a file manager.

### Two interfaces

GNU Emacs has at least two user interfaces: a graphical user interface (GUI) and a terminal user interface (TUI). This sometimes surprises people because Emacs is often pitted against Vi, which runs in a terminal (although gVim provides a GUI for a modern Vi implementation). If you want to run GNU Emacs as a terminal application, you can launch it with the `-nw` option:


```
`$ emacs -nw`
```

With a GUI, you can just launch Emacs from your application menu or a terminal.

You might think that a GUI renders Emacs less effective, as if "real text editors run in a terminal," but a GUI can make Emacs easier to learn because its GUI follows some typical conventions (a menu bar, adjustable widgets, mouse interaction, and so on).

In fact, if you run Emacs as a GUI application, you can probably get through the day without noticing you're in Emacs at all. Most of the usual conventions apply, as long as you use the GUI. For instance, you can select text with your mouse, navigate to the **Edit** menu, select **Copy**, and then place your cursor elsewhere and select **Paste**. To save a document, you can go to **File** and **Save** or **Save As**. You can press **Ctrl** and scroll up to make your screen font larger, you can use the scroll bar to navigate through your document, and so on.

Getting to know Emacs in its GUI form is a great way to flatten the learning curve.

### Emacs keyboard shortcuts

GNU Emacs is infamous for complex keyboard combinations. They're not only unfamiliar (**Alt**+**W** to copy? **Ctrl**+**Y** to paste?), they're also notated with arcane terminology ("Alt" is called "Meta"), and sometimes they come in pairs (**Ctrl**+**X** followed by **Ctrl**+**S** to save) and other times alone (**Ctrl**+**S** to search). Why would anyone willfully choose to use this?

Well, some don't. But those who do are fans of how these combinations easily flow into the rhythm of everyday typing (and often have the **Caps Lock** key serve as a **Ctrl** key). Those who prefer something different, however, have several options.

  * The `evil` mode lets you use Vim keybindings in Emacs. It's that simple: You get to keep the key combinations you've committed to muscle memory, and you inherit the most powerful text editor available.
  * Common User Access (CUA) keys keep all of the usual Emacs key combinations but the most jarring ones—copy, cut, paste, and undo—are all mapped to their modern bindings (**Ctrl**+**C**, **Ctrl**+**X**, **Ctrl**+**V**, and **Ctrl**+**Z**, respectively).
  * The `global-set-key` function, part of the programming side of Emacs, allows you to define your own keyboard shortcuts. Traditionally, user-defined shortcuts start with **Ctrl**+**C**, but nothing is stopping you from inventing your own scheme. Emacs isn't precious of its own identity. You're welcome to bend it to your will.



### Learn Emacs

It takes time to get very good with Emacs. For me, that meant printing out a [cheat sheet][6] and keeping it next to my keyboard all day, every day. When I forgot a key combo, I looked it up on my cheat sheet. If it wasn't on my cheat sheet, I learned the keyboard combo, either by executing the function and noting how Emacs told me I could access it quicker or by using `describe-function`:


```
M-x describe-function: save-buffer

save-buffer is an interactive compiled Lisp function in ‘files.el’.

It is bound to C-x C-s, &lt;menu-bar&gt; &lt;file&gt; &lt;save-buffer&gt;.
[...]
```

As you use it, you learn it. And the more you learn about it, the more empowered you become to improve it and make it your own.

### Try Emacs

It's a common joke to say that Emacs is an operating system with a text editor included. Maybe that's meant to insinuate Emacs is bloated and overly complex, and there's certainly an argument that a text editor shouldn't require `libpoppler` according to its default configuration (you can compile Emacs without it).

But there's a greater truth lurking behind this joke, and it reveals a lot about what makes Emacs so fun. It doesn't make sense to compare Emacs to other text editors, like Vim, Nano, or even [VSCodium][7], because the really important part of Emacs isn't the idea that you can type stuff into a window and save it. That's basic functionality that even Bash provides. The true significance of Emacs is how it places you in control and how, through Emacs Lisp ([Elisp][8]), nearly any problem can be solved.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/emacs

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/emoji-keyboard.jpg?itok=JplrSZ9c (Emoji keyboard)
[2]: https://en.wikipedia.org/wiki/Emacs
[3]: https://opensource.com/sites/default/files/tetris.png (Tetris in Emacs)
[4]: https://opensource.com/article/20/11/surprising-jupyter
[5]: https://opensource.com/article/19/1/productivity-tool-org-mode
[6]: https://opensource.com/downloads/emacs-cheat-sheet
[7]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[8]: https://www.gnu.org/software/emacs/manual/html_node/elisp/
