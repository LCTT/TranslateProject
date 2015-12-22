Turn Tor socks to http
================================================================================
![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/12/tor-593x445.jpg)

For using Tor service you can use diffrent tools like Tor browser, Foxyproxy and other things, some download managers such as Wget or Aria2 can’t get Tor socks directly and start downloading anonymously with that so we need some tools to change Tor socks to http and then download with that.

**Note** : This tutorial is under Debian distrobutions and in other distrobutions may be diffrent so if your distro is Debian base and you have configured Tor correctly go a head !

**Polipo** : This service uses 8123 Port and 127.0.0.1 IP, use following command to install Polipo on your computer :

    sudo apt install polipo

Now use this command to go in Polipo config file:

    sudo nano /etc/polipo/config

Add the following lines to the end of the file :

    proxyAddress = "::0"
    allowedClients = 192.168.1.0/24
    socksParentProxy = "localhost:9050"
    socksProxyType = socks5

Restart the Polipo service with this command :

    sudo service polipo restart

Now Polipo is ready ! do what ever you like in anonymous world ! as example of how using it :

    pdmt -l "link" -i 127.0.01 -p 8123

With command above, PDMT ( Persian Download Manager Terminal ) will download your file anonymously.

**Proxychains** : In this service you can set Tor or Lantern proxy to turn socks too but in usage it’s a little diffrent  with Polipo and Privoxy because you don’t need to use any port ! for installing that use following command :

    sudo apt install proxychains

Open config file with this command :

    sudo nano /etc/proxychains.conf

Now add the following code to the end of text, this code is Tor port and Ip :

    socks5 127.0.0.1 9050

If you put “proxychains” word before a command in terminal and run it, it would run by Tor proxy :

    proxychains firefoxt
    proxychains aria2c
    proxychains wget

**Privoxy** : Privoxy uses 8118 port and it’s easy to run first install privoxy package :

    sudo apt install privoxy

We should change the config file now :

    sudo nano /etc/pivoxy/config

Add the following lines to end of the file :

    forward-socks5 / 127.0.0.1:9050  .
    forward-socks4a / 127.0.0.1:9050 .
    forward-socks5t             /     127.0.0.1:9050 .
    forward         192.168.*.*/     .
    forward            10.*.*.*/     .
    forward           127.*.*.*/     .
    forward           localhost/     .

Restart the service :

    sudo service privoxy restart

Service is ready ! port is 8118 and Ip is 127.0.0.1 use it and enjoy from it !

--------------------------------------------------------------------------------

via: http://www.unixmen.com/turn-tor-socks-http/

作者：[Hossein heydari][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/hossein/