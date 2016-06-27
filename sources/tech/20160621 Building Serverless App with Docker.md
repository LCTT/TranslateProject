BUILDING SERVERLESS APPS WITH DOCKER
======================================

Every now and then, there are waves of technology that threaten to make the previous generation of technology obsolete.  There has been a lot of talk about a technique called “serverless” for writing apps. The idea is to deploy your application as a series of functions, which are called on-demand when they need to be run. You don’t need to worry about managing servers, and these functions scale as much as you need, because they are called on-demand and run on a cluster.

But serverless doesn’t mean there is no Docker – in fact, Docker is serverless. You can use Docker to containerize these functions, then run them on-demand on a Swarm. Serverless is a technique for building distributed apps and Docker is the perfect platform for building them on.

### From servers to serverless

So how might we write applications like this? Let’s take our example [a voting application consisting of 5 services][1]:

![](https://blog.docker.com/wp-content/uploads/Picture1.png)

This consists of:

- Two web frontends
- A worker for processing votes in the background
- A message queue for processing votes
- A database

The background processing of votes is a very easy target for conversion to a serverless architecture. In the voting app, we can run a bit of code like this to run the background task:

```
import dockerrun
client = dockerrun.from_env()
client.run("bfirsh/serverless-record-vote-task", [voter_id, vote], detach=True)
```

The worker and message queue can be replaced with a Docker container that is run on-demand on a Swarm, automatically scaling to demand.

We can even eliminate the web frontends. We can replace them with Docker containers that serve up a single HTTP request, triggered by a lightweight HTTP server that spins up Docker containers for each HTTP request. The heavy lifting has now moved the long-running HTTP server to Docker containers that run on-demand, so they can automatically scale to handle load.

Our new architecture looks something like this:

![](https://blog.docker.com/wp-content/uploads/Picture2.png)

The red blocks are the continually running services and the green blocks are Docker containers that are run on-demand. This application has fewer long-running services that need managing, and by its very nature scales up automatically in response to demand (up to the size of your Swarm!).

### So what can we do with this?

There are three useful techniques here which you can use in your apps:

1. Run functions in your code as on-demand Docker containers
2. Use a Swarm to run these on a cluster
3. Run containers from containers, by passing a Docker API socket
 

With the combination of these techniques, this opens up loads of possibilities about how you can architect your applications. Running background work is a great example of something that works well, but a whole load of other things are possible too, for example:

- Launching a container to serve user-facing HTTP requests is probably not practical due to the latency. However – you could write a load balancer which knew how to auto-scale its own web frontends by running containers on a Swarm.
- A MongoDB container which could introspect the structure of a Swarm and launch the correct shards and replicas.

### What’s next

We’ve got all these radically new tools and abstractions for building apps, and we’ve barely scratched the surface of what is possible with them. We’re still building applications like we have servers that stick around for a long time, not for the future where we have Swarms that can run code on-demand anywhere in your infrastructure.

This hopefully gives you some ideas about what you can build, but we also need your help. We have all the fundamentals to be able to start building these applications, but its still in its infrancy – we need better tooling, libraries, example apps, documentation, and so on.

[This GitHub repository has links off to tools, libraries, examples, and blog posts][3]. Head over there if you want to learn more, and please contribute any links you have there so we can start working together on this.

Get involved, and happy hacking!

### Learn More about Docker

- New to Docker? Try our 10 min [online tutorial][4]
- Share images, automate builds, and more with [a free Docker Hub account][5]
- Read the Docker [1.12 Release Notes][6]
- Subscribe to [Docker Weekly][7]
- Sign up for upcoming [Docker Online Meetups][8]
- Attend upcoming [Docker Meetups][9]
- Watch [DockerCon EU 2015 videos][10]
- Start [contributing to Docker][11]


--------------------------------------------------------------------------------

via: https://blog.docker.com/2016/06/building-serverless-apps-with-docker/

作者：[Ben Firshman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.docker.com/author/bfirshman/

[1]: https://github.com/docker/example-voting-app
[3]: https://github.com/bfirsh/serverless-docker
[4]: https://docs.docker.com/engine/understanding-docker/ 
[5]: https://hub.docker.com/
[6]: https://docs.docker.com/release-notes/
[7]: https://www.docker.com/subscribe_newsletter/
[8]: http://www.meetup.com/Docker-Online-Meetup/
[9]: https://www.docker.com/community/meetup-groups
[10]: https://www.youtube.com/playlist?list=PLkA60AVN3hh87OoVra6MHf2L4UR9xwJkv
[11]: https://docs.docker.com/contributing/contributing/



