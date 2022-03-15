[#]: subject: "How to Install Docker in Fedora [Beginner’s tutorial]"
[#]: via: "https://itsfoss.com/install-docker-fedora/"
[#]: author: "Pranav Krishna https://itsfoss.com/author/pranav/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Docker in Fedora [Beginner’s tutorial]
======

Docker is one of the awesome technologies which is essential for developers and sysadmins these days. Containers have a wide range of applications and they play an important role in numerous areas.

I am not going in the advantages of Docker in this article. This tutorial will cover the steps to install Docker in Fedora.

### Installing Docker on Fedora Linux

Docker can be installed on Fedora in 3 ways:

  * [Installing via DNF][1] (convenient, easy and recommended)
  * [Installing via RPM][2]
  * [Using a script][3]



#### Method 1: Installing Docker via DNF (recommended)

This is by far the most convenient way to install Docker, since updated versions can be easily installed without complicated steps.

To achieve this, you have to add the official docker repositories, and then install Docker via DNF command.

Run the following command first:

```

    sudo dnf install dnf-plugins-core -y

```

And then add the Docker repo to your Fedora system:

```

    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

```

Now run the following command to install Docker and the required packages in your system:

```

    sudo dnf install docker-ce docker-ce-cli containerd.io

```

![Install Docker in Fedora][4]

Also authorize when asked to import the GPG key in order to install Docker:

![Authorize GPG Key][5]

That’s it. You have got Docker on your system. You may check if it’s running fine by using this command:

```

    sudo docker run hello-world

```

#### Method 2: Installing Docker by downloading the RPM package

This method is useful when you want to test a specific version of Docker, or install Docker for older versions of Fedora.

However, this is inconvenient since you have to download the RPM manually every time when a new version pops up.

You can [download the RPM][6] officially, by navigating to the site, your version, architecture, release type, and download it (you will need docker-ce, docker-ce-cli &amp; containerd.io RPMs for sure; you may download additional stuff if needed).

To [install the RPMs][7], fire up the terminal, navigate to the folder where you downloaded them, and type

```

    sudo dnf install /path/to/file.rpm -y

```

![Install Docker via RPMs][8]

#### Method 3: Install Docker using the official installation Script

Docker offers a script to download docker and do the necessary steps to install it. But this script is not meant to be used to upgrade the existing versions of Docker installed via DNF/RPMs (however it’s possible if you previously used the script to get Docker).

Download the script, make it executable and execute it with sudo privileges:

```

    curl -fsSL https://get.docker.com -o get-docker.sh
    chmod u+x ./get-docker.sh
    sudo sh ./get-docker.sh

```

That will do the necessary to install Docker.

### Testing Docker

Docker can be tested by running a hello-world image offered by Docker themselves. If it works fine, then it’s a sign that Docker works well.

Firstly, start the Docker service since it’s not enabled by default:

```

    sudo systemctl start docker

```

Download the hello-world image from docker and run it:

```

    sudo docker run hello-world

```

![The container hello-world running successfully][9]

**Note**: If you are under a proxy or multiple network interfaces, then the image download will just fail after some time, returning a 408 response error (it’s exactly what happened to me). Even if you’re not under a system-level proxy and your download fails, the problem might be the ISP who might’ve enabled it. In my case, I switched networks to download the image.

### Removing Docker from Fedora

Regardless of which method you followed to install Docker, you can remove it by the command

```

    sudo dnf remove docker-ce docker-ce-cli containerd.io

```

That removes Docker and all related packages. But if you want to completely remove the containers too, then you have to remove the `/var/lib/docker` and `/var/lib/containerd` folders:

```

    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/containerd

```

And that’s all about the tutorial. Feel free to leave a comment with your suggestion or a simple thank you :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-docker-fedora/

作者：[Pranav Krishna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pranav/
[b]: https://github.com/lujun9972
[1]: tmp.RpU89AEonp#dnf-method
[2]: tmp.RpU89AEonp#rpm-method
[3]: tmp.RpU89AEonp#convenience-script
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/Install-docker-2.png?resize=800%2C461&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/Authorize-GPG.png?resize=800%2C461&ssl=1
[6]: https://download.docker.com/linux/fedora/
[7]: https://itsfoss.com/install-rpm-files-fedora/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/Install-docker-rpm.png?resize=800%2C461&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/hello-world.png?resize=800%2C474&ssl=1
