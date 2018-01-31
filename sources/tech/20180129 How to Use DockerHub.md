How to Use DockerHub
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/dockerhub-container.jpg?itok=tvraxGzh)

In the previous articles, we learned the basics of [Docker terminology][1],  [how to install Docker][2] on desktop Linux, macOS, and Windows, and [how to create container images][3] and run them on your system. In this last article in the series, we will talk about using images from DockerHub and publishing your own images to DockerHub.

First things first: what is DockerHub and why is it important? DockerHub is a cloud-based repository run and managed by Docker Inc. It's an online repository where Docker images  can be published and used by other users. There are both public and private repositories. If you are a company, you can have a private repository for use within your own organization, whereas public images can be used by anyone.

You can also use official Docker images that are published publicly. I use many such images, including for my test WordPress installations, KDE plasma apps, and more. Although we  learned last time how to create your own Docker images, you don't have to. There are thousands of images published on DockerHub for you to use. DockerHub is hardcoded into Docker as the default registry, so when you run the docker pull command against any image, it will be downloaded from DockerHub.

### Download images from Docker Hub and run locally

Please check out the previous articles in the series to get started. Then, once you have Docker running on your system, you can open the terminal and run:
```
$ docker images
```

This command will show all the docker images currently on your system. Let's say you want to deploy Ubuntu on your local machine; you would do:
```
$ docker pull ubuntu
```

If you already have Ubuntu image on your system, the command will automatically update that image to the latest version. So, if you want to update the existing images, just run the docker pull command, easy peasy. It's like apt-get upgrade without any muss and fuss.

You already know how to run an image:
```
$ docker run -it <image name>

$ docker run -it ubuntu
```

The command prompt should change to something like this:
```
root@1b3ec4621737:/#
```

Now you can run any command and utility that you use on Ubuntu. It's all safe and contained. You can run all the experiments and tests you want on that Ubuntu. Once you are done testing, you can nuke the image and download a new one. There is no system overhead that you would get with a virtual machine.

You can exit that container by running the exit command:
```
$ exit
```

Now let's say you want to install Nginx on your system. Run search to find the desired image:
```
$ docker search nginx

aizMFFysICAEsgDDYrsrlqwoCgGbWVHtcOzgV9mA
```

As you can see, there are many images of Nginx on DockerHub. Why? Because anyone can publish an image. Various images are optimized for different projects, so you can choose the appropriate image. You just need to install the appropriate image for your use-case.

Let's say you want to pull Bitnami's Nginx container:
```
$ docker pull bitnami/nginx
```

Now run it with:
```
$ docker run -it bitnami/nginx
```

### How to publish images to Docker Hub?

Previously, [we learned how to create a Docker image][3], and we can easily publish that image to DockerHub. First, you need to log into DockerHub. If you don't already have an account, please [create one][5]. Then, you can open terminal app and log in:
```
$ docker login --username=<USERNAME>
```

Replace <USERNAME> with the name of your username for Docker Hub. In my case it's arnieswap:
```
$ docker login --username=arnieswap>
```

Enter the password, and you are logged in. Now run the docker images command to get the ID of the image that you created last time.
```
$ docker images

tW1jDOugkX7J2FfyFyToM6B8m5OYFwMba-Ag5aez
```

Now, suppose you want to push the ng image to DockerHub. First, we need to tag that image ([learn more about tags][1]):
```
$ docker tag e7083fd898c7 arnieswap/my_repo:testing
```

Now push that image:
```
$ docker push arnieswap/my_repo
```

The push refers to repository [docker.io/arnieswap/my_repo]
```
12628b20827e: Pushed

8600ee70176b: Mounted from library/ubuntu

2bbb3cec611d: Mounted from library/ubuntu

d2bb1fc88136: Mounted from library/ubuntu

a6a01ad8b53f: Mounted from library/ubuntu

833649a3e04c: Mounted from library/ubuntu

testing: digest: sha256:286cb866f34a2aa85c9fd810ac2cedd87699c02731db1b8ca1cfad16ef17c146 size: 1569

```

Eureka! Your image is being uploaded. Once finished, open DockerHub, log into your account, and you can see your very first Docker image. Now anyone can deploy your image. It's the easiest and fastest way to develop and distribute software. Whenever you update the image, users can simply run:
```
$ docker run arnieswap/my_repo
```

Now you know why people love Docker containers. They solve many problems that traditional workloads face and allow you develop, test, and deploy applications in no time.  And, by following the steps in this series, you can try them out for yourself.


--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/1/how-use-dockerhub

作者：[Swapnil Bhartiya][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/blog/intro-to-linux/2017/12/container-basics-terms-you-need-know
[2]:https://www.linux.com/blog/learn/intro-to-linux/how-install-docker-ce-your-desktop
[3]:https://www.linux.com/blog/learn/intro-to-linux/2018/1/how-create-docker-image
[4]:https://lh3.googleusercontent.com/aizMFFysICAEsgDDYrsrlqwoCgGbWVHtcOzgV9mAtV8IdBZgHPJTdHIZhWBNCRvOyJb108ZBajJ_Nz10yCxGSvk-AF-yvFxpojLdVu3Jjihcwaup6CQLc67A5nglBuGDaOZWcrbV
[5]:https://hub.docker.com/
[6]:https://lh6.googleusercontent.com/tW1jDOugkX7J2FfyFyToM6B8m5OYFwMba-Ag5aezVGf2A5gsKJ47QrCh_TOKWgIKfE824Uc2Cwwwj9jWps1yJlUZqDyIceVQs-nEbKavFDxuUxLyd4thBA4_rsXrQH4r7hrG8FnD
