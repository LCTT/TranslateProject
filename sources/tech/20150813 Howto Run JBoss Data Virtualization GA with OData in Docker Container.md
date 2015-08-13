Howto Run JBoss Data Virtualization GA with OData in Docker Container
================================================================================
Hi everyone, today we'll learn how to run JBoss Data Virtualization 6.0.0.GA with OData in a Docker Container. JBoss Data Virtualization is a data supply and integration solution platform that transforms various scatered multiple sources data, treats them as single source and delivers the required data into actionable information at business speed to any applications or users. JBoss Data Virtualization can help us easily combine and transform data into reusable business friendly data models and make unified data easily consumable through open standard interfaces. It offers comprehensive data abstraction, federation, integration, transformation, and delivery capabilities to combine data from one or multiple sources into reusable for agile data utilization and sharing.For more information about JBoss Data Virtualization, we can check out [its official page][1]. Docker is an open source platform that provides an open platform to pack, ship and run any application as a lightweight container. Running JBoss Data Virtualization with OData in Docker Container makes us easy to handle and launch.

Here are some easy to follow tutorial on how we can run JBoss Data Virtualization  with OData in Docker Container.

### 1. Cloning the Repository ###

First of all, we'll wanna clone the repository of OData with Data Virtualization ie [https://github.com/jbossdemocentral/dv-odata-docker-integration-demo][2] using git command. As we have an Ubuntu 15.04 distribution of linux running in our machine. We'll need to install git initially using apt-get command.

    # apt-get install git

Then after installing git, we'll wanna clone the repository by running the command below.

    # git clone https://github.com/jbossdemocentral/dv-odata-docker-integration-demo

    Cloning into 'dv-odata-docker-integration-demo'...
    remote: Counting objects: 96, done.
    remote: Total 96 (delta 0), reused 0 (delta 0), pack-reused 96
    Unpacking objects: 100% (96/96), done.
    Checking connectivity... done.

### 2. Downloading JBoss Data Virtualization Installer ###

Now, we'll need to download JBoss Data Virtualization Installer from the Download Page ie [http://www.jboss.org/products/datavirt/download/][3] . After we download **jboss-dv-installer-6.0.0.GA-redhat-4.jar**, we'll need to keep it under the directory named **software**.

### 3. Building the Docker Image ###

Next, after we have downloaded the JBoss Data Virtualization installer, we'll then go for building the docker image using the Dockerfile and its resources we had just cloned from the repository.

    # cd dv-odata-docker-integration-demo/
    # docker build -t jbossdv600 .

    ...
    Step 22 : USER jboss
    ---> Running in 129f701febd0
    ---> 342941381e37
    Removing intermediate container 129f701febd0
    Step 23 : EXPOSE 8080 9990 31000
    ---> Running in 61e6d2c26081
    ---> 351159bb6280
    Removing intermediate container 61e6d2c26081
    Step 24 : CMD $JBOSS_HOME/bin/standalone.sh -c standalone.xml -b 0.0.0.0 -bmanagement 0.0.0.0
    ---> Running in a9fed69b3000
    ---> 407053dc470e
    Removing intermediate container a9fed69b3000
    Successfully built 407053dc470e

Note: Here, we assume that you have already installed docker and is running in your machine.

### 4. Starting the Docker Container ###

As we have built the Docker Image of JBoss Data Virtualization with oData, we'll now gonna run the docker container and expose its port with -P flag. To do so, we'll run the following command.

    # docker run -p 8080:8080 -d -t jbossdv600

    7765dee9cd59c49ca26850e88f97c21f46859d2dc1d74166353d898773214c9c

### 5. Getting the Container IP ###

After we have started the Docker Container, we'll wanna get the IP address of the running docker container. To do so, we'll run the docker inspect command followed by the running container id.

    # docker inspect <$containerID>

    ...
    "NetworkSettings": {
    "Bridge": "",
    "EndpointID": "3e94c5900ac5954354a89591a8740ce2c653efde9232876bc94878e891564b39",
    "Gateway": "172.17.42.1",
    "GlobalIPv6Address": "",
    "GlobalIPv6PrefixLen": 0,
    "HairpinMode": false,
    "IPAddress": "172.17.0.8",
    "IPPrefixLen": 16,
    "IPv6Gateway": "",
    "LinkLocalIPv6Address": "",
    "LinkLocalIPv6PrefixLen": 0,

### 6. Web Interface ###

Now, if everything went as expected as done above, we'll gonna see the login screen of JBoss Data Virtualization with oData when pointing our web browser to http://container-ip:8080/ and the JBoss Management from http://container-ip:9990. The Management credentials for username is admin and password is redhat1! whereas the Data virtualization credentials for username is user and password is user . After that, we can navigate the contents via the web interface.

**Note**: It is strongly recommended to change the password as soon as possible after the first login. Thanks :)

### Conclusion ###

Finally we've successfully run Docker Container running JBoss Data Virtualization with OData Multisource Virtual Database. JBoss Data Virtualization is really an awesome platform for the virtualization of data from different multiple source and transform them into reusable business friendly data models and produces data easily consumable through open standard interfaces. The deployment of JBoss Data Virtualization with OData Multisource Virtual Database has been very easy, secure and fast to setup with the Docker Technology. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/run-jboss-data-virtualization-ga-odata-docker-container/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.redhat.com/en/technologies/jboss-middleware/data-virtualization
[2]:https://github.com/jbossdemocentral/dv-odata-docker-integration-demo
[3]:http://www.jboss.org/products/datavirt/download/