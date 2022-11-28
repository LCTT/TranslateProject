[#]: subject: (Get started with WildFly for Java web development)
[#]: via: (https://opensource.com/article/21/7/wildfly)
[#]: author: (Ranabir Chakraborty https://opensource.com/users/ranabir-chakraborty)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Get started with WildFly for Java web development
======
WildFly is a popular choice for developers who want to develop
enterprise-ready applications.
![Coding on a computer][1]

[WildFly][2] is a production-ready, cross-platform, flexible, lightweight, managed application runtime that provides all the necessary features to run a Java web application. It is also a Java EE 8 certified application server almost exclusively in Java, and it implements the [Jakarta EE][3], which was the Java Platform, Enterprise Edition (Java EE) specifications. Therefore you can run it on any operating system.

WildFly, formerly known as JBoss AS, is a fully implemented JEE container—application server, developed by JBoss, which became a part of Red Hat on June 5, 2006, and since then, WildFly became their product.

### **How to get started with WildFly?**

This Java middleware application server known as [WildFly][4] is a robust implementation of the Jakarta platform specification. The latest WildFly 24 architecture built on the Modular Service Container enables services on-demand when your application requires them.

#### **Prerequisites**

Before installing WildFly, there are a few prerequisites:

  * Check that you have a JDK on your machine—JDK 8 or higher recommended to start WildFly. You can use the open source JDK called [OpenJDK][5].
Once you install the JDK, set the JAVA_HOME environment variable.
  * Ensure you have Maven 3.6.0 or higher installed. You can download Maven from [here][6] and set the environment variables.
  * After loading both the variables, check the versions of JDK and Maven.




```
$ java -version
openjdk version “11.0.9” 2020-10-20 OpenJDK Runtime Environment AdoptOpenJDK (build 11.0.9+11)
OpenJDK 64-Bit Server VM AdoptOpenJDK (build 11.0.9+11, mixed mode)

[/code] [code]

$ mvn -version
Apache Maven 3.6.3 (cecedd343002696d0abb50b32b541b8a6ba2883f) Maven home: /usr/share/maven
Java version: 11.0.9, vendor: AdoptOpenJDK, runtime: /usr/lib64/adoptopenjdk
Default locale: en_US, platform encoding: UTF-8
OS name: “linux”, version: “5.9.1”, arch: “amd64”, family: “unix”
```

### Download and install WildFly

There are many ways you can install WildFly, including unzipping our traditional download zip, provisioning a custom installation using Galleon, or building a bootable jar. The official [installation guide][7] helps you identify the kind of WildFly installation that best fits your application’s deployment needs. In this article, we'll focus on the typical approach of installing the download zip.

You can download WildFly from [here][8]. The standard WildFly variant is the right choice for most users, but if you'd like a technical preview look at what's coming in the future, try out WildFly Preview. Once downloaded, extract the archive to a folder and install it on any operating system that supports the zip or tar formats.


```
`$ unzip wildfly-preview-24.0.0.Final.zip`
```

### Running WildFly

WildFly has two server modes—_standalone_ and _domain_. The difference between the two modes is not about the capabilities available but about the application server's management. Use the _standalone_ mode when you only need one instance of the server. On the other hand, use the _domain_ mode when you want to run several instances of WildFly, and you want a single point from where you can control the configuration. You can find more about the domain mode in the [documentation][9].

To start WildFly using the default configuration in _standalone_ mode, change the directory to `$JBOSS_HOME/bin` and issue:


```
`$ ./standalone.sh`
```

To start the application server using the default configuration in _domain_ mode, change the directory to `$JBOSS_HOME/bin` and issue:


```
`$ ./domain.sh`
```

After starting the standalone mode, you should find something like the following in your console at the end of the start-up process:


```
00:46:04,500 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0025: WildFly Preview 24.0.0.Final (WildFly Core 16.0.0.Final) started in 4080ms - Started 437 of 638 services (350 services are lazy, passive or on-demand)
00:46:04,502 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0060: Http management interface listening on <http://127.0.0.1:9990/management>
00:46:04,502 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0051: Admin console listening on <http://127.0.0.1:9990>
```

You can point your browser to `http://localhost:9990` (if using the default configured HTTP port), bringing you to the WildFly welcome page.

![WildFly welcome page][10]

(Ranabir Chakraborty, [CC-BY SA 4.0][11])

#### **Authentication**

Though now you can see that WildFly is running, you can not access the admin console because you need to add a user for that. By default, security comes enabled for the WildFly management interfaces. That means that before you connect using the administration console or remotely using the CLI, you'll need to add a new user. You can achieve that simply by using the `add-user.sh` or the `add-user.bat` script in the bin folder.

After starting the script, the system guides you through the process of adding a new user.


```
$ ./add-user.sh
What type of user do you wish to add?
a) Management User (mgmt.users.properties)
b) Application User (application-users.properties)
(a):
```

Select the default option "a" to add a management user, where the user gets added to the ManagementRealm. Therefore, the user is authorized to perform management operations using the web-based Admin Console or the CLI. The other option is "b," where the user gets added to the ApplicationRealm. This realm provides for use with applications.


```
Enter the details of the new user to add.
Using realm ‘ManagementRealm’ as discovered from the existing property files.
Username : Ranabir
Password recommendations are listed below. To modify these restrictions, edit the add-user.properties configuration file.
[…]
Passward :
Re-enter Password :
```

Here you choose the management user option and provide the required username and password.


```
What groups do you want this user to belong to?
(Please enter a comma-separated list, or leave blank for none) [ ]:
```

Users can be associated with arbitrary groups of your choice, and you get prompted to consider assigning a new user to a group. Groups are helpful for simplified administration of things like access permissions, but leaving this blank is OK for getting started. You then confirm adding the user. The user gets written to the properties files used for authentication, and a confirmation message displays.


```
Is this new user going to be used for AS process to connect to another AS process?
e.g. for a slave host controller connecting to the master or for a Remoting connection for server to server Jakarta Enterprise Beans calls.
yes/no? no
```

Finally, you get asked whether or not you'll use the account you've added to identify one WildFly process to another—typically in a WildFly managed domain. The answer for this should be "no" because the account you are adding here is for use by a human administrator.

After successfully adding the user, now you can refresh the browser, and the console will look like the following:

![WildFly HAL Management console][12]

#### **Deploy an application**

WildFly provides many ways to deploy your application on the server. But if you are running a standalone WildFly service, a simple way to deploy your application is to copy your application archive (`war/ear/jar`) into the `$JBOSS_HOME/standalone/deployments` directory in the server installation. The deployment-scanner subsystem detects the archive and deploys it. Another straightforward way to perform the same is to go to the **Deployments** section of the console and upload your application archive.

![How to deploy your application from console][13]

You can make your own application and deploy it accordingly but here I have used a demo [helloworld][14] application from [WildFly quickstart][15].

#### **Steps to use WildFly quickstart samples:**

  1. Make a separate folder locally and inside that, clone the WildFly quickstart project. After cloning the repository, change the directory to `helloworld` (or you can play with any other sample projects) and build the maven project.




```
$ mkdir WFLY
$ cd WFLY
$ git clone –depth 1 [git@github.com][16]:wildfly/quickstart.git
$ cd quickstart/helloworld
$ mvn clean install
```

  2. If you face any project build issues, then you must clone the `boms` repository into your current working directory (WFLY in my example) and build it. After that, build the sample project. This step is only required when building a development version of the WildFly server. It isn’t required when running a [tagged][17] or [released][18] version of the WildFly server.




```
$ git clone [git@github.com][16]:wildfly/boms.git
$ cd boms
$ mvn clean install
```

  3. After successfully building the sample project, take the application archive `helloworld.war` from the target folder and copy it inside the `$JBOSS_HOME/standalone/deployments` directory in the server installation.




```
$ cd quickstart/helloworld/target/
$ cp helloworld.war …/…/…/wildfly-preview-24.0.0.Final/standalone/deployments/
```

  4. Now point your browser to `http://localhost:8080/helloworld/` to see your successfully deployed WildFly application.



### **Conclusions**

Despite WildFly being in the market for almost two decades, it's still a popular choice for developers who want to develop enterprise-ready applications. The code quality remains at a high and efficient level. The developers are continuously doing many unique and significant work that is taking WildFly to its new peak. The [latest WildFly][8] runs well on SE 16 and 17, supporting SE 17 in standard WildFly later this year.

Michael Dowden takes a look at four Java web frameworks built for scalability.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/wildfly

作者：[Ranabir Chakraborty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ranabir-chakraborty
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://www.wildfly.org/
[3]: https://opensource.com/article/18/5/jakarta-ee
[4]: https://github.com/wildfly/wildfly
[5]: http://openjdk.java.net/
[6]: https://maven.apache.org/download.cgi
[7]: https://docs.wildfly.org/24/Installation_Guide.html
[8]: https://www.wildfly.org/downloads/
[9]: https://docs.wildfly.org/24/Admin_Guide.html#Operating_modes
[10]: https://opensource.com/sites/default/files/pictures/welcome_page.png (WildFly welcome page)
[11]: https://creativecommons.org/licenses/by-sa/4.0/
[12]: https://opensource.com/sites/default/files/uploads/console.png (WildFly HAL Management console)
[13]: https://opensource.com/sites/default/files/uploads/deployment.png (How to deploy your application from console)
[14]: https://github.com/wildfly/quickstart/tree/master/helloworld
[15]: https://github.com/wildfly/quickstart
[16]: mailto:git@github.com
[17]: https://github.com/wildfly/quickstart/tags
[18]: https://github.com/wildfly/boms/releases
