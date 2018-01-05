translating by stevenzdg988
Linux wc Command Explained for Beginners (6 Examples)
======

While working on the command line, sometimes you may want to access the number of words, byte counts, or even newlines in a file. If you are looking for a tool to do this, you'll be glad to know that in Linux, there exists a command line utility - dubbed **wc** \- that does all this for you. In this article, we will be discussing this tool through easy to understand examples.

But before we jump in, it's worth mentioning that all examples provided in this tutorial have been tested on Ubuntu 16.04.

### Linux wc command

The wc command prints newline, word, and byte counts for each input file. Following is the syntax of this command line tool:

wc [OPTION]... [FILE]...

And here's how wc's man page explains it:
```
Print newline, word, and byte counts for each FILE, and a total line if more than one FILE is
specified. A word is a non-zero-length sequence of characters delimited by white space. With no
FILE, or when FILE is -, read standard input.
```

The following Q&A-styled examples will give you an even better idea about the basic usage of wc.

Note: We'll be using a file named file.txt as the input file in all our examples. Following is what the file contains:
```
hi
hello
how are you
thanks.
```

### Q1. How to print the byte count

Use the **-c** command line option to print the byte count.

wc -c file.txt

Here's the output this command produced on our system:

[![How to print the byte count][1]][2]

So the file contains 29 bytes.

### Q2. How to print the character count

To print the number of characters, use the **-m** command line option.

wc -m file.txt

Here's the output this command produced on our system:

[![How to print the character count][3]][4]

So the file contains 29 characters.

### Q3. How to print the newline count

Use the **-l** command line option to print the number of newlines in the file.

wc -l file.txt

Here's the output in our case:

[![How to print the newline count][5]][6]

### Q4. How to print the word count

To print the number of words present in the file, use the **-w** command line option.

wc -w file.txt

Following the output the command produced in our case:

[![How to print the word count][7]][8]

So this reveals there are 6 words in the file.

### Q5. How to print the maximum display width or length of longest line

In case you want to print the length of the longest line in the input file, use the **-L** command line option.

wc -L file.txt

Here's the output the command produced in our case:

[![How to print the maximum display width or length of longest line][9]][10]

So the length of the longest file in our file is 11.

### Q6. How to read input file name(s) from a file

In case you have multiple file names, and you want wc to read them from a file, then use the **\--files0-from** option.

wc --files0-from=names.txt

[![How to read input file name\(s\) from a file][11]][12]

So you can see that the wc command, in this case, produced lines, words, and characters count for file.txt in the output. The name file.txt was mentioned in the names.txt file. It's worth mentioning that to successfully use this option, names written the file should be NUL terminated - you can generate this character by typing Ctrl+v followed by Ctrl+Shift+@.

### Conclusion

As you'd agree, wc is a simple command, both from understanding and usage purposes. We've covered pretty much all command line options the tool offers, so you should be ready to use the tool on a daily basis once you practice whatever we've explained here. For more info on wc, head to its [man page][13].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-wc-command-explained-for-beginners-6-examples/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-c-option.png
[2]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-c-option.png
[3]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-m-option.png
[4]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-m-option.png
[5]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-l-option.png
[6]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-l-option.png
[7]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-w-option.png
[8]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-w-option.png
[9]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-L-option.png
[10]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-L-option.png
[11]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/wc-file0-from-option.png
[12]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/wc-file0-from-option.png
[13]:https://linux.die.net/man/1/wc
