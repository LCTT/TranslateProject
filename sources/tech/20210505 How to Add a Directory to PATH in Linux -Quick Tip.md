[#]: subject: (How to Add a Directory to PATH in Linux [Quick Tip])
[#]: via: (https://itsfoss.com/add-directory-to-path-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Add a Directory to PATH in Linux [Quick Tip]
======

The PATH variable in Linux stores the path to the directories where it should look for executables when you run a command.

```
[email protected]:~$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

As you can see, the **PATH consists of several directories (like /usr/local/sbin, /usr/bin and more) separated by colon (:)**.

If you want to run some executables as command from anywhere in the system, you should add their location in the PATH variable.

This is common while setting up a development environment. For example, imagine you downloaded and installed Java and Maven. To make your programs work properly, you’ll need to specify the location of the binaries of Maven and Java in the PATH.

This quick tutorial is about setting up PATH in Linux. Apart from the steps, I’ll also mention things you should be careful about while dealing with PATH.

### Adding a directory to PATH in Linux

The process to add a new directory to the PATH variable in Linux is essentially this:

```
export PATH=$PATH:your_directory
```

Where `your_directory` is the **absolute path** to the concerned directory.

Let’s say, you download and extracted Maven to the home directory and you want to add its bin directory to the PATH. Let’s assume that the absolute path of this bin directory is /home/abhishek/maven/apache-maven-3.8.0/bin.

Here’s what you should be doing:

export PATH=$PATH:/home/abhishek/maven/apache-maven-3.8.0/bin

```
export PATH=$PATH:/home/abhishek/maven/apache-maven-3.8.0/bin
```

**Things to pay attention** here:

  * The $ before a variable name means you are referring to its value. PATH is the variable name, $PATH is the value of variable PATH.
  * You should not use $ with PATH on the left side of =
  * There must not be any spaces before and after =
  * Don’t forget to include the : after $PATH because the directories in the PATH are separated by colon.
  * There must not be a space before and after the colon (:).



Once you have set the PATH with the new value, please check that the PATH has been correctly updated.

```
[email protected]:~$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/abhishek/maven/apache-maven-3.8.0/bin
```

You may want to run the command or script for which you modified the PATH. This will tell you for sure if the PATH is correctly set now.

#### Making the changes to PATH permanent

You added the desired directory to the PATH variable but the change is temporary. If you exit the terminal, exit the session or logout from the system, the PATH will revert and the changes will be lost.

If you want to make the changes to the PATH variable permanent for yourself, you can add it to the .bashrc file in your home directory, assuming you are using the Bash shell.

You can [use a text editor like Nano][1] or Vim for this task.

```
nano ~/.bashrc
```

![][2]

If you want the modified PATH variable to be available for everyone on the Linux system, you can add the export to the /etc/profile file. This is suitable when you are a sysadmin and have a configured system with custom path.

#### Bonus tip: The directories take precedence in PATH

There are several directories in the PATH variable. When you run an executable file/command, your system looks into the directories in the same order as they are mentioned in the PATH variable.

If /usr/local/sbin comes before /usr/bin, the executable is searched first in /usr/local/sbin. If the executable is found, the search ends and the executable is executed.

This is why you’ll find some examples where the additional directory is added before everything else in PATH:

```
export PATH=your_directory:$PATH
```

If you think that your additional directory should be searched before everything else you should add it before the $PATH otherwise add it after $PATH.

#### Was it clear enough?

I have tried to explain things with necessary details but not going too deep into details. Doe sit make the topic clear or are you more confused than before? If you still have doubts, please let me know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/add-directory-to-path-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/nano-editor-guide/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/add-directory-to-path-linux.png?resize=800%2C451&ssl=1
