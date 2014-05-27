Translating by GOLinux ... Any question?
10 Useful ‘Interview Questions and Answers’ on Linux Shell Scripting
================================================================================
Greeting of the day. The vastness of Linux makes it possible to come up with a unique post every time. We ‘**The-Tecmint-Team**‘ works to provide our readers with unique contents which is useful for them from career perspective as well as adding to the Knowledge base. Here is an attempt and it is on our readers to judge how far we succeed.

![Questions on Shell Scripting](http://www.tecmint.com/wp-content/uploads/2014/05/Questions-on-Shell-Scripting.png)

We have lots of tutorials on **Shell Scripting** language and **Interview Questions** for readers of all kind, here are the links to those articles.

- [Shell Scripting Series][1]
- [Interview Question and Answer Series][2]

Adding to the shell scripting posts here, in this article we will be going through questions related to Linux Shell from interview point of view.

#### 1. How will you abort a shell script before it is successfully executed? ####

> **Answer** : We need to use ‘exit’ command to fulfil the above described situation. A ‘exit’ command when forced to output any value other than 0 (zero), the script will throw an error and will abort. The value 0 (zero) under Unix environment shell scripting represents successful execution. Hence putting ‘exit -1’, without quotes before script termination will abort the script.

For example, create a following shell script as ‘**anything.sh**‘.

    #!/bin/bash
    echo "Hello"
    exit -1
    echo "bye"

Save the file and execute it.

    # sh anything.sh

    Hello
    exit.sh: 3: exit: Illegal number: -1

From the above script, it is clear that the execution went well before exit -1 command.

#### 2. How to remove the headers from a file using command in Linux? ####

> **Answer** : A ‘sed’ command comes to rescue here, when we need to delete certain lines of a file.

Here it the exact command to remove headers from a file (or first line of a file).

    # sed '1 d' file.txt

The only problem with above command is that, it outputs the file on standard output without the first line. In order to save the output to file, we need to use redirect operator which will redirects the output to a file.

    # sed '1 d' file.txt > new_file.txt

Well the built in switch ‘**-i**‘ for **sed** command, can perform this operation without a redirect operator.

    # sed -i '1 d' file.txt

#### 3. How will you check the length of a line from a text file? ####

> **Answer** : Again ‘sed’ command is used to find or check the length of a line from a text file.

A ‘**sed –n ‘n p’ file.txt**‘, where ‘**n**‘ represents the line number and ‘**p**‘ print out the pattern space (to the standard output). This command is usually only used in conjunction with the **-n** command-line option. So, how to get the length count? Obviously! we need to pipeline the output with ‘**wc**‘ command.

    # sed –n 'n p' file.txt | wc –c

To get the length of line number ’5′ in the text file ‘**tecmint.txt**‘, we need to run.

    # sed -n '5 p' tecmint.txt | wc -c

#### 4. Is it possible to view all the non-printable characters from a text file on Linux System? How will you achieve this? ####

> **Answer** : Yes! it is very much possible to view all the non-printable characters in Linux. In order to achieve the above said scenario, we need to take the help of editor ‘vi’.

How to show non-printable characters in ‘**vi**‘ editor?

- Open vi editor.
- Go to command mode of vi editor by pressing [esc] followed by ‘:’.
- The final step is to type execute [set list] command, from command interface of ‘vi’ editor.

**Note**: This way we can see all the non-printable characters from a text file including **ctrl+m (^M)**.

#### 5. You are a Team-Leader of a group of staffs working for a company xyz. The company ask you to create a directory ‘dir_xyz’, such that any member of the group can create a file or access a file under it, but no one can delete the file, except the one created it. what will you do? ####

> **Answer** : An interesting scenario to work upon. Well in the above said scenario we need to implement the below steps which is as easy as cake walk.

    # mkdir dir_xyz
    # chmod g+wx dir_xyz
    # chmod +t dir_xyz

The first line of command create a directory (**dir_xyz**). The second line of command above allow group (g) to have permission to ‘**write**‘ and ‘**execute**‘ and the last line of the above command – The ‘**+t**‘ in the end of the permissions is called the ‘**sticky bit**‘. It replaces the ‘x‘ and indicates that in this directory, files can only be deleted by their owners, the owner of the directory or the root superuser.

#### 6. Can you tell me the various stages of a Linux process, it passes through? ####

> **Answer** : A Linux process normally goes through four major stages in its processing life.

Here are the 4 stages of Linux process.

- Waiting: Linux Process waiting for a resource.
- Running : A Linux process is currently being executed.
- Stopped : A Linux Process is stopped after successful execution or after receiving kill signal.
- Zombie : A Process is said to be ‘Zombie’ if it has stopped but still active in process table.

#### 7. What is the use of cut command in Linux? ####

> **Answer** : A ‘cut’ is a very useful Linux command which proves to be helpful when we need to cut certain specific part of a file and print it on standard output, for better manipulation when the field of the file and file itself is too heavy.

For example, extract first 10 columns of a text file ‘**txt_tecmint**‘.

    # cut -c1-10 txt_tecmint

To extract 2nd, 5th and 7th column of the same text file.

    # cut -d;-f2 -f5 -f7 txt_tecmint

#### 8. What is the difference between commands ‘cmp’ and ‘diff’? ####

> **Answer** : The command ‘cmp’ and ‘diff’ means to obtain the same thing but with different mindset.

The ‘**diff**‘ command reports the changes one should make so that both the files look the same. Whereas ‘**cmp**‘ command compares the two files byte-by-byte and reports the first mismatch.

#### 9. Is it possible to substitute ‘ls’ command with ‘echo’ command? ####

> **Answer** : Yes! the ‘ls’ command can be substituted by ‘echo’ command. The command ‘ls’ lists the content of file. From the point of view of replacement of above command we can use ‘echo *’, obviously without quotes. The output of both the commands are same.

#### 10. You might have heard about inodes. can you describe inode briefly? ####

> **Answer** : A ‘inode’ is a ‘data-structure’, which is used for file identification on Linux. Each file on an Unix System has a separate ‘inode’ and an ‘Unique’ inode Number.

That’s all for now. We will be coming up with another interesting and knowledgeable Interview questions, in the next article. Till then Stay tuned and connected to Tecmint.com. Don’t forget to provide us, with your valuable feedback in the comment section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/interview-questions-on-shell-scripting/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/category/bash-shell/
[2]:http://www.tecmint.com/category/interview-questions/
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
