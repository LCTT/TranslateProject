[#]: subject: (Automate tasks with BAT files on FreeDOS)
[#]: via: (https://opensource.com/article/21/6/automate-tasks-bat-files-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Automate tasks with BAT files on FreeDOS
======
Here's a helpful guide to batch files under FreeDOS.
![Tips and gears turning][1]

Even if you haven't used DOS before, you are probably aware of its command-line shell, named simply `COMMAND.COM`. The `COMMAND.COM` shell has become synonymous with DOS, and so it's no surprise that FreeDOS also implements a similar shell called "FreeCOM"—but named `COMMAND.COM` just as on other DOS systems.

But the FreeCOM shell can do more than just provide a command-line prompt where you run commands. If you need to automate tasks on FreeDOS, you can do that using _batch files_, also called "BAT files" because these scripts use the `.BAT` extension.

Batch files are much simpler than scripts you might write on Linux. That's because when this feature was originally added to DOS, long ago, it was meant as a way for DOS users to "batch up" certain commands. There's not much flexibility for conditional branching, and batch files do not support more advanced features such as arithmetic expansion, separate redirection for standard output vs error messages, background processes, tests, loops, and other scripting structures that are common in Linux scripts.

Here's a helpful guide to batch files under FreeDOS. Remember to reference environment variables by wrapping the variable name with percent signs (`%`) such as `%PATH%`. However, note that `FOR` loops use a slightly different construct for historical reasons.

### Printing output

Your batch file might need to print messages to the user, to let them know what's going on. Use the `ECHO` statement to print messages. For example, a batch file might indicate it is done with a task with this statement:


```
`ECHO Done`
```

You don't need quotes in the `ECHO` statement. The FreeCOM `ECHO` statement will not treat quotes in any special way and will print them just like regular text.

Normally, FreeDOS prints out every line in the batch file as it executes them. This is usually not a problem in a very short batch file that only defines a few environment variables for the user. But for longer batch files that do more work, this constant display of the batch lines can become bothersome. To suppress this output, use the `OFF` keyword to the `ECHO` statement, as:


```
`ECHO OFF`
```

To resume displaying the batch lines as FreeDOS runs them, use the `ON` keyword instead:


```
`ECHO ON`
```

Most batch files include an `ECHO OFF` statement on the first line, to suppress messages. But the shell will still print `ECHO OFF` to the screen as it executes that statement. To hide that message, batch files often use an at sign (`@`) in front. This special character at the start of any line in a batch file suppresses printing that line, even if `ECHO` is turned on.


```
`@ECHO OFF`
```

### Comments

When writing any long batch file, most programmers prefer to use _comments_ to remind themselves about what the batch file is meant to do. To enter a comment in a batch file, use the `REM` (for _remark_) keyword. Anything after `REM` gets ignored by the FreeCOM shell.


```
@ECHO OFF
REM This is a comment
```

### Executing a "secondary" batch file

Normally, FreeCOM only runs one batch file at a time. However, you might need to use another batch file to do certain things, such as set environment variables that are common across several batch files.

If you simply call the second batch file from a "running" batch file, FreeCOM switches entirely to that second batch file and stops processing the first one. To instead run the second batch file "inside" the first batch file, you need to tell the FreeCOM shell to _call_ the second batch file with the `CALL` keyword.


```
@ECHO OFF
CALL SETENV.BAT
```

### Conditional evaluation

Batch files do support a simple conditional evaluation structure with the `IF` statement. This has three basic forms:

  1. Testing the return status of the previous command
  2. Testing if a variable is equal to a value
  3. Testing if a file exists



A common use of the `IF` statement is to test if a program returned successfully to the operating system. Most programs will return a zero value if they completed normally, or some other value in case of an error. In DOS, this is called the _error level_ and is a special case to the `IF` test.

To test if a program called `MYPROG` exited successfully, you actually want to examine if the program returned a "zero" error level. Use the `ERRORLEVEL` keyword to test for a specific value, such as:


```
@ECHO OFF
MYPROG
IF ERRORLEVEL 0 ECHO Success
```

Testing the error level with `ERRORLEVEL` is a clunky way to examine the exit status of a program. A more useful way to examine different possible return codes for a DOS program is with a special variable FreeDOS defines for you, called `ERRORLEVEL`. This stores the error level of the most recently executed program. You can then test for different values using the `==` test.

You can test if a variable is equal to a value using the `==` test with the `IF` statement. Like some programming languages, you use `==` to directly compare two values. Usually, you will reference an environment variable on one side and a value on the other, but you could also compare the values of two variables to see if they are the same. For example, you could rewrite the above `ERRORLEVEL` code with this batch file:


```
@ECHO OFF
MYPROG
IF %ERRORLEVEL%==0 ECHO Success
```

And another common use of the `IF` statement is to test if a file exists, and take action if so. You can test for a file with the `EXIST` keyword. For example, to delete a temporary file called `TEMP.DAT`, you might use this line in your batch file:


```
@ECHO OFF
IF EXIST TEMP.DAT DEL TEMP.DAT
```

With any of the `IF` statements, you can use the `NOT` keyword to _negate_ a test. To print a message if a file _does not_ exist, you could write:


```
@ECHO OFF
IF NOT EXIST TEMP.DAT ECHO No file
```

### Branched execution

One way to leverage the `IF` test is to jump to an entirely different part of the batch file, depending on the outcome of a previous test. In the simplest case, you might want to skip to the end of the batch file if a key command fails. Or you might want to execute other statements if certain environment variables are not set up correctly.

You can skip around to different parts of a batch file using the `GOTO` instruction. This jumps to a specific line, called a _label_, in the batch file. Note that this is a strict "go-to" jump; batch file execution picks up at the new label.

Let's say a program needed an existing empty file to store temporary data. If the file did not exist, you would need to create a file before running the program. You might add these lines to a batch file, so your program always has a temporary file to work with:


```
@ECHO OFF
IF EXIST temp.dat GOTO prog
ECHO Creating temp file...
TOUCH temp.dat
:prog
ECHO Running the program...
MYPROG
```

Of course, this is a very simple example. For this one case, you might instead rewrite the batch file to create the temporary file as part of the `IF` statement:


```
@ECHO OFF
IF NOT EXIST temp.dat TOUCH temp.dat
ECHO Running the program...
MYPROG
```

### Iteration

What if you need to perform the same task over a set of files? You can _iterate_ over a set of files with the `FOR` loop. This is a one-line loop that runs a single command with a different file each time.

The `FOR` loop uses a special syntax for the iteration variable, which is used differently than other DOS environment variables. To loop through a set of text files so you can edit each one, in turn, use this statement in your batch file:


```
@ECHO OFF
FOR %F IN (*.TXT) DO EDIT %F
```

Note that the iteration variable is specified with only one percent sign (`%`) if you run this loop at the command line, without a batch file:


```
`C:\> FOR %F IN (*.TXT) DO EDIT %F`
```

### Command-line processing

FreeDOS provides a simple method to evaluate any command-line options the user might have provided when running batch files. FreeDOS parses the command line, and stores the first nine batch file options in the special variables `%1`, `%2`, .. and so on until `%9`. Notice that the eleventh option (and beyond) are not directly accessible in this way. (The special variable `%0` stores the name of the batch file.)

If your batch file needs to process more than nine options, you can use the `SHIFT` statement to remove the first option and _shift_ every option down by one value. So the second option becomes `%1`, and the tenth option becomes `%9`.

Most batch files need to shift by one value. But if you need to shift by some other increment, you can provide that parameter to the `SHIFT` statement, such as:


```
`SHIFT 2`
```

Here's a simple batch file that demonstrates shifting by one:


```
@ECHO OFF
ECHO %1 %2 %3 %4 %5 %6 %7 %8 %9
ECHO Shift by one ..
SHIFT 1
ECHO %1 %2 %3 %4 %5 %6 %7 %8 %9
```

Executing this batch file with ten arguments shows how the `SHIFT` statement reorders the command line options, so the batch file can now access the tenth argument as `%9`:


```
C:\SRC&gt;args 1 2 3 4 5 6 7 8 9 10
1 2 3 4 5 6 7 8 9
Shift by one ..
2 3 4 5 6 7 8 9 10
C:\SRC&gt;
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/automate-tasks-bat-files-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
