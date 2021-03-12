[#]: subject: (Understanding file names and directories in FreeDOS)
[#]: via: (https://opensource.com/article/21/3/files-freedos)
[#]: author: (Kevin O'Brien https://opensource.com/users/ahuka)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Understanding file names and directories in FreeDOS
======
Learn how to create, edit, and name files in FreeDOS.
![Files in a folder][1]

The open source operating system [FreeDOS][2] is a tried-and-true project that helps users play retro games, update firmware, run outdated but beloved applications, and study operating system design. FreeDOS offers insights into the history of personal computing (because it implements the de facto operating system of the early '80s) but in a modern context. In this article, I'll use FreeDOS to explain how file names and extensions developed.

### Understanding file names and ASCII text

FreeDOS file names follow what is called the _8.3 convention_. This means that all FreeDOS file names have two parts that contain up to eight and three characters, respectively. The first part is often referred to as the _file name_ (which can be a little confusing because the combination of the file name and the file extension is also called a file name). This part can have anywhere from one to eight characters in it. This is followed by the _extension_, which can have from zero to three characters. These two parts are separated by a dot.

File names can use any letter of the alphabet or any numeral. Many of the other characters found on a keyboard are also allowed, but not all of them. That's because many of these other characters have been assigned a special use in FreeDOS. Some of the characters that can appear in a FreeDOS file name are:


```
`~ ! @ # $ % ^ & ( ) _ - { } ``
```

There are also characters in the extended [ASCII][3] set that can be used, such as �.

Characters with a special meaning in FreeDOS that, therefore, cannot be used in file names include:


```
`*/ + | \ = ? [ ] ; : " . < > ,`
```

Also, you cannot use a space in a FreeDOS file name. The FreeDOS console [uses spaces to separate commands][4] from options and parameters.

FreeDOS is case _insensitive_, so it doesn't matter whether you use uppercase or lowercase letters. All letters are converted to uppercase, so your files end up with uppercase letters in the name, no matter what you do.

#### File extensions

A file in FreeDOS isn't required to have an extension, but file extensions do have some uses. Certain file extensions have built-in meanings in FreeDOS, such as:

  * **EXE**: executable file
  * **COM**: command file
  * **SYS**: system file
  * **BAT**: batch file



Specific software programs use other extensions, or you can use them when you create a file. These extensions have no absolute file associations, so if you use a FreeDOS word processor, it doesn't matter what extension you use for your files. You could get creative and use extensions as part of your filing system if you want. For instance, you could name your memos using *.JAN, *.FEB, *.MAR, *.APR, and so on.

### Editing files

FreeDOS comes with the Edit application for quick and easy text editing. It's a simple editor with a menu bar along the top of the screen for easy access to all the usual functions (such as copy, paste, save, and so on.)

![Editing in FreeDOS][5]

(Kevin O'Brien, [CC BY-SA 4.0][6])

As you might expect, many other text editors are available, including the tiny but versatile [e3 editor][7]. You can find a good variety of [FreeDOS applications][8] on GitLab.

### Creating files

You can create empty files in FreeDOS using the `touch` command. This simple utility updates a file's modification time or creates a new file:


```
C:\&gt;touch foo.txt
C:\&gt;dir
FOO      TXT    0  01-12-2021 10:00a
```

You can also create a file directly from the FreeDOS console without using the Edit text editor. First, use the `copy` command to copy input in the console (`con` for short) into a new file object. Terminate input with **Ctrl**+**Z** followed by the **Return** or **Enter** key:


```
C:\&gt;copy con test.txt
con =&gt; test.txt
This is a test file.
^Z
```

The **Ctrl**+**Z** character shows up in the console as `^Z`. It isn't copied to the file but serves as an End of File (EOF) delimiter. In other words, it tells FreeDOS when to stop copying. This is a neat trick for making quick notes or starting a simple document to work on later.

### Files and FreeDOS

FreeDOS is open source, free, and [easy to install][9]. Exploring how FreeDOS treats files can help you understand how computing has developed over the years, regardless of your usual operating system. Boot up FreeDOS and start exploring modern retro computing!

* * *

_Some of the information in this article was previously published in [DOS lesson 7: DOS filenames; ASCII][10] (CC BY-SA 4.0)._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/files-freedos

作者：[Kevin O'Brien][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ahuka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://www.freedos.org/
[3]: tmp.2sISc4Tp3G#ASCII
[4]: https://opensource.com/article/21/2/set-your-path-freedos
[5]: https://opensource.com/sites/default/files/uploads/freedos_2_files-edit.jpg (Editing in FreeDOS)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/20/12/e3-linux
[8]: https://gitlab.com/FDOS/
[9]: https://opensource.com/article/18/4/gentle-introduction-freedos
[10]: https://www.ahuka.com/dos-lessons-for-self-study-purposes/dos-lesson-7-dos-filenames-ascii/
