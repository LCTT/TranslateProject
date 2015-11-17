Ricky-Gong is translating.

Linux FAQs with Answers--How to set JAVA_HOME environment variable automatically on Linux
================================================================================
> **Question**: I need to compile a Java program on my Linux box. For that I already installed JDK (Java Development Kit), and now I'm trying to set JAVA_HOME environment variable to point to the installed JDK. What is the recommended way to set JAVA_HOME environment variable on Linux?

Many Java programs or Java-based IDE environments require JAVA_HOME environment variable being set. This environment variable is supposed to point to the top directory where the Java development kit (JDK) or Java runtime environment (JRE) is installed. The JDK contains everything the JRE offers, but also provides additional binaries and libraries needed to compile Java programs (e.g., compilers, debugger, JavaDoc). While the JDK is needed to build Java applications, the JRE alone is sufficient to simply run already built Java programs.

When you are trying to set JAVA_HOME environment variable, the complication is that JAVA_HOME variable will change depending on (1) whether you installed JDK or JRE, (2) which version of JDK/JRE you installed, and (3) whether you installed Oracle JDK or Open JDK.

So whenever your build or run-time environment changes (e.g., upgrade to a newer JDK), you need to adjust JAVA_HOME accordingly, which is cumbersome.

The following export commands will allow you to set JAVA_HOME environment variable automatically regardless of these factors.

If you installed JRE:

    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))

If you installed JDK:

    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))

Place either of the above commands in ~/.bashrc (or /etc/profile) depending on you installed JDK or JRE, and it will set JAVA_HOME permanently.

Note that "readlink -f" command is used to get the canonical path since java or javac can be set up with multiple symlinks.

For example, if you installed Oracle JRE 7, the first export command will automatically set JAVA_HOME to:

    /usr/lib/jvm/java-7-oracle/jre

If you installed Open JDK version 8, the second export command will set JAVA_HOME to:

    /usr/lib/jvm/java-8-openjdk-amd64

![](https://c1.staticflickr.com/1/700/22961948071_c73a3261dd_c.jpg)

In short, these export commands will automatically update JAVA_HOME variable as you re-install/upgrade your JDK/JRE packages or [change default Java version][1]. No need to adjust JAVA_HOME manually.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/set-java_home-environment-variable-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/change-default-java-version-linux.html
