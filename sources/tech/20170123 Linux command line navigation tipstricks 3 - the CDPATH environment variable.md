[HaitaoBio](https://github.com/HaitaoBio) translating...

Linux command line navigation tips/tricks 3 - the CDPATH environment variable
============================================================

### On this page

1.  [The CDPATH environment variable][1]
2.  [Points to keep in mind][2]
3.  [Conclusion][3]

In the first part of this series, we discussed the **cd -** command in detail, and the in the second part, we took an in-depth look into the **pushd** and **popd** commands as well as the scenarios where-in they come in handy.

Continuing with our discussion on the command line navigation aspects, in this tutorial, we'll discuss the **CDPATH** environment variable through easy to understand examples. We'll also discuss some advance details related to this variable.

_But before we proceed, it's worth mentioning that all the examples in this tutorial have been tested on Ubuntu 14.04 with Bash version 4.3.11(1)._

### The CDPATH environment variable

Even if your command line work involves performing all operations under a particular directory - say your home directory - then also you have to provide absolute paths while switching directories. For example, consider a situation where-in I am in _/home/himanshu/Downloads_ directory:

$ pwd
/home/himanshu/Downloads

And the requirement is to switch to the _/home/himanshu/Desktop_ directory. To do this, usually, I'll have to either run:

cd /home/himanshu/Desktop/

or 

cd ~/Desktop/

or

cd ../Desktop/

Wouldn't it be easy if I could just run the following command:

cd Desktop

Yes, that's possible. And this is where the CDPATH environment variable comes in.You can use this variable to define the base directory for the **cd** command.

If you try printing its value, you'll see that this env variable is empty by default:

$ echo $CDPATH
$

Now, considering the case we've been discussing so far, let's use this environment variable to define _/home/himanshu_ as the base directory for the cd command.

The easiest way to do this is:

export CDPATH=/home/himanshu

And now, I can do what I wasn't able to do earlier - from within the _/home/himanshu/Downloads_ directory, run the _cd Desktop_ command successfully.

$ pwd
/home/himanshu/Downloads
$ **cd Desktop/**
**/home/himanshu/Desktop**
$

This means that I can now do a cd to any directory under _/home/himanshu_ without explicitly specifying _/home/himanshu_ or _~_ or _../_ (or multiple _../_)in the cd command.

### Points to keep in mind

So you now know how we used the CDPATH environment variable to easily switch to/from _/home/himanshu/Downloads_ from/to _/home/himanshu/Desktop_. Now, consider a situation where-in the _/home/himanshu/Desktop_ directory contains a subdirectory named _Downloads_, and it's the latter where you intend to switch.

But suddenly you realize that doing a _cd Desktop_ will take you to _/home/himanshu/Desktop_. So, to make sure that doesn't happen, you do:

cd ./Downloads

While there's no problem in the aforementioned command per se, that's an extra effort on your part (howsoever little it may be), especially considering that you'll have to do this each time such a situation arises. A more elegant solution to this problem can be to originally set the CDPATH variable in the following way:

export CDPATH=".:/home/himanshu"

This means, you're telling the cd command to first look for the directory in the current working directory, and then try searching the _/home/himanshu_ directory. Of course, whether or not you want the cd command to behave this way depends entirely on your preference or requirement - my idea behind discussing this point was to let you know that this kind of situation may arise.

As you would have understood by now, once the CDPATH env variable is set, it's value - or the set of paths it contains - are the only places on the system where the cd command searches for directories (except of course the scenarios where-in you use absolute paths). So, it's entirely up to you to make sure that the behavior of the command remains consistent.

Moving on, if there's a bash script that uses the cd command with relative paths, then it's better to clear or unset the CDPATH environment variable first, unless you are ok with getting trapped into unforeseen problems. Alternatively, rather than using the _export_ command on the terminal to set CDPATH, you can set the environment variable in your `.bashrc` file after testing for interactive/non-interactive shells to make sure that the change you're trying to make is only reflected in interactive shells.

The order in which paths appear in the environment variable's value is also important. For example, if current directory is listed before _/home/himanshu_, then the cd command will first search for a directory in the present working directory and then move on to _/home/himanshu_. However, if the value is _"/home/himanshu:."_ then the first search will be made in _/home/himanshu_ and after that the current directory. Needless to say, this will effect what the cd command does, and may cause problems if you aren't aware of the order of paths.

Always keep in mind that the CDPATH environment variable, as the name suggests, works only for the cd command. This means that while inside the _/home/himanshu/Downloads_ directory, you can run the _cd Desktop_ command to switch to _/home/himanshu/Desktop_ directory, but you can't do an _ls_. Here's an example:

$ pwd
/home/himanshu/Downloads
**$ ls Desktop**
**ls: cannot access Desktop: No such file or directory**
$

However, there could be some simple workarounds. For example, we can achieve what we want with minimal effort in the following way:

$ **cd Desktop/;ls**
/home/himanshu/Desktop
backup backup~ Downloads gdb.html outline~ outline.txt outline.txt~

But yeah, there might not be a workaround for every situation.

Another important point: as you might have observed, whenever you use the cd command with the CDPATH environment variable set, the command produces the full path of directory you are switching to in the output. Needless to say, not everybody would want to have this information each time they run the cd command on their machine. 

To make sure this output gets suppressed, you can use the following command:

alias cd='>/dev/null cd'

The aforementioned command will mute the output whenever the cd command is successful, but will allow the error messages to be produced whenever the command fails.

Lastly, in case you face a problem where-in after setting the CDPATH environment variable, you can't use the shell's tab completion feature, then you can try installing and enabling bash-completion - more on it [here][4].

### Conclusion

The CDPATH environment variable is a double edged sword - if not used with caution and complete knowledge, it may land you in some complex traps that may require a lot of your time precious time to get resolved. Of course, that doesn't mean you should never give it a try; just evaluate all the available options and if you conclude that using CDPATH would be of great help, then do go ahead and use it.

Have you been using CDPATH like a pro? Do you have some more tips to share? Please share your thoughts in comments below.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-3-cdpath/

作者：[Ansh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-3-cdpath/
[1]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-3-cdpath/#the-cdpath-environment-variable
[2]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-3-cdpath/#points-to-keep-in-mind
[3]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-3-cdpath/#conclusion
[4]:http://bash-completion.alioth.debian.org/
