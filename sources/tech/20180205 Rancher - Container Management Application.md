Rancher - Container Management Application
======
Docker is a cutting-edge software used for containerization, that is used in most of IT companies to reduce infrastructure cost.

By default docker comes without any GUI, which is easy for Linux administrator to manage it and it’s very difficult for developers to manage. When it’s come to production then it’s very difficult for Linux admin too. So, what would be the best solution to manage the docker without any trouble.

The only way is GUI. The Docker API has allowed third party applications to interfacing with Docker. There are many docker GUI applications available in the market. We already wrote an article about Portainer application. Today we are going to discuss about Rancher.

Containers make software development easier, enabling you to write code faster and run it better. However, running containers in production can be hard.

**Suggested Read :** [Portainer – A Simple Docker Management GUI][1]

### What is Rancher

[Rancher][2] is a complete container management platform that makes it easy to deploy and run containers in production on any infrastructure. It provides infrastructure services such as multi-host networking, global and local load balancing, and volume snapshots. It integrates native Docker management capabilities such as Docker Machine and Docker Swarm. It offers a rich user experience that enables devops admins to operate Docker in production at large scale.

Navigate to following article for docker installation on Linux.

**Suggested Read :**
**(#)** [How to install Docker in Linux][3]
**(#)** [How to play with Docker images on Linux][4]
**(#)** [How to play with Docker containers on Linux][5]
**(#)** [How to Install, Run Applications inside Docker Containers][6]

### Rancher Features

  * Set up Kubernetes in two minutes
  * Launch apps with single click (90 popular Docker applications)
  * Deploy and manage Docker easily
  * complete container management platform for production environment
  * Quickly deploy containers in production
  * Automate container deployment and operations with a robust technology
  * Modular infrastructure services
  * Rich set of orchestration tools
  * Rancher supports multiple authentication mechanisms



### How to install Rancher

Rancher installation is very simple since it’s runs as a lightweight Docker containers. Rancher is deployed as a set of Docker containers. Running Rancher is as simple as launching two containers. One container as the management server and another container on a node as an agent. Simple run the following command to deploy rancher on Linux.

Rancher server offers two different package tags like `stable` & `latest`. The below commands will pull appropriate build rancher image and install on your system. It will only take a couple of minutes for Rancher server to start up.

  * `stable` : This tag will be their latest development builds. These builds will have been validated through rancher CI automation framework which is not advisable for deployment in production.
  * `latest` : It’s a latest stable release version which is recommend for production environment.



Rancher installation comes with many varieties. In this tutorial we are going to discuss about two variants.

  * Install rancher server in a single container (Inbuilt Rancher Database)
  * Install rancher server in a single container (External Database)



### Method-1

Run the following commands to install rancher server in a single container (Inbuilt Rancher Database).
```
$ sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:stable

$ sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:latest

```

### Method-2

Instead of using the internal database that comes with Rancher server, you can start Rancher server pointing to an external database. First create required database, database user for the same.
```
> CREATE DATABASE IF NOT EXISTS cattle COLLATE = 'utf8_general_ci' CHARACTER SET = 'utf8';
> GRANT ALL ON cattle.* TO 'cattle'@'%' IDENTIFIED BY 'cattle';
> GRANT ALL ON cattle.* TO 'cattle'@'localhost' IDENTIFIED BY 'cattle';

```

Run the following command to start Rancher connecting to an external database.
```
$ sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server \
 --db-host myhost.example.com --db-port 3306 --db-user username --db-pass password --db-name cattle

```

If you want to test Rancher 2.0 use the following command to start.
```
$ sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/server:preview

```

### Access & Setup Rancher Through GUI

Navigate to the following URL `http://hostname:8080` or `http://server_ip:8080` to access rancher GUI.
[![][7]![][7]][8]

### How To Register the Host

Register your host URL which allow hosts to connect to the Rancher API. It’s one time setup.

To do, Click “Add a Host” link under the main menu or Go to >> Infrastructure >> Add Hosts then hit `save` button.
[![][7]![][7]][9]

By default access control authentication is disabled in rancher so first we have to enable the access control authentication through available method, otherwise anyone can access the GUI.

Go to >> Admin >> Access Control and input the following values and finally hit `Enable Authentication` button to enable it. In my case i’m enabling via `local authentication`

  * **`Login UserName`** Input your descried login username
  * **`Full Name`** Input your full name
  * **`Password`** Input your descried password
  * **`Confirm Password`**Confirm the password once again



[![][7]![][7]][10]

Logout and login back with your new login credential.
[![][7]![][7]][11]

Now, i can see the local authentication is enabled.
[![][7]![][7]][12]

### How To Add Hosts

After register your host, it will take you to next page where you can choose Linux machines from varies cloud providers. We are going to add the host that is running Rancher server, so select the `custom` option and input the required information.

Enter your server public IP address in the 4th step and run the command which is displaying in the 5th step into your terminal then finally hit `close` button.
```
$ sudo docker run -e CATTLE_AGENT_IP="192.168.1.112" --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.9 http://192.168.1.112:8080/v1/scripts/3F8217A1DCF01A7B7F8A:1514678400000:D7WeLUcEUnqZOt8rWjrvoaUE

INFO: Running Agent Registration Process, CATTLE_URL=http://192.168.1.112:8080/v1
INFO: Attempting to connect to: http://66.70.189.137:8080/v1
INFO: http://192.168.1.112:8080/v1 is accessible
INFO: Inspecting host capabilities
INFO: Boot2Docker: false
INFO: Host writable: true
INFO: Token: xxxxxxxx
INFO: Running registration
INFO: Printing Environment
INFO: ENV: CATTLE_ACCESS_KEY=A35151AB87C15633DFB4
INFO: ENV: CATTLE_AGENT_IP=192.168.1.112
INFO: ENV: CATTLE_HOME=/var/lib/cattle
INFO: ENV: CATTLE_REGISTRATION_ACCESS_KEY=registrationToken
INFO: ENV: CATTLE_REGISTRATION_SECRET_KEY=xxxxxxx
INFO: ENV: CATTLE_SECRET_KEY=xxxxxxx
INFO: ENV: CATTLE_URL=http://192.168.1.112:8080/v1
INFO: ENV: DETECTED_CATTLE_AGENT_IP=172.17.0.1
INFO: ENV: RANCHER_AGENT_IMAGE=rancher/agent:v1.2.9
INFO: Deleting container rancher-agent
INFO: Launched Rancher Agent: 3415a1fd101f3c57d9cff6aef373c0ce66a3e20772122d2ca832039dcefd92fd

```

[![][7]![][7]][13]

Wait few seconds then the newly added host will be visible. To bring this Go to Infrastructure >> Hosts page.
[![][7]![][7]][14]

### How To View Containers

Just navigate the following location to view a list of running containers. Go to >> Infrastructure >> Containers.
[![][7]![][7]][15]

### How To Create Container

It’s very simple, just navigate the following location to create a container.

Go to >> Infrastructure >> Containers >> “Add Container” and input the required information as per your requirement. To test this, i’m going to create Centos container with latest OS.
[![][7]![][7]][16]

The same has been listed here. Infrastructure >> Containers
[![][7]![][7]][17]

Hit on the `Container` name to view the container performances information like CPU, memory, network and storage.
[![][7]![][7]][18]

To manage the container such as stop, start, clone, restart, etc. Choose the particular container then hit `Three dot's` button in the left side of the container or `Actions` button to perform.
[![][7]![][7]][19]

If you want console access of the container, just hit `Execute Shell` option in the action button.
[![][7]![][7]][20]

### How To Deploy Container From Application Catalog

Rancher provides a catalog of application templates that make it easy to deploy in single click. It’s maintain popular applications (nearly 90) contributed by the Rancher community.
[![][7]![][7]][21]

Go to >> Catalog >> All >> Choose the required application >> Finally hit “Launch” button to deploy.
[![][7]![][7]][22]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/rancher-a-complete-container-management-platform-for-production-environment/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/portainer-a-simple-docker-management-gui/
[2]:http://rancher.com/
[3]:https://www.2daygeek.com/install-docker-on-centos-rhel-fedora-ubuntu-debian-oracle-archi-scentific-linux-mint-opensuse/
[4]:https://www.2daygeek.com/list-search-pull-download-remove-docker-images-on-linux/
[5]:https://www.2daygeek.com/create-run-list-start-stop-attach-delete-interactive-daemonized-docker-containers-on-linux/
[6]:https://www.2daygeek.com/install-run-applications-inside-docker-containers/
[7]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-1.png
[9]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-2.png
[10]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-3.png
[11]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-3a.png
[12]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-4.png
[13]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-5.png
[14]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-6.png
[15]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-7.png
[16]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-8.png
[17]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-9.png
[18]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-10.png
[19]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-11.png
[20]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-12.png
[21]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-13.png
[22]:https://www.2daygeek.com/wp-content/uploads/2018/02/Install-rancher-container-management-application-in-linux-14.png
