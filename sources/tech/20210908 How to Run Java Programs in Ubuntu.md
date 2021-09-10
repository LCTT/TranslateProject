[#]: subject: "How to Run Java Programs in Ubuntu"
[#]: via: "https://itsfoss.com/run-java-program-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Run Java Programs in Ubuntu
======

So, you have started learning Java programming? That’s good.

And you want to run the java programs on your Linux system? Even better.

Let me show how to run Java in terminal in Ubuntu and other Linux distributions.

### Running Java programs in Ubuntu

Let’s go in proper steps here.

#### Step 1: Install Java compiler

To run a Java program, you need to compile the program first. You need Java compiler for this purpose.

The Java compiler is part of [JDK][1] (Java Development Kit). You need to install JDK in order to compile and run Java programs.

First, check if you already have Java Compiler installed on your system:

```
javac --version
```

If you see an error like “Command ‘javac’ not found, but can be installed with”, this means you need to install Java Development Kit.

![Check if Java compiler is already installed or not][2]

The simplest way to install JDK on Ubuntu is to go with the default offering from Ubuntu:

```
sudo apt install default-jdk
```

You’ll be asked to enter your account’s password. When you type the password, nothing is seen on the screen. That is normal. Just enter your password blindly. When asked, press the enter key or Y key.

![Installing JDK that also contains the Java compiler][3]

The above command should work for other Debian and Ubuntu based distributions like Linux Mint, elementary OS etc. For other distributions, use your distribution’s package manager. The package name could also be different.

Once installed, verify that javac is available now.

![Verify that Java compiler can be used now][4]

#### Step 2: Compile Java program in Linux

You need to have a Java program file for this reason. Let’s say you create a new Java program file named **HelloWorld.java** and it has the following content:

```
class HelloWorld{
    public static void main(String args[]){
     System.out.println("Hello World");
    }
}
```

You can [use Nano editor in terminal][5] or Gedit graphical text editor for writing your Java programs.

```
javac HelloWorld.java
```

If there is no error, the above command produces no output.

When you compile the Java program, it generates a .class file with the class name you used in your program. You have to run this class file.

#### Step 3: Run the Java class file

You do not need to specify the class extension here. Just the name of the class. And this time, you use the command java, not javac.

```
java HelloWorld
```

This will print Hello World on the screen for my program.

![Running java programs in the Linux terminal][6]

And that’s how you run a Java program in the Linux terminal.

This was the simplest of the example. The sample program had just one class. The Java compiler creates a class file for each class in your program. Things get complicated for bigger programs and projects.

This is why I advise [installing Eclipse on Ubuntu][7] for proper Java programming. It is easier to program in an IDE.

I hope you find this tutorial helpful. Questions or suggestions? The comment section is all yours.

--------------------------------------------------------------------------------

via: https://itsfoss.com/run-java-program-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://jdk.java.net/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/java-compiler-check-ubuntu.png?resize=800%2C328&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/install-jdk-ubuntu.png?resize=800%2C430&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/java-compiler-ubuntu.png?resize=798%2C226&ssl=1
[5]: https://itsfoss.com/nano-editor-guide/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/running-java-programs-in-Linux-terminal.png?resize=798%2C301&ssl=1
[7]: https://itsfoss.com/install-latest-eclipse-ubuntu/
