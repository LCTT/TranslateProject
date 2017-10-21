translating---geekpi

Why Use Docker with R? A DevOps Perspective
============================================================

 [![opencpu logo](https://i1.wp.com/www.opencpu.org/images/stockplot.png?w=456&ssl=1)][11] 

There have been several blog posts going around about why one would use Docker with R.
In this post I’ll try to add a DevOps point of view and explain how containerizing
R is used in the context of the OpenCPU system for building and deploying R servers.

> Has anyone in the [#rstats][2] world written really well about the *why* of their use of Docker, as opposed to the the *how*?
> 
> — Jenny Bryan (@JennyBryan) [September 29, 2017][3]

### 1: Easy Development

The flagship of the OpenCPU system is the [OpenCPU server][12]:
a mature and powerful Linux stack for embedding R in systems and applications.
Because OpenCPU is completely open source we can build and ship on DockerHub. A ready-to-go linux server with both OpenCPU and RStudio
can be started using the following (use port 8004 or 80):

```
docker run -t -p 8004:8004 opencpu/rstudio

```

Now simply open [http://localhost:8004/ocpu/][13] and
[http://localhost:8004/rstudio/][14] in your browser!
Login via rstudio with user: `opencpu` (passwd: `opencpu`) to build or install apps.
See the [readme][15] for more info.

Docker makes it easy to get started with OpenCPU. The container gives you the full
flexibility of a Linux box, without the need to install anything on your system.
You can install packages or apps via rstudio server, or use `docker exec` to a
root shell on the running server:

```
# Lookup the container ID
docker ps

# Drop a shell
docker exec -i -t eec1cdae3228 /bin/bash

```

From the shell you can install additional software in the server, customize the apache2 httpd
config (auth, proxies, etc), tweak R options, optimize performance by preloading data or
packages, etc.

### 2: Shipping and Deployment via DockerHub

The most powerful use if Docker is shipping and deploying applications via DockerHub. To create a fully standalone
application container, simply use a standard [opencpu image][16]
and add your app.

For the purpose of this blog post I have wrapped up some of the [example apps][17] as docker containers by adding a very simple `Dockerfile` to each repository. For example the [nabel][18] app has a [Dockerfile][19] that contains the following:

```
FROM opencpu/base

RUN R -e 'devtools::install_github("rwebapps/nabel")'

```

It takes the standard [opencpu/base][20]
image and then installs the nabel app from the Github [repository][21].
The result is a completeley isolated, standalone application. The application can be
started by anyone using e.g:

```
docker run -d 8004:8004 rwebapps/nabel

```

The `-d` daemonizes on port 8004.
Obviously you can tweak the `Dockerfile` to install whatever extra software or settings you need
for your application.

Containerized deployment shows the true power of docker: it allows for shipping fully
self contained appliations that work out of the box, without installing any software or
relying on paid hosting services. If you do prefer professional hosting, there are
many companies that will gladly host docker applications for you on scalable infrastructure.

### 3 Cross Platform Building

There is a third way Docker is used for OpenCPU. At each release we build
the `opencpu-server` installation package for half a dozen operating systems, which
get published on [https://archive.opencpu.org][22].
This process has been fully automated using DockerHub. The following images automatically
build the enitre stack from source:

*   [opencpu/ubuntu-16.04][4]

*   [opencpu/debian-9][5]

*   [opencpu/fedora-25][6]

*   [opencpu/fedora-26][7]

*   [opencpu/centos-6][8]

*   [opencpu/centos-7][9]

DockerHub automatically rebuilds this images when a new release is published on Github.
All that is left to do is run a [script][23]
which pull down the images and copies the `opencpu-server`binaries to the [archive server][24].

--------------------------------------------------------------------------------

via: https://www.r-bloggers.com/why-use-docker-with-r-a-devops-perspective/

作者：[Jeroen Ooms][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.r-bloggers.com/author/jeroen-ooms/
[1]:https://www.opencpu.org/posts/opencpu-with-docker/
[2]:https://twitter.com/hashtag/rstats?src=hash&ref_src=twsrc%5Etfw
[3]:https://twitter.com/JennyBryan/status/913785731998289920?ref_src=twsrc%5Etfw
[4]:https://hub.docker.com/r/opencpu/ubuntu-16.04/
[5]:https://hub.docker.com/r/opencpu/debian-9/
[6]:https://hub.docker.com/r/opencpu/fedora-25/
[7]:https://hub.docker.com/r/opencpu/fedora-26/
[8]:https://hub.docker.com/r/opencpu/centos-6/
[9]:https://hub.docker.com/r/opencpu/centos-7/
[10]:https://www.r-bloggers.com/
[11]:https://www.opencpu.org/posts/opencpu-with-docker
[12]:https://www.opencpu.org/download.html
[13]:http://localhost:8004/ocpu/
[14]:http://localhost:8004/rstudio/
[15]:https://hub.docker.com/r/opencpu/rstudio/
[16]:https://hub.docker.com/u/opencpu/
[17]:https://www.opencpu.org/apps.html
[18]:https://rwebapps.ocpu.io/nabel/www/
[19]:https://github.com/rwebapps/nabel/blob/master/Dockerfile
[20]:https://hub.docker.com/r/opencpu/base/
[21]:https://github.com/rwebapps
[22]:https://archive.opencpu.org/
[23]:https://github.com/opencpu/archive/blob/gh-pages/update.sh
[24]:https://archive.opencpu.org/
[25]:https://www.r-bloggers.com/author/jeroen-ooms/
