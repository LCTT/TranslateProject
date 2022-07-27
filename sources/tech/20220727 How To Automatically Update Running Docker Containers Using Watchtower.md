[#]: subject: "How To Automatically Update Running Docker Containers Using Watchtower"
[#]: via: "https://ostechnix.com/automatically-update-running-docker-containers/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Automatically Update Running Docker Containers Using Watchtower
======
Automating Docker container base image updates using Watchtower

Keeping the Docker containers up-to-date is one of the important job of a DevOps engineer. Manually updating Docker containers is a quite time consuming task. This guide explains what is **Watchtower**, how to install Watchtower, and how to **automatically update running Docker containers using Watchtower** in Linux.

### What Is Watchtower?

**Watchtower** is a free, open source application that allows you to monitor the running Docker containers and updates them automatically when it finds any changes in their base images.

When watchtower finds if a running container needs to be updated, it will gracefully stop the running container by sending it a SIGTERM signal.

It will then download the new image, and finally restart the Container with the same options that were used when it was deployed initially. Everything will be done automatically on the background, so the user intervention is not required. I

n this guide, we will see how to automatically update running Docker containers using Watchtower in Unix-like operating systems.

I tested this guide in CentOS and Ubuntu system, however the procedure is same for all Linux distributions.

### Install Watchtower In Linux

Watchtower itself is available as a Docker image. So, deploying it is not a big deal. Install Docker on your Linux box, and start running Watchtower to monitor the Docker containers in no time.

Refer the following guides to install Docker on RPM-based and DEB-based systems.

* [How To Install Docker In CentOS][1]
* [How To Install Docker In Ubuntu][2]
* [A Beginners Manual To Docker Desktop For Linux][3]

Once Docker installed, you can deploy the Watchtower container using the following command as **root** user:

```
# docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower
```

If you have installed Docker Desktop, run the Watchtower container as normal user.

```
$ docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower
```

This command will pull the latest image of watchtower, and start watchtower container.

**Sample output:**

```
Unable to find image 'containrrr/watchtower:latest' locally
latest: Pulling from containrrr/watchtower
1045b2f97fda: Pull complete 
35a104a262d3: Pull complete 
1a0671483169: Pull complete 
Digest: sha256:bbf9794a691b59ed2ed3089fec53844f14ada249ee5e372ff0e595b73f4e9ab3
Status: Downloaded newer image for containrrr/watchtower:latest
91c104ef0e9896e8cd5ff30d9f13e728dbfad66443830ec2ac85dde6d7d37564
```

![Run Watchtower Docker Container][4]

### Automatically Update Running Docker Containers Using Watchtower

Watchtower has now started with other running containers on your system. You can view the list of running Docker containers using command:

```
$ docker ps
```

**Sample output:**

```
CONTAINER ID   IMAGE                       COMMAND                  CREATED          STATUS          PORTS                                         NAMES
91c104ef0e98   containrrr/watchtower       "/watchtower"            14 minutes ago   Up 14 minutes   8080/tcp                                      watchtower
f90b462b0712   bitnami/wordpress-nginx:6   "/opt/bitnami/script…"   19 minutes ago   Up 19 minutes   0.0.0.0:80->8080/tcp, 0.0.0.0:443->8443/tcp   ostechnix-wordpress-1
```

As you see in the above output, Watchtower container is running along with another container named **"ostechnix-wordpress-1"**. From now on, Watchtower will start watching this container every few minutes.

If it finds any changes in the this container's base image, it will gracefully shutdown the "ostechnix-wordpress-1" container, and restart it with new image with same options that were used when it was started initially.

Similarly, it will automatically check for updates for all running containers every few minutes, and updates them automatically.

### How Does Watchtower Update Multiple-linked Containers?

Watchtower is smart enough when it comes to monitoring multiple linked containers.

Let us say we are running two containers now.

```
$ docker ps
```

**Sample output:**

```
CONTAINER ID   IMAGE                       COMMAND                  CREATED          STATUS          PORTS                                         NAMES
91c104ef0e98   containrrr/watchtower       "/watchtower"            14 minutes ago   Up 14 minutes   8080/tcp                                      watchtower
f90b462b0712   bitnami/wordpress-nginx:6   "/opt/bitnami/script…"   19 minutes ago   Up 19 minutes   0.0.0.0:80->8080/tcp, 0.0.0.0:443->8443/tcp   ostechnix-wordpress-1
a895f082438a   bitnami/mariadb:10.6        "/opt/bitnami/script…"   20 minutes ago   Up 19 minutes   3306/tcp                                      ostechnix-mariadb-1
```

![View Running Docker Containers][5]

As you see in the above output, we are running two containers i.e. "ostechnix-wordpress-1" and "ostechnix-mariadb-1". The mariadb container is linked to wordpress container.

If Watchtower finds an update for "wordpress" container, it will first shutdown the linked container i.e "mariadb", and then stop the wordpress container.

After updating the wordpress container, Watchtower will restart both containers in correct order with the same options that were used when they were deployed initially, so that the application comes back up correctly. In our case, the mariadb container will be started first, followed by wordpress container to ensure that the link continued to work.

### Monitor A Specific Container

By default, Watchtower will monitor all Docker containers running within the Docker daemon to which it is pointed.

However, you can limit watchtower to monitor a particular Docker container by specifying the container's name as shown below.

```
$ docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower ostechnix-wordpress-1
```

In the above example, watchtower will only monitor the container named "ostechnix-wordpress-1" for updates, and other running containers will be ignored.

If you don't specify any arguments, then watchtower will monitor all running Docker Containers as usual.

### Sending Notifications

You may want to receive a notification whenever the containers are updated. You can send notifications via Email, Slack, MSTeams, and Gotify etc.

The following example shows how to send notification via Email. I assume you already have setup SMTP server.

```
docker run -d \
  --name watchtower \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_NOTIFICATIONS=email \
  -e WATCHTOWER_NOTIFICATION_EMAIL_FROM=fromaddress@gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_TO=toaddress@gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER=smtp.gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PORT=587 \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_USER=fromaddress@gmail.com \
  -e WATCHTOWER_NOTIFICATION_EMAIL_SERVER_PASSWORD=app_password \
  -e WATCHTOWER_NOTIFICATION_EMAIL_DELAY=2 \
  containrrr/watchtower
```

For more details, refer the Watchtower GitHub repository and Watchtower official website links provided below.

**Resources:**

* [Watchtower GitHub][6]
* [Watchtower Website][7]

> **Recommended Download** - [Free eBook: "Docker Containerization Cookbook"][8]

--------------------------------------------------------------------------------

via: https://ostechnix.com/automatically-update-running-docker-containers/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/install-docker-centos/
[2]: https://ostechnix.com/install-docker-ubuntu/
[3]: https://ostechnix.com/docker-desktop-for-linux/
[4]: https://ostechnix.com/wp-content/uploads/2022/07/Run-Watchtower-Docker-Container.png
[5]: https://ostechnix.com/wp-content/uploads/2022/07/View-Running-Docker-Containers.png
[6]: https://github.com/v2tec/watchtower
[7]: https://containrrr.dev/watchtower/
[8]: https://ostechnix.tradepub.com/free/w_java39/prgm.cgi
