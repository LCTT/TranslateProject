CoreOS breaks with Docker
================================================================================
> Summary: CoreOS, a new enterprise Linux company and a Docker partner, is now proposing its own alternative to Docker's container technology.

[Docker][1] exploded out of nowhere in 2014 to make container technology white hot in cloud and datacenter technical circles. Even [Microsoft joined its open-source virtualization revolution][2]. Now, however, early Docker supporter [CoreOS][3], a new large-scale Linux distributor vendor, is turning its back on it and developing its own container technology: [Rocket][4].

![](http://cdn-static.zdnet.com/i/r/story/70/00/036331/coreos-200x77.jpg?hash=MTAvMJZ3MJ&upscale=1)

While [CoreOS][5] is relatively unknown outside of Linux circles and Silicon Valley, it's seen by those in the know as an up and coming Linux distribution for datacenters and clouds. It's not an insignificant company crying foul, because [Docker's take on virtualization has proven to be so popular][6]. Indeed, CoreOS currently requires Docker to work well, and Brandon Philips, CoreOS' co-founder and CTO, has been a top Docker contributor and was serving on the Docker governance board.

So, why is CoreOS breaking with Docker? First, because "We believe strongly in the Unix philosophy: Tools should be independently useful, but have clean integration points." However, it also said that "Docker now is building tools for launching cloud servers, systems for clustering, and a wide range of functions: Building images, running images, uploading, downloading, and eventually even overlay networking, all compiled into one monolithic binary running primarily as root on your server."

In short, instead of Docker being a Unix-style, simple reusable component, CoreOS sees Docker becoming a platform. And CoreOS has no interest in that.

Instead, with Rocket, they propose going back to the [original Docker proposal][7] for what a container should be.

CoreOS spells out that Rocket will be:

- **Composable**: All tools for downloading, installing, and running containers should be well integrated, but independent and composable.
- **Secure**: Isolation should be pluggable, and the crypto primitives for strong trust, image auditing, and application identity should exist from day one.
- **Image distribution**: Discovery of container images should be simple and facilitate a federated namespace and distributed retrieval. This opens the possibility of alternative protocols, such as BitTorrent, and deployments to private environments without the requirement of a registry.
- **Open**: The format and runtime should be well specified and developed by a community. We want independent implementations of tools to be able to run the same container consistently.

To do this, CoreOS is not forking Docker. Alex Polvi, CoreOS' CEO, wrote, "From a security and composability perspective, the Docker process model — where everything runs through a central daemon — is fundamentally flawed. To 'fix' Docker would essentially mean a rewrite of the project, while inheriting all the baggage of the existing implementation."

CoreOS already has an [alpha version of Rocket on GitHub][8], but it's still open to other ideas on how to build a Docker alternative. At the same time, however, CoreOS states that it won't be leaving Docker behind. "We will continue to make sure CoreOS is the best place to run Docker ... [and] expect Docker to continue to be fully integrated with CoreOS as it is today."

While I can understand CoreOS' concerns, I find it hard to imagine that its attempt to come up with a successful alternative to Docker will come to anything. Docker certainly isn't perfect, but in a matter of mere months, it gathered support from almost everyone in the enterprise operating system business. The only way I can see CoreOS' Rocket launching successfully will be if Docker falls flat on its face, and I just don't see that happening.

--------------------------------------------------------------------------------

via: http://www.zdnet.com/coreos-breaks-with-docker-7000036331/#ftag=RSS06bb67b

作者：[Steven J. Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[1]:https://www.docker.com/
[2]:http://www.zdnet.com/docker-container-support-coming-to-microsofts-next-windows-server-release-7000034708
[3]:https://coreos.com/
[4]:https://coreos.com/blog/rocket
[5]:http://www.zdnet.com/coreos-linux-for-the-cloud-and-the-datacenter-7000031137/
[6]:http://www.zdnet.com/what-is-docker-and-why-is-it-so-darn-popular-7000032269/
[7]:https://github.com/docker/docker/commit/0db56e6c519b19ec16c6fbd12e3cee7dfa6018c5
[8]:https://github.com/coreos/rocket