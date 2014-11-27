How to install Docker on CentOS 7
================================================================================
Docker is an open-source tool that makes creating & managing **Linux containers(LXC)** easy. Containers are like lightweight VMs which can be started & stopped in milliseconds. Dockers help the system admin & coders to develop their application in a container and can further scale up to 1000 of nodes.

The main difference between container and VM(Virtual machine) is that dockers provide **process based isolation** , whereas VM provides full isolation of resources. Virtual machine takes a minute to start where as container can be started in a second or less than a second. Container uses the Kernel of host OS , whereas VM uses the separate Kernel.

One of the limitation of Docker is that it can be used only on **64bit hosts** OS.

In this post we will discuss how to install docker in CentOS 7.x

### Installation of Docker on CentOS 7 ###

Docker package is included in the default CentOS-Extras repository. So to install docker , simply run below yum command :

    [root@localhost ~]# yum install docker

### Start the Docker Service ###

Once the Installation is finished , start docker service and enable it at boot using below commands

    [root@localhost ~]# service docker start
    [root@localhost ~]# chkconfig docker on

**Download the official Centos images Locally**

    [root@localhost ~]# docker pull centos
    Pulling repository centos
    192178b11d36: Download complete 
    70441cac1ed5: Download complete 
    ae0c2d0bdc10: Download complete 
    511136ea3c5a: Download complete 
    5b12ef8fd570: Download complete

**Verify CentOS images that have been fetched :**

    [root@localhost ~]# docker images centos
    REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
    centos              centos5             192178b11d36        2 weeks ago         466.9 MB
    centos              centos6             70441cac1ed5        2 weeks ago         215.8 MB
    centos              centos7             ae0c2d0bdc10        2 weeks ago         224 MB
    centos              latest              ae0c2d0bdc10        2 weeks ago         224 MB

**Run a Docker Container :**

    [root@localhost ~]# docker run -i -t centos /bin/bash
    [root@dbf66395436d /]#

As we can see centos container has been started and we got the bash shell. In docker command we have used options like ‘-i attaches stdin and stdout’ and ‘-t allocates a terminal or console’ . To disconnect from container type exit .

    [root@cd05639b3f5c /]# cat /etc/redhat-release 
    CentOS Linux release 7.0.1406 (Core) 
    [root@cd05639b3f5c /]# exit
    exit
    [root@localhost ~]#

We can also search Containers based on fedora & ubuntu OS. 

    [root@localhost ~]# docker search ubuntu
    [root@localhost ~]# docker search fedora

**Display the list of running containers **

![](http://www.linuxtechi.com/wp-content/uploads/2014/11/docker-ps.png)

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/install-docker-on-centos-7/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/