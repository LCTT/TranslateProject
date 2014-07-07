暑假 先来一发 Luoxcat 翻译
Command Line Tuesdays – Part Three
================================================================================
Today, mr Shotts takes us on a first part of a guided tour through our file system. We’ll learn how to visit, list files within directories and we’ll learn to use some options for the first time. So let’s begin with the first command of the week.

### ls ###

ls is a command used to list files in a directory. It can be used in various ways. These various ways come with using a form of adding an **option** to our command. To make things clearer; You can type only ls. But, you can also add an option, which will modify your command. It can come in useful when you want to sandbox some of the information, when looking for something specific, and the command issues a very long output, you can, for example, narrow it down to only specific information.

That’s what an option is. And formally we can write it down like this:

    command -option argument

Command is, well, a command we write in (like pwd, ls or anything else we have learned by now).

We already stated above the purpose of an option. But let me note it should be written exactly as it’s in the form; With a dash in front of it. So, if the option is l, you should put **-l** after the command.

An **argument** is an object upon which the command operates (in this case, it will be directories, as we’ll learning how to navigate through them).

So, let’s try out ls, and use it on the /etc directory in our home folder. This time, without any options.

![](https://news.opensuse.org/wp-content/uploads/2014/06/Screenshot-30.-06.-2014-184127.png)

There you go, a whole bunch of files. It also sorts them by colours. The blue ones are directories, the white ones are files, the green one seems like a shell script of some sort. There are more colors, as they represent different file types.

Next, you can use the same command, but with an option -l added. Option -l will list the same files and directories, but in a long format. In case you need more information:

![](https://news.opensuse.org/wp-content/uploads/2014/06/Screenshot-30.-06.-2014-184542.png)

### The Long Format ###

So, using the long format, you see much more information, and some crazy looking signs like -rw-r–r– at the beginning of all lines. Actually, here’s a scheme, representing what all of the given information actually means.

![](https://news.opensuse.org/wp-content/uploads/2014/06/Screenshot-30.-06.-2014-184829.png)

File Name is the name of the file. Modification time is the last time the file has been modified. Size is the size of the file in bytes. Group is the name of the group that has file permissions along with the owner, and Owner is the user who owns the file. The most important one is…

### …File Permissions ###

That’s the gibberish at the beginning of every line in long format. The first character is the file type. If it’s a ‘d’, it means the file’s a directory. If it’s ‘-’, it means it’s an ordinary file. The next three characters represent the read, write and execution rights of the file’s owner. The next three are the same rights of the group that also has access to the file, and the last three characters represent rights of everyone else trying to use the file.

So for example, if we have a file which in long format displays: -rw-r–r–, it means it’s an ordinary file (the first ‘-’), the owner of the file can read and write the file, but he can’t execute it, as it’s not an executable file (the ‘rw-’ characters after the initial ‘-’), and the user group and everyone else can only read the file (you can see ‘r–’ sequence repeating twice. If the user group had ‘rwx’ instead of ‘r–’, it would mean they could read, write and execute the file).

Next option for ls is ls -la .. – this will list all of the files, as in a usual command, hidden files are not shown. It will list all files in the parent of the working directory in long format.

### less ###

Less is a command which will display your text file. For example, you’re looking for text file os-release in /etc. You have succesfully found it there with ls /etc, and now you want to read it.

You just use less /etc/os-release.

![](https://news.opensuse.org/wp-content/uploads/2014/06/Screenshot-30.-06.-2014-190252.png)

..and there you go.

How do you control less?

Easy, with your keyboard!

less will display only one page of your text at a time. To go forward one page, you can press **Page Up, or ‘b’**. To go back one page, you can use **Page Down, or space**. Capital **G** will take you to the end of the text file, while ‘**1G**‘ will take you to the beginning of the text. **/characters** will search for characters inside the text (for example, if you write /suse, it will search for occurances of suse inside your text and mark them). n will repeat the last search you performed, and **h** will display all your options (h, as in haalp!).

![](https://news.opensuse.org/wp-content/uploads/2014/06/halp.jpg)

You quit less with the letter q.

### file ###

The file command will show what kind of file is that you’re looking for, be it ASCII text, a jpg image, a bash script etc. As we performed our exercise with /etc/os-release, let’s use it here also.

![](https://news.opensuse.org/wp-content/uploads/2014/06/Screenshot-30.-06.-2014-191402.png)

There you go, os-release is an ASCII text file. Please, do try it out with something else, and see the output.

And until next time, remember to…
 
…have a lot of fun!

--------------------------------------------------------------------------------

via: https://news.opensuse.org/2014/07/01/command-line-tuesdays-part-three/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
