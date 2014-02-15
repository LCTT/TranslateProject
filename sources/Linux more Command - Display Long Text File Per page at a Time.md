zpl1025
Linux more Command - Display Long Text File Per page at a Time
================================================================================
If you are used to working with Linux, you will find a lot of file text in Linux world. Configuration files and log files are usually kept in text format. But those file are usually have long content. You can not view them all in one page. So we need to to pagination to those file. And to do that, we can use **more** command.

### What is more command ###

More command is a command for displaying a long text file per page at a time. More command is a built-in command in Linux.

### How to use more ###

To use more command, we just need to type :

    $ more file_name

For example we want to see the content of syslog file located in /var/log directory. We can type :

    $ more /var/log/syslog

![More command](http://linoxide.com/wp-content/uploads/2014/01/more.png)

We see that **an indicator on the bottom left**. It show us number 0%. It means that the file is long enough, so the first page is 0% of the total page. To scroll down, use space button. Then we see that the indicator number is increased.

![Scroll page](http://linoxide.com/wp-content/uploads/2014/01/more_2.png)

### Limit lines per page ###

When you run more command, it will fill your screen with the content of the file you are seeing using more. You can limit it into some lines for each page. To do this you can use **-num option**.

For example, you want to **limit the lines only 12 lines** for each page. Then you can type :

    $ more -12 /var/log/syslog

![Limit 12 lines only](http://linoxide.com/wp-content/uploads/2014/01/more_12.png)

Now it will limit 12 lines per page. When you press spacebar to scroll down, it will show you more 12 lines.

### Display user message ###

As we knew, more will display an indicator at the bottom left to show our position in percentage. For those who run more at the first time, he/she may guess how to scroll the page down. To avoid this, we can use **-d** option that will make more command display a user message like this “[**Press space to continue, ‘q’ to quit.**]” .

![More with -d option](http://linoxide.com/wp-content/uploads/2014/01/more_d1.png)

If user press a button other than button **‘space’ and ‘q’** , then more will display a warning message **“[Press ‘h’ for instructions.]”** .

![More displaying help message](http://linoxide.com/wp-content/uploads/2014/01/more_d2.png)

If you press h button, it will display a help message :

![Display help](http://linoxide.com/wp-content/uploads/2014/01/more_dh.png)

One of the interesting command is the **b** button. **b button allow you** to go back to previous page. In other word, b button allow you **to scroll up**.

You can know that you are in the previous page from the line **…backup 1** page at the top left area.

![Scroll up on More](http://linoxide.com/wp-content/uploads/2014/01/more_back.png)

### Suppress scroll ###

With **-c** option, more will not scroll the page. It will clear the previous page and put the next page or lines there.

    $ more -10 -c lynis.log

![Suppress scroll](http://linoxide.com/wp-content/uploads/2014/01/more_c.png)

If you press space button, the next page or lines is still at the same size.

![Suppress scroll](http://linoxide.com/wp-content/uploads/2014/01/more_c2.png)

### Squeeze multiple blank lines ###

To squeeze it, we can use **-s** option. Here’s a sample :

![File with blank lines](http://linoxide.com/wp-content/uploads/2014/01/more_s.png)

When we add **-s** option :

    $ more -s doc_30.txt

![Squeeze blank lines](http://linoxide.com/wp-content/uploads/2014/01/more_s2.png)

### Search string ###

If your log file is long enough, it’s not easy to find a string that you want. Search string can help you. Using **+/string** can search a string for you and put the keyword on the beginning of the line. Let say we want to search “**dhclient**” in **/var/logs/syslog** file. Then the syntax is :

    $ more +/dhclient /var/log/syslog

![Search string](http://linoxide.com/wp-content/uploads/2014/01/more_string.png)

Then to continue the search on the next line, you can press **/ button** following by dhclient word.

### Display content start with specific line ###

You can also display a content of file start with specific line using **+num** option. For example we have a file with 15 lines inside it.

![Multiple lines file](http://linoxide.com/wp-content/uploads/2014/01/more_num1.png)

Then we want to display a file named doc_30.txt starting from the line number 5. The command will be like this :

    $ more +5 doc_30.txt

![Start with specific lines](http://linoxide.com/wp-content/uploads/2014/01/more_num2.png)

### Can we use it to display binary file? ###

**The answer is No**. More will give you a message about this. Here’s a sample.

![Displaying binary file](http://linoxide.com/wp-content/uploads/2014/01/more_binary.png)

### Conclusion ###

More is one of the basic tool to display a content of text file. More can not be used to display binary file. As usual, we can always type **man more** or **more --help** to explore more detail about the usage of more command.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-more-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
