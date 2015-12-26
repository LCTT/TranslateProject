taichirain 翻译中

如何在Ubuntu 14/15上配置Apache Solr
================================================================================
大家好,欢迎来阅读我们今天Apache Solr的文章.Apache Solr是一个运行在网站后台的目前最热门的一个搜索引擎，基于Apache Lucene，能让你很容易的创建搜索引擎，数据库，文件。它能够索引和搜索多个网站并根据搜索文本的相关内容返回搜索建议.


Solr工作在可扩展标记语言(XML),并可以为JSON、Python和Ruby提供应用程序接口(APIs)。根据Apache Lucene项目，Solr提供了非常多的功能，让它很受管理员们的欢迎：
- 全文检索
- 分面导航
- 拼写建议/自动完成
- 自定义文档排序/排列

#### 前提条件: ####
在一个使用Ubuntu 14/15最小化安装包的系统上，你仅仅需要少量的准备，就开始安装 Apache Solor.

### 1)System Update 系统更新###

在所有的安装步骤以及使用Solor过程中使用一个具有sudo权限的非root用户登录Ubuntu server。

登录成功后，使用下面的命令，升级你的系统到最新的更新及补丁

    $ sudo apt-get update

### 2) JRE Setup 安装JRE###
要安装Solr，首先需要安装JRE(Java Runtime Environment)作为基础环境，因为solr和tomcat都是基于Java.所以，我们需要安装最新版的Java和配置Java本地环境.

为了安装最新版的Java 8,我们需要安装Python Software Properties工具包

    $ sudo apt-get install python-software-properties

完成后，配置最新版Java 8的仓库

    $ sudo add-apt-repository ppa:webupd8team/java

使用下面的命令更新源,然后安装java，然后使用'wget'安装Oracle Jave 8的最新版本

    $ sudo apt-get update

----------

    $ sudo apt-get install oracle-java8-installer

在安装和配置Java SE Platform 和 JavaFX 过程中点击'OK'按钮接受 Oracle Binary Code License Agreement 协议.

在安装完成后，运行下面的命令，检查是否安装成功以及查看安装的版本

    kash@solr:~$ java -version
    java version "1.8.0_66"
    Java(TM) SE Runtime Environment (build 1.8.0_66-b17)
    Java HotSpot(TM) 64-Bit Server VM (build 25.66-b17, mixed mode)

执行结果表明我们已经成功的安装了Java,并达到安装Solr最基本的要求了

### 安装Solr###
有两种不同的方式可以在Ubuntu上安装Solr，在本文中我们只用最新的源码包来演示源码安装

要使用源码安装Solr，先要从官网 [Web Page][1] 下载最新的可用安装包。复制以下链接，然后使用 'wget'命令来下载。

    $ wget http://www.us.apache.org/dist/lucene/solr/5.3.1/solr-5.3.1.tgz

运行下面的命令，将已压缩的服务解压到 /bin目录

    $ tar -xzf solr-5.3.1.tgz solr-5.3.1/bin/install_solr_service.sh --strip-components=2

Then run the script to start Solr service that will creates a new 'solr' user and then installs solr as a service.
运行脚本来启动Solr服务:将会先创建一个solr的用户，然后将Solr安装成服务

    $ sudo bash ./install_solr_service.sh solr-5.3.1.tgz

![Solr 安装](http://blog.linoxide.com/wp-content/uploads/2015/11/12.png)

使用下面的命令来检查Solr服务的状态

    $ service solr status

![Solr 状态](http://blog.linoxide.com/wp-content/uploads/2015/11/22.png)

### 创建Solr集合: ###
我们现在可以使用Solr用户添加多个集合.就像下图所示的那样，我们仅仅只需要在命令行中指定集合名称和指定其配置集就可以创建多个集合了

    $ sudo su - solr -c "/opt/solr/bin/solr create -c myfirstcollection -n data_driven_schema_configs"

![创建集合](http://blog.linoxide.com/wp-content/uploads/2015/11/32.png)

我们已经成功的为我们的第一个集合创建了新的内核实例目录，并将数据添加到里面。
它的概要文件在 '/opt/solr/server/solr/configsets/data_driven_schema_configs/conf'

### Using Solr Web 使用Solr页面###
可以使用默认的端口8983连接Apache Solr.打开浏览器，输入 http://your_server_ip:8983/solr 或者 http://your-domain.com:8983/solr. 确保你的防火墙允许8983端口.

    http://172.25.10.171:8983/solr/

![Web访问Solr](http://blog.linoxide.com/wp-content/uploads/2015/11/42.png)

在Solr的Web控制台的左侧菜单点击'Core Admin'按钮，你将会看见我们之前使用CLI方式创建的集合。你可以点击'Add Core'按钮来创建新的内核

![添加核心](http://blog.linoxide.com/wp-content/uploads/2015/11/52.png)

就像下图中所示，你可以选择某个集合和指向文档向里面添加内容或从文档中查询数据。像方框中显示的那样添加指定格式的数据。

    {
    "number": 1,
    "Name": "George Washington",
    "birth_year": 1989,
    "Starting_Job": 2002,
    "End_Job": "2009-04-30",
    "Qualification": "Graduation",
    "skills": "Linux and Virtualization"
    }

添加文件后点击'Submit Document'按钮.

![添加文档](http://blog.linoxide.com/wp-content/uploads/2015/11/62.png)

### 结尾###
在Ubuntu上安装成功后，你就可以使用Solr WEB接口插入或查询数据。如果你想通过Solr来管理更多的数据和文件，可以创建更多的集合。希望你能喜欢这篇文章并且希望它能够帮到你。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/configure-apache-solr-ubuntu-14-15/

作者：[Kashif][a]
译者：[taichirain](https://github.com/taichirain)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:http://lucene.apache.org/solr/
