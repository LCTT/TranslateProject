translation by  strugglingyouth
nstalling NGINX and NGINX Plus With Ansible
================================================================================
在生产环境中，我会更喜欢做与自动化相关的所有事情。如果计算机能完成你的任务，何必需要你亲自动手呢？但是，在不断变化并存在多种技术的环境中，创建和实施自动化是一项艰巨的任务。这就是为什么我喜欢[Ansible][1]。Ansible是免费的，开源的，对于 IT 配置管理，部署和业务流程，使用起来非常方便。


我最喜欢 Ansible 的一个特点是，它是完全无客户端。要管理一个系统，通过 SSH 建立连接，也使用了[Paramiko][2]（一个 Python 库）或本地的 [OpenSSH][3]。Ansible 另一个吸引人的地方是它有许多可扩展的模块。这些模块可被系统管理员用于执行一些的相同任务。特别是，它们使用 Ansible 这个强有力的工具可以安装和配置任何程序在多个服务器上，环境或操作系统，只需要一个控制节点。

在本教程中，我将带你使用 Ansible 完成安装和部署开源[NGINX][4] 和 [NGINX Plus][5]，我们的商业产品。我将在 [CentOS][6] 服务器上演示，但我也写了一个详细的教程关于在 Ubuntu 服务器上部署[在 Ubuntu 上创建一个 Ansible Playbook 来安装 NGINX 和 NGINX Plus][7] 。

在本教程中我将使用 Ansible 1.9.2 版本的，并在 CentOS 7.1 服务器上部署运行。

    $ ansible --version
    ansible 1.9.2
    
    $ cat /etc/redhat-release
    CentOS Linux release 7.1.1503 (Core)

如果你还没有 Ansible，可以在 [Ansible 网站][8] 查看说明并安装它。

如果你使用的是 CentOS，安装 Ansible 十分简单，只要输入以下命令。如果你想使用源码编译安装或使用其他发行版，请参阅上面 Ansible 链接中的说明。


    $ sudo yum install -y epel-release && sudo yum install -y ansible

根据环境的不同，在本教程中的命令有的可能需要 sudo 权限。文件路径，用户名，目标服务器的值取决于你的环境中。

### 创建一个 Ansible Playbook 来安装 NGINX (CentOS) ###

首先，我们为 NGINX 的部署创建一个工作目录，以及子目录和部署配置文件目录。我通常建议在主目录中创建目录，在文章的所有例子中都会有说明。

    $ cd $HOME
    $ mkdir -p ansible-nginx/tasks/
    $ touch ansible-nginx/deploy.yml
    $ touch ansible-nginx/tasks/install_nginx.yml

目录结构看起来是这样的。你可以使用 tree 命令来查看。

    $ tree $HOME/ansible-nginx/
    /home/kjones/ansible-nginx/
    ├── deploy.yml
    └── tasks
        └── install_nginx.yml
    
    1 directory, 2 files

如果你没有安装 tree 命令，使用以下命令去安装。

    $ sudo yum install -y tree

#### 创建主部署文件 ####

接下来，我们在文本编辑器中打开 **deploy.yml**。我喜欢在命令行上使用 vim 来编辑配置文件，在整个教程中也都将使用它。

    $ vim $HOME/ansible-nginx/deploy.yml

**deploy.yml** 文件是 Ansible 部署的主要文件，[ 在使用 Ansible 部署 NGINX][9] 时，我们将运行 ansible‑playbook 命令执行此文件。在这个文件中，我们指定运行时 Ansible 使用的库以及其它配置文件。

在这个例子中，我使用 [include][10] 模块来指定配置文件一步一步来安装NGINX。虽然可以创建一个非常大的 playbook 文件，我建议你将其分割为小文件，以保证其可靠性。示例中的包括复制静态内容，复制配置文件，为更高级的部署使用逻辑配置设定变量。

在文件中输入以下行。包括顶部参考注释中的文件名。

    # ./ansible-nginx/deploy.yml
    
    - hosts: nginx
      tasks:
        - include: 'tasks/install_nginx.yml'

 hosts 语句说明 Ansible 部署 **nginx** 组的所有服务器，服务器在 **/etc/ansible/hosts** 中指定。我们将编辑此文件来 [创建 NGINX 服务器的列表][11]。

