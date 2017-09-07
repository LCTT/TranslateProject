translating---geekpi

[DNS Infrastructure at GitHub][1]
============================================================


At GitHub we recently revamped how we do DNS from the ground up. This included both how we [interact with external DNS providers][4] and how we serve records internally to our hosts. To do this, we had to design and build a new DNS infrastructure that could scale with GitHub’s growth and across many data centers.

Previously GitHub’s DNS infrastructure was fairly simple and straightforward. It included a local, forwarding only DNS cache on every server and a pair of hosts that acted as both caches and authorities used by all these hosts. These hosts were available both on the internal network as well as public internet. We configured zone stubs in the caching daemon to direct queries locally rather than recurse on the internet. We also had NS records set up at our DNS providers that pointed specific internal zones to the public IPs of this pair of hosts for queries external to our network.

This configuration worked for many years but was not without its downsides. Many applications are highly sensitive to resolving DNS queries and any performance or availability issues we ran into would cause queuing and degraded performance at best and customer impacting outages at worst. Configuration and code changes can cause large unexpected changes in query rates. As such scaling beyond these two hosts became an issue. Due to the network configuration of these hosts we would just need to keep adding IPs and hosts which has its own problems. While attempting to fire fight and remediate these issues, the old system made it difficult to identify causes due to a lack of metrics and visibility. In many cases we resorted to `tcpdump` to identify traffic and queries in question. Another issue was running on public DNS servers we run the risk of leaking internal network information. As a result we decided to build something better and began to identify our requirements for the new system.

We set out to design a new DNS infrastructure that would improve the aforementioned operational issues including scaling and visibility, as well as introducing some additional requirements. We wanted to continue to run our public DNS zones via external DNS providers so whatever system we build needed to be vendor agnostic. Additionally, we wanted this system to be capable of serving both our internal and external zones, meaning internal zones were only available on our internal network unless specifically configured otherwise and external zones are resolvable without leaving our internal network. We wanted the new DNS architecture to allow both a [deploy-based workflow for making changes][5] as well as API access to our records for automated changes via our inventory and provisioning systems. The new system could not have any external dependencies; too much relies on DNS functioning for it to get caught in a cascading failure. This includes connectivity to other data centers and DNS services that may reside there. Our old system mixed the use of caches and authorities on the same host; we wanted to move to a tiered design with isolated roles. Lastly, we wanted a system that could support many data center environments whether it be EC2 or bare metal.

### Implementation

