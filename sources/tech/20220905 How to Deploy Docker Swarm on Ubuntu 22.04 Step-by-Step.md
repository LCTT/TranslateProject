[#]: subject: "How to Deploy Docker Swarm on Ubuntu 22.04 Step-by-Step"
[#]: via: "https://www.linuxtechi.com/how-to-deploy-docker-swarm-on-ubuntu/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Deploy Docker Swarm on Ubuntu 22.04 Step-by-Step
======
In this guide, we will cover how to deploy Docker Swarm on Ubuntu 22.04 step-by-step.

#### What is Docker Swarm?

Docker Swarm is a container orchestration tool that runs on the Docker platform. It helps users to create and manage a cluster of Docker nodes. Clustering in Docker is a crucial concept in providing redundancy by enabling Docker Swarm to fail over should one or more nodes in the cluster fail.

Docker Swarm uses the standard Docker API to communicate with other tools such as Docker Engine. It intelligently assigns containers to worker nodes and ensures resource optimization by scheduling container workloads to run on the most suitable node(s)

##### Lab setup

To demonstrate how Docker Swarm works, we have a simple cluster that comprises a Swarm Manager node and two worker nodes as shown. The Manager nodes handle all the cluster management tasks while the worker nodes will run the containers.

* swarm-manager                  10.128.0.57
* worker-node-1                    10.128.0.58
* worker-node-2                    10.128.0.59

### Step 1) Configure the Cluster hosts file

To start off, log into each of the nodes and update the /etc/hosts file with the following entries:

```
swarm-manager          10.128.0.57
worker-node-1          10.128.0.58
worker-node-2          10.128.0.59
```

Next, ensure that all the nodes can ping each other. Therefore, on the manager node, run the commands:

```
$ ping -c 4 10.128.0.58
$ ping -c 4 10.128.0.59
```

On worker Node 1

```
$ ping -c 4 10.128.0.57
$ ping -c 4 10.128.0.59
```

On worker Node 2

```
$ ping -c 4 10.128.0.57
$ ping -c 4 10.128.0.58
```

### Step 2) Install Docker CE on all the nodes

The next step is to install Docker on all the nodes. We are going to install Docker Community Edition (Docker CE) which is free to install and use.

Therefore, log into each of the nodes and update the local package index.

```
$ sudo apt update
```

Next, install the prerequisites package needed during the installation

```
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
```

Once all the packages have been installed, add the Docker GPG key

```
$ sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
```

In the next step, add the official Docker repository to your Ubuntu 22.04 system

```
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

Next, update the local package index to make the system, aware of the newly added repository.

```
$ sudo apt update
```

Then install Docker from the official Docker repository,

```
$ sudo apt install docker-ce -y
```

The command installs Docker alongside additional packages that will be required by Docker to function as expected.

![Install-docker-ce-apt-command-ubuntu][1]

Once Docker is installed, add the currently logged-in user to the Docker group to avoid running Docker as a [sudo user][2] every time you run Docker.

```
$ sudo usermod -aG docker ${USER}
$ newgrp docker
```

### Step 3) Verify Docker is running on all the nodes

Once installed, the Docker daemon starts automatically. You can verify that the service is running by running the command:

```
$ sudo systemctl status docker
```

![Docker-Service-Status-Ubuntu-22-04][3]

Additionally, be sure to enable the Docker service so that it starts automatically on boot time.

```
$ sudo systemctl enable docker
```

### Step 4) Create Docker Swarm Cluster

The next step is to initialize the Docker Swarm on the Manager node. Once initialized, we will then add the worker nodes to the cluster.

To create a Docker Swarm Cluster, run the command:

```
$ sudo docker swarm init --advertise-addr 10.128.0.57
```

![Docker-Swarm-Init-Ubuntu-22-04][4]

Once Docker Swarm has been initialized, a command for joining the worker nodes to the cluster will be displayed on the terminal. Copy the command as you will need to run it on each of the worker nodes as previously mentioned.

Next, login back to each of the worker nodes and paste the command in order to join the cluster.

```
$ sudo docker swarm join --token SWMTKN-1-1k397e5o52cae0yipopqcu9werjcwuss1exbyj4635rrjjl723-7ocx56uhb7p1ri7h2u6ynxyno 10.128.0.57:2377
```

If all goes well, you should get the following output

Output

This node joined a swarm as a worker

![Docker-Swarm-Join-Worker-Nodes-Ubuntu][5]

Next, confirm that all the nodes have joined the cluster as follows.

```
$ sudo docker node ls
```

You should get the following output displaying all the nodes in the cluster.

![List-Nodes-in-docker-Swarm-Ubuntu][6]

### Step 5) Test Docker Swarm Installation

To test docker swarm installation, head over to the manager node and deploy a container application to the cluster. In this example, we are deploying an Nginx web server container and mapping it to port 8080 on the host.

```
$ sudo docker service create --name web-server --publish 8080:80 nginx:latest
```

![Nginx-Based-Service-docker-swarm][7]

Next, verify the status of the application service deployed.

```
$ sudo docker service ls
```

![List-Service-in-Docker-Swarm][8]

### Step 6) Create replicas of the service

Finally, create three replicas of the service and scale them across both the Docker manager and the worker nodes.

```
$ sudo docker service scale web-server=3
```

![Service-Scale-docker-Swarm][9]

Next, confirm the status of the replicas. This time around, you will notice that we have 3 replicas.

![Verify-Service-inDocker-Swarm][10]

At this point, Nginx web server container should be running across all the nodes in the cluster on port 8080. To confirm this, head over to your browser, and access the web server from all the nodes.

http://manager-node:8080

http://worker-node-1:8080

http://worker-node-2:8080

![Nginx-Sample-Page-Docker-Swarm-Service][11]

##### Conclusion 

In this guide, we managed to install and configure Docker Swarm. We also went a step further and deployed an application to the cluster and later scaled it across all the nodes in the cluster.

Read Also: 20 Useful Docker Command Examples in Linux

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-deploy-docker-swarm-on-ubuntu/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Install-docker-ce-apt-command-ubuntu.png
[2]: https://www.linuxtechi.com/create-sudo-user-on-rhel-rocky-linux-almalinux/
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Docker-Service-Status-Ubuntu-22-04.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Docker-Swarm-Init-Ubuntu-22-04.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Docker-Swarm-Join-Worker-Nodes-Ubuntu.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/09/List-Nodes-in-docker-Swarm-Ubuntu.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Nginx-Based-Service-docker-swarm.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/09/List-Service-in-Docker-Swarm.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Service-Scale-docker-Swarm.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Verify-Service-inDocker-Swarm.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Nginx-Sample-Page-Docker-Swarm-Service.png
