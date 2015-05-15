Basic Networking Commands with Docker Containers
================================================================================
Hi everybody, today we'll learn some basic networking with Docker Containers. Docker is an Open Source project that provides an open platform to pack, ship and run any application as a lightweight container. It has no boundaries of Language support, Frameworks or packaging system and can be run anywhere, anytime from a small home computers to high-end servers. It makes them great building blocks for deploying and scaling web apps, databases, and back-end services without depending on a particular stack or provider. Docker is meant for networking as it is gradually used in data-centers, ISPs and much more networked servers.

So, here are some basic networking commands that you can use on managing Docker Containers.

### 1. Finding the Docker Interface ###

Docker by default creates a bridge interface named docker0 which basically connects with the outside world. The docker containers running is directly connected with the bridge interface docker0. By default, docker assigns ip address 172.17.42.1/16 to the bridge interface docker0 which acts as a subnet for all the ip addresses of the running containers. It is pretty easy to get the Docker Interface's IP Address. To find out our docker0 bridge interface and the docker containers connected with the bridge we can simply run ip a command inside a terminal or a shell where Docker is installed.

    # ip a

![Docker Interface](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-interface.png)

### 2. Getting the Docker Container's IP Address ###

As we read above, docker creates a bridge interface named docker0 in the host machine. As we create a new docker container, it is automatically assigned with a new dynamic IP Address by default which is followed within the subnet range of the interface. So, to check the IP Address of the running Docker container, we'll need to get into a running container and check out the ip address as shown below. First, we'll run a new container and get into the container. If you have got a container running already, you may skip the first command below.

    # docker run -it ubuntu

Now, we'll be able to run ip a in order to get the ip address of the running container.

    # ip a

![Docker Container IP](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-container-ip.png)

### 3. Mapping the Expose port ###

To map the exposed port configured in the Dockerfile for the container to the high port, we'll simply need to follow the docker command with -P flag. This will open the random port of the Docker Container to the port defined by the Dockerfile. So, here's an example of using the flag -P to open/expose the defined port.

    # docker run -itd -P httpd

![Mapping Expose Port](http://blog.linoxide.com/wp-content/uploads/2015/05/mapping-expose-port.png)

The above command will map container's port to port 80 as its defined in the Dockerfile of httpd. We can check the exposed port by viewing the running container using the following command.

    # docker ps

And can use curl to check by running the below command.

    # curl http://localhost:49153

![Curl Exposed Port](http://blog.linoxide.com/wp-content/uploads/2015/05/curl-exposed-port-e1431034586219.png)

### 4. Mapping to the Specific Port ###

We can also map the expose port or docker container port to the port we specify or define. In order to map the container to a specific port of our choice, we'll need to define the port of our desire with the flag -p . Here's an example on how we can do that.

    # docker run -itd -p 8080:80 httpd

The above command will map the port 8080 to port 80. We can check it by running curl to that port.

    # curl http://localhost:8080

![Mapping Specific Port](Curl Exposed Port)

### 5. Creating own Bridge ###

To assign a custom IP Address to the containers, we'll need to create a new bridge interface named bro in this tutorial. To assign a desired IP Address, we'll need to run the following command in the host machine running docker.

    # stop docker.io
    # ip link add br0 type bridge
    # ip addr add 172.30.1.1/20 dev br0
    # ip link set br0 up
    # docker -d -b br0

![Creating Bridge Interface](http://blog.linoxide.com/wp-content/uploads/2015/05/creating-bridge-interface.png)

After creating the docker bridge, we'll want to let the Docker Daemon know about it.

    # echo 'DOCKER_OPTS="-b=br0"' >> /etc/default/docker
    # service docker.io start

![Adding Interface to Docker](http://blog.linoxide.com/wp-content/uploads/2015/05/adding-interface-to-docker.png)

Here, the bridged interface will range the docker containers with the ip address followed by bridge ip subnet .

### 6. Linking one Container to another ###

We can connect one container with the another container with Docker. We can run different apps on different containers and connect or link with each other. Links allow containers to connect with each other and securely transfer information about one container to another container. To do so, we'll use the  --link flag. First, we'll use flag --name so that it will be easy to denote training/postgres image.

    # docker run -d --name db training/postgres

![Running db Container](http://blog.linoxide.com/wp-content/uploads/2015/05/running-db-container.png)

After done, we'll gonna link training/webapp with the container db that we create earlier forming a new container named web.

    # docker run -d -P --name web --link db:db training/webapp python app.py

![linking two containers](http://blog.linoxide.com/wp-content/uploads/2015/05/linking-two-containers.png)

### Conclusion ###

Networking with Docker is fun and amazing cause there are many stuffs we can do with Docker Containers. These were some easy and basic networking commands that we can play with Docker. Networking with docker is really advanced. We can do many stuffs with it. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/networking-commands-docker-containers/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/