[#]: subject: (Reading and writing files with Python)
[#]: via: (https://opensource.com/article/21/7/read-write-files-python)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Reading and writing files with Python
======
Every programming language handles data files differently. Here's how
Python does it.
![Hands on a keyboard with a Python book ][1]

Some data is meant to be temporary, stored in RAM while an application is running, and then forgotten. Some data, however, is meant to be persistent. It's stored on a hard drive for later use, and it's often the stuff that a user cares about the most. For programmers, it's very common to write code to read and write files, but every language handles this task a little differently. This article demonstrates how to handle data files with Python.

### Install Python

On Linux, you probably already have Python installed. If not, you can install it from your distribution's software repository. For instance, on CentOS Stream or RHEL:


```
`$ sudo dnf install python3`
```

On macOS, you can install Python from [MacPorts][2] or [Homebrew][3]. On Windows, you can install Python from [Chocolatey][4].

Once you have Python installed, open your favorite text editor and get ready to code.

### Writing data to a file with Python

If you need to write data to a file, there are three steps to remember:

  1. Open
  2. Write
  3. Close



This is exactly the same sequence of steps you use when writing code, editing photos, or doing almost anything on a computer. First, you open the document you want to edit, then you make some edits, and then you close the document.

In Python, that translates to this process:


```
f = open('example.txt', 'w')
f.write('hello world')
f.close()
```

In this example, the first line opens a file in **write** mode. The file is represented as the variable `f`, which is an arbitrary choice. I use `f` because it seems to be common in Python code, but any valid variable name works just as well.

There are different modes in which you can open a file:

  * **w** to write
  * **r+** to read and write
  * **a** to append only



The second line of the example writes data to the file. The data written in this example is plain text, but you can write any kind of data.

The final line closes the file.

### Writing data using the 'with' syntax

There's a shorter way to write data into a file, and this method can be useful for quick file interactions. It doesn't leave the file open, so you don't have to remember to call the **close()** function. Instead, it uses the **with** syntax:


```
with open('example.txt', 'a') as f:
    f.write('hello open source')
```

### Reading data in from a file with Python

If you (or your user, by way of your application) have placed data into a file, and your code needs to retrieve it, then you want to read a file. Similar to writing, the logic is:

  1. Open
  2. Read
  3. Close



Again, this logic flow mirrors what you already know from just using a computer (or a paperback book, for that matter). To read a document, you open it, read it, and then close it. In computer terms, "opening" a file means to load it into memory.

In practice, a text file contains more than one line. For example, maybe your code needs to read a configuration file, saved game data, or the lyrics to your band's next song. Just as you don't read an entire physical book the very moment you open it, your code must parse a file it has loaded into memory. So, you probably need to iterate over the file's contents.


```
f = open('example.tmp', 'r')

for line in f:
    print(line)

f.close()
```

In the first line of this example code, you open a file in **read** mode. The file is represented by the variable `f`, but just like when you open files for writing, the variable name is arbitrary. There's nothing special about `f`; it's just the shortest possible way to represent the word "file," so it tends to be used a lot by Python programmers.

In the second line, you reserve `line`, which is yet another arbitrary variable name, to represent each line of `f`. This tells Python to iterate, line by line, over the file's contents and print each line to your output (in this case, the terminal or [IDLE][5]).

### Reading a file using the 'with' syntax

As with writing data, there's a shorter method of reading data from files using the **with** syntax. This doesn't require you to call the **call()** function, so it can be convenient for quick interactions.


```
with open('example.txt', 'r') as f:
    for line in f:
        print(line)
```

### Files and Python

There are more ways to write data to files using Python, and many ways to format text you write to files using [JSON, YAML, TOML][6], and more. There's also a very nice built-in method for creating and maintaining an [SQLite][7] database and many libraries to handle any number of file formats, including [graphics][8], audio, video, and more.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/read-write-files-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://opensource.com/article/20/11/macports
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://opensource.com/article/20/3/chocolatey
[5]: https://opensource.com/article/17/10/python-101#idle
[6]: https://opensource.com/article/21/6/parse-configuration-files-python
[7]: https://opensource.com/article/21/2/sqlite3-cheat-sheet
[8]: https://opensource.com/article/19/3/python-image-manipulation-tools
