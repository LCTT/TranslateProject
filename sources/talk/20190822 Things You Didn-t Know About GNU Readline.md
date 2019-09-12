[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Things You Didn't Know About GNU Readline)
[#]: via: (https://twobithistory.org/2019/08/22/readline.html)
[#]: author: (Two-Bit History https://twobithistory.org)

Things You Didn't Know About GNU Readline
======

I sometimes think of my computer as a very large house. I visit this house every day and know most of the rooms on the ground floor, but there are bedrooms I’ve never been in, closets I haven’t opened, nooks and crannies that I’ve never explored. I feel compelled to learn more about my computer the same way anyone would feel compelled to see a room they had never visited in their own home.

GNU Readline is an unassuming little software library that I relied on for years without realizing that it was there. Tens of thousands of people probably use it every day without thinking about it. If you use the Bash shell, every time you auto-complete a filename, or move the cursor around within a single line of input text, or search through the history of your previous commands, you are using GNU Readline. When you do those same things while using the command-line interface to Postgres (`psql`), say, or the Ruby REPL (`irb`), you are again using GNU Readline. Lots of software depends on the GNU Readline library to implement functionality that users expect, but the functionality is so auxiliary and unobtrusive that I imagine few people stop to wonder where it comes from.

GNU Readline was originally created in the 1980s by the Free Software Foundation. Today, it is an important if invisible part of everyone’s computing infrastructure, maintained by a single volunteer.

### Feature Replete

The GNU Readline library exists primarily to augment any command-line interface with a common set of keystrokes that allow you to move around within and edit a single line of input. If you press `Ctrl-A` at a Bash prompt, for example, that will jump your cursor to the very beginning of the line, while pressing `Ctrl-E` will jump it to the end. Another useful command is `Ctrl-U`, which will delete everything in the line before the cursor.

For an embarrassingly long time, I moved around on the command line by repeatedly tapping arrow keys. For some reason, I never imagined that there was a faster way to do it. Of course, no programmer familiar with a text editor like Vim or Emacs would deign to punch arrow keys for long, so something like Readline was bound to be created. Using Readline, you can do much more than just jump around—you can edit your single line of text as if you were using a text editor. There are commands to delete words, transpose words, upcase words, copy and paste characters, etc. In fact, most of Readline’s keystrokes/shortcuts are based on Emacs. Readline is essentially Emacs for a single line of text. You can even record and replay macros.

I have never used Emacs, so I find it hard to remember what all the different Readline commands are. But one thing about Readline that is really neat is that you can switch to using a Vim-based mode instead. To do this for Bash, you can use the `set` builtin. The following will tell Readline to use Vim-style commands for the current shell:

```
$ set -o vi
```

With this option enabled, you can delete words using `dw` and so on. The equivalent to `Ctrl-U` in the Emacs mode would be `d0`.

I was excited to try this when I first learned about it, but I’ve found that it doesn’t work so well for me. I’m happy that this concession to Vim users exists, and you might have more luck with it than me, particularly if you haven’t already used Readline’s default command keystrokes. My problem is that, by the time I heard about the Vim-based interface, I had already learned several Readline keystrokes. Even with the Vim option enabled, I keep using the default keystrokes by mistake. Also, without some sort of indicator, Vim’s modal design is awkward here—it’s very easy to forget which mode you’re in. So I’m stuck at a local maximum using Vim as my text editor but Emacs-style Readline commands. I suspect a lot of other people are in the same position.

If you feel, not unreasonably, that both Vim and Emacs’ keyboard command systems are bizarre and arcane, you can customize Readline’s key bindings and make them whatever you like. This is not hard to do. Readline reads a `~/.inputrc` file on startup that can be used to configure various options and key bindings. One thing I’ve done is reconfigured `Ctrl-K`. Normally it deletes from the cursor to the end of the line, but I rarely do that. So I’ve instead bound it so that pressing `Ctrl-K` deletes the whole line, regardless of where the cursor is. I’ve done that by adding the following to `~/.inputrc`:

```
Control-k: kill-whole-line
```

Each Readline command (the documentation refers to them as _functions_) has a name that you can associate with a key sequence this way. If you edit `~/.inputrc` in Vim, it turns out that Vim knows the filetype and will help you by highlighting valid function names but not invalid ones!

Another thing you can do with `~/.inputrc` is create canned macros by mapping key sequences to input strings. [The Readline manual][1] gives one example that I think is especially useful. I often find myself wanting to save the output of a program to a file, which means that I often append something like `> output.txt` to Bash commands. To save some time, you could make this a Readline macro:

```
Control-o: "> output.txt"
```

Now, whenever you press `Ctrl-O`, you’ll see that `> output.txt` gets added after your cursor on the command line. Neat!

But with macros you can do more than just create shortcuts for strings of text. The following entry in `~/.inputrc` means that, every time I press `Ctrl-J`, any text I already have on the line is surrounded by `$(` and `)`. The macro moves to the beginning of the line with `Ctrl-A`, adds `$(`, then moves to the end of the line with `Ctrl-E` and adds `)`:

```
Control-j: "\C-a$(\C-e)"
```

This might be useful if you often need the output of one command to use for another, such as in:

```
$ cd $(brew --prefix)
```

The `~/.inputrc` file also allows you to set different values for what the Readline manual calls _variables_. These enable or disable certain Readline behaviors. You can use these variables to change, for example, how Readline auto-completion works or how the Readline history search works. One variable I’d recommend turning on is the `revert-all-at-newline` variable, which by default is off. When the variable is off, if you pull a line from your command history using the reverse search feature, edit it, but then decide to search instead for another line, the edit you made is preserved in the history. I find this confusing because it leads to lines showing up in your Bash command history that you never actually ran. So add this to your `~/.inputrc`:

```
set revert-all-at-newline on
```

When you set options or key bindings using `~/.inputrc`, they apply wherever the Readline library is used. This includes Bash most obviously, but you’ll also get the benefit of your changes in other programs like `irb` and `psql` too! A Readline macro that inserts `SELECT * FROM` could be useful if you often use command-line interfaces to relational databases.

### Chet Ramey

GNU Readline is today maintained by Chet Ramey, a Senior Technology Architect at Case Western Reserve University. Ramey also maintains the Bash shell. Both projects were first authored by a Free Software Foundation employee named Brian Fox beginning in 1988. But Ramey has been the sole maintainer since around 1994.

Ramey told me via email that Readline, far from being an original idea, was created to implement functionality prescribed by the POSIX specification, which in the late 1980s had just been created. Many earlier shells, including the Korn shell and at least one version of the Unix System V shell, included line editing functionality. The 1988 version of the Korn shell (`ksh88`) provided both Emacs-style and Vi/Vim-style editing modes. As far as I can tell from [the manual page][2], the Korn shell would decide which mode you wanted to use by looking at the `VISUAL` and `EDITOR` environment variables, which is pretty neat. The parts of POSIX that specified shell functionality were closely modeled on `ksh88`, so GNU Bash was going to have to implement a similarly flexible line-editing system to stay compliant. Hence Readline.

When Ramey first got involved in Bash development, Readline was a single source file in the Bash project directory. It was really just a part of Bash. Over time, the Readline file slowly moved toward becoming an independent project, though it was not until 1994 (with the 2.0 release of Readline) that Readline became a separate library entirely.

Readline is closely associated with Bash, and Ramey usually pairs Readline releases with Bash releases. But as I mentioned above, Readline is a library that can be used by any software implementing a command-line interface. And it’s really easy to use. This is a simple example, but here’s how you would you use Readline in your own C program. The string argument to the `readline()` function is the prompt that you want Readline to display to the user:

```
#include <stdio.h>
#include <stdlib.h>
#include "readline/readline.h"

int main(int argc, char** argv)
{
    char* line = readline("my-rl-example> ");
    printf("You entered: \"%s\"\n", line);

    free(line);

    return 0;
}
```

Your program hands off control to Readline, which is responsible for getting a line of input from the user (in such a way that allows the user to do all the fancy line-editing things). Once the user has actually submitted the line, Readline returns it to you. I was able to compile the above by linking against the Readline library, which I apparently have somewhere in my library search path, by invoking the following:

```
$ gcc main.c -lreadline
```

The Readline API is much more extensive than that single function of course, and anyone using it can tweak all sorts of things about the library’s behavior. Library users can even add new functions that end users can configure via `~/.inputrc`, meaning that Readline is very easy to extend. But, as far as I can tell, even Bash ultimately calls the simple `readline()` function to get input just as in the example above, though there is a lot of configuration beforehand. (See [this line][3] in the source for GNU Bash, which seems to be where Bash hands off responsibility for getting input to Readline.)

Ramey has now worked on Bash and Readline for well over a decade. He has never once been compensated for his work—he is and has always been a volunteer. Bash and Readline continue to be actively developed, though Ramey said that Readline changes much more slowly than Bash does. I asked Ramey what it was like being the sole maintainer of software that so many people use. He said that millions of people probably use Bash without realizing it (because every Apple device runs Bash), which makes him worry about how much disruption a breaking change might cause. But he’s slowly gotten used to the idea of all those people out there. He said that he continues to work on Bash and Readline because at this point he is deeply invested and because he simply likes to make useful software available to the world.

_You can find more information about Chet Ramey at [his website][4]._

_If you enjoyed this post, more like it come out every four weeks! Follow [@TwoBitHistory][5] on Twitter or subscribe to the [RSS feed][6] to make sure you know when a new post is out._

_Previously on TwoBitHistory…_

> Please enjoy my long overdue new post, in which I use the story of the BBC Micro and the Computer Literacy Project as a springboard to complain about Codecademy.<https://t.co/PiWlKljDjK>
>
> — TwoBitHistory (@TwoBitHistory) [March 31, 2019][7]

--------------------------------------------------------------------------------

via: https://twobithistory.org/2019/08/22/readline.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://tiswww.case.edu/php/chet/readline/readline.html
[2]: https://web.archive.org/web/20151105130220/http://www2.research.att.com/sw/download/man/man1/ksh88.html
[3]: https://github.com/bminor/bash/blob/9f597fd10993313262cab400bf3c46ffb3f6fd1e/parse.y#L1487
[4]: https://tiswww.case.edu/php/chet/
[5]: https://twitter.com/TwoBitHistory
[6]: https://twobithistory.org/feed.xml
[7]: https://twitter.com/TwoBitHistory/status/1112492084383092738?ref_src=twsrc%5Etfw
