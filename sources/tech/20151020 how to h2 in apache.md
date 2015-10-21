ictlyh Translating
how to h2 in apache 
================================================================================
Copyright (C) 2015 greenbytes GmbH

Support for HTTP/2 is finally being released with Apache httpd 2.4.17! This pages gives advice on how to build/deploy/configure it. The plan is to update this as people find out new things (read: bugs) or give recommendations on what works best for them.

Ultimately, this will then flow back into the official Apache documentation and this page will only contain a single link to it. But we are not quite there yet...

### Sources ###

You can get the Apache release from [here][1]. HTTP/2 support is included in Apache 2.4.17 and upwards. I will not repeat instructions on how to build the server in general. There is excellent material available in several places, for example [here][2].

(Any links to experimental packages? Drop me a note on twitter @icing.)

#### Building with HTTP/2 Support ####

Should you build from a release, you will need to **configure** first. There are tons of options. The ones specific for HTTP/2 are:

- **--enable-http2**

	This enables the module 'http2' which does implement the protocol inside the Apache server.

- **--with-nghttp2=<dir>**

	This specifies a non-standard location for the library libnghttp2 which is necessary for the http2 module. If nghttp2 is in a standard place, the configure process will pick it up automatically.

- **--enable-nghttp2-staticlib-deps**

	Ultra-rarely needed option that you may use to static link the nghttp2 library to the server. On most platforms, this only has an effect when there is no shared nghttp2 library to be found.

In case you want to build nghttp2 for yourself, you find documentation at [nghttp2.org][3]. The library is also being shipped in the latest Fedora and other distros will follow.

#### TLS Support ####

