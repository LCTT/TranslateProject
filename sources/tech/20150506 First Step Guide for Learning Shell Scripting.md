First Step Guide for Learning Shell Scripting
================================================================================
![](http://blog.linoxide.com/wp-content/uploads/2015/04/myfirstshellscript.jpg)

Usually when people say "shell scripting" they have on mind bash, ksh, sh, ash or similar linux/unix scripting language. Scripting is another way to communicate with computer. Using graphic windows interface (not matter windows or linux) user can move mouse and clicking on the various objects like, buttons, lists, check boxes and so on. But it is very inconvenient way witch requires user participation and accuracy each time he would like to ask computer / server to do the same tasks (lets say to convert photos or download new movies, mp3 etc). To make all these things easy accessible and automated we could use shell scripts.

Some programming languages like pascal, foxpro, C, java needs to be compiled before they could be executed. They needs appropriate compiler to make our code to do some job.

Another programming languages like php, javascript, visualbasic do not needs compiler. So they need interpretersand we could run our program without compiling the code.

The shell scripts is also like interpreters, but it is usually used to call external compiled programs. Then captures the outputs, exit codes and act accordingly.

One of the most popular shell scripting language in the linux world is the bash. And i think (this is my own opinion) this is because bash shell allows user easily navigate through the history commands (previously executed) by default, in opposite ksh which requires some tuning in .profile or remember some "magic" key combination to walk through history and amend commands.

Ok, i think this is enough for introduction and i leaving for your judge which environment is most comfortable for you. Since now i will speak only about bash and scripting. In the following examples i will use the CentOS 6.6 and bash-4.1.2. Just make sure you have the same or greater version.

### Shell Script Streams ###

The shell scripting it is something similar to conversation of several persons. Just imagine that all command like the persons who able to do something if you properly ask them. Lets say you would like to write the document. First of all you need the paper, then you need to say the content to someone to write it, and finally you would like to store it somewhere. Or you would like build a house, so you will ask appropriate persons to cleanup the space. After they say "its done" then other engineers could build for you the walls. And finally, when engineers also tell "Its done" you can ask the painters to color your house. And what would happen if you ask the painters coloring your walls before they are built? I think they will start to complain. Almost all commands like the persons could speak and if they did its job without any issues they speaks to "standard output". If they can't to what you asking - they speaking to the "standard error". So finally all commands listening for you through "standard input".

Quick example- when you opening linux terminal and writing some text - you speaking to bash through "standard input". So ask the bash shell **who am i**

    root@localhost ~]# who am i                                <--- you speaking through the standard input to bash shell
    root     pts/0        2015-04-22 20:17 (192.168.1.123)          <--- bash shell answering to you through the standard output

Now lets ask something that bash will not understand us:

    [root@localhost ~]# blablabla           <--- and again, you speaking through standard input
    -bash: blablabla: command not found     <--- bash complaining through standard error

The first word before ":" usually is the command which complaining to you. Actually each of these streams has their own index number:

- standard input (**stdin**) - 0
- standard output (**stdout**) - 1
- standard error (**stderr**) - 2

If you really would like to know to witch output command said something - you need to redirect (to use "greater than ">" symbol after command and stream index) that speech to file:

    [root@localhost ~]# blablabla 1> output.txt
    -bash: blablabla: command not found

In this example we tried to redirect 1 (**stdout**) stream to file named output.txt. Lets look does to the content of that file. We use the command cat for that:

    [root@localhost ~]# cat output.txt
    [root@localhost ~]#

Seams that is empty. Ok now lets try to redirect 2 (**stderr**) streem:

    [root@localhost ~]# blablabla 2> error.txt
    [root@localhost ~]#

Ok, we see that complains gone. Lets chec the file:

    [root@localhost ~]# cat error.txt
    -bash: blablabla: command not found
    [root@localhost ~]#

Exactly! We see that all complains was recorded to the errors.txt file.

Sometimes commands produces **stdout** and **stderr** simultaniously. To redirect them to separate files we can use the following syntax:

    command 1>out.txt 2>err.txt

To shorten this syntax a bit we can skip the "1" as by default the **stdout** stream will be redirected:

    command >out.txt 2>err.txt

Ok, lets try to do something "bad". lets remove the file1 and folder1 with the rm command:

    [root@localhost ~]# rm -vf folder1 file1 > out.txt 2>err.txt

Now check our output files:

    [root@localhost ~]# cat out.txt
    removed `file1'
    [root@localhost ~]# cat err.txt
    rm: cannot remove `folder1': Is a directory
    [root@localhost ~]#

As we see the streams was separated to different files. Sometimes it is not handy as usually we want to see the sequence when the errors appeared - before or after some actions. For that we can redirect both streams to the same file:

    command >>out_err.txt 2>>out_err.txt

Note : Please notice that i use ">>" instead of ">". It allows us to append file instead of overwrite.

We can redirect one stream to another:

    command >out_err.txt 2>&1

Let me explain. All stdout of the command will be redirected to the out_err.txt. The errout will be redirected to the 1-st stream which (as i already explained above) will be redirected to the same file. Let see the example:

    [root@localhost ~]# rm -fv folder2 file2 >out_err.txt 2>&1
    [root@localhost ~]# cat out_err.txt
    rm: cannot remove `folder2': Is a directory
    removed `file2'
    [root@localhost ~]#

Looking at the combined output we can state that first of all **rm** command tried to remove the folder2 and it was not success as linux require the **-r** key for **rm** command to allow remove folders. At the second the file2 was removed. By providing the **-v** (verbose) key for the **rm** command we asking rm command to inform as about each removed file or folder.

This is almost all you need to know about redirection. I say almost, because there is one more very important redirection which called "piping". By using | (pipe) symbol we usually redirecting **stdout** streem.

Lets say we have the text file:

    [root@localhost ~]# cat text_file.txt
    This line does not contain H e l l o  word
    This lilne contains Hello
    This also containd Hello
    This one no due to HELLO all capital
    Hello bash world!

and we need to find the lines in it with the words "Hello". Linux has the **grep** command for that:

    [root@localhost ~]# grep Hello text_file.txt
    This lilne contains Hello
    This also containd Hello
    Hello bash world!
    [root@localhost ~]#

This is ok when we have file and would like to sech in it. But what to do if we need to find something in the output of another command? Yes, of course we can redirect the output to the file and then look in it:

    [root@localhost ~]# fdisk -l>fdisk.out
    [root@localhost ~]# grep "Disk /dev" fdisk.out
    Disk /dev/sda: 8589 MB, 8589934592 bytes
    Disk /dev/mapper/VolGroup-lv_root: 7205 MB, 7205814272 bytes
    Disk /dev/mapper/VolGroup-lv_swap: 855 MB, 855638016 bytes
    [root@localhost ~]#

If you going to grep something with white spaces embrace that with " quotes!

Note :  fdisk command shows information about Linux OS disk drives

As we see this way is not very handy as soon we will mess the space with temporary files. For that we can use the pipes. They allow us redirect one command **stdout** to another command **stdin** streams:

    [root@localhost ~]# fdisk -l | grep "Disk /dev"
    Disk /dev/sda: 8589 MB, 8589934592 bytes
    Disk /dev/mapper/VolGroup-lv_root: 7205 MB, 7205814272 bytes
    Disk /dev/mapper/VolGroup-lv_swap: 855 MB, 855638016 bytes
    [root@localhost ~]#

As we see, we get the same result without any temporary files. We have redirected **frisk stdout** to the **grep stdin**.

**Note** : Pipe redirection is always from left to right.

There are several other redirections but we will speak about them later.

### Displaying custom messages in the shell ###

As we already know usually communication with and within shell is going as dialog. So lets create some real script which also will speak with us. It will allow you to learn some simple commands and better understand the scripting concept.

Imagine we are working in some company as help desk manager and we would like to create some shell script to register the call information: phone number, User name and brief description about issue. We going to store it in the plain text file data.txt for future statistics. Script it self should work in dialog way to make live easy for help desk workers. So first of all we need to display the questions. For displaying any messages there is echo and printf commands. Both of them displaying messages, but printf is more powerful as we can nicely form output to align it to the right, left or leave dedicated space for message. Lets start from simple one. For file creation please use your favorite text editor (kate, nano, vi, ...) and create the file named note.sh with the command inside:

    echo "Phone number ?"

### Script execution ###

After you have saved the file we can run it with bash command by providing our file as an argument:

    [root@localhost ~]# bash note.sh
    Phone number ?

Actually to use this way for script execution is not handy. It would be more comfortable just execute the script without any **bash** command as a prefix. To make it executable we can use **chmod** command:

    [root@localhost ~]# ls -la note.sh
    -rw-r--r--. 1 root root 22 Apr 23 20:52 note.sh
    [root@localhost ~]# chmod +x note.sh
    [root@localhost ~]# ls -la note.sh
    -rwxr-xr-x. 1 root root 22 Apr 23 20:52 note.sh
    [root@localhost ~]#

![set permission script file](http://blog.linoxide.com/wp-content/uploads/2015/04/Capture.png)

**Note** : ls command displays the files in the current folder. By adding the keys -la it will display a bit more information about files.

As we see, before **chmod** command execution, script has only read (r) and write (w) permissions. After **chmod +x** it got execute (x) permissions. (More details about permissions i am going to describe in next article.) Now we can simply run it:

    [root@localhost ~]# ./note.sh
    Phone number ?

Before script name i have added ./ combination. . (dot) in the unix world means current position (current folder), the / (slash) is the folder separator. (In Windows OS we use \ (backslash) for the same). So whole this combination means: "from the current folder execute the note.sh script". I think it will be more clear for you if i run this script with full path:

    [root@localhost ~]# /root/note.sh
    Phone number ?
    [root@localhost ~]#

It also works.

Everything would be ok if all linux users would have the same default shell. If we simply execute this script default user shell will be used to parse script content and run the commands. Different shells have a bit different syntax, internal commands, etc. So to guarantee the **bash** will be used for our script we should add **#!/bin/bash** as the first line. In this way default user shell will call **/bin/bash** and only then will execute following shell commands in the script:

    [root@localhost ~]# cat note.sh
    #!/bin/bash
    echo "Phone number ?"

Only now we will be 100% sure that **bash** will be used to parse our script content. Lets move on.

### Reading the inputs ###

After we have displayed the message script should wait for answer from user. There is the command **read**:

    #!/bin/bash
    echo "Phone number ?"
    read phone

After execution script will wait for the user input until he press the [ENTER] key:

    [root@localhost ~]# ./note.sh
    Phone number ?
    12345                               <--- here is my input
    [root@localhost ~]#

Everything you have input will be stored to the variable **phone**. To display the value of variable we can use the same **echo** command:

    [root@localhost ~]# cat note.sh
    #!/bin/bash
    echo "Phone number ?"
    read phone
    echo "You have entered $phone as a phone number"
    [root@localhost ~]# ./note.sh
    Phone number ?
    123456
    You have entered 123456 as a phone number
    [root@localhost ~]#

In **bash** shell we using **$** (dollar) sign as variable indication, except when reading into variable and few other moments (will describe later).

Ok, now we are ready to add the rest questions:

    #!/bin/bash
    echo "Phone number?"
    read phone
    echo "Name?"
    read name
    echo "Issue?"
    read issue
    [root@localhost ~]# ./note.sh
    Phone number?
    123
    Name?
    Jim
    Issue?
    script is not working.
    [root@localhost ~]#

### Using stream redirection ###

Perfect! There is left to redirect everything to the file data.txt. As a field separator we going to use / (slash) symbol.

**Note** : You can chose any which you think is the best, bat be sure that content will not have thes symbols inside. It will cause extra fields in the line.

Do not forget to use ">>" instead of ">" as we would like to append the output to the end of file!

    [root@localhost ~]# tail -2 note.sh
    read issue
    echo "$phone/$name/$issue">>data.txt
    [root@localhost ~]# ./note.sh
    Phone number?
    987
    Name?
    Jimmy
    Issue?
    Keybord issue.
    [root@localhost ~]# cat data.txt
    987/Jimmy/Keybord issue.
    [root@localhost ~]#

**Note** : The command **tail** displays the last **-n** lines of the file.

Bingo. Lets run once again:

    [root@localhost ~]# ./note.sh
    Phone number?
    556
    Name?
    Janine
    Issue?
    Mouse was broken.
    [root@localhost ~]# cat data.txt
    987/Jimmy/Keybord issue.
    556/Janine/Mouse was broken.
    [root@localhost ~]#

Our file is growing. Lets add the date in the front of each line. This will be useful later when playing with data while calculating statistic. For that we can use command date and give it some format as i do not like default one:

    [root@localhost ~]# date
    Thu Apr 23 21:33:14 EEST 2015                      <---- default output of dta command
    [root@localhost ~]# date "+%Y.%m.%d %H:%M:%S"
    2015.04.23 21:33:18                               <---- formated output

There are several ways to read the command output to the variable. In this simple situation we will use ` (back quotes):

    [root@localhost ~]# cat note.sh
    #!/bin/bash
    now=`date "+%Y.%m.%d %H:%M:%S"`
    echo "Phone number?"
    read phone
    echo "Name?"
    read name
    echo "Issue?"
    read issue
    echo "$now/$phone/$name/$issue">>data.txt
    [root@localhost ~]# ./note.sh
    Phone number?
    123
    Name?
    Jim
    Issue?
    Script hanging.
    [root@localhost ~]# cat data.txt
    2015.04.23 21:38:56/123/Jim/Script hanging.
    [root@localhost ~]#

Hmmm... Our script looks a bit ugly. Lets prettify it a bit. If you would read manual about **read** command you would find that read command also could display some messages. For this we should use -p key and message:

    [root@localhost ~]# cat note.sh
    #!/bin/bash
    now=`date "+%Y.%m.%d %H:%M:%S"`
    read -p "Phone number: " phone
    read -p "Name: " name
    read -p "Issue: " issue
    echo "$now/$phone/$name/$issue">>data.txt

You can fine a lots of interesting about each command directly from the console. Just type: **man read, man echo, man date, man ....**

Agree it looks much better!

    [root@localhost ~]# ./note.sh
    Phone number: 321
    Name: Susane
    Issue: Mouse was stolen
    [root@localhost ~]# cat data.txt
    2015.04.23 21:38:56/123/Jim/Script hanging.
    2015.04.23 21:43:50/321/Susane/Mouse was stolen
    [root@localhost ~]#

And the cursor is right after the message (not in new line) what makes a bit sense.
Loop

Time to improve our script. If user works all day with the calls it is not very handy to run it each time. Lets add all these actions in the never-ending loop:

    [root@localhost ~]# cat note.sh
    #!/bin/bash
    while true
    do
            read -p "Phone number: " phone
            now=`date "+%Y.%m.%d %H:%M:%S"`
            read -p "Name: " name
            read -p "Issue: " issue
            echo "$now/$phone/$name/$issue">>data.txt
    done

I have swapped **read phone** and **now=`date** lines. This is because i would like to get the time right after the phone number will be entered. If i would left it as the first line in the loop **- the** now variable will get the time right after the data was stored in the file. And it is not good as the next call could be after 20 mins or so.

    [root@localhost ~]# ./note.sh
    Phone number: 123
    Name: Jim
    Issue: Script still not works.
    Phone number: 777
    Name: Daniel
    Issue: I broke my monitor
    Phone number: ^C
    [root@localhost ~]# cat data.txt
    2015.04.23 21:38:56/123/Jim/Script hanging.
    2015.04.23 21:43:50/321/Susane/Mouse was stolen
    2015.04.23 21:47:55/123/Jim/Script still not works.
    2015.04.23 21:48:16/777/Daniel/I broke my monitor
    [root@localhost ~]#

NOTE: To exit from the never-ending loop you can by pressing [Ctrl]+[C] keys. Shell will display ^ as the Ctrl key.

### Using pipe redirection ###

Lets add more functionality to our "Frankenstein" I would like the script will display some statistic after each call. Lets say we want to see the how many times each number called us. For that we should cat the data.txt file:

    [root@localhost ~]# cat data.txt
    2015.04.23 21:38:56/123/Jim/Script hanging.
    2015.04.23 21:43:50/321/Susane/Mouse was stolen
    2015.04.23 21:47:55/123/Jim/Script still not works.
    2015.04.23 21:48:16/777/Daniel/I broke my monitor
    2015.04.23 22:02:14/123/Jimmy/New script also not working!!!
    [root@localhost ~]#

Now all this output we can redirect to the **cut** command to **cut** each line into the chunks (our delimiter "/") and print the second field:

    [root@localhost ~]# cat data.txt | cut -d"/" -f2
    123
    321
    123
    777
    123
    [root@localhost ~]#

Now this output we can redirect to another command to **sort**:

    [root@localhost ~]# cat data.txt | cut -d"/" -f2|sort
    123
    123
    123
    321
    777
    [root@localhost ~]#

and leave only unique lines.  To count unique entries just add **-c** key for **uniq** command:

    [root@localhost ~]# cat data.txt | cut -d"/" -f2 | sort | uniq -c
        3 123
        1 321
        1 777
    [root@localhost ~]#

Just add this to end of our loop:

    #!/bin/bash
    while true
    do
            read -p "Phone number: " phone
            now=`date "+%Y.%m.%d %H:%M:%S"`
            read -p "Name: " name
            read -p "Issue: " issue
            echo "$now/$phone/$name/$issue">>data.txt
            echo "===== We got calls from ====="
            cat data.txt | cut -d"/" -f2 | sort | uniq -c
            echo "--------------------------------"
    done

Run it:

    [root@localhost ~]# ./note.sh
    Phone number: 454
    Name: Malini
    Issue: Windows license expired.
    ===== We got calls from =====
        3 123
        1 321
        1 454
        1 777
    --------------------------------
    Phone number: ^C

![running script](http://blog.linoxide.com/wp-content/uploads/2015/04/Capture11.png)

Current scenario is going through well-known steps like:

- Display message
- Get user input
- Store values to the file
- Do something with stored data

But what if user has several responsibilities and he needs sometimes to input data, sometimes to do statistic calculations, or might be to find something in stored data? For that we need to implement switches / cases. In next article i will show you how to use them and how to nicely form the output. It is useful while "drawing" the tables in the shell.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-shell-script/guide-start-learning-shell-scripting-scratch/

作者：[Petras Liumparas][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/petrasl/