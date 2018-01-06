Translating by lonaparte

Container Basics: Terms You Need to Know
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/containers-krissia-cruz.jpg?itok=-TNPqdcp)

[In the previous article][1], we talked about what containers are and how they breed innovation and help companies move faster. And, in the following articles in this series, we will discuss how to use them. Before we dive more deeply into the topic, however, we need to understand some of the terms and commands used in the container world. Without a confident grasp of this terminology, things could get confusing.

Let's explore some of the basic terms used in the [Docker][2] container world.

**Container** **:** What exactly is container? It 's a runtime instance of a Docker image. It contains a Docker image, an execution environment, and instructions.  It's totally isolated from the system so multiple containers can run on the system, completely oblivious of each other. You can replicate multiple containers from the same image and scale the service when the demand is high and nuke those containers when demand is low.

**Docker Image** **:** This is no different from the image of a Linux distribution that you download. It's a package of dependencies and information for creating, deploying, and executing a container. You can spin up as many containers as you want in a matter of seconds. Each behaves exactly the same. Images are built on top of one another in layers. Once an image is created, it doesn't change. If you want to make changes to your container, you simply create a new image and deploy new containers from that image.

**Repository (repo)** **:** Linux users will already be familiar with the term repository; it's a reservoir where packages are stored that can be downloaded and installed on a system. In the context of Docker containers, the only difference is that it hosts Docker images which are categorized via labels. You can have different variants of the same applications or different versions, all tagged appropriately.

**Registry** **:** Think of this as like GitHub. It 's an online service that hosts and provides access to repositories of docker images. DockerHub, for example is the default registry for public images. Vendors can upload their repositories on DockerHub so that their customers can download and use official images. Some companies offer their own registries for their images. Registries don't have to be run and managed by third party vendors. Organizations can have on-prem registries to manage organization-wide access to repositories.

**Tag** **:** When you create a Docker image, you can tag it appropriately so that different variants or versions can be easily identified. It's no different from what you see in any software package. Docker images are tagged when you add them to the repository.

Now that you have an understanding of the basics, the next phase is understanding the terminology used when working with actual Docker containers.

**Dockerfile** **:** This is a text file that comprises the commands that are executed manually in order to build a Docker image. These instructions are used by Docker to automatically build images.

**Build** **:** This is the process that creates an image from Dockerfile.

**Push** **:** Once the image is created, "push" is the process to publish that image to the repository. The term is also used as part of a command that we will learn in the next articles.

**Pull** **:** A user can retrieve that image from repository through the "pull" process.

**Compose** **:** Most complex applications comprise more than one container. Compose is a command-line tool that 's used to run a multi-container application. It allows you to run a multi-container application with one command. It eases the headache of running multiple containers needed for that application.

### Conclusion

The scope of container terminology is massive, but these are some basic terms that you will frequently encounter. The next time you see these terms, you will know exactly what they mean. In the next article, we will get started working with Docker containers.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2017/12/container-basics-terms-you-need-know

作者：[Swapnil Bhartiya][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/blog/intro-to-linux/2017/12/what-are-containers-and-why-should-you-care
[2]:https://www.docker.com/