include 语句说明 Ansible 在部署过程中从 **tasks** 目录下读取并执行 **install_nginx.yml** 文件中的内容。该文件包括以下几步：下载，安装，并启动 NGINX。我们将创建此文件在下一节。

#### 为 NGINX 创建部署文件 ####

现在，先保存 **deploy.yml** 文件，并在编辑器中打开 **install_nginx.yml** 。

    $ vim $HOME/ansible-nginx/tasks/install_nginx.yml

该文件包含的说明有 - 以 [YAML][12] 格式写入 - 使用 Ansible 安装和配置 NGINX。每个部分（步骤中的过程）起始于一个 name 声明（前面连字符）描述此步骤。下面的 name 字符串：是 Ansible 部署过程中写到标准输出的，可以根据你的意愿来改变。YAML 文件中的下一个部分是在部署过程中将使用的模块。在下面的配置中，[yum][13] 和 [service][14] 模块使将被用。yum 模块用于在 CentOS 上安装软件包。service 模块用于管理 UNIX 的服务。在这部分的最后一行或几行指定了几个模块的参数（在本例中，这些行以 name 和 state 开始）。

在文件中输入以下行。对于 **deploy.yml**，在我们文件的第一行是关于文件名的注释。第一部分说明 Ansible 从 NGINX 仓库安装 **.rpm** 文件在CentOS 7 上。这说明软件包管理器直接从 NGINX 仓库安装最新最稳定的版本。需要在你的 CentOS 版本上修改路径。可使用包的列表可以在 [开源 NGINX 网站][15] 上找到。接下来的两节说明 Ansible 使用 yum 模块安装最新的 NGINX 版本，然后使用 service 模块启动 NGINX。

**注意:** 在第一部分中，CentOS 包中的路径名是连着的两行。在一行上输入其完整路径。

    # ./ansible-nginx/tasks/install_nginx.yml
     
    - name: NGINX | Installing NGINX repo rpm
      yum:
        name: http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
     
    - name: NGINX | Installing NGINX
      yum:
        name: nginx
        state: latest
     
    - name: NGINX | Starting NGINX
      service:
        name: nginx
        state: started

#### 创建 NGINX 服务器列表 ####

现在，我们有 Ansible 部署所有配置的文件，我们需要告诉 Ansible 部署哪个服务器。我们需要在 Ansible 中指定 **hosts** 文件。先备份现有的文件，并新建一个新文件来部署。

    $ sudo mv /etc/ansible/hosts /etc/ansible/hosts.backup
    $ sudo vim /etc/ansible/hosts

在文件中输入以下行来创建一个名为 **nginx** 的组并列出安装 NGINX 的服务器。你可以指定服务器通过主机名，IP 地址，或者在一个区域，例如 **server[1-3].domain.com**。在这里，我指定一台服务器通过 IP 地址。

    # /etc/ansible/hosts
    
    [nginx]
    172.16.239.140

#### 设置安全性 ####

在部署之前，我们需要确保 Ansible 已通过 SSH 授权能访问我们的目标服务器。

首选并且最安全的方法是添加 Ansible 所要部署服务器的 RSA SSH 密钥到目标服务器的 **authorized_keys** 文件中，这给 Ansible 在目标服务器上的 SSH 权限不受限制。要了解更多关于此配置，请参阅 [安全的 OpenSSH][16] 在 wiki.centos.org。这样，你就可以自动部署而无需用户交互。

另外，你也可以在部署过程中需要输入密码。我强烈建议你只在测试过程中使用这种方法，因为它是不安全的，没有办法判断目标主机的身份。如果你想这样做，将每个目标主机 **/etc/ssh/ssh_config** 文件中 StrictHostKeyChecking 的默认值 yes 改为 no。然后在 ansible-playbook 命令中添加 --ask-pass参数来表示 Ansible 会提示输入 SSH 密码。

在这里，我将举例说明如何编辑 **ssh_config** 文件来禁用在目标服务器上严格的主机密钥检查。我们手动 SSH 到我们将部署 NGINX 的服务器并将StrictHostKeyChecking 的值更改为 no。

    $ ssh kjones@172.16.239.140
    kjones@172.16.239.140's password:***********
     
    [kjones@nginx ]$ sudo vim /etc/ssh/ssh_config

