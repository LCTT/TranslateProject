How to create an open source stack using EFK
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-rock-stack.png?itok=cynE4xcC)
Managing an infrastructure of servers is a non-trivial task. When one cluster is misbehaving, logging in to multiple servers, checking each log, and using multiple filters until you find the culprit is not an efficient use of resources.

The first step to improve the methods that handle your infrastructure or applications is to implement a centralized logging system. This will enable you to gather logs from any application or system into a centralized location and filter, aggregate, compare, and analyze them. If there are servers or applications, there should be a unified logging layer.

Thankfully, we have an open source stack to simplify this. With the combination of Elasticsearch, Fluentd, and Kibana (EFK), we can create a powerful stack to collect, store, and visualize data in a centralized location.

Let’s start by defining each component to get the big picture. [Elasticsearch][1] is an open source distributed, RESTful search and analytics engine, or simply an object store where all logs are stored. [Fluentd][2] is an open source data collector that lets you unify the data collection and consumption for better use and understanding of data. And finally, [Kibana][3] is a web UI for Elasticsearch.

A picture is worth a thousand words:


![EFK stack][5]

EFK Stack using a centralized Fluentd aggregator.

Image by Michael Zamot, CC BY

There are other ways to collect logs, like running a small Fluentd forwarder in each host, but that’s beyond the scope of this article.

### Requirements

We will install each component in its own Docker container. With Docker we can deploy each component faster, focusing in EFK rather than distro-specific bits, and we can always delete the containers and start all over again. We will be using official, upstream images.

To learn more about Docker, read [Vincent Batts][6]'s excellent article: [A beginners' guide to Docker][7].

Increase the mmap limits by running the following command as root:
```
$ sudo sysctl -w vm.max_map_count=262144

```

To set this value permanently, update the `vm.max_map_count` setting in `/etc/sysctl.conf`.

This is required; otherwise, Elasticsearch can crash.

### Running Elasticsearch

To allow the containers to communicate with each other, create a Docker network:
```
$ sudo docker network create efk

[...]

```

Execute the following command to start Elasticsearch in Docker:
```
$ sudo docker run --network=efk --name elasticsearch -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "cluster.name=docker-cluster" -e "bootstrap.memory_lock=true" -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" --ulimit memlock=-1:-1 -v elasticdata:/usr/share/elasticsearch/data docker.elastic.co/elasticsearch/elasticsearch-oss:6.2.2

```

Verify the container is running:
```
$ sudo docker ps

CONTAINER ID        IMAGE                                                     COMMAND                  CREATED              STATUS              PORTS                                            NAMES

6e0db1486ee2        docker.elastic.co/elasticsearch/elasticsearch-oss:6.2.2   "/usr/local/bin/docke"   About a minute ago   Up About a minute   0.0.0.0:9200->9200/tcp, 0.0.0.0:9300->9300/tcp   elasticsearch

```

Let’s decouple the command to understand what we just did:

  * We use `docker run` to create a new container.
  * We use `--network` to attach the container to that specific network.
  * We need to define a container name; it will be used as the hostname.
  * The parameter `-p` maps our host ports to the container ports. Elasticsearch uses the ports 9200 and 9300.
  * The multiple parameters with `-e` are environment variables that are passed to the container to change configurations.
  * We define a custom `ulimit` to disable swapping for performance and node stability.
  * Containers, by design, are ephemeral. This means they don’t store data, so in order to keep the data and logs safe, we need to create a volume and mount it inside the container. In our case it is mounted to `/usr/share/elasticsearch/data`. This is the path where Elasticsearch stores the data.



Verify the volume was created:
```
$ sudo docker volume ls

[...]

local               elasticdata

```

This volume will survive even if you delete the container.

Great! Elasticsearch is running. Let’s move on.

### Running Kibana

Kibana is a much simpler command. Execute the following command to spin it:
```
$ sudo docker run --network=efk --name kibana -d -p 5601:5601 docker.elastic.co/kibana/kibana-oss:6.2.2

```

By default, Kibana will try to communicate to the host named elasticsearch.

Verify that you can access Kibana in your browser at this URL: http://<docker host>:5601

At this point, Elasticsearch is not indexing any data, so you won’t be able to do much yet.

Let’s start collecting logs!

### Running Fluentd

The following steps are trickier, as the official Docker image doesn’t include the Elasticsearch plugin. We will customize.

Create a directory called `fluentd` with a subdirectory called `plugins`:
```
$ mkdir -p fluentd/plugins

```

Now let’s create the Fluentd configuration file. Inside the directory `fluentd`, create a file called `fluent.conf` with the following content:
```
$ cat fluentd/fluent.conf

<source>

  type syslog

  port 42185

  tag  rsyslog

</source>



<match rsyslog.**>

  type copy

  <store>

    type elasticsearch

    logstash_format true

    host elasticsearch # Remember the name of the container

    port 9200

  </store>

</match>

```

