How to Use Flow Control Statements in Awk - part12
====

When you review all the Awk examples we have covered so far, right from the start of the Awk series, you will notice that all the commands in the various examples are executed sequentially, that is one after the other. But in certain situations, we may want to run some text filtering operations based on some conditions, that is where the approach of flow control statements sets in.

![](http://www.tecmint.com/wp-content/uploads/2016/08/Use-Flow-Control-Statements-in-Awk.png)

There are various flow control statements in Awk programming and these include:

- if-else statement
- for statement
- while statement
- do-while statement
- break statement
- continue statement
- next statement
- nextfile statement
- exit statement

However, for the scope of this series, we shall expound on: if-else, for, while and do while statements. Remember that we already walked through how to use next statement in Part 6 of this Awk series.

### 1. The if-else Statement

The expected syntax of the if statement is similar to that of the shell if statement:

```
if  (condition1) {
actions1
}
else {
actions2
}
```

In the above syntax, condition1 and condition2 are Awk expressions, and actions1 and actions2 are Awk commands executed when the respective conditions are satisfied.

When condition1 is satisfied, meaning it’s true, then actions1 is executed and the if statement exits, otherwise actions2 is executed.

The if statement can also be expanded to a if-else_if-else statement as below:

```
if (condition1){
actions1
}
else if (conditions2){
actions2
}
else{
actions3
}
```

For the form above, if condition1 is true, then actions1 is executed and the if statement exits, otherwise condition2 is evaluated and if it is true, then actions2 is executed and the if statement exits. However, when condition2 is false then, actions3 is executed and the if statement exits.

Here is a case in point of using if statements, we have a list of users and their ages stored in the file, users.txt.

We want to print a statement indicating a user’s name and whether the user’s age is less or more than 25 years old.

```
aaronkilik@tecMint ~ $ cat users.txt
Sarah L			35    	F
Aaron Kili		40    	M
John  Doo		20    	M
Kili  Seth		49    	M    
```

We can write a short shell script to carry out our job above, here is the content of the script:

```
#!/bin/bash
awk ' { 
if ( $3 <= 25 ){
print "User",$1,$2,"is less than 25 years old." ;
}
else {
print "User",$1,$2,"is more than 25 years old" ; 
}
}'    ~/users.txt
```

Then save the file and exit, make the script executable and run it as follows:

```
$ chmod +x test.sh
$ ./test.sh
```

Sample Output

```
User Sarah L is more than 25 years old
User Aaron Kili is more than 25 years old
User John Doo is less than 25 years old.
User Kili Seth is more than 25 years old
```

### 2. The for Statement

In case you want to execute some Awk commands in a loop, then the for statement offers you a suitable way to do that, with the syntax below:

Here, the approach is simply defined by the use of a counter to control the loop execution, first you need to initialize the counter, then run it against a test condition, if it is true, execute the actions and finally increment the counter. The loop terminates when the counter does not satisfy the condition.

```
for ( counter-initialization; test-condition; counter-increment ){
actions
}
```

The following Awk command shows how the for statement works, where we want to print the numbers 0-10:

```
$ awk 'BEGIN{ for(counter=0;counter<=10;counter++){ print counter} }'
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

### 3. The while Statement

The conventional syntax of the while statement is as follows:

```
while ( condition ) {
actions
}
```

The condition is an Awk expression and actions are lines of Awk commands executed when the condition is true.

Below is a script to illustrate the use of while statement to print the numbers 0-10:

```
#!/bin/bash
awk ' BEGIN{ counter=0 ;
while(counter<=10){
print counter;
counter+=1 ;
}
}  
```

Save the file and make the script executable, then run it:

```
$ chmod +x test.sh
$ ./test.sh
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

### 4. The do while Statement

It is a modification of the while statement above, with the following underlying syntax:

```
do {
actions
}
while (condition) 
```

The slight difference is that, under do while, the Awk commands are executed before the condition is evaluated. Using the very example under while statement above, we can illustrate the use of do while by altering the Awk command in the test.sh script as follows:

```
#!/bin/bash
awk ' BEGIN{ counter=0 ;  
do{
print counter;  
counter+=1 ;    
}
while (counter<=10)   
} 
'
```

After modifying the script, save the file and exit. Then make the script executable and execute it as follows:

```
$ chmod +x test.sh
$ ./test.sh
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

### Conclusion

This is not a comprehensive guide regarding Awk flow control statements, as I had mentioned earlier on, there are several other flow control statements in Awk.

Nonetheless, this part of the Awk series should give you a clear fundamental idea of how execution of Awk commands can be controlled based on certain conditions.

You can as well expound more on the rest of the flow control statements to gain more understanding on the subject matter. Finally, in the next section of the Awk series, we shall move into writing Awk scripts.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/use-flow-control-statements-with-awk-command/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/


