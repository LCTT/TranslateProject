How to Install and Configure XWiki on Ubuntu 16.04
======

XWiki is a free and open source wiki software written in Java runs on a servlet container like Tomcat, JBoss etc. XWiki uses databases such as MySQL or PostgreSQL to store its information. XWiki allows us to store structured data and execute the server script within wiki interface. You can host multiple blogs and manage or view your files and folders using XWiki.

XWiki comes with lots of features, some of them are listed below:

  * Supports version control and ACL.
  * Allows you to search the full wiki using wildcards.
  * Easily export wiki pages to PDF, ODT, RTF, XML and HTML.
  * Content organization and content import.
  * Page editing using WYSIWYG editor.



### Requirements

  * A server running Ubuntu 16.04.
  * A non-root user with sudo privileges.



Before starting, you will need to update the Ubuntu repository to the latest version. You can do this using the following command:

```
sudo apt-get update -y
sudo apt-get upgrade -y
```

Once the repository is updated, restart the system to apply all the updates.

### Install Java

Xwiki is a Java-based application, so you will need to install Java 8 first. By default Java 8 is not available in the Ubuntu repository. You can install Java 8 by adding the webupd8team PPA repository to your system.

First, add the PPA by running the following command:

```
sudo add-apt-repository ppa:webupd8team/java
```

Next, update the repository with the following command:

```
sudo apt-get update -y
```

Once the repository is up to date, you can install Java 8 by running the following command:

```
sudo apt-get install oracle-java8-installer -y
```

After installing Java, you can check the version of Java with the following command:

```
java -version
```

You should see the following output:
```
Java version "1.8.0_91"
Java(TM) SE Runtime Environment (build 1.8.0_91-b14)
Java HotSpot(TM) 64-Bit Server VM (build 25.91-b14, mixed mode)

```

### Download and Install Xwiki

Next, you will need to download the setup file provided by XWiki. You can download it using the following command:

```
wget <http://download.forge.ow2.org/xwiki/xwiki-enterprise-installer-generic-8.1-standard.jar>
```

Once the download is completed, you can install the downloaded package file using the java command as shown below:

```
sudo java -jar xwiki-enterprise-installer-generic-8.1-standard.jar
```

You should see the following output:
```
28 Jan, 2018 6:57:37 PM INFO: Logging initialized at level 'INFO'
28 Jan, 2018 6:57:37 PM INFO: Commandline arguments:
28 Jan, 2018 6:57:37 PM INFO: Detected platform: ubuntu_linux,version=3.19.0-25-generic,arch=x64,symbolicName=null,javaVersion=1.7.0_151
28 Jan, 2018 6:57:37 PM WARNING: Failed to determine hostname and IP address
Welcome to the installation of XWiki Enterprise 8.1!
The homepage is at: http://xwiki.org/

Press 1 to continue, 2 to quit, 3 to redisplay

```

Now, press **`1`** to continue the installation, you should see the following output:
```
Please read the following information:

 XWiki Enterprise - Readme


 XWiki Enterprise Overview
XWiki Enterprise is a second generation Wiki engine, features professional features like
 Wiki, Blog, Comments, User Rights, LDAP Authentication, PDF Export, and a lot more.
XWiki Enterprise also includes an advanced form and scripting engine which makes it an ideal
 development environment for constructing data-based intranet applications. It has powerful
 extensibility features, supports scripting, extensions and is based on a highly modular
 architecture. The scripting engine allows to access a powerful API for accessing the XWiki
 repository in read and write mode.
XWiki Enterprise is used by major companies around the world and has strong
 Support for a professional usage of XWiki.
 Pointers
Here are some pointers to get you started with XWiki once you have finished installing it:

The documentation can be found on the XWiki.org web site
If you notice any issue please file a an issue in our issue tracker
If you wish to talk to XWiki users or developers please use our
 Mailing lists & Forum
You can also access XWiki's
 source code
If you need commercial support please visit the
 Support page



Press 1 to continue, 2 to quit, 3 to redisplay

```

Now, press **`1`** to continue the installation, you should see the following output:
```
See the NOTICE file distributed with this work for additional
information regarding copyright ownership.
This is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation; either version 2.1 of
the License, or (at your option) any later version.
This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.
You should have received a copy of the GNU Lesser General Public
License along with this software; if not, write to the Free
Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
02110-1301 USA, or see the FSF site: http://www.fsf.org.

Press 1 to accept, 2 to reject, 3 to redisplay

```

Now, press **`1`** to accept the license agreement, you should see the following output:
```
Select the installation path: [/usr/local/XWiki Enterprise 8.1]

Press 1 to continue, 2 to quit, 3 to redisplay

```

