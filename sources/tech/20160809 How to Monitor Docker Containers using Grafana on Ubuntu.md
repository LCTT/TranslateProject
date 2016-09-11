Being translated by ChrisLeeGit
How to Monitor Docker Containers using Grafana on Ubuntu
================================================================================

Grafana is an open source feature rich metrics dashboard. It is very useful for visualizing large-scale measurement data. It provides a powerful and elegant way to create, share, and explore data and dashboards from your disparate metric databases.

It supports a wide variety of graphing options for ultimate flexibility. Furthermore, it supports many different storage backends for your Data Source. Each Data Source has a specific Query Editor that is customized for the features and capabilities that the particular Data Source exposes. The following datasources are officially supported by Grafana: Graphite, InfluxDB, OpenTSDB, Prometheus, Elasticsearch and Cloudwatch

The query language and capabilities of each Data Source are obviously very different. You can combine data from multiple Data Sources onto a single Dashboard, but each Panel is tied to a specific Data Source that belongs to a particular Organization. It supports authenticated login and a basic role based access control implementation. It is deployed as a single software installation which is written in Go and Javascript.

In this article, I'll explain on how to install Grafana on a docker container in Ubuntu 16.04 and configure docker monitoring using this software.

### Pre-requisites ###

- Docker installed server

### Installing Grafana ###

We can build our Grafana in a docker container. There is an official docker image available for building Grafana. Please run this command to build a Grafana container.

```
root@ubuntu:~# docker run -i -p 3000:3000 grafana/grafana

Unable to find image 'grafana/grafana:latest' locally
latest: Pulling from grafana/grafana
5c90d4a2d1a8: Pull complete
b1a9a0b6158e: Pull complete
acb23b0d58de: Pull complete
Digest: sha256:34ca2f9c7986cb2d115eea373083f7150a2b9b753210546d14477e2276074ae1
Status: Downloaded newer image for grafana/grafana:latest
t=2016-07-27T15:20:19+0000 lvl=info msg="Starting Grafana" logger=main version=3.1.0 commit=v3.1.0 compiled=2016-07-12T06:42:28+0000
t=2016-07-27T15:20:19+0000 lvl=info msg="Config loaded from" logger=settings file=/usr/share/grafana/conf/defaults.ini
t=2016-07-27T15:20:19+0000 lvl=info msg="Config loaded from" logger=settings file=/etc/grafana/grafana.ini
t=2016-07-27T15:20:19+0000 lvl=info msg="Config overriden from command line" logger=settings arg="default.paths.data=/var/lib/grafana"
t=2016-07-27T15:20:19+0000 lvl=info msg="Config overriden from command line" logger=settings arg="default.paths.logs=/var/log/grafana"
t=2016-07-27T15:20:19+0000 lvl=info msg="Config overriden from command line" logger=settings arg="default.paths.plugins=/var/lib/grafana/plugins"
t=2016-07-27T15:20:19+0000 lvl=info msg="Path Home" logger=settings path=/usr/share/grafana
t=2016-07-27T15:20:19+0000 lvl=info msg="Path Data" logger=settings path=/var/lib/grafana
t=2016-07-27T15:20:19+0000 lvl=info msg="Path Logs" logger=settings path=/var/log/grafana
t=2016-07-27T15:20:19+0000 lvl=info msg="Path Plugins" logger=settings path=/var/lib/grafana/plugins
t=2016-07-27T15:20:19+0000 lvl=info msg="Initializing DB" logger=sqlstore dbtype=sqlite3

t=2016-07-27T15:20:20+0000 lvl=info msg="Executing migration" logger=migrator id="create playlist table v2"
t=2016-07-27T15:20:20+0000 lvl=info msg="Executing migration" logger=migrator id="create playlist item table v2"
t=2016-07-27T15:20:20+0000 lvl=info msg="Executing migration" logger=migrator id="drop preferences table v2"
t=2016-07-27T15:20:20+0000 lvl=info msg="Executing migration" logger=migrator id="drop preferences table v3"
t=2016-07-27T15:20:20+0000 lvl=info msg="Executing migration" logger=migrator id="create preferences table v3"
t=2016-07-27T15:20:20+0000 lvl=info msg="Created default admin user: [admin]"
t=2016-07-27T15:20:20+0000 lvl=info msg="Starting plugin search" logger=plugins
t=2016-07-27T15:20:20+0000 lvl=info msg="Server Listening" logger=server address=0.0.0.0:3000 protocol=http subUrl=
```

We can confirm the working of the Grafana container by running this command `docker ps -a` or by accessing it by URL `http://Docker IP:3000`

All Grafana configuration settings are defined using environment variables, this is much useful when using container technology. The Grafana configuration file is located at /etc/grafana/grafana.ini.

