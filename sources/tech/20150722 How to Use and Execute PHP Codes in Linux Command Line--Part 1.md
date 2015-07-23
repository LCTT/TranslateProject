Translatign by GOLinux!
How to Use and Execute PHP Codes in Linux Command Line – Part 1
================================================================================
PHP is an open source server side scripting Language which originally stood for ‘Personal Home Page‘ now stands for ‘PHP: Hypertext Preprocessor‘, which is a recursive acronym. It is a cross platform scripting language which is highly influenced by C, C++ and Java.

![Run PHP Codes in Linux Command Line](http://www.tecmint.com/wp-content/uploads/2015/07/php-command-line-usage.jpeg)

Run PHP Codes in Linux Command Line – Part 1

A PHP Syntax is very similar to Syntax in C, Java and Perl Programming Language with a few PHP-specific feature. PHP is used by some 260 Million websites, as of now. The current stable release is PHP Version 5.6.10.

PHP is HTML embedded script which facilitates developers to write dynamically generated pages quickly. PHP is primarily used on Server-side (and JavaScript on Client Side) to generate dynamic web pages over HTTP, however you will be surprised to know that you can execute a PHP in a Linux Terminal without the need of a web browser.

This article aims at throwing light on the command-line aspect of PHP scripting Language.

**1. After PHP and Apache2 installation, we need to install PHP command Line Interpreter.**

    # apt-get install php5-cli 			[Debian and alike System)
    # yum install php-cli 				[CentOS and alike System)

Next thing, we do is to test a php (if installed correctly or not) commonly as by creating a file `infophp.php` at location ‘/var/www/html‘ (Apache2 working directory in most of the distros), with the content `<?php phpinfo(); ?>`, simply by running the below command.

    # echo '<?php phpinfo(); ?>' > /var/www/html/infophp.php

and then point your browser to http://127.0.0.1/infophp.php which opens this file in web browser.

![Check PHP Info](http://www.tecmint.com/wp-content/uploads/2015/07/Check-PHP-Info.png)

Check PHP Info

Same results can be obtained from the Linux terminal without the need of any browser. Run the PHP file located at ‘/var/www/html/infophp.php‘ in Linux Command Line as:

    # php -f /var/www/html/infophp.php

![Check PHP info from Commandline](http://www.tecmint.com/wp-content/uploads/2015/07/Check-PHP-info-from-Commandline.png)

Check PHP info from Commandline

Since the output is too big we can pipeline the above output with ‘less‘ command to get one screen output at a time, simply as:

    # php -f /var/www/html/infophp.php | less

![Check All PHP Info](http://www.tecmint.com/wp-content/uploads/2015/07/Check-All-PHP-Info.png)

Check All PHP Info

Here Option ‘-f‘ parse and execute the file that follows the command.

**2. We can use `phpinfo()` which is a very valuable debugging tool directly on the Linux command-line without the need of calling it from a file, simply as:**

    # php -r 'phpinfo();'

![PHP Debugging Tool](http://www.tecmint.com/wp-content/uploads/2015/07/PHP-Debugging-Tool.png)

PHP Debugging Tool

Here the option ‘-r‘ run the PHP Code in the Linux Terminal directly without tags `<` and `>`.

**3. Run PHP in Interactive mode and do some mathematics. Here option ‘-a‘ is for running PHP in Interactive Mode.**

    # php -a
    
    Interactive shell
    
    php > echo 2+3;
    5
    php > echo 9-6;
    3
    php > echo 5*4;
    20
    php > echo 12/3;
    4
    php > echo 12/5;
    2.4
    php > echo 2+3-1;
    4
    php > echo 2+3-1*3;
    2
    php > exit

Press ‘exit‘ or ‘ctrl+c‘ to close PHP interactive mode.

![Enable PHP Interactive Mode](http://www.tecmint.com/wp-content/uploads/2015/07/Enable-PHP-interactive-mode1.png)

Enable PHP Interactive Mode

**4. You can run a PHP script simply as, if it is a shell script. First Create a PHP sample script in your current working directory.**

    # echo -e '#!/usr/bin/php\n<?php phpinfo(); ?>' > phpscript.php

Notice we used #!/usr/bin/php in the first line of this PHP script as we use to do in shell script (/bin/bash). The first line #!/usr/bin/php tells the Linux Command-Line to parse this script file to PHP Interpreter.

Second make it executable as:

    # chmod 755 phpscript.php

and run it as,

    # ./phpscript.php

**5. You will be surprised to know you can create simple functions all by yourself using the interactive shell. Here is the step-by step instruction.**

Start PHP interactive mode.

    # php -a

Create a function and name it addition. Also declare two variables $a and $b.

    php > function addition ($a, $b)

Use curly braces to define rules in between them for this function.

    php > {

Define Rule(s). Here the rule say to add the two variables.

    php { echo $a + $b;

All rules defined. Enclose rules by closing curly braces.

    php {}

Test function and add digits 4 and 3 simply as :

    php > var_dump (addition(4,3));

#### Sample Output ####

    7NULL

You may run the below code to execute the function, as many times as you want with different values. Replace a and b with values of yours.

    php > var_dump (addition(a,b));

----------

    php > var_dump (addition(9,3.3));

#### Sample Output ####

    12.3NULL

![Create PHP Functions](http://www.tecmint.com/wp-content/uploads/2015/07/Create-PHP-Functions.png)

Create PHP Functions

You may run this function till you quit interactive mode (Ctrl+z). Also you would have noticed that in the above output the data type returned is NULL. This can be fixed by asking php interactive shell to return in place of echo.

Simply replace the ‘echo‘ statement in the above function with ‘return‘

Replace

    php { echo $a + $b;

with

    php { return $a + $b;

and rest of the things and principles remain same.

Here is an Example, which returns appropriate data-type in the output.

![PHP Functions](http://www.tecmint.com/wp-content/uploads/2015/07/PHP-Functions.png)

PHP Functions

Always Remember, user defined functions are not saved in history from shell session to shell session, hence once you exit the interactive shell, it is lost.

Hope you liked this session. Keep Connected for more such posts. Stay Tuned and Healthy. Provide us with your valuable feedback in the comments. Like ans share us and help us get spread.

Read Also: [12 Useful PHP Commandline Usage on Linux Terminal – Part 2][1]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/run-php-codes-from-linux-commandline/

作者：[vishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/execute-php-codes-functions-in-linux-commandline/
