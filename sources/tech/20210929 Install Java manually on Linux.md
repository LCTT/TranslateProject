[#]: subject: "Install Java manually on Linux"
[#]: via: "https://opensource.com/article/21/9/install-java-manually-linux"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install Java manually on Linux
======
Manual installation provides the user with the highest level of control
over the Java runtime environment.
![Penguin driving a car with a yellow background][1]

It is easy to use your Linux distribution's package management tool to install the Java software packages. However, sometimes you need to do a manual installation of Java. This is of particular importance to administrators of Java-based application servers such as Tomcat or JBoss. Many open source and proprietary software products rely on these services.

### Developer or Runtime kit?

The Java Virtual Machine (JVM) is provided in two different forms: The Java Development Kit (JDK) or the Java Runtime Environment (JRE).

Software developers usually need the JDK. It contains the binaries necessary for compiling, running, and testing the source code. To deploy a pre-built Java application generally only requires the JRE. It doesn't include the compilers and other development tools. The JRE is typically installed in production environments due to increased security and space limitations.

### Get Java

You can download open source Java software from the internet. You can find downloads of OpenJDK tarballs at [Red Hat Developer][2], [Adoptium.net][3], or the [Zulu Community edition][4] from Azul.

### Install Java

Set up a directory to hold the Java files. I like to create one simply called `java` so I can download and extract the tarball in a dedicated directory.


```
`$ mkdir -p java/jdk`
```

Let's use the JDK in this example. Save the downloaded file to the `jdk` directory. Then change into that directory:


```
$ cd java/jdk
$ ls
OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
```

Extract the tarball. Note that `tar` will create a new directory:


```
$ tar xvzf OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
$ ls
jdk-11.0.12+7 OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
```

Confirm the version of the new JVM using the `-version` option:


```
$ cd jdk-11.0.12+7/bin
$ ./java -version
```

The version output of the JVM looks similar to this:


```
openjdk version "11.0.12" 2021-07-20
OpenJDK Runtime Environment Temurin-11.0.12+7 (build 11.0.12+7)
OpenJDK 64-Bit Server VM Temurin-11.0.12+7 (build 11.0.12+7, mixed mode)
```

#### Environment variables

To ensure that a given application works correctly, it needs to know exactly how to locate the JVM. Two main variables should be set: **JAVA_HOME** and **PATH**:


```
$ echo $JAVA_HOME
$ echo $PATH
```

These can be set in the user's `.bashrc` file. Make sure that the variables come after [any existing code that sets **PATH**][5]:


```
#Set the JAVA_HOME
export JAVA_HOME=~/java/jdk/jdk-11.0.12+7
#Add the JAVA_HOME to the PATH
export PATH="$JAVA_HOME/bin:$PATH"
```

### Manual install situations

Different situations require a manual installation of Java. Consider the following three scenarios.

One situation could be a requirement for a different, perhaps older, version of Java that is not available in your Linux distribution's software repositories.

Another example could be a security-driven decision that Java will not be installed on an operating system by default or at the "root level."

A third situation could be the need for several different versions of Java, usually because multiple instances of a J2EE web application are running on the same server. This OS sharing is less common today due to the increased usage of virtual machines and containers to isolate processes. However, the need to maintain varying container images continues to make the understanding of manual installation vital.

### Wrap up

I demonstrated how I like to install the Java runtime environment but feel free to make up a convention that works best for your needs. Ultimately, manual installation provides the user with the highest level of control over the Java runtime environment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/install-java-manually-linux

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc (Penguin driving a car with a yellow background)
[2]: https://developers.redhat.com/products/openjdk/download
[3]: https://adoptium.net/%20%22https://Adoptium.net%22
[4]: https://www.azul.com/downloads/zulu-community%20%22https://www.azul.com/downloads/zulu-community%22
[5]: https://opensource.com/article/17/6/set-path-linux
