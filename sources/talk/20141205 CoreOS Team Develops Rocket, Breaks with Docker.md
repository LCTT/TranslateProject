CoreOS Team Develops Rocket, Breaks with Docker
================================================================================
![](https://farm8.staticflickr.com/7297/12199695124_53d5323167_t.jpg)

[Docker][1] has easily emerged as one of the top open source stories of the year, and has helped many organizations [benefit from container technology][2]. As we’ve reported, even Google is [working closely][3] with it, and Microsoft is as well.

However, the folks behind CoreOS, a very popular Linux flavor for use in cloud deployments, are developing their own container technology, [dubbed Rocket][4], which will actually compete with Docker. Here are the details.

Rocket is a new container runtime, designed for composability, security, and speed, according to the CoreOS team. The group has released a [prototype version on GitHub][5] to begin getting community feedback.

“When Docker was first introduced to us in early 2013, the idea of a “standard container” was striking and immediately attractive: a simple component, a composable unit, that could be used in a variety of systems. The Docker repository [included a manifesto][6] of what a standard container should be. This was a rally cry to the industry, and we quickly followed. We thought Docker would become a simple unit that we can all agree on.”

“Unfortunately, a simple re-usable component is not how things are playing out. Docker now is building tools for launching cloud servers, systems for clustering, and a wide range of functions: building images, running images, uploading, downloading, and eventually even overlay networking, all compiled into one monolithic binary running primarily as root on your server. The standard container manifesto [was removed][7]. We should stop talking about Docker containers, and start talking about the Docker Platform.”

“We still believe in the original premise of containers that Docker introduced, so we are doing something about it. Rocket is a command line tool, rkt, for running App Containers. An ‘App Container’ is the specification of an image format, container runtime, and a discovery mechanism.”

There is a specification coming for App Container Images (ACI). Anyone can [Read about and contribute to the ACI draft][8].

The Register also [notes this interesting aspect][9] of Rocket:

“Significantly, all of CoreOS's tools for working with App Container will be integrated, yet independent from one another. Rocket can run as a standalone tool on any flavor of Linux, not just CoreOS.”

In a [blog post][10], Docker CEO Ben Golub voiced disagreement with CoreOS's move, and he writes:

“There are technical or philosophical differences, which appears to be the case with the recent announcement regarding Rocket. We hope to address some of the technical arguments posed by the Rocket project in a subsequent post.”

It sounds like a standards skirmish is going to come of all this, but, as is often the case with standards confrontations, users may benefit from the competition. 

--------------------------------------------------------------------------------

via: http://ostatic.com/blog/coreos-team-develops-rocket-breaks-with-docker

作者：[Sam Dean][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ostatic.com/member/samdean
[1]:https://www.docker.com/
[2]:http://ostatic.com/blog/linux-containers-with-docker
[3]:http://ostatic.com/blog/google-sets-sights-squarely-on-docker-with-new-container-engine
[4]:https://coreos.com/blog/rocket/
[5]:https://github.com/coreos/rocket
[6]:https://github.com/docker/docker/commit/0db56e6c519b19ec16c6fbd12e3cee7dfa6018c5
[7]:https://github.com/docker/docker/commit/eed00a4afd1e8e8e35f8ca640c94d9c9e9babaf7
[8]:https://github.com/coreos/rocket/blob/master/app-container/SPEC.md#app-container-image
[9]:http://www.theregister.co.uk/2014/12/01/coreos_rocket_announcement/
[10]:http://blog.docker.com/2014/12/initial-thoughts-on-the-rocket-announcement/