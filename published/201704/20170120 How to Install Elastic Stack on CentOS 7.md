如何在 CentOS 7 上安装 Elastic Stack
============================================================

**Elasticsearch** 是基于 Lucene 由 Java 开发的开源搜索引擎。它提供了一个分布式、多租户的全文搜索引擎（LCTT 译注：多租户是指多租户技术，是一种软件架构技术，用来探讨与实现如何在多用户的环境下共用相同的系统或程序组件，并且仍可确保各用户间数据的隔离性。），并带有 HTTP 仪表盘的 Web 界面（Kibana）。数据会被 Elasticsearch 查询、检索，并且使用 JSON 文档方案存储。Elasticsearch 是一个可扩展的搜索引擎，可用于搜索所有类型的文本文档，包括日志文件。Elasticsearch 是 Elastic Stack 的核心，Elastic Stack 也被称为 ELK Stack。

**Logstash** 是用于管理事件和日志的开源工具。它为数据收集提供实时传递途径。 Logstash 将收集您的日志数据，将数据转换为 JSON 文档，并将其存储在 Elasticsearch 中。

**Kibana** 是 Elasticsearch 的开源数据可视化工具。Kibana 提供了一个漂亮的仪表盘 Web 界面。 你可以用它来管理和可视化来自 Elasticsearch 的数据。 它不仅美丽，而且强大。

在本教程中，我将向您展示如何在 CentOS 7 服务器上安装和配置 Elastic Stack 以监视服务器日志。 然后，我将向您展示如何在操作系统为 CentOS 7 和 Ubuntu 16 的客户端上安装 “Elastic beats”。

**前提条件**

*   64 位的 CentOS 7，4 GB 内存 - elk 主控机
*   64 位的 CentOS 7 ，1 GB 内存 - 客户端 1
*   64 位的 Ubuntu 16 ，1 GB 内存 - 客户端 2

### 步骤 1 - 准备操作系统

在本教程中，我们将禁用 CentOS 7 服务器上的 SELinux。 编辑 SELinux 配置文件。

```
vim /etc/sysconfig/selinux
```

将 `SELINUX` 的值从 `enforcing` 改成 `disabled` 。

```
SELINUX=disabled
```

然后重启服务器：

```
reboot
```

再次登录服务器并检查 SELinux 状态。

```
getenforce
```

确保结果是 `disabled`。

### 步骤 2 - 安装 Java

部署 Elastic stack 依赖于Java，Elasticsearch 需要 Java 8 版本，推荐使用 Oracle JDK 1.8 。我将从官方的 Oracle rpm 包安装 Java 8。

使用 `wget` 命令下载 Java 8 的 JDK。

```
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http:%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u77-b02/jdk-8u77-linux-x64.rpm"
```

然后使用 `rpm` 命令安装：

```
rpm -ivh jdk-8u77-linux-x64.rpm
```

最后，检查 java JDK 版本，确保它正常工作。

```
java -version
```

您将看到服务器的 Java 版本。

### 步骤 3 - 安装和配置 Elasticsearch

在此步骤中，我们将安装和配置 Elasticsearch。 从 elastic.co 网站提供的 rpm 包安装 Elasticsearch，并将其配置运行在 localhost 上（以确保该程序安全，而且不能从外部访问）。

在安装 Elasticsearch 之前，将 elastic.co 的密钥添加到服务器。

```
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
```

接下来，使用 `wget` 下载 Elasticsearch 5.1，然后安装它。

```
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.1.1.rpm
rpm -ivh elasticsearch-5.1.1.rpm
```

Elasticsearch 已经安装好了。 现在进入配置目录编辑 `elasticsaerch.yml` 配置文件。

```
cd /etc/elasticsearch/
vim elasticsearch.yml
```

去掉第 40 行的注释，启用 Elasticsearch 的内存锁。这将禁用 Elasticsearch 的内存交换。

```
bootstrap.memory_lock: true
```

在 `Network` 块中，取消注释 `network.host` 和 `http.port` 行。

```
network.host: localhost
http.port: 9200
```

保存文件并退出编辑器。

现在编辑 `elasticsearch.service` 文件的内存锁配置。

```
vim /usr/lib/systemd/system/elasticsearch.service
```

去掉第 60 行的注释，确保该值为 `unlimited`。

```
MAX_LOCKED_MEMORY=unlimited
```

保存并退出。

Elasticsearch 配置到此结束。Elasticsearch 将在本机的 9200 端口运行，我们通过在 CentOS 服务器上启用 `mlockall` 来禁用内存交换。重新加载 systemd，将 Elasticsearch 置为开机启动，然后启动服务。

