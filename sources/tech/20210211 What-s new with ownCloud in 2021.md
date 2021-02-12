[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What's new with ownCloud in 2021?)
[#]: via: (https://opensource.com/article/21/2/owncloud)
[#]: author: (Martin Loschwitz https://opensource.com/users/martinloschwitzorg)

What's new with ownCloud in 2021?
======
The open source file sharing and syncing platform gets a total overhaul
based on Go and Vue.js and eliminates the need for a database.
![clouds in the sky with blue pattern][1]

The newest version of ownCloud, [ownCloud Infinite Scale][2] (OCIS), is a complete rewrite of the venerable open source enterprise file sharing and syncing software stack. It features a new backend written in Go, a frontend in Vue.js, and many changes, including eliminating the need for a database. This scalable, modular approach replaces ownCloud's PHP, database, and [POSIX][3] filesystem and promises up to 10 times better performance.

Traditionally, ownCloud was centered around the idea of having a POSIX-compatible filesystem to store data uploaded by users—different versions of the data and trash files, as well as configuration files and logs. By default, an ownCloud user's files were found in a path on their ownCloud instance, like `/var/www` or `/srv/www` (a web server's document root).

Every admin who has maintained an ownCloud instance knows that they grow massive; today, they usually start out much larger than ownCloud was originally designed for. One of the largest ownCloud instances is Australia's Academic and Research Network (AARNet), a company that stores more than 100,000 users' data.

### Let's 'Go' for microservices

ownCloud's developers determined that rewriting the codebase with [Go][4] could bring many advantages over PHP. Even when computer programs appear to be one monolithic piece of code, most are split into different components internally. The web servers that are usually deployed with ownCloud (such as Apache) are an excellent example. Internally, one function handles TCP/IP connections, another function might handle SSL, and yet another piece of code executes the requested PHP files and delivers the results to the end user. All of those events must happen in a certain order.

ownCloud's developers wanted the new version to serve multiple steps concurrently so that events can happen simultaneously. Software capable of handling requests in parallel doesn't have to wait around for one process to finish before the next can begin, so they can deliver results faster. Concurrency is one of the reasons Go is so popular in containerized micro-architecture applications.

With OCIS, ownCloud is adapting to an architecture centered around the principle of microservices. OCIS is split into three tiers: storage, core, and frontend. I'll look at each of these tiers, but the only thing that really matters to people is overall performance. Users don't think about software in tiers; they just want the software to work well and work quickly.

### Tier 1: Storage

The storage available to the system is ownCloud's lowest tier. Performance also brings scalability; large ownCloud instances must be able to cope with the load of thousands of clients and add additional disk space if the existing storage fills up.

Like so many other concepts today, object stores and scalable storage weren't available when ownCloud was designed. Administrators now are used to having more choices, so ownCloud permits outsourcing physical storage device handling to an external solution. While S3-based object storage, Samba-based storage, and POSIX-compatible filesystem options are still supported in OCIS, the preferred way to deploy it is with [Earth Observing System][5] (EOS) storage.

#### EOS to the rescue

EOS is optimized for very low latency when accessing files. It provides disk-based storage to clients through the [XRootD][6] framework but also permits other protocols to access files. ownCloud uses EOS's HTTP protocol extension to talk to the storage solution (using the HTTPS protocol). EOS also allows almost "infinite" scalability. For instance, [CERN's EOS setup][7] includes more than 200PB of disk storage and continues to grow.

By choosing EOS, ownCloud eliminated several shortcomings of traditional storage solutions:

  * EOS doesn't have a typical single point of failure.
  * All relevant services are run redundantly, including the ability to scale out and add instances of all existing services.
  * EOS promises to never run out of actual disk space and comes with built-in redundancy for stored data.



For large environments, ownCloud expects the administrator to deploy an EOS instance with OCIS. In exchange for the burden of maintaining a separate storage system, the admin gets the benefit of not having to worry about the OCIS instance's scalability and performance.

#### What about small setups?

This hints at ownCloud's assumed use case for OCIS: It's no longer a small business all-in-one server nor a small home server. ownCloud's strategy with OCIS targets large data centers. For small or home office setups, EOS is likely to be excessive and overly demanding for a single admin to manage. OCIS serves small setups through the [Reva][8] framework, which enables support for S3, Samba, and even POSIX-compatible filesystems. This is possible because EOS is not hardcoded into OCIS. Reva can't provide the same feature set as EOS, but it accomplishes most of the needs of end users and small installations.

### Tier 2: Core

OCIS's second tier is (due to Go) more of a collection of microservices than a singular core. Each one is responsible for handling a single task in the background (e.g., scanning for viruses). Basically, all of OCIS's functionality results from a specific microservice's work, like authenticating requests using OpenID Connect against an identity provider. In the end, that makes it a simple task to connect existing user directories—such as Active Directory Federation Services (ADFS), Azure AD, or Lightweight Directory Access Protocol (LDAP)—to ownCloud. For those that do not have an existing identity provider, ownCloud ships its own instance, effectively making ownCloud maintain its own user database.

### Tier 3: Frontend

OCIS's third tier, the frontend, is what the vendor calls ownCloud Web. It's a complete rewrite of the user interface and is based on the Vue.js JavaScript framework. Like the OCIS core, the web frontend is written based on microservices principles and hence allows better performance and scalability. The developers also used the opportunity to give the web interface a makeover; compared to previous ownCloud versions, the OCIS web interface looks smaller and slicker.

OCIS's developers did an impressive job complying with modern software design principles. The fundamental problem in building applications according to the microservices approach is making the environment's individual components communicate with each other. APIs can come to the rescue, but that means every micro component must have its own well-defined API interface.

Luckily, there are existing tools to take that burden off developers' shoulders, most notably [gRPC][9]. The idea behind gRPC is to have a set of predefined APIs that trigger actions in one component from within another.

### Other notable design changes

#### Tackling network traffic with Traefik

This new application design brings some challenges to the underlying network. OCIS's developers chose the [Traefik][10] framework to tackle them. Traefik automatically load-balances different instances of microservices, manages automated SSL encryption, and allows additional deployments of firewall rules.

The split between the backend and the frontend add advantages to OCIS. In fact, the user's actions triggered through ownCloud Web are completely decoupled from the ownCloud engine performing the task in the backend. If a user manually starts a virus check on files stored in ownCloud, they don't have to wait for the check to finish. Instead, the check happens in the background, and the user sees the results after the check is completed. This is the principle of concurrency at work.

#### Extensions as microservices

Like other web services, ownCloud supports extending its capabilities through extensions. OCIS doesn't change this, but it promises to tackle a well-known problem, especially with community apps. Apps of unknown origin can cause trouble in the server, hamper updates, and negatively impact the server's overall performance.

OCIS's new, gRPC-based architecture makes it much easier to create extensions alongside existing microservices. Because the API is predefined by gRPC, developers merely need to create a microservice featuring the desired functionality that can be controlled by gRPC. Traefik, on a per-case basis, ensures that newly deployed add-ons are automatically added to the existing communication mesh.

#### Goodbye, MySQL!

ownCloud's switch to gRPC and microservices eliminates the need for a relational database. Instead, components that need to store metadata do it on their own. Due to Reva and the lack of a MySQL dependency, the complexity of running ownCloud in small environments is reduced considerably—an especially welcome bonus for maintainers of large-scale data centers, but nice for admins of any size installation.

### Getting OCIS up and running

ownCloud published a technical preview of OCIS 1.0 in December 2020, [shipping it][11] as a Docker container and binaries. More examples of getting it running are linked in the deployment section of its [GitHub repository][12].

#### Install with Docker

Getting OCIS up and running with Docker containers is easy, although things can get complicated if you're new to EOS. Docker images for OCIS are available on [Docker Hub][13]. Look for the Latest tag for the current master branch.

Any standard virtual machine from one of the big cloud providers or any entry-level server in a data center that uses a standard Linux distribution should be sufficient, provided the system has a container runtime installed.

Assuming you have Docker or Podman installed, the command to start OCIS is simple:


```
`$ docker run --rm -ti -p 9200:9200 owncloud/ocis`
```

That's it! OCIS is now waiting at your service on localhost port 9200. Open a web browser and navigate to `http://localhost:9200` to check it out.

The demo accounts and passwords are `einstein:relativity`, `marie:radioactivity`, and `richard:superfluidity`. Admin accounts are `moss:vista` and `admin:admin`. If OCIS runs on a server with a resolvable hostname, it can request an SSL certificate from Let's Encrypt using Traefik.

![OCIS contains no files at first login][14]

(Martin Loschwitz, [CC BY-SA 4.0][15])

![OCIS user management interface][16]

(Martin Loschwitz, [CC BY-SA 4.0][15])

#### Install with binary

As an alternative to Docker, there also is a pre-compiled binary available. Thanks to Go, users can [download the latest binaries][17] from the Master branch.

OCIS's binary edition expects `/var/tmp/ocis` as the default storage location, but you can change that in its configuration. You can start the OCIS server with:


```
`$ ./ocis server`
```

Here are some of the subcommands available through the `ocis` binary:

  * `ocis health` runs a health check. A result greater than 0 indicates an error.
  * `ocis list` prints all running OCIS extensions.
  * `ocis run foo` starts a particular extension (`foo`, in this example).
  * `ocis kill foo` stops a particular extension (`foo`, in this example).
  * `ocis --help` prints a help message.



The project's GitHub repository contains full [documentation][11].

### Setting up EOS (it's complicated)

Following ownCloud's recommendations to deploy OCIS with EOS for large environments requires some additional steps. EOS not only adds required hardware and increases the whole environment's complexity, but it's also a slightly bigger task to set it up. CERN provides concise [EOS documentation][18] (linked from its [GitHub repository][19]), and ownCloud offers a [step-by-step guide][20].

In a nutshell, users have to get and start EOS and OCIS containers; configure LDAP support; and kill home, users', and metadata storage before starting them with the EOS configuration. Last but not least, the accounts service needs to be set up to work with EOS. All of these steps are "docker-compose" commands documented in the GitHub repository. The Storage Backends page on EOS also provides information on verification, troubleshooting, and a command reference for the built-in EOS shell.

### Weighing risks and rewards

ownCloud Infinite Scale is easy to install, faster than ever before, and better prepared for scalability. The modular design, with microservices and APIs (even for its extensions), looks promising. ownCloud is embracing new technology and developing for the future. If you run ownCloud, or if you've been thinking of trying it, there's never been a better time. Keep in mind that this is still a technology preview and is on a rolling release published every three weeks, so please report any bugs you find.

Jos Poortvliet shares some of his favorite uses for the open source self-hosted storage platform.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/owncloud

作者：[Martin Loschwitz][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/martinloschwitzorg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_cloud_cc.png?itok=XSV7yR9e (clouds in the sky with blue pattern)
[2]: https://owncloud.com/infinite-scale/
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://golang.org/
[5]: https://en.wikipedia.org/wiki/Earth_Observing_System
[6]: https://xrootd.slac.stanford.edu/
[7]: https://eos-web.web.cern.ch/eos-web/
[8]: https://reva.link/
[9]: https://en.wikipedia.org/wiki/GRPC
[10]: https://opensource.com/article/20/3/kubernetes-traefik
[11]: https://owncloud.github.io/ocis/getting-started/
[12]: https://github.com/owncloud/ocis
[13]: https://hub.docker.com/r/owncloud/ocis
[14]: https://opensource.com/sites/default/files/uploads/ocis5.png (OCIS contains no files at first login)
[15]: https://creativecommons.org/licenses/by-sa/4.0/
[16]: https://opensource.com/sites/default/files/uploads/ocis2.png (OCIS user management interface)
[17]: https://download.owncloud.com/ocis/ocis/
[18]: https://eos-docs.web.cern.ch/
[19]: https://github.com/cern-eos/eos
[20]: https://owncloud.github.io/ocis/storage-backends/eos/