Now, press enter and press **1** to select default installation path, you should see the following output:
```
 [x] Pack 'Core' required
????????????????????????????????????????????????????????????????????????????????
 [x] Include optional pack 'Default Wiki'
????????????????????????????????????????????????????????????????????????????????
Enter Y for Yes, N for No:
Y
Press 1 to continue, 2 to quit, 3 to redisplay

```

Now, press **`Y`** and press **`1`** to continue the installation, you should see the following output:
```
[ Starting to unpack ]
[ Processing package: Core (1/2) ]
[ Processing package: Default Wiki (2/2) ]
[ Unpacking finished ]

```

Now, you will be asked to create shortcuts for the user, you can press ' **`Y'`** to add them. Next, you will be asked to generate an automatic installation script, just press Enter to select default value, once the installation is finished, you should see the following output:
```
????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
Generate an automatic installation script
????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
Enter Y for Yes, N for No:
Y
Select the installation script (path must be absolute)[/usr/local/XWiki Enterprise 8.1/auto-install.xml]

Installation was successful
application installed on /usr/local/XWiki Enterprise 8.1
[ Writing the uninstaller data ... ]
[ Console installation done ]

```

Now, XWiki is installed on your system, it's time to start XWiki startup script as shown below:

```
cd /usr/local/XWiki Enterprise 8.1
sudo bash start_xwiki.sh
```

Please, wait for sometime to start processes. Now, you should see some messages on terminal as shown below:
```
start_xwiki.sh: 79: start_xwiki.sh:
Starting Jetty on port 8080, please wait...
2018-01-28 19:12:41.842:INFO::main: Logging initialized @1266ms
2018-01-28 19:12:42.905:INFO:oejs.Server:main: jetty-9.2.13.v20150730
2018-01-28 19:12:42.956:INFO:oejs.AbstractNCSARequestLog:main: Opened /usr/local/XWiki Enterprise 8.1/data/logs/2018_01_28.request.log
2018-01-28 19:12:42.965:INFO:oejdp.ScanningAppProvider:main: Deployment monitor [file:/usr/local/XWiki%20Enterprise%208.1/jetty/contexts/] at interval 0
2018-01-28 19:13:31,485 [main] INFO o.x.s.s.i.EmbeddedSolrInstance - Starting embedded Solr server...
2018-01-28 19:13:31,507 [main] INFO o.x.s.s.i.EmbeddedSolrInstance - Using Solr home directory: [data/solr]
2018-01-28 19:13:43,371 [main] INFO o.x.s.s.i.EmbeddedSolrInstance - Started embedded Solr server.
2018-01-28 19:13:46.556:INFO:oejsh.ContextHandler:main: Started [email protected]{/xwiki,file:/usr/local/XWiki%20Enterprise%208.1/webapps/xwiki/,AVAILABLE}{/xwiki}
2018-01-28 19:13:46.697:INFO:oejsh.ContextHandler:main: Started [email protected]{/,file:/usr/local/XWiki%20Enterprise%208.1/webapps/root/,AVAILABLE}{/root}
2018-01-28 19:13:46.776:INFO:oejs.ServerConnector:main: Started [email protected]{HTTP/1.1}{0.0.0.0:8080}

```

XWiki is now up and running, it's time to access XWiki web interface.

### Access XWiki

XWiki runs on port **8080** , so you will need to allow port 8080 through the firewall. First, enable the UFW firewall with the following command:

```
sudo ufw enable
```

Next, allow port **8080** through the UFW firewall with the following command:

```
sudo ufw allow 8080/tcp
```

Next, reload the firewall rules to apply all the changes by running the following command:

```
sudo ufw reload
```

You can get the status of the UFW firewall with the following command:

```
sudo ufw status
```

Now, open your web browser and type the URL **<http://your-server-ip:8080>** , you will be redirected to the XWiki home page as shown below:

[![XWiki Dashboard][1]][2]

You can stop the XWiki server at any time by pressing **`Ctrl + C`** button in the terminal.

### Conclusion

Congratulations! you have successfully installed and configured XWiki on Ubuntu 16.04 server. I hope you can now easily host your own wiki site using XWiki on Ubuntu 16.04 server. For more information, you can check the XWiki official documentation page at <https://www.xwiki.org/xwiki/bin/view/Documentation/>. Feel free to comments me if you have any questions.


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-and-configure-xwiki-on-ubuntu-1604/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/how_to_install_and_configure_xwiki_on_ubuntu_1604/Screenshot-of-xwiki-dashboard.png
[2]:https://www.howtoforge.com/images/how_to_install_and_configure_xwiki_on_ubuntu_1604/big/Screenshot-of-xwiki-dashboard.png
