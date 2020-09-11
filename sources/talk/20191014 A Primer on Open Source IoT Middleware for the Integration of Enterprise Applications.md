[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A Primer on Open Source IoT Middleware for the Integration of Enterprise Applications)
[#]: via: (https://opensourceforu.com/2019/10/a-primer-on-open-source-iot-middleware-for-the-integration-of-enterprise-applications/)
[#]: author: (Gopala Krishna Behara https://opensourceforu.com/author/gopalakrishna-behara/)

A Primer on Open Source IoT Middleware for the Integration of Enterprise Applications
======

[![][1]][2]

_The Internet of Things (IoT) integrates a virtual world of information to the real world of devices through a layered architecture. IoT middleware is an interface between the physical world (hardware layer) of devices with the virtual world (application layer), which is responsible for interacting with devices and information management systems. This article discusses IoT middleware, the characteristics of open source IoT middleware, IoT middleware platform architecture and key open source IoT middleware platforms._

With billions of devices generating trillions of bytes of data, there is a need for heterogeneous IoT device management and application enablement. This requires a revamp of existing architectures. There is a need to identify industry agnostic application middleware to address the complexity of IoT solutions, future changes, the integration of IoT with mobile devices, various types of machinery, equipment and tablets, among other devices.

According to Statista, the total installed base of IoT connected devices is projected to be 75.44 billion worldwide by 2025.

Most of the IoT applications are heterogeneous, and domain specific. Deciding on the appropriate IoT middleware for app development is the major challenge faced by developers today. The functionalities provided by different middleware vendors are almost similar but differ mainly in their underlying technologies. Middleware services provided by different IoT vendors include data acquisition, device management, data storage, security and analytics. Selecting the right middleware platform is one of the critical steps in application development.

The important parameters for choosing the right middleware for an IoT application are scalability, availability, the ability to handle huge amounts of data, a high processing speed, flexibility, integration with varied analytical tools, security and cost.

**Industry adoption of open source middleware in IoT**
The market for IoT middleware was valued at US$ 6.44 billion in 2018 and is expected to reach a value of US$ 18.68 billion by 2024 at a CAGR of 19.72 per cent, over the forecast period 2019-2024 (_<https://www.mordorintelligence.com/industry-reports/iot-middle-ware-market>_).

According to an Ericsson forecast (_<https://www.ericsson.com/en/mobility-report/internet-of-things-forecast>_), there will be around 29 billion connected devices in use by 2022, of which around 18 billion will be related to IoT. Gartner forecasts that 14.2 billion connected things will be in use in 2019, and that the total will reach 25 billion by 2021, producing immense volume of data.

**IoT middleware and its features**
Middleware acts as an agent between the service providers (IoT devices) and service consumers (enterprise applications). It is a software layer that sits in between applications and objects. It is a mediator interface that enables the interaction between the Internet and ‘things’. It hides the heterogeneity among the devices, components and technology of an IoT system. Middleware provides solutions to frequently encountered problems, such as interoperability, security and dependability. The following are the important features of middleware, which improve the performance of devices.

**Flexibility:** This feature helps in establishing better connectivity, which improves the communication between applications and things. There are different kinds of flexibility (e.g., response time, faster to evolve and change).

**Transparency:** Middleware hides many complexities and architectural information details from both the application and the object sides, so that the two can communicate with minimum knowledge of either side.

**Interoperability:** This functionality allows two sets of applications on interconnected networks to exchange data and services meaningfully with different assumptions on protocols, data models, and configurations.

**Platform portability:** An IoT platform should be able to communicate from everywhere, anytime with any device. Middleware runs on the user side and can provide independence from network protocols, programming languages, OSs and others.

**Re-usability:** This feature makes designing and developing easier by modifying system components and assets for specific requirements, which results in cost efficiency.

**Maintainability:** Maintainability has a fault tolerance approximation. Middleware performs maintainability efficiently and extends the network.

**Security:** Middleware should provide different security measures for ubiquitous applications and pervasive environments. Authentication, authorisation and access control helps in verification and accountability.

**Characteristics of open source IoT middleware**
An open source IoT middleware platform should be fault-tolerant and highly available. It has the following characteristics:

  * No vendor lock-in, and it comes with the surety of seamless integration of enterprise-wide tools, applications, products and systems developed and deployed by different organisations and vendors.
  * Open source middleware increases the productivity, speeds up time to market, reduces risk and increases quality.
  * Adoption of open source middleware enhances the interoperability with other enterprise applications because of the ability to reuse recommended software stacks, libraries and components.
  * IoT middleware platforms should support open APIs, deployment models of the cloud, and be highly available.
  * It should support open data formats like RestAPI, JSON, XML and Java, and be freely available
  * An IoT middleware platform should support multi-service and heterogeneous devices, and be compatible with the hardware for sensing environmental information.
  * Migration to any new platform or system should be seamless. It should be possible to adopt or integrate with any solution.
  * The information data model should be distributed and extensible, providing availability and scalability to the system.
  * An IoT middleware platform should support major communication protocols like MQTT, CoAP, HTTP, WebSockets, etc.
  * An IoT middleware platform should support different security features like encryption, authentication, authorisation and auditing.
  * It should support technologies such as M2M applications, real-time analytics, machine learning, artificial intelligence, analytics, visualisation and event reporting.



**IoT middleware architecture**
The middleware mediates between IoT data producers and the consumers. APIs for interactions with the middleware are based on standard application protocols.

API endpoints for accessing the data and services should be searchable via an open catalogue, and should contain linked metadata about the resources.

The device manager communicates messages to the devices. The database needs to access and deliver messages to the devices with minimum latency.

Data processing involves data translation, aggregation and data filtering on the incoming data, which enables real-time decision making at the edge. The database needs to support high-speed reads and writes with sub-millisecond latency. It helps in performing complex analytical computations on the data.

The IoT data stream normalises the data to a common format and sends it to enterprise systems. The database needs to perform the data transformation operations efficiently.

Middleware supports the authentication of users, organisations, applications and devices. It supports functionalities like certificates, password credentials, API keys, tokens, etc. It should also support single sign-on, time based credentials, application authentication (via signatures) and device authentication (via certificates).

Logging is necessary for both system debugging as well as auditing. Middleware manages the logging of system debugging and auditing details. It helps to track the status of the various services, APIs, etc, and administers them.

**Key open source IoT middleware platforms**
Holistically, an IoT implementation covers data collection and insertion through sensors as well as giving control back to devices. The different types of IoT middleware are categorised as:

  * Application-centric (application and data management)
  * Platform-centric (application enablement, device management and connectivity management)
  * Industry-specific (manufacturing, healthcare, energy and utilities, transportation and logistics, agriculture, etc)



![Figure 1: IoT middleware architecture][3]

Selecting the right middleware during various stages of IoT implementation depends on multiple factors like the size of the enterprise, the nature of the business, the development and operational perspectives, etc.The following are some of the top open source middleware platforms for IoT based applications.

**Kaa** is platform-centric middleware. It manages an unlimited number of connected devices with cross-device interoperability. It performs real-time device monitoring, remote device provisioning and configuration, collection and analysis of sensor data. It has microservices based portability, horizontal scalability and a highly available IoT platform. It supports on premise, public cloud and hybrid models of deployment. Kaa is built on open components like Kafka, Cassandra, MongoDB, Redis, NATS, Spring, React, etc.

**SiteWhere** is platform-centric middleware. It provides ingestion, storage, processing and integration of device data. It supports multi-tenancy, MQTT, AMQP, Stomp, CoAP and WebSocket. It seamlessly integrates with Android, iOS, and multiple SDKs. It is built on open source technology stacks like MongoDB, Eclipse Californium, InfluxDB, HBase and many others.

**IoTSyS** is platform-centric and industry-specific middleware. It uses IPv6 for non-IP IoT devices and systems. It is used in smart city and smart grid projects to make the automation infrastructure smart. IoTSyS provides interoperable Web technologies for sensors and actuator networks.

**DeviceHive** is cloud agnostic, microservices based, platform-centric middleware used for device connectivity and management. It has the ability to connect to any device via MQTT, REST or WebSockets. It supports Big Data solutions like ElasticSearch, Apache Spark, Cassandra and Kafka for real-time and batch processing.

**EclipseIoT (Kura)** provides device connectivity, data transformation and business logic with intelligent routing, edge processing/analytics and real-time decisions.

**Zetta** is application-centric middleware. It is a service-oriented open source IoT platform built on Node.js combining REST API, WebSockets and reactive programming. It can run on cloud platforms like Heroku to create geo-distributed networks and stream data into machine analytics systems like Splunk.

**MainFlux** is application-centric middleware providing solutions based on the cloud. It has been developed as microservices, containerised by Docker and orchestrated with Kubernetes. The architecture is flexible and allows seamless integration with enterprise systems like ERP, BI and CRM. It can also integrate with databases, analytics, backend systems and cloud services easily. In addition, it supports REST, MQTT, WebSocket and CoAP.

**Distributed Services Architecture (DSA)** facilitates decentralised device inter-communication, allowing protocol translation and data integration to and from third party data sources.

**OpenRemote** is application-centric middleware used to connect any device regardless of vendor or protocol, to create meaningful connections by converting data points into smart applications. It finds use in home automation, commercial buildings, public space and healthcare. Data visualisation is integrated with devices and sensors, and turns data into smart applications.

**OpenIoT** is application-centric open source middleware for pulling information from sensors. It incorporates Sensing-as-a-Service for deploying and providing services in cloud environments.

**ThingsBoard** is an open source IoT platform for data collection, processing, data visualisation and device management. It supports IoT protocols like MQTT, CoA, and HTTP with on-premise and cloud deployment. It is horizontally scalable, stores data in Cassandra DB, HSQLDB and PostgreSQL.

**NATS.io** is a simple, secure and high performance open source messaging system for cloud native solutions. It is developed as microservices architecture with high performance, secure and resilient capabilities.

**Benefits of open source IoT middleware**
Open source middleware for the IoT has the following advantages over proprietary options:

  * It is easy to upgrade to new technologies with open source middleware.
  * It has the ability to connect with upcoming device protocols and backend applications.
  * Open source middleware ensures lower overall software costs, and is easier to use when changing technology and open source APIs for integration.
  * It has a microservices based architecture and is built using open source technologies, resulting in high performance, scalability and fault-tolerance.
  * It provides multi-protocol support and is hardware-agnostic. It supports connectivity for any device and any application.
  * It has the flexibility to allow the cloud service provider to be changed.
  * It is very important to choose the right set of open source middleware for an IoT solution. This is a big challenge as the market offers a vast choice.



Analyse the business problem and arrive at the solution as a first step. Break the solution into services and understand the middleware needs of these services. This will help to narrow down the middleware choices.

IoT middleware helps overcome the problems associated with the heterogeneity of the entire Internet of Things by enabling smooth communication among devices and components from different vendors and based on different technologies.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/a-primer-on-open-source-iot-middleware-for-the-integration-of-enterprise-applications/

作者：[Gopala Krishna Behara][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/gopalakrishna-behara/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Middle-were-architecture-illustration.jpg?resize=696%2C426&ssl=1 (Middle were architecture illustration)
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Middle-were-architecture-illustration.jpg?fit=800%2C490&ssl=1
[3]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Figure-1-IoT-middleware-architecture.jpg?resize=350%2C162&ssl=1
