MjSeven is translating


Docker Guide: Dockerizing Python Django Application
============================================================

### On this page

1.  [What we will do?][6]

2.  [Step 1 - Install Docker-ce][7]

3.  [Step 2 - Install Docker-compose][8]

4.  [Step 3 - Configure Project Environment][9]
    1.  [Create a New requirements.txt file][1]

    2.  [Create the Nginx virtual host file django.conf][2]

    3.  [Create the Dockerfile][3]

    4.  [Create Docker-compose script][4]

    5.  [Configure Django project][5]

5.  [Step 4 - Build and Run the Docker image][10]

6.  [Step 5 - Testing][11]

7.  [Reference][12]

Docker is an open-source project that provides an open platform for developers and sysadmins to build, package, and run applications anywhere as a lightweight container. Docker automates the deployment of applications inside software containers.

Django is a web application framework written in python that follows the MVC (Model-View-Controller) architecture. It is available for free and released under an open source license. It is fast and designed to help developers get their application online as quickly as possible.

In this tutorial, I will show you step-by-step how to create a docker image for an existing Django application project in Ubuntu 16.04\. We will learn about dockerizing a python Django application, and then deploy the application as a container to the docker environment using a docker-compose script.

In order to deploy our python Django application, we need additional docker images. We need an nginx docker image for the web server and PostgreSQL image for the database.

### What we will do?

1.  Install Docker-ce

2.  Install Docker-compose

3.  Configure Project Environment

4.  Build and Run

5.  Testing

### Step 1 - Install Docker-ce

In this tutorial, we will install docker-ce community edition from the docker repository. We will install docker-ce community edition and docker-compose that support compose file version 3.

Before installing docker-ce, install docker dependencies needed using the apt command.

```
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

Now add the docker key and repository by running commands below.

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

 [![Install Docker-ce](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/1.png)][14] 

Update the repository and install docker-ce.

```
sudo apt update
sudo apt install -y docker-ce
```

After the installation is complete, start the docker service and enable it to launch every time at system boot.

```
systemctl start docker
systemctl enable docker
```

Next, we will add a new user named 'omar' and add it to the docker group.

```
useradd -m -s /bin/bash omar
usermod -a -G docker omar
```

 [![Start Docker](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/2.png)][15] 

Login as the omar user and run docker command as shown below.

```
su - omar
docker run hello-world
```

Make sure you get the hello-world message from Docker.

 [![Check Docker installation](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/3.png)][16] 

Docker-ce installation has been completed.

### Step 2 - Install Docker-compose

In this tutorial, we will be using the latest docker-compose support for compose file version 3\. We will install docker-compose manually.

Download the latest version of docker-compose using curl command to the '/usr/local/bin' directory and make it executable using chmod.

Run commands below.

```
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Now check the docker-compose version.

```
docker-compose version
```

And make sure you get the latest version of the docker-compose 1.21.

 [![Install Docker-compose](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/4.png)][17] 

The docker-compose latest version that supports compose file version 3 has been installed.

### Step 3 - Configure Project Environment

In this step, we will configure the python Django project environment. We will create new directory 'guide01' and make it as the main directory for our project files, such as a Dockerfile, Django project, nginx configuration file etc.

Login to the 'omar' user.

```
su - omar
```

Create new directory 'guide01' and go to the directory.

```
mkdir -p guide01
cd guide01/
```

Now inside the 'guide01' directory, create new directories 'project' and 'config'.

```
mkdir project/ config/
```

Note:

*   Directory 'project': All our python Django project files will be placed in that directory.

*   Directory 'config': Directory for the project configuration files, including nginx configuration file, python pip requirements file etc.

### Create a New requirements.txt file

Next, create new file 'requirements.txt' inside the 'config' directory using vim command.

```
vim config/requirements.txt
```

Paste the configuration below.

```
Django==2.0.4  
 gunicorn==19.7.0  
 psycopg2==2.7.4
```

Save and exit.

### Create the Nginx virtual host file django.conf

Under the config directory, create the 'nginx' configuration directory and add the virtual host configuration file django.conf.

```
mkdir -p config/nginx/
vim config/nginx/django.conf
```

Paste the following configuration there.

```
upstream web {
   ip_hash;
   server web:8000;
 }

 # portal
 server {
   location / {
         proxy_pass http://web/;
     }
   listen 8000;
   server_name localhost;

   location /static {    
     autoindex on;    
     alias /src/static/;    
   }
 }
```

Save and exit.

### Create the Dockerfile

Create new 'Dockerfile' inside the 'guide01' directory.

Run the command below.

```
vim Dockerfile
```

Now paste Dockerfile script below.

```
FROM python:3.5-alpine
 ENV PYTHONUNBUFFERED 1  

 RUN apk update && \
     apk add --virtual build-deps gcc python-dev musl-dev && \
     apk add postgresql-dev bash

 RUN mkdir /config  
 ADD /config/requirements.txt /config/  
 RUN pip install -r /config/requirements.txt
 RUN mkdir /src
 WORKDIR /src
```

