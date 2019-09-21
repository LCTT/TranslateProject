[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a distributed NoSQL database with Apache Cassandra)
[#]: via: (https://opensource.com/article/19/8/how-set-apache-cassandra-cluster)
[#]: author: (James Farrell https://opensource.com/users/jamesfhttps://opensource.com/users/ben-bromhead)

Build a distributed NoSQL database with Apache Cassandra
======
Set up a basic three-node Cassandra cluster from scratch with some extra
bits for replication and future expansion.
![Woman programming][1]

Recently, I got a rush request to get a three-node [Apache Cassandra][2] cluster with a replication factor of two working for a development job. I had little idea what that meant but needed to figure it out quickly—a typical day in a sysadmin's job.

Here's how to set up a basic three-node Cassandra cluster from scratch with some extra bits for replication and future node expansion.

### Basic nodes needed

To start, you need some basic Linux machines. For a production install, you would likely put physical machines into racks, data centers, and diverse locations. For development, you just need something suitably sized for the scale of your development. I used three CentOS 7 virtual machines on VMware that have 20GB thin provisioned disks, two processors, and 4GB of RAM. These three machines are called: CS1 (192.168.0.110), CS2 (192.168.0.120), and CS3 (192.168.0.130).

First, do a minimal install of CentOS 7 as an operating system on each machine. To run this in production with CentOS, consider [tweaking][3] your [firewalld][4] and [SELinux][5]. Since this cluster would be used just for initial development, I turned them off.

The only other requirement is an OpenJDK 1.8 installation, which is available from the CentOS repository.

### Installation

Create a **cass** user account on each machine. To ensure no variation between nodes, force the same UID on each install:


```
$ useradd --create-home \
\--uid 1099 cass
$ passwd cass
```

[Download][6] the current version of Apache Cassandra (3.11.4 as I'm writing this). Extract the Cassandra archive in the **cass** home directory like this:


```
`$ tar zfvx apache-cassandra-3.11.4-bin.tar.gz`
```

The complete software is contained in **~cass/apache-cassandra-3.11.4**. For a quick development trial, this is fine. The data files are there, and the **conf/** directory has the important bits needed to tune these nodes into a real cluster.

### Configuration

Out of the box, Cassandra runs as a localhost one-node cluster. That is convenient for a quick look, but the goal here is a real cluster that external clients can access and that provides the option to add additional nodes when development and tests need to broaden. The two configuration files to look at are **conf/cassandra.yaml** and **conf/cassandra-rackdc.properties**.

First, edit **conf/cassandra.yaml** to set the cluster name, network, and remote procedure call (RPC) interfaces; define peers; and change the strategy for routing requests and replication.

Edit **conf/cassandra.yaml** on each of the cluster nodes.

Change the cluster name to be the same on each node: 


```
`cluster_name: 'DevClust'`
```

Change the following two entries to match the primary IP address of the node you are working on:


```
listen_address: 192.168.0.110
rpc_address:  192.168.0.110
```

Find the **seed_provider** entry and look for the **\- seeds:** configuration line. Edit each node to include all your nodes:


```
`        - seeds: "192.168.0.110, 192.168.0.120, 192.168.0.130"`
```

This enables the local Cassandra instance to see all its peers (including itself).

Look for the **endpoint_snitch** setting and change it to:


```
`endpoint_snitch: GossipingPropertyFileSnitch`
```

The **endpoint_snitch** setting enables flexibility later on if new nodes need to be joined. The Cassandra documentation indicates that **GossipingPropertyFileSnitch** is the preferred setting for production use; it is also necessary to set the replication strategy that will be presented below.

Save and close the **cassandra.yaml** file.

Open the **conf/cassandra-rackdc.properties** file and change the default values for **dc=** and **rack=**. They can be anything that is unique and does not conflict with other local installs. For production, you would put more thought into how to organize your racks and data centers. For this example, I used generic names like:


```
dc=NJDC
rack=rack001
```

### Start the cluster

On each node, log into the account where Cassandra is installed (**cass** in this example), enter **cd apache-cassandra-3.11.4/bin**, and run **./cassandra**. A long list of messages will print to the terminal, and the Java process will run in the background.

### Confirm the cluster

While logged into the Cassandra user account, go to the **bin** directory and run **$ ./nodetool status**. If everything went well, you would see something like:


```
$ ./nodetool status
INFO  [main] 2019-08-04 15:14:18,361 Gossiper.java:1715 - No gossip backlog; proceeding
Datacenter: NJDC
================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
\--  Address       Load       Tokens       Owns (effective)  Host ID                               Rack
UN  192.168.0.110  195.26 KiB  256          69.2%             0abc7ad5-6409-4fe3-a4e5-c0a31bd73349  rack001
UN  192.168.0.120  195.18 KiB  256          63.0%             b7ae87e5-1eab-4eb9-bcf7-4d07e4d5bd71  rack001
UN  192.168.0.130  117.96 KiB  256          67.8%             b36bb943-8ba1-4f2e-a5f9-de1a54f8d703  rack001
```

This means the cluster sees all the nodes and prints some interesting information.

Note that if **cassandra.yaml** uses the default **endpoint_snitch: SimpleSnitch**, the **nodetool** command above indicates the default locations as **Datacenter: datacenter1** and the racks as **rack1**. In the example output above, the **cassandra-racdc.properties** values are evident.

### Run some CQL

This is where the replication factor setting comes in.

Create a keystore with a replication factor of two. From any one of the cluster nodes, go to the **bin** directory and run **./cqlsh 192.168.0.130** (substitute the appropriate cluster node IP address). You can see the default administrative keyspaces with the following:


```
cqlsh&gt; SELECT * FROM system_schema.keyspaces;

 keyspace_name      | durable_writes | replication
\--------------------+----------------+-------------------------------------------------------------------------------------
        system_auth |           True | {'class': 'org.apache.cassandra.locator.SimpleStrategy', 'replication_factor': '1'}
      system_schema |           True |                             {'class': 'org.apache.cassandra.locator.LocalStrategy'}
 system_distributed |           True | {'class': 'org.apache.cassandra.locator.SimpleStrategy', 'replication_factor': '3'}
             system |           True |                             {'class': 'org.apache.cassandra.locator.LocalStrategy'}
      system_traces |           True | {'class': 'org.apache.cassandra.locator.SimpleStrategy', 'replication_factor': '2'}
```

Create a new keyspace with replication factor two, insert some rows, then recall some data:


```
cqlsh&gt; CREATE KEYSPACE TestSpace WITH replication = {'class': 'NetworkTopologyStrategy', 'NJDC' : 2};
cqlsh&gt; select * from system_schema.keyspaces where keyspace_name='testspace';

 keyspace_name | durable_writes | replication
\---------------+----------------+--------------------------------------------------------------------------------
     testspace |           True | {'NJDC': '2', 'class': 'org.apache.cassandra.locator.NetworkTopologyStrategy'}
cqlsh&gt; use testspace;
cqlsh:testspace&gt; create table users ( userid int PRIMARY KEY, email text, name text );
cqlsh:testspace&gt; insert into users (userid, email, name) VALUES (1, '[jd@somedomain.com][7]', 'John Doe');
cqlsh:testspace&gt; select * from users;

 userid | email             | name
\--------+-------------------+----------
      1 | [jd@somedomain.com][7] | John Doe
```

Now you have a basic three-node Cassandra cluster running and ready for some development and testing work. The CQL syntax is similar to standard SQL, as you can see from the familiar commands to create a table, insert, and query data.

### Conclusion

Apache Cassandra seems like an interesting NoSQL clustered database, and I'm looking forward to diving deeper into its use. This simple setup only scratches the surface of the options available. I hope this three-node primer helps you get started with it, too.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/how-set-apache-cassandra-cluster

作者：[James Farrell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jamesfhttps://opensource.com/users/ben-bromhead
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: http://cassandra.apache.org/
[3]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[4]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[5]: https://opensource.com/business/13/11/selinux-policy-guide
[6]: https://cassandra.apache.org/download/
[7]: mailto:jd@somedomain.com
