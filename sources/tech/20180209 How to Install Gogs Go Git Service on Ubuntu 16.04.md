How to Install Gogs Go Git Service on Ubuntu 16.04
======

Gogs is free and open source Git service written in Go language. Gogs is a painless self-hosted git service that allows you to create and run your own Git server on a minimal hardware server. Gogs web-UI is very similar to GitHub and offers support for MySQL, PostgreSQL, and SQLite database.

In this tutorial, we will show you step-by-step how to install and configure your own Git service using Gogs on Ubuntu 16.04. This tutorial will cover details including, how to install Go on Ubuntu system, install PostgreSQL, and install and configure Nginx web server as a reverse proxy for Go application.

### Prerequisites

  * Ubuntu 16.04
  * Root privileges



### What we will do

  1. Update and Upgrade System
  2. Install and Configure PostgreSQL
  3. Install Go and Git
  4. Install Gogs
  5. Configure Gogs
  6. Running Gogs as a Service
  7. Install and Configure Nginx as a Reverse Proxy
  8. Testing



Before going any further, update all Ubuntu repositories and upgrade all packages.

Run the apt commands below.

```
sudo apt update
sudo apt upgrade
```

### Step 2 - Install and Configure PostgreSQL

Gogs offers support for MySQL, PostgreSQL, SQLite3, MSSQL, and TiDB database systems.

In this guide, we will be using PostgreSQL as a database for our Gogs installations.

Install PostgreSQL using the apt command below.

```
sudo apt install -y postgresql postgresql-client libpq-dev
```

After the installation is complete, start the PostgreSQL service and enable it to launch everytime at system boot.

```
systemctl start postgresql
systemctl enable postgresql
```

PostgreSQL database has been installed on an Ubuntu system.

Next, we need to create a new database and user for Gogs.

Login as the 'postgres' user and run the 'psql' command to get the PostgreSQL shell.

```
su - postgres
psql
```

Create a new user named 'git', and give the user privileges for 'CREATEDB'.

```
CREATE USER git CREATEDB;
\password git
```

Create a database named 'gogs_production', and set the 'git' user as the owner of the database.

```
CREATE DATABASE gogs_production OWNER git;
```

[![Create the Gogs database][1]][2]

New PostgreSQL database 'gogs_production' and user 'git' for Gogs installation has been created.

### Step 3 - Install Go and Git

Install Git from the repository using the apt command below.

```
sudo apt install git
```

Now add new user 'git' to the system.

```
sudo adduser --disabled-login --gecos 'Gogs' git
```

Login as the 'git' user and create a new 'local' directory.

```
su - git
mkdir -p /home/git/local
```

Go to the 'local' directory and download 'Go' (the latest version) using the wget command as shown below.

```
cd ~/local
wget <https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz>
```

[![Install Go and Git][3]][4]

Extract the go compressed file, then remove it.

```
tar -xf go1.9.2.linux-amd64.tar.gz
rm -f go1.9.2.linux-amd64.tar.gz
```

'Go' binary file has been downloaded in the '~/local/go' directory. Now we need to setup the environment - we need to define the 'GOROOT' and 'GOPATH directories so we can run a 'go' command on the system under 'git' user.

Run all of the following commands.

```
cd ~/
echo 'export GOROOT=$HOME/local/go' >> $HOME/.bashrc
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bashrc
```

And reload Bash by running the 'source ~/.bashrc' command as shown below.

```
source ~/.bashrc
```

Make sure you're using Bash as your default shell.

[![Install Go programming language][5]][6]

Now run the 'go' command for checking the version.

```
go version
```

And make sure you get the result as shown in the following screenshot.

[![Check the go version][7]][8]

Go is now installed on the system under 'git' user.

### Step 4 - Install Gogs Go Git Service

Login as the 'git' user and download 'Gogs' from GitHub using the 'go' command.

```
su - git
go get -u github.com/gogits/gogs
```

The command will download all Gogs source code in the 'GOPATH/src' directory.

Go to the '$GOPATH/src/github.com/gogits/gogs' directory and build gogs using commands below.

```
cd $GOPATH/src/github.com/gogits/gogs
go build
```

And make sure you get no error.

Now run Gogs Go Git Service using the command below.

```
./gogs web
```

The command will run Gogs on the default port 3000.

[![Install Gogs Go Git Service][9]][10]

Open your web browser and type your server IP address with port 3000, mine is <http://192.168.33.10:3000/>

And you should get the result as shown below.

[![Gogs web installer][11]][12]

Gogs is installed on the Ubuntu system. Now back to your terminal and press 'Ctrl + c' to exit.

### Step 5 - Configure Gogs Go Git Service

In this step, we will create a custom configuration for Gogs.

Goto the Gogs installation directory and create a new 'custom/conf' directory.

```
cd $GOPATH/src/github.com/gogits/gogs
mkdir -p custom/conf/
```

Copy default configuration to the custom directory and edit it using [vim][13].

```
cp conf/app.ini custom/conf/app.ini
vim custom/conf/app.ini
```