当你更改后，保存 **ssh_config**，并通过 SSH 连接到你的 Ansible 服务器。保存后的设置应该如下图所示。

    # /etc/ssh/ssh_config
    
    StrictHostKeyChecking no

#### 运行 Ansible 部署 NGINX ####

如果你一直照本教程的步骤来做，你可以运行下面的命令来使用 Ansible 部署NGINX。（同样，如果你设置了 RSA SSH 密钥认证，那么--ask-pass 参数是不需要的。）在 Ansible 服务器运行命令，并使用我们上面创建的配置文件。

    $ sudo ansible-playbook --ask-pass $HOME/ansible-nginx/deploy.yml

Ansible 提示输入 SSH 密码，输出如下。recap 中显示 failed=0 这条信息，意味着部署成功了。

    $ sudo ansible-playbook --ask-pass $HOME/ansible-nginx/deploy.yml
    SSH password:
     
    PLAY [all] ********************************************************************
     
    GATHERING FACTS ***************************************************************
    ok: [172.16.239.140]
     
    TASK: [NGINX | Installing NGINX repo rpm] *************************************
    changed: [172.16.239.140]
     
    TASK: [NGINX | Installing NGINX] **********************************************
    changed: [172.16.239.140]
     
    TASK: [NGINX | Starting NGINX] ************************************************
    changed: [172.16.239.140]
     
    PLAY RECAP ********************************************************************
    172.16.239.140             : ok=4    changed=3    unreachable=0    failed=0

如果你没有得到一个成功的 play recap，你可以尝试用 -vvvv 参数（带连接调试的详细信息）再次运行 ansible-playbook 命令来解决部署过程的问题。

当部署成功（因为我们不是第一次部署）后，你可以验证 NGINX 在远程服务器上运行基本的 [cURL][17] 命令。在这里，它会返回 200 OK。Yes！我们使用Ansible 成功安装了 NGINX。

    $ curl -Is 172.16.239.140 | grep HTTP
    HTTP/1.1 200 OK

### 创建 Ansible Playbook 来安装 NGINX Plus (CentOS) ###

现在，我已经展示了如何安装 NGINX 的开源版本，我将带你完成安装 NGINX Plus。这需要更改一些额外的部署配置，并展示了一些 Ansible 的其他功能。

#### 复制 NGINX Plus 上的证书和密钥到 Ansible 服务器 ####

使用 Ansible 安装和配置 NGINX Plus 时，首先我们需要将 [NGINX Plus Customer Portal][18] 的密钥和证书复制到部署 Ansible 服务器上的标准位置。

购买了 NGINX Plus 或正在试用的客户也可以访问 NGINX Plus Customer Portal。如果你有兴趣测试 NGINX Plus，你可以申请免费试用30天[点击这里][19]。在你注册后不久你将收到一个试用证书和密钥的链接。

在 Mac 或 Linux 主机上，我在这里演示使用 [scp][20] 工具。在 Microsoft Windows 主机，可以使用 [WinSCP][21]。在本教程中，先下载文件到我的 Mac 笔记本电脑上，然后使用 scp 将其复制到 Ansible 服务器。密钥和证书的位置都在我的家目录下。

    $ cd /path/to/nginx-repo-files/
    $ scp nginx-repo.* user@destination-server:.

接下来，我们通过 SSH 连接到 Ansible 服务器，确保 NGINX Plus 的 SSL 目录存在，移动文件到这儿。

    $ ssh user@destination-server
    $ sudo mkdir -p /etc/ssl/nginx/
    $ sudo mv nginx-repo.* /etc/ssl/nginx/

验证你的 **/etc/ssl/nginx** 目录包含证书(**.crt**)和密钥(**.key**)文件。你可以使用 tree 命令检查。

    $ tree /etc/ssl/nginx
    /etc/ssl/nginx
    ├── nginx-repo.crt
    └── nginx-repo.key
     
    0 directories, 2 files

如果你没有安装 tree，可以使用下面的命令去安装。

    $ sudo yum install -y tree

#### 创建 Ansible 目录结构 ####

以下执行的步骤将和开源 NGINX 的非常相似在[创建安装 NGINX 的 Ansible Playbook 中(CentOS)][22]。首先，我们建一个工作目录为部署 NGINX Plus 使用。我喜欢将它创建为我主目录的子目录。

    $ cd $HOME
    $ mkdir -p ansible-nginx-plus/tasks/
    $ touch ansible-nginx-plus/deploy.yml
    $ touch ansible-nginx-plus/tasks/install_nginx_plus.yml

