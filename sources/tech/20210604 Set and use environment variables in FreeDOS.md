[#]: subject: (Set and use environment variables in FreeDOS)
[#]: via: (https://opensource.com/article/21/6/freedos-environment-variables)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Set and use environment variables in FreeDOS
======
Environment variables are helpful in almost every command-line
environment, including FreeDOS.
![Looking at a map for career journey][1]

A useful feature in almost every command-line environment is the _environment variable_. Some of these variables allow you to control the behavior or features of the command line, and other variables simply allow you to store data that you might need to reference later. Environment variables are also used in FreeDOS.

### Variables on Linux

On Linux, you may already be familiar with several of these important environment variables. In the [Bash][2] shell on Linux, the `PATH` variable identifies where the shell can find programs and commands. For example, on my Linux system, I have this `PATH` value:


```
bash$ echo $PATH
/home/jhall/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin
```

That means when I type a command name like `cat`, Bash will check each of the directories listed in my `PATH` variable, in order:

  1. `/home/jhall/bin`
  2. `/usr/lib64/ccache`
  3. `/usr/local/bin`
  4. `/usr/local/sbin`
  5. `/usr/bin`
  6. `/usr/sbin`



And in my case, the `cat` command is located in the `/usr/bin` directory, so the full path to that command is `/usr/bin/cat`.

To set an environment variable on Linux, you type the name of the variable, then an equals sign (`=`) and then the value to store in the variable. To reference that value later using Bash, you type a dollar sign (`$`) in front of the variable name.


```
bash$ var=Hello
bash$ echo $var
Hello
```

### Variables on FreeDOS

On FreeDOS, environment variables serve a similar function. Some variables control the behavior of the DOS system, and others are useful to store some temporary value.

To set an environment variable on FreeDOS, you need to use the `SET` keyword. FreeDOS is _case insensitive_, so you can type that using either uppercase or lowercase letters. Then set the variable as you might on Linux, using the variable name, an equals sign (`=`), and the value you want to store.

However, referencing or _expanding_ an environment variable's value in FreeDOS is quite different from how you do it on Linux. You can't use the dollar sign (`$`) to reference a variable in FreeDOS. Instead, you need to surround the variable's name with percent signs (`%`).

![Use % \(not $\) to reference a variable's value][3]

(Jim Hall, [CC-BY SA 4.0][4])

It's important to use the percent signs both before and after the name because that's how FreeDOS knows where the variable name begins and ends. This is very useful, as it allows you to reference a variable's value while immediately appending (or prepending) other text to the value. Let me demonstrate this by setting a new variable called `reply` with the value `yes`, then referencing that value with the text "11" before and "22" after it:

![Set and reference an environment variable][5]

(Jim Hall, [CC-BY SA 4.0][4])

Because FreeDOS is case insensitive you can also use uppercase or lowercase letters for the variable name, as well as the `SET` keyword. However, the variable's value will use the letter case as you typed it on the command line.

Finally, you can see a list of all the environment variables currently defined in FreeDOS. Without any arguments, the `SET` keyword will display all variables, so you can see everything at a glance:

![Show all variables at once with SET][6]

(Jim Hall, [CC-BY SA 4.0][4])

Environment variables are a useful staple in command-line environments, and the same applies to FreeDOS. You can set your own variables to serve your own needs, but be careful about changing some of the variables that FreeDOS uses. These can change the behavior of your running FreeDOS system:

  * **DOSDIR**: The location of the FreeDOS installation directory, usually `C:\FDOS`
  * **COMSPEC**: The current instance of the FreeDOS shell, usually `C:\COMMAND.COM` or `%DOSDIR%\BIN\COMMAND.COM`
  * **LANG**: The user's preferred language
  * **NLSPATH**: The location of the system's language files, usually `%DOSDIR%\NLS` 
  * **TZ**: The system's time zone
  * **PATH**: A list of directories where FreeDOS can find programs to run, such as `%DOSDIR%\BIN`
  * **HELPPATH**: The location of the system's documentation files, usually `%DOSDIR%\HELP`
  * **TEMP**: A temporary directory where FreeDOS stores output from each command as it "pipes" data between programs on the command line
  * **DIRCMD**: A variable that controls how the `DIR` command displays files and directories, typically set to `/OGNE` to order (O) the contents by grouping (G) directories first, then sorting entries by name (N) then extension (E)



If you accidentally change any of the FreeDOS "internal" variables, you could prevent some parts of FreeDOS from working properly. In that case, simply reboot your computer, and FreeDOS will reset the variables from the system defaults.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-environment-variables

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/career_journey_road_gps_path_map_520.png?itok=PpL6jJgY (Looking at a map for career journey)
[2]: https://opensource.com/article/19/8/using-variables-bash
[3]: https://opensource.com/sites/default/files/uploads/env-path.png (Use % (not $) to reference a variable's value)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/env-vars.png (Set and reference an environment variable)
[6]: https://opensource.com/sites/default/files/uploads/env-set.png (Show all variables at once with SET)
