[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use advanced rsync for large Linux backups)
[#]: via: (https://opensource.com/article/19/5/advanced-rsync)
[#]: author: (Alan Formy-Duval  https://opensource.com/users/alanfdoss/users/marcobravo)

How to use advanced rsync for large Linux backups
======
Basic rsync commands are usually enough to manage your Linux backups,
but a few extra options add speed and power to large backup sets.
![Filing papers and documents][1]

It seems clear that backups are always a hot topic in the Linux world. Back in 2017, David Both offered [Opensource.com][2] readers tips on "[Using rsync to back up your Linux system][3]," and earlier this year, he published a poll asking us, "[What's your primary backup strategy for the /home directory in Linux?][4]" In another poll this year, Don Watkins asked, "[Which open source backup solution do you use?][5]"

My response is [rsync][6]. I really like rsync! There are plenty of large and complex tools on the market that may be necessary for managing tape drives or storage library devices, but a simple open source command line tool may be all you need.

### Basic rsync

I managed the binary repository system for a global organization that had roughly 35,000 developers with multiple terabytes of files. I regularly moved or archived hundreds of gigabytes of data at a time. Rsync was used. This experience gave me confidence in this simple tool. (So, yes, I use it at home to back up my Linux systems.)

The basic rsync command is simple.


```
`rsync -av SRC DST`
```

Indeed, the rsync commands taught in any tutorial will work fine for most general situations. However, suppose we need to back up a very large amount of data. Something like a directory with 2,000 sub-directories, each holding anywhere from 50GB to 700GB of data. Running rsync on this directory could take a tremendous amount of time, particularly if you're using the checksum option, which I prefer.

Performance is likely to suffer if we try to sync large amounts of data or sync across slow network connections. Let me show you some methods I use to ensure good performance and reliability.

### Advanced rsync

One of the first lines that appears when rsync runs is: "sending incremental file list." If you do a search for this line, you'll see many questions asking things like: why is it taking forever? or why does it seem to hang up?

Here's an example based on this scenario. Let's say we have a directory called **/storage** that we want to back up to an external USB device mounted at **/media/WDPassport**.

If we want to back up **/storage** to a USB external drive, we could use this command:


```
`rsync -cav /storage /media/WDPassport`
```

The **c** option tells rsync to use file checksums instead of timestamps to determine changed files, and this usually takes longer. In order to break down the **/storage** directory, I sync by subdirectory, using the **find** command. Here's an example:


```
`find /storage -type d -exec rsync -cav {} /media/WDPassport \;`
```

This looks OK, but if there are any files in the **/storage** directory, they will not be copied. So, how can we sync the files in **/storage**? There is also a small nuance where certain options will cause rsync to sync the **.** directory, which is the root of the source directory; this means it will sync the subdirectories twice, and we don't want that.

Long story short, the solution I settled on is a "double-incremental" script. This allows me to break down a directory, for example, breaking **/home** into the individual users' home directories or in cases when you have multiple large directories, such as music or family photos.

Here is an example of my script:


```
HOMES="alan"
DRIVE="/media/WDPassport"

for HOME in $HOMES; do
cd /home/$HOME
rsync -cdlptgov --delete . /$DRIVE/$HOME
find . -maxdepth 1 -type d -not -name "." -exec rsync -crlptgov --delete {} /$DRIVE/$HOME \;
done
```

The first rsync command copies the files and directories that it finds in the source directory. However, it leaves the directories empty so we can iterate through them using the **find** command. This is done by passing the **d** argument, which tells rsync not to recurse the directory.


```
`-d, --dirs transfer directories without recursing`
```

The **find** command then passes each directory to rsync individually. Rsync then copies the directories' contents. This is done by passing the **r** argument, which tells rsync to recurse the directory.


```
`-r, --recursive recurse into directories`
```

This keeps the increment file that rsync uses to a manageable size.

Most rsync tutorials use the **a** (or **archive** ) argument for convenience. This is actually a compound argument.


```
`-a, --archive archive mode; equals -rlptgoD (no -H,-A,-X)`
```

The other arguments that I pass would have been included in the **a** ; those are **l** , **p** , **t** , **g** , and **o**.


```
-l, --links copy symlinks as symlinks
-p, --perms preserve permissions
-t, --times preserve modification times
-g, --group preserve group
-o, --owner preserve owner (super-user only)
```

The **\--delete** option tells rsync to remove any files on the destination that no longer exist on the source. This way, the result is an exact duplication. You can also add an exclude for the **.Trash** directories or perhaps the **.DS_Store** files created by MacOS.


```
`-not -name ".Trash*" -not -name ".DS_Store"`
```

### Be careful

One final recommendation: rsync can be a destructive command. Luckily, its thoughtful creators provided the ability to do "dry runs." If we include the **n** option, rsync will display the expected output without writing any data.


```
`rsync -cdlptgovn --delete . /$DRIVE/$HOME`
```

This script is scalable to very large storage sizes and large latency or slow link situations. I'm sure there is still room for improvement, as there always is. If you have suggestions, please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/advanced-rsync

作者：[Alan Formy-Duval ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
[2]: http://Opensource.com
[3]: https://opensource.com/article/17/1/rsync-backup-linux
[4]: https://opensource.com/poll/19/4/backup-strategy-home-directory-linux
[5]: https://opensource.com/article/19/2/linux-backup-solutions
[6]: https://en.wikipedia.org/wiki/Rsync
