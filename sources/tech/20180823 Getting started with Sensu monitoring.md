Getting started with Sensu monitoring
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_cloud_cc.png?itok=XSV7yR9e)

Sensu is an open source infrastructure and application monitoring solution that monitors servers, services, and application health, and sends alerts and notifications with third-party integration. Written in Ruby, Sensu can use either [RabbitMQ][1] or [Redis][2] to handle messages. It uses Redis to store data.

If you want to monitor your cloud infrastructure in a simple and efficient manner, Sensu is a good option. It can be integrated with many of the modern DevOps stacks your organization may already be using, such as [Slack][3], [HipChat][4], or [IRC][5], and it can even send mobile/pager alerts with [PagerDuty][6].

Sensu's [modular architecture][7] means every component can be installed on the same server or on completely separate machines.

### Architecture

Sensu's main communication mechanism is the Transport. Every Sensu component must connect to the Transport in order to send messages to each other. Transport can use either RabbitMQ (recommended in production) or Redis.

Sensu Server processes event data and takes action. It registers clients and processes check results and monitoring events using filters, mutators, and handlers. The server publishes check definitions to the clients and the Sensu API provides a RESTful API, providing access to monitoring data and core functionality.

[Sensu Client][8] executes checks either scheduled by Sensu Server or local checks definitions. Sensu uses a data store (Redis) to keep all the persistent data. Finally, [Uchiwa][9] is the web interface to communicate with Sensu API.

![sensu_system.png][11]

### Installing Sensu

#### Prerequisites

  * One Linux installation to act as the server node (I used CentOS 7 for this article)

  * One or more Linux machines to monitor (clients)




#### Server side

Sensu requires Redis to be installed. To install Redis, enable the EPEL repository:
```
$ sudo yum install epel-release -y

```

Then install Redis:
```
$ sudo yum install redis -y

```

Modify `/etc/redis.conf` to disable protected mode, listen on every interface, and set a password:
```
$ sudo sed -i 's/^protected-mode yes/protected-mode no/g' /etc/redis.conf

$ sudo sed -i 's/^bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis.conf

$ sudo sed -i 's/^# requirepass foobared/requirepass password123/g' /etc/redis.conf

```

Enable and start Redis service:
```
$ sudo systemctl enable redis
$ sudo systemctl start redis
```

Redis is now installed and ready to be used by Sensu.

Now let’s install Sensu.

First, configure the Sensu repository and install the packages:
```
$ sudo tee /etc/yum.repos.d/sensu.repo << EOF
[sensu]
name=sensu
baseurl=https://sensu.global.ssl.fastly.net/yum/\$releasever/\$basearch/
gpgcheck=0
enabled=1
EOF

$ sudo yum install sensu uchiwa -y
```

Let’s create the bare minimum configuration files for Sensu:
```
$ sudo tee /etc/sensu/conf.d/api.json << EOF
{
  "api": {
        "host": "127.0.0.1",
        "port": 4567
  }
}
EOF
```

Next, configure `sensu-api` to listen on localhost, with Port 4567:
```
$ sudo tee /etc/sensu/conf.d/redis.json << EOF
{
  "redis": {
        "host": "<IP of server>",
        "port": 6379,
        "password": "password123"
  }
}
EOF


$ sudo tee /etc/sensu/conf.d/transport.json << EOF
{
  "transport": {
        "name": "redis"
  }
}
EOF
```

In these two files, we configure Sensu to use Redis as the transport mechanism and the address where Redis will listen. Clients need to connect directly to the transport mechanism. These two files will be required on each client machine.
```
$ sudo tee /etc/sensu/uchiwa.json << EOF
{
   "sensu": [
        {
        "name": "sensu",
        "host": "127.0.0.1",
        "port": 4567
        }
   ],
   "uchiwa": {
        "host": "0.0.0.0",
        "port": 3000
   }
}
EOF
```

In this file, we configure Uchiwa to listen on every interface (0.0.0.0) on Port 3000. We also configure Uchiwa to use `sensu-api` (already configured).

For security reasons, change the owner of the configuration files you just created:
```
$ sudo chown -R sensu:sensu /etc/sensu
```

Enable and start the Sensu services:
```
$ sudo systemctl enable sensu-server sensu-api sensu-client
$ sudo systemctl start sensu-server sensu-api sensu-client
$ sudo systemctl enable uchiwa
$ sudo systemctl start uchiwa
```

