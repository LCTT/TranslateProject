Howto Configure Nginx as Rreverse Proxy / Load Balancer with Weave and Docker
================================================================================
Hi everyone today we'll learnHowto configure Nginx as Rreverse Proxy / Load balancer with Weave and Docker Weave creates a virtual network that connects Docker containers with each other, deploys across multiple hosts and enables their automatic discovery. It allows us to focus on developing our application, rather than our infrastructure. It provides such an awesome environment that the applications uses the network as if its containers were all plugged into the same network without need to configure ports, mappings, link, etc. The services of the application containers on the network can be easily accessible to the external world with no matter where its running. Here, in this tutorial we'll be using weave to quickly and easily deploy nginx web server as a load balancer for a simple php application running in docker containers on multiple nodes in Amazon Web Services. Here, we will be introduced to WeaveDNS, which provides a simple way for containers to find each other using hostname with no changes in codes and tells other containers to connect to those names.

Here, in this tutorial, we will use Nginx to load balance requests to a set of containers running Apache. Here are the simple and easy to do steps on using Weave to configure nginx as a load balancer running in ubuntu docker container.

### 1. Settting up AWS Instances ###

First of all, we'll need to setup Amazon Web Service Instances so that we can run docker containers with Weave and Ubuntu as Operating System. We will use the [AWS CLI][1] to setup and configure two AWS EC2 instances. Here, in this tutorial, we'll use the smallest available instances, t1.micro. We will need to have a valid **Amazon Web Services account** with AWS CLI setup and configured. We'll first gonna clone the repository of weave from the github by running the following command in AWS CLI.

    $ git clone http://github.com/fintanr/weave-gs
    $ cd weave-gs/aws-nginx-ubuntu-simple

After cloning the repository, we wanna run the script that will deploy two instances of t1.micro instance running Weave and Docker in Ubuntu Operating System.

    $ sudo ./demo-aws-setup.sh

Here, for this tutorial we'll need the IP addresses of these instances further in future. These are stored in an environment file weavedemo.env which is created during the execution of the demo-aws-setup.sh. To get those ip addresses, we need to run the following command which will give the output similar to the output below.

    $ cat weavedemo.env

    export WEAVE_AWS_DEMO_HOST1=52.26.175.175
    export WEAVE_AWS_DEMO_HOST2=52.26.83.141
    export WEAVE_AWS_DEMO_HOSTCOUNT=2
    export WEAVE_AWS_DEMO_HOSTS=(52.26.175.175 52.26.83.141)

Please note these are not the IP addresses for our tutorial, AWS dynamically allocate IP addresses to our instances.

As were are using a bash, we will just source this file  and execute it using the command below.

     . ./weavedemo.env

### 2. Launching Weave and WeaveDNS ###

After deploying the instances, we'll want to launch weave and weavedns on each hosts. Weave and weavedns allows us to easily deploy our containers to a new infrastructure and configuration without the need of changing the codes and without the need to understand concepts such as ambassador containers and links. Here are the commands to launch them in the first host.

    ssh -i weavedemo-key.pem ubuntu@$WEAVE_AWS_DEMO_HOST1
    $ sudo weave launch
    $ sudo weave launch-dns 10.2.1.1/24

Next, we'll also wanna launch them in our second host.

    ssh -i weavedemo-key.pem ubuntu@$WEAVE_AWS_DEMO_HOST2
    $ sudo weave launch $WEAVE_AWS_DEMO_HOST1
    $ sudo weave launch-dns 10.2.1.2/24

### 3. Launching Application Containers ###

Now, we wanna launch six containers across our two hosts running an Apache2 Web Server instance with our simple php site. So, we'll be running the following commands which will run 3 containers running Apache2 Web Server on our 1st instance.

    ssh -i weavedemo-key.pem ubuntu@$WEAVE_AWS_DEMO_HOST1
    $ sudo weave run --with-dns 10.3.1.1/24 -h ws1.weave.local fintanr/weave-gs-nginx-apache
    $ sudo weave run --with-dns 10.3.1.2/24 -h ws2.weave.local fintanr/weave-gs-nginx-apache
    $ sudo weave run --with-dns 10.3.1.3/24 -h ws3.weave.local fintanr/weave-gs-nginx-apache

After that, we'll again launch 3 containers running apache2 web server in our 2nd instance as shown below.

    ssh -i weavedemo-key.pem ubuntu@$WEAVE_AWS_DEMO_HOST2
    $ sudo weave run --with-dns 10.3.1.4/24 -h ws4.weave.local fintanr/weave-gs-nginx-apache
    $ sudo weave run --with-dns 10.3.1.5/24 -h ws5.weave.local fintanr/weave-gs-nginx-apache
    $ sudo weave run --with-dns 10.3.1.6/24 -h ws6.weave.local fintanr/weave-gs-nginx-apache

Note: Here, --with-dns option tells the container to use weavedns to resolve names and -h x.weave.local allows the host to be resolvable with WeaveDNS.

### 4. Launching Nginx Container ###

After our application containers are running well as expected, we'll wanna launch an nginx container which contains the nginx configuration which will round-robin across the severs for the reverse proxy or load balancing. To run the nginx container, we'll need to run the following command.

    ssh -i weavedemo-key.pem ubuntu@$WEAVE_AWS_DEMO_HOST1
    $ sudo weave run --with-dns 10.3.1.7/24 -ti -h nginx.weave.local -d -p 80:80 fintanr/weave-gs-nginx-simple

Hence, our Nginx container is publicly exposed as a http server on $WEAVE_AWS_DEMO_HOST1.

### 5. Testing the Load Balancer ###

To test our load balancer is working or not, we'll run a script that will make http requests to our nginx container. We'll make six requests so that we can see nginx moving through each of the webservers in round-robin turn.

    $ ./access-aws-hosts.sh

    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws1.weave.local",
    "date" : "2015-06-26 12:24:23"
    }
    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws2.weave.local",
    "date" : "2015-06-26 12:24:23"
    }
    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws3.weave.local",
    "date" : "2015-06-26 12:24:23"
    }
    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws4.weave.local",
    "date" : "2015-06-26 12:24:23"
    }
    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws5.weave.local",
    "date" : "2015-06-26 12:24:23"
    }
    {
    "message" : "Hello Weave - nginx example",
    "hostname" : "ws6.weave.local",
    "date" : "2015-06-26 12:24:23"
    }

### Conclusion ###

Finally, we've successfully configured nginx as a reverse proxy or load balancer with weave and docker running ubuntu server in AWS (Amazon Web Service) EC2 . From the above output in above step, it is clear that we have configured it correctly. We can see that the request is being sent to 6 application containers in round-robin turn which is running a PHP app hosted in apache web server. Here, weave and weavedns did great work to deploy a containerised PHP application using nginx across multiple hosts on AWS EC2 without need to change in codes and connected the containers to eachother with the hostname using weavedns. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/nginx-load-balancer-weave-docker/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://console.aws.amazon.com/