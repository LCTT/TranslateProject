translating by firmianay

DYNAMIC PORT FORWARDING / MOUNT A SOCKS SERVER WITH SSH
=================

In the previous entry, [Creating TCP / IP (port forwarding) tunnels with SSH: The 8 scenarios possible using OpenSSH][17], we saw all the possibilities we have at our disposal for  _port forwarding_ … but for static port forwarding. That is, we only saw cases where we wanted to access only a port of another system by chan- ging it through the SSH connection.

However, in that entry we left in the forefront the dynamic forwarding of ports and several, eral readers missed it, so that this entry will try to complement it (thanks to those who suggest this).

When we talk about doing  _dynamic port forwarding_  with SSH, what we are talking about is exactly converting SSH into a [SOCKS][2] server. And what is a SOCKS server?

Do you know what a[web proxy is for][3]? Probably yes, many companies use one. It is a system directly connected to the Internet that allows clients of an [intranet][4] without Internet access to navigate the web if they configure their browsers to make their requests through the proxy ( [although there are also transparent proxies][5] ). A web proxy, besides allowing the output to the Internet, will also cache pages, images, etc. Already downloaded by some client so you do not have to download them for another client. In addition, it allows to filter the contents and to monitor the activity of the users. However, its basic function is to forward HTTP and HTTPS traffic.

A SOCKS server would give a service similar to the intranet of a company that provides a proxy server but is not limited to HTTP / HTTPS, but allows to forward any TCP / IP traffic (with SOCKS 5 also UDP).

For example, imagine that we want to use our mail using POP3 or ICMP and SMTP with Thunderbird from an intranet without direct Internet access. If we only have a web proxy available, the only simple one we would use would be to use some webmail (although if it is a webmail we could also use the [Thunderbird Webmail extension][6]). We could also take advantage of the proxy by [tunneling over HTTP][7]. But the simplest thing would be that the network had a SOCKS server available that would allow us to use POP3, ICMP and SMTP through it without any inconvenience.

Although there is a lot of software to configure very specialized SOCKS servers, setting up one with OpenSSH could be as simple as:

> ```
> Clientessh $ ssh -D 1080 user @ servidorssh
> ```

Or we could improve it a bit with:

> ```
> Clientessh $ ssh -fN -D 0.0.0.0:1080 user @ servidorssh
> ```

Where:

*   The option `-D`is similar to the options `-L`and `-R`static port forwarding. Like these, with this we can make the client listen only the local requests or those arriving from other nodes, depending on which address we associate the request:

    > ```
    > -D [bind_address:] port
    > ```

    While in static port forwarding we saw that we could do reverse port forwarding with the option `-R`, with dynamic forwarding is not possible. We can only create the SOCKS server on the SSH client side, not on the SSH server side.

*   1080 is the typical port for SOCKS servers, just as 8080 is typical for web proxy servers.

*   The option `-N`prevents a remote shell interactive session from actually being launched. It is useful when we only do the `ssh`to establish this tunnel.

*   The option `-f`causes `ssh`it to stay in the background and disassociates itself from the current shell, so that the process becomes a daemon. It does not work without the option `-N`(or without specifying a command), otherwise an interactive shell would be incompatible with the process being in the background.

Using <noindex style="box-sizing: inherit;">[PuTTY][8]</noindex> is also very simple to redirect ports. The equivalent of a ” `ssh -D 0.0.0.0:1080`” would be to use this configuration:

