[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using variables in Bash)
[#]: via: (https://opensource.com/article/19/8/using-variables-bash)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/jpnc)

Using variables in Bash
======
Take advantage of Bash variables with our miniseries: Variables in
shells.
![bash logo on green background][1]

In computer science (and casual computing), a variable is a location in memory that holds arbitrary information for later use. In other words, it’s a temporary storage container for you to put data into and get data out of. In the Bash shell, that data can be a word (a _string_, in computer lingo) or a number (an _integer_).

You may have never (knowingly) used a variable before on your computer, but you probably have used a variable in other areas of your life. When you say things like "give me that" or "look at this," you’re using grammatical variables (you think of them as _pronouns_), because the meaning of "this" and "that" depends on whatever you’re picturing in your mind, or whatever you’re pointing to so your audience knows what you’re referring to. When you do math, you use variables to stand in for an unknown value, even though you probably don’t call it a variable.

Here’s a quick and easy demonstration of a Bash variable you may not realize you use every day. The **PS1** variable holds information about how you want your terminal prompt to appear. For instance, you can set it to something very simple—like a percent sign (**%**)—by redefining the **PS1** variable:


```
$ PS1="% "
%
```

This article addresses variables in a Bash shell running on Linux, BSD, Mac, or Cygwin. Users of Microsoft’s open source [PowerShell][2] should refer to my article about [variables in PowerShell][3].

### What are variables for?

Whether you need variables in Bash depends on what you do in a terminal. For some users, variables are an essential means of managing data, while for others they’re minor and temporary conveniences, and for still others, they may as well not exist.

Ultimately, variables are a tool. You can use them when you find a use for them, or leave them alone in the comfort of knowing they’re managed by your OS. Knowledge is power, though, and understanding how variables work in Bash can lead you to all kinds of unexpected creative problem-solving.

### How to set a variable

You don’t need special permissions to create a variable. They’re free to create, free to use, and generally harmless. In a Bash shell (on Linux and Mac), you can set them by defining a variable name, and then setting its value. The following example creates a new variable called **FOO** and sets the value to the string **/home/seth/Documents**:


```
`$ declare FOO="/home/seth/Documents"`
```

Success is eerily silent, so you may not feel confident that your variable got set. You can see the results for yourself with the **echo command**, recalling your variable by prepending it with a dollar sign (**$**). To ensure that the variable is read exactly as you defined it, you can also wrap it in braces and quotes. Doing this preserves any special characters that might appear in the variable; in this example, that doesn’t apply, but it’s still a good habit to form:


```
$ echo "${FOO}"
/home/seth/Documents
```

Setting variables can be a common thing for people who use the shell often, so the process has become somewhat informal. When a string is followed by an equal sign (**=**) and a value, Bash quietly assumes that you’re setting a variable, making the **declare** keyword unnecessary:


```
`$ FOO="/home/seth/Documents"`
```

Variables usually are meant to convey information from one system to another. In this simple example, your variable is not very useful, but it can still communicate information. For instance, because the content of the **FOO** variable is a [file path][4], you can use the variable as a shortcut to the **~/Documents** directory:


```
$ pwd
/home/seth
$ cd "${FOO}"
$ pwd
/home/seth/Documents
```

Variables can be any non-reserved string (along with integers and underscores). They don't have to be capitalized, but they often are so that they're easy to identify as variables.

### How to clear a variable

You can clear a variable with the **unset** command:


```
$ unset FOO
$ echo $FOO
```

In practice, this action is not usually necessary. Variables are relatively "cheap," so you can create them and then forget them when you don’t need them anymore. However, there may be times you want to ensure a variable is empty to avoid conveying incorrect information to another process that might read the variable.

### Create a new variable with collision protection

Sometimes, you may have reason to believe a variable was already set by you or a process. If you would rather not override it, there’s a special syntax to set a variable to its existing value unless its existing value is empty.

For this example, assume that **FOO** is set to **/home/seth/Documents**:


```
$ FOO=${FOO:-"bar"}
$ echo $FOO
/home/seth/Documents
```

The colon-dash **:-** notation causes **declare** to default to an existing value. To see this process work the other way, clear the variable, and try again:


```
$ unset FOO
$ echo $FOO

$ FOO=${FOO:-"bar"}
$ echo $FOO
bar
```

### Pass variables to a child process

When you create a variable, you are creating what is called a _local variable_. This means that the variable is known to your current shell and only your current shell.

This setup is an intentional limitation of a variable’s _scope_. Variables, by design, tend to default to being locally available only, in an attempt to keep information sharing on a need-to-know basis. If you foolishly create a variable containing an important password in clear text, for example, it’s nice to know that your system won’t allow a remote shell or rogue daemon (or anything else outside the one session that created the variable) access that password.

Use the example from the beginning of this article to change your prompt, but then launch a new shell within your current one:


```
$ PS1="% "
% bash
$
```

When you launch a new shell, the new value of **PS1** is the default prompt instead of your new prompt: A child process does not inherit variables set in its parent. If you kill the child process, you return to the parent shell, and you see your custom **PS1** prompt again:


```
$ exit
%
```

If you want to pass a variable to a child process, you can _prepend_ a command with variable definitions, or you can _export_ the variable to the child process.

### Prepending variables

You can prepend any number of variables before running a command. ****Whether the variables are used by the child process is up to the process, but you can pass the variables to it no matter what:


```
$ FOO=123 bash
$ echo $FOO
123
$
```

Prepending can be a useful trick when you’re running an application requiring a special location for certain libraries (using the **LD_LIBRARY_PATH** variable), or when you’re compiling software with a non-standard compiler (using the **CC** variable), and so on.

### Exporting variables

Another way to make variables available to a child process is the **export** keyword, a command built into Bash. The **export** command broadens the scope of whatever variable or variables you specify:


```
$ PS1="% "
$ FOO=123
$ export PS1
$ export FOO
% bash
% echo $PS1
%
% echo $FOO
123
```

In both cases, it’s not just a child shell that has access to a local variable that’s been passed to it or exported, it’s any child process of that shell. You can launch an application from the same shell, and that variable is available as an environment variable from within the application.

Variables exported for everything on your system to use are called _environment variables_, which is a topic for a future article. In the meantime, try using some variables for everyday tasks to see what they bring to your workflow.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/using-variables-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/sethhttps://opensource.com/users/jpnc
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://github.com/PowerShell/PowerShell
[3]: https://opensource.com/article/19/8/variables-powershell
[4]: https://opensource.com/article/19/8/understanding-file-paths-linux
