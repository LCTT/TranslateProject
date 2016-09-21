Monitoring Docker Containers with Elasticsearch and cAdvisor
=======

If you’re running a Swarm Mode cluster or even a single Docker engine, you’ll end up asking this question:

>How do I keep track of all that’s happening?

The answer is “not easily.”

You need a few things to have a complete overview of stuff like:


1. Number and status of containers
2. If, where, and when a container has been moved to another node
3. Number of containers on a given node
4. Traffic peaks at a given time
5. Orphan volumes and networks
6. Free disk space, free inodes
7. Number of containers against number of veths attached to the docker0 and docker_gwbridge bridges
8. Up and down Swarm nodes
9. Centralize logs

The goal of this post is to demonstrate the use of [Elasticsearch][1] + [Kibana][2] + [cAdvisor][3] as tools to analyze and gather metrics and visualize dashboards for Docker containers.

Later on in this post, you can find a dashboard trying to address a few points from the previous list. There are also points that can’t be addressed by simply using cAdvisor, like the status of Swarm Mode nodes.

Also, if you have specific needs that aren’t covered by cAdvisor or another tool, I encourage you to write your own data collector and data shipper (e.g., [Beats][4]). Note that I won’t be showing you how to centralize Docker containers log on Elasticsearch.

>[“How do you keep track of all that’s happening in a Swarm Mode cluster? Not easily.” via @fntlnz][5]

### Why Do We Need to Monitor Containers?

Imagine yourself in the classic situation of managing a virtual machine, either just one or several. You are a tmux hero, so you have your sessions preconfigured to do basically everything, monitoring included. There’s a problem in production? You just do a top, htop, iotop, jnettop, whatevertop on all your machines, and you’re ready for troubleshooting!

Now imagine that you have the same three nodes but split into 50 containers. You need some history displayed nicely in a single place where you can perform queries to know what happened instead of just risking your life in front of those ncurses tools.

### What Is the Elastic Stack?

The Elastic Stack is a set of tools composed of:

- Elasticsearch
- Kibana
- Logstash
- Beats

We’re going to use a few open-source tools from the Elastic Stack, such as Elasticsearch for the JSON-based analytics engine and Kibana to visualize data and create dashboards.

Another important piece of the Elastic Stack is Beats, but in this post, we’re focused on containers. There’s no official Beat for Docker, so we’ll just use cAdvisor that can natively talk with Elasticsearch.

cAdvisor is a tool that collects, aggregates, and exports metrics about running containers. In our case, those metrics are being exported to an Elasticsearch storage.

Two cool facts about cAdvisor are:

- It’s not limited to Docker containers.
- It has its own webserver with a simple dashboard to visualize gathered metrics for the current node.

### Set Up a Test Cluster or BYOI

As I did in my previous posts, my habit is to provide a small script to allow the reader to set up a test environment on which to try out my project’s steps in no time. So you can use the following not-for-production-use script to set up a little Swarm Mode cluster with Elasticsearch running as a container.

>If you have enough time/experience, you can BYOI (Bring Your Own Infrastructure).


To follow this post, you’ll just need:

- One or more nodes running the Docker daemon >= 1.12
- At least a stand-alone Elasticsearch node 2.4.X

Again, note that this post is not about setting up a production-ready Elasticsearch cluster. A single node cluster is not recommended for production. So if you’re planning a production installation, please refer to [Elastic guidelines][6].

### A friendly note for early adopters

I’m usually an early adopter (and I’m already using the latest alpha version in production, of course). But for this post, I chose not to use the latest Elasticsearch 5.0.0 alpha. Their roadmap is not perfectly clear to me, and I don’t want be the root cause of your problems!

So the Elasticsearch reference version for this post is the latest stable version, 2.4.0 at the moment of writing.

### Test cluster setup script

