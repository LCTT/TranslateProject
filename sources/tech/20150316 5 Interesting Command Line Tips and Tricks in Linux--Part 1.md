Translating by goreliu ...

5 Interesting Command Line Tips and Tricks in Linux – Part 1
================================================================================
Are you making most out of the Linux? There are lots of helpful features which appears to be Tips and Tricks for many of Linux Users. Sometimes Tips and Tricks become the need. It helps you get productive with the same set of commands yet with enhanced functionality.

![5 Command Line Tips and Tricks](http://www.tecmint.com/wp-content/uploads/2015/03/5-Command-Line-Tips.jpg)
5 Command Line Tips and Tricks

Here we are starting a new series, where we will be writing some tips and tricks and will try to yield as more as we can in small time.

### 1. To audit the commands we’d run in past, we use [history command][1]. Here is a sample output of history command. ###

    # history

![history command example](http://www.tecmint.com/wp-content/uploads/2015/03/history-command.gif)
history command example

Obvious from output, the history command do not output the time stamp with the log of last executed commands. Any solution for this? Yeah! Run the below command.

    # HISTTIMEFORMAT="%d/%m/%y %T "
    # history

If you want to permanently append this change, add the below line to `~/.bashrc`.

    export HISTTIMEFORMAT="%d/%m/%y %T "

and then, from terminal run,

    # source ~/.bashrc

Explanation of commands and switches.

- history – GNU History Library
- HISTIMEFORMAT – Environmental Variable
- %d – Day
- %m – Month
- %y – Year
- %T – Time Stamp
- source – in short send the contents of file to shell
- .bashrc – is a shell script that BASH runs whenever it is started interactively.

![history Command Logs](http://www.tecmint.com/wp-content/uploads/2015/03/History-Command-Logs.gif)
history Command Logs

### 2. The next gem in the list is – how to check disk write speed? Well one liner dd command script serves the purpose. ###

    # dd if=/dev/zero of=/tmp/output.img bs=8k count=256k conv=fdatasync; rm -rf /tmp/output.img

![dd Command Example](http://www.tecmint.com/wp-content/uploads/2015/03/dd-Command-Example.gif)
dd Command Example

Explanation of commands and switches.

- dd – Convert and Copy a file
- if=/dev/zero – Read the file and not stdin
- of=/tmp/output.img – Write to file and not stdout
- bs – Read and Write maximum upto M bytes, at one time
- count – Copy N input block
- conv – Convert the file as per comma separated symbol list.
- rm – Removes files and folder
- -rf – (-r) removes directories and contents recursively and (-f) Force the removal without prompt.

### 3. How will you check the top six files that are eating out your space? A simple one liner script made from [du command][2], which is primarily used as file space usages. ###

    # du -hsx * | sort -rh | head -6

![Check Disk Space Usage](http://www.tecmint.com/wp-content/uploads/2015/03/check-disk-space-usage.gif)
Check Disk Space Usage

Explanation of commands and switches.

- du – Estimate file space usages
- -hsx – (-h) Human Readable Format, (-s) Summaries Output, (-x) One File Format, skip directories on other file format.
- sort – Sort text file lines
- -rf – (-r) Reverse the result of comparison, (-f) Ignore case
- head – output first n lines of file.

### 4. The next step involves statistics in terminal of a file of every kind. We can output the statistics related to a file with the help of stat (output file/fileSystem status) command. ###

    # stat filename_ext  (viz., stat abc.pdf)

![Check File Statistics](http://www.tecmint.com/wp-content/uploads/2015/03/Check-File-Statistics.gif)
Check File Statistics

### 5. The next and last but not the least, this one line script is for those, who are newbies. If you are an experienced user you probably don’t need it, unless you want some fun out of it. Well newbies are Linux-command-line phobic and the below one liner will generate random man pages. The benefit is as a newbie you always get something to learn and never get bored. ###

    # man $(ls /bin | shuf | head -1)

![Generate Random Man Pages](http://www.tecmint.com/wp-content/uploads/2015/03/Generate-Random-Man-Pages.gif)
Generate Random Man Pages

Explanation of commands and switches.

- man – Linux Man pages
- ls – Linux Listing Commands
- /bin – System Binary file Location
- shuf – Generate Random Permutation
- head – Output first n line of file.

That’s all for now. If you know any such tips and tricks you may share with us and we will post the same in your words on our reputed Tecmint.com website.

If you want to share any tips and tricks that you cannot make into article you may share it at tecmint[dot]com[at]gmail[dot]com and we will include it in our article. Don’t forget to provide us with your valuable feedback in the comments below. Keep connected. Like and share us and help us get spread.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/5-linux-command-line-tricks/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/history-command-examples/
[2]:http://www.tecmint.com/check-linux-disk-usage-of-files-and-directories/
