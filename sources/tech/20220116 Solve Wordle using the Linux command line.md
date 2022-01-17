[#]: subject: "Solve Wordle using the Linux command line"
[#]: via: "https://opensource.com/article/22/1/word-game-linux-command-line"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Solve Wordle using the Linux command line
======
Use the Linux grep and fgrep commands to win your favorite word-based
guessing games.
![Linux keys on the keyboard for a desktop computer][1]

I've recently become a little obsessed with an online word puzzle game in which you have six attempts to guess a random five-letter word. The word changes every day, and you can only play once per day. After each guess, each of the letters in your guess is highlighted: gray means that letter does not appear in the mystery word, yellow means that letter appears in the word but not at that position, and green means the letter appears in the word at that correct position.

Here's how you can use the Linux command line to help you play guessing games like Wordle. I used this method to help me solve the January 6 puzzle:

### First try

Linux systems keep a dictionary of words in the `/usr/share/dict/words` file. This is a very long plain text file. My system's words file has over 479,800 entries in it. The file contains both plain words and proper nouns (names, places, and so on).

To start my first guess, I just want a list of plain words that are exactly five letters long. To do that, I use this `grep` command:


```
`$ grep '^[a-z][a-z][a-z][a-z][a-z]$' /usr/share/dict/words > myguess`
```

The `grep` command uses regular expressions to perform searches. You can do a lot with regular expressions, but to help me solve Wordle, I only need the basics: The `^` means the start of a line, and the `$` means the end of a line. In between, I've specified five instances of `[a-z]`, which indicates any lowercase letter from a to z.

I can also use the `wc` command to see my list of possible words is "only" 15,000 words:


```


$ wc -l myguess
15034 myguess

```

From that list, I picked a random five-letter word: _acres_. The _a_ was set to yellow, meaning that letter exists somewhere in the mystery word but not in the first position. The other letters are gray, so I know they don't exist in the word of the day.

![acres word attempt][2]

Jim Hall (CC BY-SA 4.0)

### Second try

For my next guess, I want to get a list of all words that contain an _a_, but not in the first position. My list should also not include the letters _c_, _r_, _e_, or _s_. Let's break this down into steps:

To get a list of all words with an a, I use the `fgrep` (fixed strings grep) command. The `fgrep` command also searches for text like `grep`, but without using regular expressions:


```
`$ fgrep a myguess > myguess2`
```

That brings my possible list of next guesses down from 15,000 words to 6,600 words:


```


$ wc -l myguess myguess2
 15034 myguess
  6634 myguess2
 21668 total

```

But that list of words also includes the letter _a_ in the first position, which I don't want. The game already indicated the letter _a_ exists in some other position. I can modify my command with `grep` to look for words containing some other letter in the first position. That narrows my possible guesses to just 5,500 words:


```


$ fgrep a myguess | grep '^[b-z]' &gt; myguess2
$ wc -l myguess myguess2
 15034 myguess
  5566 myguess2
 20600 total

```

But I know the mystery word also does not include the letters _c_, _r_, _e_, or _s_. I can use another `grep` command to omit those letters from the search:


```


$ fgrep a myguess | grep '^[b-z]' | grep -v '[cres]' &gt; myguess2
$ wc -l myguess myguess2
15034 myguess
 1257 myguess2
16291 total

```

The `-v` option means to invert the search, so `grep` will only return the lines that do not match the regular expression `[cres]` or the single list of letters _c_, _r_, _e_, or _s_. With this extra `grep` command, I've narrowed my next guess considerably to only 1,200 possible words with an a somewhere but not in the first position, and that do not contain _c_, _r_, _e_, or _s_.

After viewing the list, I decided to try the word _balmy_.

![balmy word attempt][3]

Jim Hall (CC BY-SA 4.0)

### Third try

This time, the letters _b_ and _a_ were highlighted in green, meaning I have those letters in the correct position. The letter _l_ was yellow, so that letter exists somewhere else in the word, but not in that position. The letters _m_ and _y_ are gray, so I can eliminate those from my next guess.

To identify my next list of possible words, I can use another set of `grep` commands. I know the word starts with _ba_, so I can begin my search there:


```


$ grep '^ba' myguess2 &gt; myguess3
$ wc -l myguess3
77 myguess3

```

That's only 77 words! I can narrow that further by looking for words that also contain the letter _l_ in anywhere but the third position:


```


$ grep '^ba[^l]' myguess2 &gt; myguess3
$ wc -l myguess3
61 myguess3

```

The `^` inside the square brackets `[^l]` means not this list of letters, so not the letter _l_. That brings my list of possible words to 61, not all of which contain the letter _l_, which I can eliminate using another `grep` search:


```


$ grep '^ba[^l]' myguess2 | fgrep l &gt; myguess3
$ wc -l myguess3
10 myguess3

```

Some of those words might contain the letters _m_ and _y_, which are not in today's mystery word. I can remove those from my list of guesses with one more inverted `grep` search:


```


$ grep '^ba[^l]' myguess2 | fgrep l | grep -v '[my]' &gt; myguess3
$ wc -l myguess3
7 myguess3

```

My list of possible words is very short now, only seven words!


```


$ cat myguess3
babul
bailo
bakal
bakli
banal
bauld
baulk

```

I'll pick _banal_ as a likely word for my next guess, which happened to be correct.

![banal word attempt][4]

Jim Hall (CC BY-SA 4.0)

### The power of regular expressions

The Linux command line provides powerful tools to help you do real work. The `grep` and `fgrep` commands offer great flexibility in scanning lists of words. For a word-based guessing game, `grep` helped identify a list of 15,000 possible words of the day. After guessing and knowing what letters did and did not appear in the mystery word, `grep` and `fgrep` helped narrow the options to 1,200 words and then only seven words. That's the power of the command line.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/word-game-linux-command-line

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://opensource.com/sites/default/files/acres.png (acres word attempt)
[3]: https://opensource.com/sites/default/files/balmy.png (balmy word attempt)
[4]: https://opensource.com/sites/default/files/banal.png (banal word attempt)
