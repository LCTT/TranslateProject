[#]: subject: (Get started with batch files in FreeDOS)
[#]: via: (https://opensource.com/article/21/3/batch-files-freedos)
[#]: author: (Kevin O'Brien https://opensource.com/users/ahuka)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Get started with batch files in FreeDOS
======
Batch files are a great way to write your own simple programs and
automate tasks that normally require lots of typing.
![Computer screen with files or windows open][1]

On Linux, it's common to create _shell scripts_ to automate repetitive tasks. Similarly, on [FreeDOS][2], the open source implementation of old DOS operating systems, you can create a _batch file_ containing several FreeDOS commands. Then you can run your batch file to execute each command in order.

You create a batch file by using an ASCII text editor, such as the FreeDOS Edit application. Once you create a batch file, you save it with a file name and the extension `.bat`. The file name should be unique. If you use a FreeDOS command name as your own file name, the FreeDOS command probably will execute instead of your batch file.

Virtually all internal and external FreeDOS commands can be used in a batch file. When you create a batch file, you are essentially writing a program. FreeDOS batch files may not have the power of a structured programming language, but they can be very handy for quick but repetitive tasks.

### Commenting your code

The No. 1 good habit for any programmer to learn is to put comments in a program to explain what the code is doing. This is a very good thing to do, but you need to be careful not to fool the operating system into executing your comments. The way to avoid this is to place `REM` (short for "remark") at the beginning of a comment line.

FreeDOS ignores lines starting with `REM`. But anyone who looks at the source code (the text you've written in your batch file) can read your comments and understand what it's doing. This is also a way to temporarily disable a command without deleting it. Just open your batch file for editing, place `REM` at the beginning of the line you want to disable, and save it. When you want to re-enable that command, just open the file for editing and remove `REM`. This technique is sometimes referred to as "commenting out" a command.

### Get set up

Before you start writing your own batch files, I suggest creating a temporary directory in FreeDOS. This can be a safe space for you to play around with batch files without accidentally deleting, moving, or renaming important system files or directories. On FreeDOS, you [create a directory][3] with the `MD` command:


```
C:\&gt;MD TEMP
C:\&gt;CD TEMP
C:\TEMP&gt;
```

The `ECHO` FreeDOS command controls what is shown on the screen when you run a batch file. For instance, here is a simple one-line batch file:


```
`ECHO Hello world`
```

If you create this file and run it, you will see the sentence displayed on the screen. The quickest way to do this is from the command line: Use the `COPY` command to take the input from your keyboard (`CON`) and place it into the file `TEST1.BAT`. Then press **Ctrl**+**Z** to stop the copy process, and press Return or Enter on your keyboard to return to a prompt.

Try creating this file as `TEST1.BAT` in your temporary directory, and then run it:


```
C:\TEMP&gt;COPY CON TEST1.BAT
CON =&gt; TEST1.BAT
ECHO Hello world
^Z

C:\TEMP&gt;TEST1
Hello world
```

This can be useful when you want to display a piece of text. For instance, you might see a message on your screen telling you to wait while a program finishes its task, or in a networked environment, you might see a login message.

What if you want to display a blank line? You might think that the `ECHO` command all by itself would do the trick, but the `ECHO` command alone asks FreeDOS to respond whether `ECHO` is on or off:


```
C:\TEMP&gt;ECHO
ECHO is on
```

The way to get a blank line is to use a `+` sign immediately after `ECHO`:


```
C:\TEMP&gt;ECHO+

C:\TEMP&gt;
```

### Batch file variables

A variable is a holding place for information you need your batch file to remember temporarily. This is a vital function of programming because you don't always know what data you want your batch file to use. Here's a simple example to demonstrate.

Create `TEST3.BAT`:


```
@MD BACKUPS
COPY %1 BACKUPS\%1
```

Variables are signified by the use of the percentage symbol followed by a number, so this batch file creates a `BACKUPS` subdirectory in your current directory and then copies a variable `%1` into a `BACKUPS` folder. What is this variable? That's up to you to decide when you run the batch file:


```
C:\TEMP&gt;TEST3 TEMP1.BAT
TEST1.BAT =&gt; BACKUPS\TEST1.BAT
```

Your batch file has copied `TEST1.BAT` into a subdirectory called `BACKUPS` because you identified that file as an argument when running your batch file. Your batch file substituted `TEST1.BAT` for `%1`.

Variables are positional. The variable `%1` is the first argument you provide to your command, while `%2` is the second, and so on. Suppose you create a batch file to list the contents of a directory:


```
`DIR %1`
```

Try running it:


```
C:\TEMP&gt;TEST4.BAT C:\HOME
ARTICLES
BIN
CHEATSHEETS
GAMES
DND
```

That works as expected. But this fails:


```
C:\TEMP&gt;TEST4.BAT C:\HOME C:\DOCS
ARTICLES
BIN
CHEATSHEETS
GAMES
DND
```

If you try that, you get the listing of the first argument (`C:\HOME`) but not of the second (`C:\DOCS`). This is because your batch file is only looking for one variable (`%1`), and besides, the `DIR` command can take only one directory.

Also, you don't really need to specify a batch file's extension when you run it—unless you are unlucky enough to pick a name for the batch file that matches one of the FreeDOS external commands or something similar. When FreeDOS executes commands, it goes in the following order:

  1. Internal commands
  2. External commands with the *.COM extension
  3. External commands with the *.EXE extension
  4. Batch files



### Multiple arguments

OK, now rewrite the `TEST4.BAT` file to use a command that takes two arguments so that you can see how this works. First, create a simple text file called `FILE1.TXT` using the `EDIT` application. Put a sentence of some kind inside (e.g., "Hello world"), and save the file in your `TEMP` working directory.

Next, use `EDIT` to change your `TEST4.BAT` file:


```
COPY %1 %2  
DIR
```

Save it, then execute the command:


```
`C:\TEMP\>TEST4 FILE1.TXT FILE2.TXT`
```

Upon running your batch file, you see a directory listing of your `TEMP` directory. Among the files listed, you have `FILE1.TXT` and `FILE2.TXT`, which were created by your batch file.

### Nested batch files

Another feature of batch files is that they can be "nested," meaning that one batch file can be called and run inside another batch file. To see how this works, start with a simple pair of batch files.

The first file is called `NBATCH1.BAT`:


```
@ECHO OFF
ECHO Hello
CALL NBATCH2.BAT  
ECHO world
```

The first line (`@ECHO OFF`) quietly tells the batch file to show only the output of the commands (not the commands themselves) when you run it. You probably noticed in previous examples that there was a lot of feedback about what the batch file was doing; in this case, you're permitting your batch file to display only the results.

The second batch file is called NBATCH2.BAT:


```
`echo from FreeDOS`
```

Create both of these files using `EDIT`, and save them in your TEMP subdirectory. Run `NBATCH1.BAT` to see what happens:


```
C:\TEMP\&gt;NBATCH1.BAT  
Hello
from FreeDOS
world
```

Your second batch file was executed from within the first by the `CALL` command, which provided the string "from FreeDOS" in the middle of your "Hello world" message.

### FreeDOS scripting

Batch files are a great way to write your own simple programs and automate tasks that normally require lots of typing. The more you use FreeDOS, the more familiar you'll become with its commands, and once you know the commands, it's just a matter of listing them in a batch file to make your FreeDOS system make your life easier. Give it a try!

* * *

_Some of the information in this article was previously published in [DOS lesson 15: Introduction to batch files][4] and [DOS lesson 17: Batch file variables; nested batch files][5] (both CC BY-SA 4.0)._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/batch-files-freedos

作者：[Kevin O'Brien][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ahuka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://www.freedos.org/
[3]: https://opensource.com/article/21/2/freedos-commands-you-need-know
[4]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-15-introduction-to-batch-files/
[5]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-17-batch-file-variables-nested-batch-files/
