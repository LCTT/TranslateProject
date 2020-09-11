[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Environment variables in PowerShell)
[#]: via: (https://opensource.com/article/19/9/environment-variables-powershell)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/seth)

Environment variables in PowerShell
======
Up your PowerShell game with environment variables, in Part 2.5 of the
"Variables in shells" miniseries.
![Hands programming][1]

Environment variables are global settings for your Linux, Mac, or Windows computer, stored for the system shell to use when executing commands. Many are set by default during installation or user creation.

For instance, your home directory is set as an environment variable when you log in. How it looks in PowerShell depends on your operating system.

On Windows:


```
PS C:\Users\bogus&gt; Get-Variable HOME -valueOnly
C:\Users\bogus
```

On Linux:


```
pwsh&gt; Get-Variable HOME -valueOnly
HOME=/home/seth
```

On a Mac:


```
pwsh&gt; Get-Variable HOME -valueOnly
HOME=/Users/bogus
```

You usually don’t use environment variables directly, but they’re referenced by individual applications and daemons as needed. However, environment variables can be useful when you want to override default settings, or when you need to manage new settings that your system has no reason to create on its own.

This article is about environment variables in the open source PowerShell environment, and so it’s applicable to PowerShell running on Windows, Linux, and Mac. Users of the Bash shell should refer to my article about [Bash environment variables][2].

For this article, I ran PowerShell on the open source operating system Linux. The commands are the same regardless of your platform, although the output will differ (for instance, it is statistically unlikely that your username is **seth**).

### What are environment variables?

Environment variables in PowerShell are special kinds of variables that provide the system with information about the operating system environment. With environment variables, you can view and change variables in the Windows registry, as well as variables set for a particular session.

In PowerShell, environment variables are stored in the **Env:** "drive", accessible through the _PowerShell environment provider_, a subsystem of PowerShell. This isn’t a physical drive, but a virtual file system.

Because environment variables exist in the **Env:** drive, you must prepend **Env:** to the variable name when you reference them. Alternatively, you can set your working location to the **Env:** drive with the **Set-Location** command so you can treat all environment variables as local variables:


```
PS&gt; Set-Location Env:
PS&gt; pwd

Path
\----
Env:/
```

Environment variables convey information about your login session to your computer. For instance, when an application needs to determine where to save a data file by default, it usually calls upon the **HOME** environment variable. You probably never set the **HOME** variable yourself, and yet it exists because most environment variables are managed by your operating system.

You can view all environment variables set on your system with the **Get-ChildItem** command from within the **Env:** drive. The list is long, so pipe the output through **out-host -paging** to make it easy to read:


```
PS&gt; Get-ChildItem | out-host -paging
LOGNAME      seth
LS_COLORS    rs=0:mh=00:bd=48;5;232;38;5;
MAIL         /var/spool/mail/seth
MODULEPATH   /etc/scl/modulefiles:/etc/scl/modulefiles
MODULESHOME  /usr/share/Modules
OLDPWD       /home/seth
PATH         /opt/microsoft/powershell/6:/usr/share/Modules/bin
PSModulePath /home/seth/.local/share/powershell/Modules
PWD          /home/seth
[...]
```

If you’re not in the **Env:** drive, then you can do the same thing by adding **Env: **to your command:


```
PS&gt; Get-ChildItem Env: | out-host -paging
LOGNAME      seth
LS_COLORS    rs=0:mh=00:bd=48;5;232;38;5;
MAIL         /var/spool/mail/seth
MODULEPATH   /etc/scl/modulefiles:/etc/scl/modulefiles
```

Environment variables can be set, recalled, and cleared with some of the same syntax used for normal variables. Like other variables, anything you set during a session only applies to that particular session.

If you want to make permanent changes to a variable, you must change them in Windows Registry on Windows, or in a shell configuration file (such as **~/.bashrc**) on Linux or Mac. If you’re not familiar with using variables in PowerShell, read my [variables in PowerShell][3] article before continuing.

### What are environment variables used for?

Different environment variables get used by several different systems within your computer. Your **PATH** variable is vital to your shell, for instance, but a lot less significant to, say, Java (which also has paths, but they’re paths to important Java libraries rather than general system folders). However, the **USER** variable is used by several different processes to identify who is requesting a service.

An installer wizard, like the open source [Nullsoft Scriptable Install System (NSIS)][4] framework, updates your environment variables when you’re installing a new application. Sometimes, when you’re installing something outside of your operating system’s intended toolset, you may have to manage an environment variable yourself. Or, you might choose to add an environment variable to suit your preferences.

### How are they different from regular variables?

When you create a normal variable, the variable is considered local, meaning that it’s not defined outside of the shell that created it.

For example, create a variable:


```
PS&gt; Set-Variable -Name VAR -Value "example"
PS&gt; gv VAR -valueOnly
example
```

Launch a new shell, even from within your current shell:


```
PS&gt; pwsh
PS c:\&gt; gv VAR -valueOnly
gv : Cannot find a variable with the name 'example'.
```

Environment variables, on the other hand, are meant to be global in scope. They exist separately from the shell that created them and are available to other processes.

### How do you set an environment variable?

When setting an environment variable, you should be explicit that it is an environment variable by using the **$Env:** notation:


```
PS Env:/&gt; $Env:FOO = "hello world"
PS Env:/&gt; Get-ChildItem FOO
hello world
```

As a test, launch a new session and access the variable you’ve just created. Because the variable is an environment variable, though, you must prepend it with **$Env:**:


```
PS Env:/&gt; pwsh
PS c:\&gt; $Env.FOO
hello world
```

Even though you’ve made a variable available to child processes, it’s still just a temporary variable. It works, you can verify that it exists, you can use it from any process, but it is destroyed when the shell that created it is closed.

### How do you set environment variables in your profile?

To force an environment variable to persist across sessions, you must add it to your PowerShell profile, such as your **CurrentUser,AllHosts** profile, located in **HOME/Documents/Profile.ps1**:


```
PS&gt; Add-Content -Path $Profile.CurrentUserAllHosts -Value '$Env:FOO = "hello world"'
```

With this line added, any PowerShell session launched instantiates the **FOO** environment variable and sets its value to **hello world**.

There are currently six default profiles controlling PowerShell sessions, so refer to the [Microsoft dev blog][5] for more information.

### How do you discover new environment variables?

You can create and manipulate environment variables at will, and some applications do just that. This fact means that many of your environment variables aren’t used by most of your applications, and if you add your own arbitrary variables then some could be used by nothing at all.

So the question is: How do you find out which environment variables are meaningful? The answer lies in an application’s documentation.

Python, for instance, offers to add the appropriate Python path to your **Path** environment variable during install. **[Note: PATH?]** If you decline, you can set the value yourself now that you know how to modify environment variables.

The same is true for any application you install: The installer is expected to add the appropriate variables to your environment, so you should never need to modify **Env:** manually. If you’re developing an application, then your installer should do the same for your users.

To discover significant variables for individual applications, refer to their user and developer documentation.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/environment-variables-powershell

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://opensource.com/article/19/8/what-are-environment-variables
[3]: https://opensource.com/article/19/8/variables-powershell
[4]: https://sourceforge.net/projects/nsis/
[5]: https://devblogs.microsoft.com/scripting/understanding-the-six-powershell-profiles
