translating by fw8899
Optimize Web Delivery with these Open Source Tools
================================================================================
Web proxy software forwards HTTP requests without modifying traffic in any way. They can be configured as a transparent proxy with no client-side configuration required. They can also be used as a reverse proxy front-end to websites; here the cache serves an unlimited number of clients for one or some web servers.

Web proxies are versatile tools. They have a wide variety of uses, from caching web, DNS and other lookups, to speeding up the delivery of a web server / reducing bandwidth consumption. Web proxy software can also harden security by filtering traffic and anonymizing connections, and offer media-range limitations. This software is used by high-profile, high-traffic websites such as The New York Times, The Guardian, and social media and content sites such as Twitter, Facebook, and Wikipedia.

Web caches have become a vital mechanism for optimising the amount of data that is delivered in a given period of time. Good web caches also help to minimise latency, serving pages as quickly as possible. This helps to prevent the end user from becoming impatient having to wait for content to be delivered. Web caches optimise the data flow between client and server. They also help to converse bandwidth by caching frequently-delivered content. If you need to reduce server load and improve delivery speed of your content, it is definitely worth exploring the benefits offered by web cache software.

To provide an insight into the quality of software available for Linux, I feature below 5 excellent open source web proxy tools. Some of the them are full-featured; a couple of them have very modest resource needs. 

### Squid ###

Squid is a high-performance open source proxy caching server and web cache daemon. It supports FTP, Internet Gopher, HTTPS, TLS, and SSL. It handles all requests in a single, non-blocking, I/O-driven process over IPv4 or IPv6.

Squid consists of a main server program squid, a Domain Name System lookup program dnsserver, some optional programs for rewriting requests and performing authentication, together with some management and client tools.

Squid offers a rich access control, authorization and logging environment to develop web proxy and content serving applications.

Features include: 

- Web proxy:
    - Caching to reduce access time and bandwidth use
    - Keeps meta data and especially hot objects cached in RAM
    - Caches DNS lookups
    - Supports non-blocking DNS lookups
    - Implements negative chacking of failed requests
- Squid caches can be arranged in a hierarchy or mesh for additional bandwidth savings
- Enforce site-usage policies with extensive access controls
- Anonymize connections, such as disabling or changing specific header fields in a client's HTTP request
- Reverse proxy
- Media-range limitations
- Supports SSL
- Support for IPv6
- Error Page Localization - error pages presented by Squid may now be localized per-request to match the visitors local preferred language
- Connection Pinning (for NTLM Auth Passthrough) - a workaround which permits Web servers to use Microsoft NTLM Authentication instead of HTTP standard authentication through a web proxy
- Quality of Service (QoS) Flow support
    - Select a TOS/Diffserv value to mark local hits
    - Select a TOS/Diffserv value to mark peer hits
    - Selectively mark only sibling or parent requests
    - Allows any HTTP response towards clients to have the TOS value of the response coming from the remote server preserved
    - Mask certain bits in the TOS received from the remote server, before copying the value to the TOS send towards clients
- SSL Bump (for HTTPS Filtering and Adaptation) - Squid-in-the-middle decryption and encryption of CONNECT tunneled SSL traffic, using configurable client- and server-side certificates
- eCAP Adaptation Module support
- ICAP Bypass and Retry enhancements - ICAP is now extended with full bypass and dynamic chain routing to handle multiple adaptation services.
- ICY streaming protocol support - commonly known as SHOUTcast multimedia streams
- Dynamic SSL Certificate Generation
- Support for the Internet Content Adaptation Protocol (ICAP)
- Full request logging
- Anonymize connections

- Website: [www.squid-cache.org][1]
- Developer: National Laboratory for Applied Networking Research (NLANR) and Internet volunteers
- License: GNU GPL v2
- Version Number: 4.0.1

### Privoxy ###

Privoxy (Privacy Enhancing Proxy) is a non-caching Web proxy with advanced filtering capabilities for enhancing privacy, modifying web page data and HTTP headers, controlling access, and removing ads and other obnoxious Internet junk. Privoxy has a flexible configuration and can be customized to suit individual needs and tastes. It supports both stand-alone systems and multi-user networks.

Privoxy uses the concept of actions in order to manipulate the data stream between the browser and remote sites.

Features include: 

- Highly configurable - completely personalize your installation
- Ad blocking
- Cookie management
- Supports "Connection: keep-alive". Outgoing connections can be kept alive independently from the client
- Supports IPv6
- Tagging which allows to change the behaviour based on client and server headers
- Run as an "intercepting" proxy
- Sophisticated actions and filters for manipulating both server and client headers
- Can be chained with other proxies
- Integrated browser-based configuration and control utility. Browser-based tracing of rule and filter effects. Remote toggling
- Web page filtering (text replacements, removes banners based on size, invisible "web-bugs" and HTML annoyances, etc)
- Modularized configuration that allows for standard settings and user settings to reside in separate files, so that installing updated actions files won't overwrite individual user settings
- Support for Perl Compatible Regular Expressions in the configuration files, and a more sophisticated and flexible configuration syntax
- GIF de-animation
- Bypass many click-tracking scripts (avoids script redirection)
- User-customizable HTML templates for most proxy-generated pages (e.g. "blocked" page)
- Auto-detection and re-reading of config file changes
- Most features are controllable on a per-site or per-location basis

- Website: [www.privoxy.org][2]
- Developer: Fabian Keil (lead developer), David Schmidt, and many other contributors
- License: GNU GPL v2
- Version Number: 3.4.2

### Varnish Cache ###

