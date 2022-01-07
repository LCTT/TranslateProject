[#]: subject: "Bash Shell Scripting for beginners (Part 3)"
[#]: via: "https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-3"
[#]: author: "Matthew Darnell https://fedoramagazine.org/author/zexcon/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Bash Shell Scripting for beginners (Part 3)
======

![][1]

Welcome to part 3 of Bash Shell Scripting at a beginner level. This final article will look at a few more items that will get you primed for your continued personal development. It will touch on functions, using comparisons with _if/elif_ statements, and will wrap up with looking into the _while_ loop.

### Functions

Let’s start out with a basic concept that might seem difficult but is really simple, the function. Think of this as a simple way to put a part of a script that is used over and over into one reusable group. Anything you have done in article 1 or 2 can be put into a function. So let’s put a function into our learnToScript.sh file. Let me point out a few things. You will need a name for your function, the opening and closing parentheses, and curly brackets to enclose the commands that are included in your function.

```

    #!/bin/bash

    #A function to return an echo statement.
    helloFunc() {
            echo "Hello from a function."
    }

    #invoke the first function helloFunc()
    helloFunc

```

Below you will see the output.

```

    [zexcon@fedora ~]$ ./learnToScript.sh
    Hello from a function.
    [zexcon@fedora ~]$

```

Functions are a good way to reuse a group of commands but they can be even more useful if you can make them operate on different data each time they are used. This requires that you provide data, referred to as arguments, to the function each time you call it.

To provide arguments, you simply add them after the function name when you invoke it. To use the data you provide, you use the positional references in the function commands. They will be named $1, $2, $3, and so on, depending on the number of arguments your function will need.

Let’s modify the last example to help understand this better.

```

    #!/bin/bash

    #A function to return an echo statement.
    helloFunc() {
            echo "Hello from a function."
            echo $1
            echo $2
            echo "You gave me $# arguments"
    }

    #invoke the function helloFunc()
    helloFunc "How is the weather?" Fine

```

The output is shown below.

```

    Hello from a function.
    How is the weather?
    Fine
    You gave me 2 arguments

```

What is happening in the output is _helloFunc()_ did an echo on each line. First it does an echo of “Hello from a function”, then it moves to echo the value of variable $1, this is the result of what you passed to helloFunc with “How is the weather?”. It will then move onto variable $2 and echo its value that is the second item you passed “Fine”. The function will finish by returning the echo “You gave me $# arguments”. Notice that the first argument was a single string enclosed in double quotes, “How is the weather?” . The second one, “Fine”, had no spaces so the quotes where not needed.

In addition to using $1, $2, etc. you can determine the number of arguments being passed to the function by using the variable $#. This means that you can create a function which accepts a variable number of arguments.

There are many good references on line for more details on bash functions. [Here is one to get you started][2].

I hope you can see how functions can provide great flexibility in your bash scripts.

### Numeric comparisons []

If you want to do a numerical comparison you will need to use one of the following operators between square brackets [] .

-eq (is equal)

-ge (equal or greater than)

-gt (greater than)

-le (less than or equal)

-lt (less than)

-ne (not equal)

So for example if you wanted to see if 12 is equal to or less than 25 it would you like [ 12 -le 25 ]. The 12 and 25, of course, can be variables. For example, [$twelve -le $twentyfive].

### if and elif Statement

So let’s use our numerical comparison to introduce the _if_ statement. An _if_ statement in Bash will start with _if_ and end with _fi_. You start with the _if_ followed by the check you are wanting to do. In this case the check will be is variable _numberOne_ equal to 1. If _numberOne_ is equal to 1 it will execute the _then_ statement, otherwise it will execute the _else_ statement.

```

    #!/bin/bash

    numberTwelve=12

    if [ $numberTwelve -eq 12 ]
    then
            echo "numberTwelve is equal to 12"
    elif [ $numberTwelve -gt 12 ]
    then
            echo "numberTwelve variable is greater than 12"
    else
            echo "neither of the statemens matched"
    fi

```

The output for that follows:

```

    [zexcon@fedora ~]$ ./learnToScript.sh
    numberTwelve variable is equal to 12

```

What you are seeing is the first line in the _if_ statement checking to see if the variables value is really equal to 12. If it is the statement stops and echos “numberTwelve is equal to 12” and execution of your script will continue after the _fi._ If the variable was greater then 12 it would have executed the _elif_ statement and again continued execution after the _fi_. When you use an _if_ or _if/elif_ statement it works from the top down. When the first statement is a match it stops and executes that command and continues after the _fi_.

### String comparisons [[]]

So that was numeric comparisons. What about comparing strings? Uses the double square brackets [[]] and the following operators equal or not equal.

= (equal)

!= (not equal)

Keep in mind strings have several other comparisons that we will not discuss but dig in and read about them and how they work.

```

    #!/bin/bash

    #variable with a string
        stringItem="Hello"

    #This will match since it is looking for an exact match with $stringItem
        if [[ $stringItem = "Hello" ]]
        then
                echo "The string is an exact match."
        else
                echo "The strings do not match exactly."
        fi

    #This will utilize the then statement since it is not looking for a case sensitive match
        if [[ $stringItem = "hello" ]]
        then
                echo "The string does match but is not case sensitive."
        else
                echo "The string does not match because of the capitalized H."
        fi



```

You will get the following three lines.

```

    [zexcon@fedora ~]$ ./learnToScript.sh
    The string is an exact match.
    The string does not match because of the capitalized H.
    [zexcon@fedora ~]$

```

### While Loop

Let’s take a look at a loop before wrapping up the series. An example of the _while_ loop is “while 1 is less then 10 add one to the value” you continue doing this until it is no longer true. Below you will see the variable _number_ set to 1. On the next line we have the _while_ statement that does a check to see if _number_ is less then or equal to 10. The commands contained between _do_ and _done_ are executed since the _while_ comparison is true. so we _echo_ some text and add one to the value of _number_. We continue until the _while_ statement is no longer true and it breaks out of the loop and echo’s “We have completed the while loop since $number is greater than 10.”

```

    #!/bin/bash

    number=1

    while [ $number -le 10 ]
    do
            echo "We checked the current number is $number so we will increment once"
            ((number=number+1))
    done
            echo "We have completed the while loop since $number is greater than 10."

```

The result of the _while_ loop is the following.

```

    [zexcon@fedora ~]$ ./learnToScript.sh
    We checked the current number is 1 so we will increment once
    We checked the current number is 2 so we will increment once
    We checked the current number is 3 so we will increment once
    We checked the current number is 4 so we will increment once
    We checked the current number is 5 so we will increment once
    We checked the current number is 6 so we will increment once
    We checked the current number is 7 so we will increment once
    We checked the current number is 8 so we will increment once
    We checked the current number is 9 so we will increment once
    We checked the current number is 10 so we will increment once
    We have completed the while loop since 11 is greater than 10.
    [zexcon@fedora ~]$

```

As you can see the amount of scripting needed to make this happen is much less then if you continued to check each number with an _if_ statement. This is the great part of loops and the _while_ loop is only the first of many options that do things differently to meet your personal needs.

### Conclusion

What is next? As the article pointed out it’s Bash Shell Scripting for Beginners. Hopefully I sparked an interest or life long love for scripting. I recommend you check out other’s scripts and look up what you don’t know or understand. Remember that as each article presented more ways of doing math, comparing strings, outputting and imputing data they can also be done in functions, loops or numerous other ways. If you practice the basics discussed you will have a blast combining them with all the other options you are still going to learn. Go out and have fun and I’ll see you around the Fedora Linux world.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-3

作者：[Matthew Darnell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zexcon/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/11/bash_shell_scripting_pt3-816x345.jpg
[2]: https://opensource.com/article/20/6/bash-functions
