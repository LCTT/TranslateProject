Getting Started to Calico Virtual Private Networking on Docker
================================================================================
Calico is a free and open source software for virtual networking in data centers. It is a pure Layer 3 approach to highly scalable datacenter for cloud virtual networking. It seamlessly integrates with cloud orchestration system such as openstack, docker clusters in order to enable secure IP communication between virtual machines and containers. It implements a highly productive vRouter in each node that takes advantage of the existing Linux kernel forwarding engine. Calico works in such an awesome technology that it has the ability to peer directly with the data center’s physical fabric whether L2 or L3, without the NAT, tunnels on/off ramps, or overlays. Calico makes full utilization of docker to run its containers in the nodes which makes it multi-platform and very easy to ship, pack and deploy. Calico has the following salient features out of the box.

- It can scale tens of thousands of servers and millions of workloads.
- Calico is easy to deploy, operate and diagnose.
- It is open source software licensed under Apache License version 2 and uses open standards.
- It supports container, virtual machines and bare metal workloads.
- It supports both IPv4 and IPv6 internet protocols.
- It is designed internally to support rich, flexible and secure network policy.

In this tutorial, we'll perform a virtual private networking between two nodes running Calico in them with Docker Technology. Here are some easy steps on how we can do that.

### 1. Installing etcd ###

To get started with the calico virtual private networking, we'll need to have a linux machine running etcd. As CoreOS comes preinstalled and preconfigured with etcd, we can use CoreOS but if we want to configure Calico in other linux distributions, then we'll need to setup it in our machine. As we are running Ubuntu 14.04 LTS, we'll need to first install and configure etcd in our machine. To install etcd in our Ubuntu box, we'll need to add the official ppa repository of Calico by running the following command in the machine which we want to run etcd server. Here, we'll be installing etcd in our 1st node.

    # apt-add-repository ppa:project-calico/icehouse

    The primary source of Ubuntu packages for Project Calico based on OpenStack Icehouse, an open source solution for virtual networking in cloud data centers. Find out more at http://www.projectcalico.org/
    More info: https://launchpad.net/~project-calico/+archive/ubuntu/icehouse
    Press [ENTER] to continue or ctrl-c to cancel adding it
    gpg: keyring `/tmp/tmpi9zcmls1/secring.gpg' created
    gpg: keyring `/tmp/tmpi9zcmls1/pubring.gpg' created
    gpg: requesting key 3D40A6A7 from hkp server keyserver.ubuntu.com
    gpg: /tmp/tmpi9zcmls1/trustdb.gpg: trustdb created
    gpg: key 3D40A6A7: public key "Launchpad PPA for Project Calico" imported
    gpg: Total number processed: 1
    gpg: imported: 1 (RSA: 1)
    OK

Then, we'll need to edit /etc/apt/preferences and make changes to prefer Calico-provided packages for Nova and Neutron.

    # nano /etc/apt/preferences

We'll need to add the following lines into it.

    Package: *
    Pin: release o=LP-PPA-project-calico-*
    Pin-Priority: 100

