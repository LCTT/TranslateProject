[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (DeviceHive: The Scalable Open Source M2M Development Platform)
[#]: via: (https://opensourceforu.com/2019/09/devicehive-the-scalable-open-source-m2m-development-platform/)
[#]: author: (Dr Anand Nayyar https://opensourceforu.com/author/anand-nayyar/)

DeviceHive: The Scalable Open Source M2M Development Platform
======

[![][1]][2]

_DeviceHive provides powerful instruments for smart devices to communicate and manage services. It incorporates three critical technologies that affect mobile developers and users— the cloud, mobile and embedded systems. It consists of a communication layer, control software and multi-platform libraries and clients to bootstrap the development of remote sensing, remote control, monitoring and automation, smart energy, etc._

Today, people look for easy ways to get things done and the best example of this is automation. Machine-to-machine (M2M) communication aims to connect everyday objects and allows them (these non-human content providers) to feed the Internet with data in various formats, frequently. M2M communication is the latest trend in the evolution of industry, combining technology with data communication between devices or machines.

M2M technology was first implemented in the manufacturing and industrial sectors, where other technologies like SCADA and remote monitoring helped to remotely manage and control data from equipment. M2M communications is all about direct inter-device communications, through which a robot or machine controls other machines. It can be used to more effectively monitor the condition of critical public infrastructure such as water treatment facilities or bridges, with less human intervention.

Making a machine-to-machine communications system work is a step by step procedure. The three main elements in this process are: sensors (that acquire data from the operational environment and transmit it wirelessly), peer-to-peer wireless networks, and Internet enabled PCs. The most common types of M2M communications are listed below.

  * _**Backend-to-backend:**_ This is all about transmitting device logs over the Internet to the cloud provider. It also works for schedulers, daemons and continuous processes.
  * _**IoT devices:**_ These small connected units put together data from small, autonomous, specialised devices at the server.
  * _**CLI clients:**_ This is the creation of CLI apps that have the necessary rights to perform the actions, but which are only available on certain computers.



The following points highlight the architecture and components of M2M communication.

  * _**M2M devices:**_ These are devices that are capable of replying to the request for data contained within those devices or capable of transmitting data in an autonomous manner. Examples are sensors, WPAN technologies like ZigBee or Bluetooth, LoWPAN, etc.
  * _**M2M area network (device domain):**_ This enables connectivity between M2M devices and M2M gateways. An example is a personal area network.
  * _**M2M gateway:**_ This utilises M2M capabilities to ensure M2M devices are interoperable and interconnected to the communications network. Gateways and routers are endpoints of the operator’s network in scenarios where sensors and M2M devices connect to the network.
  * _**M2M communication networks:**_ These comprise communication between M2M gateways and M2M applications. Examples are xDSL, LTE, WiMAX and WLAN.
  * _**M2M applications:**_ All M2M applications are based on assets provided by the operator. Examples are IoT based smart homes, e-health, m-health, telemedicine and the Internet of Medical Things, vending machines, smart parking systems, autonomous store payments and wireless payment systems, digital control systems in factories, smart IIoT, industrial monitoring, etc.



There are various M2M open source development platforms. In this article, the primary focus is on DeviceHive, an open source M2M development platform.

![Figure 1: DeviceHive microservices architecture][3]

**Introducing DeviceHive**
DeviceHive was created and launched by DataArt, a boutique software development and outsourcing company in New York city, as an open source M2M communications framework using which developers could design M2M projects. It provides powerful instruments for smart devices to communicate and manage services. It incorporates three critical technologies that affect mobile developers and users— the cloud, the mobile and embedded. It consists of a communications layer, control software and multi-platform libraries and clients to bootstrap the development of remote sensing, remote control, monitoring and automation, smart energy, etc.

DeviceHive provides a strong foundation and building support to create or customise any IoT/M2M solution, bridging the gap between embedded development, cloud platforms, Big Data and client applications. It is a scalable, hardware and cloud agnostic microservice-based platform with device-management APIs in varied protocols, which allows end users to set up and monitor device connectivity, and perform data analytics.

**Features**
Listed below are the features of DeviceHive.

  * **Deployment:** DeviceHive facilitates innumerable deployment options and is suitable for every organisation, whether a startup or big enterprise. It includes Docker Compose and Kubernetes deployment to facilitate the development of public, private or hybrid clouds. Various DeviceHive services are started using Docker Compose — DeviceHive Frontend service, DeviceHive backend service, DeviceHive Auth service, DeviceHive Admin Console, DeviceHive WebSocket Proxy, DeviceHive Nginx Proxy, Kafka, PostgreSQL and Hazelcast IMDG.
  * **Scalability:** DeviceHive includes outstanding software design practices like a container service oriented architecture approach, managed and orchestrated by Kubernetes, which brings about scalability and availability in seconds.
  * **Connectivity:** It supports connectivity with any device via the REST API, WebSockets or MQTT. It supports libraries written in varied languages — both Android and iOS. It even supports embedded devices like ESP8266.
  * **Seamless integration:** DeviceHive supports seamless integration with voice assisted services like Google, Siri and Alexa by enabling users to run customised JavaScript code.
  * **Smart analytics:** It supports smart analytics using ElasticSearch, Apache Spark, Cassandra and Kafka for real-time processes. It also facilitates machine learning support.
  * **Open source:** Comes under the Apache 2.0 licence for free use, and end users are supported by DataArt’s IoT professionals.



**Protocols, client libraries and devices supported by DeviceHive**
Protocols: DeviceHive supports the REST, WebSocket API and MQTT protocols. In addition to this, for all RESTful services, it provides the Swagger API tool to test installation and other capabilities.

**Client/device libraries:** DeviceHive supports numerous device libraries — the .NET framework, .NET Micro Framework, C++, Python and C (microcontrollers).

**Client libraries:** These include the .NET framework, iOS and the Web/JavaScript.
**Device support**: DeviceHive supports any device with Python, Node.js or Java based Linux boards via the DeviceHive Client library. It also supports the ESP8266 chip with a simple API to handle all types of sensors for things like temperature (DS18B20, LM75A/LM75B/LM75C, DHT11 and DHT22) and pressure (BMP180, BMP280, etc).

DeviceHive is a microservice based system, with high scalability and availability. Figure 1 highlights the microservices architecture of DeviceHive.

**Components of DeviceHive**
The following are the components of DeviceHive.

  * **PostgreSQL:** This is the backend database to store all the data with regard to devices, networks, users, device types and configuration settings.
  * **Hazelcast IMDG:** This is a clustered, in-memory data grid that uses sharding for data distribution and supports monitoring. All notifications are saved to a distributed cache storage for speedy access, and this can be removed in 2 minutes.
  * **Message Bus (Kafka):** This supports communication between services and load balancing, as Kafka is a fast, distributed and fault-tolerant messaging system. In DeviceHive, the WebSocket Kafka proxy is used. It is written in Node.js because of flexibility in messaging.
  * **DeviceHive frontend service:** This supports the RESTful and WebSocket APIs, performing all sorts of primary checks, sending requests to backend services and delivering responses in an asynchronous manner.
  * **DeviceHive backend service:** This stores data in Hazelcast to manage subscriptions and retrieve data via requests from other services, from Hazelcast or from the database.
  * **DeviceHive Auth service:** This contains information regarding the access control of users, the devices connected, network types and device types. It provides the RESTful API for generating, validating and refreshing tokens.
  * **DeviceHive plugin service:** DeviceHive plugin support can help users to register devices, and define network types with the required JWT tokens. All the plugins are created in Node.js, Python and Java.



**DeviceHive API**
DeviceHive API acts as a central component of the framework to facilitate communication and interaction with varied components. The API is responsible for providing access to information regarding all the components registered in the system in order to exchange messages in real-time scenarios.
The DeviceHive API has three types of consumers:

  * Client
  * Administrator
  * Device



_**Client:**_ This is regarded as an application to control and administer devices. It can be an interface or software to manage the entire network.

_**Administrator:**_ This controls the whole environment with full access to all components. It can create and manage API users, device networks, and all notifications and commands.

_**Device:**_ This is termed as an individual unit with a unique identifier, name and other meta-information to communicate with the API. It takes commands from other components and executes them in an efficient manner.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/09/devicehive-the-scalable-open-source-m2m-development-platform/

作者：[Dr Anand Nayyar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/anand-nayyar/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/09/DeviceHive-IoT-connectivity-Illustration.jpg?resize=696%2C412&ssl=1 (DeviceHive IoT connectivity Illustration)
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/09/DeviceHive-IoT-connectivity-Illustration.jpg?fit=800%2C474&ssl=1
[3]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-1-DeviceHive-microservices-architecture.jpg?resize=350%2C180&ssl=1