Varnish Cache is a web accelerator written with performance and flexibility in mind. It's modern architecture offers significantly better performance. It typically speeds up delivery with a factor of 300 - 1000x, depending on your architecture. Varnish stores web pages in memory so the web servers do not have to create the same web page repeatedly. The web server only recreates a page when it is changed. When content is served from memory this happens a lot faster then anything.

Additionally Varnish can serve web pages much faster then any application server is capable of - giving the website a significant speed enhancement.

For a cost-effective configuration, Varnish Cache uses between 1-16GB and a SSD disk.

Features include: 

- Modern design
- VCL - a very flexible configuration language. The VCL configuration is translated to C, compiled, loaded and executed giving flexibility and speed
- Load balancing using both a round-robin and a random director, both with a per-backend weighting
- DNS, Random, Hashing and Client IP based Directors
- Load balance between multiple backends
- Support for Edge Side Includes including stitching together compressed ESI fragments
- Heavily threaded
- URL rewriting
- Cache multiple vhosts with a single Varnish
- Log data is stored in shared memory
- Basic health-checking of backends
- Graceful handling of "dead" backends
- Administered by a command line interface
- Use In-line C to extend Varnish
- Can be used on the same system as Apache
- Run multiple Varnish on the same system
- Support for HAProxy's PROXY protocol. This is a protocol adds a small header on each incoming TCP connection that describes who the real client is, added by (for example) an SSL terminating process
- Warm and cold VCL states
- Plugin support with Varnish Modules, called VMODs
- Backends defined through VMODs
- Gzip Compression and Decompression
- HTTP Streaming Pass & Fetch
- Saint and Grace mode. Saint Mode allows for unhealthy backends to be blacklisted for a period of time, preventing them from serving traffic when using Varnish as a load balancer. Grace mode allows Varnish to serve an expired version of a page or other asset in cases where Varnish is unable to retrieve a healthy response from the backend
- Experimental support for Persistent Storage, without LRU eviction

- Website: [www.varnish-cache.org][3]
- Developer: Varnish Software
- License: FreeBSD
- Version Number: 4.1.0

### Polipo ###

Polipo is an open source caching HTTP proxy which has modest resource needs.

It listens to requests for web pages from your browser and forwards them to web servers, and forwards the servers’ replies to your browser. In the process, it optimises and cleans up the network traffic. It is similar in spirit to WWWOFFLE, but the implementation techniques are more like the ones ones used by Squid.

Polipo aims at being a compliant HTTP/1.1 proxy. It should work with any web site that complies with either HTTP/1.1 or the older HTTP/1.0.

Features include: 

- HTTP 1.1, IPv4 & IPv6, traffic filtering and privacy-enhancement
- Uses HTTP/1.1 pipelining if it believes that the remote server supports it, whether the incoming requests are pipelined or come in simultaneously on multiple connections
- Cache the initial segment of an instance if the download has been interrupted, and, if necessary, complete it later using Range requests
- Upgrade client requests to HTTP/1.1 even if they come in as HTTP/1.0, and up- or downgrade server replies to the client's capabilities
- Complete support for IPv6 (except for scoped (link-local) addresses)
- Use as a bridge between the IPv4 and IPv6 Internets
- Content-filtering
- Can use a technique known as Poor Man's Multiplexing to reduce latency
- SOCKS 4 and SOCKS 5 protocol support
- HTTPS proxying
- Behaves as a transparent proxy
- Run Polipo together with Privoxy or tor

- Website: [www.pps.univ-paris-diderot.fr/~jch/software/polipo/][4]
- Developer: Juliusz Chroboczek, Christopher Davis
- License: MIT License
- Version Number: 1.1.1

### Tinyproxy ###

Tinyproxy is a lightweight open source web proxy daemon. It is designed to be fast and yet small. It is useful for cases such as embedded deployments where a full featured HTTP proxy is required, but the system resources for a larger proxy are unavailable.

Tinyproxy is very useful in a small network setting, where a larger proxy would either be too resource intensive, or a security risk. One of the key features of Tinyproxy is the buffering connection concept. In effect, Tinyproxy will buffer a high speed response from a server, and then relay it to a client at the highest speed the client will accept. This feature greatly reduces the problems with sluggishness on the net.

Features:

- Easy to modify
- Anonymous mode - allows specification of individual HTTP headers that should be allowed through, and which should be blocked
- HTTPS support - Tinyproxy allows forwarding of HTTPS connections without modifying traffic in any way through the CONNECT method
- Remote monitoring - access proxy statistics from afar, letting you know exactly how busy the proxy is
- Load average monitoring - configure software to refuse connections after the server load reaches a certain point
- Access control - configure to only allow connections from certain subnets or IP addresses
- Secure - run without any special privileges, thus minimizing the chance of system compromise
- URL based filtering - allows domain and URL-based black- and whitelisting
- Transparent proxying - configure as a transparent proxy, so that a proxy can be used without any client-side configuration
- Proxy chaining - use an upstream proxy server for outbound connections, instead of direct connections to the target server, creating a so-called proxy chain
- Privacy features - restrict both what data comes to your web browser from the HTTP server (e.g., cookies), and to restrict what data is allowed through from your web browser to the HTTP server (e.g., version information)
- Small footprint - the memory footprint is about 2MB with glibc, and the CPU load increases linearly with the number of simultaneous connections (depending on the speed of the connection). Tinyproxy can be run on an old machine without affecting performance

- Website: [banu.com/tinyproxy][5]
- Developer: Robert James Kaes and contributors
- License: GNU GPL v2
- Version Number: 1.8.3

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20151101020309690/WebDelivery.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.squid-cache.org/
[2]:http://www.privoxy.org/
[3]:https://www.varnish-cache.org/
[4]:http://www.pps.univ-paris-diderot.fr/%7Ejch/software/polipo/
[5]:https://banu.com/tinyproxy/
