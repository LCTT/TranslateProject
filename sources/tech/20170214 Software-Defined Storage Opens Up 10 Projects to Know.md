Software-Defined Storage Opens Up: 10 Projects to Know
============================================================


 ![Software defined Storage](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/software-defined.jpg?itok=fRTy33a8 "Software Defined Storage") 
With SDS, organizations can manage policy-based provisioning and management of data storage independent of the underlying hardware. Here's a list of open source projects you should know.[Creative Commons Zero][1]Pixabay

Throughout 2016, the SDS (Software-Defined Storage) category achieved many new milestones and became increasingly tied to successful cloud deployments. With SDS, organizations can manage policy-based provisioning and management of data storage independent of the underlying hardware. They can also deploy free and open source SDS solutions. Many people are familiar with Ceph and are leveraging it within their OpenStack deployments, but Ceph is far from the only relevant open source SDS project.

A market research report from Gartner predicted that by 2019, 70 percent of existing storage array solutions will be available as a “software only” version. The research firm also predicted that by 2020, 70 percent to 80 percent of unstructured data will be stored in less expensive storage hardware managed by SDS systems.  

Just recently, Dell EMC joined the[ OpenSDS][4] Project, of which The Linux Foundation is the steward. The OpenSDS community seeks to address software-defined storage integration challenges with the goal of driving enterprise adoption of open standards. It comprises storage users and vendors, including Fujitsu, Hitachi Data Systems, Huawei, Oregon State University and Vodafone. The project also seeks to collaborate with other upstream open source communities such as the Cloud Native Computing Foundation, Docker, OpenStack and Open Container Initiative.

According to the Open SDS project's[ home][5], 2017 will be a milestone year for SDS: "The community hopes to have an initial prototype available in Q2 2017 with a beta release by Q3 2017\. The initial participants expect OpenSDS will leverage open source technologies, such as Cinder and Manila from the OpenStack community, to best enable support across a wide range of cloud storage solutions."

Meanwhile, the number of projects in the SDS category is ballooning. They range from Apache Cassandra to Ceph. The Linux Foundation recently[][6]released its 2016 report[ "Guide to the Open Cloud: Current Trends and Open Source Projects,][7]” which provides a comprehensive look at the state of open cloud computing, and includes a section on SDS. You can[ download the report][8] now, and one of the first things to notice is that it aggregates and analyzes research, illustrating how trends in containers, SDS, and more are reshaping cloud computing. The report provides descriptions and links to categorized projects central to today’s open cloud environment.

In this series of articles, we are calling out many of these projects from the guide, providing extra insights on how the categories are evolving. Below, you’ll find a collection of several important SDS projects and the impact that they are having, along with links to their GitHub repositories, all gathered from the Guide to the Open Cloud:

### Software-Defined Storage

[Apache Cassandra][9]

Apache Cassandra is a scalable, high-availability database for mission-critical applications. It runs on commodity hardware or cloud infrastructure and replicates across multiple data centers for lower latency and fault tolerance. [Cassandra on GitHub][10]

[Ceph][11]

Ceph is Red Hat’s distributed, highly scalable block, object, and file storage platform for enterprises deploying public or private clouds. It’s commonly used with OpenStack. [Ceph on GitHub][12]

[CouchDB][13]

CouchDB, an Apache Software Foundation project, is a single-node or clustered database management system. It provides a RESTful HTTP API for reading and updating database documents. [CouchDB on GitHub][14]

[Docker Volume Plugins][15]

Docker Engine volume plugins enable Engine deployments to be integrated with external storage systems and enable data volumes to persist beyond the lifetime of a single Engine host. Volume plugins exist for multiple external storage systems including Azure File Storage, NetApp, VMware vSphere, and more. You can find individual plugins on GitHub.

[GlusterFS][16]

Gluster is Red Hat’s scalable network filesystem and data management platform. It can deploy on-premise, in private, public, or hybrid clouds, and in Linux containers for media streaming, data analysis, and other data- and bandwidth-intensive tasks. [GlusterFS on GitHub][17]

[MongoDB][18]

MongoDB is a high performance document database designed for ease of development and scaling. [MongoDB on GitHub][19]

[Nexenta][20]

NexentaStor is a scalable, unified software-defined file and block storage service that includes data management functionality. It integrates with VMware and supports Docker and OpenStack. [Nexenta on GitHub][21]

[Redis][22]

Redis is an in-memory data structure store, used as database, cache and message broker. It supports multiple data structures and has built-in replication, Lua scripting, LRU eviction, transactions and different levels of on-disk persistence. [Redis on GitHub][23]

[Riak CS][24]

Riak CS (Cloud Storage) is object storage software built on top of Riak KV, Basho’s distributed database. It provides distributed cloud storage at any scale, and can be used to build public or private cloud architectures or as storage infrastructure for heavy-duty applications and services. Its API is Amazon S3 compatible and supports per-tenant reporting for use cases involving billing and metering. [Riak CS on GitHub][25]

[Swift][26]

Swift is OpenStack’s object storage system designed to store and retrieve unstructured data with a simple API. It’s built for scale and optimized for durability, availability, and concurrency across the entire data set. [Swift on GitHub][27]

 _Learn more about trends in open source cloud computing and see the full list of the top open source cloud computing projects. [Download The Linux Foundation’s Guide to the Open Cloud report today!][3]_

--------------------------------------------------------------------------------

via: https://www.linux.com/news/open-cloud-report/2016/guide-open-cloud-software-defined-storage-opens

作者：[SAM DEAN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/sam-dean
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/software-definedjpg
[3]:http://bit.ly/2eHQOwy
[4]:http://ctt.marketwire.com/?release=11G125514-001&id=10559023&type=0&url=https%3A%2F%2Fwww.opensds.io%2F
[5]:https://www.opensds.io/
[6]:https://www.linux.com/blog/linux-foundation-issues-2016-guide-open-source-cloud-projects
[7]:http://ctt.marketwire.com/?release=11G120876-001&id=10172077&type=0&url=http%3A%2F%2Fgo.linuxfoundation.org%2Frd-open-cloud-report-2016-pr
[8]:http://go.linuxfoundation.org/l/6342/2016-10-31/3krbjr
[9]:http://cassandra.apache.org/
[10]:https://github.com/apache/cassandra
[11]:http://ceph.com/
[12]:https://github.com/ceph/ceph
[13]:http://couchdb.apache.org/
[14]:https://github.com/apache/couchdb
[15]:https://docs.docker.com/engine/extend/plugins_volume/
[16]:https://www.gluster.org/
[17]:https://github.com/gluster/glusterfs
[18]:https://www.mongodb.com/
[19]:https://github.com/mongodb/mongo
[20]:https://nexenta.com/
[21]:https://github.com/Nexenta
[22]:http://redis.io/
[23]:https://github.com/antirez/redis
[24]:http://docs.basho.com/riak/cs/2.1.1/
[25]:https://github.com/basho/riak_cs
[26]:https://wiki.openstack.org/wiki/Swift
[27]:https://github.com/openstack/swift
