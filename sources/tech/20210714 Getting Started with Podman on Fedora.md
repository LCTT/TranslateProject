[#]: subject: (Getting Started with Podman on Fedora)
[#]: via: (https://fedoramagazine.org/getting-started-with-podman-in-fedora/)
[#]: author: (Yazan Monshed https://fedoramagazine.org/author/yazanalmonshed/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Getting Started with Podman on Fedora
======

![][1]

Podman logo from the Podman project <https://github.com/containers/podman/tree/main/logo>

[Podman][2] is a daemonless container engine for developing, managing, and running OCI Containers on your Linux System. In this article, we will introduce podman and how to use it with a small application build using nodejs. The app will be very simple and clean.

### Install Podman

Podman command is the same as [docker][3] just type in your terminal **alias docker=podman** if you have docker already installed

Podman is installed by default in Fedora. But if you don’t have it for any reason, you can install it using the following command:

```
sudo dnf install podman
```

For fedora [silverblue][4] users, podman is already installed in your OS.

After installation, run the hello world image to ensure everything is working:

```
podman pull hello-world
podman run hello-world
```

If everything is working well you will see the following output in your terminal:

```
Hello from Docker!
This message shows that your installation appears to be working correctly.
 To generate this message, Docker took the following steps:
  1.The Docker client contacted the Docker daemon.
  2.The Docker daemon pulled the "hello-world" image from the Docker Hub. (amd64)
  3.The Docker daemon created a new container from that image which runs the executable that produces the output you are currently reading.
  4.The Docker daemon streamed that output to the Docker client, which sent it to your terminal.
 To try something more ambitious, you can run an Ubuntu container with:
  $ docker run -it ubuntu bash
 Share images, automate workflows, and more with a free Docker ID:
  https://hub.docker.com/
 For more examples and ideas, visit:
  https://docs.docker.com/get-started/
```

### Simple Nodejs App

First, we will create a folder **webapp** , type the following command in your terminal

```
mkdir webapp && cd webapp
```

Now create the file ****_package.json_ This file includes all the dependencies that the project needs to work well. Copy the following code inside the file _package.json ._

```
{
       "dependencies": {
               "express": "*"
       },
       "scripts": {
               "start": "node index.js"
       }
}
```

Create the file _index.js_ and add the following code there:

```
const express = require('express')

const app = express();

app.get('/', (req, res)=> {
       res.send("Hello World!")
});
app.listen(8081, () => {
       console.log("Listing on port 8080");
});
```

You can download source code from [here][5].

### Create Dockerfile

First of all, create a file called _Dockerfile_ and make sure the first character is a capital, NOT lower case, then add the following code there:

```
FROM node:alpine
WORKDIR usr/app
COPY ./ ./
RUN npm install
CMD ["npm", "start"]
```

Be sure you are inside the folder _webapp_ then show the image and then type the following command:

```
podman build .
```

Make sure to add the **dot**. The image is created on your machine and you can show it using the following command:

```
podman images
```

The last step is to run the image inside a container by typing the following command:

```
podman run -p 8080:8080 <image-name>
```

Now open your browser in _localhost:8080_ and you will see that your app works.

### Stopping and Remove Container

To exit from the container use _CTRL-C._ You can remove the container by using the container id. Get the id and stop the container using these commands:

```
podman ps -a
podman stop <container_id>
```

You can delete the images from your machine by using the following command:

```
podman rmi <image_id>
```

Read more about podman and how it works on the [official website][2]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-with-podman-in-fedora/

作者：[Yazan Monshed][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/yazanalmonshed/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/06/Get_Started_w_Podman_on_Fedora-816x345.jpg
[2]: https://podman.io/
[3]: https://www.docker.com/
[4]: https://silverblue.fedoraproject.org/
[5]: https://github.com/YazanALMonshed/webapp
