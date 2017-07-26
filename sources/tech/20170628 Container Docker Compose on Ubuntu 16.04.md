Container: Docker Compose on Ubuntu 16.04
============================================================

 [![docker compose logo](https://www.unixmen.com/wp-content/uploads/2017/06/docker-compose-logo-696x1226.png "docker-compose-logo")][3] 

### What is Docker Compose

[Docker Compose][4] is a tool for running multi-container Docker applications. To configure an application’s services with Compose we use a configuration file, and then, executing a single command, it is possible to create and start all the services specified in the configuration.

Docker Compose is useful for many different projects like:

*   **Development**: with the Compose command line tools we create (and interact with) an isolated environment which will host the application being developed.
    By using the [Compose file][2], developers document and configure all of the application’s service dependencies.

*   **Automated testing**: this use case requires an environment for running tests in. Compose provides a convenient way to manage isolated testing environments for a test suite. The full environment is defined in the Compose file.

Docker Compose was made on the [Fig][5] source code, a community project now unused.

In this tutorial we will see how to install Docker Compose on an Ubuntu 16.04 machine.

### Install Docker

We need Docker in order to install Docker Compose. First, add the public key for the official Docker repository:

```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add-
```

Next, add the Docker repository to `apt` sources list:

```
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

Update the packages database and install Docker with `apt`:

```
$ sudo apt-get update
$ sudo apt install docker-ce
```

At the end of the installation process, the Docker daemon should be started and enabled to load at boot time. We can check its status with the following command:

```
$ sudo systemctl status docker
---------------------------------

● docker.service - Docker Application Container Engine
 Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
 Active: active (running) 
```

### Install Docker Compose

At this point it is possible to install Docker Compose. Download the current release by executing the following command:

```
# curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
```

Make the downloaded binary executable:

```
# chmod +x /usr/local/bin/docker-compose
```

Check the Docker Compose version:

```
$ docker-compose -v
```

The output should be something like this:

```
docker-compose version 1.14.0, build c7bdf9e
```

### Testing Docker Compose

The Docker Hub includes a Hello World image for demonstration purposes, illustrating the configuration required to run a container with Docker Compose.

Create a new directory and move into it:

```
$ mkdir hello-world
$ cd hello-world
```

Create a new YAML file:

```
$ $EDITOR docker-compose.yml
```

In this file paste the following content:

```
unixmen-compose-test:
 image: hello-world
```

 _**Note:** the first line is used as part of the container name._ 

Save and exit.

#### Run the container

Next, execute the following command in the `hello-world` directory:

```
$ sudo docker-compose up
```

If everything is correct, this should be the output shown by Compose:

```
Pulling unixmen-compose-test (hello-world:latest)...
latest: Pulling from library/hello-world
b04784fba78d: Pull complete
Digest: sha256:f3b3b28a45160805bb16542c9531888519430e9e6d6ffc09d72261b0d26ff74f
Status: Downloaded newer image for hello-world:latest
Creating helloworld_unixmen-compose-test_1 ... 
Creating helloworld_unixmen-compose-test_1 ... done
Attaching to helloworld_unixmen-compose-test_1
unixmen-compose-test_1 | 
unixmen-compose-test_1 | Hello from Docker!
unixmen-compose-test_1 | This message shows that your installation appears to be working correctly.
unixmen-compose-test_1 | 
unixmen-compose-test_1 | To generate this message, Docker took the following steps:
unixmen-compose-test_1 | 1\. The Docker client contacted the Docker daemon.
unixmen-compose-test_1 | 2\. The Docker daemon pulled the "hello-world" image from the Docker Hub.
unixmen-compose-test_1 | 3\. The Docker daemon created a new container from that image which runs the
unixmen-compose-test_1 | executable that produces the output you are currently reading.
unixmen-compose-test_1 | 4\. The Docker daemon streamed that output to the Docker client, which sent it
unixmen-compose-test_1 | to your terminal.
unixmen-compose-test_1 | 
unixmen-compose-test_1 | To try something more ambitious, you can run an Ubuntu container with:
unixmen-compose-test_1 | $ docker run -it ubuntu bash
unixmen-compose-test_1 | 
unixmen-compose-test_1 | Share images, automate workflows, and more with a free Docker ID:
unixmen-compose-test_1 | https://cloud.docker.com/
unixmen-compose-test_1 | 
unixmen-compose-test_1 | For more examples and ideas, visit:
unixmen-compose-test_1 | https://docs.docker.com/engine/userguide/
unixmen-compose-test_1 | 
helloworld_unixmen-compose-test_1 exited with code 0
```

Docker containers only run as long as the command is active, so the container will stop when the test finishes running.

### Conclusion

This concludes the tutorial about the installation of Docker Compose on an Ubuntu 16.04 machine. We have also seen how to create a simple project through the Compose file in YAML format.

--------------------------------------------------------------------------------

via: https://www.unixmen.com/container-docker-compose-ubuntu-16-04/

作者：[  Giuseppe Molica][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/tutan/
[1]:https://www.unixmen.com/author/tutan/
[2]:https://docs.docker.com/compose/compose-file/
[3]:https://www.unixmen.com/wp-content/uploads/2017/06/docker-compose-logo.png
[4]:https://docs.docker.com/compose/overview/
[5]:http://www.fig.sh/
