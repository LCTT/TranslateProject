[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Merging and sorting files on Linux)
[#]: via: (https://www.networkworld.com/article/3570508/merging-and-sorting-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Merging and sorting files on Linux
======

Metamorworks / Getty Images

There are a number of ways to merge and sort text files on Linux, but how to go about it depends on what you're trying to accomplish – whether you simply want to put the content of multiple files into one big file, or organize it in some way that makes it easier to use. In this post, we'll look at some commands for sorting and merging file contents and focus on how the results differ.

### Using cat

If all you want to do is pull a group of files together into a single file, the **cat** command is an easy choice. All you have to do is type "cat" and then list the files on the command line in the order in which you want them included in the merged file. Redirect the output of the command to the file you want to create. If a file with the specified name already exists, it will be overwritten by the one you are creating. For example:

```
$ cat firstfile secondfile thirdfile > newfile
```

**Read more:** [World's 10 fastest supercomputers][1]

If you want to add the content of a series of files to an existing file rather than overwrite it, just change the **&gt;** to **&gt;&gt;**.

```
$ cat firstfile secondfile thirdfile >> updated_file
```

If the files you are merging follow some convenient naming convention, the task can be even simpler. You won't have to include all of the file names if you can specify them using a regular expression. For example, if the files all end with the word "file" as in the example above, you could do something like this:

```
$ cat *file > allfiles
```

Note that the command shown above will add file contents in alphanumeric order. On Linux, a file named "filea" would be added before one named "fileA", but after one named "file7". After all, we don't just have to think "ABCDE" when we're dealing with an alphanumeric sequence; we have to think "0123456789aAbBcCdDeE". You can always use a command like "ls *file" to view the order in which the files will be added before merging the files.

**NOTE:** It's a good idea to first make sure that your command includes all of the files that you want in the merged file and no others – especially when you're using a wild card like “*”. And don't forget that the merged files will still exist as separate files, which you might want to delete once the merge has been verified.

### Merging files by age

If you want to merge your files based on the age of each file rather than by file names, use a command like this one:

```
$ for file in `ls -tr myfile.*`; do  cat $file >> BigFile.$$; done
```

Using the **-tr** options (**t**=time, **r**=reverse) will result in a list of files in oldest-first age order. This can be useful, for example, if you're keeping a log of certain activities and want the content added in the order in which the activities were performed.

The **$$** in the command above represents the process ID for the command when you run it. It's completely unnecessary to use this, but it makes it nearly impossible that you will inadvertently add onto the end of an existing file instead of creating a new one. If you use $$, the resultant file might look like this:

```
$ ls -l BigFile.*
-rw-rw-r-- 1 justme justme   931725 Aug  6 12:36 BigFile.582914
```

### Merging and sorting files

Linux provides some interesting ways to sort file content before or after the merge.

#### Sorting content alphabetically

If you want the merged file content to be sorted, you can sort the overall content with a command like this:

```
$ cat myfile.1 myfile.2 myfile.3 | sort > newfile
```

If you want to keep the content grouped by file, sort each file before adding it to the new file with a command like this:

```
$ for file in `ls myfile.?`; do sort $file >> newfile; done
```

#### Sorting files numerically

To sort file contents numerically, use the **-n** option with sort. This option is useful only if the lines in your files start with numbers. Keep in mind that, in the default order, “02” would be considered smaller than "1". Use the **-n** option when you want to ensure that lines are sorted in numeric order.

```
$ cat myfile.1 myfile.2 myfile.3 | sort -n > xyz
```

The **-n** option also allows you to sort file contents by date if the lines in the files start with dates in a format like "2020-11-03" or "2020/11/03" (year, month, day format). Sorting by dates in other formats will be tricky and will require far more complex commands.

### Using paste

The **paste** command allows you to join the contents of files on a line-by-line basis. When you use this command, the first line of the merged file will contain the first line of each of the files being merged. Here's an example in which I've used capital letters to make it easy to see where the lines came from:

```
$ cat file.a
A one
A two
A three

$ paste file.a file.b file.c
A one   B one   C one
A two   B two   C two
A three B three C thee
        B four  C four
                C five
```

Redirect the output to another file to  save it:

```
$ paste file.a file.b file.c > merged_content
```

Alternately, you can paste files together such that the content of each file is joined in a single line. This requires use of the **-s** (sequential) option. Notice how the output this time shows each file's content:

```
$ paste -s file.a file.b file.c
A one   A two   A three
B one   B two   B three B four
C one   C two   C thee  C four  C five
```

### Using join

Another command for merging files is **join**. The **join** command allows you to merge the content of multiple files based on a common field. For example, you might have one file that contains phone numbers for a group of coworkers and another that contains their personal email addresses and they’re both listed by the individuals' names. You can use join to create a file with both phone numbers and email addresses.

One important restriction is that the files must have their lines listed in the same order and include the join field in each file.

Here's an example command:

```
$ join phone_numbers email_addresses
Sandra 555-456-1234 bugfarm@gmail.com
Pedro 555-540-5405
John 555-333-1234 john_doe@gmail.com
Nemo 555-123-4567 cutie@fish.com
```

In this example, the first field (first names) must exist in each file even if the additional information is missing or the command will fail with an error. Sorting the contents is helpful and probably a lot easier to manage, but is not required as long as the order is consistent.

### Wrap-Up

You have a lot of options on Linux for merging and sorting data stored in separate files. The choices can make some otherwise tedious tasks surprisingly easy.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3570508/merging-and-sorting-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3563766/the-10-fastest-supercomputers-are-led-by-one-28x-faster-than-the-rest.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
