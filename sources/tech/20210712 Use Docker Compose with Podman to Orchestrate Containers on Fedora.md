[#]: subject: (Use Docker Compose with Podman to Orchestrate Containers on Fedora)
[#]: via: (https://fedoramagazine.org/use-docker-compose-with-podman-to-orchestrate-containers-on-fedora/)
[#]: author: (Mehdi Haghgoo https://fedoramagazine.org/author/powergame/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use Docker Compose with Podman to Orchestrate Containers on Fedora
======

![][1]

Photo by [Jonas][2] on [Unsplash][3]

Docker Compose is an open-source tool used by developers for orchestrating containers locally or in production. If you are new to containers, I suggest checking out the following links:

  * [Get Started with Docker][4]
  * [A Practical Introduction to Container Terminology][5]
  * [Using Pods with Podman on Fedora][6]
  * [Podman with Capabilities on Fedora][7]



Podman, a powerful alternative to Docker CLI, has attracted a lot of developers recently. However, Podman users faced a challenge. Docker Compose was expected to work with Docker daemon only. So, Podman users had to use other alternatives to Docker Compose like using [Podman Compose][8] that runs services defined in the Compose file inside a Podman pod. (To learn more about Podman Compose, check out my article [Manage Containers on Fedora with Podman Compose][9] on [Fedora Magazine][10].) Another method was manually running different containers of an application and then generating a Kubernetes file with

podman generate

to be later re-run with

podman play

. (To learn more about this method, check out this [Moving from docker-compose to Podman pods][11] on [Red Hat][12].)

### Podman and Docker Compose

Both of the Docker Compose alternatives mentioned previously have their limitations. At the least they need you to know a little bit more than Container and Docker basics.The good news is that Podman has added [support for Docker Compose][13] since version 3.0 so you can now run your traditional docker-compose.yml files with Podman backend. Podman does this by setting up a UNIX socket for

docker-compose

to interact with, similar to the Docker daemon. In this article I will show you how to use Docker Compose both with rootful and rootless Podman.

### Required Software

Install the following packages on your system to run Docker Compose with Podman:

  * podman: Tool for managing containers
  * docker-compose: Tool for orchestrating containers
  * podman-docker: Installs a script named docker that emulates docker CLI using Podman. Also links Docker CLI man pages and podman.



Install the above packages using dnf:

```
sudo dnf install -y podman podman-docker docker-compose
```

### Setting Up Podman Socket

Set up the Podman socket in order for Docker Compose to work:

```
sudo systemctl enable podman.socket
sudo systemctl start podman.socket
sudo systemctl status podman.socket
```

This sets up a Unix socket in to communicate with Docker Compose and symlinks it to /var/run/docker.sock. To test if you can communicate with the socket, run the following curl command:

```
sudo curl -H "Content-Type: application/json" --unix-socket /var/run/docker.sock http://localhost/_ping
```

If the output from the above command is OK, it means your setup was successful.

### Running A Sample Project with Docker Compose

Now, you can start orchestrating your project by going to the project folder and running

sudo docker-compose up

. As an example, I will be using a docker-compose.yml from a sample WordPress project I created as a demo for this article. You can find it <https://github.com/djnotes/wp-compose-sample>. Clone the repository on your system and from within the directory, start docker-compose.

```
sudo docker-compose up
```

If everything goes well, you will see docker-compose bringing up the services defined in the compose YAML file. Access the new WordPress instance at <http://localhost:8080> after the containers are created. To stop the project, you can press Ctrl + C in the terminal where you executed _docker-compose up_. To remove the containers, execute

```
sudo docker-compose down
```

### Running Docker Compose with Rootless Podman

The setup shown above uses Podman in root-ful mode. Notice the _sudo_ keyword preceding most of the commands used. Often you will not need to run your projects as root. So, having the option to run docker-compose as a regular user is pretty handy. As of [version 3.2.0][14], Podman supports Docker-Compose with rootless Podman. The setup, however, changes as follows:

```
systemctl --user enable podman.socket
systemctl --user start podman.socket
systemctl --user status podman.socket
export DOCKER_HOST=///run/user/$UID/podman/podman.sock
```

Note that when starting the podman socket as non-root user, a user-level socket will be created at _/run/user/$UID/podman/podman.sock_, where _$UID_ refers is the non-root user’s user ID. We need to set the DOCKER_HOST environment variable to that socket so that Docker Compose can talk to the correct socket. You can add the environment variable to your ~/.bash_profile to make it persistent across system reboots. In root-ful mode, the socket is created in _/run/podman/podman.sock_ which is symlinked to _/var/run/docker.sock_ (the default socket expected by the docker-compose binary). So, we didn’t need to set DOCKER_HOST variable then.

Now, in rootless mode, we can simply run the command
```

```

docker-compose up
```

```

without “sudo” in the project root folder. This will bring up our WordPress site running on Docker Compose with Podman backend.

![WordPress instance running with Docker Compose with Podman backend][15]

### Further Reading:

  * [][13][][16][Running Podman and Docker Compose, Red Hat][13]
  * [From Docker Compose to Kubernetes with Podman][17]
  * [Convert docker-compose Services to Pods with Podman][18]



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-docker-compose-with-podman-to-orchestrate-containers-on-fedora/

作者：[Mehdi Haghgoo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/07/docker-compose-w-podman-816x345.jpg
[2]: https://unsplash.com/@jonason_b?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/docker-container?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://docs.docker.com/get-started
[5]: https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction
[6]: https://fedoramagazine.org/podman-pods-fedora-containers/
[7]: https://fedoramagazine.org/podman-with-capabilities-on-fedora/
[8]: http://github.com/containers/podman-compose
[9]: https://fedoramagazine.org/manage-containers-with-podman-compose/
[10]: https://fedoramagazine.org
[11]: https://www.redhat.com/sysadmin/compose-podman-pods
[12]: https://redhat.com
[13]: https://www.redhat.com/sysadmin/podman-docker-compose
[14]: https://github.com/containers/podman/releases/tag/v3.2.0
[15]: https://fedoramagazine.org/wp-content/uploads/2021/06/Screenshot-from-2021-06-25-06-48-39.png
[16]: tmp.Svb0n6PVdg
[17]: https://www.redhat.com/sysadmin/compose-kubernetes-podman
[18]: https://balagetech.com/convert-docker-compose-services-to-pods/
