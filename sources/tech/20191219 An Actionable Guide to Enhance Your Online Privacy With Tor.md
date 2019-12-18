[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An Actionable Guide to Enhance Your Online Privacy With Tor)
[#]: via: (https://itsfoss.com/tor-guide/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

An Actionable Guide to Enhance Your Online Privacy With Tor
======

In a world where technology is rapidly evolving, companies are gathering data and information from users in order to optimize the functionality of their applications as much as possible, privacy has slowly begun to fade and look like a myth.

Many people believe that completely concealing their identity online is a difficult process that cannot be achieved. But of course, for security experts and for those who are optimistic that anonymity will not be lost, the answer is that we can enhance anonymity on the Internet.

This can clearly be achieved with the help of _Tor_. Tor stands for The Onion Routing.

Tor is a free and open source software developed by the [Tor project][1], a non-profit organization focusing on the freedom and privacy of users on the Internet.

![Tor Onion][2]

Let’s see below how you can enhance our online privacy with Tor.

### What is Tor?

As I mentioned before, Tor is a free open source software which defends users’ privacy. Specifically, The Onion Router software is being used by students, companies, universities, reporters who maybe want to share an idea anonymously for many years. In order to conceal users’ identities, Tor routes traffic through a worldwide overlay network which consisting of thousand of relays.

![Tor Network][3]

In addition, it has a very handy functionality as it encrypts the data multiple times, including the next IP address for the node it is intended for, and sends it through a virtual circuit that includes a random node. Each node decrypts a layer of encrypted information in order to reveal the next node. The result is that the remaining encrypted information will be decrypted at the last node without revealing the source IP address. This process builds the Tor circuit.

### How to install Tor on Linux

Since Tor is one of the most popular software in the open source community, it can be found in almost every Linux distribution’s repository.

For Ubuntu-based distributions, it is available in the universe repository. We have a separate article on [installing Tor browser on Ubuntu][4] which you may refer. It also has a few tips on using the browser that you may find useful.

I am using Debian 10 so I’ll mention the steps for installing Tor on Debian:

All you have to do is to add the backport repository to our sources.list and then we can easily install Tor and its components. Use the following commands:

```
echo "deb http://deb.debian.org/debian buster-backports main contrib" > /etc/apt/sources.list.d/buster-backports.list

sudo apt update
sudo apt install tor torbrowser-launcher
```

Remember!

Do not run Tor as root, as it is not secure for your operating system. It is recommended to run it as a normal user.

### What can you achieve with Tor?

As we move on, you will see numerous privacy enhancements that can be impressively accomplished with Tor.

Particularly, below we will see the topics that will be covered:

  * Explore the Tor Network with Tor Browser
  * Use Tor through Firefox



Note: It would be helpful to take into consideration that Tor can be used alongside with many applications, so anyone can privately use the application she/he desires.

  * Create a hidden Tor service
  * Create a middle Tor relay



#### Explore the Tor network with Tor browser

To connect to the Tor network through the Tor browser, open the application that will be with the rest of your internet applications or type in the terminal:

```
torbrowser-launcher
```

Initially, a window will appear, which allows some settings to be modified in the connection. For example, for users who wish to access the Tor network, and their country does not allow them, they must have the necessary settings for a successful connection.

![Tor Network Settings][5]

You can always request a bridge from the Tor Database, [BridgeDB][6].

If everything is under control, all that’s left is to connect.

![Tor Browser][7]

_**Welcome to Tor..**_

It is worth mentioning that it would be helpful and safe to avoid adding extensions to Tor Browser as it can reveal user’s real location and IP address to the website operators.

It is also recommended to avoid downloading torrents, to avoid IP revealing.

_**Let the exploration begin ..**_

#### How to use Tor through Firefox

You don’t always need to use the Tor browser. The [awesome Firefox][8] allows you to use Tor network.

In order to connect to tor network via Firefox, you must first open the tor service. To do this, execute the following command:

```
sudo service tor start
```

To ensure that the tor is active, you can observe the open links. Below you can see the running port, which is the 9050.

```
netstat -nvlp
```

Here’s the output:

```
..     ..              ..                         ..                      ..

tcp        0      0 127.0.0.1:9050          0.0.0.0:*               LISTEN
```

The only thing left to do is to set Firefox to be connected through Tor proxy.

Go to Preferences → General → Network Proxy and set the localhost IP and Tor listening port to SOCKS v5 as shows below:

![Setting Tor in Firefox][9]

#### How to create a Tor Hidden Service

Ttry to search for the term “Hidden Wiki”, you will notice that you will not find any hidden content. This is because the content discussed above does not represent the standard domain, but a top-level domain that can be found through Tor. This domain is .onion.

So let’s see how you can create your own _**secret onion service**_.

With the installation of Tor, torrc was created. The torrc is the tor configuration file, and its path is /etc/tor/torrc.

Note: In order for modification to be applied, the ‘#’ symbol must be removed from the start of the line.

To create the onion service you need to modify the configuration file so that after its modification it contains our service.

You can open the file with a [command line text editor][10] of your choice. Personally, my favourite text editor is Vim. If Vim is used and you have any difficulty, you can take a look at the following article to make the situation clearer.

In torrc you will find a lot of content, which can, in any case, be analyzed in a related article. For the time being, we are interested in the line mentioned by “Hidden Service”.

![][11]

At first glance, it can be understood that a path, a network address and finally two doors should be set.

```
HiddenServiceDir  /var/lib/tor/hidden_service/
```

‘HiddenServiceDir’ denotes the path the hostname will generate, which will then be the user visit point to the secret service created.

HiddenServicePort 80 127.0.0.1:80

‘HiddenServicePort’ indicates which address and port the .onion service will be connected to.

For example, below is the creation of a hidden service named linuxhandbook, which as a port destination will have port 80, as the address will have localhost’s IP and port 80 respectively.

![][12]

Finally, the only thing left to complete the creation is to restart the tor service. Once the tor is restarted, the /var/lib/tor// path will have both the public and private secret service key, as well as the hostname file. The ‘Hostname’ file contains the .onion link provided for our onion site.

Here is the output of my ‘hostname’ file.

```
ogl3kz3nfckz22xp4migfed76fgbofwueytf7z6d2tnlh7vuto3zjjad.onion
```

Just visit this link through your Tor Browser and you will see your up and running server based on a .onion domain.

![Sample Onion Web Page][13]

#### How to Create a Middle Tor Relay

The Tor network, as mentioned before, is an open network, which consists of many nodes. Tor nodes are a creation of volunteers, that is, contributors to enhancing privacy. It is worth noting that the nodes are over 7000 and they are getting bigger day by day. Everyone’s contribution is always acceptable as we expand one of the predominantly largest networks worldwide.

Tor contains Guard, Middle and Exit Relays. A Guard Relay is the the first relay of a Tor circuit. The Middle Relay is the second hop of the circuit. Guard and Middle Relays are listed in the public list of Tor relays. Exit Relay is the final relay of a tor circuit. It is a crucial relay, as it sends traffic out its destination.

All relays are meaningful but in this article, we will cover about Middle relays.

Here’s and image showing middle-relay traffic the last two months.

![][14]

Lets see how we can create a middle relay.

Once again, in order to create your own middle relay, you have to modify the torrc file.

In any case, as I mentioned above, you can uncomment the lines when you need your configuration to be enabled.

However, it is feasible to copy the following lines and then modify them.

```
#change the nickname “Linuxhandbook” to a name that you like
Nickname Linuxhandbook
ORPort 443
ExitRelay 0
SocksPort 0
ControlSocket 0
#change the email address below and be aware that it will be published
ContactInfo [email protected]
```

An explanation should make the situation clearer.

  * Nickname: Set your own relay name.
  * ORPort: Set a port which will be the relay’s listening port.
  * ExitRelay: By default, is set to 0, we want to create a middle relay.



Note: tor service needs to be open.

You should see your middle-relay up and running in Tor Metrics after a few couple of hours. Therefore, it usually takes 3 hours to be published, according to [Tormetrics][15].

Warning!

For sure, some of you may have heard of the term “Deep Web”, “Hidden Wiki” and many other services that you haven’t been able to visit yet. Besides, you may have heard that there is content posted on the Tor network which may be illegal.

In the Tor network, one can find almost anything, such as forums with any kind of discussion. Quite right, since there is no censorship in a network whose entities are anonymous. This is both good and bad at the same time.

I am not going to give sermons here about what you should use and what you should not use. I believe that you are sensible enough to make that decision.

In conclusion, you can thoroughly see, that one can, in any case, enhance their privacy as well as defend themselves from Internet censorship. I would love to hear your opinion about Tor.

##### Panos

Penetration Tester and Operating System developer

Panos’ love for Free Open Source Software is invaluable. In his spare time, he observes the night sky with his telescope.

--------------------------------------------------------------------------------

via: https://itsfoss.com/tor-guide/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://www.torproject.org/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/tor_onion.jpg?ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/tor-network-diagram.png?ssl=1
[4]: https://itsfoss.com/install-tar-browser-linux/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/tor_browser.png?ssl=1
[6]: https://www.bridgedb.org/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/tor_firefox.jpg?ssl=1
[8]: https://itsfoss.com/why-firefox/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/tor_settings.png?ssl=1
[10]: https://itsfoss.com/command-line-text-editors-linux/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/create_tor_relay.jpg?ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/create_tor_relay_2.jpg?ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/onion_web_page.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/tor_relay.jpg?ssl=1
[15]: https://metrics.torproject.org/
