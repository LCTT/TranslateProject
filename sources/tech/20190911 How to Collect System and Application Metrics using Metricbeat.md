[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Collect System and Application Metrics using Metricbeat)
[#]: via: (https://www.linuxtechi.com/collect-system-application-metrics-metricbeat/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Collect System and Application Metrics using Metricbeat
======

**Metricbeat** is a lightweight shipper (or agent) which is used to collect system’s metrics and application metrics and send them to Elastic Stack Server (i.e **Elasticsearch**). Here system’s metrics refers to CPU, Memory, Disk and Network Stats (IOPS) and application metrics means monitoring and collecting metrics of applications like **Apache**, **NGINX**, **Docker**, **Kubernetes** and **Redis** etc. For metricbeat to work first we must make sure that we have a healthy elastic stack setup up and running.  Please refer the below url to setup elastic stack:

**[How to Setup Multi Node Elastic Stack Cluster on RHEL 8 / CentOS 8][1]**

In this article we will demonstrate how install metricbeat on linux servers and then how metricbeat sends data to Elastic Stack Server (i.e Elasticsearch) and then we will verify from kiabana GUI whether metrics data is visible or not.

### Install Metricbeat on CentOS / RHEL Servers

On CentOS / RHEL Servers, metricbeat is installed using the following rpm command,

```
[root@linuxtechi ~]# rpm -ivh https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.3.1-x86_64.rpm
```

For Debian based systems, use below command to install metricbeat.

```
~]# curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.3.1-amd64.deb
~]# dpkg -i metricbeat-7.3.1-amd64.deb
```

Add the following lines in /etc/hosts file, as we will be using FQDN of Elasticsearch and Kibana in metricbeat config file and command,

**Note:** Change the IPs and Hostname as per  your setup

```
192.168.56.40             elasticsearch1.linuxtechi.local
192.168.56.50             elasticsearch2.linuxtechi.local
192.168.56.60             elasticsearch3.linuxtechi.local
192.168.56.10             kibana.linuxtechi.local
```

### Configure Metricbeat on Linux Server (CentOS / RHEL / Debian)

Whenever metricbeat rpm &amp; deb package is installed then its configuration file (**metricbeat.yml**) is created under “**/etc/metricbeat/**“. Let’s edit this configuration file and inform system to send system and application metrics data to Elasticsearch servers.

```
[root@linuxtechi ~]# vi /etc/metricbeat/metricbeat.yml

setup.kibana:
   host: "kibana.linuxtechi.local:5601"
output.elasticsearch:
    hosts: ["elasticsearch1.linuxtechi.local:9200","elasticsearch2.linuxtechi.local:9200","elasticsearch3.linuxtechi.local:9200"]
```

Save and exit the file

**Note:** Replace Elasticsearch and Kibana details that suits to your environment.

Run following metricbeat command so that metric dashboard become available in Kibana GUI.

```
[root@linuxtechi ~]# metricbeat setup -e -E output.elasticsearch.hosts=['elasticsearch1.linuxtechi.local:9200','elasticsearch2.linuxtechi.local:9200','elasticsearch3.linuxtechi.local:9200'] -E setup.kibana.host=kibana.linuxtechi.local:5601
```

Output of above command would be something like below:

![metricbeat-command-output-linuxserver][2]

Above output confirms that metrics dashboard is loaded successfully in Kibana GUI. Now via metricbeat it will send the metrics data to Elastic Stack server every 10 seconds.

Let’s start and enable metricbeat service using following commands,

```
[root@linuxtechi ~]# systemctl start metricbeat
[root@linuxtechi ~]# systemctl enable metricbeat
```

Now go to Kibana GUI and click on Dashboard from left side bar,

[![Kibana-GUI-Dashbaord-Option][2]][3]

In the next window we will see available metrics dashboards, search ‘**system**’ and then choose System Metrics Dashboard,

[![Choose-Metric-Dashbaord-Kibana][2]][4]

[![Metricbeat-System-Overview-ECS-Kibana][2]][5]

As we can see System’s metrics data is available on the dashboard, these metrics are collected based on entries mentioned in the file “**/etc/metricbeat/modules.d/system.yml**”

Let’s suppose we want to collect application’s metrics data as well then we have to first enable their respective modules, to enable Apache and MySQL metric module ,run the following command from client machine,

```
[root@linuxtechi ~]# metricbeat modules enable apache mysql
Enabled apache
Enabled mysql
[root@linuxtechi ~]#
```

Once we enable the modules, we can edit their yml file,

```
[root@linuxtechi ~]# vi /etc/metricbeat/modules.d/apache.yml
…
- module: apache
  period: 10s
  hosts: ["http://192.168.56.70"]
…
```

Change IP in host parameter that suits to your environment.

Similarly edit mysql yml file, Change mysql root credentials that suits to your environment

```
[root@linuxtechi ~]# vi /etc/metricbeat/modules.d/mysql.yml
………
- module: mysql
  metricsets:
    - status
    - galera_status
  period: 10s
hosts: ["root:root@linuxtechi(127.0.0.1:3306)/"]
………
```

After making the changes restart the metricbeat service,

```
[root@linuxtechi ~]# systemctl restart  metricbeat
```

Now Go to Kibana GUI and under Dashboard option, look for MySQL metrics,

[![Metricbeat-MySQL-Overview-ECS-Kibana][2]][6]

As we can see above, MySQL metrics data is visible, this confirms that we have successfully installed and configure metricbeat.

That’s all from tutorial, If these steps help you to setup metricbeat then please do share your feedback and comment.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/collect-system-application-metrics-metricbeat/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/setup-multinode-elastic-stack-cluster-rhel8-centos8/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Kibana-GUI-Dashbaord-Option.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-Metric-Dashbaord-Kibana.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Metricbeat-System-Overview-ECS-Kibana.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Metricbeat-MySQL-Overview-ECS-Kibana.jpg
