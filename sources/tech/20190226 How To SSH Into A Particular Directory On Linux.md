[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To SSH Into A Particular Directory On Linux)
[#]: via: (https://www.ostechnix.com/how-to-ssh-into-a-particular-directory-on-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

How To SSH Into A Particular Directory On Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2019/02/SSH-Into-A-Particular-Directory-720x340.png)

Have you ever been in a situation where you want to SSH to a remote server and immediately cd into a directory and continue work interactively? You’re on the right track! This brief tutorial describes how to directly SSH into a particular directory of a remote Linux system. Not just SSH into a specific directory, you can run any command immediately right after connecting to an SSH server as described in this guide. It is not that difficult as you might think. Read on.

### SSH Into A Particular Directory Of A Remote System

Before I knew this method, I would usually first SSH to the remote remote system using command:

```
$ ssh user@remote-system
```

And then cd into a directory like below:

```
$ cd <some-directory>
```

However, you need not to use two separate commands. You can combine these commands and simplify the task with one command.

Have a look at the following example.

```
$ ssh -t sk@192.168.225.22 'cd /home/sk/ostechnix ; bash'
```

The above command will SSH into a remote system (192.168.225.22) and immediately cd into a directory named **‘/home/sk/ostechnix/’** directory and leave yourself at the prompt.

Here, the **-t** flag is used to force pseudo-terminal allocation, which is necessary or an interactive shell.

Here is the sample output of the above command:

![](https://www.ostechnix.com/wp-content/uploads/2019/02/ssh-1.gif)

You can also use this command as well.

```
$ ssh -t sk@192.168.225.22 'cd /home/sk/ostechnix ; exec bash'
```

Or,

```
$ ssh -t sk@192.168.225.22 'cd /home/sk/ostechnix && exec bash -l'
```

Here, the **-l** flag sets the bash as login shell.

In the above example, I have used **bash** in the last argument. It is the default shell in my remote system. If you don’t know the shell type on the remote system, use the following command:

```
$ ssh -t sk@192.168.225.22 'cd /home/sk/ostechnix && exec $SHELL'
```

Like I already said, this is not just for cd into directory after connecting to an remote system. You can use this trick to run other commands as well. For example, the following command will land you inside ‘/home/sk/ostechnix/’ directory and then execute ‘uname -a’ command.

```
$ ssh -t sk@192.168.225.22 'cd /home/sk/ostechnix && uname -a && exec $SHELL'
```

Alternatively, you can add the command(s) you wanted to run after connecting to an SSH server on the remote system’s **.bash_profile** file.

Edit **.bash_profile** file:

```
$ nano ~/.bash_profile
```

Add the command(s) one by one. In my case, I am adding the following line:

```
cd /home/sk/ostechnix >& /dev/null
```

Save and close the file. Finally, run the following command to update the changes.

```
$ source ~/.bash_profile
```

Please note that you should add this line on the remote system’s **.bash_profile** or **.bashrc** file, not in your local system’s. From now on, whenever you login (whether by SSH or direct), the cd command will execute and you will be automatically landed inside “/home/sk/ostechnix/” directory.


And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-ssh-into-a-particular-directory-on-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
