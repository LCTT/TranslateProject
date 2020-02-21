[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to get MongoDB Server on Fedora)
[#]: via: (https://fedoramagazine.org/how-to-get-mongodb-server-on-fedora/)
[#]: author: (Honza Horak https://fedoramagazine.org/author/hhorak/)

How to get MongoDB Server on Fedora
======

![][1]

Mongo (from “humongous”) is a high-performance, open source, schema-free document-oriented database, which is one of the most favorite so-called [NoSQL][2] databases. It uses JSON as a document format, and it is designed to be scalable and replicable across multiple server nodes.

### Story about license change

It’s been more than a year when the upstream MongoDB decided to change the license of the Server code. The previous license was GNU Affero General Public License v3 (AGPLv3). However, upstream wrote a new license designed to make companies running MongoDB as a service contribute back to the community. The new license is called Server Side Public License (SSPLv1) and more about this step and its rationale can be found at [MongoDB SSPL FAQ][3].

Fedora has always included only free (as in “freedom”) software. When SSPL was released, Fedora [determined][4] that it is not a free software license in this meaning. All versions of MongoDB released before the license change date (October 2018) could be potentially kept in Fedora, but never updating the packages in the future would bring security issues. Hence the Fedora community decided to [remove the MongoDB server][5] entirely, starting Fedora 30.

### What options are left to developers?

Well, alternatives exist, for example PostgreSQL also supports JSON in the recent versions, and it can be used in cases when MongoDB cannot be used any more. With JSONB type, indexing works very well in PostgreSQL with performance comparable with MongoDB, and even without any compromises from ACID.

The technical reasons that a developer may have chosen MongoDB did not change with the license, so many still want to use it. What is important to realize is that the SSPL license was only changed to the MongoDB server. There are other projects that MongoDB upstream develops, like MongoDB tools, C and C++ client libraries and connectors for various dynamic languages, that are used on the client side (in applications that want to communicate with the server over the network). Since the license is kept free (Apache License mostly) for those packages, they are staying in Fedora repositories, so users can use them for the application development.

The only change is really the server package itself, which was removed entirely from Fedora repos. Let’s see what a Fedora user can do to get the non-free packages.

### How to install MongoDB server from the upstream

When Fedora users want to install a MongoDB server, they need to approach MongoDB upstream directly. However, the upstream does not ship RPM packages for Fedora itself. Instead, the MongoDB server is either available as the source tarball, that users need to compile themselves (which requires some developer knowledge), or Fedora user can use some compatible packages. From the compatible options, the best choice is the RHEL-8 RPMs at this point. The following steps describe, how to install them and how to start the daemon.

#### 1\. Create a repository with upstream RPMs (RHEL-8 builds)
```

```

$ sudo cat &gt; /etc/yum.repos.d/mongodb.repo &amp;lt;&amp;lt;EOF
[mongodb-upstream]
name=MongoDB Upstream Repository
baseurl=<https://repo.mongodb.org/yum/redhat/8Server/mongodb-org/4.2/x86\_64/>
gpgcheck=1
enabled=1
gpgkey=<https://www.mongodb.org/static/pgp/server-4.2.asc>
EOF
```

```

#### 2\. Install the meta-package, that pulls the server and tools packages
```

```

$ sudo dnf install mongodb-org
&amp;lt;snipped&gt;
Installed:
  mongodb-org-4.2.3-1.el8.x86_64           mongodb-org-mongos-4.2.3-1.el8.x86_64  
  mongodb-org-server-4.2.3-1.el8.x86_64    mongodb-org-shell-4.2.3-1.el8.x86_64
  mongodb-org-tools-4.2.3-1.el8.x86_64          

Complete!
```

```

#### 3\. Start the MongoDB daemon
```

```

$ sudo systemctl status mongod
● mongod.service - MongoDB Database Server
   Loaded: loaded (/usr/lib/systemd/system/mongod.service; enabled; vendor preset: disabled)
   Active: active (running) since Sat 2020-02-08 12:33:45 EST; 2s ago
     Docs: <https://docs.mongodb.org/manual>
  Process: 15768 ExecStartPre=/usr/bin/mkdir -p /var/run/mongodb (code=exited, status=0/SUCCESS)
  Process: 15769 ExecStartPre=/usr/bin/chown mongod:mongod /var/run/mongodb (code=exited, status=0/SUCCESS)
  Process: 15770 ExecStartPre=/usr/bin/chmod 0755 /var/run/mongodb (code=exited, status=0/SUCCESS)
  Process: 15771 ExecStart=/usr/bin/mongod $OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 15773 (mongod)
   Memory: 70.4M
      CPU: 611ms
   CGroup: /system.slice/mongod.service
           └─15773 /usr/bin/mongod -f /etc/mongod.conf
```

```

#### 4\. Verify that the server runs by connecting to it from the mongo shell
```

```

$ mongo
MongoDB shell version v4.2.3
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&amp;amp;gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("20b6e61f-c7cc-4e9b-a25e-5e306d60482f") }
MongoDB server version: 4.2.3
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
    <http://docs.mongodb.org/>
\---

&gt; _
```

```

That’s all. As you see, the RHEL-8 packages are pretty compatible and it should stay that way for as long as the Fedora packages remain compatible with what’s in RHEL-8. Just be careful that you comply with the SSPLv1 license in your use.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-get-mongodb-server-on-fedora/

作者：[Honza Horak][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hhorak/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/mongodb-816x348.png
[2]: https://en.wikipedia.org/wiki/NoSQL
[3]: https://www.mongodb.com/licensing/server-side-public-license/faq
[4]: https://lists.fedoraproject.org/archives/list/legal@lists.fedoraproject.org/thread/IQIOBOGWJ247JGKX2WD6N27TZNZZNM6C/
[5]: https://fedoraproject.org/wiki/Changes/MongoDB_Removal
