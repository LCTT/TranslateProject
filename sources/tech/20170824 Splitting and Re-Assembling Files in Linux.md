Splitting and Re-Assembling Files in Linux
============================================================

![csplit](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/split-files.png?itok=kZTP_VF9 "csplit")
The very useful csplit command divides single files into multiple files. Carla Schroder explains.[Creative Commons Attribution][1]

Linux has several utilities for splitting up files. So why would you want to split your files? One use case is to split a large file into smaller sizes so that it fits on smaller media, like USB sticks. This is also a good trick to transfer files via USB sticks when you're stuck with FAT32, which has a maximum file size of 4GB, and your files are bigger than that. Another use case is to speed up network file transfers, because parallel transfers of small files are usually faster.

We'll learn how to use `csplit, split`, and `cat` to chop up and then put files back together. These work on any file type: text, image, audio, .iso, you name it.

### Split Files With csplit

`csplit` is one of those funny little commands that has been around forever, and when you discover it you wonder how you ever made it through life without it. `csplit` divides single files into multiple files. This example demonstrates its simplest invocation, which divides the file foo.txt into three files, split at line numbers 17 and 33:

```
$ csplit foo.txt 17 33
2591
3889
2359
```

`csplit` creates three new files in the current directory, and prints the sizes of your new files in bytes. By default, each new file is named `xx _nn_` :

```
$ ls
xx00
xx01
xx02
```

You can view the first ten lines of each of your new files all at once with the `head` command:

```
$ head xx*

==> xx00 <==
Foo File
by Carla Schroder

Foo text

Foo subheading

More foo text

==> xx01 <==
Foo text

Foo subheading

More foo text

==> xx02 <==
Foo text

Foo subheading

More foo text
```

What if you want to split a file into several files all containing the same number of lines? Specify the number of lines, and then enclose the number of repetitions in curly braces. This example repeats the split 4 times, and dumps the leftover in the last file:

```
$ csplit foo.txt 5 {4}
57
1488
249
1866
3798
```

You may use the asterisk wildcard to tell `csplit` to repeat your split as many times as possible. Which sounds cool, but it fails if the file does not divide evenly:

```
$ csplit foo.txt 10 {*}
1545
2115
1848
1901
csplit: '10': line number out of range on repetition 4
1430
```

The default behavior is to delete the output files on errors. You can foil this with the `-k` option, which will not remove the output files when there are errors. Another gotcha is every time you run `csplit` it overwrites the previous files it created, so give your splits new filenames to save them. Use `--prefix= _prefix_`  to set a different file prefix:

```
$ csplit -k --prefix=mine foo.txt 5 {*}  
57
1488
249
1866
993
csplit: '5': line number out of range on repetition 9
437

$ ls
mine00
mine01
mine02
mine03 
mine04
mine05
```

The `-n` option changes the number of digits used to number your files:

```

$ csplit -n 3 --prefix=mine foo.txt 5 {4}
57
1488
249
1866
1381
3798

$ ls
mine000
mine001
mine002
mine003
mine004
mine005
```

The "c" in `csplit` is "context". This means you can split your files based on all manner of arbitrary matches and clever regular expressions. This example splits the file into two parts. The first file ends at the line that precedes the line containing the first occurrence of "fie", and the second file starts with the line that includes "fie".

```
$ csplit foo.txt /fie/ 
```

Split the file at every occurrence of "fie":

```
$ csplit foo.txt /fie/ {*}
```

Split the file at the first 5 occurrences of "fie":

```
$ csplit foo.txt /fie/ {5}
```

Copy only the content that starts with the line that includes "fie", and omit everything that comes before it:

```
$ csplit myfile %fie% 
```

### Splitting Files into Sizes

`split` is similar to `csplit`. It splits files into specific sizes, which is fabulous when you're splitting large files to copy to small media, or for network transfers. The default size is 1000 lines:

```
$ split foo.mv
$ ls -hl
266K Aug 21 16:58 xaa
267K Aug 21 16:58 xab
315K Aug 21 16:58 xac
[...]
```

They come out to a similar size, but you can specify any size you want. This example is 20 megabytes:

```
$ split -b 20M foo.mv
```

The size abbreviations are K, M, G, T, P, E, Z, Y (powers of 1024), or KB, MB, GB, and so on for powers of 1000.

Choose your own prefix and suffix for the filenames:

```
$ split -a 3 --numeric-suffixes=9 --additional-suffix=mine foo.mv SB
240K Aug 21 17:44 SB009mine
214K Aug 21 17:44 SB010mine
220K Aug 21 17:44 SB011mine
```

The `-a` controls how many numeric digits there are. `--numeric-suffixes` sets the starting point for numbering. The default prefix is x, and you can set a different prefix by typing it after the filename.

### Putting Split Files Together

You probably want to reassemble your files at some point. Good old `cat` takes care of this:

```
$ cat SB0* > foo2.txt
```

The asterisk wildcard in the example will snag any file that starts with SB0, which may not give the results you want. You can make a more exact match with question mark wildcards, using one per character:

```
$ cat SB0?????? > foo2.txt
```

As always, consult the relevant and man and info pages for complete command options.

 _Learn more about Linux through the free ["Introduction to Linux" ][3]course from The Linux Foundation and edX._

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/8/splitting-and-re-assembling-files-linux

作者：[CARLA SCHRODER ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-attribution
[2]:https://www.linux.com/files/images/split-filespng
[3]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
