The List Of Useful Bash Keyboard Shortcuts
======
![](https://www.ostechnix.com/wp-content/uploads/2018/02/Bash-720x340.jpg)

Nowadays, I spend more time in Terminal, trying to accomplish more in CLI than GUI. I learned many BASH tricks over time. And, here is the list of useful of BASH shortcuts that every Linux users should know to get things done faster in their BASH shell. I won’t claim that this list is a complete list of BASH shortcuts, but just enough to move around your BASH shell faster than before. Learning how to navigate faster in BASH Shell not only saves some time, but also makes you proud of yourself for learning something worth. Well, let’s get started.

### List Of Useful Bash Keyboard Shortcuts

#### ALT key shortcuts

1\. **ALT+A** – Go to the beginning of a line.

2\. **ALT+B** – Move one character before the cursor.

3\. **ALT+C** – Suspends the running command/process. Same as CTRL+C

4\. **ALT+D** – Closes the empty Terminal (I.e it closes the Terminal when there is nothing typed). Also deletes all chracters after the cursor.

5\. **ALT+F** – Move forward one character.

6\. **ALT+T** – Swaps the last two words.

7\. **ALT+U** – Capitalize all characters in a word after the cursor.

8\. **ALT+L** – Uncaptalize all characters in a word after the cursor.

9\. **ALT+R** – Undo any changes to a command that you have brought from the history if you’ve edited it.

As you see in the above output, I have pulled a command using reverse search and changed the last characters in that command and revert the changes using **ALT+R**.

10\. **ALT+.** (note the dot at the end) – Use the last word of the previous command.

If you want to use the same options for multiple commands, you can use this shortcut to bring back the last word of previous command. For instance, I need to short the contents of a directory using “ls -r” command. Also, I want to view my Kernel version using “uname -r”. In both commands, the common word is “-r”. This is where ALT+. shortcut comes in handy. First run, ls -r command to do reverse shorting and use the last word “-r” in the nex command i.e uname.

#### CTRL key shortcuts

1\. **CTRL+A** – Quickly move to the beginning of line.

Let us say you’re typing a command something like below. While you’re at the N’th line, you noticed there is a typo in the first character
```
$ gind . -mtime -1 -type

```

Did you notice? I typed “gind” instead of “find” in the above command. You can correct this error by pressing the left arrow all the way to the first letter and replace “g” with “f”. Alternatively, just hit the **CTRL+A** or **Home** key to instantly go to the beginning of the line and replace the misspelled character. This will save you a few seconds.

2\. **CTRL+B** – To move backward one character.

This shortcut key can move the cursor backward one character i.e one character before the cursor. Alternatively, you can use LEFT arrow to move backward one character.

3\. **CTRL+C** – Stop the currently running command

If a command takes too long to complete or if you mistakenly run it, you can forcibly stop or quit the command by using **CTRL+C**.

4\. **CTRL+D** – Delete one character backward.

If you have a system where the BACKSPACE key isn’t working, you can use **CTRL+D** to delete one character backward. This shortcut also lets you logs out of the current session, similar to exit.

5\. **CTRL+E** – Move to the end of line

After you corrected any misspelled word in the start of a command or line, just hit **CTRL+E** to quickly move to the end of the line. Alternatively, you can use END key in your keyboard.

6\. **CTRL+F** – Move forward one character

If you want to move the cursor forward one character after another, just press **CTRL+F** instead of RIGHT arrow key.

7\. **CTRL+G** – Leave the history searching mode without running the command.

As you see in the above screenshot, I did the reverse search, but didn’t execute the command and left the history searching mode.

8\. **CTRL+H** – Delete the characters before the cursor, same as BASKSPACE.

9\. **CTRL+J** – Same as ENTER/RETURN key.

ENTER key is not working? No problem! **CTRL+J** or **CTRL+M** can be used as an alternative to ENTER key.

10\. **CTRL+K** – Delete all characters after the cursor.

You don’t have to keep hitting the DELETE key to delete the characters after the cursor. Just press **CTRL+K** to delete all characters after the cursor.

11\. **CTRL+L** – Clears the screen and redisplay the line.

Don’t type “clear” to clear the screen. Just press CTRL+L to clear and redisplay the currently typed line.

12\. **CTRL+M** – Same as CTRL+J or RETURN.

13\. **CTRL+N** – Display next line in command history.

You can also use DOWN arrow.

14\. **CTRL+O** – Run the command that you found using reverse search i.e CTRL+R.

15\. **CTRL+P** – Displays the previous line in command history.

You can also use UP arrow.

16\. **CTRL+R** – Searches the history backward (Reverse search).

17\. **CTRL+S** – Searches the history forward.

18\. **CTRL+T** – Swaps the last two characters.

This is one of my favorite shortcut. Let us say you typed “sl” instead of “ls”. No problem! This shortcut will transposes the characters as in the below screenshot.

![][2]

19\. **CTRL+U** – Delete all characters before the cursor (Kills backward from point to the beginning of line).

This shortcut will delete all typed characters backward at once.

20\. **CTRL+V** – Makes the next character typed verbatim

21\. **CTRL+W** – Delete the words before the cursor.

Don’t confuse it with CTRL+U. CTRL+W won’t delete everything behind a cursor, but a single word.

![][3]

22\. **CTRL+X** – Lists the possible filename completions of the current word.

23\. **CTRL+XX** – Move between start of command line and current cursor position (and back again).

24\. **CTRL+Y** – Retrieves last item that you deleted or cut.

Remember, we deleted a word “-al” using CTRL+W in the 21st command. You can retrieve that word instantly using CTRL+Y.

![][4]

See? I didn’t type “-al”. Instead, I pressed CTRL+Y to retrieve it.

25\. **CTRL+Z** – Stops the current command.

You may very well know this shortcut. It kills the currently running command. You can resume it with **fg** in the foreground or **bg** in the background.

26\. **CTRL+[** – Equivalent to ESC key.

#### Miscellaneous

1\. **!!** – Repeats the last command.

2\. **ESC+t** – Swaps the last tow words.

That’s all I have in mind now. I will keep adding more if I came across any Bash shortcut keys in future. If you think there is a mistake in this article, please do notify me in the comments section below. I will update it asap.

Cheers!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/list-useful-bash-keyboard-shortcuts/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/02/CTRLT-1.gif
[3]:http://www.ostechnix.com/wp-content/uploads/2018/02/CTRLW-1.gif
[4]:http://www.ostechnix.com/wp-content/uploads/2018/02/CTRLY-1.gif