Try accessing the Uchiwa website: http://<IP of server>:3000

For production environments, it’s recommended to run a cluster of RabbitMQ as the Transport instead of Redis (a Redis cluster can be used in production too), and to run more than one instance of Sensu Server and API for load balancing and high availability.

Sensu is now installed. Now let’s configure the clients.

#### Client side

To add a new client, you will need to enable Sensu repository on the client machines by creating the file `/etc/yum.repos.d/sensu.repo`.
```
$ sudo tee /etc/yum.repos.d/sensu.repo << EOF
[sensu]
name=sensu
baseurl=https://sensu.global.ssl.fastly.net/yum/\$releasever/\$basearch/
gpgcheck=0
enabled=1
EOF
```

With the repository enabled, install the package Sensu:
```
$ sudo yum install sensu -y
```

To configure `sensu-client`, create the same `redis.json` and `transport.json` created in the server machine, as well as the `client.json` configuration file:
```
$ sudo tee /etc/sensu/conf.d/client.json << EOF
{
  "client": {
        "name": "rhel-client",
        "environment": "development",
        "subscriptions": [
        "frontend"
        ]
  }
}
EOF
```

In the name field, specify a name to identify this client (typically the hostname). The environment field can help you filter, and subscription defines which monitoring checks will be executed by the client.

Finally, enable and start the services and check in Uchiwa, as the new client will register automatically:
```
$ sudo systemctl enable sensu-client
$ sudo systemctl start sensu-client
```

### Sensu checks

Sensu checks have two components: a plugin and a definition.

Sensu is compatible with the [Nagios check plugin specification][12], so any check for Nagios can be used without modification. Checks are executable files and are run by the Sensu client.

Check definitions let Sensu know how, where, and when to run the plugin.

#### Client side

Let’s install one check plugin on the client machine. Remember, this plugin will be executed on the clients.

Enable EPEL and install `nagios-plugins-http` :
```
$ sudo yum install -y epel-release
$ sudo yum install -y nagios-plugins-http
```

Now let’s explore the plugin by executing it manually. Try checking the status of a web server running on the client machine. It should fail as we don’t have a web server running:
```
$ /usr/lib64/nagios/plugins/check_http -I 127.0.0.1
connect to address 127.0.0.1 and port 80: Connection refused
HTTP CRITICAL - Unable to open TCP socket
```

It failed, as expected. Check the return code of the execution:
```
$ echo $?
2

```

The Nagios check plugin specification defines four return codes for the plugin execution:

| **Plugin return code** | **State** |
|------------------------|-----------|
|                      0 | OK        |
|                      1 | WARNING   |
|                      2 | CRITICAL  |
|                      3 | UNKNOWN   |

With this information, we can now create the check definition on the server.

#### Server side

On the server machine, create the file `/etc/sensu/conf.d/check_http.json`:
```
{
  "checks": {
    "check_http": {
      "command": "/usr/lib64/nagios/plugins/check_http -I 127.0.0.1",
      "interval": 10,
      "subscribers": [
        "frontend"
      ]
    }
  }
}
```

In the command field, use the command we tested before. `Interval` will tell Sensu how frequently, in seconds, this check should be executed. Finally, `subscribers` will define the clients where the check will be executed.

Restart both sensu-api and sensu-server and confirm that the new check is available in Uchiwa.
```
$ sudo systemctl restart sensu-api sensu-server
```

### What’s next?

Sensu is a powerful tool, and this article covers just a glimpse of what it can do. See the [documentation][13] to learn more, and visit the Sensu site to learn more about the [Sensu community][14].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/getting-started-sensu-monitoring-solution

作者：[Michael Zamot][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mzamot
[1]:https://www.rabbitmq.com/
[2]:https://redis.io/topics/config
[3]:https://slack.com/
[4]:https://en.wikipedia.org/wiki/HipChat
[5]:http://www.irc.org/
[6]:https://www.pagerduty.com/
[7]:https://docs.sensu.io/sensu-core/1.4/overview/architecture/
[8]:https://docs.sensu.io/sensu-core/1.4/installation/install-sensu-client/
[9]:https://uchiwa.io/#/
[10]:/file/406576
[11]:https://opensource.com/sites/default/files/uploads/sensu_system.png (sensu_system.png)
[12]:https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/pluginapi.html
[13]:https://docs.sensu.io/
[14]:https://sensu.io/community
