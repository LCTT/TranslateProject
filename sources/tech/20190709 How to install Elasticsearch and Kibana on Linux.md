[#]: collector: (lujun9972)
[#]: translator: (runningwater)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install Elasticsearch and Kibana on Linux)
[#]: via: (https://opensource.com/article/19/7/install-elasticsearch-and-kibana-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to install Elasticsearch and Kibana on Linux
======
Get our simplified instructions for installing both.
![5 pengiuns floating on iceburg][1]

If you're keen to learn Elasticsearch, the famous open source search engine based on the open source Lucene library, then there's no better way than to install it locally. The process is outlined in detail on the [Elasticsearch website][2], but the official instructions have a lot more detail than necessary if you're a beginner. This article takes a simplified approach.

### Add the Elasticsearch repository

First, add the Elasticsearch software repository to your system, so you can install it and receive updates as needed. How you do so depends on your distribution. On an RPM-based system, such as [Fedora][3], [CentOS][4], [Red Hat Enterprise Linux (RHEL)][5], or [openSUSE][6], (anywhere in this article that references Fedora or RHEL applies to CentOS and openSUSE as well) create a repository description file in **/etc/yum.repos.d/** called **elasticsearch.repo**:


```
$ cat &lt;&lt; EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=<https://artifacts.elastic.co/packages/oss-7.x/yum>
gpgcheck=1
gpgkey=<https://artifacts.elastic.co/GPG-KEY-elasticsearch>
enabled=1
autorefresh=1
type=rpm-md
EOF
```

On Ubuntu or Debian, do not use the **add-apt-repository** utility. It causes errors due to a mismatch in its defaults and what Elasticsearch’s repository provides. Instead, set up this one:


```
$ echo "deb <https://artifacts.elastic.co/packages/oss-7.x/apt> stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
```

This repository contains only Elasticsearch’s open source features, under an [Apache License][7], with none of the extra features provided by a subscription. If you need subscription-only features (these features are _not_ open source), the **baseurl** must be set to:


```
`baseurl=https://artifacts.elastic.co/packages/7.x/yum`
```

 

### Install Elasticsearch

The name of the package you need to install depends on whether you use the open source version or the subscription version. This article uses the open source version, which appends **-oss** to the end of the package name. Without **-oss** appended to the package name, you are requesting the subscription-only version.

If you create a repository pointing to the subscription version but try to install the open source version, you will get a fairly non-specific error in return. If you create a repository for the open source version and fail to append **-oss** to the package name, you will also get an error.

Install Elasticsearch with your package manager. For instance, on Fedora, CentOS, or RHEL, run the following:


```
$ sudo dnf install elasticsearch-oss
```

On Ubuntu or Debian, run:


```
$ sudo apt install elasticsearch-oss
```

If you get errors while installing Elasticsearch, then you may be attempting to install the wrong package. If your intention is to use the open source package, as this article does, then make sure you are using the correct **apt** repository or baseurl in your Yum configuration.

### Start and enable Elasticsearch

Once Elasticsearch has been installed, you must start and enable it:


```
$ sudo systemctl daemon-reload
$ sudo systemctl enable --now elasticsearch.service
```

Then, to confirm that Elasticsearch is running on its default port of 9200, point a web browser to **localhost:9200**. You can use a GUI browser or you can do it in the terminal:


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

### Install Kibana

Kibana is a graphical interface for Elasticsearch data visualization. It’s included in the Elasticsearch repository, so you can install it with your package manager. Just as with Elasticsearch itself, you must append **-oss** to the end of the package name if you are using the open source version of Elasticsearch, and not the subscription version (the two installations need to match):


```
$ sudo dnf install kibana-oss
```

On Ubuntu or Debian:


```
$ sudo apt install kibana-oss
```

Kibana runs on port 5601, so launch a graphical web browser and navigate to **localhost:5601** to start using the Kibana interface, which is shown below:

![Kibana running in Firefox.][8]

### Troubleshoot

If you get errors while installing Elasticsearch, try installing a Java environment manually. On Fedora, CentOS, and RHEL:


```
$ sudo dnf install java-openjdk-devel java-openjdk
```

On Ubuntu:


```
`$ sudo apt install default-jdk`
```

If all else fails, try installing the Elasticsearch RPM directly from the Elasticsearch servers:


```
$ wget <https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-7.2.0-x86\_64.rpm{,.sha512}>
$ shasum -a 512 -c elasticsearch-oss-7.2.0-x86_64.rpm.sha512 &amp;&amp; sudo rpm --install elasticsearch-oss-7.2.0-x86_64.rpm
```

On Ubuntu or Debian, use the DEB package instead.

If you cannot access either Elasticsearch or Kibana with a web browser, then your firewall may be blocking those ports. You can allow traffic on those ports by adjusting your firewall settings. For instance, if you are running **firewalld** (the default on Fedora and RHEL, and installable on Debian and Ubuntu), then you can use **firewall-cmd**:


```
$ sudo firewall-cmd --add-port=9200/tcp --permanent
$ sudo firewall-cmd --add-port=5601/tcp --permanent
$ sudo firewall-cmd --reload
```

You’re now set up and can follow along with our upcoming installation articles for Elasticsearch and Kibana.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/install-elasticsearch-and-kibana-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

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
