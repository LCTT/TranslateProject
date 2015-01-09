How to deduplicate files on Linux with dupeGuru
================================================================================
Recently, I was given the task to clean up my father's files and folders. What made it difficult was the abnormal amount of duplicate files with incorrect names. By keeping a backup on an external drive, simultaneously editing multiple versions of the same file, or even changing the directory structure, the same file can get copied many times, change names, change locations, and just clog disk space. Hunting down every single one of them can become a problem of gigantic proportions. Hopefully, there exists nice little software that can save your precious hours by finding and removing duplicate files on your system: [dupeGuru][1]. Written in Python, this file deduplication software switched to a GPLv3 license a few hours ago. So time to apply your new year's resolutions and clean up your stuff!

### Installation of dupeGuru ###

On Ubuntu, you can add the Hardcoded Software PPA:

    $ sudo apt-add-repository ppa:hsoft/ppa
    $ sudo apt-get update 

And then install with:

    $ sudo apt-get install dupeguru-se 

On Arch Linux, the package is present in the [AUR][2].

If you prefer compiling it yourself, the sources are on [GitHub][3].

### Basic Usage of dupeGuru ###

DupeGuru is conceived to be fast and safe. Which means that the program is not going to run berserk on your system. It has a very low risk of deleting stuff that you did not intend to delete. However, as we are still talking about file deletion, it is always a good idea to stay vigilant and cautious: a good backup is always necessary.

Once you took your precautions, you can launch dupeGuru via the command:

    $ dupeguru_se 

You should be greeted by the folder selection screen, where you can add folders to scan for deduplication.

![](https://farm9.staticflickr.com/8596/16199976251_f78b042fba.jpg)

Once you selected your directories and launched the scan, dupeGuru will show its results by grouping duplicate files together in a list.

![](https://farm9.staticflickr.com/8600/16016041367_5ab2834efb_z.jpg)

Note that by default dupeGuru matches files based on their content, and not their name. To be sure that you do not accidentally delete something important, the match column shows you the accuracy of the matching algorithm. From there, you can select the duplicate files that you want to take action on, and click on "Actions" button to see available actions.

![](https://farm8.staticflickr.com/7516/16199976361_c8f919b06e_b.jpg)

The choice of actions is quite extensive. In short, you can delete the duplicates, move them to another location, ignore them, open them, rename them, or even invoke a custom command on them. If you choose to delete a duplicate, you might get as pleasantly surprised as I was by available deletion options.

![](https://farm8.staticflickr.com/7503/16014366568_54f70e3140.jpg)

You can not only send the duplicate files to the trash or delete them permanently, but you can also choose to leave a link to the original file (either using a symlink or a hardlink). In oher words, the duplicates will be erased, and a link to the original will be left instead, saving a lot of disk space. This can be particularly useful if you imported those files into a workspace, or have dependencies based on them. 

Another fancy option: you can export the results to a HTML or CSV file. Not really sure why you would do that, but I suppose that it can be useful if you prefer keeping track of duplicates rather than use any of dupeGuru's actions on them.

Finally, last but not least, the preferences menu will make all your dream about duplicate busting come true.

![](https://farm8.staticflickr.com/7493/16015755749_a9f343b943_z.jpg)

There you can select the criterion for the scan, either content based or name based, and a threshold for duplicates to control the number of results. It is also possible to define the custom command that you can select in the actions. Among the myriad of other little options, it is good to notice that by default, dupeGuru ignores files less than 10KB.

For more information, I suggest that you go check out the [official website][4], which is filled with documention, support forums, and other goodies.

To conclude, dupeGuru is my go-to software whenever I have to prepare a backup or to free some space. I find it powerful enough for advanced users, and yet intuitive to use for newcomers. Cherry on the cake: dupeGuru is cross platform, which means that you can also use it for your Mac or Windows PC. If you have specific needs, and want to clean up music or image files, there exists two variations: [dupeguru-me][5] and [dupeguru-pe][6], which respectively find duplicate audio tracks and pictures. The main difference from the regular version is that it compares beyond file formats and takes into account specific media meta-data like quality and bit-rate.

What do you think of dupeGuru? Would you consider using it? Or do you have any alternative deduplication software to suggest? Let us know in the comments.

--------------------------------------------------------------------------------

via: http://xmodulo.com/dupeguru-deduplicate-files-linux.html

作者：[Adrien Brochard][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/adrien
[1]:http://www.hardcoded.net/dupeguru/
[2]:https://aur.archlinux.org/packages/dupeguru-se/
[3]:https://github.com/hsoft/dupeguru
[4]:http://www.hardcoded.net/dupeguru/
[5]:http://www.hardcoded.net/dupeguru_me/
[6]:http://www.hardcoded.net/dupeguru_pe/