### Understanding the Configuration ###

The Grafana has number of configuration options that can be specified in its configuration file as .ini file or  can be specified using environment variables as mentioned before.

#### Config file locations ####

Normal config file locations.

- Default configuration from : $WORKING_DIR/conf/defaults.ini
- Custom configuration from  : $WORKING_DIR/conf/custom.ini

PS :  When you install Grafana using the deb or rpm packages or docker images, then your configuration file is located at /etc/grafana/grafana.ini

#### Understanding the config variables ####

Let's see some of the variables in the configuration file below:

`instance_name` : It's the name of the grafana server instance. It default value is fetched from ${HOSTNAME}, which will be replaced with environment variable HOSTNAME, if that is empty or does not exist Grafana will try to use system calls to get the machine name.

`[paths]`

`data` : It's the path where Grafana stores the sqlite3 database (when used), file based sessions (when used), and other data.

`logs` : It's where Grafana stores the logs.

Both these paths are usually specified via command line in the init.d scripts or the systemd service file.

`[server]`

`http_addr` : The IP address to bind the application. If it's left empty it will bind to all interfaces.

`http_port` : The port to which the application is bind to, defaults is 3000. You can redirect your 80 port to 3000 using the below command.

```
$iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3000
```

`root_url` : This is the URL used to access Grafana from a web browser.

`cert_file` : Path to the certificate file (if protocol is set to https).

`cert_key` : Path to the certificate key file (if protocol is set to https).

`[database]`

Grafana uses a database to store its users and dashboards and other informations. By default it is configured to use sqlite3 which is an embedded database included in the main Grafana binary.

`type`
You can choose mysql, postgres or sqlite3 as per our requirement.

`path`
It's applicable only for sqlite3 database. The file path where the database will be stored.

`host`
It's applicable only to MySQL or Postgres. it includes IP or hostname and port. For example, for MySQL running on the same host as Grafana: host = 127.0.0.1:3306

`name`
The name of the Grafana database. Leave it set to grafana or some other name.

`user`
The database user (not applicable for sqlite3).

`password`
The database user's password (not applicable for sqlite3).

`ssl_mode`
For Postgres, use either disable, require or verify-full. For MySQL, use either true, false, or skip-verify.

`ca_cert_path`
(MySQL only) The path to the CA certificate to use. On many linux systems, certs can be found in /etc/ssl/certs.

`client_key_path`
(MySQL only) The path to the client key. Only if server requires client authentication.

`client_cert_path`
(MySQL only) The path to the client cert. Only if server requires client authentication.

`server_cert_name`
(MySQL only) The common name field of the certificate used by the mysql server. Not necessary if ssl_mode is set to skip-verify.

`[security]`

`admin_user` : It is the name of the default Grafana admin user. The default name set is admin.

`admin_password` : It is the password of the default Grafana admin. It is set on first-run. The default password is admin.

`login_remember_days` : The number of days the keep me logged in / remember me cookie lasts.

`secret_key` : It is used for signing keep me logged in / remember me cookies.

### Essentials components for setting up Monitoring ###

We use the below components  to create our Docker Monitoring system.

`cAdvisor` : It is otherwise called Container Advisor. It provides its users an understanding of the resource usage and performance characteristics. It collects, aggregates, processes and exports information about the running containers. You can go through this documentation for more information about this.

`InfluxDB` : It is a time series, metrics, and analytic database. We use this datasource for setting up our monitoring. cAdvisor  displays only real time information and doesn’t store the metrics. Influx Db helps to store the monitoring information which cAdvisor provides in order to display a time range other than real time.

`Grafana Dashboard` : It allows us to combine all the pieces of information together visually. This powerful Dashboard allows us to run queries against the data store InfluxDB and chart them accordingly in beautiful layout.

### Installation of Docker Monitoring ###

We need to install each of these components one by one in our docker system.

#### Installing InfluxDB ####

We can use this command to pull InfluxDB image and setuup a influxDB container.

```
root@ubuntu:~# docker run -d -p 8083:8083 -p 8086:8086 --expose 8090 --expose 8099 -e PRE_CREATE_DB=cadvisor --name influxsrv tutum/influxdb:0.8.8
Unable to find image 'tutum/influxdb:0.8.8' locally
0.8.8: Pulling from tutum/influxdb
a3ed95caeb02: Already exists
23efb549476f: Already exists
aa2f8df21433: Already exists
ef072d3c9b41: Already exists
c9f371853f28: Already exists
a248b0871c3c: Already exists
749db6d368d0: Already exists
7d7c7d923e63: Pull complete
e47cc7808961: Pull complete
1743b6eeb23f: Pull complete
Digest: sha256:8494b31289b4dbc1d5b444e344ab1dda3e18b07f80517c3f9aae7d18133c0c42
Status: Downloaded newer image for tutum/influxdb:0.8.8
d3b6f7789e0d1d01fa4e0aacdb636c221421107d1df96808ecbe8e241ceb1823

    -p 8083:8083 : user interface, log in with username-admin, pass-admin
    -p 8086:8086 : interaction with other application
    --name influxsrv : container have name influxsrv, use to cAdvisor link it.
```

