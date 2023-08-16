[#]: subject: "Bash Basics Series #8: For, While and Until Loops"
[#]: via: "https://itsfoss.com/bash-loops/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Bash Basics Series #8: For, While and Until Loops
======

Loops are a powerful feature in any programming language. If you do not know already, the loops are a way to repeat the code based on certain criteria.

For example, imagine that you have to print the numbers from 1 to 10. You can write the echo command ten times but that's very primitive. You use a loop and in 3-4 lines of code, it can be done.

That's the simplest of the examples I could think of. I am going to share actual useful examples while I discuss the bash loops with you.

There are three types of loops in Bash:

  * For
  * While
  * Until



I'll show all three kinds of looping in the tutorial. Let's start with the most common one.

### For loop in bash

Here's the syntax for 'for loop' in bash:

```

    for arg in LIST; do
     commands
    done

```

The LIST here could be an array or a list of items. [Brace expansions][1] are also popular for looping.

Take the simplest scenario I mentioned in the beginning. Let's print numbers from 1 to 10 using for loop:

```

    #!/bin/bash

    for num in {1..10}; do
        echo $num
    done

```

If you run it, you should see an output like this:

```

    abhishek@itsfoss:~/bash_scripts$ ./for-loop.sh
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

```

You could have also used `for num in 1 2 3 4 5 6 7 8 9 10; do` but using the brace expansion makes the code look shorter and smarter.

`{..}` is used for expanding on a pattern. You use `{d..h}` and it is equivalent to `d e f g h` . More on brace expansion can be found in this article.

![][2]

💡

If you are familiar with C programming, you may like using the C-styled for loops in bash:

for ((i = 0 ; i < 10 ; i++)); do
echo $i
done

Let's see another example that displays all the contents of an [array in bash][3]:

```

    #!/bin/bash

    distros=(Ubuntu Fedora Debian Alpine)

    for i in "${distros[@]}"; do
        echo $i
    done

```

If you run the script, it will display all the distros defined in the array:

```

    Ubuntu
    Fedora
    Debian
    Alpine

```

### While loop in bash

The while loop tests a condition and then keeps on looping as long as the condition is true.

```

    while [ condition ]; do
      commands
    done

```

If you take the previous example, it can be rewritten using the while loop like this:

```

    #!/bin/bash

    num=1
    while [ $num -le 10 ]; do
        echo $num
        num=$(($num+1))
    done

```

As you can see, you had to define the variable `num` to 1 first and then in the loop body, you increase the value of `num` by 1. The while loop checks the condition and runs it as long as `num` is less than or equal to 10.

Thus, running the script now will show the exact result you saw earlier with for loop.

```

    1
    2
    3
    4
    5
    6
    7
    8
    9
    10

```

Let's see another example. Here's a [bash script that takes a number as an argument][4] and displays its table.

```

    #!/bin/bash

    echo "Table for $1 is:"
    index=1
    while [ $index -le 10 ]; do
        echo $(($1*$index))
        index=$(($index+1))
    done

```

If you are confused about the use of $1, it represents the first argument passed to the script. Check out [chapter 3 of this series][4] for more details.

If you run the script, it should show this output:

```

    abhishek@itsfoss:~/bash_scripts$ ./table.sh 2
    Table for 2 is:
    2
    4
    6
    8
    10
    12
    14
    16
    18
    20

```

### Until loop in bash

This is the lesser-used loop format. It behaves similarly to the while loop. The difference here is that the loop runs until the condition it checks is true. This means for the code in the loop to execute, the condition in `[ ]` has to be false.

I'll explain it in a bit. Let's see its syntax first.

```

    until [ condition ]; do
      commands
    done

```

Now, if I have to use the same example of printing numbers from 1 to 10 using until loop, it would look like this:

```

    #!/bin/bash

    num=1
    until [ $num -gt 10 ]; do
        echo $num
        num=$(($num+1))
    done

```

The difference is in the condition; the rest remains the same.

  * The while loop ran while the variable `num` was less than or equal to 10. The condition in `[ ]` has to be true for the loop to execute.
  * The until loop runs until the variable `num` becomes greater than 10. The condition in `[ ]` has to be false for the loop to execute.



Both are different ways of doing the same thing. While is more popular as you'll find a while loop equivalent in most programming languages.

### 🏋️ Exercise time

That was fun. Time to do some exercise now.

**Exercise 1** : Write a script that takes a number as an argument and prints its table. Your script should also show a message if the script is run without an argument.

**Expected output** :

```

    $: ./table.sh
    You forgot to enter a number

    $: ./table.sh 3
    3
    6
    9
    12
    15
    18
    21
    24
    27
    30

```

**Exercise 2** : Write a script that lists all the files in the directory /var

**Hint** : Use for loop with /var/* as the 'list'.

You can discuss your answers in this dedicated thread in the Community:

![][5]

The bash basics series is coming to an end. As the final chapter in the series, you'll learn to use functions in bash scripting next week. Stay tuned.

--------------------------------------------------------------------------------

via: https://itsfoss.com/bash-loops/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/brace-expansion/?ref=itsfoss.com
[2]: https://linuxhandbook.com/content/images/size/w256h256/2021/08/Linux-Handbook-New-Logo.png
[3]: https://itsfoss.com/bash-arrays/
[4]: https://itsfoss.com/bash-pass-arguments/
[5]: https://itsfoss.community/uploads/default/optimized/1X/f274f9749e3fd8b4d6fbae1cf90c5c186d2f699c_2_180x180.png
