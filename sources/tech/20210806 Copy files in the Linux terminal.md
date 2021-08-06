[#]: subject: "Copy files in the Linux terminal"
[#]: via: "https://opensource.com/article/21/8/copy-files-linux-terminal"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Copy files in the Linux terminal
======
Use the cp command to copy files in the Linux terminal.
![Copying files][1]

To copy a file on a computer with a graphical interface, you usually either drag and drop a file from one window to another window, sometimes using a modifier key. Alternately, you might prefer to right-click on a file icon, select **Copy**, and then **Paste** the file icon into another window.

To copy a file in a terminal, you use the **cp** command, which works exactly like the **mv** command, except that it duplicates the contents of a file rather than moving them from one location to another.


```
`$ cp example.txt ~/Documents`
```

As with the **mv** command, you can ****rename a file while copying it.


```
`$ cp example.txt ~/Documents/file.txt`
```

Be careful when using **cp**, because it does exactly what you tell it to do. By default, it does _not_ ask you whether you want to copy one file over another file with the same name. To protect yourself from this, use **cp --interactive** (or **-i** for short), which runs **cp** in _interactive_ mode, meaning that it will ask you whether you're sure you want to overwrite an existing file. You can either confirm or cancel and re-do the **cp** and rename the file to something different so that it doesn't conflict with existing files.

###  Copy a folder

The **cp** command looks for files, not folders because folders don't really exist (that is, they're not really data, they're just markers for us humans to logically divide our data into different imaginary containers.) To copy a folder, use **cp --recursive** (or **-r** for short), which takes the files in the folder _and_ recreates their imaginary container.


```
$ cp -r Documents MyStuff
$ ls
Documents
Downloads
Music
MyStuff
Templates
Pictures
Videos
```

You may notice that the Linux shell is eerily quiet when it works. This is actually by design. How many times have you set a computer on a task, like copying a thousand files from one drive to another, only to come back 4 hours later to find that it stopped copying after the first file, just to ask you some trivial esoteric question?

Sometimes, however, it's nice to have some feedback from your OS. Usually, the **-v** switch adds "verbosity" to the command:


```
$ cp -r --verbose Documents Stuff
'Documents/' -&gt; 'Stuff'
'Documents/example.txt' -&gt; 'Stuff/example.txt'
'Documents/file.txt' -&gt; 'Stuff/file.txt'
'Documents/example.png' -&gt; 'Stuff/example.png'
'Documents/picture.png' -&gt; 'Stuff/picture.png'
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/copy-files-linux-terminal

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/ch01s07.svg_.png?itok=1qUUmV0R (Copying files)
