Simple Load Balancing with DNS on Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/american-robin-920.jpg?itok=_B_RRbfj)
When you have server back ends built of multiple servers, such as clustered or mirrowed web or file servers, a load balancer provides a single point of entry. Large busy shops spend big money on high-end load balancers that perform a wide range of tasks: proxy, caching, health checks, SSL processing, configurable prioritization, traffic shaping, and lots more.

But you don't want all that. You need a simple method for distributing workloads across all of your servers and providing a bit of failover and don't care whether it is perfectly efficient. DNS round-robin and subdomain delegation with round-robin provide two simple methods to achieve this.

DNS round-robin is mapping multiple servers to the same hostname, so that when users visit foo.example.com multiple servers are available to handle their requests.

Subdomain delegation with round-robin is useful when you have multiple subdomains or when your servers are geographically dispersed. You have a primary nameserver, and then your subdomains have their own nameservers. Your primary nameserver refers all subdomain requests to their own nameservers. This usually improves response times, as the DNS protocol will automatically look for the fastest links.

### Round-Robin DNS

Round-robin has nothing to do with robins. According to my favorite librarian, it was originally a French phrase, _ruban rond_ , or round ribbon. Way back in olden times, French government officials signed grievance petitions in non-hierarchical circular, wavy, or spoke patterns to conceal whoever originated the petition.

Round-robin DNS is also non-hierarchical, a simple configuration that takes a list of servers and sends requests to each server in turn. It does not perform true load-balancing as it does not measure loads, and does no health checks, so if one of the servers is down, requests are still sent to that server. Its virtue lies in simplicity. If you have a little cluster of file or web servers and want to spread the load between them in the simplest way, then round-robin DNS is for you.

All you do is create multiple A or AAAA records, mapping multiple servers to a single host name. This BIND example uses both IPv4 and IPv6 private address classes:
```
fileserv.example.com. IN A 172.16.10.10
fileserv.example.com. IN A 172.16.10.11
fileserv.example.com. IN A 172.16.10.12

fileserv.example.com. IN AAAA fd02:faea:f561:8fa0:1::10
fileserv.example.com. IN AAAA fd02:faea:f561:8fa0:1::11
fileserv.example.com. IN AAAA fd02:faea:f561:8fa0:1::12

```

Dnsmasq uses _/etc/hosts_ for A and AAAA records:
```
172.16.1.10 fileserv fileserv.example.com
172.16.1.11 fileserv fileserv.example.com
172.16.1.12 fileserv fileserv.example.com
fd02:faea:f561:8fa0:1::10 fileserv fileserv.example.com
fd02:faea:f561:8fa0:1::11 fileserv fileserv.example.com
fd02:faea:f561:8fa0:1::12 fileserv fileserv.example.com

```

Note that these examples are simplified, and there are multiple ways to resolve fully-qualified domain names, so please study up on configuring DNS.

Use the `dig` command to check your work. Replace `ns.example.com` with your name server:
```
$ dig @ns.example.com fileserv A fileserv AAA

```

That should display both IPv4 and IPv6 round-robin records.

### Subdomain Delegation and Round-Robin

Subdomain delegation combined with round-robin is more work to set up, but it has some advantages. Use this when you have multiple subdomains or geographically-dispersed servers. Response times are often quicker, and a down server will not respond, so clients will not get hung up waiting for a reply. A short TTL, such as 60 seconds, helps this.

This approach requires multiple name servers. In the simplest scenario, you have a primary name server and two subdomains, each with its own name server. Configure your round-robin entries on the subdomain servers, then configure the delegations on your primary server.

In BIND on your primary name server, you'll need at least two additional configurations, a zone statement, and A/AAAA records in your zone data file. The delegation looks something like this on your primary name server:
```
ns1.sub.example.com. IN A 172.16.1.20
ns1.sub.example.com. IN AAAA fd02:faea:f561:8fa0:1::20
ns2.sub.example.com. IN A 172.16.1.21
ns2.sub.example.com. IN AAA fd02:faea:f561:8fa0:1::21

sub.example.com. IN NS ns1.sub.example.com.
sub.example.com. IN NS ns2.sub.example.com.

```

Then each of the subdomain servers have their own zone files. The trick here is for each server to return its own IP address. The zone statement in `named.conf` is the same on both servers:
```
zone "sub.example.com" {
 type master;
 file "db.sub.example.com";
};

```

Then the data files are the same, except that the A/AAAA records use the server's own IP address. The SOA (start of authority) refers to the primary name server:
```
; first subdomain name server
$ORIGIN sub.example.com.
$TTL 60
sub.example.com IN SOA ns1.example.com. admin.example.com. (
 2018123456 ; serial
 3H ; refresh
 15 ; retry
 3600000 ; expire
)

sub.example.com. IN NS ns1.sub.example.com.
sub.example.com. IN A 172.16.1.20
ns1.sub.example.com. IN AAAA fd02:faea:f561:8fa0:1::20

; second subdomain name server
$ORIGIN sub.example.com.
$TTL 60
sub.example.com IN SOA ns1.example.com. admin.example.com. (
 2018234567 ; serial
 3H ; refresh
 15 ; retry
 3600000 ; expire
)

sub.example.com. IN NS ns1.sub.example.com.
sub.example.com. IN A 172.16.1.21
ns2.sub.example.com. IN AAAA fd02:faea:f561:8fa0:1::21

```

Next, make your round-robin entries on the subdomain name servers, and you're done. Now you have multiple name servers handling requests for your subdomains. Again, BIND is complex and has multiple ways to do the same thing, so your homework is to ensure that your configuration fits with the way you use it.

Subdomain delegations are easier in Dnsmasq. On your primary server, add lines like this in `dnsmasq.conf` to point to the name servers for the subdomains:
```
server=/sub.example.com/172.16.1.20
server=/sub.example.com/172.16.1.21
server=/sub.example.com/fd02:faea:f561:8fa0:1::20
server=/sub.example.com/fd02:faea:f561:8fa0:1::21

```

Then configure round-robin on the subdomain name servers in `/etc/hosts`.

For way more details and help, refer to these resources:

Learn more about Linux through the free ["Introduction to Linux" ][1]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/3/simple-load-balancing-dns-linux

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
