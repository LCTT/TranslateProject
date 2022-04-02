[#]: subject: "Play the Viral Wordle Game in Linux"
[#]: via: "https://itsfoss.com/wordle-game-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Play the Viral Wordle Game in Linux
======

You might have heard of the viral game Wordle. It’s a game where you have to guess a five letter word in six attempts. The color codes help you with your guessing game.

![Image courtesy: Today’s Show][1]

NY Times recently bought this popular word game but you don’t have to be that rich to play it on Linux.

There are a few open source games inspired by Wordle. Warble is one of them and it is specially developed for desktop Linux.

### Warble: a Wordle clone for Linux desktop

Warble was created by [Andrew Vojak][2] on the ‘request’ of elementary OS co-founder. The game has 5,000 possible words and you can play at three difficulty levels.

![][3]

Hint is provided to help the new users get familiar with the game.

#### How do you play Wordle, again?

It could be overwhelming in the beginning. Let me help you with it. You should start with a random five-letter word.

If your letter is in the correct position, it is displayed in green. If the letter is in the word but its position is not correct, it is displayed in yellow. The gray color is used to highlight the letters that are not present in the word at all.

![][4]

Now, your next step should be to NOT use the letters in gray at all. The bottom screen highlights the letter to help you recall which letter should or should not be used.

Your guessing game starts now. You try to think of words with the letters that are in correct position while avoiding the gray letters entirely. Remember, you have six attempts to guess the word correctly to win the round.

![][5]

You type the words using your computer’s keyboard. When you have typed the five letters, press enter key to submit your choice to attempt the guess. While typing, if you think you want to change the letter, you can press backspace key to remove them, but this is before you hit the enter key. You cannot make a correction after you have submitted the choices for the current row.

Another thing to note is that you have to enter a real word, not any random combination of five letters. It won’t let you submit your choice if it’s not an actual word.

![][6]

You don’t have to finish a round. The game automatically saves so you can close the game anytime and if you open it again, you can pick up from where you left off.

Another good thing here is that you do not need to be online. There is also no limit on how many times you can play it in a day. The original Wordle games allow only one game play a day.

### Install Warble on Linux

Warble was specifically created for elementary OS and it is available in its App Center.

For other distributions, there is a Flatpak package available. If you have Flatpak support enabled on your distro, you can use the following command to install it:

```

    flatpak install https://flatpak.elementary.io/repo/appstream/com.github.avojak.warble.flatpakref

```

The Flatpak downloads almost 600 MB of data to install the game. It almost made me reconsider my decision to install Warble but the gameplay was worth the 600 MB data.

![][7]

Once installed, you can start the game by search for it in the system menu.

### Like the word play?

Warble is a good game to kill some time. It may also help improve the vocabulary. Somewhat like Scrabble but you don’t need other players to enjoy it.

If you want to ‘cheat’ or ‘improve your bash scripting’, FreeDOS creator Jim Hall shared [how you can use Linux commands to help you solve Wordle.][8]

A few years ago, we had another viral game called [2048][9]. It also got ‘cloned’ into several Linux games, including a terminal version. I wonder if we’ll get a terminal version of Wordle.

Have you played both Wordle and Warble? How does Warble compare to Wordle? Do share your experience in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/wordle-game-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/wordle-screenshot.jpg?resize=800%2C420&ssl=1
[2]: https://github.com/avojak
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/wordle-game-linux.jpg?resize=800%2C557&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/wordle-warble-hint.png?resize=589%2C800&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/wordle-game-play-linux.png?resize=606%2C800&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/entering-gibberish-warble-wordle-linux.png?resize=606%2C800&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/installing-warble-wordle-linux.png?resize=800%2C324&ssl=1
[8]: https://opensource.com/article/22/1/word-game-linux-command-line
[9]: https://itsfoss.com/2048-game/
