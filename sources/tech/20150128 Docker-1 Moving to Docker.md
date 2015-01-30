Moving to Docker
================================================================================
![](http://cocoahunter.com/content/images/2015/01/docker1.jpeg)

[TL;DR] This is the first post in a series of 3 on how my company moved its infrastructure from PaaS to Docker based deployment. If you want, you can skip the intro (this post) and head directly to the technical topics (links at the bottom of the page).

----------

In the last month I've been strggling with devops. This is my very personal story and experience in trying to streamline a deployment process of a Raila app with Docker.

When I started my company – [Touchware][1] – in 2012 I was a lone developer. Things were small, uncomplicated, they didn't require a lot of maintenance, nor they needed to scale all that much. During the course of last year though, we grew quite a lot (we are now a team of 10 people) and our server-side applications and API grew both in terms of scope and scale.

### Step 1 - Heroku ###

We still are a very small team and we need to make things going and run as smoothly as possible. When we looked for possible solutions, we decided to stick with something that would have removed from our shoulders the burden of managing hardware. Since we develop mainly Rails based applications and Heroku has a great support for RoR and various kind of DBs and cached (Postgres / Mongo / Redis etc.), the smartest choice seemed to be going with [Heroku][2]. And that's what we did.

Heroku has a great support and great documentation and deploying apps is just so snappy! Only problem is, when you start growing, you need to have piles of cash around to pay the bills. Not the best deal, really.

### Step 2 - Dokku ###

In a rush to try and cut the costs, we decided to try with Dokku. [Dokku][3], quoting the Github repo is a 

> Docker powered mini-Heroku in around 100 lines of Bash

We launched some instances on [DigitalOcean][4] with Dokku pre-installed and we gave it spin. Dokku is very much like Heroku, but when you have complex applications for whom you need to twear params, or where you need certain dependencies, it's just not gonna work out. We had an app where we needed to apply multiple transformations on images and we couldn't find a way to install the correct version of imagemagick into the dokku-based Docker container that was hosting our Rails app. We still have a couple of very simple apps that are running on Dokku, but we had to move some of them back to Heroku.

### Step 3 - Docker ###

A couple of months ago, since the problem of devops and managing production apps was resurfacing, I decided to try out [Docker][5]. Docker, in simple terms, allows developers to containerize applications and to ease the deployment. Since a Docker container basically has all the dependencies it needs to run your app, if everything runs fine on your laptop, you can be sure it'll also run like a champ in production on a remote server, be it an AWS E2C instance or a VPS on DigitalOcean.

Docker IMHO is particularly interesting for the following reasons:

- it promotes modularization and separation of concerns: you need to start thinking about your apps in terms of logical components (load balancer: 1 container, DB: 1 container, webapp: 1 container etc.);
- it's very flexible in terms of deployment options: containers can be deployed to a wide variety of HW and can be easily redeployed to different servers / providers;
- it allows for a very fine grained tuning of your app environment: you build the images your containers runs from, so you have plenty of options for configuring your environment exactly as you would like to.

There are howerver some downsides:

- the learning curve is quite steep (this is probably a very personal problem, but I'm talking as a software dev and not as a skilled operations professional);
- setup is not simple, especially if you want to have a private registry / repository (more about this later).

Following are some tips I put together during the course of the last week with the findings of someone that is new to the game.

----------

In the following articles we'll see how to setup a semi-automated Docker based deployment system.

- [Setting up a private Docker registry][6]
- [Configuring a Rails app for semi-automated deployment][7]

--------------------------------------------------------------------------------

via: http://cocoahunter.com/2015/01/23/docker-1/

作者：[Michelangelo Chasseur][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://cocoahunter.com/author/michelangelo/
[1]:http://www.touchwa.re/
[2]:http://cocoahunter.com/2015/01/23/docker-1/www.heroku.com
[3]:https://github.com/progrium/dokku
[4]:http://cocoahunter.com/2015/01/23/docker-1/www.digitalocean.com
[5]:http://www.docker.com/
[6]:http://cocoahunter.com/2015/01/23/docker-2/
[7]:http://cocoahunter.com/2015/01/23/docker-3/
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]: