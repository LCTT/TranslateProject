Translating by lonaparte-CHENG

8 basic Docker container management commands
======
Learn basic Docker container management with the help of these 8 commands. Useful guide for Docker beginners which includes sample command outputs.

![Docker container management commands][1]

In this article we will walk you through 6 basic Docker container commands which are useful in performing basic activities on Docker containers like run, list, stop, view logs, delete etc. If you are new to Docker concept then do check our [introduction guide][2] to know what is Docker & [how-to guide][3] to install Docker in Linux. Without further delay lets directly jump into commands :

### How to run Docker container?

As you know, Docker container is just a application process running on host OS. For Docker container, you need a image to run from. Docker image when runs as process called as Docker container. You can have Docker image available locally or you have to download it from Docker hub. Docker hub is a centralized repository which has public and private images stored to pull from. Docker’s official hub is at [hub.docker.com][4]. So whenever you instruct Docker engine to run a container, it looks for image locally and if not found it pulls it from Docker hub.

Let’s run a Docker container for Apache web-server i.e httpd process. You need to run command `docker container run`. Old command was just `docker run` but lately Docker added sub-command section so new versions supports below command –

```
root@kerneltalks # docker container run -d -p 80:80 httpd
Unable to find image 'httpd:latest' locally
latest: Pulling from library/httpd
3d77ce4481b1: Pull complete
73674f4d9403: Pull complete
d266646f40bd: Pull complete
ce7b0dda0c9f: Pull complete
01729050d692: Pull complete
014246127c67: Pull complete
7cd2e04cf570: Pull complete
Digest: sha256:f4610c3a1a7da35072870625733fd0384515f7e912c6223d4a48c6eb749a8617
Status: Downloaded newer image for httpd:latest
c46f2e9e4690f5c28ee7ad508559ceee0160ac3e2b1688a61561ce9f7d99d682
```

Docker `run` command takes image name as a mandatory argument along with many other optional ones. Commanly used arguments are –

  * `-d` : Detach container from current shell
  * `-p X:Y` : Bind container port Y with host’s port X
  * `--name` : Name your container. If not used, it will be assigned randomly generated name
  * `-e` : Pass environmental variables and their values while starting container



In above output you can see, we supply `httpd` as a image name to run container from. Since, image was not locally found, Docker engine pulled it from Docker Hub. Now, observe it downloaded image **httpd:latest **where : is followed by version. That’s the naming convention of Docker container image. If you want specific version container to run from then you can provide version name along with image name. If not supplied, Docker engine will always pull latest one.

The very last line of output shown unique container ID of your newly running httpd container.

### How to list all running Docker containers?

Now, your container is running, you may want to check it or you want to list all running containers on your machine. You can list all running containers using `docker container ls` command. In old Docker version, `docker ps` does this task for you.

```
root@kerneltalks # docker container ls
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                NAMES
c46f2e9e4690        httpd               "httpd-foreground"   11 minutes ago      Up 11 minutes       0.0.0.0:80->80/tcp   cranky_cori
```

Listing output is presented in column-wise format. Where column-wise values are –

  1. Container ID : First few digits of unique container ID
  2. Image : Name of image used to run container
  3. Command : Command ran by container after it ran
  4. Created : Time created
  5. Status : Current status of container
  6. Ports : Port binding details with host’s ports
  7. Names : Name of container (since we haven’t named our container you can see randomly generated name assigned to our container)



### How to view logs of Docker container?

Since during first step we used -d switch to detach container from current shell once it ran its running in background. In this case, we are clueless whats happening inside container. So to view logs of container, Docker provided `logs` command. It takes container name or ID as an argument.

```
root@kerneltalks # docker container logs cranky_cori
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Thu May 31 18:35:07.301158 2018] [mpm_event:notice] [pid 1:tid 139734285989760] AH00489: Apache/2.4.33 (Unix) configured -- resuming normal operations
[Thu May 31 18:35:07.305153 2018] [core:notice] [pid 1:tid 139734285989760] AH00094: Command line: 'httpd -D FOREGROUND'
```