You can test your InfluxDB installation by calling this URL >>http://45.79.148.234:8083 and login with user/password as "root".

![InfluxDB Administration 2016-08-01 14-10-08](http://blog.linoxide.com/wp-content/uploads/2016/07/InfluxDB-Administration-2016-08-01-14-10-08-1-1024x530.png)

We can create our required databases from this tab.

![createDB influx](http://blog.linoxide.com/wp-content/uploads/2016/07/createDB-influx-1024x504.png)

#### Installing cAdvisor ####

Our next step is to  install cAdvisor container and link it to the InfluxDB container. You can use this command to create it.

```
root@ubuntu:~# docker run --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --publish=8080:8080 --detach=true --link influxsrv:influxsrv --name=cadvisor google/cadvisor:latest -storage_driver_db=cadvisor -storage_driver_host=influxsrv:8086
Unable to find image 'google/cadvisor:latest' locally
latest: Pulling from google/cadvisor
09d0220f4043: Pull complete
151807d34af9: Pull complete
14cd28dce332: Pull complete
Digest: sha256:8364c7ab7f56a087b757a304f9376c3527c8c60c848f82b66dd728980222bd2f
Status: Downloaded newer image for google/cadvisor:latest
3bfdf7fdc83872485acb06666a686719983a1172ac49895cd2a260deb1cdde29
root@ubuntu:~#

    --publish=8080:8080 : user interface
    --link=influxsrv:influxsrv: link to container influxsrv
    -storage_driver=influxdb: set the storage driver as InfluxDB
    Specify what InfluxDB instance to push data to:
    -storage_driver_host=influxsrv:8086: The ip:port of the database. Default is ‘localhost:8086’
    -storage_driver_db=cadvisor: database name. Uses db ‘cadvisor’ by default
```

You can test our cAdvisor installation by calling this URL >>http://45.79.148.234:8080. This will provide you the statistics of your Docker host and containers.

![cAdvisor - Docker Containers 2016-08-01 14-24-18](http://blog.linoxide.com/wp-content/uploads/2016/07/cAdvisor-Docker-Containers-2016-08-01-14-24-18-776x1024.png)

#### Installing the Grafana Dashboard ####

Finally, we need to install the Grafana Dashboard and link to the InfluxDB. You can run this command to setup that.

```
root@ubuntu:~# docker run -d -p 3000:3000 -e INFLUXDB_HOST=localhost -e INFLUXDB_PORT=8086 -e INFLUXDB_NAME=cadvisor -e INFLUXDB_USER=root -e INFLUXDB_PASS=root --link influxsrv:influxsrv --name grafana grafana/grafana
f3b7598529202b110e4e6b998dca6b6e60e8608d75dcfe0d2b09ae408f43684a
```

Now we can login to Grafana and configure the Data Sources. Navigate to http://45.79.148.234:3000 or just http://45.79.148.234:

Username - admin
Password - admin

Once we've installed Grafana, we can connect the InfluxDB. Login on the Dashboard and click on the Grafana icon(Fireball) in the upper left hand corner of the panel. Click on Data Sources to configure.

![addingdatabsource](http://blog.linoxide.com/wp-content/uploads/2016/08/addingdatabsource-1-1024x804.png)

Now you can add our new Graph to our default Datasource InfluxDB.

![panelgraph](http://blog.linoxide.com/wp-content/uploads/2016/08/panelgraph-1024x576.png)

We can edit and modify our query by adjusting our graph at Metric tab.

![Grafana - Grafana Dashboard 2016-08-01 14-53-40](http://blog.linoxide.com/wp-content/uploads/2016/08/Grafana-Grafana-Dashboard-2016-08-01-14-53-40-1024x504.png)

![Grafana - Grafana Dashboard](http://blog.linoxide.com/wp-content/uploads/2016/08/Grafana-Grafana-Dashboard-1024x509.png)

You can get [more information][1] on docker monitoring here. Thank you for reading this. I would suggest your valuable comments and suggestions on this. Hope you'd a wonderful day!

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/monitor-docker-containers-grafana-ubuntu/

作者：[Saheetha Shameer][a]
译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/saheethas/
[1]:https://github.com/vegasbrianc/docker-monitoring
