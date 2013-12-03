(translating by whatever1992)
Install Oracle Java 7 in Elementary OS ‘Luna’ Via PPA
================================================================================
**Question**: How can I install Oracle Java 7 in Elemetary OS Luna?

**Answer**: To install Java 7 in Elementary OS Luna follow the steps below:

Since Elementary OS is Ubuntu based we are at liberty to use **WEPUD8 PPA** which has various Java packages in it.

1. Open Terminal.

2. Run the command below to add Java PPA to your repository:

    $ sudo add-apt-repository ppa:webupd8team/java

    You are about to add the following PPA to your system:
    Oracle Java (JDK) Installer (automatically downloads and installs Oracle JDK6 / JDK7 / JDK8). There are no actual Java files in this PPA. More info: http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
    Debian installation instructions: http://www.webupd8.org/2012/06/how-to-install-oracle-java-7-in-debian.html
    More info: https://launchpad.net/~webupd8team/+archive/java
    Press [ENTER] to continue or ctrl-c to cancel adding it

3. Press ENTER to continue

    gpg: keyring `/tmp/tmpB5WwDG/secring.gpg' created
    gpg: keyring `/tmp/tmpB5WwDG/pubring.gpg' created
    gpg: requesting key EEA14886 from hkp server keyserver.ubuntu.com
    gpg: /tmp/tmpB5WwDG/trustdb.gpg: trustdb created
    gpg: key EEA14886: public key "Launchpad VLC" imported
    gpg: Total number processed: 1
    gpg: imported: 1 (RSA: 1)
    OK

4. Now update your system

    $ sudo apt-get update

5. Install Java 7 by running the command below:

    $ sudo apt-get install oracle-java7-installer

    [sudo] password for enock:
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    The following packages were automatically installed and are no longer required:
    gir1.2-gstreamer-0.10 libilmbase6 libmagickcore4 libmagickwand4 libcdt4
    libmagickcore4-extra liblqr-1-0 imagemagick-common libpathplan4 libopenexr6
    rsync netpbm libgvc5 libnetpbm10 libgraph4
    Use 'apt-get autoremove' to remove them.
    The following extra packages will be installed:
    gsfonts-x11 java-common
    Suggested packages:
    default-jre equivs binfmt-support visualvm ttf-baekmuk ttf-unfonts
    ttf-unfonts-core ttf-kochi-gothic ttf-sazanami-gothic ttf-kochi-mincho
    ttf-sazanami-mincho ttf-arphic-uming
    The following NEW packages will be installed:
    gsfonts-x11 java-common oracle-java7-installer
    0 upgraded, 3 newly installed, 0 to remove and 196 not upgraded.
    Need to get 88.5 kB of archives.
    After this operation, 473 kB of additional disk space will be used.
    Do you want to continue [Y/n]?

6. Type **Y** for Yes and Press enter to continue installation.

7. During the installation, you need to agree to the license to continue. Select **OK**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/JDK-ask1.png)

8. Then Select **Yes** to continue.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/JDK-ask2.png)

9. Now relax for the packages to be downloaded and installed automatically:

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/JDK-Downloading.png)

7. Installation has been completed successfully. You can now check the version of Java from the Terminal:

    $ java -version
    java version "1.7.0_45"
    Java(TM) SE Runtime Environment (build 1.7.0_45-b18)
    Java HotSpot(TM) 64-Bit Server VM (build 24.45-b08, mixed mode)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-oracle-java-7-elementary-os-luna-via-ppa/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出