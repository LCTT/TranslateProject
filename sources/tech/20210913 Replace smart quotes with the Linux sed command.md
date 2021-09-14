[#]: subject: "Replace smart quotes with the Linux sed command"
[#]: via: "https://opensource.com/article/21/9/sed-replace-smart-quotes"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Replace smart quotes with the Linux sed command
======
Banish "smart" quotes with your favorite version of sed.
![Coding on a computer][1]

In typography, a pair of quotation marks were traditionally oriented toward one another. They look like this:

“smart quotes”

As computers became popular in the mid-twentieth century, the orientation was often abandoned. The original character set of computers didn't have much room to spare, so it makes sense that two double-quotes and two single-quotes were reduced down to just one of each in the ASCII specification. These days the common character set is Unicode, with plenty of space for lots of fancy quotation marks and apostrophes, but many people have become used to the minimalism of just one character for both opening and closing quotes. Besides that, computers actually see the different kinds of quotation marks and apostrophes as distinct characters. In other words, to a copmuter the right double quote is different from the left double quote or a straight quote.

### Replacing smart quotes with sed

Computers aren't typewriters. When you press a key on your keyboard, you're not pressing a lever with an inkstamp attached to it. You're just pressing a button that sends a signal to your computer, which the computer interprets as a request to display a specific predefined character. The request depends on your keyboard map. As a Dvorak typist, I've witnessed the confusion on people's faces when they discover "asdf" on my keyboard produces "aoeu" on the screen. You may also have pressed special combinations of keys to produce characters, such as ™ or ß or ≠, that's not even printed on your keyboard.

Each letter or character, whether it's printed on your keyboard or not, has a code. Character encoding can be expressed in different ways, but to a computer the Unicode sequences u2018 and u2019 produce **‘** and **’**, while the codes u201c and u201d produce the **“** and **”** characters. Knowing these "secret" codes means you can replace them programmatically using a command like [sed][2]. Any version of sed will do, so you can use GNU sed or BSD sed or even [Busybox][3] sed.

Here's the simple shell script I use:


```
#!/bin/sh
# GNU All-Permissive License

SDQUO=$(echo -ne '\u2018\u2019')
RDQUO=$(echo -ne '\u201C\u201D')
$SED -i -e "s/[$SDQUO]/\'/g" -e "s/[$RDQUO]/\"/g" "${1}"
```

Save this script as `fixquotes.sh` and then create a separate test file containing smart quotes:


```
‘Single quote’
“Double quote”
```

Run the script, and then use the [cat][4] command to see the results:


```
$ sh ./fixquotes.sh test.txt
$ cat test.txt
'Single quote'
"Double quote"
```

### Install sed

If you’re using Linux, BSD, or macOS, then you already have GNU or BSD `sed` installed. These are two unique reimplementations of the original `sed` command, and for the script in this article they are functionally the same (that's not true for all scripts, though).

On Windows, you can [install GNU sed][5] with [Chocolatey][6].

Vim offers great benefits to writers, regardless of whether they are technically minded or not.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/sed-replace-smart-quotes

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://opensource.com/article/20/12/sed
[3]: https://opensource.com/article/21/8/what-busybox
[4]: https://opensource.com/article/19/2/getting-started-cat-command
[5]: https://chocolatey.org/packages/sed
[6]: https://opensource.com/article/20/3/chocolatey
