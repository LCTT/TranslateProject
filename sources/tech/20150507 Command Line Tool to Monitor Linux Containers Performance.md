Command Line Tool to Monitor Linux Containers Performance
================================================================================
ctop is a new command line based tool available to monitor the processes at the container level. Containers provide operating system level virtualization environment by making use of the cgroups resource management functionality. This tool collects data related to memory, cpu, block IO and metadata like owner, uptime etc from cgroups and presents it in a user readable format so that one can quickly asses the overall health of the system. Based on the data collected, it tries to guess the underlying container technology.  ctop is useful in detecting who is using large amounts of memory under low memory situations.

### Capabilities ###

Some of the capabilities of ctop are:

- Collect metrics for cpu, memory and blkio
- Gather information regarding owner, container technology, task count
- Sort the information using any column
- Display the information using tree view
- Fold/unfold cgroup tree
- Select and follow a cgroup/container
- Select a timeframe for refreshing the displayed data
- Pause the refreshing of data
- Detect containers that are based on systemd, Docker and LXC
- Advance features for Docker and LXC based containers
    - open / attach a shell for further diagnosis
    - stop / kill container types

### Installation ###

**ctop** is written using Python and there are no other external dependencies other than having to use Python version 2.6 or greater (with built-in cursor support).   Installation using Python's pip is the recommended method. Install pip if not already done and install ctop using pip.

*Note: The examples shown in this article are from an Ubuntu (14.10) system*

    $ sudo apt-get install python-pip

Installing ctop using pip:

    poornima@poornima-Lenovo:~$ sudo pip install ctop

    [sudo] password for poornima:

    Downloading/unpacking ctop

    Downloading ctop-0.4.0.tar.gz

    Running setup.py (path:/tmp/pip_build_root/ctop/setup.py) egg_info for package ctop

    Installing collected packages: ctop

    Running setup.py install for ctop

    changing mode of build/scripts-2.7/ctop from 644 to 755

    changing mode of /usr/local/bin/ctop to 755

    Successfully installed ctop

    Cleaning up...

If using pip is not an option, you can also install it directly from the github using wget:

    poornima@poornima-Lenovo:~$ wget https://raw.githubusercontent.com/yadutaf/ctop/master/cgroup_top.py -O ctop

    --2015-04-29 19:32:53-- https://raw.githubusercontent.com/yadutaf/ctop/master/cgroup_top.py

    Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 199.27.78.133

    Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|199.27.78.133|:443... connected.

    HTTP request sent, awaiting response... 200 OK Length: 27314 (27K) [text/plain]

    Saving to: ctop

    100%[======================================>] 27,314 --.-K/s in 0s

    2015-04-29 19:32:59 (61.0 MB/s) - ctop saved [27314/27314]

----------

    poornima@poornima-Lenovo:~$ chmod +x ctop

You might get an error message while launching ctop if cgroup-bin package is not installed.  It can be resolved by installing the required package.

    poornima@poornima-Lenovo:~$ ./ctop

    [ERROR] Failed to locate cgroup mountpoints.

    poornima@poornima-Lenovo:~$ sudo apt-get install cgroup-bin

Here is a sample output screen of ctop:

![ctop screen](http://blog.linoxide.com/wp-content/uploads/2015/05/ctop.png)
ctop screen

### Usage options ###

    ctop [--tree] [--refresh=] [--columns=] [--sort-col=] [--follow=] [--fold=, ...] ctop (-h | --help)

Once you are inside the ctop screen, use the up (↑) and down(↓) arrow keys to navigate between containers. Clicking on any container will select that particular container. Pressing q or Ctrl+C quits the container.

Let us now take a look at how to use each of the options listed above.

    -h / --help  - Show the help screen

----------

    poornima@poornima-Lenovo:~$ ctop -h
    Usage: ctop [options]

    Options:
    -h, --help show this help message and exit
    --tree show tree view by default
    --refresh=REFRESH Refresh display every <seconds>
    --follow=FOLLOW Follow cgroup path
    --columns=COLUMNS List of optional columns to display. Always includes
    'name'
    --sort-col=SORT_COL Select column to sort by initially. Can be changed
    dynamically.

----------

    --tree - Display tree view of the containers

By default, list view is displayed

Once you are inside the ctop window, you can use the F5 button to toggle tree / list view.

    --fold=<name> - Fold the <name> cgroup path in the tree view.

       This option needs to be used in combination with --tree.

----------

    Eg:   ctop --tree --fold=/user.slice

![Output of 'ctop --fold'](http://blog.linoxide.com/wp-content/uploads/2015/05/ctop-fold.png)
Output of 'ctop --fold'

Inside the ctop window, use the + / - keys to toggle child cgroup folding.

Note: At the time of writing this article, pip repository did not have the latest version of ctop which supports '--fold' option via command line.

    --follow= - Follow/Highlight the cgroup path.

----------

    Eg: ctop --follow=/user.slice/user-1000.slice

As you can see in the screen below, the cgroup with the given path "/user.slice/user-1000.slice" gets highlighted and makes it easier for the user to follow it even when the display position gets changed.

![Output of 'ctop --follow'](http://blog.linoxide.com/wp-content/uploads/2015/05/ctop-follow.png)
Output of 'ctop --follow'

You can also use the 'f' button to allow the highlighted line to follow the selected container. By default, follow is off.

    --refresh= - Refresh the display at the given rate. Default 1 sec

This is useful in changing the refresh rate of the display as per user requirement.  Use the 'p' button to pause the refresh and select the text.

    --columns=<columns> - Can limit the display to selected <columns>. 'name' should be the first entry followed by other columns. By default, the columns include owner, processes,memory, cpu-sys, cpu-user, blkio, cpu-time.

----------

    Eg: ctop --columns=name,owner,type,memory

![Output of 'ctop --column'](http://blog.linoxide.com/wp-content/uploads/2015/05/ctop-column.png)
Output of 'ctop --column'

    -sort-col=<sort-col> - column using which the displayed data should be sorted. By default it is sorted using cpu-user

----------

    Eg: ctop --sort-col=blkio

If there are additional containers supported like Docker and LXC, following options will also be available:

    press 'a' - attach to console output

    press 'e' - open a shell in the container context

    press 's' – stop the container (SIGTERM)

    press 'k' - kill the container (SIGKILL)

[ctop][1] is currently in active development by Jean-Tiare Le Bigot. Hopefully we would see more features in this tool like our native top command :-).

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/monitor-linux-containers-performance/

作者：[B N Poornima][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bnpoornima/
[1]:https://github.com/yadutaf/ctop