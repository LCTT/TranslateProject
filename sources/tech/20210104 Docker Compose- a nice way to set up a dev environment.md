[#]: collector: (lujun9972)
[#]: translator: (lkxed)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Docker Compose: a nice way to set up a dev environment)
[#]: via: (https://jvns.ca/blog/2021/01/04/docker-compose-is-nice/)
[#]: author: (Julia Evans https://jvns.ca/)

Docker Compose: a nice way to set up a dev environment
======

Hello! Here is another post about [computer tools that I’ve appreciated][1]. This one is about Docker Compose!

This post is mostly just about how delighted I was that it does what it’s supposed to do and it seems to work and to be pretty straightforward to use. I’m also only talking about using Docker Compose for a dev environment here, not using it in production.

I’ve been thinking about this kind of personal dev environment setup more recently because I now do all my computing with a personal cloud budget of like $20/month instead of spending my time at work thinking about how to manage thousands of AWS servers.

I’m very happy about this because previous to trying Docker Compose I spent two days getting frustrated with trying to set up a dev environment with other tools and Docker Compose was a lot easier and simpler. And then I told my sister about my docker-compose experiences and she was like “I KNOW, DOCKER COMPOSE IS GREAT RIGHT?!?!” So I thought I’d write a blog post about it, and here we are.

### the problem: setting up a dev environment

Right now I’m working on a Ruby on Rails service (the backend for a sort of computer debugging game). On my production server, I have:

  * a nginx proxy
  * a Rails server
  * a Go server (which proxies some SSH connections with [gotty][2])
  * a Postgres database



Setting up the Rails server locally was pretty straightforward without resorting to containers (I just had to install Postgres and Ruby, fine, no big deal), but then I wanted send `/proxy/*` to the Go server and everything else to the Rails server, so I needed nginx too. And installing nginx on my laptop felt too messy to me.

So enter `docker-compose`!

### docker-compose lets you run a bunch of Docker containers

Docker Compose basically lets you run a bunch of Docker containers that can communicate with each other.

You configure all your containers in one file called `docker-compose.yml`. I’ve pasted my entire `docker-compose.yml` file here for my server because I found it to be really short and straightforward.

```
version: "3.3"
services:
  db:
    image: postgres
    volumes:
      - ./tmp/db:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: password # yes I set the password to 'password'
  go_server:
    # todo: use a smaller image at some point, we don't need all of ubuntu to run a static go binary
    image: ubuntu
    command: /app/go_proxy/server
    volumes:
      - .:/app
  rails_server:
    build: docker/rails
    command: bash -c "rm -f tmp/pids/server.pid && source secrets.sh && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/app
  web:
    build: docker/nginx
    ports:
      - "8777:80" # this exposes port 8777 on my laptop
```

There are two kinds of containers here: for some of them I’m just using an existing image (`image: postgres` and `image: ubuntu`) without modifying it at all. And for some I needed to build a custom container image – `build: docker/rails` says to use `docker/rails/Dockerfile` to build a custom container.

I needed to give my Rails server access to some API keys and things, so `source secrets.sh` puts a bunch of secrets in environment variables. Maybe there’s a better way to manage secrets but it’s just me so this seemed fine.

### how to start everything: `docker-compose build` then `docker-compose up`

I’ve been starting my containers just by running `docker-compose build` to build the containers, then `docker-compose up` to run everything.

You can set `depends_on` in the yaml file to get a little more control over when things start in, but for my set of services the start order doesn’t matter, so I haven’t.

### the networking is easy to use

It’s important here that the containers be able to connect to each other. Docker Compose makes that super simple! If I have a Rails server running in my `rails_server` container on port 3000, then I can access that with `http://rails_server:3000`. So simple!

Here’s a snippet from my nginx configuration file with how I’m using that in practice (I removed a bunch of `proxy_set_header` lines to make it more clear)

```
location ~ /proxy.* {
    proxy_pass http://go_server:8080;
}
location @app {
    proxy_pass http://rails_server:3000;
}
```

Or here’s a snippet from my Rails project’s database configuration, where I use the name of the database container (`db`):

```
development:
  <<: *default
  database: myproject_development
  host: db # <-------- this "magically" resolves to the database container's IP address
  username: postgres
  password: password
```

I got a bit curious about how `rails_server` was actually getting resolved to an IP address. It seems like Docker is running a DNS server somewhere on my computer to resolve these names. Here are some DNS queries where we can see that each container has its own IP address:

```
$ dig +short @127.0.0.11 rails_server
172.18.0.2
$ dig +short @127.0.0.11 db
172.18.0.3
$ dig +short @127.0.0.11 web
172.18.0.4
$ dig +short @127.0.0.11 go_server
172.18.0.5
```

### who’s running this DNS server?

I dug into how this DNS server is set up a very tiny bit.

I ran all these commands outside the container, because I didn’t have a lot of networking tools installed in the container.

**step 1**: find the PID of my Rails server with `ps aux | grep puma`

It’s 1837916. Cool.

**step 2**: find a UDP server running in the same network namespace as PID `1837916`

I did this by using `nsenter` to run `netstat` in the same network namespace as the `puma` process. (technically I guess you could run `netstat -tupn` to just show UDP servers, but my fingers only know how to type `netstat -tulpn` at this point)

```
$ sudo nsenter -n -t 1837916 netstat -tulpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 127.0.0.11:32847        0.0.0.0:*               LISTEN      1333/dockerd
tcp        0      0 0.0.0.0:3000            0.0.0.0:*               LISTEN      1837916/puma 4.3.7
udp        0      0 127.0.0.11:59426        0.0.0.0:*                           1333/dockerd
```

So there’s a UDP server running on port `59426`, run by `dockerd`! Maybe that’s the DNS server?

**step 3**: check that it’s a DNS server

We can use `dig` to make a DNS query to it:

```
$ sudo nsenter -n -t 1837916 dig +short @127.0.0.11 59426 rails_server
172.18.0.2
```

But – when we ran `dig` earlier, we weren’t making a DNS query to port 59426, we were querying port 53! What’s going on?

**step 4**: iptables

My first guess for “this server seems to be running on port X but I’m accessing it on port Y, what’s going on?” was “iptables”.

So I ran iptables-save in the container’s network namespace, and there we go:

```
$ sudo nsenter -n -t 1837916 iptables-save
.... redacted a bunch of output ....
-A DOCKER_POSTROUTING -s 127.0.0.11/32 -p udp -m udp --sport 59426 -j SNAT --to-source :53
COMMIT
```

There’s an iptables rule that sends traffic on port 53 to 59426. Fun!

### it stores the database files in a temp directory

One nice thing about this is: instead of managing a Postgres installation on my laptop, I can just mount the Postgres container’s data directory at `./tmp/db`.

I like this because I really do not want to administer a Postgres installation on my laptop (I don’t really know how to configure Postgres), and conceptually I like having my dev database literally be in the same directory as the rest of my code.

### I can access the Rails console with `docker-compose exec rails_server rails console`

Managing Ruby versions is always a little tricky and even when I have it working, I always kind of worry I’m going to screw up my Ruby installation and have to spend like ten years fixing it.

With this setup, if I need access to the Rails console (a REPL with all my Rails code loaded), I can just run:

```
$ docker-compose exec rails_server rails console
Running via Spring preloader in process 597
Loading development environment (Rails 6.0.3.4)
irb(main):001:0>
```

Nice!

### small problem: no history in my Rails console

I ran into a problem though: I didn’t have any history in my Rails console anymore, because I was restarting the container all the time.

I figured out a pretty simple solution to this though: I added a `/root/.irbrc` to my container that changed the IRB history file’s location to be something that would persist between container restarts. It’s just one line:

```
IRB.conf[:HISTORY_FILE] = "/app/tmp/irb_history"
```

### I still don’t know how well it works in production

Right now my production setup for this project is still “I made a digitalocean droplet and edited a lot of files by hand”.

I think I’ll try to use docker-compose to run this thing in production. My guess is that it should work fine because this service is probably going to have at most like 2 users at a time and I can easily afford to have 60 seconds of downtime during a deploy if I want, but usually something goes wrong that I haven’t thought of.

A few notes from folks on Twitter about docker-compose in production:

  * `docker-compose up` will only restart the containers that need restarting, which makes restarts faster
  * there’s a small bash script [wait-for-it][3] that you can use to make a container wait for another service to be available
  * You can have 2 docker-compose.yaml files: `docker-compose.yaml` for DEV, and `docker-compose-prod.yaml` for prod. I think I’ll use this to expose different nginx ports: 8999 in dev and 80 in prod.
  * folks seemed to agree that docker-compose is fine in production if you have a small website running on 1 computer
  * one person suggested that Docker Swarm might be better for a slightly more complicated production setup, but I haven’t tried that (or of course Kubernetes, but the whole point of Docker Compose is that it’s super simple and Kubernetes is certainly not simple :) )



Docker also seems to have a feature to [automatically deploy your docker-compose setup to ECS][4], which sounds cool in theory but I haven’t tried it.

### when doesn’t docker-compose work well?

I’ve heard that docker-compose doesn’t work well:

  * when you have a very large number of microservices (a simple setup is best)
  * when you’re trying to include data from a very large database (like putting hundreds of gigabytes of data on everyone’s laptop)
  * on Mac computers, I’ve heard that Docker can be a lot slower than on Linux (presumably because of the extra VM). I don’t have a Mac so I haven’t run into this.



### that’s all!

I spent an entire day before this trying to configure a dev environment by using Puppet to provision a Vagrant virtual machine only to realize that VMs are kind of slow to start and that I don’t really like writing Puppet configuration (I know, huge surprise :)).

So it was nice to try Docker Compose and find that it was straightforward to get to work!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/01/04/docker-compose-is-nice/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/#cool-computer-tools---features---ideas
[2]: https://github.com/yudai/gotty/
[3]: https://github.com/vishnubob/wait-for-it
[4]: https://docs.docker.com/cloud/ecs-integration/