![PuTTY SOCKS](https://wesharethis.com/wp-content/uploads/2017/07/putty_socks.png)

For an application to access another network through a SOCKS server, it is convenient (although not necessary) that the application specifically supports it, just as browsers support using a proxy server. Browsers, such as Firefox or Internet Explorer, are examples of applications prepared to use a SOCKS server to access another network:

![Firefox SOCKS](https://wesharethis.com/wp-content/uploads/2017/07/firefox_socks.png)

![Internet Explorer SOCKS](https://wesharethis.com/wp-content/uploads/2017/07/internetexplorer_socks.png)

Note: Capture has been obtained using <noindex style="box-sizing: inherit;">[IEs 4 Linux][1]</noindex> : Highly recommended if you need Internet Explorer and use Linux!

However, it is not precisely the browsers that most often require a SOCKS server, since they usually are better arranged with the proxy server.

But for example, the Thunderbird also allows and that is useful:

![Thunderbird SOCKS](https://wesharethis.com/wp-content/uploads/2017/07/thunderbird_socks.png)

Another example: the <noindex style="box-sizing: inherit;">[Spotify][9]</noindex> client also supports SOCKS:

![Spotify SOCKS](https://wesharethis.com/wp-content/uploads/2017/07/spotify_socks.png)

Something to keep in mind is name resolution. Sometimes we will find that in the current network we can not resolve the names of the systems that we want to access on the other side of the SOCKS server. SOCKS 5 also allows us to tunnel DNS requests (as is UDP allows us to SOCKS 5) and send them to the other end: It is possible to specify if we want to resolve locally or remotely (or maybe test both). Applications that support this also have to take this into account. For example, Firefox has the parameter network.proxy.socks_remote_dns (in it `about:config`) that allows us to specify that it is resolved remotely. By default it is resolved locally.

Thunderbird also supports the parameter `network.proxy.socks_remote_dns`, but since we do not have an address bar to place `about:config`, we can change it, as we read in [MozillaZine: about: config][10], in Tools → Options → Advanced → General → Config Editor (button).

Applications that do not specifically support SOCKS can be “socksified”. This will work well with many applications that use TCP / IP without problems, but not with all. “Socksifier” consists of loading an additional library that detects requests to the TCP / IP stack and modifying them to redirect them through the SOCKS server, so that the communication goes through without the application being specifically programmed with SOCKS support .

There are “Socksifiers” for Windows and for [Linux.][18]

For Windows we have for example the SocksCap, a closed but free product for non-commercial use that I have used very satisfactorily for a long time. SocksCap was made by a company called Permeo which was the company that created SOCKS reference technology. Permeo was bought by [Blue Coat][11] and it [discontinued the SocksCap][12]. You can still find the file very well `sc32r240.exe`on the Internet. Also for Windows, and free code, there is the [FreeCap][13], of appearance and use very, very similar to the SocksCap. However, it works much worse and has been maintenance-free for years. It seems that its author has preferred to dedicate his efforts to a new product this time of payment, the [WideCap][14].

This is the aspect of the SocksCap when we have “socksified” several applications. These applications will access the network through the SOCKS server when we launch them from here:

![SocksCap](https://wesharethis.com/wp-content/uploads/2017/07/sockscap.png)

In the configuration dialog we will see that if we choose the protocol SOCKS 5, we can choose where the names have to be resolved, locally or remotely:

![SocksCap settings](https://wesharethis.com/wp-content/uploads/2017/07/sockscap_settings.png)

On Linux, as always, we have many alternatives to a single remote command. In Debian / Ubuntu, the output of the command:

> ```
> $ Apt-cache search socks
> ```

Will show us many of them

The best known to me are the [tsocks][15] and the [proxychains][16]. They work in much the same way: Just launch the application that we want to “socksify” with them and that’s it. An example using `proxychains`y `wget`:

> ```
> $ Proxychains wget http://www.google.com
> ProxyChains-3.1 (http://proxychains.sf.net)
> --19: 13: 20-- http://www.google.com/
> Resolving www.google.com ... 
> DNS-request | Www.google.com
> | S-chain | - <- - 10.23.37.3:1080-<><>-4.2.2.2:53-<><>-OK
> | DNS-response | Www.google.com is 72.14.221.147
> 72.14.221.147
> Connecting to www.google.com | 72.14.221.147 |: 80 ... 
> | S-chain | - <- - 10.23.37.3:1080-<><>-72.14.221.147:80-<><>-OK
> Connected.
> HTTP request sent, awaiting response ... 200 OK
> Length: unspecified [text / html]
> Saving to: `index.html '
> 
>     [<=>] 6,016 24.0K / s in 0.2s
> 
> 19:13:21 (24.0 KB / s) - `index.html 'saved [6016]
> ```

For this to work, you must specify the proxy server that we want to use in `/etc/proxychains.conf`:

> ```
> [ProxyList]
> Socks5 clientessh 1080
> ```

We can also tell you that DNS requests are made remotely:

> ```
> # Proxy DNS requests - no leak for DNS data
> Proxy_dns
> ```

Also, in the previous output, we have seen several informative messages of the same `proxychains`, not `wget`in lines marked with strings `|DNS-request|`, `|S-chain|`or `|DNS-response|`. If we do not want to see them, we can also adjust it in the configuration:

> ```
> # Quiet mode (no output from library)
> Quiet_mode
> ```

--------------------------------------------------------------------------------

via: https://wesharethis.com/2017/07/15/dynamic-port-forwarding-mount-socks-server-ssh/

作者：[Ahmad][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://wesharethis.com/author/ahmad/
[1]:https://wesharethis.com/goto/http://www.tatanka.com.br/ies4linux/page/Main_Page
[2]:https://wesharethis.com/goto/http://en.wikipedia.org/wiki/SOCKS
[3]:https://wesharethis.com/goto/http://en.wikipedia.org/wiki/Proxy_server
[4]:https://wesharethis.com/goto/http://en.wikipedia.org/wiki/Intranet
[5]:https://wesharethis.com/goto/http://en.wikipedia.org/wiki/Proxy_server#Transparent_and_non-transparent_proxy_server
[6]:https://wesharethis.com/goto/http://webmail.mozdev.org/
[7]:https://wesharethis.com/goto/http://en.wikipedia.org/wiki/HTTP_tunnel_(software)
[8]:https://wesharethis.com/goto/http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
[9]:https://wesharethis.com/goto/https://www.spotify.com/int/download/linux/
[10]:https://wesharethis.com/goto/http://kb.mozillazine.org/About:config
[11]:https://wesharethis.com/goto/http://www.bluecoat.com/
[12]:https://wesharethis.com/goto/http://www.bluecoat.com/products/sockscap
[13]:https://wesharethis.com/goto/http://www.freecap.ru/eng/
[14]:https://wesharethis.com/goto/http://widecap.ru/en/support/
[15]:https://wesharethis.com/goto/http://tsocks.sourceforge.net/
[16]:https://wesharethis.com/goto/http://proxychains.sourceforge.net/
[17]:https://wesharethis.com/2017/07/14/creating-tcp-ip-port-forwarding-tunnels-ssh-8-possible-scenarios-using-openssh/
[18]:https://wesharethis.com/2017/07/10/linux-swap-partition/
