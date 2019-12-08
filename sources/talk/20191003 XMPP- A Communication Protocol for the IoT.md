[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (XMPP: A Communication Protocol for the IoT)
[#]: via: (https://opensourceforu.com/2019/10/xmpp-a-communication-protocol-for-the-iot/)
[#]: author: (Neetesh Mehrotra https://opensourceforu.com/author/neetesh-mehrotra/)

XMPP: A Communication Protocol for the IoT
======

[![][1]][2]

_Formerly developed by the Jabber open source community in 1999 (and initially known as Jabber), the Extensible Messaging and Presence Protocol (XMPP) is now widely used as a communication protocol. Based on Extensible Markup Language (XML), XMPP enables fast, near-real-time exchange of data between multiple entities on a network._

In contrast to most direct messaging protocols, XMPP is described in an open standard and uses an open systems approach of development and application, by which anyone may implement an XMPP service and interoperate with other organisations’ implementations. Since XMPP is an open set of rules, implementations can be developed using any software licence, and many server, client, and library XMPP implementations are distributed as free and open source software. Numerous freeware and commercial software implementations also exist.

**XMPP: An overview**
XMPP is an open set of rules for streaming XML elements in order to swap messages and presence information in close to real-time. The XMPP protocol is based on the typical client server architecture, in which the XMPP client uses the XMPP server with the TCP socket.
XMPP provides a general framework for messaging across a network, offering a multitude of applications beyond traditional instant messaging (IM) and the distribution of presence data. It enables the discovery of services residing locally or across a network, as well as finding out about the availability of these services.
XMPP is well-matched for cloud computing where virtual machines, networks and firewalls would otherwise present obstacles to alternative service discovery and presence-based solutions. Cloud computing and storage systems rely on diverse forms of communication over multiple levels, including not only messaging between systems to relay state but also the migration of the distribution of larger objects, like storage or virtual machines. Along with validation and in-transit data protection, XMPP can be useful at many levels and may prove ideal as an extensible middleware or a message-oriented middleware (MOM) protocol.

![Figure 1: XMPP IM conversation][3]

**Comparisons with MQTT**
Given below are a few comparisons between the XMPP and MQTT protocols.

  * MQTT is a lightweight publisher/subscriber protocol, which makes it a clear choice when implementing M2M on memory-constrained devices.
  * MQTT does not define a message format; with XMPP you can define the message format and get structured data from devices. The defined structure helps validate messages, making it easier to handle and understand data coming from these connected devices.
  * XMPP builds a device’s identity (also called a Jabber ID). In MQTT, identities are created and managed separately in broker implementations.
  * XMPP supports federation, which means that devices from different manufacturers connected to different platforms can talk to each other with a standard communication protocol.
  * MQTT has different levels of quality of service. This flexibility is not available in XMPP.
  * MQTT deployments become difficult to manage when the number of devices increases, while XMPP scales very easily.



**The pros and cons of XMPP**

_**Pros**_

  * Addressing scheme to recognise devices on the network
  * Client-server architecture
  * Decentralised
  * Flexible
  * Open standards and formalised



_**Cons**_

  * Text-based messaging and no provision for end-to-end encryption
  * No provision for quality of service
  * The data flow is usually more than 70 per cent of the XMPP protocol server, of which nearly 60 per cent is repeated; the XMPP protocol has a large overhead of data to multiple recipients
  * Absence of binary data
  * Limited scope for stability



![Figure 2: XML stream establishment][4]

**How the XMPP protocol manages communication between an XMPP client and server**
The features of the XMPP protocol that impact communication between the XMPP client and the XMPP server are described in Figure 1.
Figure 2 depicts an XML message swap between client ‘Mike’ and server ‘Ollie.org’.

  * XMPP uses Port 5222 for the client to server (C2S) communication.
  * It utilises Port 5269 for server to server (S2S) communication.
  * Discovery and XML streams are used for S2S and C2S communication.
  * XMPP uses security mechanisms such as TLS (Transport Layer Security) and SASL (Simple Authentication and Security Layer).
  * There are no in-between servers for federation, unlike e-mail.



Direct messaging is used as a method for immediate message transmission to and reception from online users (Figure 3).

![Figure 3: Client server communication][5]

**XMPP via HTTP**
As an alternative to the TCP protocol, XMPP can be used with HTTP in two ways: polling and binding. The polling method, now deprecated, essentially implies that messages stored on a server-side database are acquired by an XMPP client by way of HTTP ‘GET’ and ‘POST’ requests. Binding methods are applied using bi-directional streams over synchronous HTTP permit servers to push messages to clients as soon as they are sent. This push model of notification is more efficient than polling, wherein many of the polls return no new data.
XMPP provides a lot of support for communication, making it well suited for use within the realm of the Internet of Things.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/xmpp-a-communication-protocol-for-the-iot/

作者：[Neetesh Mehrotra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/neetesh-mehrotra/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2017/06/IoT-Connecting-all-apps.jpg?resize=696%2C592&ssl=1 (IoT Connecting all apps)
[2]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2017/06/IoT-Connecting-all-apps.jpg?fit=1675%2C1425&ssl=1
[3]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Figure-1-XMPP-IM-conversation.jpg?resize=261%2C287&ssl=1
[4]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Figure-2-XML-stream-establishment-350x276.jpg?resize=350%2C276&ssl=1
[5]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Figure-3-Client-server-communication.jpg?resize=350%2C146&ssl=1
