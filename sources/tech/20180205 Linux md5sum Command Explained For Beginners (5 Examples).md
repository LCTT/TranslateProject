Linux md5sum Command Explained For Beginners (5 Examples)
======

When downloading files, particularly installation files from websites, it is a good idea to verify that the download is valid. A website will often display a hash value for each file so that you can make sure the download completed correctly. In this article, we will be discussing the md5sum tool that you can use to validate the download. Two other utilities, sha256sum and sha512sum, work the same way as md5sum.

### Linux md5sum command

The md5sum command prints a 32-character (128-bit) checksum of the given file, using the MD5 algorithm. Following is the command syntax of this command line tool:

```
md5sum [OPTION]... [FILE]...
```

And here's how md5sum's man page explains it:
```
Print or check MD5 (128-bit) checksums.

```

The following Q&A-styled examples will give you an even better idea of the basic usage of md5sum.

Note: We'll be using three files named file1.txt, file2.txt, and file3.txt as the input files in our examples. The text in each file is listed below.

file1.txt:
```
hi
hello
how are you
thanks.

```

file2.txt:
```
hi
hello to you
I am fine
Your welcome!

```

file3.txt:
```
hallo
Guten Tag
Wie geht es dir
Danke.

```

### Q1. How to display the hash value?

Use the command without any options to display the hash value and the filename.

```
md5sum file1.txt
```

Here's the output this command produced on our system:
```
[Documents]$ md5sum file1.txt
1ff38cc592c4c5d0c8e3ca38be8f1eb1 file1.txt
[Documents]$

```

The output can also be displayed in a BSD-style format using the --tag option.

md5sum --tag file1.txt
```
[Documents]$ md5sum --tag file1.txt
MD5 (file1.txt) = 1ff38cc592c4c5d0c8e3ca38be8f1eb1
[Documents]$

```
### Q2. How to validate multiple files?

The md5sum command can validate multiple files at one time. We will add file2.txt and file3.txt to demonstrate the capabilities.

If you write the hashes to a file, you can use that file to check whether any of the files have changed. Here we are writing the hashes of the files to the file hashes, and then using that to validate that none of the files have changed.

```
md5sum file1.txt file2.txt file3.txt > hashes
md5sum --check hashes
```

```
[Documents]$ md5sum file1.txt file2.txt file3.txt > hashes
[Documents]$ md5sum --check hashes
file1.txt: OK
file2.txt: OK
file3.txt: OK
[Documents]$

```

Now we will change file3.txt, adding a single exclamation mark to the end of the file, and rerun the command.

```
echo "!" >> file3.txt
md5sum --check hashes
```

```
[Documents]$ md5sum --check hashes
file1.txt: OK
file2.txt: OK
file3.txt: FAILED
md5sum: WARNING: 1 computed checksum did NOT match
[Documents]$

```

You can see that file3.txt has changed.

### Q3. How to display only modified files?

If you have many files to check, you may want to display only the files that have changed. Using the "\--quiet" option, md5sum will only list the files that have changed.

```
md5sum --quiet --check hashes
```

```
[Documents]$ md5sum --quiet --check hashes
file3.txt: FAILED
md5sum: WARNING: 1 computed checksum did NOT match
[Documents]$

```

### Q4. How to detect changes in a script?

You may want to use md5sum in a script. Using the "\--status" option, md5sum won't print any output. Instead, the status code returns 0 if there are no changes, and 1 if the files don't match. The following script hashes.sh will return a 1 in the status code, because the files have changed. The script file is below:

```
sh hashes.sh
```

```
hashes.sh:
#!/bin/bash
md5sum --status --check hashes
Result=$?
echo "File check status is: $Result"
exit $Result

[Documents]$ sh hashes.sh
File check status is: 1
[[email protected] Documents]$

```

### Q5. How to identify invalid hash values?

md5sum can let you know if you have invalid hashes when you compare files. To warn you if any hash values are incorrect, you can use the --warn option. For this last example, we will use sed to insert an extra character at the beginning of the third line. This will change the hash value in the file hashes, making it invalid.

```
sed -i '3s/.*/a&/' hashes
md5sum --warn --check hashes
```

This shows that the third line has an invalid hash.
```
[Documents]$ sed -i '3s/.*/a&/' hashes
[Documents]$ md5sum --warn --check hashes
file1.txt: OK
file2.txt: OK
md5sum: hashes: 3: improperly formatted MD5 checksum line
md5sum: WARNING: 1 line is improperly formatted
[Documents]$

```

### Conclusion

The md5sum is a simple command which can quickly validate one or multiple files to determine whether any of them have changed from the original file. For more information on md5sum, see it's [man page.][1]


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-md5sum-command/

作者：[David Paige][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/
[1]:https://linux.die.net/man/1/md5sum
