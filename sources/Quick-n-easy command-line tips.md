Quick-n-easy command-line tips
================================================================================
Most weeks I get questions from people asking for quick bits of advice. Sometimes a person is looking for a helpful guide or a specific command or a command-line short-cut to performing a specific task. Here are three tasks people have approached me with recently and some easy ways to accomplish those tasks.

The first scenario we will look at is copying all of the files in a directory tree that have been modified in the past month from their current location to another directory. The exact solution in this case may depend on whether you want to maintain the structure of the directory tree or if you are dumping all of the files from one directory tree into a specific place. If we are dumping all of our files into one folder, perhaps for archiving purposes, then we might use the find command. Using find we can search for files based on when they were last modified and then copy the files we locate to a specific place. Such a command might look like this:

    find Documents -mtime -30 -exec cp "{}" Backup \;

The above command locates files stored in the Documents folder that have been modified in the past 30 days. These files are then copied into another directory, called Backup. The find command performs the copy procedure using the copy (cp) command. We can search for files which have been modified more or less recently by changing the mtime parameter, which is set to the past 30 days in the above example.

More often, we will want to preserve the structure of the source and destination directories. Quite often people wish to synchronize the contents of one directory with another and run a script to keep the two directories in step with each other. For cases such as these we will probably want to use the rsync command. This utility copies new files, and files which have been modified, from one directory to another while maintaining the layout of the original directory:

    rsync -a Documents/ Backup

The above example makes sure the files existing in Documents also exist in the Backup directory without copying any files unnecessarily.

A common task we may wish to perform is to locate a word in a text file and replace all instances of that word with another word. As an example, imagine I have a document in which I've referred to a person as "Becky", but I've decided it would be better to use the more formal sounding "Rebecca". The following command would be useful for making this simple correction throughout the file:

    perl -pi -e 's/Becky/Rebecca/' mydocument.txt

This miniature Perl script executes a search for all instances of the text "Becky" in our document and changes the text to read "Rebecca". The text to be changed is read from (and saved back to) the mydocument.txt file.

One common concern is what to do with sensitive data on a hard drive prior to the drive being given to another person or thrown away. Some of us keep banking or tax information on our computers and it is good to be able to destroy that data before the drive is handed off to someone else. There are a few ways to do this and there are several tools available. One of my personal favourites, as it works on individual files as well as full devices, is the shred command. To overwrite the contents of a file we can run shred as follows:

    shred mytaxes.odt

The above example removes the contents of the file, but does not delete the file itself from our hard drive. To also erase the file after the data has been destroyed we can run:

    shred -u mytaxes.odt

It is important to note shred does not always work on all file systems, especially newer file systems which feature journal support. The shred manual page includes notes on which file system may not work well with the shred command. When dealing with sensitive information it may be best to erase the entire drive. The shred command can do this too. The following example removes all of our data from the first hard drive attached to the computer. Use this with extreme caution:

    shred /dev/sda


via: http://distrowatch.com/weekly.php?issue=20130923

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID