15 Practical Examples of ‘cd’ Command in Linux
================================================================================
In Linux **‘cd‘ (Change Directory)** command is one of the most important and most widely used command for newbies as well as system administrators. For admins on a headless server, ‘**cd**‘ is the only way to navigate to a directory to check log, execute a program/application/script and for every other task. For newbie it is among those initial commands they make their hands dirty with.

![15 cd command examples in linux](http://www.tecmint.com/wp-content/uploads/2014/08/cd-command-in-linux.png)
15 cd command examples in linux

Thus, keeping in mind, we here bringing you **15** basic commands of ‘**cd**‘ using tricks and shortcuts to reduce your efforts on the terminal and save time by using these known tricks.

### Tutorial Details ###

- Command Name : cd
- Stands for : Change Directory
- Availability : All Linux Distribution
- Execute On : Command Line
- Permission : Access own directory or otherwise assigned.
- Level : Basic/Beginners

1. Change from current directory to /usr/local.

    avi@tecmint:~$ cd /usr/local

    avi@tecmint:/usr/local$ 

2. Change from current directory to /usr/local/lib using absolute path.

    avi@tecmint:/usr/local$ cd /usr/local/lib 

    avi@tecmint:/usr/local/lib$ 

3. Change from current working directory to /usr/local/lib using relative path.

    avi@tecmint:/usr/local$ cd lib 

    avi@tecmint:/usr/local/lib$ 

4. **(a)** Move one directory back from where you are now.

    avi@tecmint:/usr/local/lib$ cd - 

    /usr/local 
    avi@tecmint:/usr/local$ 

4. **(b)** Change Current directory to parent directory.

    avi@tecmint:/usr/local/lib$ cd .. 

    avi@tecmint:/usr/local$ 

5. Show last working directory from where we moved (use ‘–’ switch) as shown.

    avi@tecmint:/usr/local$ cd -- 

    /home/avi 

6. Move two directory up from where you are now.

    avi@tecmint:/usr/local$ cd ../ ../ 

    avi@tecmint:/usr$

7. Move to users home directory from anywhere.

    avi@tecmint:/usr/local$ cd ~ 

    avi@tecmint:~$ 

    or

    avi@tecmint:/usr/local$ cd 

    avi@tecmint:~$ 

8. Change working directory to current working directory (seems no use of in General).

    avi@tecmint:~/Downloads$ cd . 
    avi@tecmint:~/Downloads$ 
    
    or
    
    avi@tecmint:~/Downloads$ cd ./ 
    avi@tecmint:~/Downloads$ 

9. Your present working Directory is “/usr/local/lib/python3.4/dist-packages/ ”, change it to “/home/avi/Desktop/ ”, in one line command, by moving up in the directory till ‘/’ then using absolute path.

    avi@tecmint:/usr/local/lib/python3.4/dist-packages$ cd ../../../../../home/avi/Desktop/ 

    avi@tecmint:~/Desktop$ 

10. Change from current working directory to /var/www/html without typing in full using TAB.

    avi@tecmint:/var/www$ cd /v<TAB>/w<TAB>/h<TAB>

    avi@tecmint:/var/www/html$ 

11. Navigate from your current working directory to /etc/v__ _, Oops! You forgot the name of directory and not supposed to use TAB.

    avi@tecmint:~$ cd /etc/v* 

    avi@tecmint:/etc/vbox$ 

**Note:** This will move to ‘**vbox**‘ only if there is only one directory starting with ‘**v**‘. If more than one directory starting with ‘**v**‘ exist, and no more criteria is provided in command line, it will move to the first directory starting with ‘**v**‘, alphabetically as their presence in standard dictionary.

12. You need to navigate to user ‘**av**‘ (not sure if it is avi or avt) home directory, without using **TAB**.

    avi@tecmint:/etc$ cd /home/av? 

    avi@tecmint:~$ 

13. What are pushd and popd in Linux?

Pushd and popd are Linux commands in bash and certain other shell which saves current working directory location to memory and bring to the directory from memory as current working directory, respectively as well as changes directory.

    avi@tecmint:~$ pushd /var/www/html 

    /var/www/html ~ 
    avi@tecmint:/var/www/html$ 

The above command saves the current location to memory and changes to the requested directory. As soon as popd is fired, it fetch the saved directory location from memory and makes it current working directory.

    avi@tecmint:/var/www/html$ popd 
    ~ 
    avi@tecmint:~$ 

14. Change to a directory containing white spaces.

    avi@tecmint:~$ cd test\ tecmint/ 

    avi@tecmint:~/test tecmint$ 

    or

    avi@tecmint:~$ cd 'test tecmint' 
    avi@tecmint:~/test tecmint$ 

    or 

    avi@tecmint:~$ cd "test tecmint"/ 
    avi@tecmint:~/test tecmint$ 

15. Change from current working directory to Downloads and list all its settings in one go.

    avi@tecmint:/usr$ cd ~/Downloads && ls
    
    …
    .
    service_locator_in.xls 
    sources.list 
    teamviewer_linux_x64.deb 
    tor-browser-linux64-3.6.3_en-US.tar.xz 
    .
    ...

This is our attempt, to make you aware of Linux Workings and executions in least possible words and with as much as user friendliness as it used to be before.

That’s all for now. I’ll be here again with another interesting topic soon. Till then stay tuned and connected to Tecmint. Don’t forget to provide us with your valuable feedback in the comments below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/cd-command-in-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/