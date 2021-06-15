[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Protect your network with open source tools)
[#]: via: (https://opensource.com/article/20/10/apache-security-tools)
[#]: author: (Chantale Benoit https://opensource.com/users/chantalebenoit)

Protect your network with open source tools
======
Apache Syncope and Metron can help you secure your network against
unauthorized access and data loss.
![A lock on the side of a building][1]

System integrity is essential, especially when you're charged with safeguarding other people's personal details on your network. It's critical that system administrators are familiar with security tools, whether their purview is a home, a small business, or an organization with hundreds or thousands of employees.

### How cybersecurity works

Cybersecurity involves securing networks against unauthorized access. However, there are many attack vectors out there that most people don't consider. The cliché of a lone hacker manually dueling with firewall rules until they gain access to a network is popular—but wildly inaccurate. Security breaches happen through automation, malware, phishing, ransomware, and more. You can't directly fight every attack as it happens, and you can't count on every computer user to exercise common sense. Therefore, you have to design a system that resists intrusion and protects users against outside attacks as much as it protects them from their own mistakes.

The advantage of open source security tools is that they keep vulnerabilities transparent. They give full visibility into their codebase and are supported by a global community of experts working together to create strong, tried-and-tested code.

With so many domains needing protection, there's no single cybersecurity solution that fits every situation, but here are two that you should consider.

### Apache Syncope

[Apache Syncope][2] is an open source system for managing digital identities in an enterprise environment. From focusing on identity lifecycle management and identity storage to provisioning engines and accessing management capabilities, Apache Syncope is a comprehensive identity management solution. It also provides monitoring and security features for third-party applications.

Apache Syncope synchronizes users, groups, and other objects. _Users_ represent the buildup of virtual identities and account information fragmented across external resources. _Groups_ are entities on external resources that support the concept of LDAP or Active Directory. _Objects_ are entities such as printers, services, and sensors. It also does full reconciliation and live synchronization from external resources with workflow-based approval.

#### Third-party applications

Apache Syncope also exposes a fully compliant [JAX-RS][3] 2.0 [RESTful][4] interface to enable third-party applications written in any programming language. These applications consume identity management services, such as:

  * **Logic:** Syncope implements business logic that can be triggered through REST services and controls additional features such as notifications, reports, and auditing.
  * **Provisioning:** It manages the internal and external representation of users, groups, and objects through workflow and specific connectors.
  * **Workflow:** Syncope supports Activiti or Flowable [business process management (BPM)][5] workflow engines and allows defining new and custom workflows when needed.
  * **Persistence:** It manages all data, such as users, groups, attributes, and resources, at a high level using a standard [JPA 2.0][6] approach. The data is further persisted to an underlying database, such as internal storage.
  * **Security:** Syncope defines a fine-grained set of entitlements, which are granted to administrators and enable the implementation of delegated administration scenarios.



#### Syncope extensions

Apache Syncope's features can be enhanced with [extensions][7], which add a REST endpoint and manage the persistence of additional entities, tweak the provisioning layer, and add features to the user interface.

Some popular extensions include:

  * **Swagger UI** works as a user interface for Syncope RESTful services.
  * **SSO support** provides OpenID Connect and SAML 2.0 access to administrative or end-user web interfaces.
  * **Apache Camel provisioning manager** delegates the execution of the provisioning process to a group of Apache Camel routes. It can be dynamically changed at the runtime through the REST interfaces or the administrative console, and modifications are also instantly available for processing.
  * **Elasticsearch** provides an alternate internal search engine for users, groups, and objects through an external [Elasticsearch][8] cluster.



### Apache Metron

Security information and event management ([SIEM][9]) gives admins insights into the activities happening within their IT environment. It combines the concepts of security event management (SEM) with security information management (SIM) into one functionality. SIEM collects security data from network devices, servers, and domain controllers, then aggregates and analyzes the data to detect malicious threats and payloads.

[Apache Metron][10] is an advanced security analytics framework that detects cyber anomalies, such as phishing activity and malware infections. Further, it enables organizations to take corrective measures to counter the identified anomalies.

It also interprets and normalizes security events into standard JSON language, which makes it easier to analyze security events, such as:

  * An employee flagging a suspicious email
  * An authorized or unauthorized software download by an employee to a company device
  * A security lapse due to a server outage



Apache Metron provides security alerts, labeling, and data enrichment. It can also store and index security events. Its four key capabilities are:

  * **Security data lake:** Metron is a cost-effective way to store and combine a wide range of business and security data. The security data lake provides the amount of data required to power discovery analytics. It also provides a mechanism to search and query for operational analytics.
  * **Pluggable framework:** It provides a rich set of parsers for common security data sources such as pcap, NetFlow, Zeek (formerly Bro), Snort, FireEye, and Sourcefire. You can also add custom parsers for new data sources, including enrichment services for more contextual information, to the raw streaming data. The pluggable framework provides extensions for threat-intel feeds and lets you customize security dashboards. Machine learning and other models can also be plugged into real-time streams and provide extensibility.
  * **Threat detection platform:** It uses machine learning algorithms to detect anomalies in a system. It also helps analysts extract and reconstruct full packets to understand the attacker's identity, what data was leaked, and where the data was sent.
  * **Incident response application:** This refers to evolved SIEM capabilities, including alerting, threat intel frameworks, and agents to ingest data sources. Incident response applications include packet replay utilities, evidence storage, and hunting services commonly used by security operations center analysts.



### Security matters

Incorporating open source security tools into your IT infrastructure is imperative to keep your organization safe and secure. Open source tools, like Syncope and Metron from Apache, can help you identify and counter security threats. Learn to use them well, file bugs as you find them, and help the open source community protect the world's data.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/apache-security-tools

作者：[Chantale Benoit][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/chantalebenoit
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://syncope.apache.org/
[3]: https://jax-rs.github.io/apidocs/2.0/
[4]: https://www.redhat.com/en/topics/api/what-is-a-rest-api
[5]: https://www.redhat.com/en/topics/automation/what-is-business-process-management
[6]: http://openjpa.apache.org/openjpa-2.0.0.html
[7]: http://syncope.apache.org/docs/2.1/reference-guide.html#extensions
[8]: https://opensource.com/life/16/6/overview-elastic-stack
[9]: https://en.wikipedia.org/wiki/Security_information_and_event_management
[10]: http://metron.apache.org/
