Daily Ubuntu Tips – Manually Install Oracle Java JDK 8 In Ubuntu
================================================================================
This brief tutorial is going to show you how to manually install Oracle Java JDK 8, which was just recently released in Ubuntu. This method will show you how to download the package from its download page and install it in Ubuntu without using external PPAs or third party sources.

This method doesn’t depend on third-party repository. You download it directly from Oracle’s download page and install in Ubuntu.

JDK 8 is a major release and the latest which features a new language called Lambda Expressions “enables you to treat functionality as a method argument, or code as date”

Also released with this version are collection of classes in the new java.util.stream package that provide a Stream API to support functional-style operations.

For more about this release, please visit the release page @ [http://www.oracle.com/technetwork/java/javase/8-whats-new-2157071.html][1]

To get started with downloading and installing Java JDK8 in Ubuntu, visit the [download page][2] and get the latest version from there. You can to download the 32-bit or 64-bit version for you Ubuntu machine.

Here’s  [download page][3]

You must accept the license agreement before downloading.

When you download the file, choose to save it. By default Firefox saves it downloads in the **~/Downloads** folder in Ubuntu.

![oracle-jdk8-ubuntu ](http://www.liberiangeek.net/wp-content/uploads/2014/03/oraclejdk8ubuntu.png)

Next, open the terminal and run the commands below to extract the downloaded file.

    tar -xvf ~/Downloads/jdk-8-linux-x64.tar.gz

Then run the commands below to create a folder for Java JDK 8 files in the /usr/lib directory.

    sudo mkdir -p /usr/lib/jvm/jdk1.8.0/

Then run the commands below to move JDK content to the new folder.

    sudo mv jdk1.8.0/* /usr/lib/jvm/jdk1.8.0/

Next, run the commands below to begin configuring Java

    sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0/bin/java" 1

Then copy and paste the line below enable Javac module

    sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0/bin/javac" 1

Finally, copy and paste the commands below to complete the installation.

    sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.8.0/bin/javaws" 1

To verify if Java is fully installed, run the commands below to test it.

    java –version

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/03/daily-ubuntu-tips-manually-install-oracle-java-jdk-8-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.oracle.com/technetwork/java/javase/8-whats-new-2157071.html
[2]:http://www.oracle.com/technetwork/java/javase/downloads/index.html
[3]:http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html