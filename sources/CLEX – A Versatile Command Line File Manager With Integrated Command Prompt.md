CLEX – A Versatile Command Line File Manager With Integrated Command Prompt
===========
Whether you are a system administrator or a normal command line user, hopping between file manager and command line can get frustrating some times. At some time or the other, you tend to look at some command line alternative to the graphical file manager that you use.

Chances are that you’ll find a decent command line manager but that would still require switching between file manager window and your command prompt window. So the question remains, is there a file manager that combines file explorer and command prompt in a single window? The answer is yes and the file manager is **CLEX**.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-main.png)

## CLEX – The Command Line File Manager ##

Clex is a command line based file manager that has a nice little user interface and provides a lot of options for file management. The main advantage of this file manager is that it also provides a command prompt (in the same window) through which you can run regular commands.

**NOTE** – All the examples presented here are tested on Ubuntu 13.04.

**A Brief Tutorial**

Here is the Clex UI when it was first executed on my machine:

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-1.png)

So you can see that all the files and directories in the current working directory (**/home/himanshu/** in this case) were displayed in the upper half of the window. You can use the up and down arrow keys to select a file or a directory and press enter to get inside a directory.

In the lower half of the window, the file manager provides a command line prompt (bash prompt in my case). Any installed command line utility can be executed from here.

For example, to open an image file Ubuntu.png, the arrow keys were used to select it first :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-2.png)

Then, an installed image viewer (gthumb in my case) was used (with Ubuntu.png as argument) through command prompt.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-3.png)

The image viewer program gthumb displayed the image as soon as the complete command was executed.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-4.png)

Besides, Clex also provides a range of other useful options which can be accessed by pressing Alt+M.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-5.png)

So you can use these options to change the current working directory, add bookmarks, view command history, sort file names, compare directories etc.

Here is a snapshot when command history option was used :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-6.png)

Similarly you can use other options as per your requirement.

**NOTE** – Use Alt+q to quit Clex.

**Download/Install**

Here are some of the useful links related to Clex file manager:

- [Home Page](http://www.clex.sk/about.html)
- [Download](http://www.clex.sk/download/)
- [Documentation](http://www.clex.sk/help/file_intro.html)

Ubuntu users can directly download and install this software using Ubuntu Software Centre. The version used for this review was 3.15.

**Pros**

- Integration of file explorer and command line prompt in the same window
- Lots of options like directory comparison, file name sorting, command line history etc
- Good online documentation

**Cons**

- Depends on CURSES library with wide character support. This may cause problems while building from source.
- Has some start-up problems, displays the following warning every-time it is launched :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/clex-warning.png)

**Conclusion**

Clex is certainly a feature rich command line file manager. The integration with command prompt is its USP. Minor hiccups apart, it is a time-saving utility that demands a bit of practice to get used to it.

via:http://mylinuxbook.com/clex-a-versatile-command-line-file-manager/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://mylinuxbook.com/clex-a-versatile-command-line-file-manager/
[2]:http://www.clex.sk/about.html
[3]:http://www.clex.sk/download/
[4]:http://www.clex.sk/help/file_intro.html