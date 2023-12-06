[#]: subject: "A Web Application Firewall for Nginx"
[#]: via: "https://fedoramagazine.org/a-web-application-firewall-for-nginx/"
[#]: author: "Roman Gherta https://fedoramagazine.org/author/romangherta/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A Web Application Firewall for Nginx
======

![][1]

Red Bricks by [Kenny Eliason][2] on [Unsplash][3] (cropped), Fire by [Cullan Smith][4] on [Unsplash][5] (stretched, flipped)

A web application firewall (WAF) is an application that monitors network traffic at the application layer.

[OSI (Open Systems Interconnection)][6] is one of the most referenced network traffic frameworks across internet related discussions. When a package crosses Layer 6 (Presentation) and moves towards Layer 7 (Application) it undergoes decrypting/decoding operations. Each of these operations can be susceptible to faulty decoding and interpretation that can be used to break out of the standard application context. Injections are just one type of such vulnerabilities and for a long time have been the number one cause of concern especially since traditional [IDS/IPS][7] appliances cannot handle these threats.

### About ModSecurity

[ModSecurity][8] was historically the web application firewall engine itself. It is compatible with Apache, IIS, and Nginx and has been maintained by a third-party company. The firewall cross references a list of rules to a stream of HTTP headers provided by a webserver/proxy. As of now this repository was simplified and contains only the main library _LibModSecurity_. The library itself can be called from your own server implementation directly or via wrappers specific to individual programming languages.

The parent company’s support is scheduled to end on July 1 2024 at which time the project is supposed to be maintained by the open-source community.

### Install the Nginx connector

The [Nginx connector][9] is an Nginx dynamic module and it can be installed via the Fedora package _nginx-mod-modsecurity_. It has _libmodsecurity.so_ as a dependency so for this use-case this package is the firewall itself.

```

    [user@fedora ~]$ sudo dnf install -y nginx nginx-mod-modsecurity
    [user@fedora ~]$ rpm -qR nginx-mod-modsecurity
    config(nginx-mod-modsecurity) = 1.0.3-3.fc38
    libc.so.6(GLIBC_2.4)(64bit)
    libmodsecurity.so.3()(64bit)
    nginx(abi) = 1.24.0
    nginx-filesystem
    ...

```

Once installed, you will see that the connector adds a few important files to /etc/nginx.

```

    [user@fedora ~]$ rpm -ql nginx-mod-modsecurity
    /etc/nginx/modsecurity.conf                   # waf config
    /etc/nginx/nginx.conf.modsecurity             # nginx sample conf
    /usr/lib64/nginx/modules/ngx_http_modsecurity_module.so
    /usr/share/nginx/modules/mod-modsecurity.conf
    /usr/share/doc/nginx-mod-modsecurity/README.md
    ...

```

The connector extends Nginx by providing some extra configuration directives. The following sections will demonstrate a few of the example directives in the _nginx.conf.modsecurity_ file. A complete list of the directives can be found in the _README.md_ file or on the project’s GitHub page.

### Enable the web application firewall

_nginx.conf.modsecurity_ is the Nginx configuration we are going to run. Uncomment the _modsec*_ lines as shown below.

```

    [user@fedora ~]$ sudo sed -i 's/#modsec/modsec/g' /etc/nginx/nginx.conf.modsecurity
    [user@fedora ~]$ grep -C2 modsecurity /etc/nginx/nginx.conf.modsecurity
            # Enable ModSecurity WAF, if need
            modsecurity on;
            # Load ModSecurity CRS, if need
            modsecurity_rules_file /etc/nginx/modsecurity.conf;

```

Start the server inside the shell and observe the logs to make sure the seven default rules defined in _modsecurity.conf_ are loaded.

```

    [user@fedora ~]$ sudo nginx -c /etc/nginx/nginx.conf.modsecurity
    [user@fedora ~]$ head /var/log/nginx/error.log
    2023/10/21 23:55:09 [notice] 46218#46218: ModSecurity-nginx v1.0.3 (rules loaded inline/local/remote: 0/7/0)
    2023/10/21 23:55:09 [notice] 46218#46218: using the "epoll" event method
    2023/10/21 23:55:09 [notice] 46218#46218: nginx/1.24.0
    2023/10/21 23:55:09 [notice] 46218#46218: OS: Linux 6.5.7-200.fc38.x86_64

```

Test the default rules by sending some data that does not respect the _content-type_ header format.

```

    [user@fedora ~]$ curl -X POST http://localhost -H "Content-Type: application/json" --data "<xml></xml>"
    [user@fedora ~]$ tail /var/log/modsec_audit.log
    ...
    ---rH5bFain---H--
    ModSecurity: Warning. Matched "Operator `Eq' with parameter `0' against variable `REQBODY_ERROR' (Value: `1' ) [file "/etc/nginx/modsecurity.conf"] [line "75"] [id "200002"] [rev ""] [msg "Failed to parse request body."] [data "JSON parsing error: lexical error: invalid char in json text.\x0a"] [severity "2"] [ver ""] [maturity "0"] [accuracy "0"] [hostname "10.0.2.100"] [uri "/"] [unique_id "169795900388.487044"] [ref "v121,1"]

```

### Extend your web application firewall with the OWASP core rule set

The default Nginx connector comes with seven rules. The OWASP [Core Rule Set v3.3.5][10] is more extensive and covers many scenarios.

Copy the archive and extract the rules.

```

    [user@fedora ~]$ curl -fSL https://github.com/coreruleset/coreruleset/archive/refs/tags/v3.3.5.tar.gz --output /tmp/v3.3.5.tar.gz
    [user@fedora ~]$ sudo tar -C /etc/nginx -xvf /tmp/v3.3.5.tar.gz
    [user@fedora ~]$ tree -L 1 /etc/nginx/
    /etc/nginx/
    ├── conf.d
    ├── default.d
    ├── modsecurity.conf          # waf config
    ├── nginx.conf
    ├── nginx.conf.modsecurity    # nginx waf enabled
    ├── coreruleset-3.3.5
    ├   ├── rules                 # rules directory
    ├       ...
    ├   ...

```

You now have a _rules_ directory within the nginx configuration folder with all the current OWASP rules. Next, make Nginx aware of these rules. The following instructions originate from the OWASP [./INSTALL][11] file.

Create a _crs.conf_ file and include all the relevant config files in the global web application firewall config file ( _modsecurity.conf_ ).

```

    [user@fedora ~]$ sudo cp /etc/nginx/coreruleset-3.3.5/crs-setup.conf.example /etc/nginx/coreruleset-3.3.5/crs.conf
    [user@fedora ~]$ echo -e "\nInclude /etc/nginx/coreruleset-3.3.5/crs.conf"  | sudo tee -a /etc/nginx/modsecurity.conf
    [user@fedora ~]$ echo -e "\nInclude /etc/nginx/coreruleset-3.3.5/rules/*.conf" | sudo tee -a /etc/nginx/modsecurity.conf
    [user@fedora ~]$ tail /etc/nginx/modsecurity.conf
    Include /etc/nginx/coreruleset-3.3.5/crs.conf
    Include /etc/nginx/coreruleset-3.3.5/rules/*.conf

```

According to docs, the order of including these files is important. The _tee_ command shown above has placed the new _Include_ lines at the end of the _modsecurity.conf_ file. Now, reload Nginx with this new configuration.

```

    [user@fedora ~]$ sudo nginx -s stop && sudo nginx -c /etc/nginx/nginx.conf.modsecurity
    [user@fedora ~]$ tail /var/log/nginx/error.log
    2023/10/22 10:53:23 [notice] 202#202: exit
    2023/10/22 10:53:50 [notice] 230#230: ModSecurity-nginx v1.0.3 (rules loaded inline/local/remote: 0/921/0)
    2023/10/22 10:53:50 [notice] 230#230: using the "epoll" event method
    2023/10/22 10:53:50 [notice] 230#230: nginx/1.24.0
    2023/10/22 10:53:50 [notice] 230#230: OS: Linux 6.5.7-200.fc38.x86_64
    2023/10/22 10:53:50 [notice] 230#230: getrlimit(RLIMIT_NOFILE): 524288:524288
    2023/10/22 10:53:50 [notice] 231#231: start worker processes

```

Notice Nginx loaded _921_ rules successfully. Some tests are also needed to make sure the rules are actually checked by the web application firewall. Here again, we reference the snippet _Testing the Installation_ from the _./INSTALL_ file.

```

    [user@fedora ~]$ curl 'http://localhost/?param=''><script>alert(1);</script>'
    [user@fedora ~]$ tail /var/log/modsec_audit.log
    ...
    ---8NSpdnLe---H--
    ModSecurity: Warning. detected XSS using libinjection. [file "/etc/nginx/coreruleset-3.3.5/rules/REQUEST-941-APPLICATION-ATTACK-XSS.conf"] [line "38"] [id "941100"] [rev ""] [msg "XSS Attack Detected via libinjection"] [data "Matched Data: XSS data found within ARGS:param: ><script>alert(1);</script>"] [severity "2"] [ver "OWASP_CRS/3.3.5"]
    ...

```

### Conclusions

How to configure a web application firewall for an Nginx server has been demonstrated. This deployment uses standard rules plus the _OWASP Core Rule Set v3.3.5._ The firewall demonstrated above is running in **detection mode** and logging unusual actions. Running the firewall in **prevention mode** requires further changes to _modsecurity.conf._ Refer to [ModSecurity Reference Manual v3.x][12] for instructions on how to enable prevention mode and much more.

All the best.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/a-web-application-firewall-for-nginx/

作者：[Roman Gherta][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/romangherta/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/11/waf-nginx-816x345.jpg
[2]: https://unsplash.com/@neonbrand?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/red-bricks-wall-XEsx2NVpqWY?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://unsplash.com/@cullansmith?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[5]: https://unsplash.com/photos/red-fire-digital-wallpaper-BdTtvBRhOng?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[6]: https://osi-model.com/
[7]: https://en.wikipedia.org/wiki/Intrusion_detection_system
[8]: https://github.com/SpiderLabs/ModSecurity
[9]: https://github.com/SpiderLabs/ModSecurity-nginx
[10]: https://github.com/coreruleset/coreruleset/tree/v3.3.5/rules
[11]: https://github.com/coreruleset/coreruleset/blob/v3.3.5/INSTALL
[12]: https://github.com/SpiderLabs/ModSecurity/wiki/Reference-Manual-(v3.x)
