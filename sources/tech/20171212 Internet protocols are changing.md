Translating by qhwdw Internet protocols are changing
============================================================


![](https://blog.apnic.net/wp-content/uploads/2017/12/evolution-555x202.png)

When the Internet started to become widely used in the 1990s, most traffic used just a few protocols: IPv4 routed packets, TCP turned those packets into connections, SSL (later TLS) encrypted those connections, DNS named hosts to connect to, and HTTP was often the application protocol using it all.

For many years, there were negligible changes to these core Internet protocols; HTTP added a few new headers and methods, TLS slowly went through minor revisions, TCP adapted congestion control, and DNS introduced features like DNSSEC. The protocols themselves looked about the same ‘on the wire’ for a very long time (excepting IPv6, which already gets its fair amount of attention in the network operator community.)

As a result, network operators, vendors, and policymakers that want to understand (and sometimes, control) the Internet have adopted a number of practices based upon these protocols’ wire ‘footprint’ — whether intended to debug issues, improve quality of service, or impose policy.

Now, significant changes to the core Internet protocols are underway. While they are intended to be compatible with the Internet at large (since they won’t get adoption otherwise), they might be disruptive to those who have taken liberties with undocumented aspects of protocols or made an assumption that things won’t change.

#### Why we need to change the Internet

There are a number of factors driving these changes.

First, the limits of the core Internet protocols have become apparent, especially regarding performance. Because of structural problems in the application and transport protocols, the network was not being used as efficiently as it could be, leading to end-user perceived performance (in particular, latency).

This translates into a strong motivation to evolve or replace those protocols because there is a [large body of experience showing the impact of even small performance gains][14].

Second, the ability to evolve Internet protocols — at any layer — has become more difficult over time, largely thanks to the unintended uses by networks discussed above. For example, HTTP proxies that tried to compress responses made it more difficult to deploy new compression techniques; TCP optimization in middleboxes made it more difficult to deploy improvements to TCP.

Finally, [we are in the midst of a shift towards more use of encryption on the Internet][15], first spurred by Edward Snowden’s revelations in 2015\. That’s really a separate discussion, but it is relevant here in that encryption is one of best tools we have to ensure that protocols can evolve.

Let’s have a look at what’s happened, what’s coming next, how it might impact networks, and how networks impact protocol design.

#### HTTP/2

[HTTP/2][16] (based on Google’s SPDY) was the first notable change — standardized in 2015, it multiplexes multiple requests onto one TCP connection, thereby avoiding the need to queue requests on the client without blocking each other. It is now widely deployed, and supported by all major browsers and web servers.

From a network’s viewpoint, HTTP/2 made a few notable changes. First, it’s a binary protocol, so any device that assumes it’s HTTP/1.1 is going to break.

That breakage was one of the primary reasons for another big change in HTTP/2; it effectively requires encryption. This gives it a better chance of avoiding interference from intermediaries that assume it’s HTTP/1.1, or do more subtle things like strip headers or block new protocol extensions — both things that had been seen by some of the engineers working on the protocol, causing significant support problems for them.

[HTTP/2 also requires TLS/1.2 to be used when it is encrypted][17], and [blacklists ][18]cipher suites that were judged to be insecure — with the effect of only allowing ephemeral keys. See the TLS 1.3 section for potential impacts here.

Finally, HTTP/2 allows more than one host’s requests to be [coalesced onto a connection][19], to improve performance by reducing the number of connections (and thereby, congestion control contexts) used for a page load.

For example, you could have a connection for <tt style="box-sizing: inherit;">www.example.com</tt>, but also use it for requests for <tt style="box-sizing: inherit;">images.example.com</tt>. [Future protocol extensions might also allow additional hosts to be added to the connection][20], even if they weren’t listed in the original TLS certificate used for it. As a result, assuming that the traffic on a connection is limited to the purpose it was initiated for isn’t going to apply.

Despite these changes, it’s worth noting that HTTP/2 doesn’t appear to suffer from significant interoperability problems or interference from networks.

#### TLS 1.3

[TLS 1.3][21] is just going through the final processes of standardization and is already supported by some implementations.

Don’t be fooled by its incremental name; this is effectively a new version of TLS, with a much-revamped handshake that allows application data to flow from the start (often called ‘0RTT’). The new design relies upon ephemeral key exchange, thereby ruling out static keys.

This has caused concern from some network operators and vendors — in particular those who need visibility into what’s happening inside those connections.

For example, consider the datacentre for a bank that has regulatory requirements for visibility. By sniffing traffic in the network and decrypting it with the static keys of their servers, they can log legitimate traffic and identify harmful traffic, whether it be attackers from the outside or employees trying to leak data from the inside.

TLS 1.3 doesn’t support that particular technique for intercepting traffic, since it’s also [a form of attack that ephemeral keys protect against][22]. However, since they have regulatory requirements to both use modern encryption protocols and to monitor their networks, this puts those network operators in an awkward spot.

There’s been much debate about whether regulations require static keys, whether alternative approaches could be just as effective, and whether weakening security for the entire Internet for the benefit of relatively few networks is the right solution. Indeed, it’s still possible to decrypt traffic in TLS 1.3, but you need access to the ephemeral keys to do so, and by design, they aren’t long-lived.

At this point it doesn’t look like TLS 1.3 will change to accommodate these networks, but there are rumblings about creating another protocol that allows a third party to observe what’s going on— and perhaps more — for these use cases. Whether that gets traction remains to be seen.

#### QUIC

During work on HTTP/2, it became evident that TCP has similar inefficiencies. Because TCP is an in-order delivery protocol, the loss of one packet can prevent those in the buffers behind it from being delivered to the application. For a multiplexed protocol, this can make a big difference in performance.

[QUIC][23] is an attempt to address that by effectively rebuilding TCP semantics (along with some of HTTP/2’s stream model) on top of UDP. Like HTTP/2, it started as a Google effort and is now in the IETF, with an initial use case of HTTP-over-UDP and a goal of becoming a standard in late 2018\. However, since Google has already deployed QUIC in the Chrome browser and on its sites, it already accounts for more than 7% of Internet traffic.

Read [Your questions answered about QUIC][24]

Besides the shift from TCP to UDP for such a sizable amount of traffic (and all of the adjustments in networks that might imply), both Google QUIC (gQUIC) and IETF QUIC (iQUIC) require encryption to operate at all; there is no unencrypted QUIC.

iQUIC uses TLS 1.3 to establish keys for a session and then uses them to encrypt each packet. However, since it’s UDP-based, a lot of the session information and metadata that’s exposed in TCP gets encrypted in QUIC.

In fact, iQUIC’s current [‘short header’][25] — used for all packets except the handshake — only exposes a packet number, an optional connection identifier, and a byte of state for things like the encryption key rotation schedule and the packet type (which might end up encrypted as well).

Everything else is encrypted — including ACKs, to raise the bar for [traffic analysis][26] attacks.

However, this means that passively estimating RTT and packet loss by observing connections is no longer possible; there isn’t enough information. This lack of observability has caused a significant amount of concern by some in the operator community, who say that passive measurements like this are critical for debugging and understanding their networks.

One proposal to meet this need is the ‘[Spin Bit][27]‘ — a bit in the header that flips once a round trip, so that observers can estimate RTT. Since it’s decoupled from the application’s state, it doesn’t appear to leak any information about the endpoints, beyond a rough estimate of location on the network.

#### DOH

The newest change on the horizon is DOH — [DNS over HTTP][28]. A [significant amount of research has shown that networks commonly use DNS as a means of imposing policy][29] (whether on behalf of the network operator or a greater authority).

Circumventing this kind of control with encryption has been [discussed for a while][30], but it has a disadvantage (at least from some standpoints) — it is possible to discriminate it from other traffic; for example, by using its port number to block access.

DOH addresses that by piggybacking DNS traffic onto an existing HTTP connection, thereby removing any discriminators. A network that wishes to block access to that DNS resolver can only do so by blocking access to the website as well.

For example, if Google was to deploy its [public DNS service over DOH][31]on <tt style="box-sizing: inherit;">www.google.com</tt> and a user configures their browser to use it, a network that wants (or is required) to stop it would have to effectively block all of Google (thanks to how they host their services).

DOH has just started its work, but there’s already a fair amount of interest in it, and some rumblings of deployment. How the networks (and governments) that use DNS to impose policy will react remains to be seen.

Read [IETF 100, Singapore: DNS over HTTP (DOH!)][1]

#### Ossification and grease

To return to motivations, one theme throughout this work is how protocol designers are increasingly encountering problems where networks make assumptions about traffic.

For example, TLS 1.3 has had a number of last-minute issues with middleboxes that assume it’s an older version of the protocol. gQUIC blacklists several networks that throttle UDP traffic, because they think that it’s harmful or low-priority traffic.

When a protocol can’t evolve because deployments ‘freeze’ its extensibility points, we say it has  _ossified_ . TCP itself is a severe example of ossification; so many middleboxes do so many things to TCP — whether it’s blocking packets with TCP options that aren’t recognized, or ‘optimizing’ congestion control.

It’s necessary to prevent ossification, to ensure that protocols can evolve to meet the needs of the Internet in the future; otherwise, it would be a ‘tragedy of the commons’ where the actions of some individual networks — although well-intended — would affect the health of the Internet overall.

There are many ways to prevent ossification; if the data in question is encrypted, it cannot be accessed by any party but those that hold the keys, preventing interference. If an extension point is unencrypted but commonly used in a way that would break applications visibly (for example, HTTP headers), it’s less likely to be interfered with.

Where protocol designers can’t use encryption and an extension point isn’t used often, artificially exercising the extension point can help; we call this  _greasing_  it.

For example, QUIC encourages endpoints to use a range of decoy values in its [version negotiation][32], to avoid implementations assuming that it will never change (as was often encountered in TLS implementations, leading to significant problems).

#### The network and the user

Beyond the desire to avoid ossification, these changes also reflect the evolving relationship between networks and their users. While for a long time people assumed that networks were always benevolent — or at least disinterested — parties, this is no longer the case, thanks not only to [pervasive monitoring][33] but also attacks like [Firesheep][34].

As a result, there is growing tension between the needs of Internet users overall and those of the networks who want to have access to some amount of the data flowing over them. Particularly affected will be networks that want to impose policy upon those users; for example, enterprise networks.

In some cases, they might be able to meet their goals by installing software (or a CA certificate, or a browser extension) on their users’ machines. However, this isn’t as easy in cases where the network doesn’t own or have access to the computer; for example, BYOD has become common, and IoT devices seldom have the appropriate control interfaces.

As a result, a lot of discussion surrounding protocol development in the IETF is touching on the sometimes competing needs of enterprises and other ‘leaf’ networks and the good of the Internet overall.

#### Get involved

For the Internet to work well in the long run, it needs to provide value to end users, avoid ossification, and allow networks to operate. The changes taking place now need to meet all three goals, but we need more input from network operators.

If these changes affect your network — or won’t— please leave comments below, or better yet, get involved in the [IETF][35] by attending a meeting, joining a mailing list, or providing feedback on a draft.

Thanks to Martin Thomson and Brian Trammell for their review.

 _Mark Nottingham is a member of the Internet Architecture Board and co-chairs the IETF’s HTTP and QUIC Working Groups._

--------------------------------------------------------------------------------

via: https://blog.apnic.net/2017/12/12/internet-protocols-changing/

作者：[ Mark Nottingham ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.apnic.net/author/mark-nottingham/
[1]:https://blog.apnic.net/2017/11/17/ietf-100-singapore-dns-http-doh/
[2]:https://blog.apnic.net/author/mark-nottingham/
[3]:https://blog.apnic.net/category/tech-matters/
[4]:https://blog.apnic.net/tag/dns/
[5]:https://blog.apnic.net/tag/doh/
[6]:https://blog.apnic.net/tag/guest-post/
[7]:https://blog.apnic.net/tag/http/
[8]:https://blog.apnic.net/tag/ietf/
[9]:https://blog.apnic.net/tag/quic/
[10]:https://blog.apnic.net/tag/tls/
[11]:https://blog.apnic.net/tag/protocol/
[12]:https://blog.apnic.net/2017/12/12/internet-protocols-changing/#comments
[13]:https://blog.apnic.net/
[14]:https://www.smashingmagazine.com/2015/09/why-performance-matters-the-perception-of-time/
[15]:https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/46197.pdf
[16]:https://http2.github.io/
[17]:http://httpwg.org/specs/rfc7540.html#TLSUsage
[18]:http://httpwg.org/specs/rfc7540.html#BadCipherSuites
[19]:http://httpwg.org/specs/rfc7540.html#reuse
[20]:https://tools.ietf.org/html/draft-bishop-httpbis-http2-additional-certs
[21]:https://datatracker.ietf.org/doc/draft-ietf-tls-tls13/
[22]:https://en.wikipedia.org/wiki/Forward_secrecy
[23]:https://quicwg.github.io/
[24]:https://blog.apnic.net/2016/08/30/questions-answered-quic/
[25]:https://quicwg.github.io/base-drafts/draft-ietf-quic-transport.html#short-header
[26]:https://www.mjkranch.com/docs/CODASPY17_Kranch_Reed_IdentifyingHTTPSNetflix.pdf
[27]:https://tools.ietf.org/html/draft-trammell-quic-spin
[28]:https://datatracker.ietf.org/wg/doh/about/
[29]:https://datatracker.ietf.org/meeting/99/materials/slides-99-maprg-fingerprint-based-detection-of-dns-hijacks-using-ripe-atlas/
[30]:https://datatracker.ietf.org/wg/dprive/about/
[31]:https://developers.google.com/speed/public-dns/
[32]:https://quicwg.github.io/base-drafts/draft-ietf-quic-transport.html#rfc.section.3.7
[33]:https://tools.ietf.org/html/rfc7258
[34]:http://codebutler.com/firesheep
[35]:https://www.ietf.org/


