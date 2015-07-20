Translating by DongShuaike

How to Provision Swarm Clusters using Docker Machine
================================================================================
Hi all, today we'll learn how we can deploy Swarm Clusters using Docker Machine.  It serves the standard Docker API, so any tool which can communicate with a Docker daemon can use Swarm to transparently scale to multiple hosts. Docker Machine is an application that helps to create Docker hosts on our computer, on cloud providers and inside our own data center. It provides easy solution for creating servers, installing Docker on them and then configuring the Docker client according the users configuration and requirements. We can provision swarm clusters with any driver we need and is highly secured with TLS Encryption.

Here are some quick and easy steps on how to provision swarm clusters with Docker Machine.

### 1. Installing Docker Machine ###

Docker Machine supports awesome on every Linux Operating System. First of all, we'll need to download the latest version of Docker Machine from the Github site . Here, we'll use curl to download the latest version of Docker Machine ie 0.2.0 .

For 64 Bit Operating System

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-amd64 > /usr/local/bin/docker-machine

For 32 Bit Operating System

    # curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-i386 > /usr/local/bin/docker-machine

After downloading the latest release of Docker Machine, we'll make the file named docker-machine under /usr/local/bin/ executable using the command below.

    # chmod +x /usr/local/bin/docker-machine

After doing the above, we'll wanna ensure that we have successfully installed docker-machine. To check it, we can run the docker-machine -v which will give output of the version of docker-machine installed in our system.

    # docker-machine -v

![Installing Docker Machine](http://blog.linoxide.com/wp-content/uploads/2015/05/installing-docker-machine.png)

To enable Docker commands on our machines, make sure to install the Docker client as well by running the command below.

    # curl -L https://get.docker.com/builds/linux/x86_64/docker-latest > /usr/local/bin/docker
    # chmod +x /usr/local/bin/docker

### 2. Creating Machine ###

After installing Machine into our working PC or device, we'll wanna go forward to create a machine using Docker Machine. Here, in this tutorial we'll gonna deploy a machine in the Digital Ocean Platform so we'll gonna use "digitalocean" as its Driver API then, docker swarm will be running into that Droplet which will be further configured as Swarm Master and another droplet will be created which will be configured as Swarm Node Agent.

So, to create the machine, we'll need to run the following command.

    # docker-machine create --driver digitalocean --digitalocean-access-token <API-Token> linux-dev

**Note**: Here, linux-dev is the name of the machine we are wanting to create. <API-Token> is a security key which can be generated from the Digital Ocean Control Panel of the account holder of Digital Ocean Cloud Platform. To retrieve that key, we simply need to login to our Digital Ocean Control Panel then click on API, then click on Generate New Token and give it a name tick on both Read and Write. Then we'll get a long hex key, thats the <API-Token> now, simply replace it into the command above.

Now, to load the Machine configuration into the shell we are running the comamands, run the following command.

    # eval "$(docker-machine env linux-dev)"

![Docker Machine Digitalocean Cloud](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-digitalocean-cloud.png)

Then, we'll mark our machine as ACTIVE by running the below command.

    # docker-machine active linux-dev

Now, we'll check whether its been marked as ACTIVE "*" or not.

    # docker-machine ls

![Docker Machine Active List](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-active-list.png)

### 3. Running Swarm Docker Image ###

Now, after we finish creating the required machine. We'll gonna deploy swarm docker image in our active machine. This machine will run the docker image and will control over the Swarm master and node. To run the image, we can simply run the below command.

    # docker run swarm create

![Docker Machine Swarm Create](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-swarm-create.png)

If you are trying to run swarm docker image using **32 bit Operating System** in the computer where Docker Machine is running, we'll need to SSH into the Droplet.

    # docker-machine ssh
    #docker run swarm create
    #exit

### 4. Creating Swarm Master ###

Now, after our machine and swarm image is running into the machine, we'll now create a Swarm Master. This will also add the master as a node. To do so, here's the command below.

    # docker-machine create \
    -d digitalocean \
    --digitalocean-access-token <DIGITALOCEAN-TOKEN>
    --swarm \
    --swarm-master \
    --swarm-discovery token://<CLUSTER-ID> \
    swarm-master

![Docker Machine Swarm Master Create](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-swarm-master-create.png)

### 5. Creating Swarm Nodes ###

Now, we'll create a swarm node which will get connected with the Swarm Master. The command below will create a new droplet which will be named as swarm-node and will get connected with the Swarm Master as node. This will create a Swarm cluster across the two nodes.

    # docker-machine create \
    -d digitalocean \
    --digitalocean-access-token <DIGITALOCEAN-TOKEN>
    --swarm \
    --swarm-discovery token://<TOKEN-FROM-ABOVE> \
    swarm-node

![Docker Machine Swarm Nodes](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-machine-swarm-nodes.png)

### 6. Connecting to the Swarm Master ###

We, now connect to the Swarm Master so that we can deploy Docker containers across the nodes as per the requirement and configuration. To load the Swarm Master's Machine configuration into our environment, we can run the below command.

    # eval "$(docker-machine env --swarm swarm-master)"

After that, we can run the required containers of our choice across the nodes. Here, we'll check if everything went fine or not. So, we'll run **docker info** to check the information about the Swarm Clusters.

    # docker info

### Conclusion ###

We can pretty easily create Swarm Cluster with Docker Machine. This method is a lot productive because it reduces a lot of time of a system admin or users. In this article, we successfully provisioned clusters by creating a master and a node using a machine with Digital Ocean as driver. It can be created using any driver like VirtualBox, Google Cloud Computing, Amazon Web Service, Microsoft Azure and more according to the need and requirement of the user and the connection is highly secured with TLS Encryption. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/provision-swarm-clusters-using-docker-machine/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
