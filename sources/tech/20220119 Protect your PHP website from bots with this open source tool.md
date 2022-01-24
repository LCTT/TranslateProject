[#]: subject: "Protect your PHP website from bots with this open source tool"
[#]: via: "https://opensource.com/article/22/1/php-website-bouncer-crowdsec"
[#]: author: "Philippe Humeau https://opensource.com/users/philippe-humeau"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Protect your PHP website from bots with this open source tool
======
The CrowdSec bouncer is designed to be included in any PHP application
to help block attackers.
![Security monster][1]

PHP is a widely-used programming language on the web, and it's estimated that nearly 80% of all websites use it. My team at [CrowdSec][2] decided that we needed to provide server admins with a PHP bouncer to help ward away bots and bad actors who may attempt to interact with PHP files.

CrowdSec bouncers can be set up at various levels of an applicative stack: [web server, firewall, CDN][3], and so on. This article looks at one more layer: setting up remediation directly at the application level.

Remediation directly in the application can be helpful for various reasons:

  * It provides a business-logic answer to potential security threats.
  * It gives freedom about how to respond to security issues.



While CrowdSec already publishes a WordPress bouncer, this PHP library is designed to be included in _any_ PHP application (Drupal, for example). The bouncer helps block attackers, challenging them with CAPTCHA to let humans through while blocking bots.

### Prerequisites

This tutorial assumes that you are running Drupal on a Linux server with [Apache as a web server.][4]

The first step is to [install CrowdSec][5] on your server. You can do this with an [official install script][6]. If you're on Fedora, CentOS, or similar, download the RPM version:


```
`$ curl -s https://packagecloud.io/install/repositories/crowdsec/crowdsec/script.rpm.sh`
```

On Debian and Debian-based systems, download the DEB version:


```
`$ curl -s https://packagecloud.io/install/repositories/crowdsec/crowdsec/script.deb.sh`
```

These scripts are simple, so read through the one you download to verify that it imports a GPG key and configures a new repository. Once you're comfortable with what it does, execute it and then install.


```
`$ sudo dnf install crowdsec || sudo apt install crowdsec`
```

CrowdSec detects all the existing services on its own, so there should be no further configuration to get an immediately functional setup.

### Test the initial setup

Now that you have CrowdSec installed, launch a web application vulnerability scanner, such as [Nikto][7], and see how it behaves:


```
`$ ./nikto.pl -h http://<ip_or_domain>`
```

![nikto scan][8]

(Philippe Humeau, CC BY-SA 4.0)

The IP address has been detected and triggers various scenarios, the last one being **crowdsecurity/http-crawl-non_statics**.

![detected scan][9]

(Philippe Humeau, CC BY-SA 4.0)

However, CrowdSec only detects issues, and a bouncer is needed to apply remediation. Here comes the PHP bouncer.

### Remediate with the PHP bouncer

Now that you can detect malicious behaviors, you need to block the IP at the website level. At this time, there is no Drupal bouncer available. However, you can use the PHP bouncer directly.

How does it work? The PHP bouncer (like any other bouncer) makes an API call to the CrowdSec API and checks whether it should ban incoming IPs, send them a CAPTCHA, or allow them to pass.

The web server is Apache, so you can use the [install script for Apache][10].


```


$ git clone <https://github.com/crowdsecurity/cs-php-bouncer.git>
$ cd cs-php-bouncer/
$ ./install.sh --apache

```

![apache install script][11]

(Philippe Humeau, CC BY-SA 4.0)

The bouncer is configured to protect the whole website. Secure a specific part of the site by adapting the Apache configuration.

### Try to access the website

The PHP bouncer is installed and configured. You're banned due to the previous web vulnerability scan actions, but you can try to access the website:

![site access attempt][12]

(Philippe Humeau, CC BY-SA 4.0)

The bouncer successfully blocked your traffic. If you were not banned following a previous web vulnerability scan, you could add a manual decision with:


```
`$ cscli decisions add -i <your_ip>`
```

For the remaining tests, remove the current decisions:


```
`$ cscli decisions delete -i <your_ip>`
```

### Going further

I blocked the IP trying to mess with the PHP website. It’s nice, but what about IPs trying to scan, crawl, or DDoS it? Those kinds of detections can lead to false positives, so why not return a CAPTCHA challenge to check whether it is an actual user (rather than a bot) instead of blocking the IP?

#### Detect crawlers and scanners

I dislike crawlers and bad user agents and there are various scenarios available on the [Hub][13] to spot them.

Ensure the `base-http-scenarios` collections from the Hub are downloaded with `cscli`:


```


$ cscli collections list | grep base-http-scenarios
crowdsecurity/base-http-scenarios  ✔️ enabled  /etc/crowdsec/collections/base-http-scenarios.yaml

```

If it is not the case, install it, and reload CrowdSec:


```


$ sudo cscli collections install crowdsecurity/base-http-scenarios
$ sudo systemctl reload crowdsec

```

#### Remedy with a CAPTCHA

Since detecting DDoS, crawlers, or malevolent user agents can lead to false positives, I prefer to return a CAPTCHA for any IP address triggering those scenarios to avoid blocking real users.

To achieve this, modify the `profiles.yaml` file.

Add this YAML block at the beginning of your profile in `/etc/crowdsec/profiles.yaml`:


```


\---
# /etc/crowdsec/profiles.yaml
name: crawler_captcha_remediation
filter: Alert.Remediation == true &amp;&amp; Alert.GetScenario() in ["crowdsecurity/http-crawl-non_statics", "crowdsecurity/http-bad-user-agent"]

decisions:
  - type: captcha
    duration: 4h
on_success: break

```

With this profile, a CAPTCHA is enforced (for four hours) on any IP address that triggers the scenarios `crowdsecurity/http-crawl-non_statics` or `crowdsecurity/http-bad-user-agent`.

Next, reload CrowdSec:


```
`$ sudo systemctl reload crowdsec`
```

#### Try the custom remediations

Relaunching a web vulnerability scanner would trigger many scenarios, so you would ultimately be banned again. Instead, you can just craft an attack that triggers the `bad-user-agent` scenario (the list of known bad user-agents is [here][14]). Please note that you must activate the rule twice to get banned.


```


$ curl --silent -I -H "User-Agent: Cocolyzebot" <http://example.com> &gt; /dev/null
$ curl -I -H "User-Agent: Cocolyzebot" <http://example.com>
HTTP/1.1 200 OK
Date: Tue, 05 Oct 2021 09:35:43 GMT
Server: Apache/2.4.41 (Ubuntu)
Expires: Sun, 19 Nov 1978 05:00:00 GMT
Cache-Control: no-cache, must-revalidate
X-Content-Type-options: nosniff
Content-Language: en
X-Frame-Options: SAMEORIGIN
X-Generator: Drupal 7 (<http://drupal.org>)
Content-Type: text/html; charset=utf-8

```

You can, of course, see that you get caught for your actions.


```
`$ sudo cscli decisions list`
```

![detected scan][15]

(Philippe Humeau, CC BY-SA 4.0)

If you try to access the website, instead of being simply blocked, you receive a CAPTCHA:

![CAPTCHA prompt][16]

(Philippe Humeau, CC BY-SA 4.0)

Once you solve it, you can reaccess the website.

Next, unban myself again:


```
`$ cscli decisions delete -i <your_ip>`
```

Launch the vulnerability scanner:


```
`$ ./nikto.pl -h http://example.com`
```

Unlike the last time, you can now see that you've triggered several decisions:

![scan detected][17]

(Philippe Humeau, CC BY-SA 4.0)

When trying to access the website, the ban decision has the priority:

![site access attempt][18]

(Philippe Humeau, CC BY-SA 4.0)

### Wrap up

This is a quick way to help block attackers from PHP websites and applications. This article contains only one example. Remediations can be easily extended to fit additional needs. To find out more about installing and using the CrowdSec agent, [check this how-to guide][19] to get started.

To download the PHP bouncer, go to [the CrowdSec Hub][20] or [GitHub][21].

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/php-website-bouncer-crowdsec

作者：[Philippe Humeau][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/philippe-humeau
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_password_chaos_engineer_monster.png?itok=J31aRccu (Security monster)
[2]: https://opensource.com/article/20/10/crowdsec
[3]: https://hub.crowdsec.net/browse/#bouncers
[4]: https://opensource.com/article/18/2/how-configure-apache-web-server
[5]: https://doc.crowdsec.net/docs/getting_started/install_crowdsec
[6]: https://packagecloud.io/crowdsec/crowdsec/install
[7]: https://github.com/sullo/nikto
[8]: https://opensource.com/sites/default/files/1nikto_0.png (nikto scan)
[9]: https://opensource.com/sites/default/files/2decisions.png (detected scan)
[10]: https://github.com/crowdsecurity/cs-php-bouncer/blob/main/install.sh
[11]: https://opensource.com/sites/default/files/3bouncer.png (apache install script)
[12]: https://opensource.com/sites/default/files/4blocked.png (site access attempt)
[13]: https://hub.crowdsec.net/
[14]: https://raw.githubusercontent.com/crowdsecurity/sec-lists/master/web/bad_user_agents.txt
[15]: https://opensource.com/sites/default/files/7decisions-again.png (detected scan)
[16]: https://opensource.com/sites/default/files/8sitedeny.png (CAPTCHA prompt)
[17]: https://opensource.com/sites/default/files/10decisionsagain.png (scan detected)
[18]: https://opensource.com/sites/default/files/11sitedeny.png (site access attempt)
[19]: https://crowdsec.net/tutorial-crowdsec-v1-1/
[20]: https://hub.crowdsec.net/author/crowdsecurity/bouncers/cs-php-bouncer
[21]: https://github.com/crowdsecurity/cs-php-bouncer
