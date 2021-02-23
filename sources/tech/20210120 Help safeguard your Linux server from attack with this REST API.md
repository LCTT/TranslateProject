[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Help safeguard your Linux server from attack with this REST API)
[#]: via: (https://opensource.com/article/21/1/crowdsec-rest-api)
[#]: author: (Philippe Humeau https://opensource.com/users/philippe-humeau)

Help safeguard your Linux server from attack with this REST API
======
CrowdSec's new architecture improves communication among components to
better protect systems against cybersecurity threats.
![Lock][1]

CrowdSec is an open source cybersecurity detection system meant to identify aggressive behaviors and prevent them from accessing systems. Its user-friendly design offers a low technical barrier of entry with a significant boost to security.

A modern behavior detection system written in Go, CrowdSec combines the philosophy of [Fail2ban][2] with Grok patterns and YAML grammar to analyze logs for a modern, decoupled approach for securing the cloud, containers, and virtual machine (VM) infrastructures. Once detected, a threat can be mitigated with bouncers (block, 403, captcha, and so on), and blocked internet protocol addresses (IPs) are shared among all users to improve everyone's security further.

December's official release of [CrowdSec v.1.0.][3][x][3] introduces several improvements, including a major architectural change: the introduction of a local REST API. This local API allows all components to communicate more efficiently to support more complex architectures while keeping things simple for single-machine users. It also makes it simpler to create bouncers (the remediation component) and renders them more resilient to upcoming changes, which limits maintenance time.

The CrowdSec architecture was deeply remodeled in the new 1.0 release.

![CrowdSec architecture][4]

(Priya James, [CC BY-SA 4.0][5])

All CrowdSec components (the agent reading logs, cscli for humans, and bouncers to deter the bad guys) can now communicate via a REST API instead of reading or writing directly in the database. With this new version, only the local API service will interact with the database (e.g., SQLite, PostgreSQL, or MySQL).

This article covers how to install and run CrowdSec on a Linux server:

  * CrowdSec setup
  * Testing detection capabilities
  * Bouncer setup
  * Observability



### Set up the environment

The machine I used for this test is a Debian 10 Buster t2.medium EC2.

To make it more relevant, install Nginx:


```
$ sudo apt-get update
$ sudo apt-get install nginx
```

Configure the security groups so that both secure shell (SSH) (tcp/22) and HTTP (tcp/80) can be reached from the outside world. This will be useful for simulating attacks later.

#### Install CrowdSec

Grab the latest version of CrowdSec:


```
`$ curl -s https://api.github.com/repos/crowdsecurity/crowdsec/releases/latest | grep browser_download_url| cut -d '"' -f 4  | wget -i -`
```

You can also download it from CrowdSec's [GitHub page][6].

Install it:


```
$ tar xvzf crowdsec-release.tgz
$ cd crowdsec-v1.0.0/
$ sudo ./wizard.sh -i
```

The wizard helps guide installation and configuration. And I have to say it's very helpful!

![CrowdSec Installation Wizard][7]

(Priya James, [CC BY-SA 4.0][5])

First, the wizard identifies services present on the machine:

![CrowdSec identifies services on the machine][8]

(Priya James, [CC BY-SA 4.0][5])

It allows you to choose which services to monitor. For this tutorial, go with the default option and monitor all three services: Nginx, SSHD, and the Linux system.

For each service, the wizard identifies the associated log files and asks you to confirm (use the defaults again):

![CrowdSec wizard identifies log files][9]

(Priya James, [CC BY-SA 4.0][5])

Once the services and associated log files have been identified correctly (which is crucial, as this is where CrowdSec will get its information), the wizard prompts you with suggested collections.

A [collection][10] is a set of configurations that aims to create a coherent ensemble to protect a technological stack. For example, the [crowdsecurity/sshd][11] collection contains a [parser for SSHD logs][12] and a [scenario to detect SSH bruteforce and SSH user enumeration][13].

The suggested collections are based on the services that you choose to protect.

![CrowdSec suggests collections][14]

(Priya James, [CC BY-SA 4.0][5])

The wizard's last step is to deploy [generic whitelists][15] to prevent banning private IP addresses. It also reminds you that CrowdSec will _detect_ malevolent IPs but _not ban_ any of them. You need a bouncer to block attacks. This is an essential thing to remember: _CrowdSec detects attacks; bouncers block them_.

![CrowdSec detects attacks][16]

(Priya James, [CC BY-SA 4.0][5])

Now that the initial setup is done, CrowdSec should be up and running.

![CrowdSec running][17]

(Priya James, [CC BY-SA 4.0][5])

### Detect attacks with CrowdSec

By installing CrowdSec, you should already have coverage for common internet background noise. Check it out!

#### Attack a web server with Wapiti

Simulate a web application vulnerability scan on your Nginx service using Wapiti, a web application vulnerability scanner. You need to do this from an external IP, and keep in mind that [private IPs are whitelisted by default][15]:


```
ATTACKER$ wapiti   -u <http://34.248.33.108/>
[*] Saving scan state, please wait...

 Note
========
This scan has been saved in the file
/home/admin/.wapiti/scans/34.248.33.108_folder_b753f4f6.db
...
```

On your freshly equipped machine, you can see the attacks in the logs:

![Seeing attacks in the logs][18]

(Priya James, [CC BY-SA 4.0][5])

My IP triggered different scenarios:

  * [**crowdsecurity/http-path-traversal-probing**][19]: Detects path traversal probing attempt patterns in the `URI` or the `GET` parameters
  * [**crowdsecurity/http-sqli-probing-detection**][20]: Detects obvious SQL injection probing attempt patterns in the `URI` or the `GET` parameters.



Bear in mind that the website you attacked in this example is an empty Nginx server. If this were a real website, the scanner would perform many other actions that would lead to more detections.

#### Check results with cscli

**[cscli][21]** is one of the main tools for interacting with the CrowdSec service, and one of its features is visualizing _active decisions_ and _past alerts_.

![cscli][22]

(Priya James, [CC BY-SA 4.0][5])

The `cscli decisions list` command displays active decisions at any time, while `cscli alerts list` shows past alerts (even if decisions are expired or the alert didn't lead to a decision).

You can also inspect a specific alert to get more details with `cscli alerts inspect -d <ID>` (using the ID displayed in the left-hand column of the alerts list).

![Inspect a specific alert][23]

(Priya James, [CC BY-SA 4.0][5])

cscli offers other features, but one to look at now is to find out which parsers and scenarios are installed in the default setup.

![Find installed parsers and scenarios][24]

(Priya James, [CC BY-SA 4.0][5])

### Observability

Observability (especially for software that might take defensive countermeasures) is always a key point for a security solution. Besides its "tail the logfile" capability, CrowdSec offers two ways to achieve this: Metabase dashboards and Prometheus metrics.

#### Metabase dashboard

cscli allows you to deploy a dashboard using Metabase and Docker. Begin by [installing Docker using its official documentation][25].

![Installing Docker][26]

(Priya James, [CC BY-SA 4.0][5])

If you're using an AWS EC2 instance, be sure to expose tcp/3000 to access your dashboard.

`cscli dashboard setup` enables you to deploy a new Metabase dashboard running on Docker with a random password.

![Metabase sign in][27]

(Priya James, [CC BY-SA 4.0][5])

![CrowdSec dashboard][28]

(Priya James, [CC BY-SA 4.0][5])

![CrowdSec dashboard timeline][29]

(Priya James, [CC BY-SA 4.0][5])

![CrowdSec dashboard attack sources][30]

(Priya James, [CC BY-SA 4.0][5])

#### Prometheus metrics

While some people love visual dashboards, others prefer other kinds of metrics. This is where CrowdSec's Prometheus integration comes into play.

One way to visualize these metrics is with `cscli metrics`.

![cscli metrics][31]

(Priya James, [CC BY-SA 4.0][5])

The `cscli metrics` command exposes only a subset of Prometheus metrics that are important for system administrators. You can find a detailed [description of the metrics in the documentation.][32] The metrics are split into sections:

  * **Buckets:** How many buckets of each type were created, poured, or have overflowed since the daemon startup?
  * **Acquisition:** How many lines or events were read from each of the specified sources, and were they parsed and/or poured into buckets later?
  * **Parser:** How many lines/events were delivered to each parser, and did the parser succeed in processing the mentioned events?
  * **Local API:** How many times was each route hit, and so on?



Viewing CrowdSec's Prometheus metrics via `cscli metrics` is convenient but doesn't do justice to Prometheus. It is out of scope for this article to deep dive into Prometheus, but these screenshots offer a quick look at what CrowdSec's Prometheus metrics look like in Grafana.

![CrowdSec's Prometheus metrics in Grafana][33]

(Priya James, [CC BY-SA 4.0][5])

![CrowdSec's Prometheus metrics in Grafana][34]

(Priya James, [CC BY-SA 4.0][5])

### Defend attacks with bouncers

CrowdSec's detection capabilities provide observability into what is going on. However, to protect yourself, you need to block attackers, which is where bouncers play a major part. Remember: CrowdSec detects, bouncers deter.

Bouncers work by querying CrowdSec's API to know when to block an IP. You can download bouncers directly from the [CrowdSec Hub][35].

![CrowdSec Hub][36]

(Priya James, [CC BY-SA 4.0][5])

For this example, use `cs-firewall-bouncer`. It directly bans any malevolent IP at the firewall level using iptables or nftables.

Note: If you used your IP to simulate attacks, _unban your IP_ before going further: 


```
`sudo cscli decisions delete -i X.X.X.X`
```

#### Install the bouncer

First, download the bouncer from the Hub:


```
$ wget <https://github.com/crowdsecurity/cs-firewall-bouncer/releases/download/v0.0.5/cs-firewall-bouncer.tgz>
$ tar xvzf cs-firewall-bouncer.tgz
$ cd cs-firewall-bouncer-v0.0.5/
```

Install the bouncer with a simple install script:

![Install Bouncer][37]

(Priya James, [CC BY-SA 4.0][5])

The install script will check if you have iptables or nftables installed and prompt you to install if not.

Bouncers communicate with CrowdSec via a REST API, so check that the bouncer is registered on the API.

![Check Bouncer Registration][38]

(Priya James, [CC BY-SA 4.0][5])

The last command (`sudo cscli bouncers list`) shows your newly installed bouncer.

#### Test the bouncer

**Warning:** Before going further, _ensure you have another IP available_ to access your machine and that you will not kick yourself out. Using your smartphone's internet connection will work.

Now that you have a bouncer to protect you, try the test again.

![Test the bouncer][39]

(Priya James, [CC BY-SA 4.0][5])

Try to access the server at the end of the scan:


```
ATTACKER$ curl --connect-timeout 1 <http://34.248.33.108/>
curl: (28) Connection timed out after 1001 milliseconds
```

See how it turns out from the defender's point of view.

![CrowdSec defender's point of view][40]

(Priya James, [CC BY-SA 4.0][5])

For the technically curious, `cs-firewall-bouncer` uses either nftables or iptables. Using nftables (used on Debian 10 by default) creates and maintains two tables named `crowdsec` and `crowdsec6` (for IPv4 and IPv6, respectively):


```
$ sudo nft list ruleset
…
table ip crowdsec {
        set crowdsec_blocklist {
                type ipv4_addr
                elements = { 3.22.63.25, 3.214.184.223,
                             3.235.62.151, 3.236.112.98,
                             13.66.209.11, 17.58.98.156, …
                        }
        }

        chain crowdsec_chain {
                type filter hook input priority 0; policy accept;
                ip saddr @crowdsec_blocklist drop
        }
}
table ip6 crowdsec6 {
        set crowdsec6_blocklist {
                type ipv6_addr
        }

        chain crowdsec6_chain {
                type filter hook input priority 0; policy accept;
                ip6 saddr @crowdsec6_blocklist drop
        }
}
```

You can change the firewall backend used by the bouncer in `/etc/crowdsec/cs-firewall-bouncer/cs-firewall-bouncer.yaml` by changing the mode from nftables to iptables (ipset is required for iptables mode).

### Get involved

Please share your feedback about the latest CrowdSec release. If you are interested in testing the software or would like to get in touch with the team, check the following links:

  * [Download CrowdSec v.1.0][41][.x][3]
  * [CrowdSec website][42]
  * [GitHub repository][43]
  * [Gitter][44]



* * *

_This article has been adapted from [Most advanced CrowdSec IPS v.1.0.x is out: how-to guide][45], originally published on GBHackers on Security._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/crowdsec-rest-api

作者：[Philippe Humeau][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/philippe-humeau
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://www.fail2ban.org/
[3]: https://github.com/crowdsecurity/crowdsec/releases/tag/v1.0.2
[4]: https://opensource.com/sites/default/files/uploads/crowdsec_newarchitecture.png (CrowdSec architecture)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://github.com/crowdsecurity/crowdsec/releases/latest
[7]: https://opensource.com/sites/default/files/uploads/crowdsec_installationwizard.gif (CrowdSec Installation Wizard)
[8]: https://opensource.com/sites/default/files/uploads/crowdsec_servicestomonitor.png (CrowdSec identifies services on the machine)
[9]: https://opensource.com/sites/default/files/uploads/crowdsec_nginxlogfiles.png (CrowdSec wizard identifies log files)
[10]: https://doc.crowdsec.net/Crowdsec/v1/getting_started/concepts/#collections
[11]: https://hub.crowdsec.net/author/crowdsecurity/collections/sshd
[12]: https://hub.crowdsec.net/author/crowdsecurity/configurations/sshd-logs
[13]: https://hub.crowdsec.net/author/crowdsecurity/configurations/ssh-bf
[14]: https://opensource.com/sites/default/files/uploads/crowdsec_collections.png (CrowdSec suggests collections)
[15]: https://hub.crowdsec.net/author/crowdsecurity/configurations/whitelists
[16]: https://opensource.com/sites/default/files/uploads/crowdsec_detects.png (CrowdSec detects attacks)
[17]: https://opensource.com/sites/default/files/uploads/crowdsec_running.png (CrowdSec running)
[18]: https://opensource.com/sites/default/files/uploads/crowdsec_detectattack.png (Seeing attacks in the logs)
[19]: https://hub.crowdsec.net/author/crowdsecurity/configurations/http-path-traversal-probing
[20]: https://hub.crowdsec.net/author/crowdsecurity/configurations/http-sqli-probing
[21]: https://doc.crowdsec.net/Crowdsec/v1/user_guide/cscli/
[22]: https://opensource.com/sites/default/files/uploads/cscli.png (cscli)
[23]: https://opensource.com/sites/default/files/uploads/cscli-alerts-inspect.png (Inspect a specific alert)
[24]: https://opensource.com/sites/default/files/uploads/cscli_parsersscenarios.png (Find installed parsers and scenarios)
[25]: https://docs.docker.com/engine/install/debian/
[26]: https://opensource.com/sites/default/files/uploads/cscli_installdocker.png (Installing Docker)
[27]: https://opensource.com/sites/default/files/uploads/metabasesignin.png (Metabase sign in)
[28]: https://opensource.com/sites/default/files/uploads/crowdsec_maindashboard.png (CrowdSec dashboard)
[29]: https://opensource.com/sites/default/files/uploads/crowdsec_timeline.png (CrowdSec dashboard timeline)
[30]: https://opensource.com/sites/default/files/uploads/crowdsec_bysource_0.png (CrowdSec dashboard attack sources)
[31]: https://opensource.com/sites/default/files/uploads/cscli-metrics.png (cscli metrics)
[32]: https://doc.crowdsec.net/Crowdsec/v1/observability/prometheus/
[33]: https://opensource.com/sites/default/files/uploads/crowdsec_prometheus.png (CrowdSec's Prometheus metrics in Grafana)
[34]: https://opensource.com/sites/default/files/uploads/crowdsec_prometheus2.png (CrowdSec's Prometheus metrics in Grafana)
[35]: https://hub.crowdsec.net/browse/#bouncers
[36]: https://opensource.com/sites/default/files/uploads/crowdsec_hub.png (CrowdSec Hub)
[37]: https://opensource.com/sites/default/files/uploads/installbouncer.png (Install Bouncer)
[38]: https://opensource.com/sites/default/files/uploads/bouncerregistration.png (Check Bouncer Registration)
[39]: https://opensource.com/sites/default/files/uploads/crowdsectestbouncer.png (Test the bouncer)
[40]: https://opensource.com/sites/default/files/uploads/crowdsec_defender.png (CrowdSec defender's point of view)
[41]: https://github.com/crowdsecurity/crowdsec/releases/tag/v1.0.0
[42]: https://crowdsec.net/
[43]: https://github.com/crowdsecurity/crowdsec
[44]: https://gitter.im/crowdsec-project/community
[45]: https://gbhackers.com/crowdsec-ips-v-1-0-x/