目录结构看起来像这样。

    $ tree $HOME/ansible-nginx-plus/
    /home/kjones/ansible-nginx-plus/
    ├── deploy.yml
    └── tasks
    └── install_nginx_plus.yml
     
    1 directory, 2 files

#### 创建主部署文件 ####

接下来，我们使用 vim 为开源的 NGINX 创建 **deploy.yml** 文件。

    $ vim ansible-nginx-plus/deploy.yml

和开源 NGINX 的部署唯一的区别是，我们将包含文件的名称修改为**install_nginx_plus.yml**。该文件告诉 Ansible 在 **nginx** 组中的所有服务器（**/etc/ansible/hosts** 中定义的）上部署 NGINX Plus ，然后在部署过程中从 **tasks** 目录读取并执行 **install_nginx_plus.yml** 的内容。

    # ./ansible-nginx-plus/deploy.yml
     
    - hosts: nginx
      tasks:
        - include: 'tasks/install_nginx_plus.yml'

如果你还没有这样做的话，你需要创建 hosts 文件，详细说明在上面的 [创建 NGINX 服务器的列表][23]。

#### 为 NGINX Plus 创建部署文件 ####

在文本编辑器中打开 **install_nginx_plus.yml**。该文件在部署过程中使用 Ansible 来安装和配置 NGINX Plus。这些命令和模块仅针对 CentOS，有些是 NGINX Plus 独有的。

    $ vim ansible-nginx-plus/tasks/install_nginx_plus.yml

第一部分使用 [文件][24] 模块，告诉 Ansible 使用指定的路径和状态参数为 NGINX Plus 创建特定的 SSL 目录，设置根目录的权限，将权限更改为0700。

    # ./ansible-nginx-plus/tasks/install_nginx_plus.yml
     
    - name: NGINX Plus | 创建 NGINX Plus ssl 证书目录
      file: path=/etc/ssl/nginx state=directory group=root mode=0700

接下来的两节使用 [copy][25] 模块从部署 Ansible 的服务器上将 NGINX Plus 的证书和密钥复制到 NGINX Plus 服务器上，再修改权根，将权限设置为0700。

    - name: NGINX Plus | 复制 NGINX Plus repo 证书 
      copy: src=/etc/ssl/nginx/nginx-repo.crt dest=/etc/ssl/nginx/nginx-repo.crt owner=root group=root mode=0700
     
    - name: NGINX Plus | 复制 NGINX Plus 密钥
      copy: src=/etc/ssl/nginx/nginx-repo.key dest=/etc/ssl/nginx/nginx-repo.key owner=root group=root mode=0700

接下来，我们告诉 Ansible 使用 [get_url][26] 模块从 NGINX Plus 仓库下载 CA 证书在 url 参数指定的远程位置，通过 dest 参数把它放在指定的目录，并设置权限为 0700。

    - name: NGINX Plus | 下载 NGINX Plus CA 证书
      get_url: url=https://cs.nginx.com/static/files/CA.crt dest=/etc/ssl/nginx/CA.crt mode=0700

同样，我们告诉 Ansible 使用 get_url 模块下载 NGINX Plus repo 文件，并将其复制到 **/etc/yum.repos.d** 目录下在 NGINX Plus 服务器上。

    - name: NGINX Plus | 下载 yum NGINX Plus 仓库
      get_url: url=https://cs.nginx.com/static/files/nginx-plus-7.repo dest=/etc/yum.repos.d/nginx-plus-7.repo mode=0700

最后两节的 name 告诉 Ansible 使用 yum 和 service 模块下载并启动 NGINX Plus。

    - name: NGINX Plus | 安装 NGINX Plus
      yum:
        name: nginx-plus
        state: latest
     
    - name: NGINX Plus | 启动 NGINX Plus
      service:
        name: nginx
        state: started

#### 运行 Ansible 来部署 NGINX Plus ####

