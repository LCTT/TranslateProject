4 open source alternatives to Trello that you can self-host
============================================================

Trello is a visual team collaboration platform that was recently acquired by Atlassian. And by that, I mean as _recently_ as today Monday, January 9 2017.

I’ve been using Trello as a board member of DigitalOcean’s community authors and started using it to manage a small team project for a non-profit organization a couple of days ago. It’s a nice piece of software that any team, including those with non-geeky members, can use comfortable.

If you like [Trello][6], but now want a similar software that you can self-host, or run on your own server, I’ve found four that you can choose from. Keep in mind that I’ve not installed any of these on my own server, but from the information I’ve gathered about them, the ones I’m most likely to use are Kanboard and Restyaboard.

And that’s because their installation requirements are familiar.. Their installation process are also relatively simpler. Restyaboard seems to have a more polished UI, so it will probably be my first option, though one of it’s requirements (Elasticsearch) makes me think that the server requirements will be more than for others. In any case, I’ll be posting my attempt to self-host both Kanboard and Restyaboard soon, so check back often.

Until then, the top four alternatives for Trello that I’ve found, are:

### Kanboard

Aside form the fact that it is free and open source, Kanban features integrations with third party tools and services like Amazon S3 Storage, Hipchat, Jabber, RabbitMQ, Slack, and many more. Kanboard can be installed on a Microsoft operating system, but for installation on free and open source components, you’ll need the following:

*   PHP >= 5.3.9
*   MariaDB/MySQL, Postgres, or Sqlite
*   Apache or Nginx
*   CentOS 6/7, Debian 8, FreeBSD 10, or Ubuntu 14.04/16.04

[Related Post:  Five Reasons to Switch to Software for Load Balancing][7]

From just a very cursory assessment of the project, the UI seems to be less polished than that of others mentioned in this article. And in the event that you change your mind about self-hosting, there’s a managed, or hosted Kanboard that you can register for. The project’s GitHub page is available at [https://github.com/kanboard/kanboard][8]

 ![kanboard interface](http://linuxbsdos.com/wp-content/uploads/2017/01/kanboard-700x312.png "kanboard interface") 

### Restyaboard

With a polished UI and ability to import data from Trello, Restyaboard is a very attractive Trello alternative. And the installation requirements seem modest; you’ll need the following to install Restyaboard on your server:

*   PHP-FPM
*   Postgres
*   Nginx
*   Elasticsearch

Even with those few requirements, installation is made even simpler with a script that will auto-install all you need on your server. Also there’s an AMI for installation on Amazon AWS. For Docker fans, there’s an unofficial Docker image you can use to run Restyaboard containers. I don’t encourage running Docker containers using unofficial Docker images, but it’s an option if you wish to go that route. Details at the project’s [GitHub page][9].

 ![Restyaboard project management software](http://linuxbsdos.com/wp-content/uploads/2017/01/restyaboard-646x460.png "Restyaboard project management software") 

### Taiga

A Taiga deployment is made up of three components – taiga-back (backend/api), taiga-front-dist (frontend), taiga-events – each with its own requirements. In general, you need the following to install Taiga on your server:

[Related Post:  Dual-boot Fedora 25, Windows 10 on a computer with UEFI firmware][10]*   Python >= 3.4*   PostgreSQL >= 9.3*   RabbitMQ (optional as long as you don’t want async notifications)*   gcc and development headers*   Ruby >= 2.1 (only for compiling sass)*   NodeJS >= 5.0 (with npm, gulp and bower for downloading dependencies and compiling coffeescript)

The installation requirements seem to be a bit more involved than the others, so if that’s going to be an issue for you, there’s an hosted platform that’s free to use. Extra features on that hosted platform are fee-based. Visit the project’s [GitHub page][1] for details.

 ![Taiga project management software](http://linuxbsdos.com/wp-content/uploads/2017/01/Taiga-700x440.jpg "Taiga project management software") 

### Wekan

Wekan is built with Meteor, a JavaScript framework for building web applications, and is hosted at [https://github.com/wekan/wekan][2]. The project offers a 1-click installation on Heroku, Sandstorm, and verified Docker images for running it on Docker containers. It can also be installed on Scalingo, IndieHosters and Cloudron, but I couldn’t find installation instructions for deploying it on other Cloud hosting providers like [Vultr][3]and [DigitalOcean][4].

So it seems that your best bet, and the easiest route to installing Wekan, is to use one of the supported Cloud hosting platforms.

 ![Wekan project management software](http://linuxbsdos.com/wp-content/uploads/2017/01/Wekan-700x363.jpeg "Wekan project management software") 

As promised, check back soon for the publication of my guide on how to install Kanboard and Restyaboard on your server.

### UPDATE

Just after publishing this article, I came across [Tuleap][5]. It seems to be very polished, but a production installation is supported only on CentOS 6 and Red Hat 6\. Containerized installation using Docker is supported, but not recommended for production.

--------------------------------------------------------------------------------

via: http://linuxbsdos.com/2017/01/09/4-open-source-alternatives-to-trello-that-you-can-self-host/

作者：[linuxbsdos.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxbsdos.com
[1]:https://github.com/taigaio/
[2]:https://github.com/wekan/wekan
[3]:http://www.vultr.com/?ref=6827794
[4]:https://www.digitalocean.com/?refcode=900fe177d075
[5]:https://www.tuleap.org/
[6]:https://trello.com/
[7]:http://linuxbsdos.com/2016/07/11/five-reasons-to-switch-to-software-for-load-balancing/
[8]:https://github.com/kanboard/kanboard
[9]:https://github.com/RestyaPlatform/board
[10]:http://linuxbsdos.com/2016/12/01/dual-boot-fedora-25-windows-10-on-a-computer-with-uefi-firmware/
