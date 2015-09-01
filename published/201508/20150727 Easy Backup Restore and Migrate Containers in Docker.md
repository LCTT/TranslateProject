无忧之道：Docker中容器的备份、恢复和迁移
================================================================================
今天，我们将学习如何快速地对docker容器进行快捷备份、恢复和迁移。[Docker][1]是一个开源平台，用于自动化部署应用，以通过快捷的途径在称之为容器的轻量级软件层下打包、发布和运行这些应用。它使得应用平台独立，因为它扮演了Linux上一个额外的操作系统级虚拟化的自动化抽象层。它通过其组件cgroups和命名空间利用Linux内核的资源分离特性，达到避免虚拟机开销的目的。它使得用于部署和扩展web应用、数据库和后端服务的大规模构建组件无需依赖于特定的堆栈或供应者。

所谓的容器，就是那些创建自Docker镜像的软件层，它包含了独立的Linux文件系统和开箱即用的应用程序。如果我们有一个在机器中运行着的Docker容器，并且想要备份这些容器以便今后使用，或者想要迁移这些容器，那么，本教程将帮助你掌握在Linux操作系统中备份、恢复和迁移Docker容器的方法。

我们怎样才能在Linux中备份、恢复和迁移Docker容器呢？这里为您提供了一些便捷的步骤。

### 1. 备份容器 ###

首先，为了备份Docker中的容器，我们会想看看我们想要备份的容器列表。要达成该目的，我们需要在我们运行着Docker引擎，并已创建了容器的Linux机器中运行 docker ps 命令。

    # docker ps

![Docker Containers List](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-containers-list.png)

在此之后，我们要选择我们想要备份的容器，然后去创建该容器的快照。我们可以使用 docker commit 命令来创建快照。

    # docker commit -p 30b8f18f20b4 container-backup

![Docker Commit](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-commit.png)

该命令会生成一个作为Docker镜像的容器快照，我们可以通过运行 `docker images` 命令来查看Docker镜像，如下。

    # docker images

![Docker Images](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-images.png)

正如我们所看见的，上面做的快照已经作为Docker镜像保存了。现在，为了备份该快照，我们有两个选择，一个是我们可以登录进Docker注册中心，并推送该镜像；另一个是我们可以将Docker镜像打包成tar包备份，以供今后使用。

如果我们想要在[Docker注册中心][2]上传或备份镜像，我们只需要运行 docker login 命令来登录进Docker注册中心，然后推送所需的镜像即可。

    # docker login

![Docker Login](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-login.png)

    # docker tag a25ddfec4d2a arunpyasi/container-backup:test
    # docker push arunpyasi/container-backup

![Docker Push](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-push.png)

如果我们不想备份到docker注册中心，而是想要将此镜像保存在本地机器中，以供日后使用，那么我们可以将其作为tar包备份。要完成该操作，我们需要运行以下 `docker save` 命令。

    # docker save -o ~/container-backup.tar container-backup

![taking tarball backup](http://blog.linoxide.com/wp-content/uploads/2015/07/taking-tarball-backup.png)

要验证tar包是否已经生成，我们只需要在保存tar包的目录中运行 ls 命令即可。

### 2. 恢复容器 ###

接下来，在我们成功备份了我们的Docker容器后，我们现在来恢复这些制作了Docker镜像快照的容器。如果我们已经在注册中心推送了这些Docker镜像，那么我们仅仅需要把那个Docker镜像拖回并直接运行即可。

    # docker pull arunpyasi/container-backup:test

![Docker Pull](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-pull.png)

但是，如果我们将这些Docker镜像作为tar包文件备份到了本地，那么我们只要使用 docker load 命令，后面加上tar包的备份路径，就可以加载该Docker镜像了。

    # docker load -i ~/container-backup.tar

现在，为了确保这些Docker镜像已经加载成功，我们来运行 docker images 命令。

    # docker images

在镜像被加载后，我们将用加载的镜像去运行Docker容器。

    # docker run -d -p 80:80 container-backup

![Restoring Docker Tarball](http://blog.linoxide.com/wp-content/uploads/2015/07/restoring-docker-tarballs.png)

### 3. 迁移Docker容器 ###

迁移容器同时涉及到了上面两个操作，备份和恢复。我们可以将任何一个Docker容器从一台机器迁移到另一台机器。在迁移过程中，首先我们将把容器备份为Docker镜像快照。然后，该Docker镜像或者是被推送到了Docker注册中心，或者被作为tar包文件保存到了本地。如果我们将镜像推送到了Docker注册中心，我们简单地从任何我们想要的机器上使用 docker run 命令来恢复并运行该容器。但是，如果我们将镜像打包成tar包备份到了本地，我们只需要拷贝或移动该镜像到我们想要的机器上，加载该镜像并运行需要的容器即可。

### 尾声 ###

最后，我们已经学习了如何快速地备份、恢复和迁移Docker容器，本教程适用于各个可以成功运行Docker的操作系统平台。真的，Docker是一个相当简单易用，然而功能却十分强大的工具。它的命令相当易记，这些命令都非常短，带有许多简单而强大的标记和参数。上面的方法让我们备份容器时很是安逸，使得我们可以在日后很轻松地恢复它们。这会帮助我们恢复我们的容器和镜像，即便主机系统崩溃，甚至意外地被清除。如果你还有很多问题、建议、反馈，请在下面的评论框中写出来吧，可以帮助我们改进或更新我们的内容。谢谢大家！享受吧 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/backup-restore-migrate-containers-docker/

作者：[Arun Pyasi][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://docker.com/
[2]:https://registry.hub.docker.com/
