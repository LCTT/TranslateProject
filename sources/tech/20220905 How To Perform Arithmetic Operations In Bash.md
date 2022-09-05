[#]: subject: "How To Perform Arithmetic Operations In Bash"
[#]: via: "https://ostechnix.com/bash-arithmetic-operations/"
[#]: author: "Karthick https://ostechnix.com/author/karthick/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Perform Arithmetic Operations In Bash
======
Different Ways To Do Mathematical Operations In Bash

In this article, we will focus on how to **do mathematical operations in bash scripts**. We can **perform arithmetic operations in Bash** using the built-in and external tools. First, we will learn about the built-in tools.

**Note:** Unlike other programming languages, bash arithmetic operations are not straight-forward(at least for me). There are multiple bash built-in and external programs to perform the same operations. If you want to perform any complex mathematical computation, then a shell is not a recommended way to do it.

#### Contents

1. Do Mathematical Operations In Bash Using The Built-in "let" Command
2. Do Arithmetic Operations In Bash Using The Built-in Double Brackets
3. Perform Arithmetic Operations In Bash Using Expr Utility
4. Perform Bash Arithmetic Operations Using bc Utility
5. Perform Mathematical Operations With AWK
6. Conclusion

### Do Mathematical Operations In Bash Using The Built-in "let" Command

Using the `let` command, you can perform arithmetic, incremental, bitwise, and conditional operations. The drawback with the let command is it cannot handle floating point values.

The `let` command in bash is a built-in command. You can verify that by running the following command in the terminal.

```
$ type -a letlet is a shell builtin
```

Run the following command to get the help section where you can find the list of operators supported by the ‘let’ command.

```
$ let -help
```

**Sample output:**

![Display let Command Help Section][1]

There are a few essential points to note when working with the let command.

* The output of any operation should be assigned to a variable and then printed. The ‘let’ command will not allow you to print the outputs straight away.
* No space is allowed between the operator and the operand.

Create a shell script, copy and paste the below example code and try running the script. In the code given below, I am performing arithmetic operations. As mentioned already, the output of the expression should be assigned to a variable before printing it out.

```
#!/usr/bin/env bash

let NUMBER1=10
let NUMBER2=3

# Addition => + operator
let ADD=$NUMBER1+$NUMBER2
echo "Addition of two numbers : ${ADD}"

# Subtraction => - operator
let SUB=$NUMBER1-$NUMBER2
echo "Subtraction of two numbers : ${SUB}"

# Multiply => * operator
let MUL=$NUMBER1*$NUMBER2
echo "Multiply two numbers : ${MUL}"

# Divide => / operator
let DIV=$NUMBER1/$NUMBER2
echo "Division of two numbers : ${DIV}"

# Remainder => % operator
let REM=$NUMBER1%$NUMBER2
echo "Remainder of two numbers : ${REM}"

# Exponent => ** operator
let EXPO=$NUMBER1**$NUMBER2
echo "Exponent of two numbers : ${EXPO}"
```

![Do Mathematical Operations In Bash Scripts][2]

You can also do post increment and post decrement operations too. This operation will be mostly used when we are running loops in the script.

* The post increment operation will increase the variable value to VARIABLE + 1.
* The pre-increment operation will increase the variable value to VARIABLE - 1.

```
let variable++let variable--
```

![Do Post Increment And Post Decrement Operations][3]

You can also do other comparison operations like checking for equality, inequality, greater than, less than, etc. I would strongly recommend not using the `let` command to do any comparison operations as there are better ways to handle it.

### Do Arithmetic Operations In Bash Using The Built-in Double Brackets

As an alternative to the `let` command, you can use the **double brackets** method where you have to place the operator and the operand within the double brackets.

The advantage of this method over the `let` command is that the result can be straightaway printed or stored in a variable and you can add spaces between the operator and the operand. Similar to the `let` command, you cannot do any floating point operations.

The example given below is pretty much the same as the examples shown in the `let` command. All you have to do is put your expression inside double brackets. There is no need to prepend the variables with the **$** symbol inside the double brackets. Just give the variable name and the value will be interpreted.

From the below image, if you can see lines 12 and 13 you will see a difference in how the expression is handled. Anything within the brackets will be first evaluated and the result of it will be computed against other operands. You can see this behavior in the output of **"Multiply"** and **"Multiply1"**.

![Perform Arithmetic Operations In Bash Scripts Using Double Brackets][4]

Similar to the `let` command, you can also do post increment and decrement operations.

```
((NUMBER2++)((NUMBER1--))
```

You can also perform shorthand operations.

```
(( NUMBER2 = NUMBER2 + 10 ))(( NUMBER2 += 10 )) # Shorthand
```

![Perform Post Increment And Decrement Operations][5]

### Perform Arithmetic Operations In Bash Using Expr Utility

In the previous sections, we have seen about built-in functionality and in this section, we will take a look at **"expr"**, which is an external program.

Not only the mathematical operations, the expr utility can also do operations on strings like finding the index of a character, length of a string, substring etc.

Before using the expr program, go through the man page which will give you a fair bit of understanding about this utility.

```
$ man expr$ expr -help
```

Following is the syntax for the `expr` command:

```
$ expr
```

The basic arithmetic operation is the same as what we have seen in the previous sections. The only difference here is when using ***** to do a multiplication operation you have to escape it with **"\"** otherwise it will throw an error.

```
expr 10 + 3 # Additionexpr 10 - 3 # Subtractionexpr 10 * 3 # Multiplyexpr 10 / 3 # Divideexpr 10 % 3 # Remainder
```

![Perform Arithmetic Operations In Bash Using Expr Utility][6]

Till now we have seen about three different ways to do basic arithmetic and incremental operation. Compared to the `let` and `expr`, the **recommended approach is to use double parentheses**.

A commonality with these three approaches is that they cannot handle floating point operations. You have to rely on external utilities like `awk` and `bc` to do floating point operations.

### Perform Bash Arithmetic Operations Using bc Utility

The **bc** utility is an external program that can be used to do basic as well as complex mathematical operations. **Floating point operation is also supported** by the bc utility.

You can view the type of the bc utility and its manual page using the following commands:

```
$ type -a bc$ man bc
```

Following examples show simple mathematical operations with Integer and floating values.

```
# Add
$ echo "10 + 100" | bc
=> 110

$ echo "10.15 + 11.20" | bc
21.35

# Subtract
$ echo "100 - 25" | bc
=> 75

$ echo "100 - 25.5" | bc
=> 74.5

# Multiply
$ echo "10 * 5" | bc
=> 50

$ echo "10.10 * 4" | bc
=> 40.40
```

When doing division operation you have to set the scale value for the result to be printed in floating point value otherwise the result will be an integer value. The value set in the scale decides how many digits to be printed after the decimal.

```
# without scale
echo "10.10 / 4" | bc
=> 2
```

```
# with scaleecho "scale=2;10.10 / 4" | bc=> 2.52
```

You can also do exponent operation.

```
$ echo "2.2^4" | bc=> 23.4
```

### Perform Mathematical Operations With AWK

**Awk** offers more functionality to do mathematical computation compared to other utilities. It has a couple of built-in functions which will make our life easy.

Below is the syntax to do mathematical computation.

```
$ awk "BEGIN {print expression }"
```

To perform a simple multiplication, run:

```
$ awk "BEGIN {print 23 * 4.5 }"=> 103.5
```

From a floating point value, you can get the integer value alone using the `int` function.

```
$ awk "BEGIN{print int(10.111) }"=> 10
```

You can also calculate the square root of a given number using the `sqrt` function.

```
$ awk "BEGIN{print sqrt(10) }"=> 3.16228
```

Particularly when working with CSV files I often end up in situations to compute the average of a column. You can simply calculate the average of a column with the following code.

Since this is a CSV file, I am setting the field separator to(-F “,”). Here the entire second column is first added and divided by the NR(number of records).

```
$ awk -F "," '{sum+=$2} END { print "average value from column 2 = ",sum/NR}' data.csv
```

We will post a detailed guide about **awk** in the days to come.

### Conclusion

In this article, I have shown you various methods to perform simple mathematical operations in Bash. If you are performing very simple arithmetic operations, stick with the double bracket approach and for more complex operations use awk.

--------------------------------------------------------------------------------

via: https://ostechnix.com/bash-arithmetic-operations/

作者：[Karthick][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/karthick/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/09/Display-let-Command-Help-Section.png
[2]: https://ostechnix.com/wp-content/uploads/2022/09/Do-Mathematical-Operations-In-Bash-Scripts.png
[3]: https://ostechnix.com/wp-content/uploads/2022/09/Do-Post-Increment-And-Post-Decrement-Operations.png
[4]: https://ostechnix.com/wp-content/uploads/2022/09/Perform-Arithmetic-Operations-In-Bash-Scripts-Using-Double-Brackets.png
[5]: https://ostechnix.com/wp-content/uploads/2022/09/Perform-Post-Increment-And-Decrement-Operations.png
[6]: https://ostechnix.com/wp-content/uploads/2022/09/Perform-Arithmetic-Operations-In-Bash-Using-Expr-Utility.png
