    neartan占坑

How to install Ghost blogging platform on Linux
================================================================================
[Ghost][1] is a relatively new blog publishing platform which started out as a [£25,000 Kickstarter project][2]. While WordPress is still the dominant blogging tool on the web, it has now evolved into a general content management platform with tons of third party developed features, and over time has become increasingly cumbersome and complex to maintain. On the other hand, now only a couple of months old, Ghost promises to remain as a pure blogging platform with slick user-centric publishing interface.

In this tutorial, I will describe **how to set up Ghost blogging platform on Linux**.

### Install Ghost on Linux ###

Ghost is powered by Node.js. Therefore, first [install Node.js][3] on your Linux system. Make sure that the version of Node.js is 0.10 or higher.

Next, log in to [http://ghost.org][1] (sign-up needed), and download the source code of Ghost. Then follow the procedure below to install Ghost.

    $ sudo mkdir -p /var/www/ghost
    $ sudo unzip ghost-0.3.3.zip -d /var/www/ghost
    $ cd /var/www/ghost
    $ sudo npm install --production 

### Configure Ghost Before Launching ###

Before launching Ghost, create its configuration file located at /var/www/ghost/config.js as follows. Replace "YOUR_IP" with the IP address of your host.

    $ cd /var/www/ghost
    $ sudo cp config.example.js config.js
    $ sudo sed -i 's/127.0.0.1/YOUR_IP/g' config.js 

### Test-Run Ghost in Development Mode ###

At this point, you are ready to launch Ghost.

Note that Ghost can run in two different modes: "development" and "production" modes. For safety, Ghost maintains configuration info of two modes separately in its configuration file (/var/www/ghost/config.js). For example, the two different modes use different database files (i.e., ghost-dev.db and ghost.db located in /var/www/ghost/content/data).

Use the following commands to launch Ghost. Ghost runs in development mode by default.

    $ cd /var/www/ghost
    $ sudo npm start 

If Ghost is launched successfully, you should see the following output in the terminal, indicating that Ghost is running on <YOUR_IP>:2368.

[![](http://farm8.staticflickr.com/7317/10881189204_d714f11321_z.jpg)][4]

Go to http://<YOUR_IP>:2368 on your web browser, and verify that you can see the following initial Ghost page.

[![](http://farm4.staticflickr.com/3750/10881348733_f77d220de6_z.jpg)][5]

### Launch Ghost in Production Mode ###

After you have verified that Ghost runs okay, stop Ghost in development mode by pressing Ctrl+C. Now it is time to launch Ghost in production mode.

When you run Ghost in production mode, you can use Node.js module called forever, which allows you to daemonize Ghost, and run it as a background process.

To install forever module:

    $ sudo npm install forever -g 

Finally, launch Ghost in production mode as follows:

    $ cd /var/www/ghost
    $ sudo NODE_ENV=production forever start index.js 

Verify that Ghost's database is successfully created in production mode (/var/www/ghost/content/data/ghost.db).

You can also check a list of active forever processes.

    $ sudo forever list 

>     info:    Forever processes running
>     data:        uid  command         script   forever pid   logfile                     uptime       
>     data:    [0] cH0O /usr/bin/nodejs index.js 15355   15357 /home/dev/.forever/cH0O.log 0:0:0:37.741 

If you see output like the above, it means that Ghost is running in the background successfully.

To stop Ghost daemon, run the following command.

    $ cd /var/www/ghost
    $ sudo forever stop index.js 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/install-ghost-blogging-platform-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://ghost.org/
[2]:http://www.kickstarter.com/projects/johnonolan/ghost-just-a-blogging-platform
[3]:http://ask.xmodulo.com/install-node-js-linux.html
[4]:http://www.flickr.com/photos/xmodulo/10881189204/
[5]:http://www.flickr.com/photos/xmodulo/10881348733/