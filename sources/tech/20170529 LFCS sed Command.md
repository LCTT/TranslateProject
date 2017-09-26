translating---geekpi

LFCS sed Command
=====================

Another useful command for the Linux Foundation Certified SysAdmin (LFCS) is the 'sed' Command. The initials stand for 'Streaming EDitor'.

The 'sed' Command is an editor that edits the file as a stream. To stream a file is to pass it from another command using pipes (> or |) or load it directly into 'sed'.

The command works like any other editor except that the file is not displayed and allowed to be edited visually. Commands are passed to 'sed' to manipulate the stream.

With 'sed' there are five basic things which can be done. Of course, with 'sed' being so powerful there are more advanced functions, but you only need to concentrate on the basic five. The five types of functionality are as follows:

1.  Search

2.  Replace

3.  Delete

4.  Adding

5.  Change/Transform

Before getting into the command parameters we need to look over the basic syntax.

**Syntax**

The syntax for the 'sed' command is:

 _sed [options] commands [file-to-edit]_ 

The options will be covered in this article in the appropriate sections. The commands are the search and replacement patterns which can be Regex Expressions. Read on to see how 'sed' works and learn the basic commands. As I mentioned before, 'sed' is a very powerful tool and has more options available than I will cover in the article.

**Example File**

If you open a Terminal you can create a file to be used for the 'sed' examples. Perform the following commands:

 _cd ~
grep --help >grephelp.txt_ 

You should now have a file named 'grephelp.txt' in your HOME folder. The contents of the file are the help instructions for the command 'grep'.

**Search**

Searching for specific strings is a common ability of editors and performing searches in 'sed' is no exception.

Searches can be performed to find a string in a file. Let's look at a basic search.

If we wanted to search through our example file for the word 'PATTERN' we would use the command and see the results in Figure 1:

 _sed -n 's/PATTERN/PATTERN/p' grephelp.txt_ 

**NOTE:** If you cut and paste the command make sure you replace the single quotes with that of a standard single quote on your keyboard.

