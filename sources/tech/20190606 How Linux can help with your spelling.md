[#]: collector: (lujun9972)
[#]: translator: (Modrisco)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Linux can help with your spelling)
[#]: via: (https://www.networkworld.com/article/3400942/how-linux-can-help-with-your-spelling.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How Linux can help with your spelling
======
Whether you're struggling with one elusive word or checking a report before you send it off to your boss, Linux can help with your spelling.
![Sandra Henry-Stocker][1]

Linux provides all sorts of tools for data analysis and automation, but it also helps with an issue that we all struggle with from time to time – spelling! Whether you're grappling with the spelling of a single word while you’re writing your weekly report or you want a set of computerized "eyes" to find your typos before you submit a business proposal, maybe it’s time to check out how it can help.

### look

One tool is **look**. If you know how a word begins, you can ask the look command for provide a list of words that start with those letters. Unless an alternate word source is provided, look uses **/usr/share/dict/words** to identify the words for you. This file with its hundreds of thousands of words will suffice for most of the English words that we routinely use, but it might not have some of the more obscure words that some of us in the computing field tend to use — such as zettabyte.

**[ Two-Minute Linux Tips:[Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

The look command's syntax is as easy as can be. Type "look word" and it will run through all the words in that words file and find matches for you.

```
$ look amelio
ameliorable
ameliorableness
ameliorant
ameliorate
ameliorated
ameliorates
ameliorating
amelioration
ameliorations
ameliorativ
ameliorative
amelioratively
ameliorator
amelioratory
```

If you happen upon a word that isn't included in the word list on the system, you'll simply get no output.

```
$ look zetta
$
```

Don’t despair if you're not seeing what you were hoping for. You can add words to your words file or even reference an altogether different words list — either finding one online and creating one yourself. You don't even have to place an added word in the proper alphabetical location; just add it to the end of the file. You do need to do this as root, however. For example (and be careful with that **> >**!):

```
# echo “zettabyte” >> /usr/share/dict/words
```

Using a different list of words ("jargon" in this case) just requires adding the name of the file. Use a full path if the file is not the default.

```
$ look nybble /usr/share/dict/jargon
nybble
nybbles
```

The look command is also case-insensitive, so you don't have to concern yourself with whether the word you're looking for should be capitalized or not.

```
$ look zet
ZETA
Zeta
zeta
zetacism
Zetana
zetas
Zetes
zetetic
Zethar
Zethus
Zetland
Zetta
```

Of course, not all word lists are created equal. Some Linux distributions provide a _lot_ more words than others in their word files. Yours might have 100,000 words or many times that number.

On one of my Linux systems:

```
$ wc -l /usr/share/dict/words
102402 /usr/share/dict/words
```

On another:

```
$ wc -l /usr/share/dict/words
479828 /usr/share/dict/words
```

Remember that the look command works only with the beginnings of words, but there are other options if you don't want to start there.

### grep

Our dearly beloved **grep** command can pluck words from a word file as well as any tool. If you’re looking for words that start or end with particular letters, grep is a natural. It can match words using beginnings, endings, or middle portions of words. Your system's word file will work with grep as easily as it does with look. The only drawback is that unlike with look, you have to specify the file.

Using word beginnings with ^:

```
$ grep ^terra /usr/share/dict/words
terrace
terrace's
terraced
terraces
terracing
terrain
terrain's
terrains
terrapin
terrapin's
terrapins
terraria
terrarium
terrarium's
terrariums
```

Using word endings with $:

```
$ grep bytes$ /usr/share/dict/words
bytes
gigabytes
kilobytes
megabytes
terabytes
```

With grep, you do need to concern yourself with capitalization, but the command provides some options for that.

```
$ grep ^[Zz]et /usr/share/dict/words
Zeta
zeta
zetacism
Zetana
zetas
Zetes
zetetic
Zethar
Zethus
Zetland
Zetta
zettabyte
```

Setting up a symbolic link to the words file makes this kind of word search a little easier:

```
$ ln -s /usr/share/dict/words words
$ grep ^[Zz]et words
Zeta
zeta
zetacism
Zetana
zetas
Zetes
zetetic
Zethar
Zethus
Zetland
Zetta
zettabytye
```

### aspell

The aspell command takes a different approach. It provides a way to check the spelling in whatever file or text you provide to it. You can pipe text to it and have it tell you which words appear to be misspelled. If you’re spelling all the words correctly, you’ll see no output.

```
$ echo Did I mispell that? | aspell list
mispell
$ echo I can hardly wait to try out aspell | aspell list
aspell
$ echo Did I misspell anything? | aspell list
$
```

The "list" argument tells aspell to provide a list of misspelled words in the words that are sent through standard input.

You can also use aspell to locate and correct words in a text file. If it finds a misspelled word, it will offer you an opportunity to replace it from a list of similar (but correctly spelled) words, to accept the words and add them to your personal words list (~/.aspell.en.pws), to ignore the misspelling, or to abort the process altogether (leaving the file as it was before you started).

```
$ aspell -c mytext
```

Once aspell finds a word that’s misspelled, it offers a list of choices like these for the incorrect "mispell":

```
1) mi spell                             6) misplay
2) mi-spell                             7) spell
3) misspell                             8) misapply
4) Ispell                               9) Aspell
5) misspells                            0) dispel
i) Ignore                               I) Ignore all
r) Replace                              R) Replace all
a) Add                                  l) Add Lower
b) Abort                                x) Exit
```

Note that the alternate words and spellings are numbered, while other options are represented by letter choices. You can choose one of the suggested spellings or opt to type a replacement. The "Abort" choice will leave the file intact even if you've already chosen replacements for some words. Words you elect to add will be inserted into a local file (e.g., ~/.aspell.en.pws).

### Alternate word lists

Tired of English? The aspell command can work with other languages if you add a word file for them. To add a dictionary for French on Debian systems, for example, you could do this:

```
$ sudo apt install aspell-fr
```

This new dictionary file would be installed as /usr/share/dict/French. To use it, you would simply need to tell aspell that you want to use the alternate word list:

```
$ aspell --lang=fr -c mytext
```

When using, you might see something like this if aspell looks at the word “one”:

```
1) once                                 6) orné
2) onde                                 7) ne
3) ondé                                 8) né
4) onze                                 9) on
5) orne                                 0) cône
i) Ignore                               I) Ignore all
r) Replace                              R) Replace all
a) Add                                  l) Add Lower
b) Abort                                x) Exit
```

You can also get other language word lists from [GNU][3].

### Wrap-up

Even if you're a national spelling bee winner, you probably need a little help with spelling every now and then — if only to spot your typos. The aspell tool, along with look and grep, are ready to come to your rescue.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3400942/how-linux-can-help-with-your-spelling.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[Modrisco](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/06/linux-spelling-100798596-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: ftp://ftp.gnu.org/gnu/aspell/dict/0index.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
