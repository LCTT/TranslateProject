Splicing the Cloud Native Stack, One Floor at a Time
======
At Packet, our value (automated infrastructure) is super fundamental. As such, we spend an enormous amount of time looking up at the players and trends in all the ecosystems above us - as well as the very few below!

It’s easy to get confused, or simply lose track, when swimming deep in the oceans of any ecosystem. I know this for a fact because when I started at Packet last year, my English degree from Bryn Mawr didn’t quite come with a Kubernetes certification. :)

Due to its super fast evolution and massive impact, the cloud native ecosystem defies precedent. It seems that every time you blink, entirely new technologies (not to mention all of the associated logos) have become relevant...or at least interesting. Like many others, I’ve relied on the CNCF’s ubiquitous “[Cloud Native Landscape][1]” as a touchstone as I got to know the space. However, if there is one element that defines ecosystems, it is the people that contribute to and steer them.

That’s why, when we were walking back to the office one cold December afternoon, we hit upon a creative way to explain “cloud native” to an investor, whose eyes were obviously glazing over as we talked about the nuances that distinguished Cilium from Aporeto, and why everything from CoreDNS and Spiffe to Digital Rebar and Fission were interesting in their own right.

Looking up at our narrow 13 story office building in the shadow of the new World Trade Center, we hit on an idea that took us down an artistic rabbit hole: why not draw it?

![][2]

And thus began our journey to splice the Cloud Native Stack, one floor at a time. Let’s walk through it together and we can give you the “guaranteed to be outdated tomorrow” down low.

[[View a High Resolution JPG][3]] or email us to request a copy.

### Starting at the Very Bottom

As we started to put pen to paper, we knew we wanted to shine a light on parts of the stack that we interact with on a daily basis, but that is largely invisible to users further up: hardware. And like any good secret lab investing in the next great (usually proprietary) thing, we thought the basement was the perfect spot.

From the well established giants of the space like Intel, AMD and Huawei (rumor has it they employ nearly 80,000 engineers!), to more niche players like Mellanox, the hardware ecosystem is on fire. In fact, we may be entering a Golden Age of hardware, as billions of dollars are poured into upstarts hacking on new offloads, GPU’s, custom co-processors.

The famous software trailblazer Alan Kay said over 25 years ago: “People who are really serious about software should make their own hardware.” Good call Alan!

### The Cloud is About Capital

As our CEO Zac Smith has told me many times: it’s all about the money. And not just about making it, but spending it! In the cloud, it takes billions of dollars of capital to make computers show up in data centers so that developers can consume them with software. In other words:


![][4]

We thought the best place for “The Bank” (e.g. the lenders and investors that make this cloud fly) was the ground floor. So we transformed our lobby into the Banker’s Cafe, complete with a wheel of fortune for all of us out there playing the startup game.

![][5]

### The Ping and Power

If the money is the grease, then the engine that consumes much of the fuel is the datacenter providers and the networks that connect them. We call them “power” and “ping”.

From top of mind names like Equinix and edge upstarts like Vapor.io, to the “pipes” that Verizon, Crown Castle and others literally put in the ground (or on the ocean floor), this is a part of the stack that we all rely upon but rarely see in person.

Since we spend a lot of time looking at datacenters and connectivity, one thing to note is that this space is changing quite rapidly, especially as 5G arrives in earnest and certain workloads start to depend on less centralized infrastructure.

The edge is coming y’all! :-)

![][6]

### Hey, It's Infrastructure!

Sitting on top of “ping” and “power” is the floor we lovingly call “processors”. This is where our magic happens - we turn the innovation and physical investments from down below into something at the end of an API.

Since this is a NYC building, we kept the cloud providers here fairly NYC centric. That’s why you see Sammy the Shark (of Digital Ocean lineage) and a nod to Google over in the “meet me” room.

As you’ll see, this scene is pretty physical. Racking and stacking, as it were. While we love our facilities manager in EWR1 (Michael Pedrazzini), we are working hard to remove as much of this manual labor as possible. PhD’s in cabling are hard to come by, after all.

![][7]

### Provisioning

One floor up, layered on top of infrastructure, is provisioning. This is one of our favorite spots, which years ago we might have called “config management.” But now it’s all about immutable infrastructure and automation from the start: Terraform, Ansible, Quay.io and the like. You can tell that software is working its way down the stack, eh?

Kelsey Hightower noted recently “it’s an exciting time to be in boring infrastructure.” I don’t think he meant the physical part (although we think it’s pretty dope), but as software continues to hack on all layers of the stack, you can guarantee a wild ride.

![][8]

### Operating Systems

With provisioning in place, we move to the operating system layer. This is where we get to start poking fun at some of our favorite folks as well: note Brian Redbeard’s above average yoga pose. :)

Packet offers eleven major operating systems for our clients to choose from, including some that you see in this illustration: Ubuntu, CoreOS, FreeBSD, Suse, and various Red Hat offerings. More and more, we see folks putting their opinion on this layer: from custom kernels and golden images of their favorite distros for immutable deploys, to projects like NixOS and LinuxKit.

![][9]

### Run Time

We had to have fun with this, so we placed the runtime in the gym, with a championship match between CoreOS-sponsored rkt and Docker’s containerd. Either way the CNCF wins!

We felt the fast-evolving storage ecosystem deserved some lockers. What’s fun about the storage aspect is the number of new players trying to conquer the challenging issue of persistence, as well as performance and flexibility. As they say: storage is just plain hard.

