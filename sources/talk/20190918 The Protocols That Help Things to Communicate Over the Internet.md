[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Protocols That Help Things to Communicate Over the Internet)
[#]: via: (https://opensourceforu.com/2019/09/the-protocols-that-help-things-to-communicate-over-the-internet/)
[#]: author: (Sapna Panchal https://opensourceforu.com/author/sapna-panchal/)

The Protocols That Help Things to Communicate Over the Internet
======

[![][1]][2]

_The Internet of Things is a system of connected, interrelated objects. These objects transmit data to servers for processing and, in turn, receive messages from the servers. These messages are sent and received using different protocols. This article discusses some of the protocols related to the IoT._

The Internet of Things (IoT) is beginning to pervade more and more aspects of our lives. Everyone, everywhere is using the Internet of Things. Using the Internet, connected things are used to collect information, convey/send information back, or do both. IoT is an architecture that is a combination of available technologies. It helps to make our daily lives more pleasant and convenient.

![Figure 1: IoT architecture][3]

![Figure 2: Messaging Queuing Telemetry protocol][4]

**IoT architecture**
Basically, IoT architecture has four components. In this article, we will explore each component to understand the architecture better.

  * **Sensors:** These are present everywhere. They help to collect data from any location and then share it to the IoT gateway. As an example, sensors sense the temperature at different locations, which helps to gauge the weather conditions. And this information is shared or passed to the IoT gateway. This is a basic example of how the IoT operates.
  * **IoT gateway:** Once the information is collected from the sensors, it is passed on to the gateway. The gateway is a mediator between sensor nodes and the World Wide Web. So basically, it processes the data that is collected from sensor nodes and then transmits this to the Internet infrastructure.
  * **Cloud server:** Once data is transmitted through the gateway, it is stored and processed in the cloud server.
  * **Mobile app:** Using a mobile application, the user can view and access the data processed in the cloud server.



This is the basic idea of the IoT and its architecture, along with the components. We now move on to the basic ideas behind different IoT protocols.

**IoT protocols**
As mentioned earlier, connected things are used to collect information, convey/send information back, or do both, using the Internet. This is the fundamental basis of the IoT. To convey/send information, we need a protocol, which is a set of procedures that is used to transmit the data between electronic devices.
Essentially, we have two types of IoT protocols — the IoT network protocols and the IoT data protocols. This article discusses the IoT data protocols.

![Figure 3: Advance Message Queuing Protocol][5]

![Figure 4: CoAP][6]

**MQTT**
The Messaging Queuing Telemetry Transmit (MQTT) protocol was primarily designed for low bandwidth networks, but is very popular today as an IoT protocol. It is used to exchange data between clients and the server. It is a lightweight messaging protocol.

This protocol has many advantages:

  * It is small in size and has low power usage.
  * It is a lightweight protocol.
  * It is based on low network usage.
  * It works entirely in real-time.



Considering all the above reasons, MQTT emerges as the perfect IoT data protocol.

**How MQTT works:** MQTT is based on a client-server relationship. The server manages the requests that come from different clients and sends the required information to clients. MQTT is based on two operations.
i) _Publish:_ When the client sends data to the MQTT broker, this operation is known as ‘Publish’.
ii) _Subscribe:_ When the client receives data from the broker, this operation is known as‘Subscribe’.

The MQTT broker is the mediator that handles these operations, primarily taking messages and delivering them to the application or client.

Let’s look at the example of a device temperature sensor, which sends readings to the MQTT broker, and then information is delivered to desktop or mobile applications. As stated earlier, ‘Publish’ means sending readings to the MQTT broker and ‘Subscribe’ means delivering the information to the desktop/mobile application.

**AMQP**
Advanced Message Queuing Protocol is a peer-to-peer protocol, where one peer plays the role of the client application and the other peer plays the role of the delivery service or broker. It is the combination of hard and fast components that basically routes and saves messages within the delivery service or broker carrier.

The benefits of AMQP are:

  * It helps to send messages without them getting missed out.
  * It helps to guarantee a ‘one-time only’ and secured delivery.
  * It provides a secure connection.
  * It always supports acknowledgments for message delivery or failure.



**How AMQP works and its architecture:** The AMQP architecture is made up of the following parts.

_**Exchange**_ – Messages that come from the publisher are accepted by Exchange, which routes them to the message queue.

_**Message queue**_ – This is the combination of multiple queues and is helpful for processing the messages.

_**Binding**_ – This helps to maintain the connectivity between Exchange and the message queue.
The combination of Exchange and the message queues is known as the broker or AMQP broker.

![Figure 5: Constrained Application Protocol architecture][7]

**Constrained Application Protocol (CoAP)**
This was initially used as a machine-to-machine (M2M) protocol, and later began to be used as an IoT protocol. It is a Web transfer protocol that is used with constrained nodes and constrained networks. CoAP uses the RESTful architecture, just like the HTTP protocol.
The advantages CoAP offers are:

  * It works as a REST model for small devices.
  * As this is like HTTP, it’s easy for developers to work on.
  * It is a one-to-one protocol for transferring information between the client and server, directly.
  * It is very simple to parse.



**How CoAP works and its architecture:** From Figure 4, we can understand that CoAP is the combination of ‘Request/Response and Message’. We can also say it has two layers – ‘Request/Response’and ‘Message’.
Figure 5 clearly explains that CoAP architecture is based on the client server relationship, where…

  * The client sends requests to the server.
  * The server receives requests from the client and responds to them.



**Extensible Messaging and Presence Protocol (XMPP)**
This protocol is used to exchange messages in real-time. It is used not only to communicate with others, but also to get information on the status of the user (away, offline, active). This protocol is widely used in real life, like in WhatsApp.
The Extensible Messaging and Presence Protocol should be used because:

  * It is free, open and easy to understand. Hence, it is very popular.
  * It has secured authentication, is extensible and flexible.



![Figure 6: Extensible Messaging and Presence Protocol][8]

**How XMPP works and its architecture:** In the XMPP architecture, each client has a unique name associated with it and communicates to other clients via the XMPP server. The XMPP client has either the same domain or a different one.

In Figure 6, the XMPP client belongs to the same domain in which one XMPP client sends the information to the XMPP server. The server translates it and conveys the information to another client.
Basically, this protocol is the backbone that provides universal connectivity between different endpoint protocols.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/09/the-protocols-that-help-things-to-communicate-over-the-internet/

作者：[Sapna Panchal][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/sapna-panchal/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Internet-of-things-illustration.jpg?resize=696%2C439&ssl=1 (Internet of things illustration)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Internet-of-things-illustration.jpg?fit=1125%2C710&ssl=1
[3]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-1-IoT-architecture.jpg?resize=350%2C133&ssl=1
[4]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-2-Messaging-Queuing-Telemetry-Transmit-protocol.jpg?resize=350%2C206&ssl=1
[5]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-3-Advance-Message-Queuing-Protocol.jpg?resize=350%2C160&ssl=1
[6]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-4-CoAP.jpg?resize=350%2C84&ssl=1
[7]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-5-Constrained-Application-Protocol-architecture.jpg?resize=350%2C224&ssl=1
[8]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-6-Extensible-Messaging-and-Presence-Protocol.jpg?resize=350%2C46&ssl=1
