translating----geekpi

Linux FAQs with Answers--How to change default Java version on Linux
================================================================================
> **Question**: When I am trying to run a Java program on Linux, I am getting the following error. Looks like the Java program is compiled for a different Java version than the default Java program installed on my Linux. How can I switch the default Java version on Linux?
> 
> Exception in thread "main" java.lang.UnsupportedClassVersionError: com/xmodulo/hmon/gui/NetConf : Unsupported major.minor version 51.0

When a Java program is compiled, the build environment sets a "target" which is the oldest JRE version the program can support. If you run the Java program on a Linux system which does not meet the lowest JRE version requirement, you will encounter the following error while starting the program.

    Exception in thread "main" java.lang.UnsupportedClassVersionError: com/xmodulo/hmon/gui/NetConf : Unsupported major.minor version 51.0

For example, in this case the program is compiled for Java JRE 1.7 but the system only has Java JRE 1.6.

To solve this problem, you need to change the default Java version you are using to Java JRE 1.7 or higher (assuming that such JRE is already installed).

First, **check available Java versions** on your Linux system by using update-alternatives command:

    $ sudo update-alternatives --display java

![](https://c2.staticflickr.com/6/5663/22661333316_81fe1ab7da_c.jpg)

In this example, there are four different Java versions that are installed: OpenJDK JRE 1.6, Oracle Java JRE 1.6, OpenJDK JRE 1.7 and Oracle Java JRE 1.7. The default Java version is currently set to OpenJDK JRE 1.6.

If the necessary Java JRE is not installed, you can always install it using [these instructions][1].

Now that there are suitable candidates to change to, you can **switch the default Java version** among available Java JREs by running the following command:

    $ sudo update-alternatives --config java

When prompted, select the Java version you would like to use. In this example, we choose Oracle Java JRE 1.7.

![](https://c2.staticflickr.com/6/5651/22066181083_b9c4c5b676_c.jpg)

Now you can verify the default Java version as follows.

    $ java -version

![](https://c1.staticflickr.com/1/634/22499411280_1d702a4101_c.jpg)

Finally, if you defined JAVA_HOME environment variable somewhere, update the variable according to the newly set default Java version.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-default-java-version-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/install-java-runtime-linux.html