![][10]

### Orchestration

The orchestration layer has been all about Kubernetes this past year, so we took one of its most famous evangelists (Kelsey Hightower) and featured him in this rather odd meetup scene. We have some major Nomad fans on our team, and there is just no way to consider the cloud native space without the impact of Docker and its toolset.

While workload orchestration applications are fairly high up our stack, we see all kinds of evidence for these powerful tools are starting to look way down the stack to help users take advantage of GPU’s and other specialty hardware. Stay tuned - we’re in the early days of the container revolution!

![][11]

### Platforms

This is one of our favorite layers of the stack, because there is so much craft in how each platform helps users accomplish what they really want to do (which, by the way, isn’t run containers but run applications!). From Rancher and Kontena, to Tectonic and Redshift to totally different approaches like Cycle.io and Flynn.io - we’re always thrilled to see how each of these projects servers users differently.

The main takeaway: these platforms are helping to translate all of the various, fast-moving parts of the cloud native ecosystem to users. It’s great watching what they each come up with!

![][12]

### Security

When it comes to security, it’s been a busy year! We tried to represent some of the more famous attacks and illustrate how various tools are trying to help protect us as workloads become highly distributed and portable (while at the same time, attackers become ever more resourceful).

We see a strong movement towards trustless environments (see Aporeto) and low level security (Cilium), as well as tried and true approaches at the network level like Tigera. No matter your approach, it’s good to remember: This is definitely not fine. :0

![][13]

### Apps

How to represent the huge, vast, limitless ecosystem of applications? In this case, it was easy: stay close to NYC and pick our favorites. ;) From the Postgres “elephant in the room” and the Timescale clock, to the sneaky ScyllaDB trash and the chillin’ Travis dude - we had fun putting this slice together.

One thing that surprised us: how few people noticed the guy taking a photocopy of his rear end. I guess it’s just not that common to have a photocopy machine anymore?!?

![][14]

### Observability

As our workloads start moving all over the place, and the scale gets gigantic, there is nothing quite as comforting as a really good Grafana dashboard, or that handy Datadog agent. As complexity increases, the “SRE” generation are starting to rely ever more on alerting and other intelligence events to help us make sense of what’s going on, and work towards increasingly self-healing infrastructure and applications.

It will be interesting to see what kind of logos make their way into this floor over the coming months and years...maybe some AI, blockchain, ML powered dashboards? :-)

![][15]

### Traffic Management

People tend to think that the internet “just works” but in reality, we’re kind of surprised it works at all. I mean, a loose connection of disparate networks at massive scale - you have to be joking!?

One reason it all sticks together is traffic management, DNS and the like. More and more, these players are helping to make the interest both faster and safer, as well as more resilient. We’re especially excited to see upstarts like Fly.io and NS1 competing against well established players, and watching the entire ecosystem improve as a result. Keep rockin’ it y’all!

![][16]

### Users

What good is a technology stack if you don’t have fantastic users? Granted, they sit on top of a massive stack of innovation, but in the cloud native world they do more than just consume: they create and contribute. From massive contributions like Kubernetes to more incremental (but equally important) aspects, what we’re all a part of is really quite special.

Many of the users lounging on our rooftop deck, like Ticketmaster and the New York Times, are not mere upstarts: these are organizations that have embraced a new way of deploying and managing their applications, and their own users are reaping the rewards.

![][17]

### Last but not Least, the Adult Supervision!

In previous ecosystems, foundations have played a more passive “behind the scenes” role. Not the CNCF! Their goal of building a robust cloud native ecosystem has been supercharged by the incredible popularity of the movement - and they’ve not only caught up but led the way.

From rock solid governance and a thoughtful group of projects, to outreach like the CNCF Landscape, CNCF Cross Cloud CI, Kubernetes Certification, and Speakers Bureau - the CNCF is way more than “just” the ever popular KubeCon + CloudNativeCon.

--------------------------------------------------------------------------------

via: https://www.packet.net/blog/splicing-the-cloud-native-stack/

作者：[Zoe Allen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.packet.net/about/zoe-allen/
[1]:https://landscape.cncf.io/landscape=cloud
[2]:https://assets.packet.net/media/images/PIFg-30.vesey.street.ny.jpg
[3]:https://www.dropbox.com/s/ujxk3mw6qyhmway/Packet_Cloud_Native_Building_Stack.jpg?dl=0
[4]:https://assets.packet.net/media/images/3vVx-there.is.no.cloud.jpg
[5]:https://assets.packet.net/media/images/X0b9-the.bank.jpg
[6]:https://assets.packet.net/media/images/2Etm-ping.and.power.jpg
[7]:https://assets.packet.net/media/images/C800-infrastructure.jpg
[8]:https://assets.packet.net/media/images/0V4O-provisioning.jpg
[9]:https://assets.packet.net/media/images/eMYp-operating.system.jpg
[10]:https://assets.packet.net/media/images/9BII-run.time.jpg
[11]:https://assets.packet.net/media/images/njak-orchestration.jpg
[12]:https://assets.packet.net/media/images/1QUS-platforms.jpg
[13]:https://assets.packet.net/media/images/TeS9-security.jpg
[14]:https://assets.packet.net/media/images/SFgF-apps.jpg
[15]:https://assets.packet.net/media/images/SXoj-observability.jpg
[16]:https://assets.packet.net/media/images/tKhf-traffic.management.jpg
[17]:https://assets.packet.net/media/images/7cpe-users.jpg