Save and exit.

Note:

We want to build the Docker images for our Django project based on Alpine Linux, the smallest size of Linux. Our Django project will run Alpine Linux with python 3.5 installed on top of it and add the postgresql-dev package for the PostgreSQL database support. And then we will install all python packages listed on the 'requirements.txt' file using python pip command, and create new '/src' for our project.

### Create Docker-compose script

Create the 'docker-compose.yml' file under the 'guide01' directory using [vim][18] command below.

```
vim docker-compose.yml
```

Paste the following configuration there.

```
version: '3'
 services:
   db:
     image: postgres:10.3-alpine
     container_name: postgres01
   nginx:
     image: nginx:1.13-alpine
     container_name: nginx01
     ports:
       - "8000:8000"
     volumes:
       - ./project:/src
       - ./config/nginx:/etc/nginx/conf.d
     depends_on:
       - web
   web:
     build: .
     container_name: django01
     command: bash -c "python manage.py makemigrations && python manage.py migrate && python manage.py collectstatic --noinput && gunicorn hello_django.wsgi -b 0.0.0.0:8000"
     depends_on:
       - db
     volumes:
       - ./project:/src
     expose:
       - "8000"
     restart: always
```

Save and exit.

Note:

With this docker-compose file script, we will create three services. Create the database service named 'db' using the PostgreSQL alpine Linux, create the 'nginx' service using the Nginx alpine Linux again, and create our python Django container using the custom docker images generated from our Dockerfile.

 [![Configure Project Environment](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/5.png)][19] 

### Configure Django project

Copy your Django project files to the 'project' directory.

```
cd ~/django
cp -r * ~/guide01/project/
```

Go to the 'project' directory and edit the application setting 'settings.py'.

```
cd ~/guide01/project/
vim hello_django/settings.py
```

Note:

We will deploy simple Django application called 'hello_django' app.

On the 'ALLOW_HOSTS' line, add the service name 'web'.

```
ALLOW_HOSTS = ['web']
```

Now change the database settings. We will be using the PostgreSQL database that runs as a service named 'db' with default user and password.

```
DATABASES = {  
     'default': {
         'ENGINE': 'django.db.backends.postgresql_psycopg2',
         'NAME': 'postgres',
         'USER': 'postgres',
         'HOST': 'db',
         'PORT': 5432,
     }
 }
```

And for the 'STATIC_ROOT' configuration directory, add this line to the end of the line of the file.

```
STATIC_ROOT = os.path.join(BASE_DIR, 'static/')
```

Save and exit.

 [![Configure Django project](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/6.png)][20] 

Now we're ready to build and run the Django project under the docker container.

### Step 4 - Build and Run the Docker image

In this step, we want to build a Docker image for our Django project using the configuration on the 'guide01' directory.

Go to the 'guide01' directory.

```
cd ~/guide01/
```

Now build the docker images using the docker-compose command.

```
docker-compose build
```

 [![Run docker image](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/7.png)][21] 

Start all services inside the docker-compose script.

```
docker-compose up -d
```

Wait for some minutes for Docker to build our Python image and download the nginx and postgresql docker images.

 [![Use docker-compose to build the image](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/8.png)][22] 

And when it's complete, check running container and list docker images on the system using following commands.

```
docker-compose ps
docker-compose images
```

And now you will get three containers running and list of Docker images on the system as shown below.

 [![docke-compose ps command](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/9.png)][23] 

Our Python Django Application is now running inside the docker container, and docker images for our service have been created.

### Step 5 - Testing

Open your web browser and type the server address with port 8000, mine is: http://ovh01:8000/

Now you will get the default Django home page.

 [![Default Django project homepage](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/10.png)][24] 

Next, test the admin page by adding the '/admin' path on the URL.

http://ovh01:8000/admin/

And you will see the Django admin login page.

 [![Django administration](https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/11.png)][25] 

The Dockerizing Python Django Application has been completed successfully.

### Reference

*   [https://docs.docker.com/][13]

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/

作者：[Muhammad Arul][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/
[1]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#create-a-new-requirementstxt-file
[2]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#create-the-nginx-virtual-host-file-djangoconf
[3]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#create-the-dockerfile
[4]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#create-dockercompose-script
[5]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#configure-django-project
[6]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#what-we-will-do
[7]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#step-install-dockerce
[8]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#step-install-dockercompose
[9]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#step-configure-project-environment
[10]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#step-build-and-run-the-docker-image
[11]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#step-testing
[12]:https://www.howtoforge.com/tutorial/docker-guide-dockerizing-python-django-application/#reference
[13]:https://docs.docker.com/
[14]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/1.png
[15]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/2.png
[16]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/3.png
[17]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/4.png
[18]:https://www.howtoforge.com/vim-basics
[19]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/5.png
[20]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/6.png
[21]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/7.png
[22]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/8.png
[23]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/9.png
[24]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/10.png
[25]:https://www.howtoforge.com/images/docker_guide_dockerizing_python_django_application/big/11.png
