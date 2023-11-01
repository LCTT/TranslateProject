[#]: subject: "Install Docker on Arch Linux"
[#]: via: "https://itsfoss.com/install-docker-arch-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install Docker on Arch Linux
======

Installing Docker on Arch Linux is easy. It is available in the Extra repository and you can simply [do the pacman magic][1]:

```

    sudo pacman -S docker

```

But there are more steps involved here to run Docker on Arch Linux properly.

### Making Arch Docker ready

It all comes down to these steps:

  * Install Docker from Arch repository
  * Start the Docker daemon and run it automatically at each boot
  * Add user to docker group to run docker commands without sudo



Let's see the steps in detail.

#### Step 1: Installing Docker package

Open the terminal and use the following command:

```

    sudo pacman -S docker

```

Enter the password and press Y when asked for it.

![][2]

It may take some time depending on the mirror you are using.

💡

If you see a package not found or 404 error, your sync database is perhaps old. Update the system (it will download a lot of packages and take time) with: sudo pacman -Syu

#### Step 2: Start docker daemon

Docker is installed but it is not running. You should start the dcoker daemon before **running the Docker command for the first time** :

```

    sudo systemctl start docker.service

```

I also suggest enabling the Docker service so that the docker daemon starts automatically when your system boots.

```

    sudo systemctl enable docker.service

```

This way, you can just start running docker commands. You won't need to manually start the docker service anymore.

![][3]

#### Step 3: Add user to docker group

Docker is installed and the Docker service is running. You are almost ready to run docker commands.

However, by default, you need to use sudo with docker commands. And that's annoying.

To avoid using sudo with each docker command, you can add yourself (or any other user) to the docker group like this:

```

    sudo usermod -aG docker $USER

```

**You must log out (or close the terminal) and log back in for the above change to take effect. If you don't want to do that, use this command:**

```

    newgrp docker

```

Now the stage is set. Let's test it.

#### Step 4: Verify docker installation

There is a tiny docker image provided by docker itself to test the docker installation. Run it and see if everything works well:

```

    docker run hello-world

```

You should see output like this for successful docker run:

![][4]

Congratulations! You have successfully installed Docker on Arch Linux.

### Optional: Install Docker Compose

Docker Compose has become an integral part of Docker. It allows you to manage multiple container applications.

The older classic compose is provided by the `docker-compose` Python package. Docker has also ported it to Go and provides it with `docker compose` but this package comes with [Docker Desktop][5].

At this stage, I would suggest going with the classic docker-compose plugin and install it with this command:

```

    sudo pacman -S docker-compose

```

![][6]

### Troubleshooting Tips

Here are some common issues you may face and the possible solutions:

#### Tab completion not working for docker sub commands

If you want to use tab completion for the docker command options (like completing im to images etc), install the bash-completion package:

```

    sudo pacman -S bash-completion

```

Close the terminal and start a new one. You should be able to use tab completion with Docker commands now.

#### Cannot connect to the Docker daemon error

If you see the following error:

```

    docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?.
    See 'docker run --help'.

```

That's because the docker daemon is not running. Refer to step 2 and start the docker service, make sure it is running and enable it so that docker daemon runs automatically at each boot.

```

    sudo systemctl start docker.service

    sudo systemctl enable docker.service

```

#### Permission denied while trying to connect to Docker daemon socket

If you see this error:

```

    docker: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/create": dial unix /var/run/docker.sock: connect: permission denied.
    See 'docker run --help'.

```

That's because you need to either run the docker command with sudo or add the user to docker group to run docker commands without sudo.

I hope this quick post helps you run Docker on Arch Linux.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-docker-arch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/pacman-command/
[2]: https://itsfoss.com/content/images/2023/10/installing-docker-arch-linux.png
[3]: https://itsfoss.com/content/images/2023/10/start-docker-daemon-arch-linux.png
[4]: https://itsfoss.com/content/images/2023/10/docker-running-successfully-arch-linux.png
[5]: https://www.docker.com/products/docker-desktop/
[6]: https://itsfoss.com/content/images/2023/10/install-docker-compose.png
