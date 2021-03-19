[#]: subject: (Practice using the Linux grep command)
[#]: via: (https://opensource.com/article/21/3/grep-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Practice using the Linux grep command
======
Learn the basics on searching for info in your files, then download our
cheat sheet for a quick reference guide to grep and regex.
![Hand putting a Linux file folder into a drawer][1]

One of the classic Unix commands, developed way back in 1974 by Ken Thompson, is the Global Regular Expression Print (grep) command. It's so ubiquitous in computing that it's frequently used as a verb ("grepping through a file") and, depending on how geeky your audience, it fits nicely into real-world scenarios, too. (For example, "I'll have to grep my memory banks to recall that information.") In short, grep is a way to search through a file for a specific pattern of characters. If that sounds like the modern Find function available in any word processor or text editor, then you've already experienced grep's effects on the computing industry.

Far from just being a quaint old command that's been supplanted by modern technology, grep's true power lies in two aspects:

  * Grep works in the terminal and operates on streams of data, so you can incorporate it into complex processes. You can not only _find_ a word in a text file; you can extract the word, send it to another command, and so on.
  * Grep uses regular expression to provide a flexible search capability.



Learning the `grep` command is easy, although it does take some practice. This article introduces you to some of its features I find most useful.

**[Download our free [grep cheat sheet][2]]**

### Installing grep

If you're using Linux, you already have grep installed.

On macOS, you have the BSD version of grep. This differs slightly from the GNU version, so if you want to follow along exactly with this article, then install GNU grep from a project like [Homebrew][3] or [MacPorts][4].

### Basic grep

The basic grep syntax is always the same. You provide the `grep` command a pattern and a file you want it to search. In return, it prints each line to your terminal with a match.


```
$ grep gnu gpl-3.0.txt
    along with this program.  If not, see &lt;[http://www.gnu.org/licenses/\&gt;][5].
&lt;[http://www.gnu.org/licenses/\&gt;][5].
&lt;[http://www.gnu.org/philosophy/why-not-lgpl.html\&gt;][6].
```

By default, the `grep` command is case-sensitive, so "gnu" is different from "GNU" or "Gnu." You can make it ignore capitalization with the `--ignore-case` option.


```
$ grep --ignore-case gnu gpl-3.0.txt
                    GNU GENERAL PUBLIC LICENSE
  The GNU General Public License is a free, copyleft license for
the GNU General Public License is intended to guarantee your freedom to
GNU General Public License for most of our software; it applies also to
[...16 more results...]
&lt;[http://www.gnu.org/licenses/\&gt;][5].
&lt;[http://www.gnu.org/philosophy/why-not-lgpl.html\&gt;][6].
```

You can also make the `grep` command return all lines _without_ a match by using the `--invert-match` option:


```
$ grep --invert-match \
\--ignore-case gnu gpl-3.0.txt
                      Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. &lt;[http://fsf.org/\&gt;][7]
[...648 lines...]
Public License instead of this License.  But first, please read
```

### Pipes

It's useful to be able to find text in a file, but the true power of [POSIX][8] is its ability to chain commands together through "pipes." I find that my best use of grep is when it's combined with other tools, like cut, tr, or [curl][9].

For instance, assume I have a file that lists some technical papers I want to download. I could open the file and manually click on each link, and then click through Firefox options to save each file to my hard drive, but that's a lot of time and clicking. Instead, I could grep for the links in the file, printing _only_ the matching string by using the `--only-matching` option:


```
$ grep --only-matching http\:\/\/.*pdf example.html
<http://example.com/linux\_whitepaper.pdf>
<http://example.com/bsd\_whitepaper.pdf>
<http://example.com/important\_security\_topic.pdf>
```

The output is a list of URLs, each on one line. This is a natural fit for how Bash processes data, so instead of having the URLs printed to my terminal, I can just pipe them into `curl`:


```
$ grep --only-matching http\:\/\/.*pdf \
example.html | curl --remote-name
```

This downloads each file, saving it according to its remote filename onto my hard drive.

My search pattern in this example may seem cryptic. That's because it uses regular expression, a kind of "wildcard" language that's particularly useful when searching broadly through lots of text.

### Regular expression

Nobody is under the illusion that regular expression ("regex" for short) is easy. However, I find it often has a worse reputation than it deserves. Admittedly, there's the potential for people to get a little _too clever_ with regex until it's so unreadable and so broad that it folds in on itself, but you don't have to overdo your regex. Here's a brief introduction to regex the way I use it.

First, create a file called `example.txt` and enter this text into it:


```
Albania
Algeria
Canada
0
1
3
11
```

The most basic element of regex is the humble `.` character. It represents a single character.


```
$ grep Can.da example.txt
Canada
```

The pattern `Can.da` successfully returned `Canada` because the `.` character represented any _one_ character.

The `.` wildcard can be modified to represent more than one character with these notations:

  * `?` matches the preceding item zero or one time
  * `*` matches the preceding item zero or more times
  * `+` matches the preceding item one or more times
  * `{4}` matches the preceding item up to four (or any number you enter in the braces) times



Armed with this knowledge, you can practice regex on `example.txt` all afternoon, seeing what interesting combinations you come up with. Some won't work; others will. The important thing is to analyze the results, so you understand why.

For instance, this fails to return any country:


```
`$ grep A.a example.txt`
```

It fails because the `.` character can only ever match a single character unless you level it up. Using the `*` character, you can tell `grep` to match a single character zero or as many times as necessary until it reaches the end of the word. Because you know the list you're dealing with, you know that _zero times_ is useless in this instance. There are definitely no three-letter country names in this list. So instead, you can use `+` to match a single character at least once and then again as many times as necessary until the end of the word:


```
$ grep A.+a example.txt
Albania
Algeria
```

You can use square brackets to provide a list of letters:


```
$ grep [A,C].+a example.txt
Albania
Algeria
Canada
```

This works for numbers, too. The results may surprise you:


```
$ grep [1-9] example.txt
1
3
11
```

Are you surprised to see 11 in a search for digits 1 to 9?

What happens if you add 13 to your list?

These numbers are returned because they include 1, which is among the list of digits to match.

As you can see, regex is something of a puzzle, but through experimentation and practice, you can get comfortable with it and use it to improve the way you grep through your data.

### Download the cheatsheet

The `grep` command has far more options than I demonstrated in this article. There are options to better format results, list files and line numbers containing matches, provide context for results by printing the lines surrounding a match, and much more. If you're learning grep, or you just find yourself using it often and resorting to searching through its `info` pages, you'll do yourself a favor by downloading our cheat sheet for it. The cheat sheet uses short options (`-v` instead of `--invert-matching`, for instance) as a way to get you familiar with common grep shorthand. It also contains a regex section to help you remember the most common regex codes. [Download the grep cheat sheet today!][2]

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/grep-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/downloads/grep-cheat-sheet
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://opensource.com/article/20/11/macports
[5]: http://www.gnu.org/licenses/\>
[6]: http://www.gnu.org/philosophy/why-not-lgpl.html\>
[7]: http://fsf.org/\>
[8]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[9]: https://opensource.com/downloads/curl-command-cheat-sheet
