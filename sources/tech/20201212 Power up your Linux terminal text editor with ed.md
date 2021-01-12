[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Power up your Linux terminal text editor with ed)
[#]: via: (https://opensource.com/article/20/12/gnu-ed)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Power up your Linux terminal text editor with ed
======
This deceptively simple editor empowers the user with a set of control
commands that are easy to learn and use.
![Terminal command prompt on orange background][1]

The GNU `ed` command is a line editor. It’s considered the standard Unix text editor because it was the very first text editor for Unix, and so it was (and generally still is) available on any POSIX system. In some ways, it’s easy to tell that it was the first because, in many ways, it’s extremely rudimentary. Unlike most other text editors, it doesn’t open in a window or screen of its own, and in fact, by default, it doesn’t even prompt the user for input. On the other hand, its near lack of any interface can also be a strength. It’s a functional editor that can be controlled with short instructions either interactively or through a script.

### Installing ed

If you’re running Linux or BSD, you probably already have `ed` installed (GNU `ed` on Linux and BSD `ed` on BSD). Some minimal environments, however, omit `ed`, but it’s probably available from your distribution’s software repository or ports tree. MacOS ships with BSD `ed` installed.

### Launching ed

When you launch `ed`, it appears that you’ve lost your prompt, and possibly that `ed` has stalled. It has not; it’s just waiting for your instructions:


```
$ ed
```

To tell `ed` to be a little more verbose, you can command it to return a prompt with the `p` command:


```
$ ed
p
?
```

The question mark (`?`) is the default `ed` prompt.

### The buffer

While `ed` is active, you work with what’s called a _buffer_. The buffer is a place in memory. You’re not editing a file directly; you’re only editing the buffer. Should you exit `ed` without writing your changes to a file on disk, then all changes are lost because they only happened in the buffer. (This may sound familiar to experienced Emacs users accustomed to an initial scratch buffer.)

### Writing text with ed

After launching `ed`, you’re in command mode. This means you can issue commands to the editor itself, such as when setting it to display a prompt instead of empty space. You can append text to the current buffer with the `a` command, which is terminated by a solitary dot (`.`) on its own line. For instance, this example adds two lines ("hello world" and "hello ed") to the buffer:


```
?
a
hello world
hello ed
.
```

After a terminating dot, you return to command mode.

### Viewing the buffer

To see what’s contained in the buffer, you can type either the line you want to see or `,p` to display all lines.


```
?
1
hello world
2
hello ed
,p
hello world
hello ed
```

### Writing to a file

Assuming you’re happy with your text, you can write the buffer to a file with the `w` command followed by the name of the destination file.


```
?
w example.txt
19
```

The number after the write operation indicates the number of characters written to the file.

### Reading a file

You don’t have to use `ed` for text entry. You can also just open an existing file into the buffer using the `r` command:


```
?
r myfile.txt
```

Alternatively, you can just launch `ed` followed by the file name you want it to load into the buffer:


```
$ ed myfile.txt
```

### Editing the buffer

The `ed` application is a text editor, so you can affect text in the buffer using a special editing syntax. Users of `sed` or `vim` may find some of its syntax familiar. Assume you have a file loaded in the buffer:


```
$ ed myfile.txt
,p
This is an example document.
There is some text, but not much.
There is some errors, but not much.
```

To change the word "document" to "file" in the first sentence, select the line you want to target (1) and then invoke the search function with `s` followed by your search and replacement terms:


```
?
1
This is an example document.
s/document/file/
1
This is an example file.
```

To target a different line, the process is essentially the same but with a different number:


```
?
3
There is some errors, but not much.
s/is/are/
s/much/many/
```

You can see the edits you’ve made to the buffer using the `,p` command as usual.


```
This is an example file.
There is some text, but not much.
There are some errors, but not many.
```

Of course, these changes only exist in the buffer. Were you to look at the file outside of `ed`, you would see the original text only:


```
$ cat myfile.txt
This is an example document.
There is some text, but not much.
There is some errors, but not much.
```

To save your changes back into the file, use the `w` command:


```
w myfile.txt
258
```

### Clearing the buffer

To get a new buffer so you can either start a new document or load a new one into a fresh environment, use the `c` command. After issuing `c` to clear the buffer, a print command returns nothing because the buffer has been emptied:


```
c
,p
```

### Quit

To exit your `ed` session, use the `q` command. This doesn’t give you a chance to save your buffer, so make sure you save before you use this command.

### Try ed

There’s a lot more `ed` can do, and learning `ed` can afford you great insight into how `sed` and parts of `vim` work. I didn’t bother trying to write this article in `ed`, admittedly, and I’m not sure it’s the best tool for text entry in general. However, `ed` is an excellent editor of text, and you can learn it easily by reading its documentation. On a GNU system, use `info ed` to view the manual.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/gnu-ed

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
