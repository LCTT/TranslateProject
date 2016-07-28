Learn How to Use Awk Variables, Numeric Expressions and Assignment Operators – part8
=======================================================================================

The [Awk command series][1] is getting exciting I believe, in the previous seven parts, we walked through some fundamentals of Awk that you need to master to enable you perform some basic text or string filtering in Linux.

Starting with this part, we shall dive into advance areas of Awk to handle more complex text or string filtering operations. Therefore, we are going to cover Awk features such as variables, numeric expressions and assignment operators.

![](http://www.tecmint.com/wp-content/uploads/2016/07/Learn-Awk-Variables-Numeric-Expressions-Assignment-Operators.png)
>Learn Awk Variables, Numeric Expressions and Assignment Operators

These concepts are not comprehensively distinct from the ones you may have probably encountered in many programming languages before such shell, C, Python plus many others, so there is no need to worry much about this topic, we are simply revising the common ideas of using these mentioned features.

This will probably be one of the easiest Awk command sections to understand, so sit back and lets get going.

### 1. Awk Variables

In any programming language, a variable is a place holder which stores a value, when you create a variable in a program file, as the file is executed, some space is created in memory that will store the value you specify for the variable.

You can define Awk variables in the same way you define shell variables as follows:

```
variable_name=value 
```

In the syntax above:

- `variable_name`: is the name you give a variable
- `value`: the value stored in the variable

Let’s look at some examples below:

```
computer_name=”tecmint.com”
port_no=”22”
email=”admin@tecmint.com”
server=”computer_name”
```

Take a look at the simple examples above, in the first variable definition, the value `tecmint.com` is assigned to the variable `computer_name`.

Furthermore, the value 22 is assigned to the variable port_no, it is also possible to assign the value of one variable to another variable as in the last example where we assigned the value of computer_name to the variable server.

If you can recall, right from [part 2 of this Awk series][2] were we covered field editing, we talked about how Awk divides input lines into fields and uses standard field access operator, $ to read the different fields that have been parsed. We can also use variables to store the values of fields as follows.

```
first_name=$2
second_name=$3
```

In the examples above, the value of first_name is set to second field and second_name is set to the third field.

As an illustration, consider a file named names.txt which contains a list of an application’s users indicating their first and last names plus gender. Using the [cat command][3], we can view the contents of the file as follows:

```
$ cat names.txt
```

![](http://www.tecmint.com/wp-content/uploads/2016/07/List-File-Content-Using-cat-Command.png)
>List File Content Using cat Command

Then, we can also use the variables first_name and second_name to store the first and second names of the first user on the list as by running the Awk command below:

```
$ awk '/Aaron/{ first_name=$2 ; second_name=$3 ; print first_name, second_name ; }' names.txt
```

![](http://www.tecmint.com/wp-content/uploads/2016/07/Store-Variables-Using-Awk-Command.png)
>Store Variables Using Awk Command

Let us also take a look at another case, when you issue the command `uname -a` on your terminal, it prints out all your system information.

The second field contains your `hostname`, therefore we can store the hostname in a variable called hostname and print it using Awk as follows:

```
$ uname -a
$ uname -a | awk '{hostname=$2 ; print hostname ; }' 
```

![](http://www.tecmint.com/wp-content/uploads/2016/07/Store-Command-Output-to-Variable-Using-Awk.png)
>Store Command Output to Variable Using Awk

### 2. Numeric Expressions

In Awk, numeric expressions are built using the following numeric operators:

- `*` : multiplication operator
- `+` : addition operator
- `/` : division operator
- `-` : subtraction operator
- `%` : modulus operator
- `^` : exponentiation operator

The syntax for a numeric expressions is:

```
$ operand1 operator operand2
```

In the form above, operand1 and operand2 can be numbers or variable names, and operator is any of the operators above.

Below are some examples to demonstrate how to build numeric expressions:

```
counter=0
num1=5
num2=10
num3=num2-num1
counter=counter+1
```

To understand the use of numeric expressions in Awk, we shall consider the following example below, with the file domains.txt which contains all domains owned by Tecmint.

```
news.tecmint.com
tecmint.com
linuxsay.com
windows.tecmint.com
tecmint.com
news.tecmint.com
tecmint.com
linuxsay.com
tecmint.com
news.tecmint.com
tecmint.com
linuxsay.com
windows.tecmint.com
tecmint.com
```

To view the contents of the file, use the command below:

```
$ cat domains.txt
```

![](http://www.tecmint.com/wp-content/uploads/2016/07/View-Contents-of-File.png)
>View Contents of File

If we want to count the number of times the domain tecmint.com appears in the file, we can write a simple script to do that as follows:

```
#!/bin/bash
for file in $@; do
if [ -f $file ] ; then
#print out filename
echo "File is: $file"
#print a number incrementally for every line containing tecmint.com 
awk  '/^tecmint.com/ { counter=counter+1 ; printf "%s\n", counter ; }'   $file
else
#print error info incase input is not a file
echo "$file is not a file, please specify a file." >&2 && exit 1
fi
done
#terminate script with exit code 0 in case of successful execution 
exit 0
```

![](http://www.tecmint.com/wp-content/uploads/2016/07/Shell-Script-to-Count-a-String-in-File.png)
>Shell Script to Count a String or Text in File

After creating the script, save it and make it executable, when we run it with the file, domains.txt as out input, we get the following output:

```
$ ./script.sh  ~/domains.txt
```

![](http://www.tecmint.com/wp-content/uploads/2016/07/Script-To-Count-String.png)
>Script to Count String or Text

From the output of the script, there are 6 lines in the file domains.txt which contain tecmint.com, to confirm that you can manually count them.

### 3. Assignment Operators

The last Awk feature we shall cover is assignment operators, there are several assignment operators in Awk and these include the following:

- `*=` : multiplication assignment operator
- `+=` : addition assignment operator
- `/=` : division assignment operator
- `-=` : subtraction assignment operator
- `%=` : modulus assignment operator
- `^=` : exponentiation assignment operator

The simplest syntax of an assignment operation in Awk is as follows:

```
$ variable_name=variable_name operator operand
```

Examples:

```
counter=0
counter=counter+1
num=20
num=num-1
```

You can use the assignment operators above to shorten assignment operations in Awk, consider the previous examples, we could perform the assignment in the following form:

```
variable_name operator=operand
counter=0
counter+=1
num=20
num-=1
```

Therefore, we can alter the Awk command in the shell script we just wrote above using += assignment operator as follows:

```
#!/bin/bash
for file in $@; do
if [ -f $file ] ; then
#print out filename
echo "File is: $file"
#print a number incrementally for every line containing tecmint.com 
awk  '/^tecmint.com/ { counter+=1 ; printf  "%s\n",  counter ; }'   $file
else
#print error info incase input is not a file
echo "$file is not a file, please specify a file." >&2 && exit 1
fi
done
#terminate script with exit code 0 in case of successful execution 
exit 0
```


![](http://www.tecmint.com/wp-content/uploads/2016/07/Alter-Shell-Script.png)
>Alter Shell Script

In this segment of the [Awk series][4], we covered some powerful Awk features, that is variables, building numeric expressions and using assignment operators, plus some few illustrations of how we can actually use them.

These concepts are not any different from the one in other programming languages but there may be some significant distinctions under Awk programming.

In part 9, we shall look at more Awk features that is special patterns: BEGIN and END. Until then, stay connected to Tecmint.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/learn-awk-variables-numeric-expressions-and-assignment-operators/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对ID](https://github.com/校对ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/



















[1]: http://www.tecmint.com/category/awk-command/
[2]: http://www.tecmint.com/awk-print-fields-columns-with-space-separator/
[3]: http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[4]: http://www.tecmint.com/category/awk-command/
