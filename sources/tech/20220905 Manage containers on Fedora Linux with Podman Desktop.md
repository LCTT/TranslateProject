[#]: subject: "Manage containers on Fedora Linux with Podman Desktop"
[#]: via: "https://fedoramagazine.org/manage-containers-on-fedora-linux-with-podman-desktop/"
[#]: author: "Mehdi Haghgoo https://fedoramagazine.org/author/powergame/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manage containers on Fedora Linux with Podman Desktop
======
![][1]

Podman Desktop is an open-source GUI application for managing containers on Linux, macOS, and Windows.

Historically, developers have been using Docker Desktop for graphical management of containers. This worked for those who had Docker Daemon and Docker CLI installed. However, for those who used Podman daemon-less tool, although there were a few Podman frontends like [Pods][2], [Podman desktop companion][3], and [Cockpit][4], there was no official application. This is not the case anymore. Enter Podman Desktop!

This article will discuss features, installation, and use of Podman Desktop, which is developed by developers from Red Hat and other open-source contributors.

### Installation

To install Podman Desktop on Fedora Linux, head over to [podman-desktop.io][5], and click the *Download for Linux* button. You will be presented with two options: Flatpak and zip. In this example we are using Flatpak. After clicking *Flatpak*, open it in GNOME Software by double clicking the file (if you are using GNOME). You can also install it via the terminal:

```
flatpak install podman-desktop-X.X.X.flatpak
```

In the above command, replace X.X.X with the specific version you have downloaded. If you downloaded the zip file, then extract the archive, and launch the *Podman Desktop* application binary. You can also find pre-release versions by going to the project’s [releases][6] page on GitHub.

### Features

Podman Desktop is still in its early days. Yet, it supports many common container operations like creating container images, running containers, etc. In addition, you can find a Podman extension under Extensions Catalog in Preferences, which you can use to manage Podman virtual machines on macOS and Windows.  Futhermore, Podman Desktop has support for Docker Desktop extensions.

You can install such extensions in the Docker Desktop Extensions section under Preferences.  The application window has two panes. The left narrow pane shows different features of the application and the right pane is the content area, which will display relevant information given what is selected on the left.

![Podman Desktop 0.0.6 running on Fedora 36][7]

### Demo

To get an overall view of Podman Desktop’s capabilities, we will create an image from a Dockerfile and push it to a registry, then pull and run it, all from within Podman Desktop.

#### Build image

The first step is to create a simple Dockerfile by entering the following lines in the command line:

```
cat <<EOF>>Dockerfile
FROM docker.io/library/httpd:2.4
COPY . /var/www/html 
WORKDIR /var/www/html 

CMD ["httpd", "-D", "FOREGROUND"]
EOF
```

Now, go to the Images section and press the Build Image button. You will be taken to a new page to specify the Dockerfile, build context and image name. Under Containerfile path, click and browse to pick your Dockerfile. Under image name, enter a name for your image. You can specify a fully qualified image name (FQIN) in the form example.com/username/repo:tag if you want to push the image to a container registry.  In this example, I enter quay.io/codezombie/demo-httpd:latest, because I have a public repository named demo-httpd on quay.io. You can follow a similar format to specify your FQIN pointing to your container registry (Quay, Docker Hub, GitHub Container Registry, etc.). Now, press *Build* and wait for the build to complete.

#### Push image

Once the build is finished, it’s time to push the image. So, we need to configure a registry in Podman Desktop. Go to Preferences, Registries and press *Add registry.*

![Add Registry dialog][8]

In the Add Registry dialog, enter your registry server address, and your user credentials and click ADD REGISTRY.

Now, I go back to my image in the list of images and push it to the repository by pressing the upload icon. When you hover over the image name that starts with the name of the registry added in the settings (quay.io in this demo), a push button appears alongside the image name.

![The push button that appears when you hover over the image name][9]

![Image pushed to repository via Podman Desktop][10]

Once the image is pushed, anyone with access to the image repository can pull it. Since my image repository is public, you can easily pull it in Podman Desktop.

#### Pull image

So, to make sure things work, remove this image locally and pull it in Podman Desktop. Find the image in the list and remove it by pressing the *delete* icon. Once the image is removed, click the *Pull Image* button. Enter the fully qualified name in the *Image to Pull* section and press *Pull image*.

![Our container image is successfully pulled][11]

#### Create a container

As the last part in our Podman Desktop demo, let us spin up a container from our image and check the result. I go to *Containers* and press *Create Container*. This will open up a dialog with two choices: *From Containerfile/Dockerfile*, and *From existing image*. Press *From existing image*. This takes us to the list of images. There, select the image we pulled.

![Create a container in Podman Desktop][12]

Now, we select our recently-pulled image from the list and press the *Play* button  in front of it. In the dialog that appears, I enter demo-web as *Container Name* and 8000 as *Port Mapping*, and press *Start Container*.

![Container configuration][13]

The container starts running and we can check out our Apache server’s default page by running the following command:

```
curl http://localhost:8000
```

![It works!][14]

You should also be able to see the running container in the Containers list, with its status changed to *Running*. There, you will find available operations in front of the container. For example, you can click the terminal icon to open a TTY into the container!

![][15]

### What Comes Next

Podman Desktop is still young and under [active development][16]. There is a project [roadmap][17] on GitHub with a list of exciting and on-demand features including:

* Kubernetes Integration
* Support for Pods
* Task Manager
* Volumes Support
* Support fo Docker Compose
* Kind Support

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/manage-containers-on-fedora-linux-with-podman-desktop/

作者：[Mehdi Haghgoo][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2022/09/podman-desktop-on-fedora-816x345.jpg
[2]: https://github.com/marhkb/pods
[3]: https://github.com/iongion/podman-desktop-companion
[4]: https://github.com/cockpit-project/cockpit/
[5]: https://podman-desktop.io/
[6]: https://github.com/containers/podman-desktop/releases/
[7]: https://fedoramagazine.org/wp-content/uploads/2022/08/pd.png
[8]: https://fedoramagazine.org/wp-content/uploads/2022/08/registry.png
[9]: https://fedoramagazine.org/wp-content/uploads/2022/08/image.png
[10]: https://fedoramagazine.org/wp-content/uploads/2022/08/Screenshot-from-2022-08-27-23-51-38.png
[11]: https://fedoramagazine.org/wp-content/uploads/2022/08/image-2.png
[12]: https://fedoramagazine.org/wp-content/uploads/2022/08/image-3.png
[13]: https://fedoramagazine.org/wp-content/uploads/2022/08/image-5.png
[14]: https://fedoramagazine.org/wp-content/uploads/2022/08/image-6.png
[15]: https://fedoramagazine.org/wp-content/uploads/2022/09/image-2-1024x393.png
[16]: https://github.com/containers/podman-desktop
[17]: https://github.com/orgs/containers/projects/2
