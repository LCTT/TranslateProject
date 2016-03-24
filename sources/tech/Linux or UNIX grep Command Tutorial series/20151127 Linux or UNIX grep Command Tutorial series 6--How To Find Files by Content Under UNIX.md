How To Find Files by Content Under UNIX
================================================================================
I had written lots of code in C for my school work and saved it as source code under /home/user/c/*.c and *.h. How do I find files by content such as string or words (function name such as main() under UNIX shell prompt?

You need to use the following tools:

[a] **grep command** : print lines matching a pattern.

[b] **find command**: search for files in a directory hierarchy.

### [grep Command To Find Files By][1] Content ###

Type the command as follows:

    grep 'string' *.txt
    grep 'main(' *.c
    grep '#include<example.h>' *.c
    grep 'getChar*' *.c
    grep -i 'ultra' *.conf
    grep -iR 'ultra' *.conf

Where

- **-i** : Ignore case distinctions in both the PATTERN (match valid, VALID, ValID string) and the input files (math file.c FILE.c FILE.C filename).
- **-R** : Read all files under each directory, recursively

### Highlighting searched patterns ###

You can highlight patterns easily while searching large number of files:

    $ grep --color=auto -iR 'getChar();' *.c

### Displaying file names and line number for searched patterns ###

You may also need to display filenames and numbers:

    $ grep --color=auto -iRnH 'getChar();' *.c

Where,

- **-n** : Prefix each line of output with the 1-based line number within its input file.
- **-H** Print the file name for each match. This is the default when there is more than one file to search.

    $grep --color=auto -nH 'DIR' *

Sample output:

![Fig.01: grep command displaying searched pattern](http://www.cyberciti.biz/faq/wp-content/uploads/2008/09/grep-command.png)

Fig.01: grep command displaying searched pattern

You can also use find command:

    $ find . -name "*.c" -print | xargs grep "main("

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/unix-linux-finding-files-by-content/

作者：Vivek Gite
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/faq/howto-search-find-file-for-text-string/