NoSQL: How To Install OrientDB on Ubuntu 16.04
============================================================


 [![OrientDB NoSQL DBMS](https://www.unixmen.com/wp-content/uploads/2017/07/orientdb-696x318.png "orientdb")][2] 

### Introduction – NoSQL and OrientDB

When talking about databases, in general, we refer to two major families: RDBMS (**R**elational **D**ata**b**ase **M**anagement **S**ystem), which use as user and application program interface a language named **S**tructured **Q**uery **L**anguage (or SQL) and non-relational database management systems, or **NoSQL** databases.

Between the two models there is a huge difference in the way they consider (and store) data.

#### Relational Database Management Systems

In the relational model (like MySQL, or its fork, MariaDB), a database is a set of tables, each containing one or more data categories organized in columns. Each row of the DB contains a unique instance of data for categories defined by columns.

Just as an example, consider a table containing customers. Each row correspond to a customer, with columns for name, address, and every required information.
Another table could contain an order, with product, customer, date and everything else. A user of this DB can obtain a view that fits its needs, for example a report about customers that bought products in a specific range of prices.

#### NoSQL Database Management Systems

In the NoSQL (or Not only SQL) database management systems, databases are designed implementing different “formats” for data, like a document, key-value, graph and others. The database systems realized with this paradigm are built especially for large-scale database clusters, and huge web applications. Today, NoSQL databases are used by major companies like Google and Amazon.

##### Document databases

Document databases store data in document format. The usage of this kind of DBs is usually raised with JavaScript and JSON, however, XML and other formats are accepted. An example is MongoDB.

##### Key-value databases

This is a simple model pairing a unique key with a value. These systems are performant and highly scalable for caching. Examples include BerkeleyDB and MemcacheDB.

##### Graph databases

As the name predicts, these databases store data using graph models, meaning that data is organized as nodes and interconnections between them. This is a flexible model which can evolve over time and use. These systems are applied where there is the necessity of mapping relationships.
Examples are IBM Graphs and Neo4j **and OrientDB**.

### OrientDB

[OrientDB][3], as stated by the company behind it, is a multi-model NoSQL Database Management System that “ _combines the power of graphs with documents, key/value, reactive, object-oriented and geospatial models into one **scalable, high-performance operational database**“._ 

OrientDB has also support for SQL, with extensions to manipulate trees and graphs.

### Goals

This tutorial explains how to install and configure OrientDB Community on a server running Ubuntu 16.04.

### Download OrientDB

On an up to date server, download the latest version of OrientDB by executing the following command:

```
$ wget -O orientdb-community-2.2.22.tar.gz http://orientdb.com/download.php?file=orientdb-community-2.2.22.tar.gz&os=linux
```

This is a tarball containing pre-compiled binaries, so extract the archive with `tar`:

```
$ tar -zxf orientdb-community-2.2.22.tar.gz
```

Move the extracted directory into `/opt`:

```
# mv orientdb-community-2.2.22 /opt/orientdb
```

### Start OrientDB Server

Starting the OrientDB server requires the execution of the shell script contained in `orientdb/bin/`:

```
# /opt/orientdb/bin/server.sh
```

During the first start, this installer will display some information and will ask for an OrientDB root password:

```
+---------------------------------------------------------------+
| WARNING: FIRST RUN CONFIGURATION |
+---------------------------------------------------------------+
| This is the first time the server is running. Please type a |
| password of your choice for the 'root' user or leave it blank |
| to auto-generate it. |
| |
| To avoid this message set the environment variable or JVM |
| setting ORIENTDB_ROOT_PASSWORD to the root password to use. |
+---------------------------------------------------------------+

Root password [BLANK=auto generate it]: ********
Please confirm the root password: ********
```

After that, the OrientDB server will start:

```
INFO OrientDB Server is active v2.2.22 (build fb2b7d321ea8a5a5b18a82237049804aace9e3de). [OServer]
```

From now on, we will need a second terminal to interact with the OrientDB server.

Stop OrientDB by hitting `Ctrl+C`.

### Configure a Daemon

At this point, OrientDB is just a bunch of shell scripts. With a text editor, open `/opt/orientdb/bin/orientdb.sh`:

```
# $EDITOR /opt/orientdb/bin/orientdb.sh
```

In the first lines, we will see:

```
#!/bin/sh
# OrientDB service script
#
# Copyright (c) OrientDB LTD (http://orientdb.com/)

# chkconfig: 2345 20 80
# description: OrientDb init script
# processname: orientdb.sh

# You have to SET the OrientDB installation directory here
ORIENTDB_DIR="YOUR_ORIENTDB_INSTALLATION_PATH"
ORIENTDB_USER="USER_YOU_WANT_ORIENTDB_RUN_WITH"
```

Configure `ORIENTDB_DIR` and `ORIENTDB_USER`.

Create a user, for example **orientdb**, by executing the following command:

```
# useradd -r orientdb -s /sbin/nologin
```

**orientdb** is the user we enter in the `ORIENTDB_USER` line.

Change the ownership of `/opt/orientdb`:

```
# chown -R orientdb:orientdb /opt/orientdb
```

Change the configuration server file’s permission:

```
# chmod 640 /opt/orientdb/config/orientdb-server-config.xml
```

#### Install the Systemd Service

OrientDB tarball contains a service file, `/opt/orientdb/bin/orientdb.service`. Copy it to the `/etc/systemd/system` directory:

```
# cp /opt/orientdb/bin/orientdb.service /etc/systemd/system
```

Edit the OrientDB service file:

```
# $EDITOR /etc/systemd/system/orientdb.service
```

There, the `[service]` block should look like this:

```
[Service]
User=ORIENTDB_USER
Group=ORIENTDB_GROUP
ExecStart=$ORIENTDB_HOME/bin/server.sh
```

Edit as follow:

```
[Service]
User=orientdb 
Group=orientdb 
ExecStart=/opt/orientdb/bin/server.sh
```

Save and exit.

Reload systemd daemon service:

```
# systemctl daemon-reload
```

Start OrientDB and enable for starting at boot time:

```
# systemctl start orientdb
# systemctl enable orientdb
```

Check OrientDB status:

```
# systemctl status orientdb
```

The command should output:

```
● orientdb.service - OrientDB Server
 Loaded: loaded (/etc/systemd/system/orientdb.service; disabled; vendor preset: enabled)
 Active: active (running) ...
```

And that’s all! OrientDB Community is installed and correctly running.

### Conclusion

In this tutorial we have seen a brief comparison between RDBMS and NoSQL DBMS. We have also installed and completed a basic configuration of OrientDB Community server-side.

This is the first step for deploying a full OrientDB infrastructure, ready for managing large-scale systems data.

--------------------------------------------------------------------------------

via: https://www.unixmen.com/nosql-install-orientdb-ubuntu-16-04/

作者：[Giuseppe Molica ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/tutan/
[1]:https://www.unixmen.com/author/tutan/
[2]:https://www.unixmen.com/wp-content/uploads/2017/07/orientdb.png
[3]:https://orientdb.com/
