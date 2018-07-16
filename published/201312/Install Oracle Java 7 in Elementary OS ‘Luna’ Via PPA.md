使用PPA在Elementary OS 'Luna'上安装Oracle Java 7
================================================================================

**问题**: 我该如何在 Elemetary OS Luna 上安装Oracle Java 7？

**回答**: 在 Elementary OS Luna 安装 Java 7 的步骤如下:
由于Elementary OS是基于Ubuntu，所以我们允许使用具有多种Java包的**WEPUD8 PPA**。

1. 打开终端。

2. 运行以下指令添加Java的PPA到你的软件仓:

    	$ sudo add-apt-repository ppa:webupd8team/java

    	You are about to add the following PPA to your system:
        Oracle Java (JDK) Installer (automatically downloads and installs Oracle JDK6 / JDK7 / JDK8). There are no actual Java files in this PPA. More info: http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
        Debian installation instructions: http://www.webupd8.org/2012/06/how-to-install-oracle-java-7-in-debian.html
        More info: https://launchpad.net/~webupd8team/+archive/java
        Press [ENTER] to continue or ctrl-c to cancel adding it

3. 按回车继续

    	gpg: keyring `/tmp/tmpB5WwDG/secring.gpg' created
    	gpg: keyring `/tmp/tmpB5WwDG/pubring.gpg' created
    	gpg: requesting key EEA14886 from hkp server keyserver.ubuntu.com
    	gpg: /tmp/tmpB5WwDG/trustdb.gpg: trustdb created
    	gpg: key EEA14886: public key "Launchpad VLC" imported
    	gpg: Total number processed: 1
    	gpg: imported: 1 (RSA: 1)
    	OK

4. 现在更新你的系统

    	$ sudo apt-get update

5. 运行以下命令安装Java 7:

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

6. 输入代表Yes的**Y**以及回车键继续安装。

7. 在安装过程中，你需要同意条款才能继续。选择**OK**。

	![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/JDK-ask1.png)

8. 然后选择**Yes**继续。

	![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/JDK-ask2.png)

9. 现在请等待安装包的下载与自动安装:

	![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/JDK-Downloading.png)

10. 安装完成。你可以在终端上查看Java版本:

    	$ java -version
    	java version "1.7.0_45"
    	Java(TM) SE Runtime Environment (build 1.7.0_45-b18)
    	Java HotSpot(TM) 64-Bit Server VM (build 24.45-b08, mixed mode)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-oracle-java-7-elementary-os-luna-via-ppa/

译者：[whatever1992](https://github.com/whatever1992) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