I used container name in my command as argument. You can see Apache related log within our httpd container.

### How to identify Docker container process?

Container is a process which uses host resources to run. If its true, then you will be able to locate container process on host’s process table. Lets see how to check container process on host.

Docker used famous `top` command as its sub-command’s name to view processes spawned by container. It takes container name/ID as an argument. In old Docker version only `docker top` command works. In newer versions, `docker top` and `docker container top` both works.

```
root@kerneltalks # docker container top  cranky_cori
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                15702               15690               0                   18:35               ?                   00:00:00            httpd -DFOREGROUND
bin                 15729               15702               0                   18:35               ?                   00:00:00            httpd -DFOREGROUND
bin                 15730               15702               0                   18:35               ?                   00:00:00            httpd -DFOREGROUND
bin                 15731               15702               0                   18:35               ?                   00:00:00            httpd -DFOREGROUND
 
root@kerneltalks # ps -ef |grep -i 15702
root     15702 15690  0 18:35 ?        00:00:00 httpd -DFOREGROUND
bin      15729 15702  0 18:35 ?        00:00:00 httpd -DFOREGROUND
bin      15730 15702  0 18:35 ?        00:00:00 httpd -DFOREGROUND
bin      15731 15702  0 18:35 ?        00:00:00 httpd -DFOREGROUND
root     15993 15957  0 18:59 pts/0    00:00:00 grep --color=auto -i 15702
```

In the first output, list of processes spawned by that container. It has all details like use, pid, ppid, start time, command etc. All those PID you can search in your host’s process table and you can find them there. That’s what we did in second command. So, this proves containers are indeed just processes on Host’s OS.

### How to stop Docker container?

Its simple `stop` command! Again it takes container name /ID as an argument.

```
root@kerneltalks # docker container stop cranky_cori
cranky_cori
```

### How to list stopped or not running Docker containers?

Now we stopped our container if we try to list container using `ls` command, we wont be able to see it.

```
root@kerneltalks # docker container ls
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

So in this case to view stopped or non running container you need to use `-a` switch along with `ls` command.

```
root@kerneltalks # docker container ls -a
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS                     PORTS               NAMES
c46f2e9e4690        httpd               "httpd-foreground"   33 minutes ago      Exited (0) 2 minutes ago                       cranky_cori
```

With `-a` switch we can see stopped container now. Notice status of this container is mentioned ‘Exited’. Since container is just a process its termed as ‘exited’ rather than stopped!

### How to start Docker container?

Now, we will start this stopped container. There is difference with running and starting a container. When you run a container, you are starting a command in fresh container. When you start a container, you are starting old stopped container which has old state saved in it. It will start it from that state forward.

```
root@kerneltalks #  docker container start c46f2e9e4690
c46f2e9e4690
 
root@kerneltalks # docker container ls -a
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                NAMES
c46f2e9e4690        httpd               "httpd-foreground"   35 minutes ago      Up 8 seconds        0.0.0.0:80->80/tcp   cranky_cori
```

### How to remove Docker container?

To remove container from your Docker engine use `rm` command. You can not remove running container. You have to first stop the container and then remove it. You can remove it forcefully using `-f` switch with `rm` command but that’s not recommended.

```
root@kerneltalks # docker container rm cranky_cori
cranky_cori
root@kerneltalks # docker container ls -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

You can see once we remove container, its not visible in `ls -a` listing too.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/virtualization/8-basic-docker-container-management-commands/

作者：[Shrikant Lavhate][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://a4.kerneltalks.com/wp-content/uploads/2018/06/basic-Docker-container-management-commands.png
[2]:https://kerneltalks.com/virtualization/what-is-docker-introduction-guide-to-docker/
[3]:https://kerneltalks.com/virtualization/how-to-install-docker-in-linux/
[4]:https://hub.docker.com/
