
Rancher - 容器管理平台
======
Docker作为一款容器化应用的新兴软件， 被大多数IT公司使用来减少基础设施平台建设的成本。

通常，没有GUI的docker软件对于Linux管理员很友好，但是对于开发者来说很不友好。当把它搬到生产环境上来，那么它对Linux管理员来说也相当不友好。那么，什么最佳解决方案可以轻松的管理docker。

仅有的方式那就是提供GUI。Docker API允许第三方平台接入Docker。在市场上有许多docker GUI应用可用。我们已经写了一篇关于Portainer应用的文章。今天我们来讨论另一个应用，Rancher。

容器让软件开发更容易，让开发者写代码更快且更好的运行它们。但是，在生产环境上运行容器却很困难。

**推荐阅读 :** [Portainer – A Simple Docker Management GUI][1]

### What is Rancher
[Rancher][2]是一个完整的容器管理平台，在任意基础设施平台的生产环境上，它让容器的部署和运行更容易。它提供了诸如多主机网络，全局、局部负载均衡和卷快照等基础设施服务。它整合原生Docker的管理能力，如Docker Machine和Docker Swarm。它提供了丰富的用户体验，让devops管理员以一个更大的规模在生产环境上运行Docker。

以下文章导航到在Linux系统上安装Docker。

