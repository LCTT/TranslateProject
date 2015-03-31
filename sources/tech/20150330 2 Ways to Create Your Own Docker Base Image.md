2 Ways to Create Your Own Docker Base Image
================================================================================
Greetings to everyone, today we'll learn about docker base Images and how we can build our own. [Docker][1] is an Open Source project that provides an open platform to pack, ship and run any application as a lightweight container. It has no boundaries of Language support, Frameworks or packaging system and can be run anywhere, anytime from a small home computers to high-end servers. It makes them great building blocks for deploying and scaling web apps, databases, and back-end services without depending on a particular stack or provider.

Docker Images is a read-only layer which never changes. It Docker uses a **Union File System** to add a read-write file system over the read-only file system. But all the changes go to the top-most writeable layer, and underneath, the original file in the read-only image is unchanged. Since images don't change, images do not have state.  Base Images are those images that has no parent. The major benefits of it is that it allows us to have a separate linux OS running.

Here are the ways on how we can create a custom base image.

### 1. Creating Docker Base Image using Tar ###

We can create our own base image using tar, we'll want to start building it with a working Linux Distribution we'll want to package as base image. This process may differ and depends on what distribution we are trying to build. In Debian distribution of Linux, debootstrap is preinstalled. We'll need to install debootstrap before starting the below process. Debootstrap is used to fetch the required packages to build the base system. Here, we'll create image based on Ubuntu 14.04 "Trusty".  To do so, we'll need to run the following command in a terminal or shell.

    $ sudo debootstrap trusty trusty > /dev/null
    $ sudo tar -C trusty -c . | sudo docker import - trusty

![creating docker base image using debootstrap](http://blog.linoxide.com/wp-content/uploads/2015/03/creating-base-image-debootstrap.png)

Here, the above command creates a tar file of the current directory and outputs it to STDOUT, where "docker import - trusty" takes it from STDIN and creates a base image called trusty from it. Then, we'll run a test command inside that image as follows.

    $  docker run trusty cat /etc/lsb-release

Here are some example scripts that will allow us to build quick base images in [Docker GitHub Repo][2] .

### 2. Creating Base Image using Scratch ###

In the Docker registry, there is a special repository known as Scratch, which was created using an empty tar file:

    $ tar cv --files-from /dev/null | docker import - scratch

![creating docker base image using scratch](http://blog.linoxide.com/wp-content/uploads/2015/03/creating-base-image-using-scratch.png)


We can use that image to base our new minimal containers FROM:

FROM scratch
ADD script.sh /usr/local/bin/run.sh
CMD ["/usr/local/bin/run.sh"]

The above Dockerfile  is from an extremely minimal image. Here, first it starts with a totally blank filesystem, then it copies script.sh that is created to /usr/local/bin/run.sh and then run the script /usr/local/bin/run.sh .

### Conclusion ###

Here, in this tutorial, we learned how we can build a custom Docker Base Image out of the box. Building a docker base image is an easy task because there are sets of packages and scripts already available for. Building a docker base image is a lot useful if we want to install what we want in it. So, if you have any questions, suggestions, feedback please write them in the comment box below. Thank you ! Enjoy  :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/2-ways-create-docker-base-image/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://www.docker.com/
[2]:https://github.com/docker/docker/blob/master/contrib/mkimage-busybox.sh