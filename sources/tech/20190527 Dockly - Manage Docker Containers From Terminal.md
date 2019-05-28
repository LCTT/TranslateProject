[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Dockly – Manage Docker Containers From Terminal)
[#]: via: (https://www.ostechnix.com/dockly-manage-docker-containers-from-terminal/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Dockly – Manage Docker Containers From Terminal
======

![][1]

A few days ago, we published a guide which covered almost all details you ever need to know to [**getting started with Docker**][2]. In that guide, we have shown you how to create and manage Docker containers in detail. There are also some non-official tools available for managing Docker containers. If you’ve looked at our old archives, you might have stumbled upon two web-based tools namely [**“Portainer”**][3] and [**“PiCluster”**][4]. Both of them makes the Docker management task much easier and simpler from a web browser. Today, I came across yet another Docker management tool named **“Dockly”**.

Unlike the aforementioned tools, Dockly is a TUI (text user interface) utility to manage Docker containers and services from the Terminal in Unix-like systems. It is free, open source tool built with **NodeJS**. In this brief guide, we will see how to install Dockly and how to manage Docker containers from command line.

### Installing Dockly

Make sure you have installed NodeJS on your Linux box. If you haven’t installed it yet, refer the following guide.

  * [**How To Install NodeJS On Linux**][5]



Once NodeJS is installed, run the following command to install Dockly:

```
# npm install -g dockly
```

### Manage Docker Containers With Dockly From Terminal

Managing Docker containers with Dockly is easy! All you have to do is to open the terminal and run the following command:

```
# dockly
```

Dockly will will automatically connect to your localhost docker daemon through the unix socket and display the list of running containers in the Terminal as shown below.

![][6]

Manage Docker Containers Using Dockly

As you can see in the above screenshot, Dockly displays the following information of running containers on the top:

  * Container ID,
  * Name of the container(s),
  * Docker image,
  * Command,
  * State of the running container(s),
  * Status.



On the top right side, you will see the CPU an Memory utilization of containers. Use UP/DOWN arrow keys to move between Containers.

At the bottom, there are few keyboard shortcut keys to do various docker management tasks. Here are the list of currently available keyboard shortcuts:

  * **=** – Refresh the Dockly interface,
  * **/** – Search the containers list view,
  * **i** – Display the information about the currently selected container or service,
  * **< RETURN>** – Show logs of the current container or service,
  * **v** – Toggle between Containers and Services view,
  * **l** – Launch a /bin/bash session on the selected Container,
  * **r** – Restart the selected Container,
  * **s** – Stop the selected Container,
  * **h** – Show HELP window,
  * **q** – Quit Dockly.



##### **Viewing information of a container**

Choose a Container using UP/DOWN arrow and press **“i”** to display the information of the selected Container.

![][7]

View container’s information

##### Restart Containers

If you want to restart your Containers at any time, just choose it and press **“r”** to restart.

![][8]

Restart Docker containers

##### Stop/Remove Containers and Images

We can stop and/or remove one or all containers at once if they are no longer required. To do so, press **“m”** to open **Menu**.

![][9]

Stop, remove Docker containers and images

From here, you can do the following operations.

  * Stop all Docker containers,
  * Remove selected container,
  * Remove all containers,
  * Remove all Docker images etc.



##### Display Dockly help section

If you have any questions, just press **“h”** to open the help section.

![][10]

Dockly Help

For more details, refer the official GitHub page given at the end.

And, that’s all for now. Hope this was useful. If you spend a lot of time working with Docker containers, give Dockly a try and see if it helps.

* * *

**Suggested read:**

  * **[How To Automatically Update Running Docker Containers][11]**
  * [**ctop – A Commandline Monitoring Tool For Linux Containers**][12]



* * *

**Resource:**

  * [**Dockly GitHub Repository**][13]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/dockly-manage-docker-containers-from-terminal/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/Dockly-720x340.png
[2]: https://www.ostechnix.com/getting-started-with-docker/
[3]: https://www.ostechnix.com/portainer-an-easiest-way-to-manage-docker/
[4]: https://www.ostechnix.com/picluster-simple-web-based-docker-management-application/
[5]: https://www.ostechnix.com/install-node-js-linux/
[6]: http://www.ostechnix.com/wp-content/uploads/2019/05/Manage-Docker-Containers-Using-Dockly.png
[7]: http://www.ostechnix.com/wp-content/uploads/2019/05/View-containers-information.png
[8]: http://www.ostechnix.com/wp-content/uploads/2019/05/Restart-containers.png
[9]: http://www.ostechnix.com/wp-content/uploads/2019/05/stop-remove-containers-and-images.png
[10]: http://www.ostechnix.com/wp-content/uploads/2019/05/Dockly-Help.png
[11]: https://www.ostechnix.com/automatically-update-running-docker-containers/
[12]: https://www.ostechnix.com/ctop-commandline-monitoring-tool-linux-containers/
[13]: https://github.com/lirantal/dockly
