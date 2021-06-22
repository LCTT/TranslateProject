[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Load balance network traffic with HAProxy)
[#]: via: (https://opensource.com/article/20/11/load-balancing-haproxy)
[#]: author: (Jim O'Connell https://opensource.com/users/jimoconnell)

Load balance network traffic with HAProxy
======
Install, configure, and run HAProxy to distribute network traffic across
several web or application servers.
![eight stones balancing][1]

You don't have to work at a huge company to justify using a load balancer. You might be a hobbyist, self-hosting a website from a couple of Raspberry Pi computers. Perhaps you're the server administrator for a small business; maybe you _do_ work for a huge company. Whatever your situation, you can benefit from using the [HAProxy][2] load balancer to manage your traffic.

HAProxy is known as "the world's fastest and most widely used software load balancer." It packs in many features that can make your applications more secure and reliable, including built-in rate limiting, anomaly detection, connection queuing, health checks, and detailed logs and metrics. Learning the basic skills and concepts covered in this tutorial will help you use HAProxy to build a more robust, far more powerful infrastructure.

### Why would you need a load balancer?

A load balancer is a way to easily distribute connections across several web or application servers. In fact, HAProxy can balance any type of Transmission Control Protocol ([TCP][3]) traffic, including RDP, FTP, WebSockets, or database connections. The ability to distribute load means you don't need to purchase a massive web server with zillions of gigs of RAM just because your website gets more traffic than Google.

A load balancer also gives you flexibility. Perhaps your existing web server isn't robust enough to meet peak demand during busy times of the year and you'd like to add another, but only temporarily. Maybe you want to add some redundancy in case one server fails. With HAProxy, you can add more servers to the backend pool when you need them and remove them when you don't.

You can also route requests to different servers depending on the context. For example, you might want to handle your static content with a couple of cache servers, such as [Varnish][4], but route anything that requires dynamic content, such as an API endpoint, to a more powerful machine.

In this article, I will walk through setting up a very basic HAProxy installation to use HTTPS to listen on secure port 443 and utilize a couple of backend web servers. It will even send all traffic that comes to a predefined URL (like `/api/`) to a different server or pool of servers.

### Install HAProxy

To get started, spin up a new CentOS 8 server or instance and bring the system up to date:


```
`sudo yum update -y`
```

This typically runs for a while. Grab yourself a coffee while you wait.

This installation has two parts: the first part installs the yum version of HAProxy, and the second part compiles and installs your binary from source to overwrite the previous HAProxy with the latest version. Installing with yum does a lot of the heavy lifting as far as generating systemd startup scripts, etc., so run the `yum install` and then overwrite the HAProxy binary with the latest version by compiling it from its source code:


```
`sudo yum install -y haproxy`
```

Enable the HAProxy service:


```
`sudo systemctl enable haproxy`
```

To upgrade to the latest version ([version 2.2][5], as of this writing), compile the source code. Many people assume that compiling and installing a program from its source code requires a high degree of technical ability, but it's a pretty straightforward process. Start by using `yum` to install a few packages that provide the tools for compiling code:


```
sudo yum install dnf-plugins-core
sudo yum config-manager --set-enabled PowerTools
# (Multiline command next 3 lines. Copy and paste together:) 

sudo yum install -y git ca-certificates gcc glibc-devel \
  lua-devel pcre-devel openssl-devel systemd-devel \
  make curl zlib-devel 
```

Use `git` to get the latest source code and change to the `haproxy` directory:


```
git clone <http://git.haproxy.org/git/ haproxy>
cd haproxy
```

Run the following three commands to build and install HAProxy with integrated Prometheus support:


```
# Multiline command next 3 lines copy and paste together: 
make TARGET=linux-glibc USE_LUA=1 USE_OPENSSL=1 USE_PCRE=1 \
PCREDIR= USE_ZLIB=1 USE_SYSTEMD=1 \ EXTRA_OBJS="contrib/

sudo make PREFIX=/usr install # Install to /usr/sbin/haproxy
```

Test it by querying the version:


```
`haproxy -v`
```

You should get the following output:


```
`HA-Proxy version 2.2.4-b16390-23 2020/10/09 - https://haproxy.org/`
```

### Create the backend server

HAProxy doesn't serve any traffic directly—this is the job of backend servers, which are typically web or application servers. For this exercise, I'm using a tool called [Ncat][6], the "Swiss Army knife" of networking, to create some exceedingly simple servers. Install it:


```
`sudo yum install nc -y`
```

If your system has [SELinux][7] enabled, you'll need to enable port 8404, the port used for accessing the HAProxy Stats page (explained below), and the ports for your backend servers:


```
sudo dnf install policycoreutils-python-utils
sudo semanage port -a -t http_port_t  -p tcp 8404
sudo semanage port -a -t http_port_t  -p tcp 10080;
sudo semanage port -a -t http_port_t  -p tcp 10081;
sudo semanage port -a -t http_port_t  -p tcp 10082;
```

Create two Ncat web servers and an API server:


```
while true ;
do
nc -l -p 10080 -c 'echo -e "HTTP/1.1 200 OK\n\n This is Server ONE"' ;
done &amp;

while true ;
do
nc -l -p 10081 -c 'echo -e "HTTP/1.1 200 OK\n\n This is Server TWO"' ;
done &amp;

while true ;
do
nc -l -p 10082 -c 'echo -e "HTTP/1.1 200 OK\nContent-Type: application/json\n\n { \"Message\" :\"Hello, World!\" }"' ;
done &amp;
```

These simple servers print out a message (such as "This is Server ONE") and run until the server is stopped. In a real-world setup, you would use actual web and app servers.

### Modify the HAProxy config file

HAProxy's configuration file is `/etc/haproxy/haproxy.cfg`. This is where you make the changes to define your load balancer. This [basic configuration][8] will get you started with a working server:


```
global
    log         127.0.0.1 local2
    user        haproxy
    group       haproxy

defaults 
    mode                    http
    log                     global
    option                  httplog

frontend main
    bind *:80
        
    default_backend web
    use_backend api if { path_beg -i /api/ }
    
    #-------------------------
    # SSL termination - HAProxy handles the encryption.
    #    To use it, put your PEM file in /etc/haproxy/certs  
    #    then edit and uncomment the bind line (75)
    #-------------------------
    # bind *:443 ssl crt /etc/haproxy/certs/haproxy.pem ssl-min-ver TLSv1.2
    # redirect scheme https if !{ ssl_fc }

#-----------------------------
# Enable stats at <http://test.local:8404/stats>
#-----------------------------

frontend stats
    bind *:8404
    stats enable
    stats uri /stats
#-----------------------------
# round robin balancing between the various backends
#-----------------------------

backend web
    server web1 127.0.0.1:10080 check
    server web2 127.0.0.1:10081 check

#-----------------------------

# API backend for serving up API content
#-----------------------------
backend api
    server api1 127.0.0.1:10082 check
```

### Restart and reload HAProxy

HAProxy is probably not running yet, so issue the command `sudo systemctl restart haproxy` to start (or restart) it. The `restart` method is fine for non-production situations, but once you are up and running, you'll want to get in the habit of using `sudo systemctl reload haproxy` to avoid service interruptions, even if you have an error in your config.

For example, after you make changes to `/etc/haproxy/haproxy.cfg`, you need to reload the daemon with `sudo systemctl reload haproxy` to effect the changes. If there is an error, it will let you know but continue running with the previous configuration. Check your HAProxy status with `sudo systemctl status haproxy`.

If it doesn't report any errors, you have a running server. Test it with curl on the server, by typing `curl http://localhost/` on the command line. If you see "_This is Server ONE_," then it all worked! Run `curl` a few times and watch it cycle through your backend pool, then see what happens when you type `curl http://localhost/api/`. Adding `/api/` to the end of the URL will send all of that traffic to the third server in your pool. At this point, you should have a functioning load balancer!

### Check your stats

You may have noted that the configuration defined a frontend called `stats` that is listening on port 8404:


```
frontend stats
    bind *:8404
    stats uri /stats
    stats enable
```

In your browser, load up `http://localhost:8404/stats`. Read HAProxy's blog "[Exploring the HAProxy Stats page][9]" to find out what you can do here.

### A powerful load balancer

Although I covered just a few of HAProxy's features, you now have a server that listens on ports 80 and 443, redirecting HTTP traffic to HTTPS, balancing traffic between several backend servers, and even sending traffic matching a specific URL pattern to a different backend server. You also unlocked the very powerful HAProxy Stats page that gives you a great overview of your systems.

This exercise might seem simple, make no mistake about it—you have just built and configured a very powerful load balancer capable of handling a significant amount of traffic.

For your convenience, I put all the commands in this article in a [GitHub Gist][10].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/load-balancing-haproxy

作者：[Jim O'Connell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jimoconnell
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/water-stone-balance-eight-8.png?itok=1aht_V5V (eight stones balancing)
[2]: https://www.haproxy.org/
[3]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol
[4]: https://varnish-cache.org/
[5]: https://www.haproxy.com/blog/announcing-haproxy-2-2/
[6]: https://nmap.org/ncat
[7]: https://www.redhat.com/en/topics/linux/what-is-selinux
[8]: https://gist.github.com/haproxytechblog/38ef4b7d42f16cfe5c30f28ee3304dce
[9]: https://www.haproxy.com/blog/exploring-the-haproxy-stats-page/
[10]: https://gist.github.com/haproxytechblog/d656422754f1b5eb1f7bbeb1452d261e
