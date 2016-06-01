如何在 Ubuntu 14/15 上配置 Apache Solr
================================================================================

大家好，欢迎来阅读我们今天这篇 Apache Solr 的文章。简单的来说，Apache Solr 是一个最负盛名的开源搜索平台，配合运行在网站后端的 Apache Lucene，能够让你轻松创建搜索引擎来搜索网站、数据库和文件。它能够索引和搜索多个网站并根据搜索文本的相关内容返回搜索建议。

Solr 使用 HTTP 可扩展标记语言（XML），可以为 JSON、Python 和 Ruby 等提供应用程序接口(API)。根据Apache Lucene 项目所述，Solr 提供了非常多的功能，很受管理员们的欢迎：

- 全文检索
- 分面导航（Faceted Navigation）
- 拼写建议/自动完成
- 自定义文档排序/排列

#### 前提条件: ####

在一个使用最小化安装包的全新 Ubuntu 14/15 系统上，你仅仅需要少量的准备，就开始安装 Apache Solor.

### 1)System Update 系统更新###

使用一个具有 sudo 权限的非 root 用户登录你的 Ubuntu 服务器，在接下来的所有安装和使用 Solr 的步骤中都会使用它。

登录成功后，使用下面的命令，升级你的系统到最新的更新及补丁：

    $ sudo apt-get update

### 2) 安装 JRE###

要安装 Solr，首先需要安装 JRE(Java Runtime Environment)作为基础环境，因为 solr 和 tomcat 都是基于Java.所以，我们需要安装最新版的 Java 并配置 Java 本地环境.

要想安装最新版的 Java 8，我们需要通过以下命令安装 Python Software Properties 工具包

    $ sudo apt-get install python-software-properties

完成后，配置最新版 Java 8的仓库

    $ sudo add-apt-repository ppa:webupd8team/java

现在你可以通过以下命令更新包源列表，使用‘apt-get’来安装最新版本的 Oracle Java 8。

    $ sudo apt-get update

    $ sudo apt-get install oracle-java8-installer

在安装和配置过程中，点击'OK'按钮接受 Java SE Platform 和 JavaFX 的 Oracle 二进制代码许可协议（Oracle Binary Code License Agreement）。

在安装完成后，运行下面的命令，检查是否安装成功以及查看安装的版本。

    kash@solr:~$ java -version
    java version "1.8.0_66"
    Java(TM) SE Runtime Environment (build 1.8.0_66-b17)
    Java HotSpot(TM) 64-Bit Server VM (build 25.66-b17, mixed mode)

执行结果表明我们已经成功安装了 Java，并达到安装 Solr 最基本的要求了，接着我们进行下一步。

### 安装 Solr###

有两种不同的方式可以在 Ubuntu 上安装 Solr，在本文中我们只用最新的源码包来演示源码安装。

要使用源码安装 Solr，先要从[官网][1]下载最新的可用安装包。复制以下链接，然后使用 'wget' 命令来下载。

    $ wget http://www.us.apache.org/dist/lucene/solr/5.3.1/solr-5.3.1.tgz

运行下面的命令，将这个已归档的服务解压到 /bin 目录。

    $ tar -xzf solr-5.3.1.tgz solr-5.3.1/bin/install_solr_service.sh --strip-components=2

运行脚本来启动 Solr 服务，这将会先创建一个 solr 的用户，然后将 Solr 安装成服务。

    $ sudo bash ./install_solr_service.sh solr-5.3.1.tgz

![Solr 安装](http://blog.linoxide.com/wp-content/uploads/2015/11/12.png)

使用下面的命令来检查 Solr 服务的状态。

    $ service solr status

![Solr 状态](http://blog.linoxide.com/wp-content/uploads/2015/11/22.png)

### 创建 Solr 集合: ###

我们现在可以使用 Solr 用户添加多个集合。就像下图所示的那样，我们只需要在命令行中指定集合名称和指定其配置集就可以创建多个集合了。

    $ sudo su - solr -c "/opt/solr/bin/solr create -c myfirstcollection -n data_driven_schema_configs"

![创建集合](http://blog.linoxide.com/wp-content/uploads/2015/11/32.png)

我们已经成功的为我们的第一个集合创建了新核心实例目录，并可以将数据添加到里面。要查看库中的默认模式文件，可以在这里找到： '/opt/solr/server/solr/configsets/data_driven_schema_configs/conf' 。

### 使用 Solr Web###

可以使用默认的端口8983连接 Apache Solr。打开浏览器，输入 http://your\_server\_ip:8983/solr 或者 http://your-domain.com:8983/solr. 确保你的防火墙允许8983端口.

    http://172.25.10.171:8983/solr/

![Web访问Solr](http://blog.linoxide.com/wp-content/uploads/2015/11/42.png)

在 Solr 的 Web 控制台左侧菜单点击 'Core Admin' 按钮，你将会看见我们之前使用命令行方式创建的集合。你可以点击 'Add Core' 按钮来创建新的核心。

![添加核心](http://blog.linoxide.com/wp-content/uploads/2015/11/52.png)

就像下图中所示，你可以选择某个集合并指向文档来向里面添加内容或从文档中查询数据。如下显示的那样添加指定格式的数据。

    {
    "number": 1,
    "Name": "George Washington",
    "birth_year": 1989,
    "Starting_Job": 2002,
    "End_Job": "2009-04-30",
    "Qualification": "Graduation",
    "skills": "Linux and Virtualization"
    }

添加文件后点击 'Submit Document'按钮.

![添加文档](http://blog.linoxide.com/wp-content/uploads/2015/11/62.png)

### 总结###

在 Ubuntu 上安装成功后，你就可以使用 Solr Web 接口插入或查询数据。如果你想通过 Solr 来管理更多的数据和文件，可以创建更多的集合。希望你能喜欢这篇文章并且希望它能够帮到你。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/configure-apache-solr-ubuntu-14-15/

作者：[Kashif][a]
译者：[taichirain](https://github.com/taichirain)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:http://lucene.apache.org/solr/
