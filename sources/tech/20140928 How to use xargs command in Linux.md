zpl1025
How to use xargs command in Linux
================================================================================
Have you ever been in the situation where you are running the same command over and over again for multiple files? If so, you know how tedious and inefficient this can feel. The good news is that there is an easier way, made possible through the xargs command in Unix-based operating systems. With this command you can process multiple files efficiently, saving you time and energy. In this tutorial, you will learn how to execute a command or script for multiple files at once, avoiding the daunting task of processing numerous log files or data files individually.

There are two ingredients for the xargs command. First, you must specify the files of interest. Second, you must indicate which command or script will be executed for each of the files you specified.

This tutorial will cover three scenarios in which the xargs command can be used to process files located within several different directories:

1. Count the number of lines in all files
1. Print the first line of specific files
1. Process each file using a custom script

Consider the following directory named xargstest (the directory tree can be displayed using the tree command with the combined -i and -f options, which print the results without indentation and with the full path prefix for each file):

    $ tree -if xargstest/ 

![](https://farm3.staticflickr.com/2942/15334985981_ce1a192def.jpg)

The contents of each of the six files are as follows:

![](https://farm4.staticflickr.com/3882/15346287662_a3084a8e4f_o.png)

The **xargstest** directory, its subdirectories and files will be used in the following examples.

### Scenario 1: Count the number of lines in all files ###

As mentioned earlier, the first ingredient for the xargs command is a list of files for which the command or script will be run. We can use the find command to identify and list the files that we are interested in. The **-name 'file??'** option specifies that only files with names beginning with "file" followed by any two characters will be matched within the xargstest directory. This search is recursive by default, which means that the find command will search for matching files within xargstest and all of its sub-directories.

    $ find xargstest/ -name 'file??' 

----------

    xargstest/dir3/file3B
    xargstest/dir3/file3A
    xargstest/dir1/file1A
    xargstest/dir1/file1B
    xargstest/dir2/file2B
    xargstest/dir2/file2A

We can pipe the results to the sort command to order the filenames sequentially:

    $ find xargstest/ -name 'file??' | sort 

----------

    xargstest/dir1/file1A
    xargstest/dir1/file1B
    xargstest/dir2/file2A
    xargstest/dir2/file2B
    xargstest/dir3/file3A
    xargstest/dir3/file3B

We now need the second ingredient, which is the command to execute. We use the wc command with the -l option to count the number of newlines in each file (printed at the beginning of each output line):

    $ find xargstest/ -name 'file??' | sort | xargs wc -l 

----------

     1 xargstest/dir1/file1A
     2 xargstest/dir1/file1B
     3 xargstest/dir2/file2A
     4 xargstest/dir2/file2B
     5 xargstest/dir3/file3A
     6 xargstest/dir3/file3B
    21 total

You'll see that instead of manually running the wc -l command for each of these files, the xargs command allows you to complete this operation in a single step. Tasks that may have previously seemed unmanageable, such as processing hundreds of files individually, can now be performed quite easily.

### Scenario 2: Print the first line of specific files ###

Now that you know the basics of how to use the xargs command, you have the freedom to choose which command you want to execute. Sometimes, you may want to run commands for only a subset of files and ignore others. In this case, you can use the find command with the -name option and the ? globbing character (matches any single character) to select specific files to pipe into the xargs command. For example, if you want to print the first line of all files that end with a "B" character and ignore the files that end with an "A" character, use the following combination of the find, xargs, and head commands (head -n1 will print the first line in a file):

    $ find xargstest/ -name 'file?B' | sort | xargs head -n1 

----------

    ==> xargstest/dir1/file1B <==
    one
    
    ==> xargstest/dir2/file2B <==
    one
    
    ==> xargstest/dir3/file3B <==
    one

You'll see that only the files with names that end with a "B" character were processed, and all files that end with an "A" character were ignored.

### Scenario 3: Process each file using a custom script ###

Finally, you may want to run a custom script (in Bash, Python, or Perl for example) for the files. To do this, simply substitute the name of your custom script in place of the wc and head commands shown previously:

    $ find xargstest/ -name 'file??' | xargs myscript.sh 

The custom script **myscript.sh** needs to be written to take a file name as an argument and process the file. The above command will then invoke the script for every file found by find command.

Note that the above examples include file names that do not contain spaces. Generally speaking, life in a Linux environment is much more pleasant when using file names without spaces. If you do need to handle file names with spaces, the above commands will not work, and should be tweaked to accommodate them. This is accomplished with the -print0 option for find command (which prints the full file name to stdout, followed by a null character), and -0 option for xargs command (which interprets a null character as the end of a string), as shown below:

    $ find xargstest/ -name 'file*' -print0 | xargs -0 myscript.sh 

Note that the argument for the -name option has been changed to 'file*', which means any files with names beginning with "file" and trailed by any number of characters will be matched.

### Summary ###

After reading this tutorial you will understand the capabilities of the xargs command and how you can implement this into your workflow. Soon you'll be spending more time enjoying the efficiency offered by this command, and less time doing repetitive tasks. For more details and additional options you can read the xargs documentation by entering the 'man xargs' command in your terminal.

--------------------------------------------------------------------------------

via: http://xmodulo.com/xargs-command-linux.html

作者：[Joshua Reed][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/joshua
