使用 Ansible Container 构建和测试应用程序
=======

![](https://fedoramagazine.org/wp-content/uploads/2017/10/ansible-container-945x400.jpg)

容器是一个日益流行的开发环境。作为一名开发人员，你可以选择多种工具来管理你的容器。本文将向你介绍 Ansible Container，并展示如何在类似生产环境中运行和测试你的应用程序。

### 入门

这个例子使用了一个简单的 Flask Hello World 程序。这个程序就像在生产环境中一样由 Apache HTTP 服务器提供服务。首先，安装必要的 `docker` 包：

```
sudo dnf install docker
```

Ansible Container 需要通过本地套接字与 Docker 服务进行通信。以下命令将更改套接字所有者，并将你添加到可访问此套接字的 `docker` 用户组：

```
sudo groupadd docker && sudo gpasswd -a $USER docker
MYGRP=$(id -g) ; newgrp docker ; newgrp $MYGRP
```

运行 `id` 命令以确保 `docker` 组在你的组成员中列出。最后，[使用 sudo ][2]启用并启动 docker 服务：

```
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

### 设置 Ansible Container

Ansible Container 使你能够构建容器镜像并使用 Ansible playbook 进行编排。该程序在一个 YAML 文件中描述，而不是使用 Dockerfile，列出组成容器镜像的 Ansible 角色。

不幸的是，Ansible Container 在 Fedora 中没有 RPM 包可用。要安装它，请使用 python3 虚拟环境模块。

```
mkdir ansible-container-flask-example
cd ansible-container-flask-example
python3 -m venv .venv
source .venv/bin/activate
pip install ansible-container[docker]
```

这些命令将安装 Ansible Container 及 Docker 引擎。 Ansible Container 提供三种引擎：Docker、Kubernetes 和 Openshift。

### 设置项目

现在已经安装了 Ansible Container，接着设置这个项目。Ansible Container 提供了一个简单的命令来创建启动所需的所有文件：

```
ansible-container init
```

来看看这个命令在当前目录中创建的文件：

*   `ansible.cfg` 
*   `ansible-requirements.txt` 
*   `container.yml` 
*   `meta.yml` 
*   `requirements.yml` 

该项目仅使用 `container.yml` 来描述程序服务。有关其他文件的更多信息，请查看 Ansible Container 的[入门][3]文档。

### 定义容器

如下更新 `container.yml`：

```
version: "2"
settings:
  conductor:
    # The Conductor container does the heavy lifting, and provides a portable
    # Python runtime for building your target containers. It should be derived
    # from the same distribution as you're building your target containers with.
    base: fedora:26
    # roles_path:   # Specify a local path containing Ansible roles
    # volumes:      # Provide a list of volumes to mount
    # environment:  # List or mapping of environment variables

  # Set the name of the project. Defaults to basename of the project directory.
  # For built services, concatenated with service name to form the built image name.
  project_name: flask-helloworld

services: 
  # Add your containers here, specifying the base image you want to build from.
  # To use this example, uncomment it and delete the curly braces after services key.
  # You may need to run `docker pull ubuntu:trusty` for this to work.
  web:
    from: "fedora:26"
    roles: 
      - base
    ports:
      - "5000:80"
    command: ["/usr/bin/dumb-init", "httpd", "-DFOREGROUND"]
    volumes:
      - $PWD/flask-helloworld:/flaskapp:Z
```

`conductor` 部分更新了基本设置以使用 Fedora 26 容器基础镜像。

`services` 部分添加了 `web` 服务。这个服务使用 Fedora 26，后面有一个名为 `base` 的角色。它还设置容器和主机之间的端口映射。Apache HTTP 服务器为容器的端口 80 上的 Flask 程序提供服务，该容器重定向到主机的端口 5000。然后这个文件定义了一个卷，它将 Flask 程序源代码挂载到容器中的 `/flaskapp` 中。

最后，容器启动时运行 `command` 配置。这个例子中使用 [dumb-init][4]，一个简单的进程管理器并初始化系统启动 Apache HTTP 服务器。

### Ansible 角色

现在已经设置完了容器，创建一个 Ansible 角色来安装并配置 Flask 程序所需的依赖关系。首先，创建 `base` 角色。

```
mkdir -p roles/base/tasks
touch roles/base/tasks/main.yml
```

现在编辑 `main.yml` ，它看起来像这样：

```
---
- name: Install dependencies 
  dnf: pkg={{item}} state=present
  with_items:
    - python3-flask
    - dumb-init
    - httpd
    - python3-mod_wsgi

- name: copy the apache configuration
  copy:
    src: flask-helloworld.conf
    dest: /etc/httpd/conf.d/flask-helloworld.conf
    owner: apache
    group: root
    mode: 655
```

这个 Ansible 角色是简单的。首先它安装依赖关系。然后，复制 Apache HTTP 服务器配置。如果你对 Ansible 角色不熟悉，请查看[角色文档][5]。

### Apache HTTP 配置

接下来，通过创建 `flask-helloworld.conf` 来配置 Apache HTTP 服务器：

```
$ mkdir -p roles/base/files
$ touch roles/base/files/flask-helloworld.conf
```

最后将以下内容添加到文件中：

```
<VirtualHost *>
    ServerName example.com

    WSGIDaemonProcess hello_world user=apache group=root
    WSGIScriptAlias / /flaskapp/flask-helloworld.wsgi

    <Directory /flaskapp>
        WSGIProcessGroup hello_world
        WSGIApplicationGroup %{GLOBAL}
    Require all granted
    </Directory>
</VirtualHost>
```

这个文件的重要部分是 `WSGIScriptAlias`。该指令将脚本 `flask-helloworld.wsgi` 映射到 `/`。有关 Apache HTTP 服务器和 mod_wsgi 的更多详细信息，请阅读 [Flask 文档][6]。

### Flask “hello world”

最后，创建一个简单的 Flask 程序和 ` flask-helloworld.wsgi` 脚本。

```
mkdir flask-helloworld
touch flask-helloworld/app.py
touch flask-helloworld/flask-helloworld.wsgi
```

将以下内容添加到 `app.py`：

```
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"
```

然后编辑 `flask-helloworld.wsgi` ，添加这个：

```
import sys
sys.path.insert(0, '/flaskapp/')

from app import app as application
```

### 构建并运行

现在是时候使用 `ansible-container build` 和 `ansible-container run` 命令来构建和运行容器。

```
ansible-container build
```

这个命令需要一些时间来完成，所以要耐心等待。

```
ansible-container run
```

你现在可以通过以下 URL 访问你的 flask 程序： http://localhost:5000/

### 结论

你现在已经看到如何使用 Ansible Container 来管理、构建和配置在容器中运行的程序。本例的所有配置文件和源代码在 [Pagure.io][7] 上。你可以使用此例作为基础来开始在项目中使用 Ansible Container。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/build-test-applications-ansible-container/

作者：[Clement Verna][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/cverna/
[1]:https://fedoramagazine.org/build-test-applications-ansible-container/
[2]:https://fedoramagazine.org/howto-use-sudo/
[3]:https://docs.ansible.com/ansible-container/getting_started.html
[4]:https://github.com/Yelp/dumb-init
[5]:http://docs.ansible.com/ansible/latest/playbooks_reuse_roles.html
[6]:http://flask.pocoo.org/docs/0.12/deploying/mod_wsgi/
[7]:https://pagure.io/ansible-container-flask-example
