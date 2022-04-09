[#]: subject: (How to Deploy Seafile Server with Docker to Host Your Own File Synchronization and Sharing Solution)
[#]: via: (https://itsfoss.com/deploy-seafile-server-docker/)
[#]: author: (Hunter Wittenborn https://itsfoss.com/author/hunter/)
[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Deploy Seafile Server with Docker to Host Your Own File Synchronization and Sharing Solution
======

First off, what is Seafile?

[Seafile][1] is a self-hosted file synchronization program that works with the server-client model, as in you have several devices like your laptop and phone that connect to a central server.

Unlike some more popular alternatives like [Nextcloud or ownCloud][2], Seafile tries to follow the philosophy of “do one thing only, but do it well”. Likewise, Seafile doesn’t have extra goodies built in like Contacts or Calendar integration.

Seafile instead focuses solely on file syncing, sharing, and the things surrounding it, and that’s it. As a result of that though, it ends up doing so _extremely_ well.

### Deploying Seafile Server with Docker and NGINX

Advanced tutorial

Most tutorials on It’s FOSS are focused on beginners. This one is not. It is intended for advanced users who tinker a lot with DIY projects and prefer to self-host.
This tutorial presumes that you are comfortable using the command line, and that you are at least decently knowledgeable with the programs we’ll be using.

While the whole process could be done without using NGINX at all, using NGINX will allow for an easier setup, as well as making it significantly easier to self-host more services in the future.

If you want to use a full-on Docker setup, you could set up [NGINX inside of Docker][3] as well, but it will only make things more complex and doesn’t add too much of a benefit, and likewise won’t be covered in this tutorial.

#### Installing and Setting Up NGINX

_**I will be using Ubuntu in this tutorial and will thus be using apt to install packages. If you use Fedora or some other non-Debian distribution, please use your distribution’s [package manager][4].**_

[NGINX][5], as well as being a web server, is what’s known as a proxy. It will function as the connection between the Seafile server and the internet, whilst also making several tasks easier to deal with.

To install NGINX, use the following command:

```
sudo apt install nginx
```

If you want to use HTTPS (that little padlock in your browser), you will also need to install [Certbot][6]:

```
sudo apt install certbot python3-certbot-nginx
```

Next, you need to configure NGINX to connect to the Seafile instance that we set up later.

First, run the following command:

```
sudo nano /etc/nginx/sites-available/seafile.conf
```

Enter the following text into the file:

```
server {
  server_name localhost;
  location / {
    proxy_pass http://localhost:8080;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
  }
}
```

**Important**: Replace **localhost** on the **server_name** line with the address you’ll be accessing your server from (i.e. **seafile.example.com** or **192.168.0.0**). Not sure what to put?

  * If you are testing just for the sake of it, use localhost. This setup will **only allow you to access the server from your computer**, and that’s it.
  * If you want to use Seafile across your local WiFi connection(any device on the same WiFi network as you), you should enter [your computer’s IP address][7]. You may also want to look into [setting a static IP address][8], though it isn’t necessary.
  * If you have a public IP address that you know points to your system, use that.
  * If you have a domain name(i.e. **example.com**, **example.org**) _and_ a public IP address for your system, change your DNS settings to point the domain name to your system’s IP address. This will also require the public IP address to point to your system.



Now you need to copy the config file to the directory NGINX looks at for files, then restart NGINX:

```
sudo ln -s /etc/nginx/sites-available/seafile.conf /etc/nginx/sites-enabled/seafile.conf
sudo systemctl restart nginx
```

If you set up Certbot, you’ll also need to run the following to set up HTTPS:

```
sudo certbot
```

If asked to redirect HTTP traffic to HTTPS, choose **2**.

Now would be a good time to make sure everything we’ve set up so far is working. If you visit your site, you should get a screen that says something on the lines of `502 Bad Gateway`.

![][9]

#### Install Docker and Docker Compose

Now to get into the fun stuff!

First things first, you need to have [Docker][10] and [Docker Compose][11] installed. Docker Compose is needed to utilize a docker-compose.yml file, which will make managing the various Docker [containers][12] Seafile needs easier.

Docker and Docker Compose can be installed with the following command:

```
sudo apt install docker.io docker-compose
```

To check if Docker is installed and running, run the following:

```
sudo docker run --rm hello-world
```

You should see something along the lines of this in your terminal if it completed successfully:

![][13]

If you would like to avoid adding `sudo` to the beginning of the `docker` command, you can run the following commands to add yourself to the `docker` group:

```
sudo groupadd docker
sudo usermod -aG docker $USER
```

The rest of this tutorial assumes you ran the above two commands. If you didn’t, add `sudo` to all commands that start with `docker` or `docker-compose`.

#### Installing Seafile Server

This part is significantly easier than the part before this. All you need to do is put some text into a file and run a few commands.

Open up a terminal. Then create a directory where you’d like the contents of the Seafile server to be stored and enter the directory:

```
mkdir ~/seafile-server && cd ~/seafile-server
```

![][14]

Go to the directory you created and run the following:

```
nano docker-compose.yml
```

Next, enter the text below into the window that pops up:

```
version: '2.0'
services:
  db:
    image: mariadb
    container_name: seafile-mysql
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_LOG_CONSOLE=true
    volumes:
      - ./data/mariadb:/var/lib/mysql
    networks:
      - seafile-net

  memcached:
    image: memcached
    container_name: seafile-memcached
    entrypoint: memcached -m 256
    networks:
      - seafile-net

  seafile:
    image: seafileltd/seafile-mc
    container_name: seafile
    ports:
      - "8080:80"
    volumes:
      - ./data/app:/shared
    environment:
      - DB_HOST=db
      - DB_ROOT_PASSWD=password
      - TIME_ZONE=Etc/UTC
      - [email protected]
      - SEAFILE_ADMIN_PASSWORD=password
      - SEAFILE_SERVER_LETSENCRYPT=false
      - SEAFILE_SERVER_HOSTNAME=docs.seafile.com
    depends_on:
      - db
      - memcached
    networks:
      - seafile-net

networks:
  seafile-net:
```

Before saving the file, a few things will need to be changed:

  * **MYSQL_ROOT_PASSWORD**: Change to a stronger password, you _don’t_ need to remember this, so don’t try to pick anything easy. If you need help making one, use a [password generator][15]. I’d recommend 20 characters long and avoiding any special characters(all the **[[email protected]][16]#$%^&amp;*** symbols).
  * **DB_ROOT_PASSWD**: Change to the value you set for ****MYSQL_ROOT_PASSWORD****.
  * ****SEAFILE_ADMIN_EMAIL****: Sets the email address for the admin account.
  * **SEAFILE_ADMIN_PASSWORD**: Sets the password for the admin account. Avoid making this the same as **MYSQL_ROOT_PASSWORD** or **DB_ROOT_PASSWD**.
  * **SEAFILE_SERVER_HOSTNAME**: Set to the address you set in the NGINX configuration.



With that done, you can bring up the whole thing with `docker-compose`:

```
docker-compose up -d
```

It might take a minute or two depending on your internet connection, as it has to pull down several containers that Seafile needs to run.

After it’s done, give it a few more minutes to finish up. You can also check the status of it by running the following:

```
docker logs seafile
```

When it’s done, you’ll see the following output:

![][17]

Next, just type the address you set for ****SEAFILE_SERVER_HOSTNAME**** into your browser, and you should be at a login screen.

![][18]

And there you go! Everything’s now fully functional and ready to be used with the clients.

#### Installing the Seafile Clients

Seafile on mobile is available on [Google Play][19], [F-Droid][20], and on the [iOS App Store][21]. Seafile also has desktop clients available for Linux, Windows, and Mac, available [here][22].

Seafile is readily available on Ubuntu systems via the `seafile-gui` package:

```
sudo apt install seafile-gui
```

Seafile is also in the AUR for Arch users via the `seafile-client` package.

### Closing Up

Feel free to explore the clients and all they have to offer. I’ll go into all of what the Seafile clients are capable of in a future article (stay tuned 😃).

If something’s not working right, or you just have a question in general, feel free to leave it in the comments below – I’ll try to respond whenever I can!

--------------------------------------------------------------------------------

via: https://itsfoss.com/deploy-seafile-server-docker/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://www.seafile.com/en/home/
[2]: https://itsfoss.com/nextcloud-vs-owncloud/
[3]: https://linuxhandbook.com/nginx-reverse-proxy-docker/
[4]: https://itsfoss.com/package-manager/
[5]: https://www.nginx.com/
[6]: https://certbot.eff.org/
[7]: https://itsfoss.com/check-ip-address-ubuntu/
[8]: https://itsfoss.com/static-ip-ubuntu/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/nginx_bad_gateway.png?resize=489%2C167&ssl=1
[10]: https://www.docker.com/
[11]: https://docs.docker.com/compose/
[12]: https://www.docker.com/resources/what-container
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/seafile-docker-helloworld.png?resize=752%2C416&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/seafile-dir.png?resize=731%2C174&ssl=1
[15]: https://itsfoss.com/password-generators-linux/
[16]: https://itsfoss.com/cdn-cgi/l/email-protection
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/seafile-running.png?resize=752%2C484&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/seafile-login.jpg?resize=800%2C341&ssl=1
[19]: https://play.google.com/store/apps/details?id=com.seafile.seadroid2
[20]: https://f-droid.org/repository/browse/?fdid=com.seafile.seadroid2
[21]: https://itunes.apple.com/cn/app/seafile-pro/id639202512?l=en&mt=8
[22]: https://www.seafile.com/en/download/
