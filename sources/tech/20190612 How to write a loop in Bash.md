[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to write a loop in Bash)
[#]: via: (https://opensource.com/article/19/6/how-write-loop-bash)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/goncasousa/users/howtopamm/users/howtopamm/users/seth/users/wavesailor/users/seth)

How to write a loop in Bash
======
Automatically perform a set of actions on multiple files with for loops
and find commands.
![bash logo on green background][1]

A common reason people want to learn the Unix shell is to unlock the power of batch processing. If you want to perform some set of actions on many files, one of the ways to do that is by constructing a command that iterates over those files. In programming terminology, this is called _execution control,_ and one of the most common examples of it is the **for** loop.

A **for** loop is a recipe detailing what actions you want your computer to take _for_ each data object (such as a file) you specify.

### The classic for loop

An easy loop to try is one that analyzes a collection of files. This probably isn't a useful loop on its own, but it's a safe way to prove to yourself that you have the ability to handle each file in a directory individually. First, create a simple test environment by creating a directory and placing some copies of some files into it. Any file will do initially, but later examples require graphic files (such as JPEG, PNG, or similar). You can create the folder and copy files into it using a file manager or in the terminal:


```
$ mkdir example
$ cp ~/Pictures/vacation/*.{png,jpg} example
```

Change directory to your new folder, then list the files in it to confirm that your test environment is what you expect:


```
$ cd example
$ ls -1
cat.jpg
design_maori.png
otago.jpg
waterfall.png
```

The syntax to loop through each file individually in a loop is: create a variable ( **f** for file, for example). Then define the data set you want the variable to cycle through. In this case, cycle through all files in the current directory using the ***** wildcard character (the ***** wildcard matches _everything_ ). Then terminate this introductory clause with a semicolon ( **;** ).


```
`$ for f in * ;`
```

Depending on your preference, you can choose to press **Return** here. The shell won't try to execute the loop until it is syntactically complete.

Next, define what you want to happen with each iteration of the loop. For simplicity, use the **file** command to get a little bit of data about each file, represented by the **f** variable (but prepended with a **$** to tell the shell to swap out the value of the variable for whatever the variable currently contains):


```
`do file $f ;`
```

Terminate the clause with another semi-colon and close the loop:


```
`done`
```

Press **Return** to start the shell cycling through _everything_ in the current directory. The **for** loop assigns each file, one by one, to the variable **f** and runs your command:


```
$ for f in * ; do
> file $f ;
> done
cat.jpg: JPEG image data, EXIF standard 2.2
design_maori.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
otago.jpg: JPEG image data, EXIF standard 2.2
waterfall.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
```

You can also write it this way:


```
$ for f in *; do file $f; done
cat.jpg: JPEG image data, EXIF standard 2.2
design_maori.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
otago.jpg: JPEG image data, EXIF standard 2.2
waterfall.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
```

Both the multi-line and single-line formats are the same to your shell and produce the exact same results.

### A practical example

Here's a practical example of how a loop can be useful for everyday computing. Assume you have a collection of vacation photos you want to send to friends. Your photo files are huge, making them too large to email and inconvenient to upload to your [photo-sharing service][2]. You want to create smaller web-versions of your photos, but you have 100 photos and don't want to spend the time reducing each photo, one by one.

First, install the **ImageMagick** command using your package manager on Linux, BSD, or Mac. For instance, on Fedora and RHEL:


```
`$ sudo dnf install ImageMagick`
```

On Ubuntu or Debian:


```
`$ sudo apt install ImageMagick`
```

On BSD, use **ports** or [pkgsrc][3]. On Mac, use [Homebrew][4] or [MacPorts][5].

Once you install ImageMagick, you have a set of new commands to operate on photos.

Create a destination directory for the files you're about to create:


```
`$ mkdir tmp`
```

To reduce each photo to 33% of its original size, try this loop:


```
`$ for f in * ; do convert $f -scale 33% tmp/$f ; done`
```

Then look in the **tmp** folder to see your scaled photos.

You can use any number of commands within a loop, so if you need to perform complex actions on a batch of files, you can place your whole workflow between the **do** and **done** statements of a **for** loop. For example, suppose you want to copy each processed photo straight to a shared photo directory on your web host and remove the photo file from your local system:


```
$ for f in * ; do
convert $f -scale 33% tmp/$f
scp -i seth_web tmp/$f [seth@example.com][6]:~/public_html
trash tmp/$f ;
done
```

For each file processed by the **for** loop, your computer automatically runs three commands. This means if you process just 10 photos this way, you save yourself 30 commands and probably at least as many minutes.

### Limiting your loop

A loop doesn't always have to look at every file. You might want to process only the JPEG files in your example directory:


```
$ for f in *.jpg ; do convert $f -scale 33% tmp/$f ; done
$ ls -m tmp
cat.jpg, otago.jpg
```

Or, instead of processing files, you may need to repeat an action a specific number of times. A **for** loop's variable is defined by whatever data you provide it, so you can create a loop that iterates over numbers instead of files:


```
$ for n in {0..4}; do echo $n ; done
0
1
2
3
4
```

### More looping

You now know enough to create your own loops. Until you're comfortable with looping, use them on _copies_ of the files you want to process and, as often as possible, use commands with built-in safeguards to prevent you from clobbering your data and making irreparable mistakes, like accidentally renaming an entire directory of files to the same name, each overwriting the other.

For advanced **for** loop topics, read on.

### Not all shells are Bash

The **for** keyword is built into the Bash shell. Many similar shells use the same keyword and syntax, but some shells, like [tcsh][7], use a different keyword, like **foreach** , instead.

In tcsh, the syntax is similar in spirit but more strict than Bash. In the following code sample, do not type the string **foreach?** in lines 2 and 3. It is a secondary prompt alerting you that you are still in the process of building your loop.


```
$ foreach f (*)
foreach? file $f
foreach? end
cat.jpg: JPEG image data, EXIF standard 2.2
design_maori.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
otago.jpg: JPEG image data, EXIF standard 2.2
waterfall.png: PNG image data, 4608 x 2592, 8-bit/color RGB, non-interlaced
```

In tcsh, both **foreach** and **end** must appear alone on separate lines, so you cannot create a **for** loop on one line as you can with Bash and similar shells.

### For loops with the find command

In theory, you could find a shell that doesn't provide a **for** loop function, or you may just prefer to use a different command with added features.

The **find** command is another way to implement the functionality of a **for** loop, as it offers several ways to define the scope of which files to include in your loop as well as options for [Parallel][8] processing.

The **find** command is meant to help you find files on your hard drives. Its syntax is simple: you provide the path of the location you want to search, and **find** finds all files and directories:


```
$ find .
.
./cat.jpg
./design_maori.png
./otago.jpg
./waterfall.png
```

You can filter the search results by adding some portion of the name:


```
$ find . -name "*jpg"
./cat.jpg
./otago.jpg
```

The great thing about **find** is that each file it finds can be fed into a loop using the **-exec** flag. For instance, to scale down only the PNG photos in your example directory:


```
$ find . -name "*png" -exec convert {} -scale 33% tmp/{} \;
$ ls -m tmp
design_maori.png, waterfall.png
```

In the **-exec** clause, the bracket characters **{}** stand in for whatever item **find** is processing (in other words, any file ending in PNG that has been located, one at a time). The **-exec** clause must be terminated with a semicolon, but Bash usually tries to use the semicolon for itself. You "escape" the semicolon with a backslash ( **\;** ) so that **find** knows to treat that semicolon as its terminating character.

The **find** command is very good at what it does, and it can be too good sometimes. For instance, if you reuse it to find PNG files for another photo process, you will get a few errors:


```
$ find . -name "*png" -exec convert {} -flip -flop tmp/{} \;
convert: unable to open image `tmp/./tmp/design_maori.png':
No such file or directory @ error/blob.c/OpenBlob/2643.
...
```

It seems that **find** has located all the PNG files—not only the ones in your current directory ( **.** ) but also those that you processed before and placed in your **tmp** subdirectory. In some cases, you may want **find** to search the current directory plus all other directories within it (and all directories in _those_ ). It can be a powerful recursive processing tool, especially in complex file structures (like directories of music artists containing directories of albums filled with music files), but you can limit this with the **-maxdepth** option.

To find only PNG files in the current directory (excluding subdirectories):


```
`$ find . -maxdepth 1 -name "*png"`
```

To find and process files in the current directory plus an additional level of subdirectories, increment the maximum depth by 1:


```
`$ find . -maxdepth 2 -name "*png"`
```

Its default is to descend into all subdirectories.

### Looping for fun and profit

The more you use loops, the more time and effort you save, and the bigger the tasks you can tackle. You're just one user, but with a well-thought-out loop, you can make your computer do the hard work.

You can and should treat looping like any other command, keeping it close at hand for when you need to repeat a single action or two on several files. However, it's also a legitimate gateway to serious programming, so if you have to accomplish a complex task on any number of files, take a moment out of your day to plan out your workflow. If you can achieve your goal on one file, then wrapping that repeatable process in a **for** loop is relatively simple, and the only "programming" required is an understanding of how variables work and enough organization to separate unprocessed from processed files. With a little practice, you can move from a Linux user to a Linux user who knows how to write a loop, so get out there and make your computer work for you!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/how-write-loop-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/goncasousa/users/howtopamm/users/howtopamm/users/seth/users/wavesailor/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: http://nextcloud.com
[3]: http://pkgsrc.org
[4]: http://brew.sh
[5]: https://www.macports.org
[6]: mailto:seth@example.com
[7]: https://en.wikipedia.org/wiki/Tcsh
[8]: https://opensource.com/article/18/5/gnu-parallel
