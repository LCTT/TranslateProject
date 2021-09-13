[#]: subject: "How to Set JAVA_HOME Variable in Ubuntu Linux Correctly"
[#]: via: "https://itsfoss.com/set-java-home-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Set JAVA_HOME Variable in Ubuntu Linux Correctly
======

If you are [running Java programs on Ubuntu][1] using Eclipse, [Maven][2] or Netbeans etc, you’ll need to set JAVA_HOME to your path. Otherwise, your system will complain that “java_home environment variable is not set”.

In this beginner’s tutorial, I’ll show the steps to correctly set Java Home variable on Ubuntu. The steps should be valid for most other Linux distributions as well.

The process consists of these steps:

  * Making sure Java Development Kit (JDK) is installed.
  * Finding the correct location of JDK executable.
  * Setting the JAVA_HOME variable and making the change permanent.



### Step 1: Check if JDK is installed

The simplest way to check if Java Development Kit (JDK) is installed on your Linux system is by running this command:

```
javac --version
```

The above command checks the version of Java compiler. If it is installed, it will show the Java version.

![Java Compiler is installed][3]

If the command shows an error like javac command not found, you’ll have to install JDK.

![Java Compiler is not installed][4]

If Java Compiler is not installed on your system, install Java Development Kit using this command:

```
sudo apt install default-jdk
```

This will install the default Java version in your current Ubuntu version. If you need some other specific Java version, you’ll have to specify it while [installing Java on Ubuntu][5].

Once you have made sure that Java Compiler is present on your system, it’s time to find its location.

### Step 2: Get the location of JDK executable (Java Compiler)

The executable is usually located in the /usr/lib/jvm directory. I won’t left you on your own for a guessing game. Instead, let’s find out the path of the Java executable.

[Use the which command][6] to get the location of Java Compiler executable:

```
which javac
```

The problem here is that the location it gives is actually a [symbolic link][7]. You’ll have to follow it a couple of times:

![][8]

An easier method is to follow the symbolic link and get to the actual executable file directly using this command:

```
readlink -f `which java`
```

The readlink command follows a symbolic link. I have used ` around _which java_. This is called command substitution and it replaces the command with its output. So basically, the above command is equivalent to _readlink -f /usr/bin/java_ in this case.

In my example, the location of the executable file is **/usr/lib/jvm/java-11-openjdk-amd64/bin/java**. It could be different for you. Copy the correct path you got from the above command in your system. You know, you can [copy paste in the Ubuntu terminal][9].

### Step 3: Setting JAVA_HOME variable

Now that you have got the location, use it to set the JAVA_HOME environment variable:

```
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/bin/java
```

Check the value of JAVA_HOME directory:

```
echo $JAVA_HOME
```

![][10]

Try to run your program or project in the SAME TERMINAL and see if it works.

This is not over yet. The JAVA_HOME variable you just declared is temporary. If you close the terminal or start a new session, it will be empty again.

To set JAVA_HOME variable ‘permanently’, you should add it to the bashrc file in your home directory.

You can [use the Nano editor for editing files in the Linux terminal][11]. If you do not want that and take a simple copy-paste approach, use the following commands:

Back up your bashrc file (in case you mess it, you can get it back):

```
cp ~/.bashrc ~/.bashrc.bak
```

Next, [use the echo command to append][12] the export command you used at the beginning of this section. _**Change the command below to use the correct path as displayed by your system in**_.

```
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/bin/java" >> ~/.bashrc
```

Verify that it has been correctly added to the end of the file:

```
tail -3 ~/.bashrc
```

The above [tail command][13] will show the last 3 lines of the specified file.

Here’s the entire output of the above three commands.

![][14]

Now, even if you exit the session or restart the system, the JAVA_HOME variable will still be set to the value you specified. That’s what you want, right?

Do note that if you change the default Java version in the future, you’ll have to change the value of JAVA_HOME and point it to the correct executable path.

I hope this tutorial not only helped you to set Java Home, it also taught you how you are doing it.

If you are still facing issues or have any questions or suggestions, please let me know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/set-java-home-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/run-java-program-ubuntu/
[2]: https://maven.apache.org/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/check-java-compiler-ubuntu.png?resize=750%2C310&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/java-compiler-check-ubuntu.png?resize=732%2C300&ssl=1
[5]: https://itsfoss.com/install-java-ubuntu/
[6]: https://linuxhandbook.com/which-command/
[7]: https://linuxhandbook.com/symbolic-link-linux/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/get-java-home-path-ubuntu.png?resize=800%2C283&ssl=1
[9]: https://itsfoss.com/copy-paste-linux-terminal/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/setting-java-home-ubuntu.png?resize=800%2C268&ssl=1
[11]: https://itsfoss.com/nano-editor-guide/
[12]: https://linuxhandbook.com/echo-command/
[13]: https://linuxhandbook.com/tail-command/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/set-java-home-bashrc-ubuntu.png?resize=786%2C348&ssl=1
