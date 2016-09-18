Translating---geekpi

Taskwarrior: A Brilliant Command-Line TODO App For Linux
====

Taskwarrior is a simple, straight-forward command-line based TODO app for Ubuntu/Linux. This open-source app has to be one of the easiest of all [CLI based apps][4] I've ever used. Taskwarrior helps you better organize yourself, and without installing bulky new apps which sometimes defeats the whole purpose of TODO apps.

![](https://2.bp.blogspot.com/-pQnRlOUNIxk/V9cuc3ytsBI/AAAAAAAAKHs/yYxyiAk4PwMIE0HTxlrm6arWOAPcBRRywCLcB/s1600/taskwarrior-todo-app.png)

### Taskwarrior: A Simple CLI Based TODO App That Gets The Job Done!

Taskwarrior is an open-source and cross-platform, command-line based TODO app, which lets you manage your to-do lists right from the Terminal. The app lets you add tasks, shows you the list, and removes tasks from that list with much ease. And what's more, it's available within your default repositories, no need to fiddle with PPAs. In Ubuntu 16.04 LTS and similar, do the following in Terminal to install Taskwarrior. 

```
sudo apt-get install task
```

A simple use case can be as follows:

```
$ task add Read a book
Created task 1.
$ task add priority:H Pay the bills
Created task 2.
```

This is the same example I used in the screenshot above. Yes, you can set priority levels (H, L or M) as shown. And then you can use 'task' or 'task next' commands to see your newly-created todo list. For example:

```
$ task next

ID Age P Description                      Urg
-- --- - -------------------------------- ----
 2 10s H Pay the bills                     6
 1 20s   Read a book                       0
```

And once its completed, you can use 'task 1 done' or 'task 2 done' commands to clear the lists. A more comprehensive list of commands, use-cases [can be found here][1]. Also, Taskwarrior is cross-platform, which means you'll find a version that [fits your needs][2] no matter what. There's even an [Android version][3] if you want one. Enjoy!

--------------------------------------------------------------------------------

via: http://www.techdrivein.com/2016/09/taskwarrior-command-line-todo-app-linux.html?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+techdrivein+%28Tech+Drive-in%29

作者：[Manuel Jose ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.techdrivein.com/2016/09/taskwarrior-command-line-todo-app-linux.html?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+techdrivein+%28Tech+Drive-in%29
[1]: https://taskwarrior.org/docs/
[2]: https://taskwarrior.org/download/
[3]: https://taskwarrior.org/news/news.20160225.html
[4]: http://www.techdrivein.com/search/label/Terminal


