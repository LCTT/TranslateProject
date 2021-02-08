[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to take advantage of Linux's extensive vocabulary)
[#]: via: (https://www.networkworld.com/article/3539011/how-to-takke-advantage-of-linuxs-extensive-vocabulary.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to take advantage of Linux's extensive vocabulary
======
Linux systems don't only know a lot of words, it has commands that can help you use them by finding words that are on the tip of your tongue or fixing your typos.
Sandra Henry-Stocker

While you might not think of Linux as a writing tutor, it does have some commendable language skills – at least when it comes to English. While the average American probably has a vocabulary between 20,000 and 50,000 words, Linux can claim over 100,000 words (spellings, not definitions). And you can easily put this vocabulary to work for you in a number of ways. Let’s look at how Linux can help with your word challenges.

### Help with finding words

First, let’s focus on finding words.If you use the **wc** command to count the number of words in the **/usr/share/dict/words** file on your system, you should see something like this:

```
$ wc -l /usr/share/dict/words
102402 /usr/share/dict/words
```

As you can see, the **words** file on this system contains 102,402 words. So, when you’re trying to nail down just the right word and are having trouble, you stand a good chance of finding it on your system by remembering (or guessing at) some part of it. But you'll need a little help narrowing down those 102,402 words to a group worth your time to review. In this command, we’re looking for words that start with the letters “revi”.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

```
$ grep ^reviv /usr/share/dict/words
revival
revival's
revivalist
revivalist's
revivalists
revivals
revive
revived
revives
revivification
revivification's
revivified
revivifies
revivify
revivifying
reviving
```

That’s sixteen words that start with the string “revi”. The **^** character represents the beginning of the word and, as you might have suspected, each word in the file is on a line by itself.

A good number of the words in the **/usr/share/dict/words** file are names. If you want to  find words regardless of whether they're capitalized, add the **-i** (ignore case) option to your **grep** command.

```
$ grep -i ^wool /usr/share/dict/words
Woolf
Woolf's
Woolite
Woolite's
Woolongong
Woolongong's
Woolworth
Woolworth's
wool
...
```

You can also look for words that end in or contain a certain string of letters. In this next command, we look for words that contain the string “nativ” at any location.

```
$ grep 'nativ' /usr/share/dict/words
alternative
alternative's
alternatively
alternatives
imaginative
imaginatively
native
native's
natives
nativities
nativity
nativity's
nominative
nominative's
nominatives
unimaginative
```

In this next command, we look for words that end in “emblance”, the **$** character representing the end of the line. Only two words in the **words** file fit the bill.

[][2]

```
$ grep 'emblance$' /usr/share/dict/words
resemblance
semblance
```

If we, for some reason, want to find words with exactly 21 letters, we could use this command:

```
$ grep '^.....................$' /usr/share/dict/words
counterintelligence's
electroencephalograms
electroencephalograph
```

On the other hand, making sure we've typed the correct number of dots can be tedious. This next command is little easier to manage:

```
$ grep -E '^[[:alpha:]]{21}$' /usr/share/dict/words
electroencephalograms
electroencephalograph
```

This command does the same thing:

```
$ grep -E '^\w{21}$' /usr/share/dict/words
electroencephalograms
electroencephalograph
```

The one important difference between these commands is that the one with the dots matches any string of 21 characters. The two specifying "alpha" or "\w" only match letters, so they find only two matching words.

Now let’s look for words that contain 20 letters (or more) in a row.

```
$ grep -E '(\w{20})' /usr/share/dict/words
Andrianampoinimerina
Andrianampoinimerina's
counterrevolutionaries
counterrevolutionary
counterrevolutionary's
electroencephalogram
electroencephalogram's
electroencephalograms
electroencephalograph
electroencephalograph's
electroencephalographs
uncharacteristically
```

That command returns words with apostrophes because they contain 20 letters in a row before they get to that point.

Next, we’ll check out words with 21 or more characters. The 1 and 20 in combination with the **v** (invert) option in this command cause **grep** to skip over words with anywhere from 1 to 20 characters.

```
$ grep -vwE '\w{1,20}' /usr/share/dict/words
counterrevolutionaries
electroencephalograms
electroencephalograph
electroencephalographs
```

In this next command, we look for words that start with “ex” and have four additional letters.

```
$ grep '^ex.\{4\}$' /usr/share/dict/words
exacts
exalts
exam's
exceed
excels
except
excess
excise
excite
excuse
…
```

In case you're curious, the **words** file on this system contains 43 such words:

```
$ grep '^ex.\{4\}$' /usr/share/dict/words | wc -l
43
```

To get help with spelling, you should try **aspell**. It can help you with individual words or run a spell check scan through an entire text file. In this first example, we ask **aspell** to help with a single word. It finds the word we’re after along with a couple other possibilities.

### Checking a word

```
$ aspell -a
@(#) International Ispell Version 3.1.20 (but really Aspell 0.60.7)
prolifferate    <== entered word
& prolifferate 3 0: proliferate, proliferated, proliferates  <== replacement options
```

If **aspell** doesn’t provide a list of words, that means that the spelling you offered was correct. Here's an example:

```
$ aspell -a
@(#) International Ispell Version 3.1.20 (but really Aspell 0.60.7)
proliferate    <== entered text
*              <== no suggestions
```

Typing **^C** (control-c) exits **aspell**.

### Checking a file

When checking a file with **aspell**, you get suggestions for each misspelled word. When **aspell** spots typos, it highlights the misspelled words one at a time and gives you a chance to choose from a list of properly spelled words that are similar enough to the misspelled words to be good candidates for replacing them.

To start checking a file, type **aspell -c** followed by the file name.

```
$ aspell -c thesis
```

You'll see something like this:

```
This thesis focusses on …

1) focuses 6) Fosse's
2) focused 7) flosses
3) cusses  8) courses
4) fusses  9) focus
5) focus's 0) fuses
i) Ignore  I) Ignore all
r) Replace R) Replace all
a) Add     l) Add Lower
b) Abort   x) Exit
```

Make your selection by pressing the key listed next to the word you want (1, 2, etc.) and **aspell** will replace the misspelled word in the file and move on to the next one if there are others. Notice that you also have options to replace the word by typing another one. Press "x" when you're done.

### Help with crossword puzzles

If you’re working on a crossword puzzle and need to find a five-letter word that starts with a “d” and has a “u” as its fourth letter, you can use a command like this:

```
$ grep -i '^d..u.$' /usr/share/dict/words
datum
debug
debut
demur
donut
```

### Help with word scrambles

If you’re working on a puzzle that requires you to de-scramble the letters in a string until you've found a proper word, you can offer the list of letters to grep like this example in which **grep** turns the letters "yxusonlia" into the word “anxiously”.

```
$ grep -P '^(?:([yxusonlia])(?!.*?\1)){9}$' /usr/share/dict/words
anxiously
```

Linux’s word skills are impressive and sometimes even fun. Whether you're hoping to find words you can't quite call to mind or get a little help cheating on word puzzles, Linux offers some clever options.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3539011/how-to-takke-advantage-of-linuxs-extensive-vocabulary.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
