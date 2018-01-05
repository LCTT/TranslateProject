translating by lujun9972
Important Docker commands for Beginners
======
In our earlier tutorial, we learned to[ **install Docker on RHEL\ CentOS 7 & also created a docker container.**][1] In this tutorial, we will learn more commands to manipulate a docker container.

### **Syntax for using Docker command**

 **$ docker [option] [command] [arguments]
**

To view the list of all available commands that can be used with docker, run

 **$ docker
**

& we will get the following list of commands as the output,

 **attach Attach to a running container
build  Build an image from a Dockerfile
commit  Create a new image from a container's changes
cp  Copy files/folders between a container and the local filesystem
create  Create a new container
diff  Inspect changes on a container's filesystem
events  Get real time events from the server
exec  Run a command in a running container
export  Export a container's filesystem as a tar archive
history  Show the history of an image
images  List images
import  Import the contents from a tarball to create a filesystem image
info  Display system-wide information
inspect  Return low-level information on a container or image
kill  Kill a running container
load  Load an image from a tar archive or STDIN
login  Log in to a Docker registry
logout  Log out from a Docker registry
logs  Fetch the logs of a container
network  Manage Docker networks
pause  Pause all processes within a container
port  List port mappings or a specific mapping for the CONTAINER
ps  List containers
pull  Pull an image or a repository from a registry
push  Push an image or a repository to a registry
rename  Rename a container
restart  Restart a container
rm  Remove one or more containers
rmi  Remove one or more images
run  Run a command in a new container
save  Save one or more images to a tar archive
search  Search the Docker Hub for images
start  Start one or more stopped containers
stats  Display a live stream of container(s) resource usage statistics
stop  Stop a running container
tag  Tag an image into a repository
top  Display the running processes of a container
unpause  Unpause all processes within a container
update  Update configuration of one or more containers
version  Show the Docker version information
volume  Manage Docker volumes
wait  Block until a container stops, then print its exit code
**

To further view the options available with a command, run

 **$ docker docker-subcommand info
**

& we will get a list of options that we can use with the docker-sub command.

### **Testing connection with Docker Hub**

By default, all the images that are used are pulled from Docker Hub. We can upload or download an image for OS from Docker Hub. To make sure that we can do so, run

 **$ docker run hello-world
**

& the output should be,

 **Hello from Docker.
This message shows that your installation appears to be working correctly.
…
**

This output message shows that we can access Docker Hub & can now download docker images from Docker Hub.

### **Searching an Image**

To search for an image for the container, run

 **$ docker search Ubuntu
**

& we should get list of available Ubuntu images. Remember if you are looking for an official image, look for [OK] under the official column.

### **Downloading an image**

Once we have searched and found the image we are looking for, we can download it by running,

 **$ docker pull Ubuntu
**

### **Viewing downloaded images**

To view all the downloaded images, run

 **$ docker images
**

### **Running an container**

To run a container using the downloaded image , we will use

 **$ docker run -it Ubuntu
**

Here, using '-it' will open a shell that can be used to interact with the container. Once the container is up & running, we can then use it as a normal machine & execute any commands that we require for our container.

### **Displaying all docker containers**

To view the list of all docker containers, run

 **$ docker ps
**

The output will contain list ofcontainers with container id.

### **Stopping a docker container**

To stop a docker container, run

 **$ docker stop container-id
**

### **Exit from the container**

To exit from the container, type

 **$ exit
**

### **Saving the state of the container**

Once the container is running & we have changed some settings in the container, like for example installed apache server, we need to save the state of the container. Image created is saved on the local system.

To commit & save the state of the container, run

 **$ docker commit 85475ef774 repository/image_name
**

Here, **commit** will save the container state,

 **85475ef774** , is the container id of the container,

 **repository** , usually the docker hub username (or name of the repository added)

 **image_name** , will be the new name of the image.

We can further add more information to the above command using '-m' & '-a'. With '-m', we can mention a message saying that apache server is installed & with '-a' we can add author name.

 **For example**

 **docker commit -m "apache server installed"-a "Dan Daniels" 85475ef774 daniels_dan/Cent_container
**

This completes our tutorial on important commands used in Dockers, please share your comments/queries in the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/important-docker-commands-beginners/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/create-first-docker-container-beginners-guide/
