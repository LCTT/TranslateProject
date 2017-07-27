THE BEST WAY TO LEARN DOCKER FOR FREE: PLAY-WITH-DOCKER (PWD)
============================================================


Last year at the Distributed System Summit in Berlin, Docker captains[ Marcos Nils][15] and[ Jonathan Leibiusky][16] started hacking on an in-browser solution to help people learn Docker. A few days later, [Play-with-docker][17] (PWD) was born. 

PWD is a Docker playground which allows users to run Docker commands in a matter of seconds. It gives the experience of having a free Alpine Linux Virtual Machine in browser, where you can build and run Docker containers and even create clusters in[ Docker Swarm Mode][18]. Under the hood Docker-in-Docker (DinD) is used to give the effect of multiple VMs/PCs. In addition to the playground, PWD also includes a training site composed of a large set of Docker labs and quizzes from beginner to advanced level available at [training.play-with-docker.com][19].

In case you missed it, Marcos and Jonathan presented PWD during the last DockerCon Moby Cool Hack session. Watch the video below for a deep dive into the infrastructure and roadmaps.


Over the past few months, the Docker team has been working closely with Marcos, Jonathan and other active members of the Docker community to add new features to the project and Docker labs to the training section.

### PWD: the Playground

Here is a quick recap of what’s new with the Docker playground:

##### 1\.     PWD Docker Machine driver and SSH

As PWD success grew, the community started to ask if they could use PWD to run their own Docker workshops and trainings. So one of the first improvements made to the project was the creation of [PWD Docker machine driver][20], which allows users to create and manage their PWD hosts easily through their favorite terminal including the option to use ssh related commands. Here is how it works:

![Play With Docker](https://i2.wp.com/blog.docker.com/wp-content/uploads/ssh.gif?zoom=1.5625&resize=710%2C446&ssl=1)

##### 2\.     Adding support for file upload

Another cool feature brought to you by Marcos and Jonathan is the ability to upload your Dockerfile directly into your PWD windows with a simple drag and drop of your file in your PWD instance.

![](https://i0.wp.com/blog.docker.com/wp-content/uploads/pwd_upload-1.gif?zoom=1.5625&resize=710%2C406&ssl=1)

##### 3\.     Templated session

In addition to file upload, PWD also has a feature which lets you spin up a 5 nodes swarm in a matter of seconds using predefined templates.

##### 
![Play with Docker](https://i1.wp.com/blog.docker.com/wp-content/uploads/templated-session-1.gif?zoom=1.5625&resize=710%2C412&ssl=1)

##### 4\.      Showcasing your applications with Docker in a single click

Another cool feature that comes with PWD is its embeddable button that you can use in your sites to set up a PWD environment and deploy a compose stack right away and a [chrome extension][21] that adds the “Try in PWD” button to the most popular images in DockerHub. Here’s a short demo of the extension in action:

 ![Play with Docker](https://lh5.googleusercontent.com/FqIHfES8KdNCY7YT9fZb5DbL7WYq6Qwb30RgubXix2x2ImJkaHrsEBZbb4rAxilhxgNmu56cQWZHiAbft3ox_T7UXn5oQRtRuxjrFhqRSiSXwFRJcLq6cWiAyg-pFddiJIVs0rY) 

### PWD: the Training Site

 A number of new labs are available on [training.play-with-docker.com][22]. Some notable highlights include two labs that were originally hands-on labs from DockerCon in Austin, and a couple that highlight new features that are stable in Docker 17.06CE:

*   [Docker Networking Hands-on Lab][1]

*   [Docker Orchstration Hands-on Lab][2]

*   [Multi-stage builds][3]

*   [Docker swarm config files][4]

All in all, there are now 36 labs, with more being added all the time. If you want to contribute a lab, check out the [GitHub repo][23] and get started.

### PWD: the Use Cases

With the traffic to the site and the feedback we’ve received, it’s fair to say that PWD has a lot of traction right now. Here are some of the most common use-cases:

*   Try new features fast as it’s updated with the latest dev versions.

*   Set up clusters in no-time and launch replicated services.

*   Learn through it’s interactive tutorials: [training.play-with-docker.com][5].

*   Give presentations at conferences and meetups.

*   Allow to run advanced workshops that’d usually require complex setups, such as Jérôme’s [advanced Docker Orchestration workshop][6]

*   Collaborate with community members to diagnose and detect issues.

Get involved with PWD:

*   Contribute to [PWD by submitting PRs][7]

*   Contribute to the [PWD training site][8]

--------------------------------------------------------------------------------

作者简介;

Victor is the Sr. Community Marketing Manager at Docker, Inc. He likes fine wines, chess and soccer in no particular order. Victor tweets at @vcoisne.



--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/07/best-way-learn-docker-free-play-docker-pwd/

作者：[Victor ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/victor_c/
[1]:http://training.play-with-docker.com/docker-networking-hol/
[2]:http://training.play-with-docker.com/orchestration-hol/
[3]:http://training.play-with-docker.com/multi-stage/
[4]:http://training.play-with-docker.com/swarm-config/
[5]:http://training.play-with-docker.com/
[6]:https://github.com/docker/labs/tree/master/Docker-Orchestration
[7]:https://github.com/play-with-docker/
[8]:https://github.com/play-with-docker/training
[9]:https://blog.docker.com/author/victor_c/
[10]:https://blog.docker.com/tag/docker-labs/
[11]:https://blog.docker.com/tag/docker-training/
[12]:https://blog.docker.com/tag/docker-workshops/
[13]:https://blog.docker.com/tag/play-with-docker/
[14]:https://blog.docker.com/tag/pwd/
[15]:https://www.twitter.com/marcosnils
[16]:https://www.twitter.com/xetorthio
[17]:http://play-with-docker.com/
[18]:https://docs.docker.com/engine/swarm/
[19]:http://training.play-with-docker.com/
[20]:https://github.com/play-with-docker/docker-machine-driver-pwd/releases/tag/v0.0.5
[21]:https://chrome.google.com/webstore/detail/play-with-docker/kibbhpioncdhmamhflnnmfonadknnoan
[22]:http://training.play-with-docker.com/
[23]:https://github.com/play-with-docker/play-with-docker.github.io
