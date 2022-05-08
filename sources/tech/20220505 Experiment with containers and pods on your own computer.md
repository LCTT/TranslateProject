[#]: subject: "Experiment with containers and pods on your own computer"
[#]: via: "https://opensource.com/article/22/5/containers-pods-101-ebook"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Experiment with containers and pods on your own computer
======
Start exploring the essentials of container technology with this new downloadable guide.

![Looking at a map][1]

(Image by: opensource.com)

In the TV show *Battlestar Galactica*, the titular mega-ship didn't actually do a whole lot. It served as a stalwart haven for its crew, a central point of contact for strategy and orchestration, and a safe place for resource management. However, the Caprican Vipers, one-person self-contained space vessels, went out to deal with evil Cylons and other space-borne dangers. They never just send one or two Vipers out, either. They sent lots of them. Many redundant ships with essentially the same capabilities and purpose, but thanks to their great agility and number, they always managed to handle whatever problem threatened the Battlestar each week.

If you think you're sensing a developing analogy, you're right. The modern "cloud" is big and hulking, an amalgamation of lots of infrastructure spread over a great distance. It has great power, but you'd be wasting much of its capability if you treated it like a regular computer. When you want to handle lots of data from millions of input sources, it's actually more efficient to bundle up your solution (whether that takes the form of an application, website, database, server, or something else) and send out tiny images of that solution to deal with clusters of data. These, of course, would be *containers*, and they're the workforce of the cloud. They're the little solution factories you send out to handle service requests, and because you can spawn as many as you need based on the requests coming in at any given time, they're theoretically inexhaustible.

### Containers at home

If you don't have a lot of incoming requests to deal with, you might wonder what benefit containers offer to you. Using containers on a personal computer does have its uses, though.

#### Containers as virtual environments

With tools like Podman, LXC, and Docker, you can run containers the same way you might have historically run virtual machines. Unlike a virtual machine, though, containers don't require the overhead of emulated firmware and hardware.

You can download container images from public repositories, launch a minimalist Linux environment, and use it as a testing ground for commands or development. For instance, say you want to try an application you're building on Slackware Linux. First, search for a suitable image in the repository:

```
$ podman search slackware
```

Then select an image to use as the basis for your container:

```
$ podman run -it --name slackware vbatts/slackware
sh-4.3# grep -i ^NAME\= /etc/os-release
NAME=Slackware
```

### Containers at work

Of course, containers aren't just minimal virtual machines. They can be highly specific solutions for very specific requirements. If you're new to containers, it might help to start with one of the most common rites of passage for any new sysadmin: Starting up your first web server but in a container.

First, obtain an image. You can search for your favorite distribution using the `podman search` command or just search for your favorite httpd server. When using containers, I tend to trust the same distributions I trust on bare metal.

Once you've found an image to base your container on, you can run your image. However, as the term suggests, a container is *contained*, so if you just launch a container, you won't be able to reach the standard HTTP port. You can use the `-p` option to map a container port to a standard networking port:

```
$ podman run -it -p 8080:80 docker.io/fedora/apache:latest
```

Now take a look at port 8080 on your localhost:

```
$ curl localhost:8080
Apache
```

Success.

### Learn more

Containers hold much more potential than just mimicking virtual machines. You can group them in pods, construct automated deployments of complex applications, launch redundant services to account for high demand, and more. If you're just starting with containers, you can [download our latest eBook][2] to study up on the technology and even learn to create a pod so you can run WordPress and a database.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/containers-pods-101-ebook

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png
[2]: https://opensource.com/downloads/containers-pods-101-ebook
