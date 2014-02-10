[一起领了吧 —— bazz2]
Two Pi R 2: Web Servers
================================================================================
In my last [article][1][注：此文章在另一篇原文“Two Pi R”中], I talked about how even though an individual Raspberry Pi is not that redundant, two Pis are. I described how to set up two Raspberry Pis as a fault-tolerant file server using the GlusterFS clustered filesystem. Well, now that we have redundant, fault-tolerant storage shared across two Raspberry Pis, we can use that as a foundation to build other fault-tolerant services. In this article, I describe how to set up a simple Web server cluster on top of the Raspberry Pi foundation we already have. 

 Just in case you didn't catch the first column, I'll go over the setup from last month. I have two Raspberry Pis: Pi1 and Pi2. Pi1 has an IP address of 192.168.0.121, and Pi2 has 192.168.0.122. I've set them up as a GlusterFS cluster, and they are sharing a volume named gv0 between them. I also mounted this shared volume on both machines at /mnt/gluster1, so they each could access the shared storage at the same time. Finally, I performed some failure testing. I mounted this shared storage on a third machine and launched a simple script that wrote the date to a file on the shared storage. Then, I experimented with taking down each Raspberry Pi individually to confirm the storage stayed up.

Now that I have the storage up and tested, I'd like to set up these Raspberry Pis as a fault-tolerant Web cluster. Granted, Raspberry Pis don't have speedy processors or a lot of RAM, but they still have more than enough resources to act as a Web server for static files. Although the example I'm going to give is very simplistic, that's intentional—the idea is that once you have validated that a simple static site can be hosted on redundant Raspberry Pis, you can expand that with some more sophisticated content yourself.

### Install Nginx ###

Although I like Apache just fine, for a limited-resource Web server serving static files, something like nginx has the right blend of features, speed and low resource consumption that make it ideal for this site. Nginx is available in the default Raspbian package repository, so I log in to the first Raspberry Pi in the cluster and run: 

    $ sudo apt-get update
    $ sudo apt-get install nginx

Once nginx installed, I created a new basic nginx configuration at /mnt/gluster1/cluster that contains the following config: 

    server {
      root /mnt/gluster1/www;
      index index.html index.htm;
      server_name twopir twopir.example.com;
    
      location / {
            try_files $uri $uri/ /index.html;
      }
    }

Note: I decided to name the service twopir, but you would change this to whatever hostname you want to use for the site. Also notice that I set the document root to /mnt/gluster1/www. This way, I can put all of my static files onto shared storage so they are available from either host.

Now that I have an nginx config, I need to move the default nginx config out of the way and set up this config to be the default. Under Debian, nginx organizes its files a lot like Apache with sites-available and sites-enabled directories. Virtual host configs are stored in sites-available, and sites-enabled contains symlinks to those configs that you want to enable. Here are the steps I performed on the first Raspberry Pi: 

    $ cd /etc/nginx/sites-available
    $ sudo ln -s /mnt/gluster1/cluster .
    $ cd /etc/nginx/sites-enabled
    $ sudo rm default
    $ sudo ln -s /etc/nginx/sites-available/cluster .

Now I have a configuration in place but no document root to serve. The next step is to create a /mnt/gluster1/www directory and copy over the default nginx index.html file to it. Of course, you probably would want to create your own custom index.html file here instead, but copying a file is a good start: 

    $ sudo mkdir /mnt/gluster1/www
    $ cp /usr/share/nginx/www/index.html /mnt/gluster1/www

With the document root in place, I can restart the nginx service: 

    $ sudo /etc/init.d/nginx restart

Now I can go to my DNS server and make sure I have an A record for twopir that points to my first Raspberry Pi at 192.168.0.121. In your case, of course, you would update your DNS server with your hostname and IP. Now I would open up http://twopir/ in a browser and confirm that I see the default nginx page. If I look at the /var/log/nginx/access.log file, I should see evidence that I hit the page.

Once I've validated that the Web server works on the first Raspberry Pi, it's time to duplicate some of the work on the second Raspberry Pi. Because I'm storing configurations on the shared GlusterFS storage, really all I need to do is install nginx, create the proper symlinks to enable my custom nginx config and restart nginx: 

    $ sudo apt-get update
    $ sudo apt-get install nginx
    $ cd /etc/nginx/sites-available
    $ sudo ln -s /mnt/gluster1/cluster .
    $ cd /etc/nginx/sites-enabled
    $ sudo rm default
    $ sudo ln -s /etc/nginx/sites-available/cluster .
    $ sudo /etc/init.d/nginx restart

### Two DNS A Records ###

So, now I have two Web hosts that can host the same content, but the next step in this process is an important part of what makes this setup redundant. Although you definitely could set up a service like heartbeat with some sort of floating IP address that changed from one Raspberry Pi to the next depending on what was up, an even better approach is to use two DNS A records for the same hostname that point to each of the Raspberry Pi IPs. Some people refer to this as DNS load balancing, because by default, DNS lookups for a hostname that has multiple A records will return the results in random order each time you make the request: 

    $ dig twopir.example.com A +short
    192.168.0.121
    192.168.0.122
    $ dig twopir.example.com A +short
    192.168.0.122
    192.168.0.121

Because the results are returned in random order, clients should get sent evenly between the different hosts, and in effect, multiple A records do result in a form of load balancing. What interests me about a host having multiple A records though isn't as much the load balancing as how a Web browser handles failure. When a browser gets two A records for a Web host, and the first host is unavailable, the browser almost immediately will fail over to the next A record in the list. This failover is fast enough that in many cases it's imperceptible to the user and definitely is much faster than the kind of failover you might see in a traditional heartbeat cluster.

So, go to the same DNS server you used to add the first A record and add a second record that references the same hostname but a different IP address—the IP address of the second host in the cluster. Once you save your changes, perform a dig query like I performed above and you should get two IP addresses back. 

Once you have two A records set up, the cluster is basically ready for use and is fault-tolerant. Open two terminals and log in to each Raspberry Pi, and run `tail -f /var/log/nginx/access.log` so you can watch the Web server access then load your page in a Web browser. You should see activity on the access logs on one of the servers but not the other. Now refresh a few times, and you'll notice that your browser should be sticking to a single Web server. After you feel satisfied that your requests are going to that server successfully, reboot it while refreshing the Web page multiple times. If you see a blip at all, it should be a short one, because the moment the Web server drops, you should be redirected to the second Raspberry Pi and be able to see the same index page. You also should see activity in the access logs. Once the first Raspberry Pi comes back from the reboot, you probably will not even be able to notice from the perspective of the Web browser. 

Experiment with rebooting one Raspberry Pi at a time, and you should see that as long as you have one server available, the site stays up. Although this is a simplistic example, all you have to do now is copy over any other static Web content you want to serve into /mnt/gluster1/www, and enjoy your new low-cost fault-tolerant Web cluster. 

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/two-pi-r-2-web-servers

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linuxjournal.com/content/two-pi-r
