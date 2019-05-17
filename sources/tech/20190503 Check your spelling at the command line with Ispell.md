[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Check your spelling at the command line with Ispell)
[#]: via: (https://opensource.com/article/19/5/spelling-command-line-ispell)
[#]: author: (Scott Nesbitt  https://opensource.com/users/scottnesbitt)

Check your spelling at the command line with Ispell
======
Ispell helps you stamp out typos in plain text files written in more
than 50 languages.
![Command line prompt][1]

Good spelling is a skill. A skill that takes time to learn and to master. That said, there are people who never quite pick that skill up—I know a couple or three outstanding writers who can't spell to save their lives.

Even if you spell well, the occasional typo creeps in. That's especially true if you're quickly banging on your keyboard to meet a deadline. Regardless of your spelling chops, it's always a good idea to run what you've written through a spelling checker.

I do most of my writing in [plain text][2] and often use a command line spelling checker called [Aspell][3] to do the deed. Aspell isn't the only game in town. You might also want to check out the venerable [Ispell][4].

### Getting started

Ispell's been around, in various forms, since 1971. Don't let its age fool you. Ispell is still a peppy application that you can use effectively in the 21st century.

Before doing anything else, check whether or not Ispell is installed on your computer by cracking open a terminal window and typing **which ispell**. If it isn't installed, fire up your distribution's package manager and install Ispell from there.

Don't forget to install dictionaries for the languages you work in, too. My only language is English, so I just need to worry about grabbing the US and British English dictionaries. You're not limited to my mother (and only) tongue. Ispell has [dictionaries for over 50 languages][5].

![Installing Ispell dictionaries][6]

### Using Ispell

If you haven't guessed already, Ispell only works with text files. That includes ones marked up with HTML, LaTeX, and [nroff or troff][7]. More on this in a few moments.

To get to work, open a terminal window and navigate to the directory containing the file where you want to run a spelling check. Type **ispell** followed by the file's name and then press Enter.

![Checking spelling with Ispell][8]

Ispell highlights the first word it doesn't recognize. If the word is misspelled, Ispell usually offers one or more alternatives. Press **R** and then the number beside the correct choice. In the screen capture above, I'd press **R** and **0** to fix the error.

If, on the other hand, the word is correctly spelled, press **A** to move to the next misspelled word.

Keep doing that until you reach the end of the file. Ispell saves your changes, creates a backup of the file you just checked (with the extension _.bak_ ), and shuts down.

### A few other options

This example illustrates basic Ispell usage. The program has a [number of options][9], some of which you _might_ use and others you _might never_ use. Let's take a quick peek at some of the ones I regularly use.

A few paragraphs ago, I mentioned that Ispell works with certain markup languages. You need to tell it a file's format. When starting Ispell, add **-t** for a TeX or LaTeX file, **-H** for an HTML file, or **-n** for a groff or troff file. For example, if you enter **ispell -t myReport.tex** , Ispell ignores all markup.

If you don't want the backup file that Ispell creates after checking a file, add **-x** to the command line—for example, **ispell -x myFile.txt**.

What happens if Ispell runs into a word that's spelled correctly but isn't in its dictionary, like a proper name? You can add that word to a personal word list by pressing **I**. This saves the word to a file called _.ispell_default_ in the root of your _/home_ directory.

Those are the options I find most useful when working with Ispell, but check out [Ispell's man page][9] for descriptions of all its options.

Is Ispell any better or faster than Aspell or any other command line spelling checker? I have to say it's no worse than any of them, nor is it any slower. Ispell's not for everyone. It might not be for you. But it is good to have options, isn't it?

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/spelling-command-line-ispell

作者：[Scott Nesbitt ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://plaintextproject.online
[3]: https://opensource.com/article/18/2/how-check-spelling-linux-command-line-aspell
[4]: https://www.cs.hmc.edu/~geoff/ispell.html
[5]: https://www.cs.hmc.edu/~geoff/ispell-dictionaries.html
[6]: https://opensource.com/sites/default/files/uploads/ispell-install-dictionaries.png (Installing Ispell dictionaries)
[7]: https://opensource.com/article/18/2/how-format-academic-papers-linux-groff-me
[8]: https://opensource.com/sites/default/files/uploads/ispell-checking.png (Checking spelling with Ispell)
[9]: https://www.cs.hmc.edu/~geoff/ispell-man.html
