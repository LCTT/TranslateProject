translating by cvsher

14 Useful Examples of Linux ‘sort’ Command – Part 1
================================================================================
Sort is a Linux program used for printing lines of input text files and concatenation of all files in sorted order. Sort command takes blank space as field separator and entire Input file as sort key. It is important to notice that sort command don’t actually sort the files but only print the sorted output, until your redirect the output.

This article aims at deep insight of Linux ‘sort‘ command with 14 useful practical examples that will show you how to use sort command in Linux.

### 1. First we will be creating a text file (tecmint.txt) to execute ‘sort‘ command examples. Our working directory is ‘/home/$USER/Desktop/tecmint. ###

The option ‘-e‘ in the below command enables interpretion of backslash and /n tells echo to write each string to a new line.

    $ echo -e "computer\nmouse\nLAPTOP\ndata\nRedHat\nlaptop\ndebian\nlaptop" > tecmint.txt

![Split String by Lines in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Split-String-by-Lines.gif)

### 2. Before we start with ‘sort‘ lets have a look at the contents of the file and the way it look. ###

    $ cat tecmint.txt

![Check Content of File](http://www.tecmint.com/wp-content/uploads/2015/04/Check-Content-of-File.gif)

### 3. Now sort the content of the file using following command. ###

    $ sort tecmint.txt

![Sort Content of File linux](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content.gif)

**Note**: The above command don’t actually sort the contents of text file but only show the sorted output on terminal.

### 4. Sort the contents of the file ‘tecmint.txt‘ and write it to a file called (sorted.txt) and verify the content by using [cat command][1]. ###

    $ sort tecmint.txt > sorted.txt
    $ cat sorted.txt

![Sort File Content in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-File-Content.gif)

### 5. Now sort the contents of text file ‘tecmint.txt‘ in reverse order by using ‘-r‘ switch and redirect output to a file ‘reversesorted.txt‘. Also check the content listing of the newly created file. ###

    $ sort -r tecmint.txt > reversesorted.txt
    $ cat reversesorted.txt

![Sort Content By Reverse](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-By-Reverse.gif)

### 6. We are going a create a new file (lsl.txt) at the same location for detailed examples and populate it using the output of ‘ls -l‘ for your home directory. ###

    $ ls -l /home/$USER > /home/$USER/Desktop/tecmint/lsl.txt
    $ cat lsl.txt

![Populate Output of Home Directory](http://www.tecmint.com/wp-content/uploads/2015/04/Populate-Output.gif)

Now will see examples to sort the contents on the basis of other field and not the default initial characters.

### 7. Sort the contents of file ‘lsl.txt‘ on the basis of 2nd column (which represents number of symbolic links). ###

    $ sort -nk2 lsl.txt

**Note**: The ‘-n‘ option in the above example sort the contents numerically. Option ‘-n‘ must be used when we wanted to sort a file on the basis of a column which contains numerical values.

![Sort Content by Column](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-by-Column.gif)

### 8. Sort the contents of file ‘lsl.txt‘ on the basis of 9th column (which is the name of the files and folders and is non-numeric). ###

    $ sort -k9 lsl.txt

![Sort Content Based on Column](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-Based-on-Column.gif)

### 9. It is not always essential to run sort command on a file. We can pipeline it directly on the terminal with actual command. ###

    $ ls -l /home/$USER | sort -nk5

![Sort Content Using Pipe Option](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-By-Pipeline.gif)

### 10. Sort and remove duplicates from the text file tecmint.txt. Check if the duplicate has been removed or not. ###

    $ cat tecmint.txt
    $ sort -u tecmint.txt

![Sort and Remove Duplicates](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-and-Remove-Duplicates.gif)

Rules so far (what we have observed):

- Lines starting with numbers are preferred in the list and lies at the top until otherwise specified (-r).
- Lines starting with lowercase letters are preferred in the list and lies at the top until otherwise specified (-r).
- Contents are listed on the basis of occurrence of alphabets in dictionary until otherwise specified (-r).
- Sort command by default treat each line as string and then sort it depending upon dictionary occurrence of alphabets (Numeric preferred; see rule – 1) until otherwise specified.

### 11. Create a third file ‘lsla.txt‘ at the current location and populate it with the output of ‘ls -lA‘ command. ###

    $ ls -lA /home/$USER > /home/$USER/Desktop/tecmint/lsla.txt
    $ cat lsla.txt

![Populate Output With Hidden Files](http://www.tecmint.com/wp-content/uploads/2015/04/Populate-Output-With-Hidden-Files.gif)

Those having understanding of ‘ls‘ command knows that ‘ls -lA’=’ls -l‘ + Hidden files. So most of the contents on these two files would be same.

### 12. Sort the contents of two files on standard output in one go. ###

    $ sort lsl.txt lsla.txt

![Sort Contents of Two Files](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-of-Multiple-Files.gif)

Notice the repetition of files and folders.

### 13. Now we can see how to sort, merge and remove duplicates from these two files. ###

    $ sort -u lsl.txt lsla.txt

![Sort, Merge and Remove Duplicates from File](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Merge-Duplicates-Content.gif)

Notice that duplicates has been omitted from the output. Also, you can write the output to a new file by redirecting the output to a file.

### 14. We may also sort the contents of a file or the output based upon more than one column. Sort the output of ‘ls -l‘ command on the basis of field 2,5 (Numeric) and 9 (Non-Numeric). ###

    $ ls -l /home/$USER | sort -t "," -nk2,5 -k9

![Sort Content By Field Column](http://www.tecmint.com/wp-content/uploads/2015/04/Sort-Content-By-Field-Column.gif)

That’s all for now. In the next article we will cover a few more examples of ‘sort‘ command in detail for you. Till then stay tuned and connected to Tecmint. Keep sharing. Keep commenting. Like and share us and help us get spread.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/sort-command-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
