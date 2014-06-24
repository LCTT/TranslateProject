Advanced Directory Navigations Tips and Tricks in Linux
================================================================================
Directory navigation is one of the most basic concepts when it comes to understanding any command line system. Although it’s not a very difficult thing to understand when it comes to Linux, there are certain tips and tricks that can enhance your experience, and help you do things faster. In this article, we will discuss some advanced directory navigation tips.

### The Stuff We Already Know ###

Before jumping on to the advanced concepts, here is the basics of directory navigation that the article expects its readers to know:

- ‘pwd’ command is used to display the current working directory.
- ‘cd’ command is used to change the current working directory.
- ‘cd’ followed by space and followed by a couple of periods (cd ..) brings the control back to the parent directory
- ‘cd’ followed by just the name of a subdirectory changes to that subdirectory
- ‘cd’ followed by a complete path changes to that directory

### Advanced Tips ###

In this section we will discuss some directory navigation tips and tricks that will help you easily switch between directories.

### Change to the home directory from anywhere ###

Your home directory is an important directory, and everyone switches back and forth quite frequently. While typing ‘cd /home/<your-home-directory-name>’, isn’t a big deal, there is another way out which is not only easier but faster too. And that alternative is typing only ‘cd’.

Here is an example :

    $ pwd
    /usr/include/netipx
    $ cd
    $ pwd
    /home/himanshu

So you can see, no matter where the current control is, just type ‘cd’ command and you can immediately change to your home directory.

**NOTE**- To change to the home directory of a particular user, just type ‘cd ~user_name'

### Switch between directories using cd - ###

Suppose your current working directory is this:

    $ pwd
    /home/himanshu/practice

and you want to switch to the directory **/usr/bin/X11**, and then switch back to the directory mentioned above. So what will you do? The most straight forward way is :

    $ cd /usr/bin/X11
    $ cd /home/himanshu/practice/

Although it seems a good way out, it really becomes tiring when the path to the directories is very long and complicated. In those cases, you can use the ‘cd -’ command.

While using ‘cd -’ command, the first step will remain the same, i.e., you have to do a cd <path> to the directory to you want to change to, but for coming back to the previous directory, just do a ‘cd -’, and that’s it.

    $ cd /usr/bin/X11
    $ cd -
    /home/himanshu/practice
    $ pwd
    /home/himanshu/practice

And if you want to again go back to the last directory, which in this case is /usr/bin/X11, run the ‘cd -’ command again. So you can see that using ‘cd -’ you can switch between directories easily. The only limitation is that it works with the last switched directories only.

### Switch between directories using pushd and popd ###

![directory navigation](http://linoxide.com/wp-content/uploads/2014/06/pushd-popd.jpg)

If you closely analyse the ‘cd -’ trick, you’ll find that it helps switching between only the last two directories, but what if there is a situation in which you switch multiple directories, and then want to switch back to the first one. For example, if you switch from directory A to directory B, and then to directory C and directory D. Now, you want to change back to Directory A.

As a general solution, you can type ‘cd’ followed by the path to directory A. But then again, if the path is long or complicated, the process can be time-consuming, especially when you have to switch between them frequently.

In these kind of situations, you can use the ‘pushd’ and ‘popd’ commands. The ‘pushd’ command saves the path to a directory in memory, and the ‘popd’ command removes it, and switches back to it too.

For example :

    $ pushd .
    /usr/include/netipx /usr/include/netipx
    $ cd /etc/hp/
    $ cd /home/himanshu/practice/
    $ cd /media/
    $ popd
    /usr/include/netipx
    $ pwd
    /usr/include/netipx

So you can see that I used ‘pushd’ command to save the path to current working directory (represented by .), and then changed multiple directories. To come back to the saved directory, I just executed the ‘popd’ command.

**NOTE**- You can also use ‘pushd’ command to switch back to the saved directory, but that doesn’t remove it from the memory, like ‘popd’ does.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/directory-navigations-tips-tricks/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出