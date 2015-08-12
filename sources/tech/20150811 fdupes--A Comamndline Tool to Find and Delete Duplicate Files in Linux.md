fdupes – A Comamndline Tool to Find and Delete Duplicate Files in Linux
================================================================================
It is a common requirement to find and replace duplicate files for most of the computer users. Finding and removing duplicate files is a tiresome job that demands time and patience. Finding duplicate files can be very easy if your machine is powered by GNU/Linux, thanks to ‘**fdupes**‘ utility.

![Find and Delete Duplicate Files in Linux](http://www.tecmint.com/wp-content/uploads/2015/08/find-and-delete-duplicate-files-in-linux.png)

Fdupes – Find and Delete Duplicate Files in Linux

### What is fdupes? ###

**Fdupes** is a Linux utility written by **Adrian Lopez** in C programming Language released under MIT License. The application is able to find duplicate files in the given set of directories and sub-directories. Fdupes recognize duplicates by comparing MD5 signature of files followed by a byte-to-byte comparison. A lots of options can be passed with Fdupes to list, delete and replace the files with hardlinks to duplicates.

The comparison starts in the order:

**size comparison > Partial MD5 Signature Comparison > Full MD5 Signature Comparison > Byte-to-Byte Comparison.**

### Install fdupes on a Linux ###

Installation of latest version of fdupes (fdupes version 1.51) as easy as running following command on **Debian** based systems such as **Ubuntu** and **Linux Mint**.

    $ sudo apt-get install fdupes

On CentOS/RHEL and Fedora based systems, you need to turn on [epel repository][1] to install fdupes package.

    # yum install fdupes
    # dnf install fdupes    [On Fedora 22 onwards]

**Note**: The default package manager yum is replaced by dnf from Fedora 22 onwards…

### How to use fdupes command? ###

1. For demonstration purpose, let’s a create few duplicate files under a directory (say tecmint) simply as:

    $ mkdir /home/"$USER"/Desktop/tecmint && cd /home/"$USER"/Desktop/tecmint && for i in {1..15}; do echo "I Love Tecmint. Tecmint is a very nice community of Linux Users." > tecmint${i}.txt ; done

After running above command, let’s verify the duplicates files are created or not using ls [command][2].

    $ ls -l
    
    total 60
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint10.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint11.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint12.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint13.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint14.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint15.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint1.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint2.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint3.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint4.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint5.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint6.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint7.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint8.txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint9.txt

The above script create **15** files namely tecmint1.txt, tecmint2.txt…tecmint15.txt and every files contains the same data i.e.,

    "I Love Tecmint. Tecmint is a very nice community of Linux Users."

2. Now search for duplicate files within the folder **tecmint**.

    $ fdupes /home/$USER/Desktop/tecmint 
    
    /home/tecmint/Desktop/tecmint/tecmint13.txt
    /home/tecmint/Desktop/tecmint/tecmint8.txt
    /home/tecmint/Desktop/tecmint/tecmint11.txt
    /home/tecmint/Desktop/tecmint/tecmint3.txt
    /home/tecmint/Desktop/tecmint/tecmint4.txt
    /home/tecmint/Desktop/tecmint/tecmint6.txt
    /home/tecmint/Desktop/tecmint/tecmint7.txt
    /home/tecmint/Desktop/tecmint/tecmint9.txt
    /home/tecmint/Desktop/tecmint/tecmint10.txt
    /home/tecmint/Desktop/tecmint/tecmint2.txt
    /home/tecmint/Desktop/tecmint/tecmint5.txt
    /home/tecmint/Desktop/tecmint/tecmint14.txt
    /home/tecmint/Desktop/tecmint/tecmint1.txt
    /home/tecmint/Desktop/tecmint/tecmint15.txt
    /home/tecmint/Desktop/tecmint/tecmint12.txt

3. Search for duplicates recursively under every directory including it’s sub-directories using the **-r** option.

It search across all the files and folder recursively, depending upon the number of files and folders it will take some time to scan duplicates. In that mean time, you will be presented with the total progress in terminal, something like this.

    $ fdupes -r /home
    
    Progress [37780/54747] 69%

4. See the size of duplicates found within a folder using the **-S** option.

    $ fdupes -S /home/$USER/Desktop/tecmint
    
    65 bytes each:                          
    /home/tecmint/Desktop/tecmint/tecmint13.txt
    /home/tecmint/Desktop/tecmint/tecmint8.txt
    /home/tecmint/Desktop/tecmint/tecmint11.txt
    /home/tecmint/Desktop/tecmint/tecmint3.txt
    /home/tecmint/Desktop/tecmint/tecmint4.txt
    /home/tecmint/Desktop/tecmint/tecmint6.txt
    /home/tecmint/Desktop/tecmint/tecmint7.txt
    /home/tecmint/Desktop/tecmint/tecmint9.txt
    /home/tecmint/Desktop/tecmint/tecmint10.txt
    /home/tecmint/Desktop/tecmint/tecmint2.txt
    /home/tecmint/Desktop/tecmint/tecmint5.txt
    /home/tecmint/Desktop/tecmint/tecmint14.txt
    /home/tecmint/Desktop/tecmint/tecmint1.txt
    /home/tecmint/Desktop/tecmint/tecmint15.txt
    /home/tecmint/Desktop/tecmint/tecmint12.txt

5. You can see the size of duplicate files for every directory and subdirectories encountered within using the **-S** and **-r** options at the same time, as:

    $ fdupes -Sr /home/avi/Desktop/
    
    65 bytes each:                          
    /home/tecmint/Desktop/tecmint/tecmint13.txt
    /home/tecmint/Desktop/tecmint/tecmint8.txt
    /home/tecmint/Desktop/tecmint/tecmint11.txt
    /home/tecmint/Desktop/tecmint/tecmint3.txt
    /home/tecmint/Desktop/tecmint/tecmint4.txt
    /home/tecmint/Desktop/tecmint/tecmint6.txt
    /home/tecmint/Desktop/tecmint/tecmint7.txt
    /home/tecmint/Desktop/tecmint/tecmint9.txt
    /home/tecmint/Desktop/tecmint/tecmint10.txt
    /home/tecmint/Desktop/tecmint/tecmint2.txt
    /home/tecmint/Desktop/tecmint/tecmint5.txt
    /home/tecmint/Desktop/tecmint/tecmint14.txt
    /home/tecmint/Desktop/tecmint/tecmint1.txt
    /home/tecmint/Desktop/tecmint/tecmint15.txt
    /home/tecmint/Desktop/tecmint/tecmint12.txt
    
    107 bytes each:
    /home/tecmint/Desktop/resume_files/r-csc.html
    /home/tecmint/Desktop/resume_files/fc.html

6. Other than searching in one folder or all the folders recursively, you may choose to choose in two folders or three folders as required. Not to mention you can use option **-S** and/or **-r** if required.

    $ fdupes /home/avi/Desktop/ /home/avi/Templates/

7. To delete the duplicate files while preserving a copy you can use the option ‘**-d**’. Extra care should be taken while using this option else you might end up loosing necessary files/data and mind it the process is unrecoverable.

    $ fdupes -d /home/$USER/Desktop/tecmint
    
    [1] /home/tecmint/Desktop/tecmint/tecmint13.txt
    [2] /home/tecmint/Desktop/tecmint/tecmint8.txt
    [3] /home/tecmint/Desktop/tecmint/tecmint11.txt
    [4] /home/tecmint/Desktop/tecmint/tecmint3.txt
    [5] /home/tecmint/Desktop/tecmint/tecmint4.txt
    [6] /home/tecmint/Desktop/tecmint/tecmint6.txt
    [7] /home/tecmint/Desktop/tecmint/tecmint7.txt
    [8] /home/tecmint/Desktop/tecmint/tecmint9.txt
    [9] /home/tecmint/Desktop/tecmint/tecmint10.txt
    [10] /home/tecmint/Desktop/tecmint/tecmint2.txt
    [11] /home/tecmint/Desktop/tecmint/tecmint5.txt
    [12] /home/tecmint/Desktop/tecmint/tecmint14.txt
    [13] /home/tecmint/Desktop/tecmint/tecmint1.txt
    [14] /home/tecmint/Desktop/tecmint/tecmint15.txt
    [15] /home/tecmint/Desktop/tecmint/tecmint12.txt
    
    Set 1 of 1, preserve files [1 - 15, all]: 

You may notice that all the duplicates are listed and you are prompted to delete, either one by one or certain range or all in one go. You may select a range something like below to delete files files of specific range.

    Set 1 of 1, preserve files [1 - 15, all]: 2-15
    
       [-] /home/tecmint/Desktop/tecmint/tecmint13.txt
       [+] /home/tecmint/Desktop/tecmint/tecmint8.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint11.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint3.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint4.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint6.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint7.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint9.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint10.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint2.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint5.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint14.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint1.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint15.txt
       [-] /home/tecmint/Desktop/tecmint/tecmint12.txt

8. From safety point of view, you may like to print the output of ‘**fdupes**’ to file and then check text file to decide what file to delete. This decrease chances of getting your file deleted accidentally. You may do:

    $ fdupes -Sr /home > /home/fdupes.txt

**Note**: You may replace ‘**/home**’ with the your desired folder. Also use option ‘**-r**’ and ‘**-S**’ if you want to search recursively and Print Size, respectively.

9. You may omit the first file from each set of matches by using option ‘**-f**’.

First List files of the directory.

    $ ls -l /home/$USER/Desktop/tecmint
    
    total 20
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint9 (3rd copy).txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint9 (4th copy).txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint9 (another copy).txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint9 (copy).txt
    -rw-r--r-- 1 tecmint tecmint 65 Aug  8 11:22 tecmint9.txt

and then omit the first file from each set of matches.

    $ fdupes -f /home/$USER/Desktop/tecmint
    
    /home/tecmint/Desktop/tecmint9 (copy).txt
    /home/tecmint/Desktop/tecmint9 (3rd copy).txt
    /home/tecmint/Desktop/tecmint9 (another copy).txt
    /home/tecmint/Desktop/tecmint9 (4th copy).txt

10. Check installed version of fdupes.

    $ fdupes --version
    
    fdupes 1.51

11. If you need any help on fdupes you may use switch ‘**-h**’.

    $ fdupes -h
    
    Usage: fdupes [options] DIRECTORY...
    
     -r --recurse     	for every directory given follow subdirectories
                      	encountered within
     -R --recurse:    	for each directory given after this option follow
                      	subdirectories encountered within (note the ':' at
                      	the end of the option, manpage for more details)
     -s --symlinks    	follow symlinks
     -H --hardlinks   	normally, when two or more files point to the same
                      	disk area they are treated as non-duplicates; this
                      	option will change this behavior
     -n --noempty     	exclude zero-length files from consideration
     -A --nohidden    	exclude hidden files from consideration
     -f --omitfirst   	omit the first file in each set of matches
     -1 --sameline    	list each set of matches on a single line
     -S --size        	show size of duplicate files
     -m --summarize   	summarize dupe information
     -q --quiet       	hide progress indicator
     -d --delete      	prompt user for files to preserve and delete all
                      	others; important: under particular circumstances,
                      	data may be lost when using this option together
                      	with -s or --symlinks, or when specifying a
                      	particular directory more than once; refer to the
                      	fdupes documentation for additional information
     -N --noprompt    	together with --delete, preserve the first file in
                      	each set of duplicates and delete the rest without
                      	prompting the user
     -v --version     	display fdupes version
     -h --help        	display this help message

That’s for all now. Let me know how you were finding and deleting duplicates files till now in Linux? and also tell me your opinion about this utility. Put your valuable feedback in the comment section below and don’t forget to like/share us and help us get spread.

I am working on another utility called **fslint** to remove duplicate files, will soon post and you people will love to read.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/fdupes-find-and-delete-duplicate-files-in-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[2]:http://www.tecmint.com/15-basic-ls-command-examples-in-linux/