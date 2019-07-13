Troubleshooting a Buildah script
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag)

As both a father of teenagers and a software engineer, I spend most of my time dealing with problems. Whether the problem is large or small, many times you can't find the cause of an issue by looking directly at it. Instead, you need to step back and investigate the environment where the situation exists. I realized this recently, when a colleague who presents on container technologies, including [container managers][1] like [Buildah][2] and [Podman][3], asked me for help solving a problem with a demo script he was planning to show at a conference only a few days later.

The script had worked in the past but wasn't working now, and he was in a pinch. It's a demo script that creates a Fedora 28-based container [using Buildah][4] and installs the NGINX HTTPD server within it. Then it uses Podman to run the container and kick off the NGINX server. Finally, the script does a quick `curl` command to pull the index.html file to prove the server is up and responsive. All these commands had worked during setup and testing, but now the `curl` was failing. (By the way, if you want to learn about Buildah or run a demo, take a look at my colleague's [full script][5], as it is a great one to use.)

I talked to the folks on the Podman team, and they were not able to reproduce the issue, so I thought it might be a problem in Buildah. We did a flurry of debugging and checking in the config code to make sure the ports were being set up properly, the image was getting pulled correctly, and everything was saved. It all checked out. Prior run-throughs of the demo had all completed successfully: the NGINX server would serve up the index.html as expected. That was odd, and no recent changes to the Buildah code were likely to upset any of that.

With the deadline before the conference ticking away, I began investigating by shrinking the script down to the following.
```
cat ~/tom_nginx.sh

#!/bin/bash



# docker-compatibility-demo.sh

# author : demodude

# Assumptions install buildah, podman & docker

# Do NOT start the docker deamon

# Set some of the variables below



demoimg=dockercompatibilitydemo

quayuser=ipbabble

myname="Demo King"

distro=fedora

distrorelease=28

pkgmgr=dnf # switch to yum if using yum



#Setting up some colors for helping read the demo output

bold=$(tput bold)

red=$(tput setaf 1)

green=$(tput setaf 2)

yellow=$(tput setaf 3)

blue=$(tput setaf 4)

cyan=$(tput setaf 6)

reset=$(tput sgr0)



echo -e "Using ${green}GREEN${reset} to introduce Buildah steps"

echo -e "Using ${yellow}YELLOW${reset} to introduce code"

echo -e "Using ${blue}BLUE${reset} to introduce Podman steps"

echo -e "Using ${cyan}CYAN${reset} to introduce bash commands"

echo -e "Using ${red}RED${reset} to introduce Docker commands"



echo -e "Building an image called ${demoimg}"



set -x

newcontainer=$(buildah from ${distro})

buildah run $newcontainer -- ${pkgmgr} -y update && ${pkgmgr} -y clean all

buildah run $newcontainer -- ${pkgmgr} -y install nginx && ${pkgmgr} -y clean all

buildah run $newcontainer bash -c 'echo "daemon off;" >> /etc/nginx/nginx.conf'

buildah run $newcontainer bash -c 'echo "nginx on OCI Fedora image, built using Buildah" > /usr/share/nginx/html/index.html'

buildah config --port 80 --entrypoint /usr/sbin/nginx $newcontainer

buildah config --created-by "${quayuser}" $newcontainer

buildah config --author "${myname}" --label name=$demoimg $newcontainer

buildah inspect $newcontainer

buildah commit $newcontainer $demoimg

buildah images

containernum=$(podman run -d -p 80:80 $demoimg)

curl localhost # Failed

podman ps

podman stop $containernum

podman rm $containernum

```

### What the script is doing

Beginning in the `set -x` section, you can see the script creates a new Fedora container using `buildah from`. The next four steps use `buildah run` to do some configurations in the container: the first two use the DNF software package manager to do an update, install NGINX, and clean everything up; the third and fourth steps prepare NGINX to run—the third sets up the `/etc/nginx/nginx.conf` file and sets `daemon off`, and the `run` command in the fourth step creates the index.html file to be displayed.

The three `buildah config` commands that folllow do a little housekeeping within the container. They set up port 80, set the entry point to NGINX, and touch up the `created-by`, `author`, and `label` fields in the new container. At this point, the container is set up to run NGINX, and the `buildah inspect` command lets you walk through the container's fields and associated metadata to verify all of that.

This script uses Podman to run the container and the NGINX server. Podman is a new, open source utility for working with Linux containers and Kubernetes pods that emulates many features of the Docker command line but doesn't require a daemon as Docker does. For Podman to run the container, it must first be saved as an image—that's what the `buildah commit` line is doing.

Finally, the `podman run` line starts up the container and—due to the way we configured it with the entry point and setting up the ports—the NGINX server starts and is available for use. It's always nice to say the server is "running," but the proof is being able to interact with the server. So, the script executes a simple `curl localhost`; if it's working, index.html should contain:
```
nginx on OCI Fedora image, built using Buildah

```

However, with only hours before the next demo, it instead sent back:
```
curl: (7) Failed to connect to jappa.cos.redhat.com port 80: Connection refused

```

Now, that's not good.

### Diagnosing the problem

I was repeatedly having the problem on my development virtual machine (VM). I added debugging statements and still didn't find anything. Strangely, I found if I replaced `podman` with `docker` in the script, everything worked just fine. I'm not always very kind to my development VM, so I set up a new VM and installed everything nice and fresh and clean.

The script failed there as well, so it wasn't that my development VM was behaving badly by itself. I ran the script multiple times while I was thinking things through, hoping to pick up any clue from the output. My next thought was to get into the container and look around in there. I commented out the `stop` and `rm` lines and re-ran the script using:
```
podman exec --tty 129d4d33169f /bin/bash

```

where `129d4d33169f` was the `CONTAINER ID` value from the `podman ps` command for the container. I ran `curl localhost` there within the container and voilà! I received the correct output from index.html. I then exited the container and tried the `curl` command again from the host running the container, and this time it worked.

Finally, light dawned on marblehead. In past testing, I'd been playing with an Apache HTTPD server and trying to connect to it from another session. In those tests, if I went too quick, the server would reject me.

### Could it be that simple?

As it turns out, it was that simple. We added a `sleep 3` line between the `podman run` and the `curl localhost` commands, and everything worked as expected. What seemed to be happening was the `podman run` command was starting up the container and the NGINX server extremely quickly and returning to the command line. If you don't wait a few seconds, the NGINX server doesn't have time to start up and start accepting connection requests.

In our testing with Docker, this wasn't the case. I didn't dig into it deeply, but my assumption is the time Docker spends talking to the Docker daemon gives the NGINX server enough time to come up fully. This is what makes Buildah and Podman very useful and powerful: no daemon, less overhead. But you need to take that into account for demos!

Problems are indeed what engineers solve, and oftentimes the answer is not in the code itself. When looking at problems, it's good to step back a little bit and not get too focused on the bits and the bytes.

An earlier version of this article originally appeared on the [ProjectAtomic.io][6] blog.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/buildah-troubleshooting

作者：[Tom Sweeney][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tomsweeneyredhat
[1]:https://opensource.com/article/18/1/history-low-level-container-runtimes
[2]:https://github.com/projectatomic/buildah
[3]:https://github.com/projectatomic/libpod/tree/master/cmd/podman
[4]:https://opensource.com/article/18/6/getting-started-buildah
[5]:https://github.com/projectatomic/buildah/blob/master/demos/buildah-bud-demo.sh
[6]:https://www.projectatomic.io/blog/2018/06/problems-are-opportunities-in-disguise/