![Calico PPA Config](http://blog.linoxide.com/wp-content/uploads/2015/10/calico-ppa-config.png)

Next, we'll also need to add the official BIRD PPA for Ubuntu 14.04 LTS so that bugs fixes are installed before its available on the Ubuntu repo.

    # add-apt-repository ppa:cz.nic-labs/bird

    The BIRD Internet Routing Daemon PPA (by upstream & .deb maintainer)
    More info: https://launchpad.net/~cz.nic-labs/+archive/ubuntu/bird
    Press [ENTER] to continue or ctrl-c to cancel adding it
    gpg: keyring `/tmp/tmphxqr5hjf/secring.gpg' created
    gpg: keyring `/tmp/tmphxqr5hjf/pubring.gpg' created
    gpg: requesting key F9C59A45 from hkp server keyserver.ubuntu.com
    apt-ggpg: /tmp/tmphxqr5hjf/trustdb.gpg: trustdb created
    gpg: key F9C59A45: public key "Launchpad Datov� schr�nky" imported
    gpg: Total number processed: 1
    gpg: imported: 1 (RSA: 1)
    OK

Now, after the PPA jobs are done, we'll now gonna update the local repository index and then install etcd in our machine.

    # apt-get update

To install etcd in our ubuntu machine, we'll gonna run the following apt command.

    # apt-get install etcd python-etcd

### 2. Starting Etcd ###

After the installation is complete, we'll now configure the etcd configuration file. Here, we'll edit **/etc/init/etcd.conf** using a text editor and append the line exec **/usr/bin/etcd** and make it look like below configuration.

    # nano /etc/init/etcd.conf
    exec /usr/bin/etcd --name="node1" \
    --advertise-client-urls="http://10.130.65.71:2379,http://10.130.65.71:4001" \
    --listen-client-urls="http://0.0.0.0:2379,http://0.0.0.0:4001" \
    --listen-peer-urls "http://0.0.0.0:2380" \
    --initial-advertise-peer-urls "http://10.130.65.71:2380" \
    --initial-cluster-token $(uuidgen) \
    --initial-cluster "node1=http://10.130.65.71:2380" \
    --initial-cluster-state "new"

![Configuring ETCD](http://blog.linoxide.com/wp-content/uploads/2015/10/configuring-etcd.png)

**Note**: In the above configuration, we'll need to replace 10.130.65.71 and node-1 with the private ip address and hostname of your etcd server box. After done with editing, we'll need to save and exit the file.

We can get the private ip address of our etcd server by running the following command.

    # ifconfig

![ifconfig](http://blog.linoxide.com/wp-content/uploads/2015/10/ifconfig1.png)

As our etcd configuration is done, we'll now gonna start our etcd service in our Ubuntu node. To start etcd daemon, we'll gonna run the following command.

    # service etcd start

After done, we'll have a check if etcd is really running or not. To ensure that, we'll need to run the following command.

    # service etcd status

### 3. Installing Docker ###

Next, we'll gonna install Docker in both of our nodes running Ubuntu. To install the latest release of docker, we'll simply need to run the following command.

    # curl -sSL https://get.docker.com/ | sh

![Docker Engine Installation](http://blog.linoxide.com/wp-content/uploads/2015/10/docker-engine-installation.png)

After the installation is completed, we'll gonna start the docker daemon in-order to make sure that its running before we move towards Calico.

    # service docker restart

    docker stop/waiting
    docker start/running, process 3056

### 3. Installing Calico ###

We'll now install calico in our linux machine in-order to run the calico containers. We'll need to install Calico in every node which we're wanting to connect into the Calico network. To install Calico, we'll need to run the following command under root or sudo permission.

#### On 1st Node ####

    # wget https://github.com/projectcalico/calico-docker/releases/download/v0.6.0/calicoctl

    --2015-09-28 12:08:59-- https://github.com/projectcalico/calico-docker/releases/download/v0.6.0/calicoctl
    Resolving github.com (github.com)... 192.30.252.129
    Connecting to github.com (github.com)|192.30.252.129|:443... connected.
    ...
    Resolving github-cloud.s3.amazonaws.com (github-cloud.s3.amazonaws.com)... 54.231.9.9
    Connecting to github-cloud.s3.amazonaws.com (github-cloud.s3.amazonaws.com)|54.231.9.9|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 6166661 (5.9M) [application/octet-stream]
    Saving to: 'calicoctl'
    100%[=========================================>] 6,166,661 1.47MB/s in 6.7s
    2015-09-28 12:09:08 (898 KB/s) - 'calicoctl' saved [6166661/6166661]

    # chmod +x calicoctl

After done with making it executable, we'll gonna make the binary calicoctl available as the command in any directory. To do so, we'll need to run the following command.

    # mv calicoctl /usr/bin/

#### On 2nd Node ####

    # wget https://github.com/projectcalico/calico-docker/releases/download/v0.6.0/calicoctl

    --2015-09-28 12:09:03-- https://github.com/projectcalico/calico-docker/releases/download/v0.6.0/calicoctl
    Resolving github.com (github.com)... 192.30.252.131
    Connecting to github.com (github.com)|192.30.252.131|:443... connected.
    ...
    Resolving github-cloud.s3.amazonaws.com (github-cloud.s3.amazonaws.com)... 54.231.8.113
    Connecting to github-cloud.s3.amazonaws.com (github-cloud.s3.amazonaws.com)|54.231.8.113|:443... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 6166661 (5.9M) [application/octet-stream]
    Saving to: 'calicoctl'
    100%[=========================================>] 6,166,661 1.47MB/s in 5.9s
    2015-09-28 12:09:11 (1022 KB/s) - 'calicoctl' saved [6166661/6166661]

    # chmod +x calicoctl

After done with making it executable, we'll gonna make the binary calicoctl available as the command in any directory. To do so, we'll need to run the following command.

    # mv calicoctl /usr/bin/

Likewise, we'll need to execute the above commands to install in every other nodes.

### 4. Starting Calico services ###

After we have installed calico on each of our nodes, we'll gonna start our Calico services. To start the calico services, we'll need to run the following commands.

#### On 1st Node ####

    # calicoctl node

    WARNING: Unable to detect the xt_set module. Load with `modprobe xt_set`
    WARNING: Unable to detect the ipip module. Load with `modprobe ipip`
    No IP provided. Using detected IP: 10.130.61.244
    Pulling Docker image calico/node:v0.6.0
    Calico node is running with id: fa0ca1f26683563fa71d2ccc81d62706e02fac4bbb08f562d45009c720c24a43

#### On 2nd Node ####

Next, we'll gonna export a global variable in order to connect our calico nodes to the same etcd server which is hosted in node1 in our case. To do so, we'll need to run the following command in each of our nodes.

    # export ETCD_AUTHORITY=10.130.61.244:2379

Then, we'll gonna run calicoctl container in our every our second node.

    # calicoctl node

    WARNING: Unable to detect the xt_set module. Load with `modprobe xt_set`
    WARNING: Unable to detect the ipip module. Load with `modprobe ipip`
    No IP provided. Using detected IP: 10.130.61.245
    Pulling Docker image calico/node:v0.6.0
    Calico node is running with id: 70f79c746b28491277e28a8d002db4ab49f76a3e7d42e0aca8287a7178668de4

This command should be executed in every nodes in which we want to start our Calico services. The above command start a container in the respective node. To check if the container is running or not, we'll gonna run the following docker command.

    # docker ps

![Docker Running Containers](http://blog.linoxide.com/wp-content/uploads/2015/10/docker-running-containers.png)

If we see the output something similar to the output shown below then we can confirm that Calico containers are up and running.

### 5. Starting Containers ###

Next, we'll need to start few containers in each of our nodes running Calico services. We'll assign a different name to each of the containers running ubuntu. Here, workload-A, workload-B, etc has been assigned as the unique name for each of the containers. To do so, we'll need to run the following command.

#### On 1st Node ####

    # docker run --net=none --name workload-A -tid ubuntu

    Unable to find image 'ubuntu:latest' locally
    latest: Pulling from library/ubuntu
    ...
    91e54dfb1179: Already exists
    library/ubuntu:latest: The image you are pulling has been verified. Important: image verification is a tech preview feature and should not be relied on to provide security.
    Digest: sha256:73fbe2308f5f5cb6e343425831b8ab44f10bbd77070ecdfbe4081daa4dbe3ed1
    Status: Downloaded newer image for ubuntu:latest
    a1ba9105955e9f5b32cbdad531cf6ecd9cab0647d5d3d8b33eca0093605b7a18

    # docker run --net=none --name workload-B -tid ubuntu

    89dd3d00f72ac681bddee4b31835c395f14eeb1467300f2b1b9fd3e704c28b7d

#### On 2nd Node ####

    # docker run --net=none --name workload-C -tid ubuntu

    Unable to find image 'ubuntu:latest' locally
    latest: Pulling from library/ubuntu
    ...
    91e54dfb1179: Already exists
    library/ubuntu:latest: The image you are pulling has been verified. Important: image verification is a tech preview feature and should not be relied on to provide security.
    Digest: sha256:73fbe2308f5f5cb6e343425831b8ab44f10bbd77070ecdfbe4081daa4dbe3ed1
    Status: Downloaded newer image for ubuntu:latest
    24e2d5d7d6f3990b534b5643c0e483da5b4620a1ac2a5b921b2ba08ebf754746

    # docker run --net=none --name workload-D -tid ubuntu

    c6f28d1ab8f7ac1d9ccc48e6e4234972ed790205c9ca4538b506bec4dc533555

Similarly, if we have more nodes, we can run ubuntu docker container into it by running the above command with assigning a different container name.

### 6. Assigning IP addresses ###

After we have got our docker containers running in each of our hosts, we'll go for adding a networking support to the containers. Now, we'll gonna assign a new ip address to each of the containers using calicoctl. This will add a new network interface to the containers with the assigned ip addresses. To do so, we'll need to run the following commands in the hosts running the containers.

#### On 1st Node ####

    # calicoctl container add workload-A 192.168.0.1
    # calicoctl container add workload-B 192.168.0.2

#### On 2nd Node ####

    # calicoctl container add workload-C 192.168.0.3
    # calicoctl container add workload-D 192.168.0.4

### 7. Adding Policy Profiles ###

After our containers have got networking interfaces and ip address assigned, we'll now need to add policy profiles to enable networking between the containers each other. After adding the profiles, the containers will be able to communicate to each other only if they have the common profiles assigned. That means, if they have different profiles assigned, they won't be able to communicate to eachother. So, before being able to assign. we'll need to first create some new profiles. That can be done in either of the hosts. Here, we'll run the following command in 1st Node.

    # calicoctl profile add A_C

    Created profile A_C

    # calicoctl profile add B_D

    Created profile B_D

After the profile has been created, we'll simply add our workload to the required profile. Here, in this tutorial, we'll place workload A and workload C in a common profile A_C and workload B and D in a common profile B_D. To do so, we'll run the following command in our hosts.

#### On 1st Node ####

    # calicoctl container workload-A profile append A_C
    # calicoctl container workload-B profile append B_D

#### On 2nd Node ####

    # calicoctl container workload-C profile append A_C
    # calicoctl container workload-D profile append B_D

### 8. Testing the Network ###

After we've added a policy profile to each of our containers using Calicoctl, we'll now test whether our networking is working as expected or not. We'll take a node and a workload and try to communicate with the other containers running in same or different nodes. And due to the profile, we should be able to communicate only with the containers having a common profile. So, in this case, workload A should be able to communicate with only C and vice versa whereas workload A shouldn't be able to communicate with B or D. To test the network, we'll gonna ping the containers having common profiles from the 1st host running workload A and B.

We'll first ping workload-C  having ip 192.168.0.3 using workload-A as shown below.

    # docker exec workload-A ping -c 4 192.168.0.3

Then, we'll ping workload-D having ip 192.168.0.4 using workload-B as shown below.

    # docker exec workload-B ping -c 4 192.168.0.4

![Ping Test Success](http://blog.linoxide.com/wp-content/uploads/2015/10/ping-test-success.png)

Now, we'll check if we're able to ping the containers having different profiles. We'll now ping workload-D having ip address 192.168.0.4 using workload-A.

    # docker exec workload-A ping -c 4 192.168.0.4

After done, we'll try to ping workload-C having ip address 192.168.0.3 using workload-B.

    # docker exec workload-B ping -c 4 192.168.0.3

![Ping Test Failed](http://blog.linoxide.com/wp-content/uploads/2015/10/ping-test-failed.png)

Hence, the workloads having same profiles could ping each other whereas having different profiles couldn't ping to each other.

### Conclusion ###

Calico is an awesome project providing an easy way to configure a virtual network using the latest docker technology. It is considered as a great open source solution for virtual networking in cloud data centers. Calico is being experimented by people in different cloud platforms like AWS, DigitalOcean, GCE and more these days. As Calico is currently under experiment, its stable version hasn't been released yet and is still in pre-release. The project consists a well documented documentations, tutorials and manuals in their [official documentation site][2].

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/calico-virtual-private-networking-docker/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://docs.projectcalico.org/