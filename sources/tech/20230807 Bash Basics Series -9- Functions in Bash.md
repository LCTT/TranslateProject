[#]: subject: "Bash Basics Series #9: Functions in Bash"
[#]: via: "https://itsfoss.com/bash-function/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Bash Basics Series #9: Functions in Bash
======

Most programming languages support the concept of functions.

Functions help you avoid writing the same piece of code again and again in the same program. You write the code once as function and then use this function where you need the specific code piece.

In the last chapter of the Bash Basics series, you'll learn about using functions in bash scripts.

### Functions in bash

Here's the generic syntax for declaring a bash function:

```

    function_name() {
      commands
    }

```

The commands inside the function will only be executed if you 'call the function' in the script.

Here's a dummy code to demonstrate that:

```

    function_name() {
      commands
    }

    some_other_commands

    #FUNCTION CALL
    function_name argument;

```

🚧

The function definition must come before you call the function.

Let's see this with a simple example:

```

    #!/bin/bash

    fun() {
        echo "This is a function"
    }

    echo "This is a script"
    fun

```

When you run the script, you should see an output like this:

```

    This is a script
    This is a function

```

The function is called without any arguments. Let's see about handling arguments with functions in bash.

### Passing arguments to functions

Passing arguments to functions is the same as passing arguments to bash scripts. You mention the arguments with the function name when you call the function.

```

    function_name argument;

```

Let's see this with an example:

```

    #!/bin/bash

    sum() {
        sum=$(($1+$2))
        echo "The sum of $1 and $2 is: $sum"
    }

    echo "Let's use the sum function"
    sum 1 5

```

If you run the script, you'll see the following output:

```

    Let's use the sum function
    The sum of 1 and 5 is: 6

```

Keep in mind that the argument passed to the scripts are not the same as arguments passed to the function.

In the example below, I have interchanged the arguments while calling the function.

```

    #!/bin/bash

    arg() {
        echo "1st argument to function is $1 and 2nd is $2"
    }

    echo "1st argument to script is $1 and 2nd is $2"
    arg $2 $1

```

And when you run the script, you'll see the interchange:

```

    abhishek@itsfoss:~/bash_scripts$ ./function.sh abhi shek
    1st argument to script is abhi and 2nd is shek
    1st argument to function is shek and 2nd is abhi

```

### Recursive function in bash

A recursive function calls itself. That's what recursion is. This meme may help you understand it.

![][1]

Now, the recursive functionality is quite powerful and could help you write complicated programs.

Let's see it in action with a sample script that computes the factorial of a number. In case you don't remember, the factorial is defined like this.

```

    factorial of n (n!) = 1 * 2 * 3 * 4 *...  * n

```

So, factorial of 5 is 1 * 2 * 3 * 4 * 5 which computes to 120.

Here's my script for computing the factorial of a given number using recursion.

```

    #!/bin/bash

    factorial() {

        if [ $1 -gt 1 ]; then
            echo $(( $1 * $(factorial $(( $1 -1 ))) ))
        else
            echo 1
        fi

    }

    echo -n "Factorial of $1 is: "
    factorial $1

```

Pay attention to `echo $(( $1 * $(factorial $(( $1 -1 ))) ))`. The code is calling the function itself with 1 value less. The process goes in until the value equals 1. So if you run the script with argument 5, it will eventually result in 5 * 4 * 3 * 2 *1.

```

    abhishek@itsfoss:~/bash_scripts$ ./factorial.sh 5
    Factorial of 5 is: 120

```

That's nice. How about some practice?

### 🏋️ Exercise time

Here are some sample scripting challenges to practice your learning.

Exercise 1: Write a bash script that uses a function called is_even to check whether the given number is even or not.

Exercise 2: A similar exercise where you have to write a script that has a function is_prime and it check whether the given number is prime or not. If you didn't know already, a prime number is only divisible by 1 and the number itself.

Exercise 3: Write a script that generates the Fibonacci sequence of the given number. The sequence starts at 1 and the script must accept numbers greater than 3.

So, if you do `fibonacci.sh 5`, it should generate 1 1 2 3 5.

And that's it, folks! This is the end of the Bash Basics Series. Of course, this is just the tip of the iceberg; there is much more to bash scripting than what you learned here.

But you should have a decent idea about bash shell by now. You should be able to understand most bash scripts and write simple, if not complicated ones.

If you want to dive deeper, nothing is better than the GNU Bash Manual.

![][2]

_🗨 I hope you liked this Bash Basics Series. We are creating more tutorial series to give you a more streamlined learning experience. Please provide your feedback and help us help others with Linux._

--------------------------------------------------------------------------------

via: https://itsfoss.com/bash-function/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/recursion-meme.webp
[2]: https://www.gnu.org/graphics/gnu-head-mini.png