```
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch
```

等待 Eelasticsearch 启动成功，然后检查服务器上打开的端口，确保 9200 端口的状态是 `LISTEN`。

```
netstat -plntu
```

![Check elasticsearch running on port 9200] [10]

然后检查内存锁以确保启用 `mlockall`，并使用以下命令检查 Elasticsearch 是否正在运行。

```
curl -XGET 'localhost:9200/_nodes?filter_path=**.mlockall&pretty'
curl -XGET 'localhost:9200/?pretty'
```

会看到如下结果。

 ![Check memory lock elasticsearch and check status] [11]

### 步骤 4 - 安装和配置 Kibana 和 Nginx

在这一步，我们将在 Nginx Web 服务器上安装并配置 Kibana。 Kibana 监听在 localhost  上，而 Nginx 作为 Kibana 的反向代理。

用 `wget` 下载 Kibana 5.1，然后使用 `rpm` 命令安装：

```
wget https://artifacts.elastic.co/downloads/kibana/kibana-5.1.1-x86_64.rpm
rpm -ivh kibana-5.1.1-x86_64.rpm
```

编辑 Kibana 配置文件。

```
vim /etc/kibana/kibana.yml
```

去掉配置文件中 `server.port`、`server.host` 和 `elasticsearch.url` 这三行的注释。

```
server.port: 5601
server.host: "localhost"
elasticsearch.url: "http://localhost:9200"
```

保存并退出。

将 Kibana 设为开机启动，并且启动 Kibana 。

```
sudo systemctl enable kibana
sudo systemctl start kibana
```

Kibana 将作为 node 应用程序运行在端口 5601 上。

```
netstat -plntu
```

![Kibana running as node application on port 5601] [12]

Kibana 安装到此结束。 现在我们需要安装 Nginx 并将其配置为反向代理，以便能够从公共 IP 地址访问 Kibana。

Nginx 在 Epel 资源库中可以找到，用 `yum` 安装 epel-release。

```
yum -y install epel-release
```

然后安装 Nginx 和 httpd-tools 这两个包。

```
yum -y install nginx httpd-tools
```

httpd-tools 软件包包含 Web 服务器的工具，可以为 Kibana 添加 htpasswd 基础认证。

编辑 Nginx 配置文件并删除 `server {}` 块，这样我们可以添加一个新的虚拟主机配置。

```
cd /etc/nginx/
vim nginx.conf
```

删除 `server { }` 块。

 ![Remove Server Block on Nginx configuration] [13]

保存并退出。

现在我们需要在 `conf.d` 目录中创建一个新的虚拟主机配置文件。 用 `vim` 创建新文件 `kibana.conf`。

```
vim /etc/nginx/conf.d/kibana.conf
```

复制下面的配置。

```
server {
    listen 80;

    server_name elk-stack.co;

    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/.kibana-user;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

保存并退出。

然后使用 `htpasswd` 命令创建一个新的基本认证文件。

```
sudo htpasswd -c /etc/nginx/.kibana-user admin
“输入你的密码”
```

测试 Nginx 配置，确保没有错误。 然后设定 Nginx 开机启动并启动 Nginx。

```
nginx -t
systemctl enable nginx
systemctl start nginx
```

![Add nginx virtual host configuration for Kibana Application] [14]

### 步骤 5 - 安装和配置 Logstash

在此步骤中，我们将安装 Logstash，并将其配置为：从配置了 filebeat 的 logstash 客户端里集中化服务器的日志，然后过滤和转换 Syslog 数据，并将其移动到存储中心（Elasticsearch）中。

下载 Logstash 并使用 rpm 进行安装。

```
wget https://artifacts.elastic.co/downloads/logstash/logstash-5.1.1.rpm
rpm -ivh logstash-5.1.1.rpm
```

生成新的 SSL 证书文件，以便客户端可以识别 elastic 服务端。

进入 `tls` 目录并编辑 `openssl.cnf` 文件。

```
cd /etc/pki/tls
vim openssl.cnf
```

在 `[v3_ca]` 部分添加服务器标识。

```
[ v3_ca ]

