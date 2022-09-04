[#]: subject: "4 ways to use the Linux tar command"
[#]: via: "https://opensource.com/article/22/8/linux-tar-command"
[#]: author: "AmyJune Hineline https://opensource.com/users/amyjune"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 ways to use the Linux tar command
======
How do you use the tar command? That's what I recently asked our community of writers. Here are some of their answers.

When you have a lot of related files, it's sometimes easier to treat them as a single object rather than 3 or 20 or 100 unique files. There are fewer clicks involved, for instance, when you email *one* file compared to the mouse work required to email 30 separate files. This quandary was solved decades ago when programmers invented a way to create an *archive*, and so the `tar` command was born (the name stands for *tape archive* because back then, files were saved to magnetic tape.) Today `tar` remains a useful way to bundle files together, whether it's to compress them so they take up less space on your drive, to make it easier to deal with lots of files, or to logically group files together as a convenience.

I asked Opensource.com authors how they used `tar`, and related tools like `zip` and `gzip`, in their daily work. Here's what they said.

### Backups and logs

I use `tar` and `zip` whenever I need to make a backup or archive of an entire directory tree. For example, delivering a set of files to a client, or just making a quick backup of my web root directory before I make a major change on the website. If I need to share with others, I create a ZIP archive with `zip -9r`, where `-9` uses best possible compression, and `-r` will recurse into subdirectories. For example, `zip -9r client-delivery.zip client-dir` makes a zip file of my work, which I can send to a client.

If the backup is just for me, I probably use `tar` instead. When I use `tar`, I usually use `gzip` to compress, and I do it all on one command line with `tar czf`, where `c` will create a new archive file, `z` compresses it with `gzip`, and `f` sets the archive filename. For example, `tar czf web-backup.tar.gz html` creates a compressed backup of my `html` directory.

I also have web applications that create log files. And to keep them from taking up too much space, I compress them using `gzip`. The `gzip` command is a great way to compress a *single file*. This can be a TAR archive file, or just any regular file like a log file. To make the gzipped file as small as possible, I compress the file with `gzip -9`, where `-9` uses the best possible compression.

The great thing about using `gzip` to compress files is that I can use commands like `zcat` and `zless` to view them later, without having to uncompress them on the disk. So if I want to look at my log file from yesterday, I can use `zless yesterday.log.gz` and the `zless` command automatically uncompresses the data with `gunzip` and send it to the `less` viewer. Recently, I wanted to look at how many log entries I had per day, and I ran that with a `zcat` command like:

```
for f in *.log.gz; do echo -n "$f,"; zcat $f | wc -l; done
```

This generates a comma-separated list of log files and a line count, which I can easily import to a spreadsheet for analysis.

**[—Jim Hall][2]**

### Zcat

I introduced the `zcat` command in my article [Getting started with the cat command][3]. Maybe this can act as a stimulus for further discussion of "in-place" compressed data analysis.

**[—Alan Formy-Duval][4]**

### Zless and lzop

I love having `zless` to browse log files and archives. It really helps reduce the risk of leaving random old log files around that I haven't cleaned up.

When dealing with compressed archives, `tar -zxf` and `tar -zcf` are awesome, but don't forget about `tar -j` for those bzip2 files, or even `tar -J` for the highly compressed xz files.

If you're dealing with a platform with limited CPU resources, you could even consider a lower overhead solution like `lzop`. For example, on the source computer:

```
tar --lzop -cf - source_directory | nc destination-host 9999
```

On the destination computer:

```
nc -l 9999 | tar --lzop -xf -
```

I've often used that to compress data between systems where we have bandwidth limitations and need a low resource option.

**[—Steven Ellis][5]**

### Ark

I've found myself using the KDE application Ark lately. It's a GUI application, but it integrates so well with the Dolphin file manager that I've gotten into the habit of just updating files straight into an archive without even bothering to unarchive the whole thing. Of course, you can do the same thing with the `tar` command, but if you're browsing through files in Dolphin anyway, Ark makes it quick and easy to interact with an archive without interrupting your current workflow.

![Ark][6]

Image by: (Seth Kenlon, CC BY-SA 4.0)

Archives used to feel a little like a forbidden vault to me. Once I put files into an archive, they were as good as forgotten because it just isn't always convenient to interact with an archive. But Ark lets you preview files without uncompressing them (technically they're being uncompressed, but it doesn't "feel" like they are because it all happens in place), remove a file from an archive, update files, rename files, and a lot more. It's a really nice and dynamic way to interact with archives, which encourages me to use them more often.

**[—Seth Kenlon][7]**

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/linux-tar-command

作者：[AmyJune Hineline][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/amyjune
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/collab-team-pair-programming-code-keyboard2.png
[2]: https://opensource.com/users/jim-hall
[3]: https://opensource.com/Getting%20Started%20with%20the%20Cat%20Command
[4]: https://opensource.com/users/alanfdoss
[5]: https://opensource.com/opensource.com/users/steven-ellis
[6]: https://opensource.com/sites/default/files/2022-08/ark.webp
[7]: https://opensource.com/users/seth
