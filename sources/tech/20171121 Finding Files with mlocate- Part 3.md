Finding Files with mlocate: Part 3
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/question-mark-2492009_1920.jpg?itok=stJ3GxL2)
In the previous articles in this short series, we [introduced the mlocate][1] (or just locate) command, and then discussed some ways [the updatedb tool][2] can be used to help you find that one particular file in a thousand.

You are probably also aware of xargs as well as the find command. Our trusty friend locate can also play nicely with the --null option of xargs by outputting all of the results onto one line (without spaces which isn't great if you want to read it yourself) by using the -0 switch like this:
```
# locate -0 .bash
```

An option I like to use (if I remember to use it -- because the locate command rarely needs to be queried twice thanks to its simple syntax) is the -e option.
```
# locate -e .bash
```

For the curious, that -e switch means "existing." And, in this case, you can use -e to ensure that any files returned by the locate command do actually exist at the time of the query on your filesystems.

It's almost magical, that even on a slow machine, the mastery of the modern locate command allows us to query its file database and then check against the actual existence of many files in seemingly no time whatsoever. Let's try a quick test with a file search that's going to return a zillion results and use the time command to see how long it takes both with and without the -e option being enabled.

I'll choose files with the compressed .gz extension. Starting with a count, you can see there's not quite a zillion but a fair number of files ending in .gz on my machine, note the -c for "count":
```
# locate -c .gz
7539
```

This time, we'll output the list but time it and see the abbreviated results as follows:
```
# time locate .gz
real 0m0.091s
user 0m0.025s
sys 0m0.012s
```

That's pretty swift, but it's only reading from the overnight-run database. Let's get it to do a check against those 7,539 files, too, to see if they truly exist and haven't been deleted or renamed since last night:
```
# time locate -e .gz
real 0m0.096s
user 0m0.028s
sys 0m0.055s
```

The speed difference is nominal as you can see. There's no point in talking about lightning or blink-and-you-miss-it, because those aren't suitable yardsticks. Relative to the other indexing service I mentioned previously, let's just say that's pretty darned fast.

If you need to move the efficient database file used by the locate command (in my version it lives here: /var/lib/mlocate/mlocate.db) then that's also easy to do. You may wish to do this, for example, because you've generated a massive database file (it's only 1.1MB in my case so it's really tiny in reality), which needs to be put onto a faster filesystem.

Incidentally, even the mlocate utility appears to have created an slocate group of users on my machine, so don't be too alarmed if you see something similar, as shown here from a standard file listing:
```
-rw-r-----. 1 root slocate 1.1M Jan 11 11:11 /var/lib/mlocate/mlocate.db
```

Back to the matter in hand. If you want to move away from /var/lib/mlocate as your directory being used by the database then you can use this command syntax (and you'll have to become the "root" user with sudo -i or su - for at least the first command to work correctly):
```
# updatedb -o /home/chrisbinnie/my_new.db
# locate -d /home/chrisbinnie/my_new.db SEARCH_TERM
```

Obviously, replace your database name and path. The SEARCH_TERM element is the fragment of the filename that you're looking for (wildcards and all).

If you remember I mentioned that you need to run updatedb command as the superuser to reach all the areas of your filesystems.

This next example should cover two useful scenarios in one. According to the manual, you can also create a "private" database for standard users as follows:
```
# updatedb -l 0 -o DATABASE -U source_directory
```

Here the previously seen -o option means that we output our database to a file (obviously called DATABASE). The -l 0 addition apparently means that the "visibility" of the database file is affected. It means (if I'm reading the docs correctly) that my user can read it but, otherwise, without that option, only the locate command can.

The second useful scenario for this example is that we can create a little database file specifying exactly which path its top-level should be. Have a look at the database-root or -U source_directory option in our example. If you don't specify a new root file path, then the whole filesystem(s) is scanned instead.

If you want to get clever and chuck a couple of top-level source directories into one command, then you can manage that having created two separate databases. Very useful for scripting methinks.

You can achieve that with this command:
```
# locate -d /home/chrisbinnie/database_one -d /home/chrisbinnie/database_two SEARCH_TERM
```

The manual dutifully warns however that ALL users that can read the DATABASE file can also get the complete list of files in the subdirectories of the chosen source_directory. So use these commands with some care.

### Priced To Sell

Back to the mind-blowing simplicity of the locate command in use on a day-to-day basis. There are many times when newbies may confused with case-sensitivity on Unix-type systems. Simply use the conventional -i option to ignore case entirely when using the flexible locate command:
```
# locate -i ChrisBinnie.pdf
```

If you have a file structure that has a number of symlinks holding it together, then there might be occasion when you want to remove broken symlinks from the search results. You can do that with this command:
```
# locate -Le chrisbinnie_111111.xml
```

If you needed to limit the search results then you could use this functionality, also in a script for example (similar to the -c option for counting), as so:
```
# locate -l25 *.gz
```

This command simply stops after outputting the first 25 files that were found. When piped through the grep command, it's very useful on a super busy system.

### Popular Area

We briefly touched upon performance earlier, and I happened to see this [nicely written blog entry][3], where the author discusses thoughts on the trade-offs between the database size becoming unwieldy and the speed at which results are delivered.

What piqued my interest are the comments on how the original locate command was written and what limiting factors were considered during its creation. Namely how disk space isn't quite so precious any longer and nor is the delivery of results even when 700,000 files are involved.

I'm certain that the author(s) of mlocate and its forebears would have something to say in response to that blog post. I suspect that holding onto the file permissions to give us the "secure" and "slocate" functionality in the database might be a fairly big hit in terms of overhead. And, as much as I enjoyed the post, I won't be writing a Bash script to replace mlocate any time soon. I'm more than happy with the locate command and extol its qualities at every opportunity.

### Sold

I hope you've acquired enough insight into the superb locate command to prune, tweak, adjust, and tune it to your unique set of requirements. As we've seen, it's fast, convenient, powerful, and efficient. Additionally, you can ignore the "root" user demands and use it within scripts for very specific tasks.

My favorite aspect, however, is when I'm awakened in the middle of the night because of an emergency. It's not a good look, having to remember the complex find command and typing it slowly with bleary eyes (and managing to add lots of typos):
```
# find . -type f -name "*.gz"
```

Instead of that, I can just use the simple locate command:
```
# locate *.gz
```

As has been said, any fool can create something bigger, bolder, and tougher, but it takes a bit of genius to create something simpler. And, in terms of introducing more people to the venerable Unix-type command line, there's little argument that the locate command welcomes them with open arms.

Learn more about essential sysadmin skills: Download the [Future Proof Your SysAdmin Career][4] ebook now.

Chris Binnie's latest book, Linux Server Security: Hack and Defend, shows how hackers launch sophisticated attacks to compromise servers, steal data, and crack complex passwords, so you can learn how to defend against these attacks. In the book, he also talks you through making your servers invisible, performing penetration testing, and mitigating unwelcome attacks. You can find out more about DevSecOps and Linux security via his website ([http://www.devsecops.cc][5]).

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2017/11/finding-files-mlocate-part-3

作者：[Chris Binnie][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/chrisbinnie
[1]:https://www.linux.com/blog/learn/intro-to-linux/2017/11/finding-files-mlocate
[2]:https://www.linux.com/blog/learn/intro-to-linux/finding-files-mlocate-part-2
[3]:http://jvns.ca/blog/2015/03/05/how-the-locate-command-works-and-lets-rewrite-it-in-one-minute/
[4]:https://go.pardot.com/l/6342/2017-07-17/3vwshv?utm_source=linco&utm_medium=blog&utm_campaign=sysadmin&utm_content=promo
[5]:http://www.devsecops.cc/