**推荐阅读 :**
**(#)** [How to install Docker in Linux][3]
**(#)** [How to play with Docker images on Linux][4]
**(#)** [How to play with Docker containers on Linux][5]
**(#)** [How to Install, Run Applications inside Docker Containers][6]

### Rancher 特性

  * 在两分钟内安装Kubernetes。
  * 单机启动应用（90个流行的Docker应用）。
  * 部署和管理Docker更容易。
  * 全面的生产级容器管理平台。
  * 在生产环境上快速部署容器。
  * 强大的自动部署和运营容器技术。
  * 模块化基础设施服务。
  * 丰富的编排工具。
  * Rancher支持多种认证机制。



### 怎样安装Rancher

由于Rancher是以轻量级的Docker容器方式运行，所以它的安装非常简单。Rancher是由一组Docker容器部署。只需要简单的启动两个容器就能运行Rancher。一个容器用作管理服务，另一个容器在各个节点上作为代理。在Linux系统下简单的运行下列命令就能部署Rancher。

Rancher服务提供了两个不同的安装包标签如`stable`和`latest`。下列命令将会拉去适合的rancher镜像并安装到你的操作系统上。Rancher server仅需要几分钟就可以启动。

  * `latest` : 这个标签是他们的最新开发构建。这些构建将通过rancher CI的自动化框架进行验证，不建议在生产环境使用。
  * `stable` : 这是最新的稳定发行版本，推荐在生产环境使用。


Rancher的安装方法有多种。在这边教程中我们仅讨论两种方法。

  * 以单一容器的方式安装Rancher（内嵌Rancher数据库）
  * 以单一容器的方式安装Rancher（外部数据库）



### 方法-1

运行下列命令以单一容器的方式安装rancher服务（内嵌数据库）
```
$ sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:stable

$ sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:latest

```

### 方法-2

你可以开始Rancher服务时指向外部数据库，而不是使用内部数据库。首先创建所需的数据库，数据库用户为同一个。
```
> CREATE DATABASE IF NOT EXISTS cattle COLLATE = 'utf8_general_ci' CHARACTER SET = 'utf8';
> GRANT ALL ON cattle.* TO 'cattle'@'%' IDENTIFIED BY 'cattle';
> GRANT ALL ON cattle.* TO 'cattle'@'localhost' IDENTIFIED BY 'cattle';

```

运行下列命令开始Rancher去连接外部数据库。
```
$ sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server \
 --db-host myhost.example.com --db-port 3306 --db-user username --db-pass password --db-name cattle

```
如果你想测试Rancher 2.0，使用下列的命令去开始。
```
$ sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/server:preview

```

### 通过GUI访问 & 安装Rancher

浏览器输入 `http://hostname:8080` or `http://server_ip:8080` 去访问 rancher GUI.
![03efbb176e40781f5e2231fa83dfaa8a.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p27)


### 怎样注册主机

注册你的主机URL允许去连接到Rancher API。这是一次性设置。

接下来，点击主菜单下面的`Add a Host`链接或者点击主菜单上的INFRASTRUCTURE >> Add Hosts，点击保存按钮。
![ef2ea6c909315f19fd0e112761e9cee4.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p9)


在rancher里默认访问控制认证机制是没有打开的，因此我们首先需要通过一些方法打开访问控制认证，否则任何人都不能访问GUI。

点击 >> Admin >> Access Control , 输入下列的值最后点击`打开认证`按钮去打开它。以我的案例，我通过`本地认证`的方式打开。

  * **`Login UserName`** 输入你期望的登录名
  * **`Full Name`** 输入你的全名
  * **`Password`** 输入你期望的密码
  * **`Confirm Password`** 再一次确认密码



![f7c28cc334daccc0d9acf78950818251.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p11)

注销然后使用新的登录凭证重新登陆
![5657104cbd4822c111bd117a7f928826.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p12)

现在，我能看到本地认证已经被打开。
![458648bd4ba0cee4b8e716825b5356f2.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p13)


### 怎样添加主机

点击注册你的主机后，它将带你进入下一个页面，在那里你能选择不同云服务提供商的Linux主机。我们将添加一个主机运行Rancher服务，因此选择`自定义`选项然后输入必要的信息。

在第四部输入你服务器的公有IP，运行第5步列出的命令，最后点击`close`按钮。
![38af35f3b207f4ba1c826ecf160aefee.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p14)
```

$ sudo docker run -e CATTLE_AGENT_IP="192.168.56.2"  --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.2.11 http://192.168.56.2:8080/v1/scripts/16A52B9BE2BAB87BB0F5:1546214400000:ODACe3sfis5V6U8E3JASL8jQ

INFO: Running Agent Registration Process, CATTLE_URL=http://192.168.56.2:8080/v1
INFO: Attempting to connect to: http://192.168.56.2:8080/v1
INFO: http://192.168.56.2:8080/v1 is accessible
INFO: Configured Host Registration URL info: CATTLE_URL=http://192.168.56.2:8080/v1 ENV_URL=http://192.168.56.2:8080/v1
INFO: Inspecting host capabilities
INFO: Boot2Docker: false
INFO: Host writable: true
INFO: Token: xxxxxxxx
INFO: Running registration
INFO: Printing Environment
INFO: ENV: CATTLE_ACCESS_KEY=9946BD1DCBCFEF3439F8
INFO: ENV: CATTLE_AGENT_IP=192.168.56.2
INFO: ENV: CATTLE_HOME=/var/lib/cattle
INFO: ENV: CATTLE_REGISTRATION_ACCESS_KEY=registrationToken
INFO: ENV: CATTLE_REGISTRATION_SECRET_KEY=xxxxxxx
INFO: ENV: CATTLE_SECRET_KEY=xxxxxxx
INFO: ENV: CATTLE_URL=http://192.168.56.2:8080/v1
INFO: ENV: DETECTED_CATTLE_AGENT_IP=172.17.0.1
INFO: ENV: RANCHER_AGENT_IMAGE=rancher/agent:v1.2.11
INFO: Launched Rancher Agent: e83b22afd0c023dabc62404f3e74abb1fa99b9a178b05b1728186c9bfca71e8d

```

等待几秒钟后新添加的主机将会出现。点击INFRASTRUCTURE >> Hosts 页面。
![4620832d7f277d6d84ace7ca6d486d17.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p15)

### 怎样查看容器

只需要点击下列位置就能列出所有容器。点击 >> INFRASTRUCTURE >> Containers
![f62d012ee89c9c2bee58fe1204eb0a65.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p16)


### 怎样创建容器

非常简单, 只需点击下列位置就能创建容器。

点击 >> INFRASTRUCTURE >> Containers >> “Add Container” 然后输入每个你需要的信息。 方便测试, 我将创建一个latest标签的Centos容器。
![4c6ff6b04c543b573e2aa1330de087d2.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p21)

在同样的列表位置，点击 INFRASTRUCTURE >> Containers
![317f86d0860ad46576bedefe8c26f0a3.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p22)

点击`Container`名展示容器的性能信息，如CPU，内存，网络和存储。
![26e909d243f490b8fc856eadeb4e2f7d.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p19)

选择特定容器，然后点击最右边的`三点`按钮或者点击`Actions`按钮对容器进行管理，如停止，启动，克隆，重启等。
![0aa0e91f32426274c3d209c4e4dc5c46.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p23)

如果你想控制台访问容器，只需要点击action按钮中的`Execute Shell`选项即可。
![83c3b6c9e959fa8d8946e6449e854e43.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p24)

### 怎样从应用目录部署容器

Rancher 提供了一个应用模版目录，让部署变的很容易，只需要单击一下就可以。
它维护了多数流行应用，这些应用由Rancher社区贡献。
![d38aeb44d759a7eb4e787c5a273d5bfa.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p25)

点击 >> Catalog >> All >> 选择你需要的应用 >> 最后点击运行去部署。
![aad6948878609c1605fcf1091395cc8b.png](evernotecid://362D54D6-01E1-4A00-A4F0-91F1094EAA56/appyinxiangcom/11631496/ENResource/p26)


--------------------------------------------------------------------------------

浏览: https://www.2daygeek.com/rancher-a-complete-container-management-platform-for-production-environment/

作者：[Magesh Maruthamuthu][a]
译者：[arrowfeng](https://github.com/arrowfeng)
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
