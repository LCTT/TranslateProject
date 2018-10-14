SDKMAN – A CLI Tool To Easily Manage Multiple Software Development Kits
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/sdkman-720x340.png)

Are you a developer who often install and test applications on different SDKs? I’ve got a good news for you! Say hello to **SDKMAN** , a CLI tool that helps you to easily manage multiple software development kits. It provides a convenient way to install, switch, list and remove candidates. Using SDKMAN, you can now manage parallel versions of multiple SDKs easily on any Unix-like operating system. It allows the developers to install Software Development Kits for the JVM such as Java, Groovy, Scala, Kotlin and Ceylon. Ant, Gradle, Grails, Maven, SBT, Spark, Spring Boot, Vert.x and many others are also supported. SDKMAN is free, light weight, open source and written in **Bash**.

### Installing SDKMAN

Installing SDKMAN is trivial. First, make sure you have installed **zip** and **unzip** applications. It is available in the default repositories of most Linux distributions. For instance, to install unzip on Debian-based systems, simply run:
```
$ sudo apt-get install zip unzip

```

Then, install SDKMAN using command:
```
$ curl -s "https://get.sdkman.io" | bash

```

It’s that simple. Once the installation is completed, run the following command:
```
$ source "$HOME/.sdkman/bin/sdkman-init.sh"

```

If you want to install it in a custom location of your choice other than **$HOME/.sdkman** , for example **/usr/local/** , do:
```
$ export SDKMAN_DIR="/usr/local/sdkman" && curl -s "https://get.sdkman.io" | bash

```

Make sure your user has full access rights to this folder.

Finally, check if the installation is succeeded using command:
```
$ sdk version
==== BROADCAST =================================================================
* 01/08/18: Kotlin 1.2.60 released on SDKMAN! #kotlin
* 31/07/18: Sbt 1.2.0 released on SDKMAN! #sbt
* 31/07/18: Infrastructor 0.2.1 released on SDKMAN! #infrastructor
================================================================================

SDKMAN 5.7.2+323

```

Congratulations! SDKMAN has been installed. Let us go ahead and see how to install and manage SDKs.

### Manage Multiple Software Development Kits

To view the list of available candidates(SDKs), run:
```
$ sdk list

```

Sample output would be:
```
================================================================================
Available Candidates
================================================================================
q-quit /-search down
j-down ?-search up
k-up h-help

--------------------------------------------------------------------------------
Ant (1.10.1) https://ant.apache.org/

Apache Ant is a Java library and command-line tool whose mission is to drive
processes described in build files as targets and extension points dependent
upon each other. The main known usage of Ant is the build of Java applications.
Ant supplies a number of built-in tasks allowing to compile, assemble, test and
run Java applications. Ant can also be used effectively to build non Java
applications, for instance C or C++ applications. More generally, Ant can be
used to pilot any type of process which can be described in terms of targets and
tasks.

: $ sdk install ant

```

As you can see, SDKMAN list one candidate at a time along with the description of the candidate and it’s official website and the installation command. Press ENTER key to list the next candidates.

To install a SDK, for example Java JDK, run:
```
$ sdk install java

```

Sample output:
```
Downloading: java 8.0.172-zulu

In progress...

######################################################################################## 100.0%

Repackaging Java 8.0.172-zulu...

Done repackaging...

Installing: java 8.0.172-zulu
Done installing!

Setting java 8.0.172-zulu as default.

```

If you have multiple SDKs, it will prompt if you want the currently installed version to be set as **default**. Answering **Yes** will set the currently installed version as default.

To install particular version of a SDK, do:
```
$ sdk install ant 1.10.1

```

If you already have local installation of a specific candidate, you can set it as local version like below.
```
$ sdk install groovy 3.0.0-SNAPSHOT /path/to/groovy-3.0.0-SNAPSHOT

```

To list a particular candidates versions:
```
$ sdk list ant

```

Sample output:
```
================================================================================
Available Ant Versions
================================================================================
> * 1.10.1
1.10.0
1.9.9
1.9.8
1.9.7

================================================================================
+ - local version
* - installed
> - currently in use
================================================================================

```

Like I already said, If you have installed multiple versions, SDKMAN will prompt you if you want the currently installed version to be set as **default**. You can answer Yes to set it as default. Also, you can do that later by using the following command:
```
$ sdk default ant 1.9.9

```

The above command will set Apache Ant version 1.9.9 as default.

You can choose which version of an installed candidate to use by using the following command:
```
$ sdk use ant 1.9.9

```

To check what is currently in use for a Candidate, for example Java, run:
```
$ sdk current java

Using java version 8.0.172-zulu

```

To check what is currently in use for all Candidates, for example Java, run:
```
$ sdk current

Using:

ant: 1.10.1
java: 8.0.172-zulu

```

To upgrade an outdated candidate, do:
```
$ sdk upgrade scala

```

You can also check what is outdated for all Candidates as well.
```
$ sdk upgrade

```

SDKMAN has offline mode feature that allows the SDKMAN to function when working offline. You can enable or disable the offline mode at any time by using the following commands:
```
$ sdk offline enable

$ sdk offline disable

```

To remove an installed SDK, run:
```
$ sdk uninstall ant 1.9.9

```

For more details, check the help section.
```
$ sdk help

Usage: sdk <command> [candidate] [version]
sdk offline <enable|disable>

commands:
install or i <candidate> [version]
uninstall or rm <candidate> <version>
list or ls [candidate]
use or u <candidate> [version]
default or d <candidate> [version]
current or c [candidate]
upgrade or ug [candidate]
version or v
broadcast or b
help or h
offline [enable|disable]
selfupdate [force]
update
flush <broadcast|archives|temp>

candidate : the SDK to install: groovy, scala, grails, gradle, kotlin, etc.
 use list command for comprehensive list of candidates
 eg: $ sdk list

version : where optional, defaults to latest stable if not provided
 eg: $ sdk install groovy

```

### Update SDKMAN

The following command installs a new version of SDKMAN if it is available.
```
$ sdk selfupdate

```

SDKMAN will also periodically check for any updates and let you know with instruction on how to update.
```
WARNING: SDKMAN is out-of-date and requires an update.

$ sdk update
Adding new candidates(s): scala

```

### Remove cache

It is recommended to clean the cache that contains the downloaded SDK binaries for time to time. To do so, simply run:
```
$ sdk flush archives

```

It is also good to clean temporary folder to save up some space:
```
$ sdk flush temp

```

### Uninstall SDKMAN

If you don’t need SDKMAN or don’t like it, remove as shown below.
```
$ tar zcvf ~/sdkman-backup_$(date +%F-%kh%M).tar.gz -C ~/ .sdkman
$ rm -rf ~/.sdkman

```

Finally, open your **.bashrc** , **.bash_profile** and/or **.profile** files and find and remove the following lines.
```
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sk/.sdkman"
[[ -s "/home/sk/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sk/.sdkman/bin/sdkman-init.sh"

```

If you use ZSH, remove the above line from the **.zshrc** file.

And, that’s all for today. I hope you find SDKMAN useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/sdkman-a-cli-tool-to-easily-manage-multiple-software-development-kits/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
