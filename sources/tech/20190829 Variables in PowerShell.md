[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Variables in PowerShell)
[#]: via: (https://opensource.com/article/19/8/variables-powershell)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Variables in PowerShell
======
In our miniseries Variables in Shells, learn how to handle local
variables in PowerShell.
![Shells in a competition][1]

In computer science (and casual computing), a variable is a location in memory that holds arbitrary information for later use. In other words, it’s a temporary storage container for you to put data into and get data out of. In the Bash shell, that data can be a word (a _string_, in computer lingo) or a number (an _integer_).

You may have never (knowingly) used a variable before on your computer, but you probably have used a variable in another area of your life. When you say things like "give me that" or "look at this," you’re using grammatical variables (you think of them as _pronouns_). The meaning of "this" and "that" depends on whatever you’re picturing in your mind, or whatever you’re pointing to as an indicator for your audience to know what you’re referring to. When you do math, you use variables to stand in for unknown values, even though you probably don’t call them variables.

This article addresses variables in [PowerShell][2], which runs on Windows, Linux, or Mac. Users of the open source [Bash][3] shell should refer to my article about variables in the Bash shell instead (although you can run PowerShell on Linux, and it is open source, so you can still follow along with this article).

**Note:** The examples in this article are from a PowerShell session running on the open source operating system Linux, so if you’re on Windows or Mac the file paths will differ. However, Windows converts **/** to **\** automatically, and all examples work across all platforms, provided that you substitute obvious differences (for instance, it is statistically unlikely that your username is **seth**).

### What are variables for?

Whether you need variables in PowerShell depends on what you do in a terminal. For some users, variables are an essential means of managing data, while for others they’re minor and temporary conveniences, or for some, they may as well not exist.

Ultimately, variables are a tool. You can use them when you find a use for them, or leave them alone in the comfort of knowing they’re managed by your OS. Knowledge is power, though, and understanding how variables work in Bash can lead you to all kinds of unexpected creative problem-solving.

### Set a variable

You don’t need special permissions to create a variable. They’re free to create, free to use, and generally harmless. In PowerShell, you create a variable by defining a variable name and then setting its value with the **Set-Variable** command. The example below creates a new variable called **FOO** and sets its value to the string **$HOME/Documents**:


```
`PS> Set-Variable -Name FOO -Value "$HOME/Documents"`
```

Success is eerily silent, so you may not feel confident that your variable got set. You can see the results for yourself with the **Get-Variable** (**gv** for short) command. To ensure that the variable is read exactly as you defined it, you can also wrap it in quotes. Doing so preserves any special characters that might appear in the variable; in this example, that doesn’t apply, but it’s still a good habit to form:


```
PS&gt; Get-Variable "FOO" -valueOnly
/home/seth/Documents
```

Notice that the contents of **FOO** aren’t exactly what you set. The literal string you set for the variable was **$HOME/Documents**, but now it’s showing up as **/home/seth/Documents**. This happened because you can nest variables. The **$HOME** variable points to the current user’s home directory, whether it’s in **C:\Users** on Windows, **/home** on Linux, or **/Users** on Mac. Since **$HOME** was embedded in **FOO**, that variable gets _expanded_ when recalled. Using default variables in this way helps you write portable scripts that operate across platforms.

Variables usually are meant to convey information from one system to another. In this simple example, your variable is not very useful, but it can still communicate information. For instance, because the content of the **FOO** variable is a [file path][4], you can use **FOO** as a shortcut to the directory its value references.

To reference the variable **FOO**’s _contents_ and not the variable itself, prepend the variable with a dollar sign (**$**):


```
PS&gt; pwd
/home/seth
PS&gt; cd "$FOO"
PS&gt; pwd
/home/seth/Documents
```

### Clear a variable

You can remove a variable with the **Remove-Variable** command:


```
PS&gt; Remove-Variable -Name "FOO"
PS&gt; gv "FOO"
gv : Cannot find a variable with the name 'FOO'.
[...]
```

In practice, removing a variable is not usually necessary. Variables are relatively "cheap," so you can create them and forget them when you don’t need them anymore. However, there may be times you want to ensure a variable is empty to avoid conveying unwanted information to another process that might read that variable.

### Create a new variable with collision protection

Sometimes, you may have reason to believe a variable was already set by you or some other process. If you would rather not override it, you can either use **New-Variable**, which is designed to fail if a variable with the same name already exists, or you can use a conditional statement to check for a variable first:


```
PS&gt; New-Variable -Name FOO -Value "example"
New-Variable : A variable with name 'FOO' already exists.
```

**Note:** In these examples, assume that **FOO** is set to **/home/seth/Documents**.

Alternately, you can construct a simple **if** statement to check for an existing variable:


```
PS&gt; if ( $FOO )
&gt;&gt; { gv FOO } else
&gt;&gt; { Set-Variable -Name "FOO" -Value "quux" }
```

### Add to a variable

Instead of overwriting a variable, you can add to an existing one. In PowerShell, variables have diverse types, including string, integer, and array. When choosing to create a variable with, essentially, more than one value, you must decide whether you need a [character-delimited string][5] or an [array][6]. You may not care one way or the other, but the application receiving the variable’s data may expect one or the other, so make your choice based on your target.

To append data to a string variable, use the **=+** syntax:


```
PS&gt; gv FOO
foo
PS&gt; $FOO =+ "$FOO,bar"
PS&gt; gv FOO
foo,bar
PS&gt; $FOO.getType().Name
String
```

Arrays are special types of variables in PowerShell and require an ArrayList object. That’s out of scope for this article, as it requires delving deeper into PowerShell’s .NET internals.

### Go global with environment variables

So far the variables created in this article have been _local_, meaning that they apply only to the PowerShell session you create them in. To create variables that are accessible to other processes, you can create environment variables, which will be covered in a future article.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/variables-powershell

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/shelloff.png?itok=L8pjHXjW (Shells in a competition)
[2]: https://en.wikipedia.org/wiki/PowerShell
[3]: https://www.gnu.org/software/bash/
[4]: https://opensource.com/article/19/8/understanding-file-paths-linux
[5]: https://en.wikipedia.org/wiki/Delimiter
[6]: https://en.wikipedia.org/wiki/Array_data_structure