The block `<source>` enables the `syslog` plugin, the port and address where it will listen. The block `<match rsyslog.**>` will match all logs coming from the `syslog` plugin and will send the data to Elasticsearch.

Now create another file inside the Fluentd folder called `Dockerfile`:
```
$ cat fluentd/Dockerfile

FROM fluent/fluentd:v0.12-onbuild



RUN apk add --update --virtual .build-deps \

        sudo build-base ruby-dev \

 && sudo gem install \

        fluent-plugin-elasticsearch \

 && sudo gem sources --clear-all \

 && apk del .build-deps \

 && rm -rf /var/cache/apk/* \

           /home/fluent/.gem/ruby/2.3.0/cache/*.gem

```

This will modify the official Fluentd Docker image and add Elasticsearch support.

The Fluentd directory should look like this:
```
$ ls fluentd/

Dockerfile  fluent.conf  plugins

```

Now we can build the container. Execute the following command within the Fluentd directory:
```
$ sudo docker build fluentd/

[...]

Successfully built <Image ID>

```

Now we are ready to start the final piece of our stack. Execute the following command to start the container:
```
$ sudo docker run -d --network efk --name fluentd -p 42185:42185/udp <Image ID>

```

Your Unified Logging Stack is deployed. Now it’s time to point configure your host's rsyslog to send the data to Fluentd.

Log into each of the nodes you want to collect logs from, and add the following line at the end of `/etc/rsyslog.conf` :
```
*.* @<Docker Host>:42185

```

Then restart `rsyslog` service:
```
$ sudo systemctl restart rsyslog

```

Don’t forget to check Kibana—all your logs are going to be there.

### Wrapping everything up with Docker Compose

We can use Docker Compose to combine all the steps we did previously into a single command. Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file (known as a Compose file) to configure an application's services; in our case, EFK services.

To install Docker Compose, execute the following commands:
```
$ sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose



$ sudo chmod +x /usr/local/bin/docker-compose

```

Verify it is working:
```
$ docker-compose version

docker-compose version 1.19.0, build 9e633ef

```

Awesome! All the steps we did previously can be summarized with the following `docker-compose.yml` file (we still need to create the Fluentd folder and files):
```
$ cat docker-compose.yml

version: '2.1'

services:

  fluentd:

    build: ./fluentd

    links:

      - "elasticsearch"

    expose:

      - 42185

    ports:

      - "42185:42185/udp"

    logging:

        driver: "json-file"

        options:

            max-size: 100m

            max-file: "5"



  elasticsearch:

    image: docker.elastic.co/elasticsearch/elasticsearch-oss:6.2.2

    container_name: elasticsearch

    ports:

      - "9200:9200"

    environment:

      - "discovery.type=single-node"

      - "cluster.name=docker-cluster"

      - "bootstrap.memory_lock=true"

      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"

    ulimits:

      memlock:

        soft: -1

        hard: -1

    volumes:

      - elasticdata:/usr/share/elasticsearch/data



  kibana:

    image: docker.elastic.co/kibana/kibana-oss:6.2.2

    container_name: kibana

    links:

      - "elasticsearch"

    ports:

      - "5601:5601"



volumes:

  elasticdata:

    driver: local

```

Then you can bring all the containers up with one command:
```
$ sudo docker-compose up

```

And if you want to delete all the containers (except the volumes):
```
$ sudo docker-compose rm

```

With one simple YAML file, your proof of concept is ready to be deployed anywhere, with consistent results. When you have tested the solution thoroughly, don't forget to read the official [Elasticsearch][8], [Fluentd][9], and [Kibana][10] documentation to make your implementation production grade.

As you play with the EFK (and Docker) you will recognize how practical it is, and your life as a sysadmin will never be the same.

### Further reading

[Install Elasticsearch with Docker][8]

[Installing Fluentd with Docker][11]

[Unified Logging Layer: Turning Data into Action][12]

[Docker Compose][13]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/efk-creating-open-source-stack

作者：[Michael Zamot][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mzamot
[1]:https://www.elastic.co/
[2]:https://www.fluentd.org/
[3]:https://www.elastic.co/products/kibana
[5]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/efk_stack_illustration.png?itok=Z0RDEi8p (EFK stack illustration)
[6]:https://opensource.com/users/vbatts
[7]:https://opensource.com/business/14/7/guide-docker
[8]:https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
[9]:https://docs.fluentd.org/v1.0/articles/quickstart
[10]:https://www.elastic.co/guide/en/kibana/current/introduction.html
[11]:https://docs.fluentd.org/v0.12/articles/install-by-docker
[12]:https://www.fluentd.org/blog/unified-logging-layer
[13]:https://docs.docker.com/compose/
