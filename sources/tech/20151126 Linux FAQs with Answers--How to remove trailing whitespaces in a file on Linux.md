Linux FAQs with Answers--How to remove trailing whitespaces in a file on Linux
================================================================================
> Question: I have a text file in which I need to remove all trailing whitespsaces (e.g., spaces and tabs) in each line for formatting purpose. Is there a quick and easy Linux command line tool I can use for this? 

When you are writing code for your program, you must understand that there are standard coding styles to follow. For example, "trailing whitespaces" are typically considered evil because when they get into a code repository for revision control, they can cause a lot of problems and confusion (e.g., "false diffs"). Many IDEs and text editors are capable of highlighting and automatically trimming trailing whitepsaces at the end of each line.

Here are a few ways to **remove trailing whitespaces in Linux command-line environment**.

### Method One ###

A simple command line approach to remove unwanted whitespaces is via sed.

The following command deletes all spaces and tabs at the end of each line in input.java.

    $ sed -i 's/[[:space:]]*$//' input.java

If there are multiple files that need trailing whitespaces removed, you can use a combination of find and sed. For example, the following command deletes trailing whitespaces in all *.java files recursively found in the current directory as well as all its sub-directories.

    $ find . -name "*.java" -type f -print0 | xargs -0 sed -i 's/[[:space:]]*$//'

### Method Two ###

Vim text editor is able to highlight and trim whitespaces in a file as well.

To highlight all trailing whitespaces in a file, open the file with Vim editor and enable text highlighting by typing the following in Vim command line mode.

    :set hlsearch

Then search for trailing whitespaces by typing:

    /\s\+$

This will show all trailing spaces and tabs found throughout the file.

![](https://c1.staticflickr.com/1/757/23198657732_bc40e757b4_b.jpg)

Then to clean up all trailing whitespaces in a file with Vim, type the following Vim command.

    :%s/\s\+$//

This command means substituting all whitespace characters found at the end of the line (\s\+$) with no character.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/remove-trailing-whitespaces-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni