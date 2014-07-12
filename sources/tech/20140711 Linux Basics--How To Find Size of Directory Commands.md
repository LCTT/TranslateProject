Linux Basics: How To Find Size of Directory Commands
================================================================================
This is the first in a series of posts in coming where I’ll be writing about some **basic commands** that that will be of good use to new users.

**Note**: This is targeted at people little or no command line experience..

> How can I as a new user to Linux display directory properties from the terminal?

### Requirements ###

The only requirement is the **du** command line tool. du comes with almost every Linux distro by default.

Check if du it’s on your system by running the command below in the terminal:

    man du

**du** command estimates file space usage

### Using du ###

Running du with no flag displays names of all directories including sub-directories and sizes in bytes.

    du

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/du-overview.png)

Using the **-h** flag displays the sizes in human readable format, that is **K, M** and **G** representing **Kilobyte, Megabyte** and **Gigabyte** respectively.

    du - h

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/du-h.png)

To view a specific directory indicate that after du and flag as shown below:

    du -h Mapmaker

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/du-h-mapmaker.png)

Use -c to see grand **total** displayed:

    du -ch

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/du-ch.png)

Use **-s** flag to display only grand total / disk space used for specific directories:

    du -sh Mapmaker Sandbox

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Screenshot-07052014-093858-AM.png)

See man du for more flags and there uses

    man du

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/man-du.png)

Knows other combinations of du? Share with myself and others here too.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linux-basics-find-size-directory-commands/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出