# Server IP Address
subjectAltName = IP: 10.0.15.10
```

保存并退出。

使用 `openssl` 命令生成证书文件。

```
openssl req -config /etc/pki/tls/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout /etc/pki/tls/private/logstash-forwarder.key -out /etc/pki/tls/certs/logstash-forwarder.crt
```

证书文件可以在 `/etc/pki/tls/certs/` 和 `/etc/pki/tls/private/` 目录中找到。

接下来，我们会为 Logstash 创建新的配置文件。创建一个新的 `filebeat-input.conf` 文件来为 filebeat 配置日志源，然后创建一个 `syslog-filter.conf` 配置文件来处理 syslog，再创建一个 `output-elasticsearch.conf` 文件来定义输出日志数据到 Elasticsearch。

转到 logstash 配置目录，并在 `conf.d` 子目录中创建新的配置文件。

```
cd /etc/logstash/
vim conf.d/filebeat-input.conf
```

输入配置，粘贴以下配置：

```
input {
  beats {
    port => 5443
    ssl => true
    ssl_certificate => "/etc/pki/tls/certs/logstash-forwarder.crt"
    ssl_key => "/etc/pki/tls/private/logstash-forwarder.key"
  }
}
```

保存并退出。

创建 `syslog-filter.conf` 文件。

```
vim conf.d/syslog-filter.conf
```

粘贴以下配置：

```
filter {
  if [type] == "syslog" {
    grok {
      match => { "message" => "%{SYSLOGTIMESTAMP:syslog_timestamp} %{SYSLOGHOST:syslog_hostname} %{DATA:syslog_program}(?:\[%{POSINT:syslog_pid}\])?: %{GREEDYDATA:syslog_message}" }
      add_field => [ "received_at", "%{@timestamp}" ]
      add_field => [ "received_from", "%{host}" ]
    }
    date {
      match => [ "syslog_timestamp", "MMM  d HH:mm:ss", "MMM dd HH:mm:ss" ]
    }
  }
}
```

我们使用名为 `grok` 的过滤器插件来解析 syslog 文件。

保存并退出。

创建输出配置文件 `output-elasticsearch.conf`。

```
vim conf.d/output-elasticsearch.conf
```

粘贴以下配置：

```
output {
  elasticsearch { hosts => ["localhost:9200"]
    hosts => "localhost:9200"
    manage_template => false
    index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
    document_type => "%{[@metadata][type]}"
  }
}
```

保存并退出。

最后，将 logstash 设定为开机启动并且启动服务。

```
sudo systemctl enable logstash
sudo systemctl start logstash
```

![Logstash started on port 5443 with SSL Connection] [15]

### 步骤 6 - 在 CentOS 客户端上安装并配置 Filebeat

Beat 作为数据发送人的角色，是一种可以安装在客户端节点上的轻量级代理，将大量数据从客户机发送到 Logstash 或 Elasticsearch 服务器。有 4  种 beat，`Filebeat` 用于发送“日志文件”，`Metricbeat` 用于发送“指标”，`Packetbeat`  用于发送“网络数据”，`Winlogbeat` 用于发送 Windows 客户端的“事件日志”。

在本教程中，我将向您展示如何安装和配置 `Filebeat`，通过 SSL 连接将数据日志文件传输到 Logstash 服务器。

登录到客户端1的服务器上。 然后将证书文件从 elastic 服务器复制到客户端1的服务器上。

```
ssh root@client1IP
```

使用 `scp` 命令拷贝证书文件。

```
scp root@elk-serverIP:~/logstash-forwarder.crt .
输入 elk-server 的密码
```

创建一个新的目录，将证书移动到这个目录中。

```
sudo mkdir -p /etc/pki/tls/certs/
mv ~/logstash-forwarder.crt /etc/pki/tls/certs/
```

接下来，在客户端 1 服务器上导入 elastic 密钥。

```
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
```

下载 Filebeat 并且用 `rpm` 命令安装。

```
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.1.1-x86_64.rpm
rpm -ivh filebeat-5.1.1-x86_64.rpm
```

Filebeat 已经安装好了，请转到配置目录并编辑 `filebeat.yml` 文件。

```
cd /etc/filebeat/
vim filebeat.yml
```

在第 21 行的路径部分，添加新的日志文件。 我们将创建两个文件，记录 ssh 活动的 `/var/log/secure` 文件 ，以及服务器日志 `/var/log/messages` 。

```
  paths:
    - /var/log/secure
    - /var/log/messages
```

在第 26 行添加一个新配置来定义 syslog 类型的文件。

```
  document-type: syslog
```

Filebeat 默认使用 Elasticsearch 作为输出目标。 在本教程中，我们将其更改为 Logshtash。 在 83 行和 85 行添加注释来禁用 Elasticsearch 输出。

禁用 Elasticsearch 输出：

```
#-------------------------- Elasticsearch output ------------------------------
#output.elasticsearch:
  # Array of hosts to connect to.
