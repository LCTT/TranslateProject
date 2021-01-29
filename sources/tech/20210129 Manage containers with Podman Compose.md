[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage containers with Podman Compose)
[#]: via: (https://fedoramagazine.org/manage-containers-with-podman-compose/)
[#]: author: (Mehdi Haghgoo https://fedoramagazine.org/author/powergame/)

Manage containers with Podman Compose
======

![][1]

Containers are awesome, allowing you to package your application along with its dependencies and run it anywhere. Starting with Docker in 2013, containers have been making the lives of software developers much easier.

One of the downsides of Docker is it has a central daemon that runs as the root user, and this has security implications. But this is where Podman comes in handy. Podman is a [daemonless container engine][2] for developing, managing, and running OCI Containers on your Linux system in root or rootless mode.

There are other articles on Fedora Magazine you can use to learn more about Podman. Two examples follow:

  * [Using Pods with Podman on Fedora][3]
  * [Podman with Capabilities on Fedora][4]



If you have worked with Docker, chances are you also know about Docker Compose, which is a tool for orchestrating several containers that might be interdependent. To learn more about Docker Compose see its [documentation][5].

### What is Podman Compose?

[Podman Compose][6] is a project whose goal is to be used as an alternative to Docker Compose without needing any changes to be made in the docker-compose.yaml file. Since Podman Compose works using pods, it’s good to check a refresher definition of a pod.

> A _Pod_ (as in a pod of whales or pea pod) is a group of one or more [containers][7], with shared storage/network resources, and a specification for how to run the containers.
>
> [Pods – Kubernetes Documentation][8]

The basic idea behind Podman Compose is that it picks the services defined inside the _docker-compose.yaml_ file and creates a container for each service. A major difference between Docker Compose and Podman Compose is that Podman Compose adds the containers to a single pod for the whole project, and all the containers share the same network. It even names the containers the same way Docker Compose does, using the _‐‐add-host_ flag when creating the containers, as you will see in the example.

### Installation

Complete install instructions for Podman Compose are found on its [project page][6], and there are several ways to do it. To install the latest development version, use the following command:

```
pip3 install https://github.com/containers/podman-compose/archive/devel.tar.gz
```

Make sure you also have [Podman installed][9] since you’ll need it as well. On Fedora, to install Podman use the following command:

```
sudo dnf install podman
```

### Example: launching a WordPress site with Podman Compose

Imagine your _docker-compose.yaml_ file is in a folder called _wpsite_. A typical _docker-compose.yaml_ (or _docker-compose.yml_) for a WordPress site looks like this:

```
version: "3.8"
services:
  web:
    image: wordpress
    restart: always
    volumes:
      - wordpress:/var/www/html
    ports:
      - 8080:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: magazine
      WORDPRESS_DB_NAME: magazine
      WORDPRESS_DB_PASSWORD: 1maGazine!
      WORDPRESS_TABLE_PREFIX: cz
      WORDPRESS_DEBUG: 0
    depends_on:
      - db
    networks:
      - wpnet
  db:
    image: mariadb:10.5
    restart: always
    ports:
      - 6603:3306

    volumes:
      - wpdbvol:/var/lib/mysql

    environment:
      MYSQL_DATABASE: magazine
      MYSQL_USER: magazine
      MYSQL_PASSWORD: 1maGazine!
      MYSQL_ROOT_PASSWORD: 1maGazine!
    networks:
      - wpnet
volumes:
  wordpress: {}
  wpdbvol: {}

networks:
  wpnet: {}
```

If you come from a Docker background, you know you can launch these services by running _docker-compose up_. Docker Compose will create two containers named _wpsite_web_1_ and _wpsite_db_1_, and attaches them to a network called _wpsite_wpnet_.

Now, see what happens when you run _podman-compose up_ in the project directory. First, a pod is created named after the directory in which the command was issued. Next, it looks for any named volumes defined in the YAML file and creates the volumes if they do not exist. Then, one container is created per every service listed in the _services_ section of the YAML file and added to the pod.

Naming of the containers is done similar to Docker Compose. For example, for your web service, a container named _wpsite_web_1_ is created. Podman Compose also adds localhost aliases to each named container. Then, containers can still resolve each other by name, although they are not on a bridge network as in Docker. To do this, use the option _–add-host_. For example, _–add-host web:localhost_.

Note that _docker-compose.yaml_ includes a port forwarding from host port 8080 to container port 80 for the web service. You should now be able to access your fresh WordPress instance from the browser using the address _<http://localhost:8080>_.

![WordPress Dashboard][10]

### Controlling the pod and containers

To see your running containers, use _podman ps_, which shows the web and database containers along with the infra container in your pod.
```

```

CONTAINER ID  IMAGE                               COMMAND               CREATED      STATUS          PORTS                                         NAMES
a364a8d7cec7  docker.io/library/wordpress:latest  apache2-foregroun...  2 hours ago  Up 2 hours ago  0.0.0.0:8080-&amp;gt;80/tcp, 0.0.0.0:6603-&amp;gt;3306/tcp  wpsite_web_1
c447024aa104  docker.io/library/mariadb:10.5      mysqld                2 hours ago  Up 2 hours ago  0.0.0.0:8080-&amp;gt;80/tcp, 0.0.0.0:6603-&amp;gt;3306/tcp  wpsite_db_1
12b1e3418e3e  k8s.gcr.io/pause:3.2
```

```

You can also verify that a pod has been created by Podman for this project, named after the folder in which you issued the command.
```

```

POD ID        NAME             STATUS    CREATED      INFRA ID      # OF CONTAINERS
8a08a3a7773e  wpsite           Degraded  2 hours ago  12b1e3418e3e  3
```

```

To stop the containers, enter the following command in another command window:

```
podman-compose down
```

You can also do that by stopping and removing the pod. This essentially stops and removes all the containers and then the containing pod. So, the same thing can be achieved with these commands:

```
podman pod stop podname
podman pod rm podname
```

Note that this does not remove the volumes you defined in _docker-compose.yaml_. So, the state of your WordPress site is saved, and you can get it back by running this command:

```
podman-compose up
```

In conclusion, if you’re a Podman fan and do your container jobs with Podman, you can use Podman Compose to manage your containers in development and production.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/manage-containers-with-podman-compose/

作者：[Mehdi Haghgoo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/01/podman-compose-1-816x345.jpg
[2]: https://podman.io
[3]: https://fedoramagazine.org/podman-pods-fedora-containers/
[4]: https://fedoramagazine.org/podman-with-capabilities-on-fedora/
[5]: https://docs.docker.com/compose/
[6]: https://github.com/containers/podman-compose
[7]: https://kubernetes.io/docs/concepts/containers/
[8]: https://kubernetes.io/docs/concepts/workloads/pods/
[9]: https://podman.io/getting-started/installation
[10]: https://fedoramagazine.org/wp-content/uploads/2021/01/Screenshot-from-2021-01-08-06-27-29-1024x767.png