![Figure 01.jpg](https://www.linux.org/attachments/figure-01-jpg.684/)

**FIGURE 1**

The parameter '-n' is used to suppress the printing of each line automatically. These lines include lines which do not include the search pattern. By using the '-n' the lines with a matching result will be displayed. Every line which is streamed into 'sed' will be printed to the standard out (stdout). If you run the above command without the '-n' option you will have a line for every line in the original file as well as a duplicate line for each match.

The file name to search is 'grephelp.txt' which we created in the 'Example File' section.

The portion left is  _'s/PATTERN/PATTERN/p'_ . There are basically four sections to this section. The first section 's' specifies to perform a substitution, or a search and replace.

The second and third part of the remaining portion are the patterns. The first is the pattern to search for and the last is the pattern to replace the matching string within the stream. In this case we are finding the string 'PATTERN' and replacing it with 'PATTERN'. By finding and replacing the same string we are not changing the file at all, even on the screen.

The last command is 'p'. The 'p' command specifies to print the new line after the substitution is made. Of course, there is no change since the substitution is the same string. Since we are suppressing printing lines with ‘-n’ parameter only the changed lines will be printed with the ‘p’ command.

The whole command allows us to perform a search and see the matching results.

**Replace**

When searching for specific strings you may want to replace the matching string with a new one. Replacing strings with another is very common.

We can perform the same search with the following command and the results are shown in Figure 2:

 _sed -n 's/PATTERN/Pattern/p' grephelp.txt_ 

![Figure 02.jpg](https://www.linux.org/attachments/figure-02-jpg.685/)

**FIGURE 2**

In this instance, the string 'PATTERN' is changed to 'Pattern' and displayed. If you view the file with the command 'cat grephelp.txt' you will see that the file has not changed. The change was made only to the output on the screen. You could pipe the output to another file with the command:

 _sed 's/PATTERN/Pattern/' grephelp.txt > grephelp1.txt_ 

A new file called 'grephelp1.txt' would now exist which held the changed file. If the 'p' was left in as the fourth option then the problem is that each line that had a string substituted would exist twice in the file. We also drop the '-n' parameter to allow all the lines to print.

Another way to replace the string with the same string is to use the ‘&’ symbol to represent the search string. For example, the command ‘s/PATTERN/&/p’ would be the same. We can add to the string, such as adding an ‘S’, with the command ‘s/PATTERN/&S/p’.

What if we wish to replace only a certain pattern in each line? It is possible to specify the specific occurrence of a match to replace. Of course, the replacement will be a specific numbered occurrence on each line. For example, there are a lot of dashes on the sample file. Some lines have at least two dashes so we can replace the second dash in each line with another character. The command to replace the second dash (-) in each line with an asterisk (*) would be:

sed 's/-/*/2' grephelp.txt

Here, we are performing a substitution with the initial ‘s’. The character ‘-’ is replaced with the ‘*’. The ‘2’ shows we are wanting to replace the second instance of the ‘-’ on each line if it exists. A sample result is shown in Figure 3\. If we left out the command ‘2’ then the first occurrence of a dash is replaced. Not every dash of a line is replaced only the first one.

![Figure 03.jpg](https://www.linux.org/attachments/figure-03-jpg.686/)

**FIGURE 3**

If you want to search and replace all dashes on a line with an asterisk, use the ‘g’ command:

 _sed 's/-/*/g' grephelp.txt_ 

Commands can also be combined. Let’s say you want to change all dashes starting at the second occurrence to the end, the command would be:

 _sed 's/-/*/2g' grephelp.txt_ 

Now every dash from the second to the last on every line is replaced with an asterisk.

**Delete**

Many times during a search you may want to remove the search string completely.

For instance, if you wanted to remove all dashes from the file you could use the command:

 _sed ‘s/-//g’ grephelp.txt_ 

The replacement string is left as a blank so the matching string is removed or deleted.

**Adding**

When a match is found you can add a line of specific text to make the line stand out for viewing or printing.

If you want the new line to be inserted after the match use the ‘a’ command followed by the string for the new line. Also include the string to match. For example, we can find a ‘--’ and add a line after the matched line. The string on the added line will be ‘double dash before this line’.

 _sed '/--/ a "double dash before this line"' grephelp.txt_ 

If you want to place the line before the line containing the matched string use the ‘i’ command as follows:

 _sed '/--/ i "double dash after this line"' grephelp.txt_ 

**Change/Transform**

If a line needs to be changed or transformed you can use the command ‘c’.

Let’s say we have a document which has some private information and we need to change any line which contains a specific string. The ‘c’ command will change the whole line and not just the search string.

Let’s say in our example file we want to block out every line which contains the word ‘PATTERN’. The changed line will read ‘This line is Top Secret’. The command is:

 _sed ‘/PATTERN/ c This line is Top Secret’ grephelp.txt_ 

A Transformation can be performed to change case of specific letters. For instance, we can change all lower-case ‘a’ to uppercase ‘A’ with the command ‘y’ as follows:

 _sed ‘y/a/A/’ grephelp.txt_ 

Multiple letters can be specified such as ‘abdg’ as in the following command:

 _sed ‘y/abdg/ABDG/’ grephelp.txt_ 

Make sure the second set of letters are in the same order as the first or they can be replaced and transformed. For example, the string ‘y/a/D/’ would replace all lower-case ‘a’ with an upper-case ‘D’.

**In-place change**

If you actually want to make changes to the file you are using, use the ‘-i’ option.

For example, to change the word ‘PATTERN’ to ‘Pattern’ and have the changes made to the file, the command would be:

sed -i 's/PATTERN/Pattern/' grephelp.txt

The file ‘grephelp.txt’ will now be changed. The ‘-i’ option can be used with any of the above commands to change the original file content.

Practice with these commands and make sure you understand them. The ‘sed’ command is very powerful.

--------------------------------------------------------------------------------

via: https://www.linux.org/threads/lfcs-sed-command.4561/

作者：[Jarret B ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.org/threads/lfcs-sed-command.4561/