As said, I wanted to provide this script for everyone who would like to follow the blog without having to figure out how to create a Swarm cluster and install an Elasticsearch. Of course, you can skip this if you choose to use your own Swarm Mode engines and your own Elasticsearch nodes.

To execute the setup script, you’ll need:

- [Docker Machine][7] – latest version: to provision Docker engines on DigitalOcean
- [DigitalOcean API Token][8]: to allow docker-machine to start nodes on your behalf

![](https://resources.codeship.com/hubfs/CTAs/EVAL/Codeship_Request_Trial_Access.png?t=1473869513342)

### Create Cluster Script

Now that you have everything we need, you can copy the following script in a file named create-cluster.sh:

```
#!/usr/bin/env bash
#
# Create a Swarm Mode cluster with a single master and a configurable number of workers

workers=${WORKERS:-"worker1 worker2"}

#######################################
# Creates a machine on Digital Ocean
# Globals:
#   DO_ACCESS_TOKEN The token needed to access DigitalOcean's API
# Arguments:
#   $1 the actual name to give to the machine
#######################################
create_machine() {
  docker-machine create \
    -d digitalocean \
    --digitalocean-access-token=$DO_ACCESS_TOKEN \
    --digitalocean-size 2gb \
    $1
}

#######################################
# Executes a command on the specified machine
# Arguments:
#   $1     The machine on which to run the command
#   $2..$n The command to execute on that machine
#######################################
machine_do() {
  docker-machine ssh $@
}

main() {

  if [ -z "$DO_ACCESS_TOKEN" ]; then
    echo "Please export a DigitalOcean Access token: https://cloud.digitalocean.com/settings/api/tokens/new"
    echo "export DO_ACCESS_TOKEN=<yourtokenhere>"
    exit 1
  fi

  if [ -z "$WORKERS" ]; then
    echo "You haven't provided your workers by setting the \$WORKERS environment variable, using the default ones: $workers"
  fi

  # Create the first and only master
  echo "Creating the master"

  create_machine master1

  master_ip=$(docker-machine ip master1)

  # Initialize the swarm mode on it
  echo "Initializing the swarm mode"
  machine_do master1 docker swarm init --advertise-addr $master_ip

  # Obtain the token to allow workers to join
  worker_tkn=$(machine_do master1 docker swarm join-token -q worker)
  echo "Worker token: ${worker_tkn}"

  # Create and join the workers
  for worker in $workers; do
    echo "Creating worker ${worker}"
    create_machine $worker
    machine_do $worker docker swarm join --token $worker_tkn $master_ip:2377
  done
}

main $@
```

And make it executable:

```
chmod +x create-cluster.sh
```

### Create the cluster

As the name suggests, we’ll use the script to create the cluster. By default, the script will create a cluster with a single master and two workers. If you want to configure the number of workers, you can do that by setting the WORKERS environment variable.

Now, let’s create that cluster!

```
./create-cluster.sh
```

Ok, now you can go out for a coffee. This will take a while.

Finally the cluster is ready!

--------------------------------------------------------------------------------

via: https://blog.codeship.com/monitoring-docker-containers-with-elasticsearch-and-cadvisor/

作者：[Lorenzo Fontana][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.codeship.com/author/lorenzofontana/







[1]: https://github.com/elastic/elasticsearch
[2]: https://github.com/elastic/kibana
[3]: https://github.com/google/cadvisor
[4]: https://github.com/elastic/beats
[5]: https://twitter.com/share?text=%22How+do+you+keep+track+of+all+that%27s+happening+in+a+Swarm+Mode+cluster%3F+Not+easily.%22+via+%40fntlnz&url=https://blog.codeship.com/monitoring-docker-containers-with-elasticsearch-and-cadvisor/
[6]: https://www.elastic.co/guide/en/elasticsearch/guide/2.x/deploy.html
[7]: https://docs.docker.com/machine/install-machine/
[8]: https://cloud.digitalocean.com/settings/api/tokens/new
