Avoiding Server Disaster
======

Worried that your server will go down? You should be. Here are some disaster-planning tips for server owners.

If you own a car or a house, you almost certainly have insurance. Insurance seems like a huge waste of money. You pay it every year and make sure that you get the best possible price for the best possible coverage, and then you hope you never need to use the insurance. Insurance seems like a really bad deal—until you have a disaster and realize that had it not been for the insurance, you might have been in financial ruin.

Unfortunately, disasters and mishaps are a fact of life in the computer industry. And so, just as you pay insurance and hope never to have to use it, you also need to take time to ensure the safety and reliability of your systems—not because you want disasters to happen, or even expect them to occur, but rather because you have to.

If your website is an online brochure for your company and then goes down for a few hours or even days, it'll be embarrassing and annoying, but not financially painful. But, if your website is your business, when your site goes down, you're losing money. If that's the case, it's crucial to ensure that your server and software are not only unlikely to go down, but also easily recoverable if and when that happens.

Why am I writing about this subject? Well, let's just say that this particular problem hit close to home for me, just before I started to write this article. After years of helping clients around the world to ensure the reliability of their systems, I made the mistake of not being as thorough with my own. ("The shoemaker's children go barefoot", as the saying goes.) This means that just after launching my new online product for Python developers, a seemingly trivial upgrade turned into a disaster. The precautions I put in place, it turns out, weren't quite enough—and as I write this, I'm still putting my web server together. I'll survive, as will my server and business, but this has been a painful and important lesson—one that I'll do almost anything to avoid repeating in the future.

So in this article, I describe a number of techniques I've used to keep servers safe and sound through the years, and to reduce the chances of a complete meltdown. You can think of these techniques as insurance for your server, so that even if something does go wrong, you'll be able to recover fairly quickly.

I should note that most of the advice here assumes no redundancy in your architecture—that is, a single web server and (at most) a single database server. If you can afford to have a bunch of servers of each type, these sorts of problems tend to be much less frequent. However, that doesn't mean they go away entirely. Besides, although people like to talk about heavy-duty web applications that require massive iron in order to run, the fact is that many businesses run on small, one- and two-computer servers. Moreover, those businesses don't need more than that; the ROI (return on investment) they'll get from additional servers cannot be justified. However, the ROI from a good backup and recovery plan is huge, and thus worth the investment.

### The Parts of a Web Application

Before I can talk about disaster preparation and recovery, it's important to consider the different parts of a web application and what those various parts mean for your planning.

For many years, my website was trivially small and simple. Even if it contained some simple programs, those generally were used for sending email or for dynamically displaying different assets to visitors. The entire site consisted of some static HTML, images, JavaScript and CSS. No database or other excitement was necessary.

At the other end of the spectrum, many people have full-blown web applications, sitting on multiple servers, with one or more databases and caches, as well as HTTP servers with extensively edited configuration files.

But even when considering those two extremes, you can see that a web application consists of only a few parts:

*   The application software itself.

*   Static assets for that application.

*   Configuration file(s) for the HTTP server(s).

*   Database configuration files.

*   Database schema and contents.

Assuming that you're using a high-level language, such as Python, Ruby or JavaScript, everything in this list either is a file or can be turned into one. (All databases make it possible to "dump" their contents onto disk, into a format that then can be loaded back into the database server.)

Consider a site containing only application software, static assets and configuration files. (In other words, no database is involved.) In many cases, such a site can be backed up reliably in Git. Indeed, I prefer to keep my sites in Git, backed up on a commercial hosting service, such as GitHub or Bitbucket, and then deployed using a system like Capistrano.

In other words, you develop the site on your own development machine. Whenever you are happy with a change that you've made, you commit the change to Git (on your local machine) and then do a git push to your central repository. In order to deploy your application, you then use Capistrano to do a cap deploy, which reads the data from the central repository, puts it into the appropriate place on the server's filesystem, and you're good to go.

This system keeps you safe in a few different ways. The code itself is located in at least three locations: your development machine, the server and the repository. And those central repositories tend to be fairly reliable, if only because it's in the financial interest of the hosting company to ensure that things are reliable.

I should add that in such a case, you also should include the HTTP server's configuration files in your Git repository. Those files aren't likely to change very often, but I can tell you from experience, if you're recovering from a crisis, the last thing you want to think about is how your Apache configuration files should look. Copying those files into your Git repository will work just fine.

### Backing Up Databases

You could argue that the difference between a "website" and a "web application" is a database. Databases long have powered the back ends of many web applications and for good reason—they allow you to store and retrieve data reliably and flexibly. The power that modern open-source databases provides was unthinkable just a decade or two ago, and there's no reason to think that they'll be any less reliable in the future.

And yet, just because your database is pretty reliable doesn't mean that it won't have problems. This means you're going to want to keep a snapshot ("dump") of the database's contents around, in case the database server corrupts information, and you need to roll back to a previous version.

My favorite solution for such a problem is to dump the database on a regular basis, preferably hourly. Here's a shell script I've used, in one form or another, for creating such regular database dumps:

```

#!/bin/sh

BACKUP_ROOT="/home/database-backups/"
YEAR=`/bin/date +'%Y'`
MONTH=`/bin/date +'%m'`
DAY=`/bin/date +'%d'`

DIRECTORY="$BACKUP_ROOT/$YEAR/$MONTH/$DAY"
USERNAME=dbuser
DATABASE=dbname
HOST=localhost
PORT=3306

/bin/mkdir -p $DIRECTORY

/usr/bin/mysqldump -h $HOST --databases $DATABASE -u $USERNAME
 ↪| /bin/gzip --best --verbose >
 ↪$DIRECTORY/$DATABASE-dump.gz

```

