12 Useful PHP Commandline Usage Every Linux User Must Know
================================================================================
In my last post “[How to Use and Execute PHP Codes in Linux Command – line][1]”, I emphasized on running PHP codes directly in Linux Command-line as well as executing PHP script file in Linux Terminal.

![Run PHP Codes in Linux Commandline](http://www.tecmint.com/wp-content/uploads/2015/07/Run-PHP-Codes-in-Linux-Commandline.jpeg)

Run PHP Codes in Linux Commandline – Part 2

This post aims at making you aware of a few awesome features of PHP usage in Linux terminal.

Let us configure a few `php.ini` settings in the PHP interactive shell.

**6. Set PHP Command-line Prompt**

To set PHP command-line prompt, you need to start a PHP interactive shell from the Linux terminal using following php -a (enabling PHP Interactive mode) command.

    $ php -a

and then set anything (say Hi Tecmint ::) as PHP interactive shell command prompt, simply as:

    php > #cli.prompt=Hi Tecmint ::

![Enable PHP Interactive Shell](http://www.tecmint.com/wp-content/uploads/2015/07/Enable-PHP-Interactive-Shell.png)

Enable PHP Interactive Shell

Also you can set current time as your command Line Prompt, simply as:

    php > #cli.prompt=`echo date('H:m:s');` >
    
    22:15:43 >

**7. Produce one screen output at a time**

In our last article, we have used ‘less‘ command over a lots of places pipelined with original command. We did this to get one screen of output where output could not fit on one screen. But we can configure php.ini file to set pager value to less to produce one screen output at a time simply as,

    $ php -a
    php > #cli.pager=less

![Fix PHP Screen Output](http://www.tecmint.com/wp-content/uploads/2015/07/Fix-PHP-Screen-Output.png)

Fix PHP Screen Output

So, next time when you run a command (say debugger `phpinfo();`) where the output is too big to fit a screen, it will automatically produce output that fits your current.

    php > phpinfo();

![PHP Info Output](http://www.tecmint.com/wp-content/uploads/2015/07/PHP-Info-Output.png)

PHP Info Output

**8. Suggestions and TAB completion**

PHP shell is a smart enough to show you suggestions and TAB Completion. You can use TAB key to use this feature. If more than one option is available for the string that you want to TAB completion, you have to use TAB key twice, else use it once.

In-case of more than one possibility, use TAB twice.

    php > ZIP [TAB] [TAB]

In-case of single possibility, use TAB once.

    php > #cli.pager [TAB]

You can keep pressing TAB for options till values of option are satisfied. All the activities are logged to file `~/.php-history`.

To check your PHP interactive shell activity log, you may run:

    $ nano ~/.php_history | less

![Check PHP Interactive Shell Logs](http://www.tecmint.com/wp-content/uploads/2015/07/Check-PHP-Interactive-Shell-Logs.png)

Check PHP Interactive Shell Logs

**9. You can use color inside PHP interactive shell. All you need to know are the color codes.**

Use echo to print the output into various colors, simply as:

    php > echo “color_code1 TEXT second_color_code”;

or a more explaining example is:

    php > echo "\033[0;31m Hi Tecmint \x1B[0m";

![Enable Colors in PHP Shell](http://www.tecmint.com/wp-content/uploads/2015/07/Enable-Colors-in-PHP-Shell.png)

Enable Colors in PHP Shell

We have seen till now that pressing the return key means execute the command, however semicolon at the end of each command in Php shell is compulsory.

**10. Basename in php shell prints the trailing name component of path**

The basename function in php shell prints the trailing name component from a given string containing the path to a file or directory.

basename() example #1 and #2.

    php > echo basename("/var/www/html/wp/wp-content/plugins");
    php > echo basename("www.tecmint.com/contact-us.html");

The above both examples will output:

    plugins
    contact-us.html

![Print Base Name in PHP](http://www.tecmint.com/wp-content/uploads/2015/07/Print-Base-Name-in-PHP.png)

Print Base Name in PHP

**11. You may create a file (say test1.txt) using php interactive shell at your Desktop, simply as**

    $ touch("/home/avi/Desktop/test1.txt");

We have already seen how fine PHP interactive shell is in Mathematics, Here are a few more examples to stun you.

**12. Print the length of a string say tecmint.com using PHP interactive shell**

strlen function used to get a length of the given string.

    php > echo strlen("tecmint.com");

![Print Length String in PHP](http://www.tecmint.com/wp-content/uploads/2015/07/Print-Length-String-in-PHP.png)

Print Length String in PHP

**13. PHP Interactive shell can sort an array. Yes you heard it right**

Declare Variable a and set it’s value to array(7,9,2,5,10).

    php > $a=array(7,9,2,5,10);

Sort the numbers in the array.

    php > sort($a);

Print numbers of the array in sorted order along with their order. The first one is [0].

    php > print_r($a);
    Array
    (
        [0] => 2
        [1] => 5
        [2] => 7
        [3] => 9
        [4] => 10
    )

![Sort Arrays in PHP](http://www.tecmint.com/wp-content/uploads/2015/07/Sort-Arrays-in-PHP.png)

Sort Arrays in PHP

**14. Get the value of Pi in PHP Interactive Shell**

    php > echo pi();
    
    3.1415926535898

**15. Print the square root of a number say 32**

    php > echo sqrt(150);
    
    12.247448713916

**16. Echo a random number from the range be 0-10**

    php > echo rand(0, 10);

![Get Random Number in PHP](http://www.tecmint.com/wp-content/uploads/2015/07/Get-Random-Number-in-PHP.png)

Get Random Number in PHP

**17. Get md5sum and sha1sum for a given string For example, let’s check the md5sum and sha1sum of a string (say avi) on php shell and cross check the result with those md5sum and sha1sum generated by bash shell.**

    php > echo md5(avi);
    3fca379b3f0e322b7b7967bfcfb948ad
    
    php > echo sha1(avi);
    8f920f22884d6fea9df883843c4a8095a2e5ac6f

----------

    $ echo -n avi | md5sum
    3fca379b3f0e322b7b7967bfcfb948ad  -
    
    $ echo -n avi | sha1sum
    8f920f22884d6fea9df883843c4a8095a2e5ac6f  -

![Check md5sum and sha1sum in PHP](http://www.tecmint.com/wp-content/uploads/2015/07/Check-md5sum-and-sha1sum.png)

Check md5sum and sha1sum in PHP

This is just a glimpse of what can be achieved from a PHP Shell and how interactive is PHP shell. That’s all for now from me. Keep Connected to tecmint. Provide us with your valuable feedback in the comments. Like and share us to get spread.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/execute-php-codes-functions-in-linux-commandline/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/run-php-codes-from-linux-commandline/