How to define and use functions in Linux Shell Script
======
Function is a reusable block of code. Often we put repeated code in a function and call that function from various places. Library is a collection of functions. We can define commonly used function in a library and other scripts can use them without duplicating code.

[![Functions-Linux-Shell-Script][1]![Functions-Linux-Shell-Script][2]][2]

In this article we’ll discuss more about functions and recipes. For demonstration purpose I’ll be using **Bourne Again SHell(Bash)** on Ubuntu machine.

#### Calling function

In Shell calling function is exactly same as calling any other command. For instance, if your function name is my_func then it can be execute as follows:
```
$ my_func

```

If any function accepts arguments then those can be provided from command line as follows:
```
$ my_func arg1 arg2 arg3

```

#### Defining function

We can use below syntax to define function:
```
 function function_name {
            Body of function
 }

```

Body of function can contain any valid command, loop constrain, other function or script. Now let us create simple function which displays message on screen.
```
 function print_msg {
       echo "Hello, World"
 }

```

Now let us execute this function:
```
 $ print_msg
 Hello, World

```

As expected, this function displays message on screen.

In above example we have created function directly on terminal. We can store this function in file as well. Below example demonstrates this.
```
 #! /bin/bash
 function print_msg {
       echo "Hello, World"
 }
 print_msg

```

We have defined this function inside **function.sh** file. Now let us execute this script:
```
 $ chmod +x function.sh
 $ ./function.sh
 Hello, World

```

If you observe, above output is exactly identical to previous one.

#### More about functions

In previous section we have defined very basic function. However during software development we need more advanced functions which can accept various parameters and return values. In this section we’ll discuss such functions.

**Passing arguments to function**

We can provide arguments to function same as other commands. We can access these arguments from function using dollar($) symbol. For instance, $1 represents first argument, $2 represents second argument and so on.

Let us modify above function to accept message as an argument. Our modified function will look like this:
```
 function print_msg {
       echo "Hello $1"
 }

```

In above function we are accessing first argument using $1. Let us execute this function:
```
 $ print_msg "LinuxTechi"

```

When you execute this function, it will generate following output:
```
 Hello LinuxTechi

```

**Returning value from function**

Like other programming languages, Bash provides return statement using that we can return value to the caller. Let us understand this with example:
```
function func_return_value {
      return 10
 }

```

Above function returns value 10 to its caller. Let us execute this function:
```
 $ func_return_value
 $ echo "Value returned by function is: $?"

```

When you execute above function, it will generate following output:
```
 Value returned by function is: 10

```

**NOTE:** In bash we have to use $? to capture return value of function

#### Function recipes

So far we got fair idea about bash functions. Now let us create some useful bash functions which can be used to make our lives easier.

**Logger**

Let us create logger function which will print date and time along with log message.

Let us execute this function:
```
 $ log_msg "This is sample log message"

```

When you execute this function, it will generate following output:
```
 [ 2018-08-16 19:56:34 ]: This is sample log message

```

**Display system information**

Let us create a function to display information about GNU/Linux system
```
 function system_info {
       echo "### OS information ###"
       lsb_release -a

       echo
       echo "### Processor information ###"
       processor=`grep -wc "processor" /proc/cpuinfo`
       model=`grep -w "model name" /proc/cpuinfo  | awk -F: '{print $2}'`
       echo "Processor = $processor"
       echo "Model     = $model"

       echo
       echo "### Memory information ###"
       total=`grep -w "MemTotal" /proc/meminfo | awk '{print $2}'`
       free=`grep -w "MemFree" /proc/meminfo | awk '{print $2}'`
       echo "Total memory: $total kB"
       echo "Free memory : $free kB"
 }

```

When you execute above function it will generate following output:
```
### OS information ###
No LSB modules are available.
Distributor ID:           Ubuntu
Description:   Ubuntu 18.04.1 LTS
Release:         18.04
Codename:    bionic

### Processor information ###
Processor = 1
Model     =  Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz

### Memory information ###
Total memory: 4015648 kB
Free memory : 2915428 kB

```

Find file or directory from current directory

Below function searches file or directory from current directory:
```
 function search {
      find . -name $1
 }

```

Let us search directory namely dir4 using below command:
```
 $ search dir4

```

When you execute above command, it will generate following output:
```
 ./dir1/dir2/dir3/dir4

```

**Digital clock**

Below function creates a simple digital clock on terminal
```
 function digital_clock {
            clear
            while [ 1 ]
            do
                  date +'%T'
                  sleep 1
                  clear
            done
 }

```

#### Creating library

Library is a collection of functions. To create library – define functions in a file and import that file in current environment.

Let us suppose we have defined all functions in utils.sh file then use below command to import functions in current environment:
```
$ source utils.sh

```

Hereafter you can execute any function from library just like any other bash command.

##### Conclusion

In this article we discussed few useful recipes which will improve your productivity. I hope this articles inspires you to create your own recipes.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/define-use-functions-linux-shell-script/

作者：[Pradeep Kumar][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
[1]:https://www.linuxtechi.com/wp-content/plugins/lazy-load/images/1x1.trans.gif
[2]:https://www.linuxtechi.com/wp-content/uploads/2018/08/Functions-Linux-Shell-Script.jpg
