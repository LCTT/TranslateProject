[#]: subject: "Hosting my static sites with nginx"
[#]: via: "https://jvns.ca/blog/2022/01/24/hosting-my-static-sites-with-nginx/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Hosting my static sites with nginx
======

Hello! Recently I’ve been thinking about putting my static sites on servers that I run myself instead of using managed services like Netlify or GitHub Pages.

Originally I thought that running my own servers would require a lot of maintenance and be a huge pain, but I was chatting with Wesley about what kind of maintainance [their servers][1] require, and they convinced me that it might not be that bad.

So I decided to try out moving all my static sites to a $5/month server to see what it was like.

Everything in here is pretty standard but I wanted to write down what I did anyway because there are a surprising number of decisions and I like to see what choices other people make.

### the constraint: only static sites

To keep things simple, I decided that this server would only run `nginx` and only serve static sites. I have about 10 static sites right now, mostly projects for [wizard zines][2].

I decided to use a $5/month DigitalOcean droplet, which should very easily be able to handle my existing traffic (about 3 requests per second and 100GB of bandwidth per month). Right now it’s using about 1% of its CPU. I picked DigitalOcean because it was what I’ve used before.

Also all the sites were already behind a CDN so they’re still behind the same CDN.

### problem 1: getting a clean Git repo for each build

This was the most interesting problem so let’s talk about it first!

Building the static sites might seem pretty easy – each one of them already has a working build script.

But I have pretty bad hygiene around files on my laptop – often I have a bunch of uncommitted files that I don’t want to go onto the live site. So I wanted to start every build with a clean Git repo. I also wanted this to be _fast_ – I’m impatient so I wanted to be able to build and deploy most of my sites in less than 10 seconds.

I handled this by hacking together a tiny build system called [tinybuild][3]. It’s basically a 4-line bash script, but with extra some command line arguments and error checking. Here are the 4 lines of bash:

```

    docker build - -t tinybuild < Dockerfile
    CONTAINER_ID=$(docker run -v "$PWD":/src -v "./deploy:/artifact" -d -t tinybuild /bin/bash)
    docker exec $CONTAINER_ID bash -c "git clone /src /build && cd /build && bash /src/scripts/build.sh"
    docker exec $CONTAINER_ID bash -c "mv /build/public/* /artifact"

```

These 4 lines:

  1. Build a Dockerfile with all the dependencies for that build
  2. Clone my repo into `/build` in the container, so that I always start with a clean Git repo
  3. Run the build script (`/src/scripts/build.sh`)
  4. Copy the build artifacts into `./deploy` in the local directory



Then once I have `./deploy`, I can rsync the result onto the server

It’s fast because:

  * the `docker build -` means I don’t send any state from the repository to the Docker daemon. This matters because one of my repos is 1GB (it has a lot of PDFs in it) and sending all that to the Docker daemon takes forever
  * the `git clone` is from the local filesystem and I have a SSD so it’s fast even for a 1GB repo
  * most of the build scripts just run `hugo` or `cat` so they’re fast. The `npm` build scripts take maybe 30 seconds.



### apparently local git clones make hard links

A tiny interesting fact: I tried to do `git clone --depth 1` to speed up my git clone, but git gave me this warning:

```

    warning: --depth is ignored in local clones; use file:// instead.

```

I think what’s going on here is that git makes hard links of all the objects to make a local clone (which is a lot faster than copying). So I guess with the hard links approach `--depth 1` doesn’t make sense for some reason? And `file://` forces git to copy all objects instead, which is actually slower.

### bonus: now my builds are faster than they used to be!

One nice thing about this is that my build/deploy time is less than it was on Netlify. For `jvns.ca` it’s about 7 seconds to build and deploy the site instead of about a minute previously.

### running the builds on my laptop seems nice

I’m the only person who develops all of my sites, so doing all the builds in a Docker container on my computer seems to make sense. My computer is pretty fast and all the files are already right there! No giant downloads! And doing it in a Docker container keeps the build isolated.

### example build scripts

Here are the build scripts for this blog (`jvns.ca`).

**Dockerfile**

```

    FROM ubuntu:20.04

    RUN apt-get update && apt-get install -y git
    RUN apt-get install -y wget python2
    RUN wget https://github.com/gohugoio/hugo/releases/download/v0.40.1/hugo_0.40.1_Linux-64bit.tar.gz
    RUN wget https://github.com/sass/dart-sass/releases/download/1.49.0/dart-sass-1.49.0-linux-x64.tar.gz
    RUN tar -xf dart-sass-1.49.0-linux-x64.tar.gz
    RUN tar -xf hugo_0.40.1_Linux-64bit.tar.gz
    RUN mv hugo /usr/bin/hugo
    RUN mv dart-sass/sass /usr/bin/sass

```

**build-docker.sh**:

```

    set -eu
    scripts/parse_titles.py
    sass sass/:static/stylesheets/
    hugo

```

**deploy.sh**:

```

    set -eu
    tinybuild -s scripts/build-docker.sh \
              -l "$PWD/deploy" \
              -c /build/public

    rsync-showdiff ./deploy/ [email protected]:/var/www/jvns.ca
    rm -rf ./deploy

```

### problem 2: getting rsync to just show me which files it updated

When I started using rsync to sync the files, it would list every single file instead of just files that had changed. I think this was because I was generating new files for every build, so the timestamps were always newer than the files on the server.

I did a bunch of Googling and figured out this incantation to get rsync to just show me files that were updated;

```

    rsync -avc --out-format='%n' "[email protected]" | grep --line-buffered -v '/$'

```

I put that in a script called `rsync-showdiff` so I could reuse it. There might be a better way, but this seems to work.

### problem 3: configuration management

All I needed to do to set up the server was:

  * install nginx
  * create directories in /var/www for each site, like `/var/www/jvns.ca`
  * create an nginx configuration for each site, like `/etc/nginx/sites-enabled/jvns.ca.conf`
  * deploy the files (with my deploy script above)



I wanted to use some kind of configuration management to do this because that’s how I’m used to managing servers. I’ve used Puppet a lot in the past at work, but I don’t really _like_ using Puppet. So I decided to use Ansible even though I’d never used it before because it seemed simpler than using Puppet. Here’s [my current Ansible configuration][4], minus some of the templates it depends on.

I didn’t use any Ansible plugins because I wanted to maximize the probability that I would actually be able to run this thing in 3 years.

The most complicated thing in there is probably the `reload nginx` handler, which makes sure that the configuration is still valid after I make an nginx configuration update.

### problem 4: replacing a lambda function

I was using one Netlify lambda function to calculate purchasing power parity (“PPP”) for countries that have a weaker currency relative to the US on <https://wizardzines.com>. Basically it gets your country using IP geolocation and then returns a discount code if you’re in a country that has a discount code. (like 70% off for India, for example). So I needed to replace it.

I handled this by rewriting the (very small) program in Go, copying the static binary to the server, and adding a `proxy_pass` for that site.

The program just looks up the country code from the [geolocation HTTP header][5] in a hashmap, so it doesn’t seem like it should cause maintenance problems.

### a very simple nginx config

I used the same nginx config file for templates for almost all my sites:

```

    server {
        listen 80;
        listen [::]:80;

        root /var/www/{{item.dir}};
        index index.html index.htm;
        server_name {{item.server}};

        location / {
            # First attempt to serve request as file, then
            # as directory, then fall back to displaying a 404.
            try_files $uri $uri/ =404;
        }
    }

```

The `{{item.dir}}` is an Ansible thing.

I also added support for custom 404 pages (`error_page /404.html`) in the main `nginx.conf`.

I’ll probably add TLS support with certbot later. My CDN handles TLS to the client, I just need to make the connection between the CDN and the origin server use TLS

Also I don’t know if there are problems with using such a simple nginx config. Maybe I’ll learn about them!

### bonus: I can find 404s more easily

Another nice bonus of this setup is that it’s easier to see what’s happening with my site – I can just look at the nginx logs!

I ran `grep 404 /var/log/nginx/access.log` to figure out if I’d broken anything during the migration, and I actually ended up finding a lot of links that had been broken for many years, but that I’d just never noticed.

Netlify’s analytics has a “Top resources not found” that shows you the most common 404s, but I don’t think there’s any way to see _all_ 404s.

### a small factor: costs

Part of my motivation for this switch was – I was getting close to the Netlify free tier’s bandwidth limit (100GB/month), and Netlify charges $20/100GB for additional bandwidth. Digital Ocean charges $1/100GB for additional bandwidth (20x less), and my droplet comes with 1TB of bandwidth. So the bandwidth pricing feels a lot more reasonable to me.

### we’ll see how it goes!

All my static sites are running on my own server now. I don’t really know what this will be like to maintain, we’ll see how it goes – maybe I’ll like it! maybe I’ll hate it! I definitely like the faster build times and that I can easily look at my nginx logs.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/01/24/hosting-my-static-sites-with-nginx/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://blog.wesleyac.com/posts/how-i-run-my-servers
[2]: https://wizardzines.com
[3]: https://github.com/jvns/tinybuild/
[4]: https://gist.github.com/jvns/06754e9e65b49dd461fefa071dd4aace
[5]: https://support.cloudflare.com/hc/en-us/articles/200168236-Configuring-Cloudflare-IP-Geolocation
