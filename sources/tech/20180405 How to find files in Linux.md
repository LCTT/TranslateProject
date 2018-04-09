How to find files in Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)
If you're a Windows user or a non-power-user of OSX, you probably use a GUI to find files. You may also find the interface limited, frustrating, or both, and have learned to excel at organizing things and remembering the exact order of your files. You can do that in Linux, too—but you don't have to.

One of the best things about Linux is that it offers a variety of ways to do things. You can open any file manager and `ctrl`+`f`, you can use the program you are in to open files manually, or you can simply start typing letters and it'll filter the current directory listing.

![Screenshot of how to find files in Linux with Ctrl+F][2]

Screenshot of how to find files in Linux with Ctrl+F

But what if you don't know where your file is and don't want to search the entire disk? Linux is well-tooled for this and a variety of other use-cases.

### Finding program locations by command name

The Linux file system can seem daunting if you're used to putting things wherever you like. For me, one of the hardest things to get used to was finding where programs are supposed to live.

For example, `which bash` will usually return `/bin/bash`, but if you download a program and it doesn't appear in your menus, the `which` command can be a great tool.

A similar utility is the `locate` command, which I find useful for finding configuration files. I don't like typing in program names because simple ones like `locate php` often offer many results that need to be filtered further.

For more information about `locate` and `which`, see the `man` pages:

  * `man which`
  * `man locate`



### Find

The `find` utility offers much more advanced functionality. Below is an example from a script I've installed on a number of servers that I administer to ensure that a specific pattern of file (also known as a glob) exists for only five days and all files older than that are deleted. (Since its last modification, a decimal is used to account for up to 240 minutes difference.)
```
find ./backup/core-files*.tar.gz -mtime +4.9 -exec rm {} \;

```

The `find` utility has many advanced use-cases, but most common is executing commands on results without chaining and filtering files by type, creation, and modification date.

Another interesting use of `find` is to find all files with executable permissions. This can help ensure that nobody is installing bitcoin miners or botnets on your expensive servers.
```
find / -perm /+x

```

For more information on `find`, see the `man` page using `man find.`

### Grep

Want to find a file by its contents? Linux has it covered. You can use many Linux utilities to efficiently search for files that match a pattern, but `grep` is one that I use often.

Suppose you have an application that's delivering error messages with a code reference and stack trace. You find these in your logs. Grepping is not always the go-to, but I always `grep -R` if the issue is with a supplied value.

An increasing number of IDEs are implementing find functions, but if you're accessing a remote system or for whatever reason don't have a GUI, or if you want to iterate in-place, then use: `grep -R {searchterm}` or on systems supporting `egrep` alias; just add `-e` flag to command `egrep -r {regex-pattern}`.

I used this technique when patching the `dhcpcd5` in [Raspbian][3] last year so I could continue to operate a network access point on newer Debian releases from the [Raspberry Pi Foundation][4].

What tips help you search for files more efficiently on Linux?

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/how-find-files-linux

作者：[Lewis Cowles][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/lewiscowles1986
[2]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/find-files-in-linux-ctrlf.png?itok=1gf9kIut (Screenshot of how to find files in Linux with Ctrl+F)
[3]:https://www.raspbian.org/
[4]:https://www.raspberrypi.org/
