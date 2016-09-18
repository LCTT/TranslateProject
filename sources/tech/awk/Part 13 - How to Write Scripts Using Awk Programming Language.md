chunyang-wen doing
Part 13 - How to Write Scripts Using Awk Programming Language
====

All along from the beginning of the Awk series up to Part 12, we have been writing small Awk commands and programs on the command line and in shell scripts respectively.

However, Awk, just as Shell, is also an interpreted language, therefore, with all that we have walked through from the start of this series, you can now write Awk executable scripts.

Similar to how we write a shell script, Awk scripts start with the line:

```
#! /path/to/awk/utility -f 
```

For example on my system, the Awk utility is located in /usr/bin/awk, therefore, I would start an Awk script as follows:

```
#! /usr/bin/awk -f 
```

Explaining the line above:

```
#! – referred to as Shebang, which specifies an interpreter for the instructions in a script
/usr/bin/awk – is the interpreter
-f – interpreter option, used to read a program file
```

That said, let us now dive into looking at some examples of Awk executable scripts, we can start with the simple script below. Use your favorite editor to open a new file as follows:

```
$ vi script.awk
```

And paste the code below in the file:

```
#!/usr/bin/awk -f 
BEGIN { printf "%s\n","Writing my first Awk executable script!" }
```

Save the file and exit, then make the script executable by issuing the command below:

```
$ chmod +x script.awk
```

Thereafter, run it:

```
$ ./script.awk
```

Sample Output

```
Writing my first Awk executable script!
```

A critical programmer out there must be asking, “where are the comments?”, yes, you can also include comments in your Awk script. Writing comments in your code is always a good programming practice.

It helps other programmers looking through your code to understand what you are trying to achieve in each section of a script or program file.

Therefore, you can include comments in the script above as follows.

```
#!/usr/bin/awk -f 
#This is how to write a comment in Awk
#using the BEGIN special pattern to print a sentence 
BEGIN { printf "%s\n","Writing my first Awk executable script!" }
```

Next, we shall look at an example where we read input from a file. We want to search for a system user named aaronkilik in the account file, /etc/passwd, then print the username, user ID and user GID as follows:

Below is the content of our script called second.awk.

```
#! /usr/bin/awk -f 
#use BEGIN sepecial character to set FS built-in variable
BEGIN { FS=":" }
#search for username: aaronkilik and print account details 
/aaronkilik/ { print "Username :",$1,"User ID :",$3,"User GID :",$4 }
```

Save the file and exit, make the script executable and execute it as below:

```
$ chmod +x second.awk
$ ./second.awk /etc/passwd
```

Sample Output

```
Username : aaronkilik User ID : 1000 User GID : 1000
```

In the last example below, we shall use do while statement to print out numbers from 0-10:

Below is the content of our script called do.awk.

```
#! /usr/bin/awk -f 
#printing from 0-10 using a do while statement 
#do while statement 
BEGIN {
#initialize a counter
x=0
do {
print x;
x+=1;
}
while(x<=10)
}
```

After saving the file, make the script executable as we have done before. Afterwards, run it:

```
$ chmod +x do.awk
$ ./do.awk
```

Sample Output

```
0
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

### Summary

We have come to the end of this interesting Awk series, I hope you have learned a lot from all the 13 parts, as an introduction to Awk programming language.

As I mentioned from the beginning, Awk is a complete text processing language, for that reason, you can learn more other aspects of Awk programming language such as environmental variables, arrays, functions (built-in & user defined) and beyond.

There is yet additional parts of Awk programming to learn and master, so, below, I have provided some links to important online resources that you can use to expand your Awk programming skills, these are not necessarily all that you need, you can also look out for useful Awk programming books.


For any thoughts you wish to share or questions, use the comment form below. Remember to always stay connected to Tecmint for more exciting series.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/write-shell-scripts-in-awk-programming/

作者：[Aaron Kili |][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
