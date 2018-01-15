Protecting Your Website From Application Layer DOS Attacks With mod
======
There exist many ways of maliciously taking a website offline. The more complicated methods involve technical knowledge of databases and programming. A far simpler method is known as a "Denial Of Service", or "DOS" attack. This attack derives its name from its goal which is to deny your regular clients or site visitors normal website service.

There are, generally speaking, two forms of DOS attack;

  1. Layer 3,4 or Network-Layer attacks.
  2. Layer 7 or Application-Layer attacks.



The first type of DOS attack, network-layer, is when a huge quantity of junk traffic is directed at the web server. When the quantity of junk traffic exceeds the capacity of the network infrastructure the website is taken offline.

The second type of DOS attack, application-layer, is where instead of junk traffic legitimate looking page requests are made. When the number of page requests exceeds the capacity of the web server to serve pages legitimate visitors will not be able to use the site.

This guide will look at mitigating application-layer attacks. This is because mitigating networking-layer attacks requires huge quantities of available bandwidth and the co-operation of upstream providers. This is usually not something that can be protected against through configuration of the web server.

An application-layer attack, at least a modest one, can be protected against through the configuration of a normal web server. Protecting against this form of attack is important because [Cloudflare][1] have [recently reported][2] that the number of network-layer attacks is diminishing while the number of application-layer attacks is increasing.

This guide will explain using the Apache2 module [mod_evasive][3] by [zdziarski][4].

In addition, mod_evasive will stop an attacker trying to guess a username/password combination by attempting hundreds of combinations i.e. a brute force attack.

Mod_evasive works by keeping a record of the number of requests arriving from each IP address. When this number exceeds one of the several thresholds that IP is served an error page. Error pages require far fewer resources than a site page keeping the site online for legitimate visitors.

### Installing mod_evasive on Ubuntu 16.04

Mod_evasive is contained in the default Ubuntu 16.04 repositories with the package name "libapache2-mod-evasive". A simple `apt-get` will get it installed:
```
apt-get update
apt-get upgrade
apt-get install libapache2-mod-evasive

```

We now need to configure mod_evasive.

It's configuration file is located at `/etc/apache2/mods-available/evasive.conf`. By default, all the modules settings are commented after installation. Therefore, the module won't interfere with site traffic until the configuration file has been edited.
```
<IfModule mod_evasive20.c>
 #DOSHashTableSize 3097
 #DOSPageCount 2
 #DOSSiteCount 50
 #DOSPageInterval 1
 #DOSSiteInterval 1
 #DOSBlockingPeriod 10

 #DOSEmailNotify you@yourdomain.com
 #DOSSystemCommand "su - someuser -c '/sbin/... %s ...'"
 #DOSLogDir "/var/log/mod_evasive"
</IfModule>

```

The first block of directives mean as follows:

  * **DOSHashTableSize** - The current list of accessing IP's and their request count.
  * **DOSPageCount** - The threshold number of page requests per DOSPageInterval.
  * **DOSPageInterval** - The amount of time in which mod_evasive counts up the page requests.
  * **DOSSiteCount** - The same as the DOSPageCount but counts requests from the same IP for any page on the site.
  * **DOSSiteInterval** - The amount of time that mod_evasive counts up the site requests.
  * **DOSBlockingPeriod** - The amount of time in seconds that an IP is blocked for.



If the default configuration shown above is used then an IP will be blocked if it:

  * Requests a single page more than twice a second.
  * Requests more than 50 pages different pages per second.



If an IP exceeds these thresholds it is blocked for 10 seconds.

This may not seem like a lot, however, mod_evasive will continue monitoring the page requests even for blocked IP's and reset their block period. As long as an IP is attempting to DOS the site it will remain blocked.

The remaining directives are:

  * **DOSEmailNotify** - An email address to receive notification of DOS attacks and IP's being blocked.
  * **DOSSystemCommand** - A command to run in the event of a DOS.
  * **DOSLogDir** - The directory where mod_evasive keeps some temporary files.



### Configuring mod_evasive

The default configuration is a good place to start as it should not block any legitimate users. The configuration file with all directives (apart from DOSSystemCommand) uncommented looks like the following:
```
<IfModule mod_evasive20.c>
 DOSHashTableSize 3097
 DOSPageCount 2
 DOSSiteCount 50
 DOSPageInterval 1
 DOSSiteInterval 1
 DOSBlockingPeriod 10

 DOSEmailNotify JohnW@example.com
 #DOSSystemCommand "su - someuser -c '/sbin/... %s ...'"
 DOSLogDir "/var/log/mod_evasive"
</IfModule>

```

The log directory must be created and given the same owner as the apache process. Here it is created at `/var/log/mod_evasive` and given the owner and group of the Apache web server on Ubuntu `www-data`:
```
mkdir /var/log/mod_evasive
chown www-data:www-data /var/log/mod_evasive

```

After editing Apache's configuration, especially on a live website, it is always a good idea to check the syntax of the edits before restarting or reloading. This is because a syntax error will stop Apache from re-starting and taking your site offline.

Apache comes packaged with a helper command that has a configuration syntax checker. Simply run the following command to check your edits:
```
apachectl configtest

```

If your configuration is correct you will get the response:
```
Syntax OK

```

However, if there is a problem you will be told where it occurred and what it was, e.g.:
```
AH00526: Syntax error on line 6 of /etc/apache2/mods-enabled/evasive.conf:
DOSSiteInterval takes one argument, Set site interval
Action 'configtest' failed.
The Apache error log may have more information.

```

If your configuration passes the configtest then the module can be safely enabled and Apache reloaded:
```
a2enmod evasive
systemctl reload apache2.service

```

Mod_evasive is now configured and running.

### Testing

In order to test mod_evasive, we simply need to make enough web requests to the server that we exceed the threshold and record the response codes from Apache.

A normal, successful page request will receive the response:
```
HTTP/1.1 200 OK

```

However, one that has been denied by mod_evasive will return the following:
```
HTTP/1.1 403 Forbidden

```

The following script will make HTTP requests to `127.0.0.1:80`, that is localhost on port 80, as rapidly as possible and print out the response code of every request.

All you need to do is to copy the following bash script into a file e.g. `mod_evasive_test.sh`:
```
#!/bin/bash
set -e

for i in {1..50}; do
 curl -s -I 127.0.0.1 | head -n 1
done

```

The parts of this script mean as follows:

  * curl - This is a command to make web requests. 
    * -s - Hide the progress meter.
    * -I - Only display the response header information.
  * head - Print the first part of a file. 
    * -n 1 - Only display the first line.



Then make it executable:
```
chmod 755 mod_evasive_test.sh

```

When the script is run **before** mod_evasive is enabled you will see 50 lines of `HTTP/1.1 200 OK` returned.

However, after mod_evasive is enabled you will see the following:
```
HTTP/1.1 200 OK
HTTP/1.1 200 OK
HTTP/1.1 403 Forbidden
HTTP/1.1 403 Forbidden
HTTP/1.1 403 Forbidden
HTTP/1.1 403 Forbidden
HTTP/1.1 403 Forbidden
...

```

The first two requests were allowed, but then once a third in the same second was made mod_evasive denied any further requests. You will also receive an email letting you know that a DOS attempt was detected to the address you set with the `DOSEmailNotify` option.

Mod_evasive is now protecting your site!

--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/mod_proxy/

作者：[Elliot Cooper][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net/about/
[1]:https://www.cloudflare.com
[2]:https://blog.cloudflare.com/the-new-ddos-landscape/
[3]:https://github.com/jzdziarski/mod_evasive
[4]:https://www.zdziarski.com/blog/