在保存 **install_nginx_plus.yml** 文件后，然后运行 ansible-playbook 命令来部署 NGINX Plus。同样在这里，我们使用 --ask-pass 参数使用 Ansible 提示输入 SSH 密码并把它传递给每个 NGINX Plus 服务器，指定路径在 **deploy.yml** 文件中。

    $ sudo ansible-playbook --ask-pass $HOME/ansible-nginx-plus/deploy.yml
     
    PLAY [nginx] ******************************************************************
     
    GATHERING FACTS ***************************************************************
    ok: [172.16.239.140]
     
    TASK: [NGINX Plus | Creating NGINX Plus ssl cert repo directory] **************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Copying NGINX Plus repository certificate] ****************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Copying NGINX Plus repository key] ************************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Downloading NGINX Plus CA certificate] ********************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Downloading yum NGINX Plus repository] ********************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Installing NGINX Plus] ************************************
    changed: [172.16.239.140]
     
    TASK: [NGINX Plus | Starting NGINX Plus] **************************************
    changed: [172.16.239.140]
     
    PLAY RECAP ********************************************************************
    172.16.239.140             : ok=8    changed=7    unreachable=0    failed=0

playbook 的 recap 是成功的。现在，使用 curl 命令来验证 NGINX Plus 是否在运行。太好了，我们得到的是 200 OK！成功了！我们使用 Ansible 成功地安装了 NGINX Plus。

    $ curl -Is http://172.16.239.140 | grep HTTP
    HTTP/1.1 200 OK

### 在 Ubuntu 上创建一个 Ansible Playbook 来安装 NGINX 和 NGINX Plus  ###

此过程在 [Ubuntu 服务器][27] 上部署 NGINX 和 NGINX Plus 与 CentOS 很相似，我将一步一步的指导来完成整个部署文件，并指出和 CentOS 的细微差异。

首先和 CentOS 一样，创建 Ansible 目录结构和主要的 Ansible 部署文件。也创建 **/etc/ansible/hosts** 文件来描述 [创建 NGINX 服务器的列表][28]。对于 NGINX Plus，你也需要复制证书和密钥在此步中 [复制 NGINX Plus 证书和密钥到 Ansible 服务器][29]。

下面是开源 NGINX 的 **install_nginx.yml** 部署文件。在第一部分，我们使用 [apt_key][30] 模块导入 Nginx 的签名密钥。接下来的两节使用[lineinfile][31] 模块来添加 URLs 到 **sources.list** 文件中。最后，我们使用 [apt][32] 模块来更新缓存并安装 NGINX（apt 取代了我们在 CentOS 中部署时的 yum 模块）。

    # ./ansible-nginx/tasks/install_nginx.yml
     
    - name: NGINX | 添加 NGINX 签名密钥
      apt_key: url=http://nginx.org/keys/nginx_signing.key state=present
     
    - name: NGINX | 为 NGINX 添加 sources.list deb url  
      lineinfile: dest=/etc/apt/sources.list line="deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx"
     
    - name: NGINX Plus | 为 NGINX 添加 sources.list deb-src url  
      lineinfile: dest=/etc/apt/sources.list line="deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx"
     
    - name: NGINX | 更新 apt 缓存
      apt:
        update_cache: yes
     
    - name: NGINX | 安装 NGINX
      apt:
        pkg: nginx
        state: latest
     
    - name: NGINX | 启动 NGINX
      service:
        name: nginx
        state: started
