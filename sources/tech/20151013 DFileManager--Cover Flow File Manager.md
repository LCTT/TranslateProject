DFileManager: Cover Flow File Manager
================================================================================
A real gem of a file manager absent from the standard Ubuntu repositories but sporting a unique feature. That’s DFileManager in a twitterish statement.

A tricky question to answer is just how many open source Linux applications are available. Just out of curiosity, you can type at the shell:

    ~$ for f in /var/lib/apt/lists/*Packages; do printf ’%5d %s\n’ $(grep ’^Package: ’ “$f” | wc -l) ${f##*/} done | sort -rn

On my Ubuntu 15.04 system, it produces the following results:

![Ubuntu 15.04 Packages](http://www.linuxlinks.com/portal/content/reviews/FileManagers/UbuntuPackages.png)

As the screenshot above illustrates, there are approximately 39,000 packages in the Universe repository, and around 8,500 packages in the main repository. These numbers sound a lot. But there is a smorgasbord of open source applications, utilities, and libraries that don’t have an Ubuntu team generating a package. And more importantly, there are some real treasures missing from the repositories which can only be discovered by compiling source code. DFileManager is one such utility. It is a Qt based cross-platform file manager which is in an early stage of development. Qt provides single-source portability across all major desktop operating systems.

In the absence of a binary package, the user needs to compile the code. For some tools, this can be problematic, particularly if the application depends on any obscure libraries, or specific versions which may be incompatible with other software installed on a system.

### Installation ###

Fortunately, DFileManager is simple to compile. The installation instructions on the developer’s website provide most of the steps necessary for my creaking Ubuntu box, but a few essential packages were missing (why is it always that way however many libraries clutter up your filesystem?) To prepare my system, download the source code from GitHub and then compile the software, I entered the following commands at the shell:

    ~$ sudo apt-get install qt5-default qt5-qmake libqt5x11extras5-dev
    ~$ git clone git://git.code.sf.net/p/dfilemanager/code dfilemanager-code
    ~$ cd dfilemananger-code
    ~$ mkdir build
    ~$ cd build
    ~$ cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    ~$ make
    ~$ sudo make install

You can then start the application by typing at the shell:

    ~$ dfm

Here is a screenshot of DFileManager in action, with the main attraction in full view; the Cover Flow view. This offers the ability to slide through items in the current folder with an attractive feel. It’s ideal for viewing photos. The file manager bears a resemblance to Finder (the default file manager and graphical user interface shell used on all Macintosh operating systems), which may appeal to you.

![DFileManager in action](http://www.linuxlinks.com/portal/content/reviews/FileManagers/Screenshot-dfm.png)

### Features: ###

- 4 views: Icons, Details, Columns, and Cover Flow
- Categorised bookmarks with Places and Devices
- Tabs
- Simple searching and filtering
- Customizable thumbnails for filetypes including multimedia files
- Information bar which can be undocked
- Open folders and files with one click
- Option to queue IO operations
- Remembers some view properties for each folder
- Show hidden files

DFileManager is not a replacement for KDE’s Dolphin, but do give it a go. It’s a file manager that really helps the user browse files. And don’t forget to give feedback to the developer; that’s a contribution anyone can offer.

--------------------------------------------------------------------------------

via: http://gofk.tumblr.com/post/131014089537/dfilemanager-cover-flow-file-manager-a-real-gem

作者：[gofk][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://gofk.tumblr.com/