Translating by qhwdw How to manage Linux containers with Ansible Container
============================================================

### Ansible Container addresses Dockerfile shortcomings and offers complete management for containerized projects.

![Ansible Container: A new way to manage containers](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/container-ship.png?itok=pqZYgQ7K "Ansible Container: A new way to manage containers")
Image by : opensource.com

I love containers and use the technology every day. Even so, containers aren't perfect. Over the past couple of months, however, a set of projects has emerged that addresses some of the problems I've experienced.

I started using containers with [Docker][11], since this project made the technology so popular. Aside from using the container engine, I learned how to use **[docker-compose][6]** and started managing my projects with it. My productivity skyrocketed! One command to run my project, no matter how complex it was. I was so happy.

After some time, I started noticing issues. The most apparent were related to the process of creating container images. The Docker tool uses a custom file format as a recipe to produce container images—Dockerfiles. This format is easy to learn, and after a short time you are ready to produce container images on your own. The problems arise once you want to master best practices or have complex scenarios in mind.

More on Ansible

*   [How Ansible works][1]

*   [Free Ansible eBooks][2]

*   [Ansible quick start video][3]

*   [Download and install Ansible][4]

Let's take a break and travel to a different land: the world of [Ansible][22]. You know it? It's awesome, right? You don't? Well, it's time to learn something new. Ansible is a project that allows you to manage your infrastructure by writing tasks and executing them inside environments of your choice. No need to install and set up any services; everything can easily run from your laptop. Many people already embrace Ansible.

Imagine this scenario: You invested in Ansible, you wrote plenty of Ansible roles and playbooks that you use to manage your infrastructure, and you are thinking about investing in containers. What should you do? Start writing container image definitions via shell scripts and Dockerfiles? That doesn't sound right.

Some people from the Ansible development team asked this question and realized that those same Ansible roles and playbooks that people wrote and use daily can also be used to produce container images. But not just that—they can be used to manage the complete lifecycle of containerized projects. From these ideas, the [Ansible Container][12] project was born. It utilizes existing Ansible roles that can be turned into container images and can even be used for the complete application lifecycle, from build to deploy in production.

Let's talk about the problems I mentioned regarding best practices in context of Dockerfiles. A word of warning: This is going to be very specific and technical. Here are the top three issues I have:

### 1\. Shell scripts embedded in Dockerfiles.

When writing Dockerfiles, you can specify a script that will be interpreted via **/bin/sh -c**. It can be something like:

```
RUN dnf install -y nginx
```

where RUN is a Dockerfile instruction and the rest are its arguments (which are passed to shell). But imagine a more complex scenario:

```
RUN set -eux; \
    \
# this "case" statement is generated via "update.sh"
    %%ARCH-CASE%%; \
    \
    url="https://golang.org/dl/go${GOLANG_VERSION}.${goRelArch}.tar.gz"; \
    wget -O go.tgz "$url"; \
    echo "${goRelSha256} *go.tgz" | sha256sum -c -; \
```

This one is taken from [the official golang image][13]. It doesn't look pretty, right?

### 2\. You can't parse Dockerfiles easily.

Dockerfiles are a new format without a formal specification. This is tricky if you need to process Dockerfiles in your infrastructure (e.g., automate the build process a bit). The only specification is [the code][14] that is part of **dockerd**. The problem is that you can't use it as a library. The easiest solution is to write a parser on your own and hope for the best. Wouldn't it be better to use some well-known markup language, such as YAML or JSON?

### 3\. It's hard to control.

If you are familiar with the internals of container images, you may know that every image is composed of layers. Once the container is created, the layers are stacked onto each other (like pancakes) using union filesystem technology. The problem is, that you cannot explicitly control this layering—you can't say, "here starts a new layer." You are forced to change your Dockerfile in a way that may hurt readability. The bigger problem is that a set of best practices has to be followed to achieve optimal results—newcomers have a really hard time here.

### Comparing Ansible language and Dockerfiles

The biggest shortcoming of Dockerfiles in comparison to Ansible is that Ansible, as a language, is much more powerful. For example, Dockerfiles have no direct concept of variables, whereas Ansible has a complete templating system (variables are just one of its features). Ansible contains a large number of modules that can be easily utilized, such as [**wait_for**][15], which can be used for service readiness checks—e.g., wait until a service is ready before proceeding. With Dockerfiles, everything is a shell script. So if you need to figure out service readiness, it has to be done with shell (or installed separately). The other problem with shell scripts is that, with growing complexity, maintenance becomes a burden. Plenty of people have already figured this out and turned those shell scripts into Ansible.

If you are interested in this topic and would like to know more, please come to [Open Source Summit][16] in Prague to see [my presentation][17] on Monday, Oct. 23, at 4:20 p.m. in Palmovka room.

 _Learn more in Tomas Tomecek's talk, [From Dockerfiles to Ansible Container][7], at [Open Source Summit EU][8], which will be held October 23-26 in Prague._ 



### About the author

 [![human](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/ja.jpeg?itok=4ATUEAbd)][18] Tomas Tomecek - Engineer. Hacker. Speaker. Tinker. Red Hatter. Likes containers, linux, open source, python 3, rust, zsh, tmux.[More about me][9]

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/dockerfiles-ansible-container

作者：[Tomas Tomecek ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tomastomecek
[1]:https://www.ansible.com/how-ansible-works?intcmp=701f2000000h4RcAAI
[2]:https://www.ansible.com/ebooks?intcmp=701f2000000h4RcAAI
[3]:https://www.ansible.com/quick-start-video?intcmp=701f2000000h4RcAAI
[4]:https://docs.ansible.com/ansible/latest/intro_installation.html?intcmp=701f2000000h4RcAAI
[5]:https://opensource.com/article/17/10/dockerfiles-ansible-container?imm_mid=0f9013&cmp=em-webops-na-na-newsltr_20171201&rate=Wiw_0D6PK_CAjqatYu_YQH0t1sNHEF6q09_9u3sYkCY
[6]:https://github.com/docker/compose
[7]:http://sched.co/BxIW
[8]:http://events.linuxfoundation.org/events/open-source-summit-europe
[9]:https://opensource.com/users/tomastomecek
[10]:https://opensource.com/user/175651/feed
[11]:https://opensource.com/tags/docker
[12]:https://www.ansible.com/ansible-container
[13]:https://github.com/docker-library/golang/blob/master/Dockerfile-debian.template#L14
[14]:https://github.com/moby/moby/tree/master/builder/dockerfile
[15]:http://docs.ansible.com/wait_for_module.html
[16]:http://events.linuxfoundation.org/events/open-source-summit-europe
[17]:http://events.linuxfoundation.org/events/open-source-summit-europe/program/schedule
[18]:https://opensource.com/users/tomastomecek
[19]:https://opensource.com/users/tomastomecek
[20]:https://opensource.com/users/tomastomecek
[21]:https://opensource.com/article/17/10/dockerfiles-ansible-container?imm_mid=0f9013&cmp=em-webops-na-na-newsltr_20171201#comments
[22]:https://opensource.com/tags/ansible
[23]:https://opensource.com/tags/containers
[24]:https://opensource.com/tags/ansible
[25]:https://opensource.com/tags/docker
[26]:https://opensource.com/tags/open-source-summit
