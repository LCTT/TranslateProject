Mike Translating

Practical Interview Questions and Answers on Linux Shell Scripting
================================================================================
With the overwhelming response we are getting on the Interview Series articles, the first of its kind on any Linux How-to website in the form of Likes, Feedbacks in comment as well as on personal Email Address make us going from one article to the next article.

Here is the link to the [Interview Series][1] articles already published on Tecmint.com, where we have covered lots of topics viz., FTP, MySQL, Apache, Scripting, Linux Commands, etc.

![Practical Interview Question on Shell Scripting](http://www.tecmint.com/wp-content/uploads/2014/06/Interview-Questions-on-Shell-Scripting.png)
Practical Interview Question on Shell Scripting

Continuing to the above series here we are coming with another 5 wonderful Linux Interview Questions and their answer. Your (The Tecmint.com Readers and frequent Visitors) support is always needed to make it successful.

### 1. Write a shell script to get current date, time, user name and current working directory. ###

> **Answer** : The commands logname, date, who I am and pwd will output username, current date and time, and current working directory. Just implementing these commands in the script and making it a bit interactive.

Now create a file called ‘**userstats.sh**‘ and add the following code to it.

    #!/bin/bash 
    echo "Hello, $LOGNAME" 
    echo "Current date is `date`" 
    echo "User is `who i am`" 
    echo "Current directory `pwd`"

Place execute permission and run the script as shown below.

    # chmod 755 userstats.sh 
    # ./userstats.sh

#### Sample Output ####

    Hello, avi 
    Current date is Sat Jun  7 13:05:29 IST 2014 
    User is avi      pts/0        2014-06-07 11:59 (:0) 
    Current directory /home/avi/Desktop

### 2. Write a Shell Script that adds two numbers if provided as the command Line Argument and if the two numbers are not entered it outputs an Error Message along with a one-Line of how-to use description. ###

> **Answer** : Here is the simple Shell Script along with description which adds two number if provided as Command-Line argument, if not it throws error with single line on how to use the script.

Again create a file called ‘**two-numbers.sh**‘ and add the following content to it.

    #!/bin/bash 
    # The Shebang
    
    if [ $# -ne 2 ] 
    # If two Inputs are not received from Standard Input
    
    then 
    # then execute the below statements
    
        echo "Usage - $0   x    y" 
        # print on standard output, how-to use the script (Usage - ./1.sh   x    y )
    
        echo "        Where x and y are two nos for which I will print sum" 
        # print on standard output, “Where x and y are two nos for which I will print sum ”
    
        exit 1 
        # Leave shell in Error Stage and before the task was successfully carried out.
    
    fi 
    # End of the if Statement.
    
        echo "Sum of $1 and $2 is `expr $1 + $2`"
        # If the above condition was false and user Entered two numbers as a command Line Argument,   
           it will show the sum of the entered numbers.

Set executer permission on the file and run the script as shown below.

    # chmod 755 two-numbers.sh

**Condition 1**: Running the script without entering two numbers as command line argument, you will get the following output.

#### Sample Output ####

    # ./two-numbers.sh
    
    Usage - ./two-numbers.sh   x    y 
            Where x and y are two nos for which I will print sum

**Condition 2**: When Numbers are entered as command line argument you will get the result as shown.

    $ ./two-numbers.sh 4 5 
    
    Sum of 4 and 5 is 9

Hence the above shell script fulfills the condition as suggested in the question.

### 3. You needs to print a given Number say 10572, in reverse order using a Shell script such that the input is provided using command Line Argument only. If the input data is not provided as Command Line Argument, it should throw and error and should suggest, how to use the script. Write the script but before that tell me the algorithm that needs to be implemented here. ###

#### Algorithm ####

1. Let the Input Number = n
1. Set rev=0, sd=0 (Reverse and single digitis set to 0)
1. n % 10, will find and give single left most digit
1. reverse number is generated as rev * 10 + sd
1. Decrease Input Number (n) by 1.
1. if n > 0, then goto step 3 else goto setp 7
1. Print rev

Now again, create a file called ‘**numbers.sh**‘ and add the following given code it.

    #!/bin/bash 
    if [ $# -ne 1 ] 
    then 
        echo "Usage: $0   number" 
        echo "       I will find reverse of given number" 
        echo "       For eg. $0 0123, I will print 3210" 
        exit 1 
    fi 
    
    n=$1 
    rev=0 
    sd=0 
    
    while [ $n -gt 0 ] 
    do 
        sd=`expr $n % 10` 
        rev=`expr $rev \* 10  + $sd` 
        n=`expr $n / 10` 
    done 
        echo  "Reverse number is $rev"

Grant a execute permission on the file and run the script as shown below.

    # chmod 755 numbers.h

**Condition 1**: When Input is not provided as command line argument, you will get the following output.

#### Sample Output ####

    ./numbers.sh
    
    Usage: ./numbers.sh  number 
           I will find reverse of given number 
           For eg. ./2.sh 123, I will print 321

**Condition 2**: When Input was provided as command line Argument.

    $ ./numbers.sh 10572 

    Reverse number is 27501

The above script worked perfectly and the output was just what we needed.

### 4. You are supposed to calculate a real number calculation directly from terminal and not any shell script. What will you do (say the real numbers are 7.56 and 2.453)? ###

> **Answer** : We need to use bc command in a special way as described below. The output of echo 7.56 + 2.453 should be pipelined to bc.

For example, run the following command to calculate numbers in real time using bc command as shown.

    $ echo 7.56 + 2.453 | bc
    
    10.013

### 5. You are supposed to find the value of pi upto 100 places of decimal, what is the easiest way to get the result done. ###

> **Answer** : The easiest way to find the value of pi, correct upto 100 places of decimal we just need to issue the below command.

    # pi 100 

    3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067

Obviously! We must have package ‘**pi**‘ installed. Just do a **apt** or **yum** to get a required package to install ‘**pi**‘ onto the distribution you are using.

That’s all for now. I’ll be here again with another interesting article very soon. Till then stay tuned and connected to Tecmint.com. Don’t forget to provide us with you valuable feedback in the comment section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/practical-interview-questions-on-linux-shell-scripting/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/category/interview-questions/