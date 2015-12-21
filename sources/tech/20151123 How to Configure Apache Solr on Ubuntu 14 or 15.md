taichirain 翻译中

How to Configure Apache Solr on Ubuntu 14 / 15
如何在Ubuntu 14/15上配置Apache Solr
================================================================================
Hello and welcome to our today's article on Apache Solr. The brief description about Apache Solr is that it is an Open Source most famous search platform with Apache Lucene at the back end for Web sites that enables you to easily create search engines which searches websites, databases and files. It can index and search multiple sites and return recommendations for related contents based on the searched text.

Solr works with HTTP Extensible Markup Language (XML) that offers application program interfaces (APIs) for Javascript Object Notation, Python, and Ruby. According to the Apache Lucene Project, Solr offers capabilities that have made it popular with administrators including it many featuring like:

- 全文检索
- 分面导航
- Snippet generation/highting
- 拼写建议/自动完成
- Custom document ranking/ordering
- 自定义文档排序/排列

#### 前提条件: ####

On a fresh Linux Ubuntu 14/15 with minimal packages installed, you only have to take care of few prerequisites in order to install Apache Solr.
在一个以最小化安装包安装的linux Ubuntu 14/15的系统上，你仅仅需要少量的准备，就可以开始安装 Apache Solor.

### 1)System Update 系统更新###

Login to your Ubuntu server with a non-root sudo user that will be used to perform all the steps to install and use Solr.
在所有的安装步骤以及使用Solor过程中使用一个具有sudo权限的非root用户登录Ubuntu server

After successful login, issue the following command to update your system with latest updates and patches.
登录成功后，使用下面的命令，升级你的系统到最新的更新及补丁

    $ sudo apt-get update

### 2) JRE Setup 安装JRE###

The Solr setup needs Java Runtime Environment to be installed on the system as its basic requirement because solr and tomcat both are the Java based applications. So, we need to install and configure its home environment with latest Java.

To install the latest version on Oracle Java 8, we need to install Python Software Properties using the below command.

    $ sudo apt-get install python-software-properties

Upon completion, run the setup its the repository for the latest version of Java 8.

    $ sudo add-apt-repository ppa:webupd8team/java

Now you are able to install the latest version of Oracle Java 8 with 'wget' by issuing the below commands to update the packages source list and then to install Java.
使用下面的命令升级源列表,然后安装java，然后你就可以使用'wget'安装Oracle Jave 8的最新版本

    $ sudo apt-get update

----------

    $ sudo apt-get install oracle-java8-installer

Accept the Oracle Binary Code License Agreement for the Java SE Platform Products and JavaFX as you will be asked during the Java installation and configuration process by a click on the 'OK' button.
在安装和配置Java SE Platform 和 JavaFX 过程中点击'OK'按钮，接受 Oracle Binary Code License Agreement 协议.

When the installation process complete, run the below command to test the successful installation of Java and check its version.
在安装完成后，运行下面的命令，检查是否安装成功以及安装的版本

    kash@solr:~$ java -version
    java version "1.8.0_66"
    Java(TM) SE Runtime Environment (build 1.8.0_66-b17)
    Java HotSpot(TM) 64-Bit Server VM (build 25.66-b17, mixed mode)

The output indicates that we have successfully fulfilled the basic requirement of Solr by installing the Java. Now move to the next step to install Solr.
执行结果表明我们已经成功的安装了Java,并达到安装Solr最基本的要求了

### Installing Solr 安装Solr###

Installing Solr on Ubuntu can be done by using two different ways but in this article we prefer to install its latest package from the source.
有两种不同的方式可以在Ubuntu上安装Solr，在本文中，只会用最新的源码包来演示源码安装

To install Solr from its source, download its available package with latest version from there Official [Web Page][1], copy the link address and get it using 'wget' command.
要使用源码安装Solr，先要从官网 [Web Page][1] 下载最新的可用安装包。复制一下链接，然后使用 'wget'命令来下载。

    $ wget http://www.us.apache.org/dist/lucene/solr/5.3.1/solr-5.3.1.tgz

Run the command below to extract the archived service into '/bin' folder.
运行下面的命令，将归档服务解压到 /bin目录

    $ tar -xzf solr-5.3.1.tgz solr-5.3.1/bin/install_solr_service.sh --strip-components=2

Then run the script to start Solr service that will creates a new 'solr' user and then installs solr as a service.
运行脚本来启动Solr服务:将会先创建一个solr的用户，然后将Solr安装成服务

    $ sudo bash ./install_solr_service.sh solr-5.3.1.tgz

![Solr Installation](http://blog.linoxide.com/wp-content/uploads/2015/11/12.png)

To check the status of Solr service, you use the below command.
使用下面的命令来检查Solr服务的状态

    $ service solr status

![Solr Status](http://blog.linoxide.com/wp-content/uploads/2015/11/22.png)

### Creating Solr Collection: 创建Solr集合: ###

Now we can create multiple collections using Solr user. To do so just run the below command by mentioning the name of the collection you want to create and by specifying its configuration set as shown.

    $ sudo su - solr -c "/opt/solr/bin/solr create -c myfirstcollection -n data_driven_schema_configs"

![creating collection](http://blog.linoxide.com/wp-content/uploads/2015/11/32.png)

We have successfully created the new core instance directory for our our first collection where we can add new data in it. To view its default schema file in directory '/opt/solr/server/solr/configsets/data_driven_schema_configs/conf' .
我们已经成功的为我们的第一个集合创建了新的内核实例目录，并可以将数据添加到那里。
它的概要文件在 '/opt/solr/server/solr/configsets/data_driven_schema_configs/conf'

### Using Solr Web 使用Solr页面###

Apache Solr can be accessible on the default port of Solr that 8983. Open your favorite browser and navigate to http://your_server_ip:8983/solr or http://your-domain.com:8983/solr. Make sure that the port is allowed in your firewall.
Apache Solr可以使用默认的端口8983进入.打开浏览器，输入 http://your_server_ip:8983/solr 或者 http://your-domain.com:8983/solr. 确保你的防火墙允许8983端口.

    http://172.25.10.171:8983/solr/

![Solr Web Access](http://blog.linoxide.com/wp-content/uploads/2015/11/42.png)

From the Solr Web Console click on the 'Core Admin' button from the left bar, then you will see your first collection that we created earlier using CLI. While you can also create new cores by pointing on the 'Add Core' button.
在Solr的Web控制台的左侧菜单点击'Core Admin'按钮，你将会看见我们之前使用CLI方式创建的集合。你可以点击'Add Core'按钮来创建新的内核

![Adding Core](http://blog.linoxide.com/wp-content/uploads/2015/11/52.png)

You can also add the document and query from the document as shown in below image by selecting your particular collection and pointing the document. Add the data in the specified format as shown in the box.

    {
    "number": 1,
    "Name": "George Washington",
    "birth_year": 1989,
    "Starting_Job": 2002,
    "End_Job": "2009-04-30",
    "Qualification": "Graduation",
    "skills": "Linux and Virtualization"
    }

After adding the document click on the 'Submit Document' button.

![adding Document](http://blog.linoxide.com/wp-content/uploads/2015/11/62.png)

### Conclusion 总结###

You are now able to insert and query data using the Solr web interface after its successful installation on Ubuntu. Now add more collections and insert you own data and documents that you wish to put and manage through Solr. We hope you have got this article much helpful and enjoyed reading this.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/configure-apache-solr-ubuntu-14-15/

作者：[Kashif][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:http://lucene.apache.org/solr/