#  hosts: ["localhost:9200"]
```

现在添加新的 logstash 输出配置。 去掉 logstash 输出配置的注释，并将所有值更改为下面配置中的值。

```
output.logstash:
  # The Logstash hosts
  hosts: ["10.0.15.10:5443"]
  bulk_max_size: 1024
  ssl.certificate_authorities: ["/etc/pki/tls/certs/logstash-forwarder.crt"]
  template.name: "filebeat"
  template.path: "filebeat.template.json"
  template.overwrite: false
```

保存文件并退出 vim。

将 Filebeat 设定为开机启动并启动。

```
sudo systemctl enable filebeat
sudo systemctl start filebeat
```

### 步骤 7 - 在 Ubuntu 客户端上安装并配置 Filebeat

使用 `ssh` 连接到服务器。

```
ssh root@ubuntu-clientIP
```

使用 `scp` 命令拷贝证书文件。

```
scp root@elk-serverIP:~/logstash-forwarder.crt .
```

创建一个新的目录，将证书移动到这个目录中。

```
sudo mkdir -p /etc/pki/tls/certs/
mv ~/logstash-forwarder.crt /etc/pki/tls/certs/
```

在服务器上导入 elastic 密钥。

```
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
```

下载 Filebeat .deb 包并且使用 `dpkg` 命令进行安装。

```
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.1.1-amd64.deb
dpkg -i filebeat-5.1.1-amd64.deb
```

转到配置目录并编辑 `filebeat.yml` 文件。

```
cd /etc/filebeat/
vim filebeat.yml
```

在路径配置部分添加新的日志文件路径。

```
  paths:
    - /var/log/auth.log
    - /var/log/syslog
```

设定文档类型为 `syslog` 。

```
  document-type: syslog
```

将下列几行注释掉，禁用输出到 Elasticsearch。

```
#-------------------------- Elasticsearch output ------------------------------
#output.elasticsearch:
  # Array of hosts to connect to.
#  hosts: ["localhost:9200"]
```

启用 logstash 输出，去掉以下配置的注释并且按照如下所示更改值。

```
output.logstash:
  # The Logstash hosts
  hosts: ["10.0.15.10:5443"]
  bulk_max_size: 1024
  ssl.certificate_authorities: ["/etc/pki/tls/certs/logstash-forwarder.crt"]
  template.name: "filebeat"
  template.path: "filebeat.template.json"
  template.overwrite: false
```

保存并退出 vim。

将 Filebeat 设定为开机启动并启动。

```
sudo systemctl enable filebeat
sudo systemctl start filebeat
```

检查服务状态：

```
systemctl status filebeat
```

![Filebeat is running on the client Ubuntu] [16]

### 步骤 8 - 测试

打开您的网络浏览器，并访问您在 Nginx 中配置的 elastic stack 域名，我的是“elk-stack.co”。 使用管理员密码登录，然后按 Enter 键登录 Kibana 仪表盘。

![Login to the Kibana Dashboard with Basic Auth] [17]

创建一个新的默认索引 `filebeat-*`，然后点击“创建”按钮。

![Create First index filebeat for Kibana] [18]

默认索引已创建。 如果 elastic stack 上有多个 beat，您可以在“星形”按钮上点击一下即可配置默认 beat。 

![Filebeat index as default index on Kibana Dashboard] [19]

转到 “发现” 菜单，您就可以看到 elk-client1 和 elk-client2 服务器上的所有日志文件。

![Discover all Log Files from the Servers] [20]

来自 elk-client1 服务器日志中的无效 ssh  登录的 JSON 输出示例。

![JSON output for Failed SSH Login] [21]

使用其他的选项，你可以使用 Kibana 仪表盘做更多的事情。

Elastic Stack 已安装在 CentOS 7 服务器上。 Filebeat 已安装在 CentOS 7 和 Ubuntu 客户端上。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/

作者：[Muhammad Arul][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/
[1]: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/#step-nbspprepare-the-operating-system
[2]: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/#step-install-java
[3]: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/#step-install-and-configure-elasticsearch
[4]: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/#step-install-and-configure-kibana-with-nginx
[5]: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/#step-install-and-configure-logstash
[6]: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/#step-install-and-configure-filebeat-on-the-centos-client
[7]: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/#step-install-and-configure-filebeat-on-the-ubuntu-client
[8]: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/#step-testing
[9]: https://www.howtoforge.com/tutorial/how-to-install-elastic-stack-on-centos-7/#reference
[10]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/1.png
[11]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/2.png
[12]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/3.png
[13]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/4.png
[14]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/5.png
[15]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/6.png
[16]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/12.png
[17]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/7.png
[18]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/8.png
[19]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/9.png
[20]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/10.png
[21]: https://www.howtoforge.com/images/how-to-install-elastic-stack-on-centos-7/big/11.png