下面是 NGINX Plus 的部署文件 **install_nginx.yml**。前四节设置了 NGINX Plus 密钥和证书。然后，我们用 apt_key 模块为开源的 NGINX 导入签名密钥，get_url 模块为 NGINX Plus 下载 apt 配置文件。[shell][33] 模块使用 printf 命令写下输出到 **nginx-plus.list** 文件中在**sources.list.d** 目录。最终的 name 模块是为开源 NGINX 的。

    # ./ansible-nginx-plus/tasks/install_nginx_plus.yml
     
    - name: NGINX Plus | 创建 NGINX Plus ssl 证书 repo 目录
      file: path=/etc/ssl/nginx state=directory group=root mode=0700
     
    - name: NGINX Plus | 复制 NGINX Plus 仓库证书
      copy: src=/etc/ssl/nginx/nginx-repo.crt dest=/etc/ssl/nginx/nginx-repo.crt owner=root group=root mode=0700
     
    - name: NGINX Plus | 复制 NGINX Plus 仓库密钥
      copy: src=/etc/ssl/nginx/nginx-repo.key dest=/etc/ssl/nginx/nginx-repo.key owner=root group=root mode=0700
     
    - name: NGINX Plus | 安装 NGINX Plus CA 证书
      get_url: url=https://cs.nginx.com/static/files/CA.crt dest=/etc/ssl/nginx/CA.crt mode=0700
     
    - name: NGINX Plus | 添加 NGINX Plus 签名密钥
      apt_key: url=http://nginx.org/keys/nginx_signing.key state=present
     
    - name: NGINX Plus | 安装 Apt-Get NGINX Plus 仓库
      get_url: url=https://cs.nginx.com/static/files/90nginx dest=/etc/apt/apt.conf.d/90nginx mode=0700
     
    - name: NGINX Plus | 为 NGINX Plus 添加 sources.list url  
      shell: printf "deb https://plus-pkgs.nginx.com/ubuntu `lsb_release -cs` nginx-plus\n" >/etc/apt/sources.list.d/nginx-plus.list
     
    - name: NGINX Plus | 运行 apt-get update
      apt:
        update_cache: yes
     
    - name: NGINX Plus | 安装 NGINX Plus 通过 apt-get
      apt:
        pkg: nginx-plus
        state: latest
     
    - name: NGINX Plus | 启动 NGINX Plus
      service:
        name: nginx
        state: started

现在我们已经准备好运行 ansible-playbook 命令：

    $ sudo ansible-playbook --ask-pass $HOME/ansible-nginx-plus/deploy.yml

你应该得到一个成功的 play recap。如果你没有成功，你可以使用 verbose 参数，以帮助你解决在 [运行 Ansible 来部署 NGINX][34] 中出现的问题。

### 小结 ###

我在这个教程中演示是什么是 Ansible，可以做些什么来帮助你自动部署 NGINX 或 NGINX Plus，这仅仅是个开始。还有许多有用的模块，用户账号管理，自定义配置模板等。如果你有兴趣了解更多关于这些，请访问 [Ansible 官方文档][35]。

要了解更多关于 Ansible，来听我讲用 Ansible 部署 NGINX Plus 在[NGINX.conf 2015][36]，9月22-24日在旧金山。

--------------------------------------------------------------------------------

via: https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/

作者：[Kevin Jones][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.nginx.com/blog/author/kjones/
[1]:http://www.ansible.com/
[2]:http://www.paramiko.org/
[3]:http://www.openssh.com/
[4]:http://nginx.org/en/
[5]:https://www.nginx.com/products/
[6]:http://www.centos.org/
[7]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#ubuntu
[8]:http://docs.ansible.com/ansible/intro_installation.html#installing-the-control-machine
[9]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#deploy-nginx
[10]:http://docs.ansible.com/ansible/playbooks_roles.html#task-include-files-and-encouraging-reuse
[11]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#list-nginx
[12]:http://docs.ansible.com/ansible/YAMLSyntax.html
[13]:http://docs.ansible.com/ansible/yum_module.html
[14]:http://docs.ansible.com/ansible/service_module.html
[15]:http://nginx.org/en/linux_packages.html
[16]:http://wiki.centos.org/HowTos/Network/SecuringSSH
[17]:http://curl.haxx.se/
[18]:https://cs.nginx.com/
[19]:https://www.nginx.com/#free-trial
[20]:http://linux.die.net/man/1/scp
[21]:https://winscp.net/eng/download.php
[22]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#playbook-nginx
[23]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#list-nginx
[24]:http://docs.ansible.com/ansible/file_module.html
[25]:http://docs.ansible.com/ansible/copy_module.html
[26]:http://docs.ansible.com/ansible/get_url_module.html
[27]:http://www.ubuntu.com/
[28]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#list-nginx
[29]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#copy-cert-key
[30]:http://docs.ansible.com/ansible/apt_key_module.html
[31]:http://docs.ansible.com/ansible/lineinfile_module.html
[32]:http://docs.ansible.com/ansible/apt_module.html
[33]:http://docs.ansible.com/ansible/shell_module.html
[34]:https://www.nginx.com/blog/installing-nginx-nginx-plus-ansible/#deploy-nginx
[35]:http://docs.ansible.com/
[36]:https://www.nginx.com/nginxconf/
