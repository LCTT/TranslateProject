translation by strugglingyouth
Handy commands for profiling your Unix file systems
================================================================================
![Credit: Sandra H-S](http://images.techhive.com/images/article/2015/07/file-profile-100597239-primary.idge.png)
Credit: Sandra H-S

One of the problems that seems to plague nearly all file systems -- Unix and others -- is the continuous buildup of files. Almost no one takes the time to clean out files that they no longer use and file systems, as a result, become so cluttered with material of little or questionable value that keeping them them running well, adequately backed up, and easy to manage is a constant challenge.

One way that I have seen to help encourage the owners of all that data detritus to address the problem is to create a summary report or "profile" of a file collection that reports on such things as the number of files; the oldest, newest, and largest of those files; and a count of who owns those files. If someone realizes that a collection of half a million files contains none less than five years old, they might go ahead and remove them -- or, at least, archive and compress them. The basic problem is that huge collections of files are overwhelming and most people are afraid that they might accidentally delete something important. Having a way to characterize a file collection can help demonstrate the nature of the content and encourage those digital packrats to clean out their nests.

When I prepare a file system summary report on Unix, a handful of Unix commands easily provide some very useful statistics. To count the files in a directory, you can use a find command like this.

    $ find . -type f | wc -l
    187534

Finding the oldest and newest files is a bit more complicated, but still quite easy. In the commands below, we're using the find command again to find files, displaying the data with a year-month-day format that makes it possible to sort by file age, and then displaying the top -- thus the oldest -- file in that list.

In the second command, we do the same, but print the last line -- thus the newest -- file.

    $ find -type f -printf '%T+ %p\n' | sort | head -n 1
    2006-02-03+02:40:33 ./skel/.xemacs/init.el
    $ find -type f -printf '%T+ %p\n' | sort | tail -n 1
    2015-07-19+14:20:16 ./.bash_history

The %T (file date and time) and %p (file name with path) parameters with the printf command allow this to work.

If we're looking at home directories, we're undoubtedly going to find that history files are the newest files and that isn't likely to be a very interesting bit of information. You can omit those files by "un-grepping" them or you can omit all files that start with dots as shown below.

    $ find -type f -printf '%T+ %p\n' | grep -v "\./\." | sort | tail -n 1
    2015-07-19+13:02:12 ./isPrime

Finding the largest file involves using the %s (size) parameter and we include the file name (%f) since that's what we want the report to show.

    $ find -type f -printf '%s %f \n' | sort -n | uniq | tail -1
    20183040 project.org.tar

To summarize file ownership, use the %u (owner)

    $ find -type f -printf '%u \n' | grep -v "\./\." | sort | uniq -c
       180034 shs
         7500 jdoe

If your file system also records the last access date, it can be very useful to show that files haven't been accessed in, say, more than two years. This would give your reviewers an important insight into the value of those files. The last access parameter (%a) could be used like this:

    $ find -type f -printf '%a+ %p\n' | sort | head -n 1
    Fri Dec 15 03:00:30 2006+ ./statreport

Of course, if the most recently accessed file is also in the deep dark past, that's likely to get even more of a reaction.

    $ find -type f -printf '%a+ %p\n' | sort | tail -n 1
    Wed Nov 26 03:00:27 2007+ ./my-notes

Getting a sense of what's in a file system or large directory by creating a summary report showing the file date ranges, the largest files, the file owners, and the oldest and new access times can help to demonstrate how current and how important a file collection is and help its owners decide if it's time to clean up.

--------------------------------------------------------------------------------

via: http://www.itworld.com/article/2949898/linux/profiling-your-file-systems.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.itworld.com/author/Sandra-Henry_Stocker/
