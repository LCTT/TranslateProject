[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tips and tricks for optimizing container builds)
[#]: via: (https://opensource.com/article/20/5/optimize-container-builds)
[#]: author: (Ravi Chandran https://opensource.com/users/ravichandran)

Tips and tricks for optimizing container builds
======
Try these techniques to minimize the number and length of your container
build iterations.
![Toolbox drawing of a container][1]

How many iterations does it take to get a container configuration just right? And how long does each iteration take? Well, if you answered "too many times and too long," then my experiences are similar to yours. On the surface, creating a configuration file seems like a straightforward exercise: implement the same steps in a configuration file that you would perform if you were installing the system by hand. Unfortunately, I've found that it usually doesn't quite work that way, and a few "tricks" are handy for such DevOps exercises.

In this article, I'll share some techniques I've found that help minimize the number and length of iterations. In addition, I'll outline a few good practices beyond the [standard ones][2].

In the [tutorial repository][3] from my previous article about [containerizing build systems][4], I've added a folder called **/tutorial2_docker_tricks** with an example covering some of the tricks that I'll walk through in this post. If you want to follow along and you have Git installed, you can pull it locally with:


```
`$ git clone https://github.com/ravi-chandran/dockerize-tutorial`
```

The tutorial has been tested with Docker Desktop Edition, although it should work with any compatible Linux container system (like [Podman][5]).

### Save time on container image build iterations

If the Dockerfile involves downloading and installing a 5GB file, each iteration of **docker image build** could take a lot of time even with good network speeds. And forgetting to include one item to be installed can mean rebuilding all the layers after that point.

One way around that challenge is to use a local HTTP server to avoid downloading large files from the internet multiple times during **docker image build** iterations. To illustrate this by example, say you need to create a container image with Anaconda 3 under Ubuntu 18.04. The Anaconda 3 installer is a ~0.5GB file, so this will be the "large" file for this example.

Note that you don't want to use the **COPY** instruction, as it creates a new layer. You should also delete the large installer after using it to minimize the container image size. You could use [multi-stage builds][6], but I've found the following approach sufficient and quite effective.

The basic idea is to use a Python-based HTTP server locally to serve the large file(s) and have the Dockerfile **wget** the large file(s) from this local server. Let's explore the details of how to set this up effectively. As a reminder, you can access the [full example][7].

The necessary contents of the folder **tutorial2_docker_tricks/** in this example repository are:


```
tutorial2_docker_tricks/
├── build_docker_image.sh                   # builds the docker image
├── run_container.sh                        # instantiates a container from the image
├── install_anaconda.dockerfile             # Dockerfile for creating our target docker image
├── .dockerignore                           # used to ignore contents of the installer/ folder from the docker context
├── installer                               # folder with all our large files required for creating the docker image
│   └── Anaconda3-2019.10-Linux-x86_64.sh   # from <https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86\_64.sh>
└── workdir                                 # example folder used as a volume in the running container
```

The key steps of the approach are:

  * Place the large file(s) in the **installer/** folder. In this example, I have the large Anaconda installer file **Anaconda3-2019.10-Linux-x86_64.sh**. You won't find this file if you clone my [Git repository][8] because only you, as the container image creator, need this source file. The end users of the image don't. [Download the installer][9] to follow along with the example.
  * Create the **.dockerignore** file and have it ignore the **installer/** folder to avoid Docker copying all the large files into the build context.
  * In a terminal, **cd** into the **tutorial2_docker_tricks/** folder and execute the build script as **./build_docker_image.sh**.
  * In **build_docker_image.sh**, start the Python HTTP server to serve any files from the **installer/** folder: [code] cd installer
python3 -m http.server --bind 10.0.2.15 8888 &amp;
cd .. 
```
* If you're wondering about the strange internet protocol (IP) address, I'm working with a VirtualBox Linux VM, and **10.0.2.15** shows up as the address of the Ethernet adapter when I run **ifconfig**. This IP seems to be the convention used by VirtualBox. If your setup is different, you'll need to update this IP address to match your environment and then update **build_docker_image.sh** and **install_anaconda.dockerfile**. The server's port number is set to **8888** for this example. Note that the IP and port numbers could be passed in as build arguments, but I've hard-coded them for brevity.
* Since the HTTP server is set to run in the background, stop the server near the end of the script with the **kill -9** command using an [elegant approach][10] I found: [code]`kill -9 `ps -ef | grep http.server | grep 8888 | awk '{print $2}'`
```
  * Note that this same **kill -9** is also used earlier in the script (before starting the HTTP server). In general, when I iterate on any build script that I might deliberately interrupt, this ensures a clean start of the HTTP server each time.
  * In the [Dockerfile][11], there is a **RUN wget** instruction that downloads the Anaconda installer from the local HTTP server. It also deletes the installer file and cleans up after the installation. Most importantly, all these actions are performed within the same layer to keep the image size to a minimum: [code] # install Anaconda by downloading the installer via the local http server
ARG ANACONDA
RUN wget --no-proxy <http://10.0.2.15:8888/${ANACONDA}> -O ~/anaconda.sh \
    &amp;&amp; /bin/bash ~/anaconda.sh -b -p /opt/conda \
    &amp;&amp; rm ~/anaconda.sh \
    &amp;&amp; rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/* 
```
  * This file runs the wrapper script, **anaconda.sh**, and cleans up large files by removing them with **rm**.
  * After the build is complete, you should see an image **anaconda_ubuntu1804:v1**. (You can list the images with **docker image ls**.)
  * You can instantiate a container from this image using **./run_container.sh** at the terminal while in the folder **tutorial2_docker_tricks/**. You can verify that Anaconda is installed with: [code] $ ./run_container.sh
$ python --version
Python 3.7.5
$ conda --version
conda 4.8.0
$ anaconda --version
anaconda Command line client (version 1.7.2)
```
  * You'll note that **run_container.sh** sets up a volume **workdir**. In this example repository, the folder **workdir/** is empty. This is a convention I use to set up a volume where I can have my Python and other scripts that are independent of the container image.



### Minimize container image size

Each **RUN** command is equivalent to executing a new shell, and each **RUN** command creates a layer. The naive approach of mimicking installation instructions with separate **RUN** commands may eventually break at one or more interdependent steps. If it happens to work, it will typically result in a larger image. Chaining multiple installation steps in one **RUN** command and including the **autoremove**, **autoclean**, and **rm** commands (as in the example below) is useful to minimize the size of each layer. Some of these steps may not be needed, depending on what's being installed. However, since these steps take an insignificant amount of time, I always throw them in for good measure at the end of **RUN** commands invoking **apt-get**:


```
RUN apt-get update \
    &amp;&amp; DEBIAN_FRONTEND=noninteractive \
       apt-get -y --quiet --no-install-recommends install \
       # list of packages being installed go here \
    &amp;&amp; apt-get -y autoremove \
    &amp;&amp; apt-get clean autoclean \
    &amp;&amp; rm -fr /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*
```

Also, ensure that you have a **.dockerignore** file in place to ignore items that don't need to be sent to the Docker build context (such as the Anaconda installer file in the earlier example).

### Organize the build tool I/O

For software build systems, the build inputs and outputs—all the scripts that configure and invoke the tools—should be outside the image and the eventually running container. The container itself should remain stateless so that different users will have identical results with it. I covered this extensively in my [previous article][4] but wanted to emphasize it because it's been a useful convention for my work. These inputs and outputs are best accessed by setting up container volumes.

I've had to use a container image that provides data in the form of source code and large pre-built binaries. As a software developer, I was expected to edit the code in the container. This was problematic, because containers are by default stateless: they don't save data within the container, because they're designed to be disposable. But I worked on it, and at the end of each day, I stopped the container and had to be careful not to remove it, because the state had to be maintained so I could continue work the next day. The disadvantage of this approach was that there would be a divergence of development state had there been more than one person working on the project. The value of having identical build systems across developers is somewhat lost with this approach.

### Generate output as non-root user

An important aspect of I/O concerns the ownership of the output files generated when running the tools in the container. By default, since Docker runs as **root**, the output files would be owned by **root**, which is unpleasant. You typically want to work as a non-root user. Changing the ownership after the build output is generated can be done with scripts, but it is an additional and unnecessary step. It's best to set the [**USER**][12] argument in the Dockerfile at the earliest point possible:


```
ARG USERNAME
# other commands...
USER ${USERNAME}
```

The **USERNAME** can be passed in as a build argument (**\--build-arg**) when executing the **docker image build**. You can see an example of this in the example [Dockerfile][11] and corresponding [build script][13].

Some portions of the tools may also need to be installed as a non-root user. So the sequence of installations in the Dockerfile may need to be different from the way it's done if you are installing manually and directly under Linux.

### Non-interactive installation

Interactivity is the opposite of container automation. I've found the


```
`DEBIAN_FRONTEND=noninteractive apt-get -y --quiet --no-install-recommends`
```

options for the **apt-get install** instruction (as in the example above) necessary to prevent the installer from opening dialog boxes. Note that these options should be used as part of the **RUN** instruction. The **DEBIAN_FRONTEND=noninteractive** should not be set as an environment variable (**ENV**) in the Dockerfile, as this [FAQ explains][14], as it will be inherited by the containers.

### Log your build and run output

Debugging why a build failed is a common task, and logs are a great way to do this. Save a TypeScript of everything that happened during the container image build or container run session using the **tee** utility in a Bash script. In other words, add **|&amp; tee $BASH_SOURCE.log** to the end of the **docker image build** and the **docker image run** commands in your scripts. See the examples in the [image build][13] and [container run][15] scripts.

What this **tee**-ing technique does is generate a file with the same name as the Bash script but with a **.log** extension appended to it so that you know which script it originated from. Everything you see printed to the terminal when running the script will get logged to this file with a similar name.

This is especially valuable for users of your container images to report issues to you when something doesn't work. You can ask them to send you the log file to help diagnose the issue. Many tools generate so much output that it easily overwhelms the default size of the terminal's buffer. Relying only on the terminal's buffer capacity to copy-paste error messages may not be sufficient for diagnosing issues because earlier errors may have been lost.

I've found this to be useful, even in the container image-building scripts, especially when using the Python-based HTTP server discussed above. The server generates so many lines during a download that it typically overwhelms the terminal's buffer.

### Deal with proxies elegantly

In my work environment, proxies are required to reach the internet for downloading the resources in **RUN apt-get** and **RUN wget** commands. The proxies are typically inferred from the environment variables **http_proxy** or **https_proxy**. While **ENV** commands can be used to hard-code such proxy settings in the Dockerfile, there are multiple issues with using **ENV** for proxies directly.

If you are the only one who will ever build the container, then perhaps this will work. But the Dockerfile couldn't be used by someone else at a different location with a different proxy setting. Another issue is that the IT department could change the proxy at some point, resulting in a Dockerfile that won't work any longer. Furthermore, the Dockerfile is a precise document specifying a configuration-controlled system, and every change will be scrutinized by quality assurance.

One simple approach to avoid hard-coding the proxy is to pass your local proxy setting as a build argument in the **docker image build** command:


```
docker image build \
    --build-arg MY_PROXY=<http://my\_local\_proxy.proxy.com:xx>
```

And then, in the Dockerfile, set the environment variables based on the build argument. In the example shown here, you can still set a default proxy value that can be overridden by the build argument above:


```
# set a default proxy
ARG MY_PROXY=MY_PROXY=<http://my\_default\_proxy.proxy.com:nn/>
ENV http_proxy=$MY_PROXY
ENV https_proxy=$MY_PROXY
```

### Summary

These techniques have helped me significantly reduce the time it takes to create container images and debug them when they go wrong. I continue to be on the lookout for additional best practices to add to my list. I hope you find the above techniques useful.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/optimize-container-builds

作者：[Ravi Chandran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ravichandran
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/toolbox-learn-draw-container-yearbook.png?itok=xDbwz1pP (Toolbox drawing of a container)
[2]: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
[3]: https://github.com/ravi-chandran/dockerize-tutorial
[4]: https://opensource.com/article/20/4/how-containerize-build-system
[5]: https://podman.io/getting-started/installation
[6]: https://docs.docker.com/develop/develop-images/multistage-build/
[7]: https://github.com/ravi-chandran/dockerize-tutorial/blob/master/tutorial2_docker_tricks/
[8]: https://github.com/ravi-chandran/dockerize-tutorial/
[9]: https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
[10]: https://stackoverflow.com/a/37214138
[11]: https://github.com/ravi-chandran/dockerize-tutorial/blob/master/tutorial2_docker_tricks/install_anaconda.dockerfile
[12]: https://docs.docker.com/engine/reference/builder/#user
[13]: https://github.com/ravi-chandran/dockerize-tutorial/blob/master/tutorial2_docker_tricks/build_docker_image.sh
[14]: https://docs.docker.com/engine/faq/
[15]: https://github.com/ravi-chandran/dockerize-tutorial/blob/master/tutorial2_docker_tricks/run_container.sh
