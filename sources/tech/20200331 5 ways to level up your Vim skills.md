[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 ways to level up your Vim skills)
[#]: via: (https://opensource.com/article/20/3/vim-skills)
[#]: author: (Detlef Johnson https://opensource.com/users/deckart)

5 ways to level up your Vim skills
======
Kick your text editor up a notch with a few fun tricks.
![Computer keyboard typing][1]

Vim is one of the most popular text editors out there, so it is definitely worth taking time to learn how to use it. If the only things you learn how to do with the ubiquitous [Vi(m)][2] command-line text editor are to open a file, enter and edit some text, save the edited files, and exit the program, you will be much better off for it.

Circumstances where you will find it extremely convenient to know Vim nearly always involve tasks running remote shell operations. If you regularly use secure shell: 


```
`$ ssh user@hostname.provider.com`
```

and work with virtual private servers (VPS) or local virtualization containers, for that matter, you could benefit greatly from strong Vim skills.

### Set Vim as your default text editor

Vim is readily available in nearly all modern Linux (or BSD) distributions at the terminal emulator shell-command prompt. Once you've defined Vim as your default editor in your user shell, then you can navigate built-in utilities like **$ man** using familiar Vim key bindings. I'll explain how to do that with both Bash and Z shell (zsh), which is now the default shell for macOS users (since Catalina).

#### Set Vim as default in Bash

Bash manages settings through a combination of dotfiles. It's most common to add your preferred editor to your **.bashrc** file in your home directory, but it can be added to **.bash_profile** as well. (Read the [GNU Bash documentation][3] to understand the difference).

Set Vim as your default editor by adding the following to **~/.bashrc**:


```
# set default editor to Vim
export EDITOR=vim
```

A line starting with a **#** is an optional comment, which is a good way to remind yourself what a command does.

#### Set Vim as default in Zsh

Zsh is an increasingly popular terminal emulator, especially since Apple's FreeBSD-based Darwin system recently switched from Bash to zsh.

The zsh dotfile parallels Bash's, so you can choose between **~/.zshrc** or **~/.zprofile**. See [the zsh documentation][4] for details on when to use which one.

Set it as default with:


```
# set default editor to Vim
export EDITOR=vim
```

### Optimize your Vim configuration

Vim, much like a terminal emulator shell, uses dotfiles to set personal preferences. If you spotted the pattern, you might have guessed it's **~/.vimrc**.

The first setting you may want to change is switching legacy Vi compatibility mode to Off. Since Vim is a superset of Vi, everything in Vi is available and vastly improved in Vim, and you get many advanced features. The latest version (8.2) allows you to open a terminal as a subprocess shell running in a split window.

As an aside, setting legacy compatibility off might not seem like it's doing anything ([and in fact, it might not be][5]). Vim automatically switches the mode to Off by implication when it encounters a **.vimrc** file. It can still be important at times to explicitly turn it off. The shorthand "nocp" is synonymous with "nocompatible," which also works. There are many "[TIMTOWTDI][6]" conveniences for switching preferences as you work.

Lines that begin with **"** are comments in **.vimrc** syntax (just like **#** in **.bashrc** files). They can help you remember things like why you chose a cryptic setting name.

To turn off Vi compatibility, add the following to your **~/.vimrc** file:


```
" ensure that legacy compatibility mode is off
" documentation: <http://vimdoc.sourceforge.net/htmldoc/options.html\#'compatible>'
set nocp
```

### Understand modes

The notion of Vim's "modes" is very important to learn about, especially the difference between the very distinct **Normal** and **Insert** modes. Confusion about modes is what trips up most new users. Modes aren't unique to Vim, nor were they introduced by Vi. Command mode is so old that it predates the invention of [copy and paste][7] functionality in the 1970s.

#### Important modes

Vim depends on different modes to define keyboard-stroke behavior. The important modes to know are:

  * **Normal mode**: Default mode used primarily for navigation and opening files
  * **Insert mode** (includes Replace): Where Vim allows for text input to an open file
  * **Visual mode**: Where Vim acts similar to mouse-based input, such as copying, editing, replacing, and more
  * **Command mode** (including Line, Ex command, and Last-line mode): A powerful way to do more in Vim



Each mode has a great deal to explore. Use [Vimtutor][8] (**$ vimtutor**) to interactively learn about movement, modes, and running Ex commands in "Last Line" mode. Some indispensable productivity operators include:

**:E** | Opens explorer for locating files and directories
---|---
**.** | Repeats the last edit action
**;** | Repeats the last motion or movement forward
**,** | Repeats the last motion or movement backward
**/** | Searches document forward
**?** | Searches document backward
***** | Finds next occurrence of the word under the cursor
**#** | Finds the previous occurrence of the word under the cursor
**~** | Toggles case
**%** | Toggles between opening and closing **()**, **[]**, and **{}**; highly useful for coding
**z=** | Makes spelling suggestions

### Play Vim like a piano

While it's important to commit Vim's operator "language" to memory, the challenge to gaining mastery is to learn to think like a musician and combine operators and movements into "key chords in harmony" so that you can play Vim like a piano. That's where the power of text manipulation with Vim rivals that of the other notable command-line editor, Emacs. (While one of these editors will wear down your **Esc** key, using the other will wear down your **Ctrl** key.)

When describing key chords, it's conventional in Vim to designate the **Ctrl** key using the capital letter C, followed by a hyphen (**C-**). It's not universal, but I will follow that convention from here onward and clarify when there is any potential for confusion.

If you type long lines in Vim, you'll want to set it to wrap your text. To start personalizing Vim for the way you work, think about that setting: How would you like Vim to handle text wrapping by default when it starts? On or off? I like it turned off and leave it out of the runtime commands file. When I want text to wrap, I simply set it in command-line mode with **:set wrap**.

There's nothing wrong with having Vim set to wrap text by default. It's simply a matter of preference—which can change over time. The same goes for handling paste, code language indent syntax, and the **Tab** key (tabs or spaces? and how many spaces then? Dive into these options [here][9]). All these options for default behavior are entirely configurable and changeable in real time as you work with command-line mode operations.

You will find many suggestions for setting Vim defaults in community forums, on Vim wikis, and in articles (like this one). Setting preferences for your personal computing environment should be fairly familiar to you, and Vim is no different. I highly recommend that you start by making very small changes to your settings, and make additional changes slowly so that you can easily revert settings. This way, you might avoid the use of plugins for years—or entirely.

### Splits, tabs, and terminals in Vim 8.2

There are two ways to split your working files into different views: they can appear side-by-side, or you can switch between them with full (window) screens using application tabs. These changes to your application window are initiated from command-line mode, which requires a colon (**:**) to call up the prompt.

Each window split can host a file for editing, and you can arrange tabs to switch between additional files as much as you like. There is limited screen space for splits, so tabs are handy when you want to split more screens. How you decide to work is purely a matter of preference. To split a window horizontally, use **:sp**, and use **:vs** for vertical splits.

As of [Vim 8.2][10], you can open a terminal shell sub-process in a vertical split with **:vert term** to run operations on the command line right alongside your code. You need to type **exit** to close your terminal process, just like you would end a shell session, but you close splits and tabs the same way you would close any ordinary Vim window, with **:q**.

To initialize a tab, use a special edit command: **:tabedit**, which automatically switches you to the new open tab. If you give the command a file name as an argument, that file will open for editing. If you neglect to give it a file name as an argument, the command-line mode edit **:e filename.txt** works just like it would in any ordinary Vim window. Navigate tabs with the next (**:tabn**) and previous (**:tabp**) commands.

To use splits, you need to know how to navigate among them using the key-chord combination **C-w** plus a movement key in the direction you want to move, such as left (**h**), down (**j**), up (**k**), or right (**l**). When you want to learn more key chords specific to splits and tabs, read the **:help split** and **:help tabpage** for the Vim manual entries.

### Get help

While the Vim manual is referenced in Vimtutor, opening Vim help with **:help** will let you spend time with the editor on your own and get more productive without wholly relying on articles like this one. Experience is key to Vim mastery. The experience contributes to your overall computing intuition since so much of what has gone into Vim is drawn from the Unix universe.

Have fun exploring the beauty of Vim, and share any questions you have in the comments.

Want to become a master of text editing in the terminal, and beyond? These tips for getting started...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/vim-skills

作者：[Detlef Johnson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/deckart
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/keyboaord_enter_writing_documentation.jpg?itok=kKrnXc5h (Computer keyboard typing)
[2]: https://www.vim.org/
[3]: https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
[4]: http://zsh.sourceforge.net/Intro/intro_3.html
[5]: http://vimdoc.sourceforge.net/htmldoc/starting.html#compatible-default
[6]: https://en.wikipedia.org/wiki/There%27s_more_than_one_way_to_do_it
[7]: https://www.npr.org/2020/02/22/808404858/remembering-the-pioneer-behind-your-computers-cut-copy-and-paste-functions
[8]: http://www2.geog.ucl.ac.uk/~plewis/teaching/unix/vimtutor
[9]: https://opensource.com/article/18/9/vi-editor-productivity-powerhouse
[10]: https://www.vim.org/vim-8.2-released.php
