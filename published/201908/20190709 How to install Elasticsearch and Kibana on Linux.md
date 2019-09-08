[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11221-1.html)
[#]: subject: (How to install Elasticsearch and Kibana on Linux)
[#]: via: (https://opensource.com/article/19/7/install-elasticsearch-and-kibana-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何在 Linux 上安装 Elasticsearch 和 Kibana
======

> 获取我们关于安装两者的简化说明。

![5 pengiuns floating on iceburg][1]

如果你渴望学习基于开源 Lucene 库的著名开源搜索引擎 Elasticsearch，那么没有比在本地安装它更好的方法了。这个过程在 [Elasticsearch 网站][2]中有详细介绍，但如果你是初学者，官方说明就比必要的信息多得多。本文采用一种简化的方法。

### 添加 Elasticsearch 仓库

首先，将 Elasticsearch 仓库添加到你的系统，以便你可以根据需要安装它并接收更新。如何做取决于你的发行版。在基于 RPM 的系统上，例如 [Fedora][3]、[CentOS] [4]、[Red Hat Enterprise Linux（RHEL）][5] 或 [openSUSE][6]，（本文任何地方引用 Fedora 或 RHEL 的也适用于 CentOS 和 openSUSE）在 `/etc/yum.repos.d/` 中创建一个名为 `elasticsearch.repo` 的仓库描述文件：

```
$ cat << EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/oss-7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
```

在 Ubuntu 或 Debian 上，不要使用 `add-apt-repository` 工具。由于它自身默认的和 Elasticsearch 仓库提供的不匹配而导致错误。相反，设置这个：

```
$ echo "deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
```

在你从该仓库安装之前，导入 GPG 公钥，然后更新：

```
$ sudo apt-key adv --keyserver \
hkp://keyserver.ubuntu.com:80 \
--recv D27D666CD88E42B4
$ sudo apt update
```

此存储库仅包含 Elasticsearch 的开源功能，在 [Apache 许可证][7]下发布，没有提供订阅版本的额外功能。如果你需要仅限订阅的功能（这些功能是**并不**开源），那么 `baseurl` 必须设置为：

```
baseurl=https://artifacts.elastic.co/packages/7.x/yum
```

### 安装 Elasticsearch

你需要安装的软件包的名称取决于你使用的是开源版本还是订阅版本。本文使用开源版本，包名最后有 `-oss` 后缀。如果包名后没有 `-oss`，那么表示你请求的是仅限订阅版本。

如果你创建了订阅版本的仓库却尝试安装开源版本，那么就会收到“非指定”的错误。如果你创建了一个开源版本仓库却没有将 `-oss` 添加到包名后，那么你也会收到错误。

使用包管理器安装 Elasticsearch。例如，在 Fedora、CentOS 或 RHEL 上运行以下命令：

```
$ sudo dnf install elasticsearch-oss
```

在 Ubuntu 或 Debian 上，运行：

```
$ sudo apt install elasticsearch-oss
```

如果你在安装 Elasticsearch 时遇到错误，那么你可能安装的是错误的软件包。如果你想如本文这样使用开源包，那么请确保使用正确的 apt 仓库或在 Yum 配置正确的 `baseurl`。

### 启动并启用 Elasticsearch

安装 Elasticsearch 后，你必须启动并启用它：

```
$ sudo systemctl daemon-reload
$ sudo systemctl enable --now elasticsearch.service
```

要确认 Elasticsearch 在其默认端口 9200 上运行，请在 Web 浏览器中打开 `localhost:9200`。你可以使用 GUI 浏览器，也可以在终端中执行此操作：


```
$ curl localhost:9200
{

  "name" : "fedora30",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "OqSbb16NQB2M0ysynnX1hA",
  "version" : {
    "number" : "7.2.0",
    "build_flavor" : "oss",
    "build_type" : "rpm",
    "build_hash" : "508c38a",
    "build_date" : "2019-06-20T15:54:18.811730Z",
    "build_snapshot" : false,
    "lucene_version" : "8.0.0",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}
```

### 安装 Kibana

Kibana 是 Elasticsearch 数据可视化的图形界面。它包含在 Elasticsearch 仓库，因此你可以使用包管理器进行安装。与 Elasticsearch 本身一样，如果你使用的是 Elasticsearch 的开源版本，那么必须将 `-oss` 放到包名最后，订阅版本则不用（两者安装需要匹配）：


```
$ sudo dnf install kibana-oss
```

在 Ubuntu 或 Debian 上：

```
$ sudo apt install kibana-oss
```

Kibana 在端口 5601 上运行，因此打开图形化 Web 浏览器并进入 `localhost:5601` 来开始使用 Kibana，如下所示：

![Kibana running in Firefox.][8]

### 故障排除

如果在安装 Elasticsearch 时出现错误，请尝试手动安装 Java 环境。在 Fedora、CentOS 和 RHEL 上：

```
$ sudo dnf install java-openjdk-devel java-openjdk
```

在 Ubuntu 上：

```
$ sudo apt install default-jdk
```

如果所有其他方法都失败，请尝试直接从 Elasticsearch 服务器安装 Elasticsearch RPM：

```
$ wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-7.2.0-x86_64.rpm{,.sha512}
$ shasum -a 512 -c elasticsearch-oss-7.2.0-x86_64.rpm.sha512 && sudo rpm --install elasticsearch-oss-7.2.0-x86_64.rpm
```

在 Ubuntu 或 Debian 上，请使用 DEB 包。

如果你无法使用 Web 浏览器访问 Elasticsearch 或 Kibana，那么可能是你的防火墙阻止了这些端口。你可以通过调整防火墙设置来允许这些端口上的流量。例如，如果你运行的是 `firewalld`（Fedora 和 RHEL 上的默认防火墙，并且可以在 Debian 和 Ubuntu 上安装），那么你可以使用 `firewall-cmd`：

```
$ sudo firewall-cmd --add-port=9200/tcp --permanent
$ sudo firewall-cmd --add-port=5601/tcp --permanent
$ sudo firewall-cmd --reload
```

设置完成了，你可以关注我们接下来的 Elasticsearch 和 Kibana 安装文章。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/install-elasticsearch-and-kibana-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux31x_cc.png?itok=Pvim4U-B (5 pengiuns floating on iceburg)
[2]: https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html
[3]: https://getfedora.org
[4]: https://www.centos.org
[5]: https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[6]: https://www.opensuse.org
[7]: http://www.apache.org/licenses/
[8]: https://opensource.com/sites/default/files/uploads/kibana.jpg (Kibana running in Firefox.)
