[#]: subject: "The Basic Concepts of Shell Scripting"
[#]: via: "https://www.opensourceforu.com/2022/05/the-basic-concepts-of-shell-scripting/"
[#]: author: "Sathyanarayanan Thangavelu https://www.opensourceforu.com/author/sathyanarayanan-thangavelu/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The Basic Concepts of Shell Scripting
======
If you want to automate regular tasks and make your life easier, using shell scripts is a good option. This article introduces you to the basic concepts that will help you to write efficient shell scripts.

![Shell-scripting][1]

Ashell script is a computer program designed to be run by the UNIX shell, a command-line interpreter. The various dialects of shell scripts are considered to be scripting languages. Typical operations performed by shell scripts include file manipulation, program execution, and printing of text. A script that sets up the environment, runs the program, and does any necessary cleanup or logging, is called a wrapper.

### Identification of shell prompt

You can identify whether the shell prompt on a Linux based computer is a normal or super user by looking at the symbols of the prompt in the terminal window. The ‘#’ symbol is used for a super user and the ‘$’ symbol is used for a user with standard privileges.

![Figure 1: Manual of date command][2]

### Basic commands

The script comes with too many commands that can be executed on the terminal window to manage your computer. Details of each command can be found in the manual included with the command. To view the manual, you need to run the command:

```
$man <command>
```

A few frequently used commands are:

```
$date #display current date and time
$cal #display current month calendar
$df #displays disk usages
$free #display memory usage
$ls #List files and directories
$mkdir #Creates directory
```

Each command comes with several options that can be used along with it. You can refer to the manual for more details. See Figure 1 for the output of:

```
$man date
```

### Redirection operators

The redirection operator is really useful when you want to capture the output of a command in a file or redirect to a file.

| Command | Description |
| :- | :- |
| $ls -l /usr/bin >file | default stdout to file | 
| $ls -l /usr/bin 2>file | redirects stderr to file | 
| $ls -l /usr/bin > ls-output 2>&1 | redirects stderr & stdout to file | 
| $ls -l /usr/bin &> ls-output | redirects stderr & stdout to file | 
| $ls -l /usr/bin 2> /dev/null | /dev/null bitbucket |

## Brace expansion

Brace expansion is one of the powerful options UNIX has. It helps do a lot of operations with minimal commands in a single line instruction. For example:

```
$echo Front-{A,B,C}-Back
Front-A-Back, Front-B-Back, Front-C-Back

$echo {Z..A}
Z Y X W V U T S R Q P O N M L K J I H G F E D C B A

$mkdir {2009..2011}-0{1..9} {2009..2011}-{10..12}
```

This creates a directory for 12 months from 2009 to 2011.

### Environment variables

An environment variable is a dynamic-named value that can affect the way running processes will behave on a computer. This variable is a part of the environment in which a process runs.

| Command | Description |
| :- | :- |
| printenv | Print part of all of the environment | 
| set | set shell options | 
| export | export environment to subsequently executed programs | 
| alias | create an alias for command |

### Network commands

Network commands are very useful for troubleshooting issues on the network and to check the particular port connecting to the client.

| Command | Description |
| :- | :- |
| ping | Send ICMP packets | 
| traceroute | Print route packets to a network | 
| netstat | print network connection, routing table, 
interface stats | 
| ftp/lftp | Internet file transfer program | 
| wget | Non Interactive network downloader | 
| ssh | OpenSSH SSH Client (remote login program) | 
| scp | secure copy | 
| sftp | Secure File transfer program |

### Grep commands

Grep commands are useful to find the errors and debug the logs in the system. It is one of the powerful tools that shell has.

| Command | Description |
| :- | :- |
| grep -h ‘.zip’ file.list | . is any character | 
| grep -h ‘^zip’ file.list | starts with zip | 
| grep -h ‘zip$’ file.list | ends with zip | 
| grep -h ‘^zip$’ file.list | containing only zip | 
| grep -h ‘[^bz]zip’ file.list | not containing b and z | 
| grep -h ‘^[A-Za-z0-9]’ file.list | file containing any valid names |

### Quantifiers

Here are some examples of quantifiers:

| Command | Description |
| :- | :- |
| ? | match element zero or one time | 
| * | match an element zero or more times | 
| + | Match an element one or more times | 
| {} | match an element specfic number of times |

### Text processing

Text processing is another important task in the current IT world. Programmers and administrators can use the commands to dice, cut and process texts.

| Command | Description |
| :- | :- |
| cat -A $FILE | To find any CTRL character introduced | 
| sort file1.txt file2.txt file3.txt > 
final_sorted_list.txt | sort all files once | 
| ls - l | sort -nr -k 5 | key field 5th column | 
| sort --key=1,1 --key=2n distor.txt | key field 1,1 sort and second column sort 
by numeric | 
| sort foo.txt | uniq -c | to find repetition | 
| cut -f 3 distro.txt | cut column 3 | 
| cut -c 7-10 | cut character 7 - 10 | 
| cut -d ‘:’ -f 1 /etc/password | delimiter : | 
| sort -k 3.7nbr -k 3.1nbr -k 3.4nbr
 distro.txt | 3 rd field 7 the character, 
3rd field 1 character | 
| paste file1.txt file2.txt > newfile.txt | merge two files | 
| join file1.txt file2.txt | join on common two fields |

### Hacks and tips

In Linux, we can go back to our history of commands by either using simple commands or control options.

| Command | Description |
| :- | :- |
| clear | clears the screen | 
| history | stores the history | 
| script filename | capture all command execution in a file |


Tips:

> History  : CTRL + {R, P}
> !!number : command history number
> !!       : last command
> !?string : history containing last string
> !string  : history containing last string

```
export HISTCONTROL=ignoredups
export HISTSIZE=10000
```

As you get familiar with the Linux commands, you will be able to write wrapper scripts. All manual tasks like taking regular backups, cleaning up files, monitoring the system usage, etc, can be automated using scripts. This article will help you to start scripting, before you move to learning advanced concepts.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/the-basic-concepts-of-shell-scripting/

作者：[Sathyanarayanan Thangavelu][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/sathyanarayanan-thangavelu/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Shell-scripting.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-1-Manual-of-date-command.jpg
