[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Docker and Fedora 32)
[#]: via: (https://fedoramagazine.org/docker-and-fedora-32/)
[#]: author: (Kevin "Eonfge" Degeling https://fedoramagazine.org/author/eonfge/)

Docker and Fedora 32
======

![][1]

With the release of Fedora 32, regular users of [Docker][2] have been confronted by a small challenge. At the time of writing, Docker is not supported on Fedora 32. There are alternatives, like [Podman][3] and [Buildah][4], but for many existing users, switching now might not be the best time. As such, this article can help you set up your Docker environment on Fedora 32.

### Step 0: Removing conflicts

This step is for any user upgrading from Fedora 30 or 31. If this is a fresh installation of Fedora 32, you can move on to step 1.

To remove docker and all its related components:

```
sudo dnf remove docker-*
sudo dnf config-manager --disable docker-*
```

### Step 1: System preparation

With the last two versions of Fedora, the operating system has moved to two new technologies: CGroups and NFTables for the Firewall. While the details of these new technologies is behind the scope of this tutorial, it’s a sad fact that docker doesn’t support them yet. As such, you’ll have to make some changes to facilitate Docker on Fedora.

#### Enable old CGroups

The previous implementation of CGroups is still supported and it can be enabled using the following command.

```
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
```

#### Whitelist docker in firewall

To allow Docker to have network access, two commands are needed.

```
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
```

The first command will add the Docker-interface to the trusted environment which allows Docker to make remote connections. The second command will allow docker to make local connections. This is particularly useful when multiple Docker containers are in as a development environment.

### Step 2: installing Moby

[Moby][5] is the open-source, white label version of Docker. It’s based on the same code but it does not carry the trademark. It’s included in the main Fedora repository, which makes it easy to install.

```
sudo dnf install moby-engine docker-compose
```

This installs _moby-engine_, _docker-compose_, _containerd_ and some other related libraries. Once installed, you’ll have to enable the system-wide daemon to run docker.

```
sudo systemctl enable docker
```

### Step 3: Restart and test

To ensure that all systems and settings are properly processed, you’ll now have to reboot your machine.

```
sudo systemctl reboot
```

After that, you can validate your installation using the Docker hello-world package.

```
sudo docker run hello-world
```

You are then greeted by the Hello from Docker! unless something went wrong.

#### Running as admin

Optionally, you can now also add your user to the group account of Docker, so that you can start docker images without typing _sudo_.

```
sudo groupadd docker
sudo usermod -aG docker $USER
```

Logout and login for the change to take effect. If the thought of running containers with administrator privileges concerns you, then you should look into Podman.

### In summary

From this point on, Docker will work how you’re used to, including docker-compose and all docker-related tools. Don’t forget to check out the official documentation which can help you in many cases where something isn’t quite right.

The current state of Docker on Fedora 32 is not ideal. The lack of an official package might bother some, and there is an [issue upstream][6] where this is discussed. The missing support for both [CGroups][7] and [NFTables][8] is more technical, but you can check their progress in their public issues.

These instruction should allow you to continue working like nothing has happened. If this has not satisfied your needs, don’t forget to address your technical issues at the Moby or Docker Github pages, or take a look at Podman which might prove more robust in the long-term future.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/docker-and-fedora-32/

作者：[Kevin "Eonfge" Degeling][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/eonfge/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/06/f32-04-twilight-816x459.png
[2]: https://docs.docker.com/
[3]: https://podman.io/getting-started/
[4]: https://buildah.io/
[5]: https://mobyproject.org/
[6]: https://github.com/docker/for-linux/issues/955
[7]: https://github.com/moby/moby/issues/40360
[8]: https://github.com/moby/moby/issues/26824
