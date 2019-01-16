[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Tools: The Meaning of Dot)
[#]: via: (https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Linux Tools: The Meaning of Dot
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/psychedelic-dot.jpg?itok=giKEHvwQ)

Let's face it: writing one-liners and scripts using shell commands can be confusing. Many of the names of the tools at your disposal are far from obvious in terms of what they do ( _grep_ , _tee_ and _awk_ , anyone?) and, when you combine two or more, the resulting "sentence" looks like some kind of alien gobbledygook.

None of the above is helped by the fact that many of the symbols you use to build a chain of instructions can mean different things depending on their context.

### Location, location, location

Take the humble dot (`.`) for example. Used with instructions that are expecting the name of a directory, it means "this directory" so this:

```
find . -name "*.jpg"
```

translates to " _find in this directory (and all its subdirectories) files that have names that end in`.jpg`_ ".

Both `ls .` and `cd .` act as expected, so they list and "change" to the current directory, respectively, although including the dot in these two cases is not necessary.

Two dots, one after the other, in the same context (i.e., when your instruction is expecting a directory path) means " _the directory immediately above the current one_ ". If you are in _/home/your_directory_ and run

```
cd ..
```

you will be taken to _/home_. So, you may think this still kind of fits into the “dots represent nearby directories” narrative and is not complicated at all, right?

How about this, then? If you use a dot at the beginning of a directory or file, it means the directory or file will be hidden:

```
$ touch somedir/file01.txt somedir/file02.txt somedir/.secretfile.txt
$ ls -l somedir/
total 0
-rw-r--r-- 1 paul paul 0 Jan 13 19:57 file01.txt
-rw-r--r-- 1 paul paul 0 Jan 13 19:57 file02.txt
$ # Note how there is no .secretfile.txt in the listing above
$ ls -la somedir/
total 8
drwxr-xr-x 2 paul paul 4096 Jan 13 19:57 .
drwx------ 48 paul paul 4096 Jan 13 19:57 ..
-rw-r--r-- 1 paul paul 0 Jan 13 19:57 file01.txt
-rw-r--r-- 1 paul paul 0 Jan 13 19:57 file02.txt
-rw-r--r-- 1 paul paul 0 Jan 13 19:57 .secretfile.txt
$ # The -a option tells ls to show "all" files, including the hidden ones
```

And then there's when you use `.` as a command. Yep! You heard me: `.` is a full-fledged command. It is a synonym of `source` and you use that to execute a file in the current shell, as opposed to running a script some other way (which usually mean Bash will spawn a new shell in which to run it).

Confused? Don't worry -- try this: Create a script called _myscript_ that contains the line

```
myvar="Hello"
```

and execute it the regular way, that is, with `sh myscript` (or by making the script executable with `chmod a+x myscript` and then running `./myscript`). Now try and see the contents of `myvar` with `echo $myvar` (spoiler: You will get nothing). This is because, when your script plunks " _Hello_ " into `myvar`, it does so in a separate bash shell instance. When the script ends, the spawned instance disappears and control returns to the original shell, where `myvar` never even existed.

However, if you run _myscript_ like this:

```
. myscript
```

`echo $myvar` will print _Hello_ to the command line.

You will often use the `.` (or `source`) command after making changes to your _.bashrc_ file, [like when you need to expand your `PATH` variable][1]. You use `.` to make the changes available immediately in your current shell instance.

### Double Trouble

Just like the seemingly insignificant single dot has more than one meaning, so has the double dot. Apart from pointing to the parent of the current directory, the double dot (`..`) is also used to build sequences.

Try this:

```
echo {1..10}
```

It will print out the list of numbers from 1 to 10. In this context, `..` means " _starting with the value on my left, count up to the value on my right_ ".

Now try this:

```
echo {1..10..2}
```

You'll get _1 3 5 7 9_. The `..2` part of the command tells Bash to print the sequence, but not one by one, but two by two. In other words, you'll get all the odd numbers from 1 to 10.

It works backwards, too:

```
echo {10..1..2}
```

You can also pad your numbers with 0s. Doing:

```
echo {000..121..2}
```

will print out every even number from 0 to 121 like this:

```
000 002 004 006 ... 050 052 054 ... 116 118 120
```

But how is this sequence-generating construct useful? Well, suppose one of your New Year's resolutions is to be more careful with your accounts. As part of that, you want to create directories in which to classify your digital invoices of the last 10 years:

```
mkdir {2009..2019}_Invoices
```

Job done.

Or maybe you have a hundreds of numbered files, say, frames extracted from a video clip, and, for whatever reason, you want to remove only every third frame between the frames 43 and 61:

```
rm frame_{043..61..3}
```

It is likely that, if you have more than 100 frames, they will be named with padded 0s and look like this:

```
frame_000 frame_001 frame_002 ...
```

That’s why you will use `043` in your command instead of just `43`.

### Curly~Wurly

Truth be told, the magic of sequences lies not so much in the double dot as in the sorcery of the curly braces (`{}`). Look how it works for letters, too. Doing:

```
touch file_{a..z}.txt
```

creates the files _file_a.txt_ through _file_z.txt_.

You must be careful, however. Using a sequence like `{Z..a}` will run through a bunch of non-alphanumeric characters (glyphs that are neither numbers or letters) that live between the uppercase alphabet and the lowercase one. Some of these glyphs are unprintable or have a special meaning of their own. Using them to generate names of files could lead to a whole bevy of unexpected and potentially unpleasant effects.

One final thing worth pointing out about sequences encased between `{...}` is that they can also contain lists of strings:

```
touch {blahg, splurg, mmmf}_file.txt
```

Creates _blahg_file.txt_ , _splurg_file.txt_ and _mmmf_file.txt_.

Of course, in other contexts, the curly braces have different meanings (surprise!). But that is the stuff of another article.

### Conclusion

Bash and the utilities you can run within it have been shaped over decades by system administrators looking for ways to solve very particular problems. To say that sysadmins and their ways are their own breed of special would be an understatement. Consequently, as opposed to other languages, Bash was not designed to be user-friendly, easy or even logical.

That doesn't mean it is not powerful -- quite the contrary. Bash's grammar and shell tools may be inconsistent and sprawling, but they also provide a dizzying range of ways to do everything you can possibly imagine. It is like having a toolbox where you can find everything from a power drill to a spoon, as well as a rubber duck, a roll of duct tape, and some nail clippers.

Apart from fascinating, it is also fun to discover all you can achieve directly from within the shell, so next time we will delve ever deeper into how you can build bigger and better Bash command lines.

Until then, have fun!

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/2018/12/bash-variables-environmental-and-otherwise
