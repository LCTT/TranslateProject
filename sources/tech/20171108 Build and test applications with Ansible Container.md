# [Build and test applications with Ansible Container][1]

![](https://fedoramagazine.org/wp-content/uploads/2017/10/ansible-container-945x400.jpg)

Containers are an increasingly popular development environment. As a developer you have a large choice of tools to manage your containers. This article introduces you to Ansible Container and shows how you can run and test your application in a production-like environment.

### Getting started

This example uses a simple Flask Hello World application. This application is served by an Apache HTTP server just like in production. First, install the requisite  _docker_  package:

```
sudo dnf install docker
```

Ansible Container needs to communicate with the docker service through its local socket. The following commands change the socket ownership, and add you to a  _docker_  group that can access the socket:

```
sudo groupadd docker && sudo gpasswd -a $USER docker
MYGRP=$(id -g) ; newgrp docker ; newgrp $MYGRP
```

Run the  _id_  command to ensure the  _docker_  group is listed in your group memberships. Finally, enable and start the docker service [using sudo][2]:

```
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

### Setting up Ansible Container

Ansible Container enables you to build container images and orchestrate them using only Ansible playbooks. The application is described in a single YAML file, and instead of using a Dockerfile, lists Ansible roles that make up the container images.

Unfortunately Ansible Container is not yet available as an RPM package in Fedora. To install it, use the python3 virtual environment module.

```
mkdir ansible-container-flask-example
cd ansible-container-flask-example
python3 -m venv .venv
source .venv/bin/activate
pip install ansible-container[docker]
```

These commands install Ansible Container with the Docker engine. Ansible Container provides three engines: Docker, Kubernetes and Openshift.

### Setting up the project

Now that Ansible Container is installed, set up the project. Ansible Container provides a simple command to create all files needed to get started:

```
ansible-container init
```

Now look at the files this command created in the current directory:

*   _ansible.cfg_ 

*   _ansible-requirements.txt_ 

*   _container.yml_ 

*   _meta.yml_ 

*   _requirements.yml_ 

This project uses only the  _container.yml_  file to describe the application services. For more information about the other files, check out the [Getting Started][3] documentation of Ansible Container.

### Defining the container

Update  _container.yml_  as follows:

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

The  _conductor_  section updates the base setting to use a Fedora 26 container base image.

The  _services_  section adds the  _web_  service. This service uses Fedora 26 and has a  _role_  called  _base_  to be defined later. It also sets up the port mapping between the container and host. The Apache HTTP server serves the Flask application on port 80 of the container, which redirects to port 5000 of the host. Then this file defines a  _volume_  that mounts the Flask application source code to  _/flaskapp_  in the container.

Finally the  _command_  configuration runs when the container starts. This example uses [dumb-init][4], a simple process supervisor and init system to start the Apache HTTP server.

### Ansible role

Now that the container is setup, create an Ansible role to install and configure the dependencies needed by the Flask application. First, create the  _base_  role.

```
mkdir -p roles/base/tasks
touch roles/base/tasks/main.yml
```

Now edit the  _main.yml_  file so that it looks like this:

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

This Ansible role is a simple one. First it installs dependencies. Then, it copies the Apache HTTP server configuration. If you’re not familiar with Ansible roles, check out the [Roles documentation][5].

### Apache HTTP configuration

Next, configure the Apache HTTP server by creating the  _flask-helloworld.conf_  file:

```
$ mkdir -p roles/base/files
$ touch roles/base/files/flask-helloworld.conf
```

And finally add the following to the file:

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

The important part of this file is the  _WSGIScriptAlias._  This instruction maps the script  _flask-helloworld.wsgi_  to the “/” URL. For more details on Apache HTTP server and mod_wsgi, read [the Flask documentation][6].

### Flask “hello world”

Finally, create a simple Flask application and the _ flask-helloworld.wsgi_  script.

```
mkdir flask-helloworld
touch flask-helloworld/app.py
touch flask-helloworld/flask-helloworld.wsgi
```

Add the following to  _app.py_ **:**

```
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"
```

Then edit  _flask-helloworld.wsgi_  to add this:

```
import sys
sys.path.insert(0, '/flaskapp/')

from app import app as application
```

### Build and run

Now it’s time to build and run the container with the  _ansible-container build_  and  _ansible-container run_  commands.

```
ansible-container build
```

This command takes a bit of time to complete, so be patient.

```
ansible-container run
```

You can now access your flask application at this URL:  _http://localhost:5000/_ 

### Conclusion

You’ve now seen how to use Ansible Container to manage, build and configure your applications running inside a container. All the configuration files and the source code of this example are hosted on [Pagure.io][7]. You can use this example as the base to start using Ansible Container on your projects.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/build-test-applications-ansible-container/

作者：[Clement Verna ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/cverna/
[1]:https://fedoramagazine.org/build-test-applications-ansible-container/
[2]:https://fedoramagazine.org/howto-use-sudo/
[3]:https://docs.ansible.com/ansible-container/getting_started.html
[4]:https://github.com/Yelp/dumb-init
[5]:http://docs.ansible.com/ansible/latest/playbooks_reuse_roles.html
[6]:http://flask.pocoo.org/docs/0.12/deploying/mod_wsgi/
[7]:https://pagure.io/ansible-container-flask-example
