Translating by GOLinux!
How to Configure Swarm Native Clustering for Docker
================================================================================
Hi everyone, today we'll learn about Swarm and how we can create native clusters using Docker with Swarm. [Docker Swarm][1] is a native clustering program for Docker which turns a pool of Docker hosts into a single virtual host. Swarm serves the standard Docker API, so any tool which can communicate with a Docker daemon can use Swarm to transparently scale to multiple hosts. Swarm follows the "batteries included but removable" principle as other Docker Projects. It ships with a simple scheduling backend out of the box, and as initial development settles, an API will develop to enable pluggable backends. The goal is to provide a smooth out-of-box experience for simple use cases, and allow swapping in more powerful backends, like Mesos, for large scale production deployments. Swarm is extremely easy to setup and get started.

So, here are some features of Swarm 0.2 out of the box.

1. Swarm 0.2.0 is about 85% compatible with the Docker Engine.
2. It supports Resource Management.
3. It has Advanced Scheduling feature with constraints and affinities.
4. It supports multiple Discovery Backends (hubs, consul, etcd, zookeeper)
5. It uses TLS encryption method for security and authentication.

So, here are some very simple and easy steps on how we can use Swarm.

### 1. Pre-requisites to run Swarm ###

We must install Docker 1.4.0 or later on all nodes. While each node's IP need not be public, the Swarm manager must be able to access each node across the network.

Note: Swarm is currently in beta, so things are likely to change. We don't recommend you use it in production yet.

### 2. Creating Swarm Cluster ###

Now, we'll create swarm cluster by running the below command. Each node will run a swarm node agent. The agent registers the referenced Docker daemon, monitors it, and updates the discovery backend with the node's status. The below command returns a token which is a unique cluster id, it will be used when starting the Swarm Agent on nodes.

    # docker run swarm create

![Creating Swarm Cluster](http://blog.linoxide.com/wp-content/uploads/2015/05/creating-swarm-cluster.png)

### 3. Starting the Docker Daemon in each nodes ###

We'll need to login into each node that we'll use to create clusters and start the Docker Daemon into it using flag -H . It ensures that the docker remote API on the node is available over TCP for the Swarm Manager. To do start the docker daemon, we'll need to run the following command inside the nodes.

    # docker -H tcp://0.0.0.0:2375 -d

![Starting Docker Daemon](http://blog.linoxide.com/wp-content/uploads/2015/05/starting-docker-daemon.png)

### 4. Adding the Nodes ###

After enabling Docker Daemon, we'll need to add the Swarm Nodes to the discovery service. We must ensure that node's IP must be accessible from the Swarm Manager. To do so, we'll need to run the following command.

    # docker run -d swarm join --addr=<node_ip>:2375 token://<cluster_id>

![Adding Nodes to Cluster](http://blog.linoxide.com/wp-content/uploads/2015/05/adding-nodes-to-cluster.png)

**Note**: Here, we'll need to replace <node_ip> and <cluster_id> with the IP address of the Node and the cluster ID we got from step 2.

### 5. Starting the Swarm Manager ###

Now, as we have got the nodes connected to the cluster. Now, we'll start the swarm manager, we'll need to run the following command in the node.

    # docker run -d -p <swarm_port>:2375 swarm manage token://<cluster_id>

![Starting Swarm Manager](http://blog.linoxide.com/wp-content/uploads/2015/05/starting-swarm-manager.png)

### 6. Checking the Configuration ###

Once the manager is running, we can check the configuration by running the following command.

    # docker -H tcp://<manager_ip:manager_port> info

![Accessing Swarm Clusters](http://blog.linoxide.com/wp-content/uploads/2015/05/accessing-swarm-cluster.png)

**Note**: We'll need to replace <manager_ip:manager_port> with the ip address and port of the host running the swarm manager.

### 7. Using the docker CLI to access nodes ###

After everything is done perfectly as explained above, this part is the most important part of the Docker Swarm. We can use Docker CLI to access the nodes and run containers on them.

    # docker -H tcp://<manager_ip:manager_port> info
    # docker -H tcp://<manager_ip:manager_port> run ...

### 8. Listing nodes in the cluster ###

We can get a list of all of the running nodes using the swarm list command.

    # docker run --rm swarm list token://<cluster_id>

![Listing Swarm Nodes](http://blog.linoxide.com/wp-content/uploads/2015/05/listing-swarm-nodes.png)

### Conclusion ###

Swarm is really an awesome feature of docker that can be used for creating and managing clusters. It is pretty easy to setup and use. It is more beautiful when we use constraints and affinities on top of it. Advanced Scheduling is an awesome feature of it which applies filters to exclude nodes with ports, labels, health and it uses strategies to pick the best node. So, if you have any questions, comments, feedback please do write on the comment box below and let us know what stuffs needs to be added or improved. Thank You! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/configure-swarm-clustering-docker/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://docs.docker.com/swarm/
