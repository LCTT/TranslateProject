[#]: subject: "Use open source commands in Powershell"
[#]: via: "https://opensource.com/article/22/10/set-path-powershell"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use open source commands in Powershell
======

When you launch an application on an operating system, there are certain code libraries and utility applications that your OS needs to use for that app to run. Your OS knows how to find these libraries and utilities because it has a _system path,_ a map to common shared data that lots of apps need. Every OS has this, but users aren’t usually aware of it because they don’t usually need to care about it. However, when you start coding or using special network utilities or commands, you might care about your own PATH variable.

The PATH variable makes it so that you can save commands to a consistent location, and use them from anywhere on your system using the command prompt or the more powerful (and open source) [Powershell][1].

For instance, say you want to install the open source application `pscp.exe`, a command-line interface to the famous PuTTY OpenSSH client on Windows. You can download it to your hard drive, but how does your command-line know that it exists? Well at first, it doesn’t:

```
PS> pscp
 pscp: The term 'pscp' is not recognized as the name of a cmdlet, script file, or operable program. 
 Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
```

If you’re using an open source command line, such as Powershell or [Cmder][2], you get a useful error hinting that this might be a problem with your path (or the lack thereof). Here’s how to solve that problem.

### Setting a PATH

- First, create a folder called `App` on your Desktop.
- Next, right-click on the Windows menu in the bottom left corner of your screen, and select **System**.

![Image of the Windows menu system.][3]

Image by: 

(Alan Smithee, CC BY-SA 4.0)

- In the **System** window that appears, click the link to **Advanced system settings** on the left of the window.
- In the **System properties** window that appears, click the **Environment variables** button at the bottom of the window.

![Image Windows system enviroment variables.][4]

Image by: 

(Alan Smithee, CC BY-SA 4.0)

- In the **Environment variables** window, click the **New** button under the **User variables** panel.

![Image of new Windows enviroment variables.][5]

Image by: 

(Alan Smithee, CC BY-SA 4.0)

- In the dialog box that appears, enter `PATH` for the **Variable name** field, and `%USERPROFILE\Desktop\App` for the **Variable value** field. Click the **OK** button to save your changes.

![Image of Windows path set.][6]

Image by: 

(Alan Smithee, CC BY-SA 4.0)

Place commands and applications you want to have access to from a command prompt in `Desktop\Apps` and Powershell, Cmder, and even Cmd will find them:

```
PS> pscp –version
 pscp: Release 0.XY
 Build platform: 64-bit x86 Windows
 PS>
```

### Automatic PATH settings

Many applications get automatically added to the system path during installation. However, not all of them do, either because you missed a check box during the install process, or because the application developer expects you to add it yourself. When automatic paths fail, you now know how to forge your own path.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/set-path-powershell

作者：[Alan Smithee][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lkxed
[1]: https://opensource.com/article/18/2/powershell-people
[2]: http://cmder.app/
[3]: https://opensource.com/sites/default/files/2022-10/windows-menu-system.png
[4]: https://opensource.com/sites/default/files/2022-10/windows-system-environment-variables.png
[5]: https://opensource.com/sites/default/files/2022-10/windows-environment-variables-new.png
[6]: https://opensource.com/sites/default/files/2022-10/windows-path-set.png
