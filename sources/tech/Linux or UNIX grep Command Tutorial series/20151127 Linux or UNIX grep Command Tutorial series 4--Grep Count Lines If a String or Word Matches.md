(translating by runningwater)
Grep Count Lines If a String / Word Matches
================================================================================
How do I count lines if given word or string matches for each input file under Linux or UNIX operating systems?

You need to pass the -c or --count option to suppress normal output. It will display a count of matching lines for each input file:

    $ grep -c vivek /etc/passwd

OR

    $ grep -w -c vivek /etc/passwd

Sample outputs:

    1

However, with the -v or --invert-match option it will count non-matching lines, enter:

    $ grep -c vivek /etc/passwd

Sample outputs:

    45

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/grep-count-lines-if-a-string-word-matches/

作者：Vivek Gite
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出