![](https://dl.dropboxusercontent.com/s/tx6s7zg896x6kav/2017-05-09%20at%2012.14%20PM.png)

To build this system we identified three classes of hosts: caches, edges, and authorities. Caches serve as recursive resolvers and DNS “routers” caching responses from the edge tier. The edge tier, running a DNS authority daemon, responds to queries from the caching tier for zones it is configured to zone transfer from the authority tier. The authority tier serve as hidden DNS masters as our canonical source for DNS data, servicing zone transfers from the edge hosts as well as providing an HTTP API for creating, modifying or deleting records.

In our new configuration, caches live in each data center meaning application hosts don’t need to traverse a data center boundary to retrieve a record. The caches are configured to map zones to the edge hosts within their region in order to route our internal zones to our own hosts. Any zone that is not explicitly configured will recurse on the internet to resolve an answer.

The edge hosts are regional hosts, living in our network edge PoPs (Point of Presence). Our PoPs have one or more data centers that rely on them for external connectivity, without the PoP the data center can’t get to the internet and the internet can’t get to them. The edges perform zone transfers with all authorities regardless of what region or location they exist in and store those zones locally on their disk.

Our authorities are also regional hosts, only containing zones applicable to the region it is contained in. Our inventory and provisioning systems determine which regional authority a zone lives in and will create and delete records via an HTTP API as servers come and go. OctoDNS maps zones to regional authorities and uses the same API to create static records and to ensure dynamic sources are in sync. We have an additional separate authority for external domains, such as github.com, to allow us to query our external domains during a disruption to connectivity. All records are stored in MySQL.

### Operability

![](https://dl.dropboxusercontent.com/s/jw8bjx8oattik7w/2017-05-09%20at%2011.52%20AM.png)

One huge benefit of moving to a more modern DNS infrastructure is observability. Our old DNS system had little to no metrics and limited logging. A large factor in deciding which DNS servers to use was the breadth and depth of metrics they produce. We finalized on [Unbound][6] for the caches, [NSD][7] for the edge hosts and [PowerDNS][8] for the authorities, all of which have been proven in DNS infrastructures much larger than at GitHub.

When running in our bare metal data centers, caches are accessed via a private [anycast][9] IP resulting in it reaching the nearest available cache host. The caches have been deployed in a rack aware manner that provides some level of balanced load between them and isolation against some power and network failure modes. When a cache host fails, servers that would normally use it for lookups will now automatically be routed to the next closest cache, keeping latency low as well as providing tolerance to some failure modes. Anycast allows us to scale the number of caches behind a single IP address unlike our previous configuration, giving us the ability to run as many caching hosts as DNS demand requires.

Edge hosts perform zone transfers with the authority tier, regardless of region or location. Our zones are not large enough that keeping a copy of all of them in every region is a problem. This means for every zone, all caches will have access to a local edge server with a local copy of all zones even when a region is offline or upstream providers are having connectivity issues. This change alone has proven to be quite resilient in the face of connectivity issues and has helped keep GitHub available during failures that not long ago would have caused customer facing outages.

These zone transfers include both our internal and external zones from their respective authorities. As you might guess zones like github.com are external and zones like github.net are generally internal. The difference between them is only the types of use and data stored in them. Knowing which zones are internal and external gives us some flexibility in our configuration.

```
$ dig +short github.com
192.30.253.112
192.30.253.113

```

Public zones are [sync’d][10] to external DNS providers and are records GitHub users use everyday. Addtionally, public zones are completely resolvable within our network without needing to communicate with our external providers. This means any service that needs to look up `api.github.com` can do so without needing to rely on external network connectivity. We also use the stub-first configuration option of Unbound which gives a lookup a second chance if our internal DNS service is down for some reason by looking it up externally when it fails.

```
$ dig +short time.github.net
10.127.6.10

```

Most of the `github.net` zone is completely private, inaccessible from the internet and only contains [RFC 1918][11] IP addresses. Private zones are split up per region and site. Each region and/or site has a set of sub-zones applicable to that location, sub-zones for management network, service discovery, specific service records and yet to be provisioned hosts that are in our inventory. Private zones also include reverse lookup zones for PTRs.

### Conclusion

Replacing an old system with a new one that is ready to serve millions of customers is never easy. Using a pragmatic, requirements based approach to designing and implementing our new DNS system resulted in a DNS infrastructure that was able to hit the ground running and will hopefully grow with GitHub into the future.

Want to help the GitHub SRE team solve interesting problems like this? We’d love for you to join us. [Apply Here][12]

--------------------------------------------------------------------------------

via: https://githubengineering.com/dns-infrastructure-at-github/

作者：[Joe Williams ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/joewilliams
[1]:https://githubengineering.com/dns-infrastructure-at-github/
[2]:https://github.com/joewilliams
[3]:https://github.com/joewilliams
[4]:https://githubengineering.com/enabling-split-authority-dns-with-octodns/
[5]:https://githubengineering.com/enabling-split-authority-dns-with-octodns/
[6]:https://unbound.net/
[7]:https://www.nlnetlabs.nl/projects/nsd/
[8]:https://powerdns.com/
[9]:https://en.wikipedia.org/wiki/Anycast
[10]:https://githubengineering.com/enabling-split-authority-dns-with-octodns/
[11]:http://www.faqs.org/rfcs/rfc1918.html
[12]:https://boards.greenhouse.io/github/jobs/669805#.WPVqJlPyvUI
