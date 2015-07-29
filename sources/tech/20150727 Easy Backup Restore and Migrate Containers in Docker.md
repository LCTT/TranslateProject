Translating by GOLinux!
Easy Backup, Restore and Migrate Containers in Docker
================================================================================
Today we'll learn how we can easily backup, restore and migrate docker containers out of the box. [Docker][1] is an open source platform that automates the deployment of applications with fast and easy way to pack, ship and run it under a lightweight layer of software called container. It makes the applications platform independent as it acts an additional layer of abstraction and automation of operating system level virtualization on Linux. It utilizes resource isolation features of Linux Kernel with its components cgroups and namespace for avoiding the overhead of virtual machines. It makes the great building blocks for deploying and scaling web apps, databases, and back-end services without depending on a particular stack or provider. Containers are those software layers which are created from a docker image that contains the respective linux filesystem and applications out of the box. If we have a docker container running in our box and need to backup those containers for future use or wanna migrate those containers, then this tutorial will help you how we can backup, restore and migrate docker containers in linux operating system.

Here are some easy steps on how we can backup, restore and migrate the docker containers in linux.

### 1. Backing up the Containers ###

First of all, in order to backup the containers in docker, we'll wanna see the list of containers that we wanna backup. To do so, we'll need to run docker ps in our linux machine running docker engine with containers already created.

    # docker ps

![Docker Containers List](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-containers-list.png)

After that, we'll choose the containers we wanna backup and then we'll go for creating the snapshot of the container. We can use docker commit command in order to create the snapshot.

    # docker commit -p 30b8f18f20b4 container-backup

![Docker Commit](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-commit.png)

This will generated a snapshot of the container as the docker image. We can see the docker image by running the command docker images as shown below.

    # docker images

![Docker Images](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-images.png)

As we can see the snapshot that was taken above has been preserved as docker image. Now, inorder to backup that snapshot, we have two options, one is that we can login into the docker registry hub and push the image and the next is that we can backup the docker image as tarballs for further use.

If we wanna upload or backup the image in the [docker registry hub][2], we can simply run docker login command to login into the docker registry hub and then push the required image.

    # docker login

![Docker Login](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-login.png)

    # docker tag a25ddfec4d2a arunpyasi/container-backup:test
    # docker push arunpyasi/container-backup

![Docker Push](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-push.png)

If we don't wanna backup to the docker registry hub and wanna save the image for future use in the machine locally then we can backup the image as tarballs. To do so, we'll need to run the following docker save command.

    # docker save -o ~/container-backup.tar container-backup

![taking tarball backup](http://blog.linoxide.com/wp-content/uploads/2015/07/taking-tarball-backup.png)

To verify if the tarball has been generated or not, we can simply run docker ls inside the directory where we saved the tarball.

### 2. Restoring the Containers ###

Next, after we have successfully backed up our docker containers, we'll now go for restoring those contianers which are snapshotted as docker images. If we have pushed those docker images in the registry hub, then we can simply pull that docker image and run it out of the box.

    # docker pull arunpyasi/container-backup:test

![Docker Pull](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-pull.png)

But if we have backed up those docker images locally as tarball file, then we can easy load that docker image using docker load command followed by the backed up tarball.

    # docker load -i ~/container-backup.tar

Now, to ensure that those docker images have been loaded successfully, we'll run docker images command.

    # docker images

After the images have been loaded, we'll gonna run the docker container from the loaded image.

    # docker run -d -p 80:80 container-backup

![Restoring Docker Tarball](http://blog.linoxide.com/wp-content/uploads/2015/07/restoring-docker-tarballs.png)

### 3. Migrating the Docker Containers ###

Migrating the containers involve both the above process ie Backup and Restore. We can migrate any docker container from one machine to another. In the process of migration, first we take the backup of the container as snapshot docker image. Then, that docker image is either pushed to the docker registry hub or saved as tarball files in the locally. If we have pushed the image to the docker registry hub, we can easily restore and run the container using docker run command from any machine we want. But if we have saved the image as tarballs locally, we can simply copy or move the image to the machine where we want to load image and run the required container.

### Conclusion ###

Finally, we have learned how we can backup, restore and migrate the docker containers out of the box. This tutorial is exactly same for every platform of operating system where docker runs successfully. Really, docker is pretty simple and easy to use but very powerful tool. It has pretty easy to remember commands which are short enough with many simple but powerful flags and parameters. The above methods makes us comfortable to backup our containers so that we can restore them when needed in future. This can help us recover our containers and images even if our host system crashes or gets wiped out accidentally. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/backup-restore-migrate-containers-docker/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://docker.com/
[2]:https://registry.hub.docker.com/