In the ' **[server]** ' section, change the server 'HOST_ADDR' with '127.0.0.1'.
```
[server]
 PROTOCOL = http
 DOMAIN = localhost
 ROOT_URL = %(PROTOCOL)s://%(DOMAIN)s:%(HTTP_PORT)s/
 HTTP_ADDR = 127.0.0.1
 HTTP_PORT = 3000

```

In the ' **[database]** ' section, change everything with your own database info.
```
[database]
 DB_TYPE = postgres
 HOST = 127.0.0.1:5432
 NAME = gogs_production
 USER = git
 PASSWD = [email protected]#

```

Save and exit.

Now verify the configuration by running the command as shown below.

```
./gogs web
```

And make sure you get the result as following.

[![Configure the service][14]][15]

Gogs is now running with our custom configuration, under 'localhost' with port 3000.

### Step 6 - Running Gogs as a Service

In this step, we will configure Gogs as a service on Ubuntu system. We will create a new service file configuration 'gogs.service' under the '/etc/systemd/system' directory.

Go to the '/etc/systemd/system' directory and create a new service file 'gogs.service' using the [vim][13] editor.

```
cd /etc/systemd/system
vim gogs.service
```

Paste the following gogs service configuration there.
```
[Unit]
 Description=Gogs
 After=syslog.target
 After=network.target
 After=mariadb.service mysqld.service postgresql.service memcached.service redis.service

 [Service]
 # Modify these two values and uncomment them if you have
 # repos with lots of files and get an HTTP error 500 because
 # of that
 ###
 #LimitMEMLOCK=infinity
 #LimitNOFILE=65535
 Type=simple
 User=git
 Group=git
 WorkingDirectory=/home/git/go/src/github.com/gogits/gogs
 ExecStart=/home/git/go/src/github.com/gogits/gogs/gogs web
 Restart=always
 Environment=USER=git HOME=/home/git

 [Install]
 WantedBy=multi-user.target

```

Save and exit.

Now reload the systemd services.

```
systemctl daemon-reload
```

Start gogs service and enable it to launch everytime at system boot using the systemctl command.

```
systemctl start gogs
systemctl enable gogs
```

[![Run gogs as a service][16]][17]

Gogs is now running as a service on Ubuntu system.

Check it using the commands below.

```
netstat -plntu
systemctl status gogs
```

And you should get the result as shown below.

[![Gogs is listening on the network interface][18]][19]

### Step 7 - Configure Nginx as a Reverse Proxy for Gogs

In this step, we will configure Nginx as a reverse proxy for Gogs. We will be using Nginx packages from its own repository.

Add Nginx repository using the add-apt command.

```
sudo add-apt-repository -y ppa:nginx/stable
```

Now update all Ubuntu repositories and install Nginx using the apt command below.

```
sudo apt update
sudo apt install nginx -y
```

Next, goto the '/etc/nginx/sites-available' directory and create new virtual host file 'gogs'.

```
cd /etc/nginx/sites-available
vim gogs
```

Paste the following configuration there.
```
server {
     listen 80;
     server_name git.hakase-labs.co;

     location / {
         proxy_pass http://localhost:3000;
     }
 }

```

Save and exit.

**Note:**

Change the 'server_name' line with your own domain name.

Now activate a new virtual host and test the nginx configuration.

```
ln -s /etc/nginx/sites-available/gogs /etc/nginx/sites-enabled/
nginx -t
```

Make sure there is no error, then restart the Nginx service.

```
systemctl restart nginx
```

[![Nginx reverse proxy for gogs][20]][21]

### Step 8 - Testing

Open your web browser and type your gogs URL, mine is <http://git.hakase-labs.co>

Now you will get the installation page. On top of the page, type all of your PostgreSQL database info.

[![Gogs installer][22]][23]

Now scroll to the bottom, and click the 'Admin account settings' dropdown.

Type your admin user, password, and email.

[![Type in the gogs install settings][24]][25]

Then click the 'Install Gogs' button.

And you will be redirected to the Gogs user Dashboard as shown below.

[![Gogs dashboard][26]][27]

Below is Gogs 'Admin Dashboard'.

[![Browse the Gogs dashboard][28]][29]

Gogs is now installed with PostgreSQL database and Nginx web server on Ubuntu 16.04 server


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-gogs-go-git-service-on-ubuntu-1604/

作者：[Muhammad Arul][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/server-monitoring-with-shinken-on-ubuntu-16-04/
[1]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/1.png
[2]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/1.png
[3]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/2.png
[4]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/2.png
[5]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/3.png
[6]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/3.png
[7]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/4.png
[8]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/4.png
[9]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/5.png
[10]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/5.png
[11]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/6.png
[12]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/6.png
[13]:https://www.howtoforge.com/vim-basics
[14]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/7.png
[15]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/7.png
[16]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/8.png
[17]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/8.png
[18]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/9.png
[19]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/9.png
[20]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/10.png
[21]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/10.png
[22]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/11.png
[23]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/11.png
[24]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/12.png
[25]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/12.png
[26]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/13.png
[27]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/13.png
[28]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/14.png
[29]:https://www.howtoforge.com/images/how_to_install_gogs_go_git_service_on_ubuntu_1604/big/14.png
