[#]: subject: "Convert Docker Run Commands Into Docker-Compose Files"
[#]: via: "https://ostechnix.com/convert-docker-run-commands-into-docker-compose-files/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Convert Docker Run Commands Into Docker-Compose Files
======
Create Docker compose files from docker run commands using Composerize

If you use Docker everyday in your official or personal systems, you should know there is an useful application called **Composerize**. In this brief guide, we will learn what is Composerize and how to use Composerize to **convert docker run commands into docker-compose files** format in Linux.

### What Is Composerize?

**[Docker compose][1]** is a tool for defining and running multi-container docker applications. Docker compose is just a YAML file in which we define services, networks, and volumes for a Docker application.

Not everyone is good at writing effective docker-compose files. Some of you may find it difficult to even write a simple docker compose file. No worries! Say hello to Composerize utility, which helps you to create Docker compose files from `docker run` commands.

Composerize is a command line as well as web-based utility to convert a `docker run` command into a docker-compose file.

It doesn't matter whether the `docker run` command is simple, short or lengthy and complex. All you have to do is just pass thecommand to Conposerize. Composerize will instantly turn the `docker run` commands into docker-compose files!

### Install Composerize In Linux

Composerize is available as a web service. So you don't have to install it on your system. If you want to install it locally for any reason, read on.

Composerize can be installed using npm. Make sure you've installed Nodejs in your system. If it is not installed, follow the link below to install Nodejs.

* [How To Install NodeJS On Linux][2]

After installing Nodejs, run the following command to install Composerize:

```
$ npm install composerize
```

This command will install Composerize for the current user only.

If you want to install it globally (system-wide), run the above command with `-g` option like below.

```
$ npm install composerize -g
```

### Convert Docker Run Commands Into Docker-Compose Files With Composerize

To convert a docker run command into docker-compose format, simply run it with Composerize like below:

```
$ composerize docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
```

It will generate the content in docker compose file format.

**Sample output:**

```
version: '3.3'
services:
    portainer:
        ports:
            - '9000:9000'
        volumes:
            - '/var/run/docker.sock:/var/run/docker.sock'
        image: portainer/portainer
```

![Convert Docker Run Commands Into Docker-Compose Files With Composerize][3]

Now copy the above lines in your `docker-compose.yml` file. It's that simple!

As I stated already, you can also use the Composerize web service to convert the docker run commands into docker file format.

Go to **[https://www.composerize.com/][4]** link and paste the `docker run` command in the box and you will get the docker-compose file instantly!

![Turn Docker Run Commands Into Docker-compose Files Using Composerize][5]

After converting the commands in docker-compose file, go to the location where you saved the `docker-compose.yml` file and run the following command to start the Docker application:

```
$ docker-compose up
```

Composerize is one of the useful utility for Docker users. You can now safely say goodbye to sprawling docker commands.

**Resource:**

* [Composerize GitHub Repository][6]

--------------------------------------------------------------------------------

via: https://ostechnix.com/convert-docker-run-commands-into-docker-compose-files/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/introduction-to-docker-compose/
[2]: https://ostechnix.com/install-node-js-linux/
[3]: https://ostechnix.com/wp-content/uploads/2022/08/Convert-Docker-Run-Commands-Into-Docker-Compose-Files-With-Composerize.png
[4]: https://www.composerize.com/
[5]: https://ostechnix.com/wp-content/uploads/2022/08/Turn-Docker-Run-Commands-Into-Docker-compose-Files-Using-Composerize.png
[6]: https://github.com/magicmark/composerize
