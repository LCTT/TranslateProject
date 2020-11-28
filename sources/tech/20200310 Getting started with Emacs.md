[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Emacs)
[#]: via: (https://opensource.com/article/20/3/getting-started-emacs)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Getting started with Emacs
======
10 tips for diving into the world of this useful group of open source
text editors.
![Computer keyboard typing][1]

Many people say they want to learn [Emacs][2], but many of them shy away after the briefest encounter. It's not because Emacs is bad or even that complex. The problem, I believe, is that people don't actually want to learn Emacs; they want to be comfortable with Emacs traditions. They want to understand the arcane keyboard shortcuts and unfamiliar terminology. They want to use Emacs as they believe it's "meant to be used."

I sympathize with this because that's how I felt about Emacs. I thought that all true Emacs users only ran it inside a terminal, and never used arrow keys or menus, much less a mouse. That's a great way to discourage yourself from getting started with Emacs. There are enough unique .emacs config files out there to prove that if there's one common strain among Emacs users, it's that everyone uses Emacs differently.

Learning Emacs is easy. It's loving Emacs that's hard. To love Emacs, you have to discover the features it has that you've been looking for, sometimes without knowing you've been missing them. And that takes experience.

The only way to get that experience is to start at the beginning—by actively using Emacs. Here are ten tips to help you figure out what works best for you.

### Start with the GUI

One of the greatest things about Emacs (and its friendly competitor, [Vim][3], too) is that it can be run in a terminal, which is useful when you SSH into a server, but not very significant on computers built within the last 15 years or so. The GUI version of Emacs can be run on extremely [low-powered devices][4], and it has lots of pragmatic features that both novice and experienced users can appreciate.

For example, if you don't know how to copy a word with just keyboard shortcuts in Emacs, the Edit menu's Copy, Cut, and Paste selections provide the path of least resistance. There's no reason to punish yourself for choosing Emacs. Use its menus, use your mouse to select regions and click in-buffer buttons, and don't let unfamiliarity stand in your way of being productive.

![Emacs slackware][5]

These features are built into Emacs because users use them. You should use them when you need them and work your way up to the obscure commands you think you might need when you eventually use Emacs over SSH on a VT100 terminal with no Alt or arrow keys.

### Get used to the terminology

Emacs has special terms for its UI elements. The evolution of personal computing didn't build upon the same terms, so many are relatively foreign to the modern computer user, and others are the same but have different meanings. Here are some of the most common terms:

  * Frame: In Emacs, the frame is what modern computing calls a "window."
  * Buffer: A buffer is a communication channel for Emacs. It may serve as a command-line for an Emacs process, or a shell, or just the contents of a file.
  * Window: A window is your view into a buffer.
  * Mini-buffer: The primary command-line, located at the bottom of the Emacs window.



![Emacs tutorial map][6]

### Making sense of Emacs modifier keys

On a PC keyboard, the Ctrl key is referred to as C, and the Alt key is referred to as M. These aren't the C and M keys, and because they're always paired with an accompanying letter or symbol key, they're easy to recognize in the documentation.

For example, C-x means Ctrl+X in modern keyboard notation, and M-x is Alt+X. You press the keys together just as you do when you're cutting text from any application.

There's another level of keyboard shortcuts, though, quite unlike anything on modern computers. Sometimes, a keyboard shortcut isn't just one key combo and instead consists of a series of key presses.

For instance, C-x C-f means to press Ctrl+X as usual, and then Ctrl+C as usual.

Sometimes, a keyboard shortcut has a mixture of key types. The combo C-x 3 means to press Ctrl+X as usual, and then the number 3 key.

The way Emacs can do these fancy power combos is because certain keys put Emacs into a special command mode. If you press C-X (that's Ctrl+X), you're telling Emacs to enter an idle state, waiting for a second key or keyboard shortcut.

Emacs documentation, both official and unofficial, is full of keyboard shortcuts. Practice mentally translating C to Ctrl and M to Alt, and all those docs will make a lot more sense to you.

### Alternate shortcuts for cut, copy, and paste

Canonically, copying text is performed with a series of keyboard shortcuts that depend on how you want to copy or cut.

For instance, you can cut a whole word with M-d (Emacs lingo for Alt+d), or a whole line with C-k (Ctrl+K), or a highlighted region with M-m (Alt+M). You can get used to that if you want, but if you like Ctrl+C and Ctrl+X and Ctrl-V, then you can use those instead.

Enabling modern cut-copy-paste requires activating a feature called CUA (Common User Access). To activate CUA, click on the Options menu and select Use CUA Keys. With this enabled, C-c copies highlighted text, C-x cuts highlighted text, and C-v pastes text. This mode is only actually active when you've selected text, so you can still learn the usual C-x and C-c bindings that Emacs normally uses.

### It's OK to share

Emacs is an application and has no awareness of your feelings or loyalty towards it. If you want to use Emacs only for tasks that "feel" right for Emacs, and different editor (like Vim) for other tasks, you can do that.

Your interactions with an application influence how you work, so if the pattern of keypresses required in Emacs doesn't agree with a specific task, then don't force yourself to use Emacs for that task. Emacs is just one of many open source tools available to you, and there's no reason to limit yourself to just one tool.

### Explore new functions

Most of what Emacs does is an elisp function that can be invoked from a menu selection, keyboard shortcut, or in some cases, a specific event. All functions can be executed from the mini-buffer (the command-line at the bottom of the Emacs frame). You could, in theory, even navigate your cursor by typing in functions like **forward-word** and **backward-word** and **next-line** and **previous-line**, and so on. It would be unbearably inefficient, but that's the kind of direct access to the code you're running. In a way, Emacs is its own API.

You can find out about new functions by reading about Emacs on community blogs, or you can take a more direct approach and use the describe-function function. To get help on any function, press M-x (that's Alt+X) and then type describe-function, and then press Return or Enter. You are prompted for a function name, and then shown a description of that function.

You can get a list of all available functions by typing M-x (Alt+X), followed by ?.

You can also get pop-up descriptions of functions as you type them by pressing M-x and then typing **auto-complete-mode**, and then pressing Return or Enter. With this mode active, as you type any Emacs function into your document, you're offered auto-completion options, along with a description of the function.

![Emacs function][7]

When you find a useful function and use it, Emacs tells you the keyboard binding for it, if one is set. If one doesn't exist, you can assign one yourself by opening your $HOME/.emacs configuration file and entering a keyboard shortcut assignment. The syntax is global-set-key, followed by the keyboard shortcut you want to use, followed by the function you want to invoke.

For example, to assign the screenwriter-slugline function to a keyboard binding:


```
`(global-set-key (kbd “C-c s”) 'screenwriter-slugline)`
```

Reload your configuration file, and the keyboard shortcut is available to you:


```
`M-x load-file ~/.emacs`
```

### Panic button

As you use Emacs and try new functions, you're bound to start invoking something you didn't mean to invoke. The universal panic button in Emacs is C-g (that's Ctrl+G).
I remember this by associating G with GNU, and I imagine I'm calling upon GNU to rescue me from a poor decision, but feel free to make up your own mnemonic.

If you press C-g a few times, the Emacs mini-buffer returns to a latent state, pop-up windows are hidden, and you're back to the safety of a plain old boring text editor.

### Ignore the keyboard shortcuts

There are too many potential keyboard shortcuts to summarize them all here, much less for you ever to hope to memorize. That's by design. Emacs is meant to be customized, and when people write plugins for Emacs, they get to define their own special keyboard shortcuts.

The idea isn't to memorize all shortcuts right away. Your goal, instead, is to get comfortable using Emacs. The more comfortable you become in Emacs, the more you'll get tired of resorting to the menu bar all the time, and you'll start to memorize the combos important to you.

Everyone has their own favorite shortcuts based on what they typically do in Emacs. Someone who spends all day writing code in Emacs may know all the keyboard shortcuts for running a debugger or for launching language-specific modes, but know nothing about Org-mode or Artist-mode. It's natural, and it's fine.

### Practice Emacs when you use Bash

One advantage to knowing Emacs keyboard shortcuts is that many of them also apply in Bash:

  * C-a—go to the beginning of a line
  * C-e—go to the end of a line
  * C-k—cut the whole line
  * M-f—go forward a word
  * M-b—go back a word
  * M-d—cut a word
  * C-y—yank back (paste) the most recently cut content
  * M-Shift-U—capitalize a word
  * C-t—swap two characters (for example, sl becomes ls)



There are many more examples, and it an make your interactions with your Bash terminal faster than you ever imagined.

### Packages

Emacs has a built-in package manager to help you discover new plugins. Its package manager contains modes to help you edit specific types of text (for instance, if you edit JSON files frequently, you might try ejson-mode), embedded applications, themes, spellchecking options, linters, and more. This is where Emacs has the potential to become crucial to your daily computing; once you find a great Emacs package, you may not be able to live without it.

![Emacs emoji][8]

You can browse packages by pressing M-x (that's Alt+X) and then typing **package-list-packages** command and then pressing Return or Enter. The package manager updates its cache each time you launch it, so be patient the first time you use it while it downloads a list of available packages. Once loaded, you can navigate with your keyboard or mouse (remember, Emacs is a GUI application). Each package name is a button, so either move your cursor over it and press Return or just click it with your mouse. You can read about the package in the new window that appears in your Emacs frame, and then install it with the Install button.

Some packages need special configuration, which is sometimes listed in its description, but other times require you to visit the package's home page to read more about it. For example, the auto-complete package ac-emoji installs easily but requires you to have a symbol font defined. It works either way, but you only see the corresponding emoji if you have the font installed, and you might not know that unless you visit its homepage.

### Tetris

Emacs has games, believe it or not. There's Sudoku, quizzes, minesweeper, a just-for-fun psychotherapist, and even Tetris. These aren't particularly useful, but interacting with Emacs on any level is great practice, and games are a great way to maximize your time spent in Emacs.

![Emacs tetris][9]

Tetris is also how I was introduced to Emacs in the first place, so of all versions of the game, it's the Emacs version that's truly my favorite.

### Using Emacs

GNU Emacs is popular because it's impossibly flexible and highly extensible. People get so accustomed to Emacs keyboard shortcuts that they habitually try to use them in all other applications, and they build applications into Emacs, so they never have to leave in the first place. If you want Emacs to play an important role in your computing life, the ultimate key is to embrace the unknown and start using Emacs. Stumble through it until you've discovered how to make it work for you, and then settle in for 40 years of comfort.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/getting-started-emacs

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/keyboaord_enter_writing_documentation.jpg?itok=kKrnXc5h (Computer keyboard typing)
[2]: https://opensource.com/downloads/emacs-cheat-sheet
[3]: https://opensource.com/downloads/cheat-sheet-vim
[4]: https://opensource.com/article/17/2/pocketchip-or-pi
[5]: https://opensource.com/sites/default/files/uploads/emacs-slackware.jpg (Emacs slackware)
[6]: https://opensource.com/sites/default/files/uploads/emacs-tutorial-map.png (Emacs tutorial map)
[7]: https://opensource.com/sites/default/files/uploads/emacs-function.jpg (Emacs function)
[8]: https://opensource.com/sites/default/files/uploads/emacs-emoji_0.jpg (Emacs emoji)
[9]: https://opensource.com/sites/default/files/uploads/emacs-tetris.jpg (Emacs tetris)
