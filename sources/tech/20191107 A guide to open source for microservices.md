[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A guide to open source for microservices)
[#]: via: (https://opensource.com/article/19/11/microservices-cheat-sheet)
[#]: author: (Girish Managoli https://opensource.com/users/gammay)

A guide to open source for microservices
======
Build and manage high-scale microservices networks and solve the
challenges of running services without fault that scale based on
business demand.
![Text editor on a browser, in blue][1]

Microservices—applications broken down into smaller, composable pieces that work together—are getting as much attention as the hottest new restaurant in town. (If you're not yet familiar, dive into [What Are Microservices][2] before continuing here.)

However, if you have moved on from "Hello, World" and running a simple handful of microservices, and are building hundreds of microservices and running thousands of instances, you know there is nothing "micro" about them. You want your instances to increase when users increase and decrease when users decrease. You want to distribute requests effectively between instances. You want to build and run your services intelligently. You need a clear view of the service instances that are running or going down. How can you manage all of this complexity?

This article looks at some of the key terminologies in the microservices ecosystem and some of the open source software available to build out a microservices architecture. The focus is on building and managing high-scale microservices networks and solving the challenges of running services without fault and that scale correctly based on business demand.

Here is a wholesome, lavish spread of open source cuisine that is sure to be gastronomically, "_microservically"_ appetizing. I'm sure I've overlooked some open source applications in this area; please let me know about them in the comments.

**[Download the PDF version of this cheat sheet [here][3]]**

### Containers

The right way to deploy applications is in [containers][4]. Briefly, a container is a miniature virtual server packed with the software required to run an application. The container pack is small, smart, and easy to deploy and maintain. And deploying your application in a container is clever. You can deploy as many instances as you need and scale up or down as needed to meet the current load.

**Open source containers**

**Software** | **Code** | **License**
---|---|---
[rkt][5] | [GitHub][6] | Apache License 2.0
[Docker][7] | [GitHub][8] | Apache License 2.0
[FreeBSD Jail][9] | [GitHub][10] | FreeBSD License
[LXC][11] | [GitHub][12] | GNU LGPL v.2.1
[OpenVZ][13] | [GitHub][14] | GNU General Public License v2.0

### Container orchestrators

If you have hundreds or thousands of service instances deployed on containers, you need a good way to manage them. Container orchestration is the right solution for deploying and managing all of these containers. Orchestrators can move across; scale up, down, or out; manage higher or lower loads; regulate added, removed, and dead containers; and much more.

**Open source container orchestrators**

**Software** | **Code** | **License**
---|---|---
[Kubernetes][15] | [GitHub][16] | Apache License 2.0
[OpenShift][17] | [GitHub][18] | Apache License 2.0
[Nomad][19] | [GitHub][20] | Mozilla Public License 2.0
[LXD][21] | [GitHub][22] | Apache License 2.0

### API gateways

An API gateway is a watchman that controls and monitors API calls to your application. An API gateway has three key roles:

  1. **API data and management:** API listing, API subscription, API documentation, community support
  2. **API viewpoint and billing:** Analytics, metrics, billing
  3. **API control and security:** Subscription caller management, rate control, blocking, data conversion, production and sandbox support, key management



API gateways are usually multi-tenant solutions to deploy multiple applications on the same gateway.

**Open source API gateways**

Not all of the following API gateways support every function mentioned above, so pick and choose depending on your needs.

**Software** | **Code** | **License**
---|---|---
[3scale][23] | [GitHub][24] | Apache License 2.0
[API Umbrella][25] | [GitHub][26] | MIT License
[Apigee][27] | [GitHub][28] | Apache License 2.0
[Apiman][29] | [GitHub][30] | Apache License 2.0
[DreamFactory][31] | [GitHub][32] | Apache License 2.0
[Fusio][33] | [GitHub][34] | GNU Affero General Public License v3.0
[Gravitee][35] | [GitHub][36] | Apache License 2.0
[Kong][37] | [GitHub][38] | Apache License 2.0
[KrakenD][39] | [GitHub][40] | Apache License 2.0
[Tyk][41] | [GitHub][42] | Mozilla Public License 2.0

### CI/CD

Continuous integration (CI) and continuous deployment (CD; it may also stand for continuous delivery) are the net sum of processes to build and run your processes. [CI/CD][43] is a philosophy that ensures your microservices are built and run correctly to meet users' expectations. Automation is the critical CI/CD factor that makes the build and run process easy and structured. CI's primary processes are build and test, and CD's are deploy and monitor.

All of the CI/CD tools and platforms listed below are open source. I don't include SaaS platforms that are free for hosting open source. GitHub also isn't on the list because it is not open source and does not have built-in CI/CD; it uses third-party CI/CD product integrations instead. GitLab is open source and has a built-in CI/CD service, so it is on this list.

**Open source CI/CD tools**

**Software** | **Code** | **License**
---|---|---
[Jenkins][44] | [GitHub][45] | MIT License
[GitLab][46] | [GitLab][47] | MIT License
[Buildbot][48] | [GitHub][49] | GNU General Public License v2.0
[Concourse][50] | [GitHub][51] | Apache License 2.0
[GoCD][52] | [GitHub][53] | Apache License 2.0
[Hudson][54] | [GitHub][55] | MIT License
[Spinnaker][56] | [GitHub][57] | Apache License 2.0

### Load balancers

When your number of requests scale, you must deploy multiple instances of your application and share requests across those instances. The application that manages the requests between instances is called a load balancer. A load balancer can be configured to distribute requests based on round-robin scheduling, IP routing, or another algorithm. The load balancer automatically manages request distributions when new instances are added (to support higher load) or decommissioned (when load scales down). Session persistence is another load-balancing feature that redirects new requests to the previous instance when needed (for example, to maintain a session). There are hardware- and software-based load balancers.

**Open source load balancers**

**Software** | **Code** | **License**
---|---|---
[HAProxy][58] | [GitHub][59] | HAPROXY's license / GPL v2.0
[Apache modules][60] (mod_athena, mod_proxy_balancer) | [SourceForge][61] or
[Code.Google][62] or
[GitHub][63] | Apache License 2.0
[Balance][64] | [SourceForge][65] | GNU General Public License v2.0
[Distributor][66] | [SourceForge][67] | GNU General Public License v2.0
[GitHub Load Balancer (GLB) Director][68] | [GitHub][69] | BSD 3-Clause License
[Neutrino][70] | [GitHub][71] | Apache License 2.0
[OpenLoBa][72] | [SourceForge][73] | Not known
[Pen][74] | [GitHub][75] | GNU General Public License, v2.0
[Seesaw][76] | [GitHub][77] | Apache License 2.0
[Synapse][78] | [GitHub][79] | Apache License 2.0
[Traefik][80] | [GitHub][81] | MIT License

### Service registry and service discovery

When several hundreds or thousands of service instances are deployed and talking to each other, how do requester services know how to connect the right responder services, given that deployment points are dynamic as services are scaled in and out? A service registry and service discovery service solves this problem. These systems are essentially key-value stores that maintain configuration information and naming and provide distributed synchronization.

**Open source service registry and discovery services**

**Software** | **Code** | **License**
---|---|---
[Baker Street][82] | [GitHub][83] | Apache License 2.0
[Consul][84] | [GitHub][85] | Mozilla Public License 2.0
[etcd][86] | [GitHub][87] | Apache License 2.0
[Registrator][88] | [GitHub][89] | MIT License
[Serf][90] | [GitHub][91] | Mozilla Public License 2.0
[ZooKeeper][92] | [GitHub][93] | Apache License 2.0

### Monitoring

When your microservices and their instances cater to users' needs, you need to maintain a good view of their performance. Monitoring tools to the rescue!

Open source monitoring tools and software come in numerous flavors, some barely better than [top][94]. Other options include OS-specific; enterprise-grade; tool collections that provide complete integration; do-one-thing tools that merely monitor or report or visualize and integrate with third-party tools; and tools that monitor specific or multiple components such as networks, log files, web requests, and databases. Monitoring tools can be web-based or standalone tools, and notification options range from passive reporting to active alerting.

Choose one or more of these tools to enjoy a chewy crunch of your microservices network.

**Open source monitoring software**

**Software** | **Code** | **License**
---|---|---
[OpenNMS][95] | [GitHub][96] | GNU Affero General Public License
[Grafana][97] | [GitHub][98] | Apache License 2.0
[Graphite][99] | [GitHub][100] | Apache License 2.0
[Icinga][101] | [GitHub][102] | GNU General Public License v2.0
[InfluxDB][103] | [GitHub][104] | MIT License
[LibreNMS][105] | [GitHub][106] | GNU General Public License v3.0
[Naemon][107] | [GitHub][108] | GNU General Public License v2.0
[Nagios][109] | [GitHub][110] | GNU General Public License v2.0
[ntop][111] | [GitHub][112] | GNU General Public License v3.0
[ELK][113] | [GitHub][114] | Apache License 2.0
[Prometheus][115] | [GitHub][116] | Apache License 2.0
[Sensu][117] | [GitHub][118] | MIT License
[Zabbix][119] | [Self-hosted repo][120] | GNU General Public License v2.0
[Zenoss][121] | [SourceForge][122] | GNU General Public License v2.0

### The right ingredients

Pure open source solutions can offer the right ingredients for deploying and running microservices at high scale. I hope you find them to be relishing, gratifying, satiating, and most of all, _microservicey_!

### Download the [Microservices cheat sheet][3]. 

What are microservices? Opensource.com created a new resource page which gently introduces...

What are microservices, how do container technologies allow for their use, and what other tools do...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/microservices-cheat-sheet

作者：[Girish Managoli][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gammay
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://opensource.com/resources/what-are-microservices
[3]: https://opensource.com/content/microservices-cheat-sheet
[4]: https://opensource.com/resources/what-are-linux-containers
[5]: https://coreos.com/rkt/
[6]: https://github.com/rkt/rkt/
[7]: https://www.docker.com/
[8]: https://github.com/docker
[9]: https://www.freebsd.org/doc/handbook/jails-build.html
[10]: https://github.com/freebsd/freebsd
[11]: https://linuxcontainers.org/lxc/
[12]: https://github.com/lxc/lxc
[13]: https://openvz.org/
[14]: https://github.com/OpenVZ
[15]: https://kubernetes.io/
[16]: https://github.com/kubernetes/kubernetes
[17]: https://www.openshift.com/
[18]: https://github.com/openshift
[19]: https://www.nomadproject.io/
[20]: https://github.com/hashicorp/nomad
[21]: https://linuxcontainers.org/lxd/introduction/
[22]: https://github.com/lxc/lxd
[23]: https://www.redhat.com/en/technologies/jboss-middleware/3scale
[24]: https://github.com/3scale/APIcast
[25]: https://apiumbrella.io/
[26]: https://github.com/NREL/api-umbrella
[27]: https://cloud.google.com/apigee/
[28]: https://github.com/apigee/microgateway-core
[29]: http://www.apiman.io/
[30]: https://github.com/apiman/apiman
[31]: https://www.dreamfactory.com/
[32]: https://github.com/dreamfactorysoftware/dreamfactory
[33]: https://www.fusio-project.org/
[34]: https://github.com/apioo/fusio
[35]: https://gravitee.io/
[36]: https://github.com/gravitee-io/gravitee-gateway
[37]: https://konghq.com/kong/
[38]: https://github.com/Kong/
[39]: https://www.krakend.io/
[40]: https://github.com/devopsfaith/krakend
[41]: https://tyk.io/
[42]: https://github.com/TykTechnologies/tyk
[43]: https://opensource.com/article/18/8/what-cicd
[44]: https://jenkins.io/
[45]: https://github.com/jenkinsci/jenkins
[46]: https://gitlab.com/
[47]: https://gitlab.com/gitlab-org
[48]: https://buildbot.net/
[49]: https://github.com/buildbot/buildbot
[50]: https://concourse-ci.org/
[51]: https://github.com/concourse/concourse
[52]: https://www.gocd.org/
[53]: https://github.com/gocd/gocd
[54]: http://hudson-ci.org/
[55]: https://github.com/hudson
[56]: https://www.spinnaker.io/
[57]: https://github.com/spinnaker/spinnaker
[58]: http://www.haproxy.org/
[59]: https://github.com/haproxy/haproxy
[60]: https://httpd.apache.org/docs/2.4/mod/mod_proxy_balancer.html
[61]: http://ath.sourceforge.net/
[62]: https://code.google.com/archive/p/ath/
[63]: https://github.com/omnigroup/Apache/blob/master/httpd/modules/proxy/mod_proxy_balancer.c
[64]: https://www.inlab.net/balance/
[65]: https://sourceforge.net/projects/balance/
[66]: http://distributor.sourceforge.net/
[67]: https://sourceforge.net/projects/distributor/files/
[68]: https://github.blog/2016-09-22-introducing-glb/
[69]: https://github.com/github/glb-director
[70]: https://neutrinoslb.github.io/
[71]: https://github.com/eBay/Neutrino
[72]: http://openloba.sourceforge.net/
[73]: https://sourceforge.net/p/openloba/code/HEAD/tree/
[74]: http://siag.nu/pen/
[75]: https://github.com/UlricE/pen
[76]: https://opensource.google.com/projects/seesaw
[77]: https://github.com/google/seesaw
[78]: https://synapse.apache.org/
[79]: https://github.com/apache/synapse/tree/master
[80]: https://traefik.io/
[81]: https://github.com/containous/traefik
[82]: http://bakerstreet.io/
[83]: https://github.com/datawire/bakerstreet
[84]: https://www.consul.io/
[85]: https://github.com/hashicorp/consul
[86]: https://etcd.io/
[87]: https://github.com/etcd-io/etcd
[88]: https://gliderlabs.github.io/registrator/latest/
[89]: https://github.com/gliderlabs/registrator
[90]: https://www.serf.io/
[91]: https://github.com/hashicorp/serf
[92]: https://zookeeper.apache.org/
[93]: https://github.com/apache/zookeeper
[94]: https://en.wikipedia.org/wiki/Top_(software)
[95]: https://www.opennms.com/
[96]: https://github.com/OpenNMS/opennms
[97]: https://grafana.com
[98]: https://github.com/grafana/grafana
[99]: https://graphiteapp.org/
[100]: https://github.com/graphite-project
[101]: https://icinga.com/
[102]: https://github.com/icinga/
[103]: https://www.influxdata.com/
[104]: https://github.com/influxdata/influxdb
[105]: https://www.librenms.org/
[106]: https://github.com/librenms/librenms
[107]: http://www.naemon.org/
[108]: https://github.com/naemon
[109]: https://www.nagios.org/
[110]: https://github.com/NagiosEnterprises/nagioscore
[111]: https://www.ntop.org/
[112]: https://github.com/ntop/ntopng
[113]: https://www.elastic.co/
[114]: https://github.com/elastic
[115]: https://prometheus.io/
[116]: https://github.com/prometheus/prometheus
[117]: https://sensu.io/
[118]: https://github.com/sensu
[119]: https://www.zabbix.com/
[120]: https://git.zabbix.com/projects/ZBX/repos/zabbix/browse
[121]: https://www.zenoss.com/
[122]: https://sourceforge.net/projects/zenoss/
