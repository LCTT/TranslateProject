[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to rename a group of files on Linux)
[#]: via: (https://www.networkworld.com/article/3433865/how-to-rename-a-group-of-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to rename a group of files on Linux
======
To rename a group of files with a single command, use the rename command. It requires the use of regular expressions and can tell you what changes will be made before making them.
![Manchester City Library \(CC BY-SA 2.0\)][1]

For decades, Linux users have been renaming files with the **mv** command. It’s easy, and the command does just what you expect. Yet sometimes you need to rename a large group of files. When that is the case, the **rename** command can make the task a lot easier. It just requires a little finesse with regular expressions.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

Unlike the **mv** command, **rename** isn’t going to allow you to simply specify the old and new names. Instead, it uses a regular expression like those you'd use with Perl. In the example below, the "s" specifies that we're substituting the second string (old) for the first, thus changing **this.new** to **this.old**.

```
$ rename 's/new/old/' this.new
$ ls this*
this.old
```

A change as simple as that would be easier using **mv this.new this.old**, but change the literal string “this” to the wild card “*” and you would rename all of your *.new files to *.old files with a single command:

```
$ ls *.new
report.new  schedule.new  stats.new  this.new
$ rename 's/new/old/' *.new
$ ls *.old
report.old  schedule.old  stats.old  this.old
```

As you might expect, the **rename** command isn’t restricted to changing file extensions. If you needed to change files named “report.*” to “review.*”, you could manage that with a command like this:

```
$ rename 's/report/review/' *
```

The strings supplied in the regular expressions can make changes to any portion of a file name — whether file names or extensions.

```
$ rename 's/123/124/' *
$ ls *124*
status.124  report124.txt
```

If you add the **-v** option to a **rename** command, the command will provide some feedback so that you can see the changes you made, maybe including any you didn’t intend — making it easier to notice and revert changes as needed.

```
$ rename -v 's/123/124/' *
status.123 renamed as status.124
report123.txt renamed as report124.txt
```

On the other hand, using the **-n** (or **\--nono**) option makes the **rename** command tell you the changes that it would make without actually making them. This can save you from making changes you may not be intending to make and then having to revert those changes.

```
$ rename -n 's/old/save/' *
rename(logger.man-old, logger.man-save)
rename(lyrics.txt-old, lyrics.txt-save)
rename(olderfile-, saveerfile-)
rename(oldfile, savefile)
rename(review.old, review.save)
rename(schedule.old, schedule.save)
rename(stats.old, stats.save)
rename(this.old, this.save)
```

If you're then happy with those changes, you can then run the command without the **-n** option to make the file name changes.

Notice, however, that the “.” within the regular expressions will not be treated as a period, but as a wild card that will match any character. Some of the changes in the examples above and below are likely not what was intended by the person typing the command.

```
$ rename -n 's/.old/.save/' *
rename(logger.man-old, logger.man.save)
rename(lyrics.txt-old, lyrics.txt.save)
rename(review.old, review.save)
rename(schedule.old, schedule.save)
rename(stats.old, stats.save)
rename(this.old, this.save)
```

To ensure that a period is taken literally, put a backslash in front of it. This will keep it from being interpreted as a wild card and matching any character. Notice that only the “.old” files are selected when this change is made.

```
$ rename -n 's/\.old/.save/' *
rename(review.old, review.save)
rename(schedule.old, schedule.save)
rename(stats.old, stats.save)
rename(this.old, this.save)
```

A command like the one below would change all uppercase letters in file names to lowercase except that the -n option is being used to make sure we review the changes that would be made before we run the command to make the changes. Notice the use of the “y” in the regular expression; it’s required for making the case changes.

```
$ rename -n 'y/A-Z/a-z/' W*
rename(WARNING_SIGN.pdf, warning_sign.pdf)
rename(Will_Gardner_buttons.pdf, will_gardner_buttons.pdf)
rename(Wingding_Invites.pdf, wingding_invites.pdf)
rename(WOW-buttons.pdf, wow-buttons.pdf)
```

In the example above, we're changing all uppercase letters to lowercase, but only in file names that begin with an uppercase W.

### Wrap-up

The **rename** command is very helpful when you need to rename a lot of files. Just be careful not to make more changes than you intended. Keep in mind that the **-n** (or spelled out as **\--nono**) option can help you avoid time-consuming mistakes.

**[Now read this: [Linux hardening: A 15-step checklist for a secure Linux server][3] ]**

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3433865/how-to-rename-a-group-of-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/card-catalog-machester_city_library-100809242-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: http://www.networkworld.com/article/3143050/linux/linux-hardening-a-15-step-checklist-for-a-secure-linux-server.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
