How to open a large text file on Linux
================================================================================
In the era of "big data", large text files (GB or more) could be commonly encountered around us. Suppose you somehow need to search and edit one of those big text files by hand. Or you could be analyzing multi-GB log files manually for specific troubleshooting purposes. A typical text editor may not be designed to deal with such large text files efficiently, and may simply get choked while attempting to open a big file, due to insufficient memory.

If you are a savvy system admin, you can probably open or touch an arbitrary text file with a combination of cat, tail, grep, sed, awk, etc. In this tutorial, I will discuss more user-friendly ways to **open (and possibly edit) a large text file on Linux**.

### Vim with LargeFile Plugin ###

Vim text editor boasts of various plugins (or scripts) which can extend Vim's functionality. One such Vim plugin is [LargeFile plugin][1].

The LargeFile plugin allows you to load and edit large files more quickly, by turning off several Vim features such as events, undo, syntax highlighting, etc.

To install the LargeFile plugin on Vim, first make sure that you have Vim installed.

On Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install vim 

On Fedora, CentOS or RHEL:

    $ sudo yum install vim-enhanced 

Then download the LargFile plugin from [Vim website][2]. The latest version of the plugin is 5, and it will be saved in Vimball format (.vba extension).

To install the plugin in your home directory, you can open the .vba file with Vim as follows.

    $ gunzip LargeFile.vba.gz
    $ vim LargeFile.vba 

Enter ":so %" and press ENTER within Vim window to install the plugin in your home directory.

[![](http://farm3.staticflickr.com/2805/11313669824_335e73ebb8_z.jpg)][3]

After this, enter ":q" to quit Vim.

The plugin will be installed at ~/.vim/plugin/LargeFile.vim. Now you can start using Vim as usual.

What this plugin does is to turn off events, undo, syntax highlighting, etc. when a "large" file is loaded on Vim. By default, files bigger than 100MB are considered "large" by the plugin. To change this setting, you can edit ~/.vimrc file (create one if it does not exist).

To change the minimum size of large files to 10MB, add the following entry to ~/.vimrc.

> let g:LargeFile=10

While the LargeFile plugin can help you speed up file loading, Vim itself still cannot handle editing an extremely large file very well, because it tries to load the entire file in memory. For example, when a 1GB file is loaded on Vim, it takes as much memory and swap space, as shown in the top output below.

So if your files are significantly bigger than the physical memory of your Linux system, you can consider other options, as explained below.

### glogg Log Explorer ###

If all you need is "read-only" access to a text file, and you don't have to edit it, you can consider [glogg][4], which is a GUI-based standalone log analyzer. The glogg analyzer supports filtered views of an input text file, based on extended regular expressions and wildcards.

To install glogg on Debian (Wheezy and higher), Ubuntu or Linux Mint:

    $ sudo apt-get install glogg 

To install glogg on Fedora (17 or higher):

    $ sudo yum install glogg 

To open a text file with glogg:

    $ glogg test.log 

glogg can open a large text file pretty fast. It took me around 12 seconds to open a 1GB log file.

[![](http://farm8.staticflickr.com/7354/11313640286_4ebee2b959_z.jpg)][5]

You can enter a regular expression in the "Text" field, and press "Search" button. It supports case-insensitive search and auto-refresh features. After searching, you will see a filtered view at the bottom window.

Compared to Vim, glogg is much more lightweight after a file is loaded. It was using only 83MB of physical memory after loading a 1GB log file.

[![](http://farm3.staticflickr.com/2851/11313594455_d57c700c4b_z.jpg)][6]

### JOE Text Editor ###

[JOE][7] is a light-weight terminal based text editor released under GPL. JOE is one of few text editors with large file support, allows opening and editing files larger than memory.

Besides, JOE supports various powerful text editing features, such as non-destructive editing, search and replace with regular expression, unlimited undo/redo, syntax highlighting, etc.

To install JOE on Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install joe 

To install JOE on Fedora, CentOS or RHEL:

    $ sudo yum install joe 

To open a text file for editing, run:

    $ joe test.log 

[![](http://farm4.staticflickr.com/3684/11317402126_406058bf78_z.jpg)][8]

Loading a large file on JOE is a little bit sluggish, compared to glogg above. It took around 30 seconds to load a 1GB file. Still, that's not too bad, considering that a file is fully editable now. Once a file is loaded, you can start editing a file in terminal mode, which is quite fast.

The memory consumption of JOE is impressive. To load and edit a 1GB text file, it only takes 47MB of physical memory.

[![](http://farm4.staticflickr.com/3728/11317483233_2017b5878b_z.jpg)][9]

If you know any other way to open/edit a large text file on Linux, share your knowledge!

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/12/open-large-text-file-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.vim.org/scripts/script.php?script_id=1506
[2]:http://www.vim.org/scripts/script.php?script_id=1506
[3]:http://www.flickr.com/photos/xmodulo/11313669824/
[4]:http://glogg.bonnefon.org/
[5]:http://www.flickr.com/photos/xmodulo/11313640286/
[6]:http://www.flickr.com/photos/xmodulo/11313594455/
[7]:http://joe-editor.sourceforge.net/
[8]:http://www.flickr.com/photos/xmodulo/11317402126/
[9]:http://www.flickr.com/photos/xmodulo/11317483233/