Most people will want to use HTTP/2 with browsers and browser only support it on TLS connections (**https://** urls). You'll need proper configuration for that which I cover below. But foremost what you will need is an TLS library that supports the ALPN extension.

ALPN is neccessary to negotiate the protocol to use between server and client. If it is not implemented by the TLS lib on your server, the client will only ever talk HTTP/1.1. So, who does link with Apache and support it?

- **OpenSSL 1.0.2** and onward.
- ???

If you get your OpenSSL library from your Linux distro, the version number used there might be different from the official OpenSSL releases. Check with your distro in case of doubt.

### Configuration ###

One useful addition to your server is to set a good logging level for the http2 module. Add this:

    # this needs to be somewhere
    LoadModule http2_module modules/mod_http2.so
    
    <IfModule http2_module>
        LogLevel http2:info
    </IfModule>

When you start your server and look in the error log, you should see one line like:

    [timestamp] [http2:info] [pid XXXXX:tid numbers] 
      mod_http2 (v1.0.0, nghttp2 1.3.4), initializing...

#### Protocols ####

So, assume you have the server built and deployed, the TLS library is bleeding edge (sorry), your server starts, you open your browser and...how do you know it is working?

If you have not added more to your server config, it probably isn't.

You need to tell the server where to use the protocol. By default, the HTTP/2 protocol is not enabled anywhere in your server. Because that is the safe route and you might have an existing deployment should continue to work.

You enable the HTTP/2 protocol with the new **Protocols** directive:

    # for a https server
    Protocols h2 http/1.1
    ...
    
    # for a http server
    Protocols h2c http/1.1

You can add this for the server in general or for specific **vhosts**.

#### SSL Parameter ####

HTTP/2 has some special requirements regarding TLS (SSL). See the chapter about [https:// connections][4] for more information.

### http:// Connections (h2c) ###

Although no browser currently supports it, the HTTP/2 protocol also works for http:// urls and mod_h[ttp]2 supports this. The only thing you need to do in order to enable it is the Protocols configuration:

    # for a http server
    Protocols h2c http/1.1

inside your **httpd.conf**.

There are several client (and client libraries) that support **h2c**. I'll dicusss some specifics below:

#### curl ####

Of course, the command line client for network resources, maintained by Daniel Stenberg. If you have curl on your system, there is an easy way to check its http/2 support:

    sh> curl -V
    curl 7.43.0 (x86_64-apple-darwin15.0) libcurl/7.43.0 SecureTransport zlib/1.2.5
    Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
    Features: AsynchDNS IPv6 Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz UnixSockets 
                
which is no good. There is no 'HTTP2' among the features. You'd want something like this:

    sh> curl -V
    url 7.45.0 (x86_64-apple-darwin15.0.0) libcurl/7.45.0 OpenSSL/1.0.2d zlib/1.2.8 nghttp2/1.3.4
    Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
    Features: IPv6 Largefile NTLM NTLM_WB SSL libz TLS-SRP HTTP2 UnixSockets

If you have a curl with the HTTP2 feature, you may check your server with some simple commands:

    sh> curl -v --http2 http://<yourserver>/
    ...
    > Connection: Upgrade, HTTP2-Settings
    > Upgrade: h2c
    > HTTP2-Settings: AAMAAABkAAQAAP__
    > 
    < HTTP/1.1 101 Switching Protocols
    < Upgrade: h2c
    < Connection: Upgrade
    * Received 101
    * Using HTTP2, server supports multi-use
    * Connection state changed (HTTP/2 confirmed)
    ...
    <the resource>

Congratulations, id you see the line with **...101 Switching...**, it's working!

There are cases, where the upgrade to HTTP/2 will not happen. When your first request does have content, for example you do a file upload, the Upgrade will not trigger. For a detailed explanation, see the section [h2c restrictions][5].

#### nghttp ####

nghttp2 has its own client and servers that can be build with it. If you have the client on your system, you can verify your installation by simply retrieving a resource:

    sh> nghttp -uv http://<yourserver>/
    [  0.001] Connected
    [  0.001] HTTP Upgrade request
    ...
    Connection: Upgrade, HTTP2-Settings
    Upgrade: h2c
    HTTP2-Settings: AAMAAABkAAQAAP__
    ...
    [  0.005] HTTP Upgrade response
    HTTP/1.1 101 Switching Protocols
    Upgrade: h2c
    Connection: Upgrade
    
    [  0.006] HTTP Upgrade success
    ...

which is very similar to the Upgrade dance we see in the **curl** example above.

There is another way to use **h2c** hidden in the command line arguments: **-u**. This instructs **nghttp** to perform the HTTP/1 Upgrade dance. But what if we leave this out?

    sh> nghttp -v http://<yourserver>/
    [  0.002] Connected
    [  0.002] send SETTINGS frame 
    ...
    [  0.002] send HEADERS frame 
              ; END_STREAM | END_HEADERS | PRIORITY
              (padlen=0, dep_stream_id=11, weight=16, exclusive=0)
              ; Open new stream
              :method: GET
              :path: /
              :scheme: http
    ...

The connection immediately speaks HTTP/2! This is what the protocol calls the direct mode and it works by some magic 24 bytes that the client sends to the server right away:

    0x505249202a20485454502f322e300d0a0d0a534d0d0a0d0a
    or in ASCII: PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n

A **h2c** capable server sees this on a new connection and can immediately switch its HTTP/2 processing on. A HTTP/1.1 server will see a funny request, answer it and close the connection.

Therefore **direct** mode is only good for clients if they can be resonably sure that the server supports this. For example, because a previous Upgrade dance was successful.

The charme of **direct** is the zero overhead and that it works for all requests, even those that carry a body (see [h2c restrictions][6]). The direct mode is enabled by default on any server that allows the h2c protocol. If you want to disable it, add the configuration directive:

注：下面这行打删除线

    H2Direct off

注：下面这行打删除线
to your server.

For the 2.4.17 release, **H2Direct** is enabled by default on cleartext connection. However there are some modules with whom this is incompatible with. Therefore, in the next release, the default will change to **off** and if you want your server to support it, you need to set it to

    H2Direct on

### https:// Connections (h2) ###

Once you get mod_h[ttp]2 working for h2c connections, it's time to get the **h2** sibling going, as browsers only do it with **https:** nowadays.

The HTTP/2 standard imposes some extra requirements on https: (TLS) connections. The ALPN extension has already been mentioned above. An additional requirement is that no cipher from a specified [black list][7] may be used.

While the current version of **mod_h[ttp]2** does not enforce these ciphers (but some day will), most clients will do so. If you point your browser at a **h2** server with inappropriate ciphers, you will get the obscure warning **INADEQUATE_SECURITY** and the browser will simply refuse to continue.

An acceptable Apache SSL configuration regarding this is:

    SSLCipherSuite ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK
    SSLProtocol All -SSLv2 -SSLv3
    ...

(Yes, it's that long.)

There are other SSL configuration parameters that should be tweaked, but do not have to: **SSLSessionCache**, **SSLUseStapling**, etc. but those are covered elsewhere. See the excellent [High Performance Browser Networking][8] by Ilya Grigorik, for example.

#### curl ####

Time to fire up a shell and use curl again (see the [h2c section about curl][9] for requirements). Using curl, you may check your server with some simple commands:

    sh> curl -v --http2 https://<yourserver>/
    ...
    * ALPN, offering h2
    * ALPN, offering http/1.1
    ...
    * ALPN, server accepted to use h2
    ...
    <the resource>

Congratulations, it's working! If not, the reason might be:

- Your curl does not support HTTP/2, see [this check][10].
- Your openssl is old and does not support ALPN.
- Your certificate could not be verified or your cipher configuration is not accepted. Try adding the command line option -k to disable those checks in curl. If that works, review yor SSL configuration and certificate.

#### nghttp ####

**nghttp** we discussed already for **h2c**. If you use it for a **https:** connection, you will either see the resource or an error like this:

    sh> nghttp https://<yourserver>/
    [ERROR] HTTP/2 protocol was not selected. (nghttp2 expects h2)

There are two possiblities for this which you can check by adding -v. Either your get this:

    sh> nghttp -v https://<yourserver>/
    [  0.034] Connected
    [ERROR] HTTP/2 protocol was not selected. (nghttp2 expects h2)

This means that the TLS library your server uses does not implement ALPN. Getting this installtion correct is sometimes tricky. Use stackoverflow.

Or you get this:

    sh> nghttp -v https://<yourserver>/
    [  0.034] Connected
    The negotiated protocol: http/1.1
    [ERROR] HTTP/2 protocol was not selected. (nghttp2 expects h2)

which means ALPN is working, only the h2 protocol was not selected. You need to check that Protocols is set as described above for yourserver. Try setting it in the general section, in case you do not get it working in a vhost at first.

#### Firefox ####

Update: Steffen Land from [Apache Lounge][11] pointed me to the [HTTP/2 indicator Add-on for Firefox][12]. Nice if you want to see in how many places you already talk h2 (Hint: Apache Lounge talks h2 for some time now...).

In Firefox you can to open the Developer Tools and there the Network tab to check for HTTP/2 connections. When you have those open and reload your html page, you see something like the following:

![](https://icing.github.io/mod_h2/images/firefox-h2.png)

Among the response headers, you see this strange **X-Firefox-Spdy** entry listing "h2". That is the indication that HTTP/2 is used on this **https:** connection.

#### Google Chrome ####

In Google Chrome, you will not see a HTTP/2 indicator in the developer tools. Instead, Chrome uses the special location **chrome://net-internals/#http2** to give information.

If you have opened a page on your server and look at that net-internals page, you will see something like this:

![](https://icing.github.io/mod_h2/images/chrome-h2.png)

If your server is among the ones listed here, it is working.

#### Microsoft Edge ####

HTTP/2 is supported in the Windows 10 successor to Internet Explorer: Edge. Here you can also see the protocol used in the Developer Tools in the Network tab:

![](https://icing.github.io/mod_h2/images/ie-h2.png)

#### Safari ####

In Apple's Safari, you open the Developer Tools and there the Network tab. Reload your server page and select the row in the Developer Tools that shows the load. If you enable the right side details view, look at the **Status**. It should show **HTTP/2.0 200** like here:

![](https://icing.github.io/mod_h2/images/safari-h2.png)

#### Renegotiations ####

Renegotiations on a https: connection means that certain TLS parameters are changed on the running connection. In Apache httpd you can change TLS parameters in directory configurations. If a request arrives for a resource in a certain location, configured TLS parameter are compared to the current TLS parameters. If they differ, renegotiation is triggered.

Most common use cases for this are cipher changes and client certificates. You can require clients to meet authentication only for special locations, or you might enable more secure, but CPU intensive ciphers for specific resources.

Whatever your good use cases are, renegotiation are a **MUST NOT** in HTTP/2. With 100s of requests ongoing on the same connection, which renegotiation would otherwise occur when?

The current **mod_h[ttp]2** does not protect you from such configuration. If you have a site which uses TLS renegotiation, DO NOT enable h2 on it!

Again, we will address that in future releases so that you can enable it safely.

### Restrictions ###

#### Non-HTTP Protocols ####

Modules implementing protocols other than HTTP may be incompatible with **mod_http2**. This will most certainly be the case when this other protocol requires the server to send data first.

**NNTP** is one example of such a protocol. If you have a **mod_nntp_like_ssl** configured in your server, do not even load mod_http2. Wait for the next release.

#### h2c Restrictions ####

There are some restrictions on the **h2c** implementation, you should be aware of:

#### Deny h2c on virtual host ####

You cannot deny **h2c direct** on specific virtual hosts. **direct** gets triggered at connection setup when there is not request to be seen yet. Which makes it impossible to foresee which virtual host Apache needs to look at.

#### Upgrade on request body ####

The **h2c** Upgrade dance will not work on requests that have a body. Those are PUT and POST requests (form submits and uploads). If you write a client, you may precede those requests with a simple GET or an OPTIONS * to trigger the upgrade.

The reason is quite technical in nature, but in case you want to know: during Upgrade, the connection is in a half insane state. The request is coming in HTTP/1.1 format and the response is being written in HTTP/2 frames. If the request carries a body, the server needs to read the whole body before it sends a response back. Because the response might need answers from the client for flow control among other things. But if the HTTP/1.1 request is still being sent, the client is unable to talk HTTP/2 yet.

In order to make behaviour predictable, several server implementors decided to not do an Upgrade in the presence of any request bodies, even small ones.

#### Upgrade on 302s ####

The h2c Upgrade dance also does currently not work when there is a general redirect in place. Seems that rewrite happens before the mod_http2 has a chance to act. Certainly not a deal breaker, but might be confusing when you test a site that has it.

#### h2 Restrictions ####

There are some restrictions on the h2 implementation you should be aware of:

#### Connection Reuse ####

The HTTP/2 protocol allows reuse of TLS connections under certain conditions: if you have a certiface with wildcards or several altSubject names, browsers will reuse any existing connection they might have. Example:

You have a certificate for **a.example.org** that has as additional name **b.example.org**. You open in your browser the url **https://a.example.org/**, open another tab and load **https://b.example.org/**.

Before opening a new connection, the browser sees that it still has the one to **a.example.org** open and that the certificate is also valid for **b.example.org**. So, it sends the request for second tab over the connection of the first one.

This connection reuse is intentional and makes it easier for sites that have invested in sharding for efficiency in HTTP/1 to also benefit from HTTP/2 without much change.

In Apache **mod_h[ttp]2** this is not fully implemented, yet. When **a.example.org** and **b.example.org** are separate virtual hosts, Apache will not allow such connection reuse and inform the browser with status code **421 Misdirected Request** about it. The browser will understand that it has to open a new connection to **b.example.org**. All will work, however some efficiency gets lost.

We expect to have the proper checks in place for the next release.

Münster, 12.10.2015,

Stefan Eissing, greenbytes GmbH

Copying and distribution of this file, with or without modification, are permitted in any medium without royalty provided the copyright notice and this notice are preserved. This file is offered as-is, without warranty of any kind. See LICENSE for details. 


----------

This project is maintained by [icing][13]

--------------------------------------------------------------------------------

via: https://icing.github.io/mod_h2/howto.html

作者：[icing][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/icing
[1]:https://httpd.apache.org/download.cgi
[2]:https://httpd.apache.org/docs/2.4/install.html
[3]:https://nghttp2.org/
[4]:https://icing.github.io/mod_h2/howto.html#https
[5]:https://icing.github.io/mod_h2/howto.html#h2c-restrictions
[6]:https://icing.github.io/mod_h2/howto.html#h2c-restrictions
[7]:https://httpwg.github.io/specs/rfc7540.html#BadCipherSuites
[8]:http://chimera.labs.oreilly.com/books/1230000000545
[9]:https://icing.github.io/mod_h2/howto.html#curl
[10]:https://icing.github.io/mod_h2/howto.html#curl
[11]:https://www.apachelounge.com/
[12]:https://addons.mozilla.org/en-US/firefox/addon/spdy-indicator/
[13]:https://github.com/icing