The above shell script starts off by defining a bunch of variables, from the directory in which I want to store the backups, to the parts of the date (stored in $YEAR, $MONTH and $DAY). This is so I can have a separate directory for each day of the month. I could, of course, go further and have separate directories for each hour, but I've found that I rarely need more than one backup from a day.

Once I have defined those variables, I then use the mkdir command to create a new directory. The -p option tells mkdir that if necessary, it should create all of the directories it needs such that the entire path will exist.

Finally, I then run the database's "dump" command. In this particular case, I'm using MySQL, so I'm using the mysqldump command. The output from this command is a stream of SQL that can be used to re-create the database. I thus take the output from mysqldump and pipe it into gzip, which compresses the output file. Finally, the resulting dumpfile is placed, in compressed form, inside the daily backup directory.

Depending on the size of your database and the amount of disk space you have on hand, you'll have to decide just how often you want to run dumps and how often you want to clean out old ones. I know from experience that dumping every hour can cause some load problems. On one virtual machine I've used, the overall administration team was unhappy that I was dumping and compressing every hour, which they saw as an unnecessary use of system resources.

If you're worried your system will run out of disk space, you might well want to run a space-checking program that'll alert you when the filesystem is low on free space. In addition, you can run a cron job that uses find to erase all dumpfiles from before a certain cutoff date. I'm always a bit nervous about programs that automatically erase backups, so I generally prefer not to do this. Rather, I run a program that warns me if the disk usage is going above 85% (which is usually low enough to ensure that I can fix the problem in time, even if I'm on a long flight). Then I can go in and remove the problematic files by hand.

When you back up your database, you should be sure to back up the configuration for that database as well. The database schema and data, which are part of the dumpfile, are certainly important. However, if you find yourself having to re-create your server from scratch, you'll want to know precisely how you configured the database server, with a particular emphasis on the filesystem configuration and memory allocations. I tend to use PostgreSQL for most of my work, and although postgresql.conf is simple to understand and configure, I still like to keep it around with my dumpfiles.

Another crucial thing to do is to check your database dumps occasionally to be sure that they are working the way you want. It turns out that the backups I thought I was making weren't actually happening, in no small part because I had modified the shell script and hadn't double-checked that it was creating useful backups. Occasionally pulling out one of your dumpfiles and restoring it to a separate (and offline!) database to check its integrity is a good practice, both to ensure that the dump is working and that you remember how to restore it in the case of an emergency.

### Storing Backups

But wait. It might be great to have these backups, but what if the server goes down entirely? In the case of the code, I mentioned to ensure that it was located on more than one machine, ensuring its integrity. By contrast, your database dumps are now on the server, such that if the server fails, your database dumps will be inaccessible.

This means you'll want to have your database dumps stored elsewhere, preferably automatically. How can you do that?

There are a few relatively easy and inexpensive solutions to this problem. If you have two servers—ideally in separate physical locations—you can use rsync to copy the files from one to the other. Don't rsync the database's actual files, since those might get corrupted in transfer and aren't designed to be copied when the server is running. By contrast, the dumpfiles that you have created are more than able to go elsewhere. Setting up a remote server, with a user specifically for handling these backup transfers, shouldn't be too hard and will go a long way toward ensuring the safety of your data.

I should note that using rsync in this way basically requires that you set up passwordless SSH, so that you can transfer without having to be physically present to enter the password.

Another possible solution is Amazon's Simple Storage Server (S3), which offers astonishing amounts of disk space at very low prices. I know that many companies use S3 as a simple (albeit slow) backup system. You can set up a cron job to run a program that copies the contents of a particular database dumpfile directory onto a particular server. The assumption here is that you're not ever going to use these backups, meaning that S3's slow searching and access will not be an issue once you're working on the server.

Similarly, you might consider using Dropbox. Dropbox is best known for its desktop client, but it has a "headless", text-based client that can be used on Linux servers without a GUI connected. One nice advantage of Dropbox is that you can share a folder with any number of people, which means you can have Dropbox distribute your backup databases everywhere automatically, including to a number of people on your team. The backups arrive in their Dropbox folder, and you can be sure that the LAMP is conditional.

Finally, if you're running a WordPress site, you might want to consider VaultPress, a for-pay backup system. I must admit that in the weeks before I took my server down with a database backup error, I kept seeing ads in WordPress for VaultPress. "Who would buy that?", I asked myself, thinking that I'm smart enough to do backups myself. Of course, after disaster occurred and my database was ruined, I realized that $30/year to back up all of my data is cheap, and I should have done it before.

### Conclusion

When it comes to your servers, think less like an optimistic programmer and more like an insurance agent. Perhaps disaster won't strike, but if it does, will you be able to recover? Making sure that even if your server is completely unavailable, you'll be able to bring up your program and any associated database is crucial.

My preferred solution involves combining a Git repository for code and configuration files, distributed across several machines and services. For the databases, however, it's not enough to dump your database; you'll need to get that dump onto a separate machine, and preferably test the backup file on a regular basis. That way, even if things go wrong, you'll be able to get back up in no time.

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/avoiding-server-disaster

作者：[Reuven M.Lerner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/user/1000891
