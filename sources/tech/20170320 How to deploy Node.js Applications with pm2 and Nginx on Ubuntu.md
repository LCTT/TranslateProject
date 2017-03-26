How to deploy Node.js Applications with pm2 and Nginx on Ubuntu
============================================================

### On this page

1.  [Step 1 - Install Node.js LTS][1]
2.  [Step 2 - Generate Express Sample App][2]
3.  [Step 3 - Install pm2][3]
4.  [Step 4 - Install and Configure Nginx as a Reverse proxy][4]
5.  [Step 5 - Testing][5]
6.  [Links][6]

pm2 is a process manager for Node.js applications, it allows you to keep your apps alive and has a built-in load balancer. It's simple and powerful, you can always restart or reload your node application with zero downtime and it allows you to create a cluster of your node app.

In this tutorial, I will show you how to install and configure pm2 for the simple 'Express' application and then configure Nginx as a reverse proxy for the node application that is running under pm2.

**Prerequisites**

*   Ubuntu 16.04 - 64bit
*   Root Privileges

### Step 1 - Install Node.js LTS

In this tutorial, we will start our project from scratch. First, we need Nodejs installed on the server. I will use the Nodejs LTS version 6.x which can be installed from the nodesource repository.

Install the package '**python-software-properties**' from the Ubuntu repository and then add the 'nodesource' Nodejs repository.

sudo apt-get install -y python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

Install the latest Nodejs LTS version.

sudo apt-get install -y nodejs

When the installation succeeded, check node and npm version.

node -v
npm -v

[
 ![Check the node.js version](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/1.png) 
][10]

### Step 2 - Generate Express Sample App

I will use simple web application skeleton generated with a package named '**express-generator**' for this example installation. Express-generator can be installed with the npm command.

Install '**express-generator**' with npm:

npm install express-generator -g

**-g:** install package inside the system

We will run the application as a normal user, not a root or super user. So we need to create a new user first.

Create a new user, I name mine '**yume**':

useradd -m -s /bin/bash yume
passwd yume

Login to the new user by using su:

su - yume

Next, generate a new simple web application with the express command:

express hakase-app

The command will create new project directory '**hakase-app**'.

[
 ![Generate app skeleton with express-generator](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/2.png) 
][11]

Go to the project directory and install all dependencies needed by the app.

cd hakase-app
npm install

Then test and start a new simple application with the command below:

DEBUG=myapp:* npm start

By default, our express application will run on port **3000**. Now visit server IP address: [192.168.33.10:3000][12]

[
 ![express nodejs running on port 3000](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/3.png) 
][13]

The simple web application skeleton is running on port 3000, under user 'yume'.

### Step 3 - Install pm2

pm2 is a node package and can be installed with the npm command. So let's install it with npm (with root privileges, when you are still logged in as user hakase, then run the command "exit" ro become root again):

npm install pm2 -g

Now we can use pm2 for our web application.

Go to the app directory '**hakase-app**':

su - hakase
cd ~/hakase-app/

There you can find a file named '**package.json**', display its content with the cat command.

cat package.json

[
 ![express nodejs services configuration](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/4.png) 
][14]

You can see the '**start**' line contains a command that is used by Nodejs to start the express application. This command we will use with the pm2 process manager.

Run the express application with the pm2 command below:

pm2 start ./bin/www

Now you can see the results is below:

[
 ![Running nodejs app with pm2](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/5.png) 
][15]

Our express application is running under pm2 with name '**www**', id '**0**'. You can get more details about the application running under pm2 with the show option '**show nodeid|name**'.

pm2 show www

[
 ![pm2 service status](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/6.png) 
][16]

If you like to see the log of our application, you can use the logs option. It's just access and error log and you can see the HTTP Status of the application.

pm2 logs www

[
 ![pm2 services logs](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/7.png) 
][17]

You can see that our process is running. Now, let's enable it to start at boot time.

pm2 startup systemd

**systemd**: Ubuntu 16 is using systemd.

You will get a message for running a command as root. Back to the root privileges with "exit" and then run that command.

sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u yume --hp /home/yume

It will generate the systemd configuration file for application startup. When you reboot your server, the application will automatically run on startup.

[
 ![pm2 add service to the boot time startup](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/8.png) 
][18]

### Step 4 - Install and Configure Nginx as a Reverse proxy

In this tutorial, we will use Nginx as a reverse proxy for the node application. Nginx is available in the Ubuntu repository, install it with the apt command:

sudo apt-get install -y nginx

Next, go to the '**sites-available**' directory and create a new virtual host configuration file.

cd /etc/nginx/sites-available/
vim hakase-app

Paste configuration below:

```
upstream hakase-app {
    # Nodejs app upstream
    server 127.0.0.1:3000;
    keepalive 64;
}

# Server on port 80
server {
    listen 80;
    server_name hakase-node.co;
    root /home/yume/hakase-app;

    location / {
        # Proxy_pass configuration
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_max_temp_file_size 0;
        proxy_pass http://hakase-app/;
        proxy_redirect off;
        proxy_read_timeout 240s;
    }
}
```

Save the file and exit vim.

On the configuration:

*   The node app is running with domain name '**hakase-node.co**'.
*   All traffic from nginx will be forwarded to the node app that is running on port **3000**.

Test Nginx configuration and make sure there is no error.

nginx -t

Start Nginx and enable it to start at boot time:

systemctl start nginx
systemctl enable nginx

### Step 5 - Testing

Open your web browser and visit the domain name (mine is):

[http://hakase-app.co][19]

You will see the express application is running under the nginx web server.

[
 ![Nodejs ap running with pm2 and nginx](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/9.png) 
][20]

Next, reboot your server, and make sure the node app is running at the boot time:

pm2 save
sudo reboot

If you have logged in again to your server, check the node app process. Run the command below as '**yume**' user.

su - yume
pm2 status www

[
 ![nodejs running at the booti time with pm2](https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/10.png) 
][21]

The Node Application is running under pm2 and Nginx as reverse proxy.

### Links

*   [Ubuntu][7]
*   [Node.js][8]
*   [Nginx][9]

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/

作者：[Muhammad Arul ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/
[1]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#step-install-nodejs-lts
[2]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#step-generate-express-sample-app
[3]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#step-install-pm
[4]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#step-install-and-configure-nginx-as-a-reverse-proxy
[5]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#step-testing
[6]:https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/#links
[7]:https://www.ubuntu.com/
[8]:https://nodejs.org/en/
[9]:https://www.nginx.com/
[10]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/1.png
[11]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/2.png
[12]:https://www.howtoforge.com/admin/articles/edit/192.168.33.10:3000
[13]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/3.png
[14]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/4.png
[15]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/5.png
[16]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/6.png
[17]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/7.png
[18]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/8.png
[19]:http://hakase-app.co/
[20]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/9.png
[21]:https://www.howtoforge.com/images/how_to_deploy_nodejs_applications_with_pm2_and_nginx_on_ubuntu/big/10.png
