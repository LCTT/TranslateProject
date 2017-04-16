# Docker swarm mode - Adding worker nodes tutorial

Let us expand on what we started with CentOS 7.2 several weeks ago. In this [guide][1], we learned how to initiate and start the native clustering and orchestration functionality built into Docker 1.12\. But we only had our manager node and no other workers. Today, we will expand this.

I will show you how to add non-symmetrical nodes into the swarm, i.e. a [Fedora 24][2] that will sit alongside our CentOS box, and they will both participate in the cluster, with all the associated fancy loadbalancing and whatnot. Of course, this will not be trivial, and we will encounter some snags, and so it ought to be quite interesting. After me.

 ![Teaser](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-teaser-more.png) 

### Prerequisites

There are several things we need to do before we can successfully join additional nodes into the swarm. One, ideally, all nodes should be running the same version of Docker, and it should be at least 1.12 in order to support native orchestration. Like CentOS, Fedora does not have the latest built in its repo, so you will need to manually [add and install][3] the right software version, either manually or using the Docker repository, and then fix a few dependency conflicts. I have shown you how to do this with CentOS, and the exercise is identical.

Moreover, all your nodes will need to be able to communicate with one another. There will have to be routing and firewall rules in places so that the managers and workers can talk among them. Otherwise, you will not be able to join nodes into the swarm. The easiest way to work around problems is to temporarily flush firewall rules (iptables -F), but this may impair your security. Make sure you fully understand what you're doing, and that you create the right rules for your nodes and ports.

Error response from daemon: Timeout was reached before node was joined. The attempt to join the swarm will continue in the background. Use the "docker info" command to see the current swarm status of your node.

You need to have the same Docker images available on your hosts. In our previous tutorial, we created an Apache image, and you will need to do the same on your worker nodes, or distribute the created images. If you do not do that, you will encounter errors. If you need help setting up Docker, please read my [intro guide][4] and the [networking tutorial][5].

```
7vwdxioopmmfp3amlm0ulimcu   \_ websky.11   my-apache2:latest
localhost.localdomain   Shutdown   Rejected 7 minutes ago
"No such image: my-apache2:lat&"
```

### Let's get started

So we have our CentOS box up and running, and it's spawning containers successfully. You are able to connect to the services using host ports, and everything looks peachy. At the moment, your swarm only has the manager.

 ![Manager](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-manager.png) 

### Join workers

To add new nodes, you will need to use the join command. But you first need to discover what token, IP address and port you must provide on the worker nodes for them to authenticate correctly against the swarm manager. Then execute (on Fedora).

```
[root@localhost ~]# docker swarm join-token worker
To add a worker to this swarm, run the following command:

docker swarm join \
--token SWMTKN-1-0xvojvlza90nrbihu6gfu3qm34ari7lwnza ... \
192.168.2.100:2377
```

If you do not fix the firewall and routing rules, you will get timeout errors. If you've already joined the swarm, repeating the join command will create its own noise:

```
Error response from daemon: This node is already part of a swarm. Use "docker swarm leave" to leave this swarm and join another one.
```

If ever in doubt, you can leave the swarm and then try again:

```
[root@localhost ~]# docker swarm leave
Node left the swarm.

docker swarm join --token
SWMTKN-1-0xvojvlza90nrbihu6gfu3qnza4 ... 192.168.2.100:2377
This node joined a swarm as a worker.
```

On the worker node, you can use docker info to check the status:

```
Swarm: active
NodeID: 2i27v3ce9qs2aq33nofaon20k
Is Manager: false
Node Address: 192.168.2.103

Likewise, on the manager:

Swarm: active
NodeID: cneayene32jsb0t2inwfg5t5q
Is Manager: true
ClusterID: 8degfhtsi7xxucvi6dxvlx1n4
Managers: 1
Nodes: 3
Orchestration:
Task History Retention Limit: 5
Raft:
Snapshot Interval: 10000
Heartbeat Tick: 1
Election Tick: 3
Dispatcher:
Heartbeat Period: 5 seconds
CA Configuration:
Expiry Duration: 3 months
Node Address: 192.168.2.100
```

### Create or scale services

Now, we need to see if and how Docker distributes the containers between the nodes. My testing shows a rather simplistic balancing algorithm under very light load. Once or twice, Docker did not try to re-distribute running services to new workers, even after I tried to scale and update them. Likewise, on one occasion, it created a new service entirely on the worker node. Maybe it was the best choice.

 ![Scale service](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-scale-service.png) 

 ![Service ls](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-service-list.png) 

 ![Services ls, more](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-service-list-more.png) 

 ![New service](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-new-service.png) 

New service created entirely on the worker node.

After a while, there was some re-distribution of containers for existing services between the two, but it took some time. New services worked fine. This is an early observation only, so I cannot say much more at this point. For now, this is a good starting point to begin exploring and tweaking.

 ![Service distributed](http://www.dedoimedo.com/images/computers-years/2016-2/docker-swarm-distributed.png) 

Load balancing kicks in after a while.

### Conclusion

Docker is a neat little beast, and it will only continue to grow bigger, more complex, more powerful, and of course, more elegant. It is only a matter of time before it gets eaten by a big, juicy enterprise. When it comes to its native orchestration, the swarm mode works quite well, but it takes more than just a few containers to fully tap into the power of its algorithms and scalability.

My tutorial shows how to add a Fedora node to a cluster run by a CentOS box, and the two worked fine side by side. There are some questions around the loadbalancing, but this is something I will explore in future articles. All in all, I hope this was a worthwhile lesson. We've tackled some prerequisites and common problems that you might encounter when trying to setup a swarm, we fired up a bunch of containers, and we even briefly touched on how to scale and distribute the services. And remember, 'tis is just a beginning.

Cheers.

--------------------------------------------------------------------------------

作者简介：

My name is Igor Ljubuncic. I'm more or less 38 of age, married with no known offspring. I am currently working as a Principal Engineer with a cloud technology company, a bold new frontier. Until roughly early 2015, I worked as the OS Architect with an engineering computing team in one of the largest IT companies in the world, developing new Linux-based solutions, optimizing the kernel and hacking the living daylights out of Linux. Before that, I was a tech lead of a team designing new, innovative solutions for high-performance computing environments. Some other fancy titles include Systems Expert and System Programmer and such. All of this used to be my hobby, but since 2008, it's a paying job. What can be more satisfying than that?

From 2004 until 2008, I used to earn my bread by working as a physicist in the medical imaging industry. My work expertise focused on problem solving and algorithm development. To this end, I used Matlab extensively, mainly for signal and image processing. Furthermore, I'm certified in several major engineering methodologies, including MEDIC Six Sigma Green Belt, Design of Experiment, and Statistical Engineering.

I also happen to write books, including high fantasy and technical work on Linux; mutually inclusive.

Please see my full list of open-source projects, publications and patents, just scroll down.

For a complete list of my awards, nominations and IT-related certifications, hop yonder and yonder please.


-------------


via: http://www.dedoimedo.com/computers/docker-swarm-adding-worker-nodes.html

作者：[Igor Ljubuncic][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.dedoimedo.com/faq.html
[1]:http://www.dedoimedo.com/computers/docker-swarm-intro.html
[2]:http://www.dedoimedo.com/computers/fedora-24-gnome.html
[3]:http://www.dedoimedo.com/computers/docker-centos-upgrade-latest.html
[4]:http://www.dedoimedo.com/computers/docker-guide.html
[5]:http://www.dedoimedo.com/computers/docker-networking.html
