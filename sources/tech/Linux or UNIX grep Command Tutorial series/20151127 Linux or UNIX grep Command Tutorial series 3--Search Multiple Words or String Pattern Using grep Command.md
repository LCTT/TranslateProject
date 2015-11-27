Search Multiple Words / String Pattern Using grep Command
================================================================================
How do I search multiple strings or words using the grep command? For example I'd like to search word1, word2, word3 and so on within /path/to/file. How do I force grep to search multiple words?

The [grep command supports regular expression][1] pattern. To search multiple words, use following syntax:

    grep 'word1\|word2\|word3' /path/to/file

In this example, search warning, error, and critical words in a text log file called /var/log/messages, enter:

    $ grep 'warning\|error\|critical' /var/log/messages

To just match words, add -w swith:

    $ grep -w 'warning\|error\|critical' /var/log/messages

egrep command can skip the above syntax and use the following syntax:

    $ egrep -w 'warning|error|critical' /var/log/messages

I recommend that you pass the -i (ignore case) and --color option as follows:

    $ egrep -wi --color 'warning|error|critical' /var/log/messages

Sample outputs:

![Fig.01: Linux / Unix egrep Command Search Multiple Words Demo Output](http://s0.cyberciti.org/uploads/faq/2008/04/egrep-words-output.png)

Fig.01: Linux / Unix egrep Command Search Multiple Words Demo Output

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/searching-multiple-words-string-using-grep/

作者：Vivek Gite
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/faq/grep-regular-expressions/