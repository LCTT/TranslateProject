                            Luox　翻译


How to Repack Deb Files on Debian and Ubuntu
================================================================================
**The following tutorial will teach Ubuntu, Linux Mint and Debian GNU/Linux users how to easily unpack and repack a .deb file on their Debian-based Linux operating system.**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Repack-Deb-Files-on-Debian-and-Ubuntu-404930-2.jpg)

Once in a while you reach a moment in life when, among other things, you want to modify a .deb file, to change something in it and repackage it back. But, only if you are truly into computing and hacking.

The following example is a true story, as it happen to me a while ago. A Linux developer created a Debian package (.deb) for a software, which I’ve install on my Ubuntu powered computer with success.

Apparently, the software did not worked correctly, as it was always stuck when it tried to retrieve some files from a Git repository. So, I knew where the files where installed (in the /opt directory), I’ve searched the code, found the issue and repair it in place. After that, the program was no longer stuck when it tried to retrieve the packages it needed.

So, long story short, I wanted to unpack the .deb file, replace the file I’ve patched in it, and repackage it back so I can install it on other computers or give it to my friends. How do I do that?

After searching the Internet for an answer to my problem, I’ve found a small blog called [ailoo.net][1] where it was explained like this:

    mkdir -p extract/DEBIAN
    dpkg-deb -x package.deb extract/
    dpkg-deb -e package.deb extract/DEBIAN [...do something, e.g. edit the control file...]
    mkdir build
    dpkg-deb -b extract/ build/

These five commands will do the job like a charm. Let me explain them to you: the first one creates a folder called “extract” and a subfolder called “DEBIAN”; the second command will extract some files from your .deb package in the “extract” folder; the third command will extract the content of the .deb package in the “DEBIAN” subfolder, where you can modify/patch the files you want; the fourth command will create a folder called “build”; and the fifth command will repack the modified files into a new .deb package, which will be generated in the “build” folder.

That’s it! Just remember to stick with the commands above, and modify the files visually with a graphical text editor via your default file manager, after you’ve executed the third command. Do not hesitate to comment below if you run into problems during this tutorial.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Repack-Deb-Files-on-Debian-and-Ubuntu-404930.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ailoo.net/2009/06/repack-a-deb-archive-with-dpkg-deb/
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
