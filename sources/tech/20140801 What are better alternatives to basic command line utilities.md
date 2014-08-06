What are better alternatives to basic command line utilities
================================================================================
The command line can be scary especially at the beginning. You might even experience some command-line-induced nightmare. Over time, however, we all realize that the command line is actually not that scary, but extremely useful. In fact, the lack of shell is what gives me an ulcer every time I have to use Windows. The reason for the change in perception is that the command line tools are actually smart. The basic utilities, what you are given to work with on any Linux terminal, are very powerful. But very powerful is never enough. If you want to make your command line experience even more pleasant, here are a few applications that you can download to replace the default ones, and will provide you with far more features than the originals.

### dfc ###

As an LVM user, I really like to keep an eye on my hard drive memory usage. I also never really understood why in Windows we have to open the file explorer to know this basic information. Hopefully on Linux, we can use the command.

    $ df -h 

![](https://farm4.staticflickr.com/3858/14768828496_c8a42620a3_z.jpg)

which gives you the size, usage, free space, ratio, and mount point of every volume on your computer. Notice that you have to pass in the "-h" argument to get all the data in human readable format (gigabytes instead of kilobytes). But you can replace completely df with [dfc][1], which can, without any additional arguments, get you everything that df showed, and throw in a usage graph for each device, and a color code, which makes it a lot easier to read.

![](https://farm6.staticflickr.com/5594/14791468572_a84d4b6145_z.jpg)

As a bonus, you can sort the volumes using the argument "-q", define the units that you want to see with "-u", and even export to csv or html format with "-e"

### dog ###

Dog is better than cat. At least that is what this program declares. You have to give it credit for once. Everything that the cat command does, [dog][2] does it better. Beyond just outputting some text stream to the console, dog is capable of filtering that stream. You can for example find all images in a web page by using the syntax:

    $ dog --images [URL] 

![](https://farm6.staticflickr.com/5568/14811659823_ea8d22d045_z.jpg)

Or all the links with:

    dog --links [URL] 

![](https://farm4.staticflickr.com/3902/14788690051_7472680968_z.jpg)

Besides, dog commands can also do other smaller tasks, like convert to upper or lower case, use different encoding, display the line numbers, and deal with hexadecimal. In short, dog is a must-have to replace cat.

### advcp ###

One of the most basic command in Linux is the copy command: cp. It is probably as basic as cd. Yet it cruelly lacks feedback. You can enable the verbose mode to see which files are being copied in real time, but if one of the files is very big, you will be left waiting in front of your screen with no idea of what is really happening behind the scenes. An easy way to fix that is to add a progress bar: what advcp (short for advanced cp) does! Available as a [patched version][3] of the [GNU coreutils][4], advcopy provides you with the acp and amv commands, which are "advanced" versions of cp and mv. Use the syntax:

    $ acp -g [file] [copy] 

to copy a file to another location, and display a progress bar.

![](https://farm6.staticflickr.com/5588/14605117730_fe611fc234_z.jpg)

I also advise using an alias in your .barshrc or .zshrc

    alias cp="acp -g"
    alias mv="amv -g"

### The Silver Searcher ###

Behind this atypical name, [the silver searcher][5] is a utility designed as a replacement for grep and [ack][6]. Intended to be faster than ack, and capable of ignoring files unlike grep, the silver searcher scrolls through your text file looking for the piece that you want. Among other features, it can spit out a colored output, follow symlink, use regular expressions, and even ignore some patterns. 

![](https://farm4.staticflickr.com/3876/14605308117_f966c77140_z.jpg)

The developers' website provides us with some benchmark statistic on the search speed which, if they are still true, are quite impressive. And cherry on the cake: you can include the utility in Vim in order to call it with a simple shortcut. In two words, smart and fast.

### plowshare ###

All fans of the command line like to use wget or one of its alternatives to download things from the internet. But if you use a lot of file sharing websites, like mediafire or rapidshare, you will be glad to know that there is an equivalent to wget dedicated to those websites, which is called [plowshare][7]. Once you install it, you can download files with:

    $ plowdown [URL] 

or upload them with:

    $ plowup [website name] [file] 

given that you have an account for that file sharing website.

Finally, it is possible to gather information, such as a list of links contained in a shared folder with:

    $ plowlist [URL] 

or the filename, size, hash, etc, with:

    $ plowprobe [URL] 

plowshare is also a good alternative to the slow and excruciating jDownloader for those of you who are familiar with these services.

### htop ###

If you use top command regularly, chances are you will love [htop][8] command. Both top and htop offer a real-time view of running processes, but htop boasts of a number of user-friendly features lacking in top command. For example, with htop, you can scroll process list vertically or horizontally to see full command lines of every process, and can do basic process management (e.g., kill, (re)nice) using mouse clicks and arrow keys (without entering numeric PIDs).

![](https://farm6.staticflickr.com/5581/14819141403_6f2348590f_z.jpg)

To conclude, these kinds of tools, which efficiently replace basic command line utilities, are like little pearl of usefulness. They are not always easy to find, but once you've got one, you always wonder how you survived for so long without it. If you know any other utility fitting this description, please share in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/better-alternatives-basic-command-line-utilities.html

作者：[Adrien Brochard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://projects.gw-computing.net/projects/dfc
[2]:http://archive.debian.org/debian/pool/main/d/dog/
[3]:http://zwicke.org/web/advcopy/
[4]:http://www.gnu.org/software/coreutils/
[5]:https://github.com/ggreer/the_silver_searcher
[6]:http://xmodulo.com/2014/01/search-text-files-patterns-efficiently.html
[7]:https://code.google.com/p/plowshare/
[8]:http://hisham.hm/htop/