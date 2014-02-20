翻译ing Luoxcat
Linux touch command - Why do we need to change Timestamp?
================================================================================
We may use touch command in Linux to create an empty file. Of course we can use another command such as vi, nano or any editing tools to do it. But you may need more steps do it. But do know it that the main function of touch command is not create an empty file?

### What is touch command ###

As we know, every file has timestamp attached to it. This time stamp is access time and modification time. Touch command is a command for file access and modification time.

### Why we need touch ###

Since touch command description is to change timestamp, we may wonder why do we need to change timestamp? This question also comes to our mind. But then, we think there is a reason why we need it. If you are participating in open source projects over sea, then timestamp may become important. Compiling a source code files may need a same region of timestamp. If not, the program may failed to compiled.

### Run touch without options ###

To use touch command is quite simple. Just type :

    $ touch file_name

Please take a look a screenshot below.

![Touch command](http://linoxide.com/wp-content/uploads/2014/01/touch.png)

**File_1.txt** originally has timestamp 12:42. After we do touch command, it changed to 17:08. By default, touch will change the file timestamp into current time.

### Change only Access time ###

As we mention before that every file has Access time and Modify time attached to the file. File_1.txt above has timestamp 17:08. We can see more detail about it.

![Detail timestamp](http://linoxide.com/wp-content/uploads/2014/01/touch_stat.png)

We see that **Access** time and **Modify** time has the same value which is 17:08:35 and the timezone is GMT +7.

Now if we want to change only the Access time, we need to use **-a** option.

    $ touch -a file_1.txt

![Touch -a option](http://linoxide.com/wp-content/uploads/2014/01/touch_a.png)

As you see, the **Access time is changed** into 17:51:37 but the **Change time is still** 17:08:35

### Change only Modify time ###

To do this, we can use **-m** option. Now we will use **file_2.txt** as an example.

![File_2.txt detail timestamp](http://linoxide.com/wp-content/uploads/2014/01/touch_stat_file_2.png)

    $ touch -m file_2.txt

![Touch -m option](http://linoxide.com/wp-content/uploads/2014/01/touch_m.png)

Now the **Modify time is change from 12:42:20 to 17:57:20. Please note**, that the Change field value will always keep record when the file is accessed or modified.

### Change into custom timestamp ###

Both -**a and -m** option will change the file timestamp into current time. We can also possible to change it into custom timestamp. To do this, use **-t** option.

From file_2.txt above example, we knew that its time stamp are :

    12:42:20 for Access time
    17:57:20 for Modify time
    2014-01-14 for the date

Let say we want to change it into **09:58:27** for **both Access time and Modify time and 12 January 2014**. To do this, we can use this command :

    $ touch -t 201401120958.27 file_2.txt

![Touch using -t option](http://linoxide.com/wp-content/uploads/2014/01/touch_t.png)

**-t** option is consist of :

#### [[CC]YY]MMDDhhmm [.SS] ####

    CC - The first two digits of the year
    YY - The second two digits of the year
    MM - The month of the year [01-12]
    DD - The day of the month [01-31]
    hh - The hour of the day [00-23]
    mm - The minute of the hour [00-59]
    SS - The second of the minute [00-61]

### Another way to change date and time ###

If you feel that the **[[CC]YY]MMDDhhmm [.SS]** format is not comfortable for you, we can use -d option. Here’s an example how to use **-d** option.

#### Change the date to specific date ####

For example we have file named file_3.txt with attributes as shown in the picture below.

![File_3.txt detail timestamp](http://linoxide.com/wp-content/uploads/2014/01/stat_file_3.png)

Now **we want to change the date** from 14 January 2014 to 10 December 2013. We can use with this command :

    $ touch -d ‘10-December-2013’ file_3.txt

![Change date using -d option](http://linoxide.com/wp-content/uploads/2014/01/touch_d_date.png)

We see now that the date for Access and Modify entries is changed into 10 December 2013.

### Change the timezone ###

If we want to change it into time in specific GMT, we can also use with **-d** option. Let’s return the file_3.txt into the current time.

    $ touch file_3.txt

![Reset file_3.txt timestamp](http://linoxide.com/wp-content/uploads/2014/01/touch_return_file_3.png)

We can see that file_3.txt has GMT +0700 timezone. To change it into GMT3 timezone, we can use this command.

    $ touch -d GMT3 file_3.txt

![Change into GMT3 timezone](http://linoxide.com/wp-content/uploads/2014/01/touch_gmt3.png)

Now the time is change into 10:00:00 AM

### Combining values using -d option ###

There is something cool using **-d** option. Please take a look at the picture below.

![Change date using keyword](http://linoxide.com/wp-content/uploads/2014/01/touch_next_sunday.png)

We can use the word ‘**next Sunday**’ and combine it with GMT 3 values, and touch command can still recognize it. The date is changed into 21 January 2014, where the current date is 14 January 2014.

Here’s another example of **-d** option.
First, we reset file_3.txt into current date and time.

    $ touch file_3.txt

![Reset file_3.txt timestamp](http://linoxide.com/wp-content/uploads/2014/01/touch_reset_file_3.png)

Then we do this command :

    $ touch -d ‘1 year ago 13:43:07’ file_3.txt

![Change date using keyword](http://linoxide.com/wp-content/uploads/2014/01/touch_d_year_ago.png)

Touch even recognize a word ‘**1 year ago**’. The date and time is now changed into 14 January 2013 and 13:43:07 time.

### Create an empty file ###

When you run touch command and the destination file is not exist, then touch will create an empty file with the same name.

    $ touch file_10.txt

![Create an empty file](http://linoxide.com/wp-content/uploads/2014/01/touch_file_10.png)

### Create multiple files at the same time ###

To create multiple files, you can put the file names separated by space.

    $ touch doc_10.txt doc_20.txt doc_30.txt

![Create multiple files](http://linoxide.com/wp-content/uploads/2014/01/touch_multiple_files.png)

### Conclusion ###

Touch will useful for you if you are dealing with a timestamp of files and directories. As usual you can always type **man touch** or **touch --help** to display its manual page to explore more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-touch-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
