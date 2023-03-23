[#]: subject: "Play Crossword Puzzle Games on Linux Desktop With this Brand New GNOME App"
[#]: via: "https://itsfoss.com/crosswords/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Play Crossword Puzzle Games on Linux Desktop With this Brand New GNOME App
======
I suck at word games.

Scrabble, spelling bees, and crosswords are certainly not my cup of tea.

But I know people who are crazy about these games. People who like to spend their tea time solving crossword puzzles.

You’ll love this new GNOME app if you are one of those [cruciverbalists][1].

### Crosswords: GNOME app for solving crossword puzzles

As reported by [LWN][2], longtime GNOME contributor Jonathan Blandford is developing a new crossword puzzle game for Linux users. It’s called Crosswords, no surprises there.

There are a few puzzles provided by the game. In addition to that, you can download and play puzzles from popular news outlets like Atlantic, Guardian, etc. You can also open .ipuz and .puz files to play the puzzles you have downloaded or created.

![crosswords interface][3]

When you choose the puzzles from a news outlet, Crosswords downloads the puzzle for the current day.

![Crossword puzzles from The Atlantic][4]

While there is no scope for downloading the puzzles for the days in the past, your downloaded puzzles are saved in the game, and you can revisit them anytime.

![Downloaded puzzles are saved for each outlet][5]

So, all you have to do is download the crossword puzzles daily. You can visit them later if you don’t get time to play it the same day.

Do note that puzzles may not be downloaded for all the outlets. It showed me an error when I tried downloading from The New Yorker.

![Crosswords may not be able to download puzzles all the time][6]

If you are stuck, you can take hints or show incorrect guesses. The ? in the top menu gives you a few options in that regard.

![Hints are also available][7]

Your games are saved automatically. You can close the game and resume playing it whenever you get time.

Sounds promising? Let’s see how you can install it in your Linux distribution.

### Installing Crosswords

**The application is under development and you may notice a few issues**. For some reason, the application interface prefers the portrait mode. When I resized the application window, hitting the back button to select some other puzzle made the interface switch to vertical, portrait mode.

If you can get past this annoyance, you can enjoy Crosswords.

It is available in Flatpak packing format. If your [distribution has Flatpak support enabled][8], you can install it using the following commands.

Add the Flathub repository first.

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Install the package now.

```
flatpak install flathub org.gnome.Crosswords
```

![crosswords installed linux][9]

Once installed, you can look for the game in the menu and start it.

![crossword puzzle game linux][10]

#### Removing Crosswords

If you don’t like Crosswords, you can remove it from your system using the following command:

```
flatpak uninstall org.gnome.Crosswords
```

Press Y when you are asked to confirm.

![Removing Crosswords][11]

### Conclusion

There are plenty of puzzle and board games available for Linux users. [Wordle][12], [2048][13], Sudoku, Mahjong, or even the classic Solitaire game are there for you when you want to kill some time to exercise your brain.

Tiny games like these do not require heavy graphics and system resources. It’s good to see one more addition to the list of such games.

If you try Crosswords, don’t forget to share your experience in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/crosswords/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://www.dictionary.com/browse/cruciverbalist
[2]: https://lwn.net/Articles/903475/
[3]: https://itsfoss.com/wp-content/uploads/2022/08/crosswords-interface.png
[4]: https://itsfoss.com/wp-content/uploads/2022/08/daily-corssword-puzzle.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/downloaded-puzzles-crosswords.png
[6]: https://itsfoss.com/wp-content/uploads/2022/08/problem-downloading-crossword-puzzle-from-new-yorker.png
[7]: https://itsfoss.com/wp-content/uploads/2022/08/hints-crosswords.png
[8]: https://itsfoss.com/flatpak-guide/
[9]: https://itsfoss.com/wp-content/uploads/2022/08/crosswords-installed-linux.png
[10]: https://itsfoss.com/wp-content/uploads/2022/08/crossword-puzzle-game-linux.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/uninstall-crosswords.png
[12]: https://itsfoss.com/wordle-game-linux/
[13]: https://itsfoss.com/2048-game/
