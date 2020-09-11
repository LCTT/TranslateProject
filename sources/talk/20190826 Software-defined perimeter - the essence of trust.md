[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Software-defined perimeter – the essence of trust)
[#]: via: (https://www.networkworld.com/article/3433922/software-defined-perimeter-the-essence-of-trust.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

Software-defined perimeter – the essence of trust
======
Within a zero-trust environment, there is no implicit trust. Thus, trust must be sourced from somewhere else in order to gain access to protected resources.
![Thinkstock][1]

Actions speak louder than words. Reliable actions build lasting trust in contrast to unreliable words. Imagine that you had a house with a guarded wall. You would feel safe in the house, correct? Now, what if that wall is dismantled? You might start to feel your security is under threat. Anyone could have easy access to your house.

In the same way, with traditional security products: it is as if anyone is allowed to leave their house, knock at your door and pick your locks. Wouldn’t it be more secure if only certain individuals whom you fully trust can even see your house? This is the essence of zero-trust networking and is a core concept discussed in my recent course on [SDP (][2][software-defined perimeter).][2]

Within a zero-trust environment, there is no implicit trust. Thus, trust must be sourced from somewhere else in order to gain access to protected resources. It is only after sufficient trust has been established and the necessary controls are passed, that the access is granted, providing a path to the requested resource. The access path to the resource is designed differently, depending on whether it’s a client or service-initiated software-defined perimeter solution.

**[ Don’t miss [customer reviews of top remote access tools][3] and see [the most powerful IoT companies][4] . | Get daily insights by [signing up for Network World newsletters][5]. ]**

A per application tunnel is created through the one-to-one mapping process. This effectively establishes a “network segment of one” that is unique for each user and application. This is in comparison to broad-level access that traditional architectures exhibit. Typically, the broad network access results in overly permissive access with an attack surface that is simply too large.

One of the key elements for the software-defined perimeter and zero trust is that both; the user and device validation, along with application access validation are based on the user’s identity, not the IP address. Nowadays, anything associated with IP addresses is ridiculous as we have nothing solid to hang policy from.

### The traditional chain of events

Traditionally, a device would look at the IP address of the requesting entity and ask for a password. This opens the door to bad actors that can communicate from any IP address and insert themselves between you and the trusted remote device if they please.

Today, the IP address is no longer sufficient to define the level of trust for a user. IP addresses lack user knowledge to assign and validate the trust. There is no contextual information taken into consideration. This is often referred to as the IP address conundrum. Therefore, as an anchor for the network location and policy, we need to look beyond the ports and IP addresses.

Network policies have traditionally focused on what systems can communicate with each other. The permit or deny is a very binary framework to use in today's dynamic environment. It has resulted in a policy that is either too rigidly defined or too loosely defined. This is where the software-defined perimeter finds the middle-ground.

Essentially with SDP, we examine at every stage the user validation, device validation, and applications for every request in a zero-trust network. Trust in a network is constantly evolving, based on the previous and current actions of the user. This is what’s known as a variable trust level and will ensure a strong trust chain.

### What is Software-Defined Perimeter (SDP)?

According to a report from IDG and Pulsesecure, [SDP is gaining momentum][6]. It controls access to resources based on the identity often referred to as the “Black Out”, which means that the applications and sensitive data cannot be detected by unauthorized users. As mentioned earlier, it is designed around the user identity, not the IP address.

The whole idea of SDP is to isolate the user from the application. This can be done in a number of ways, client-initiated and service-initiated.

### SDP client-initiated

One such way is to put the requesting client on the network while leaving the network infrastructure and applications dark. This can be done with a lightweight security protocol, such as single packet authorization (SPA). This allows the SDP to receive a valid SPA packet before turning the lights on. In this case, the client has to initiate the connection to trigger the authentication.

### What is a SPA?

A [SPA packet][7] _[Disclaimer: the author is employed by Network Insight]_ is a UDP packet that is encrypted, cryptographically signed and cannot be faked. No two SPA packets are ever the same; therefore, replay attacks are impossible. SPA is intentionally designed to have multiple layers of security that are built on each other. These are the layers of security that are on top of whatever the port it is protecting. 

SPA plays a significant role by hiding both; the applications and SDP infrastructure components (including the SDP controller and gateway) until the client sends a valid SPA packet. Until this happens, everything remains dark hidden from unauthorized users and devices.

### SDP service-initiated

We also have a service-initiated approach that uses an SDP broker. The SDP broker may come in the form of an appliance or cloud service that remains within the cloud approach. One example could be to have mutual TLS tunnels from an SDP device (located wherever the application is ) to the SDP cloud, then another mutual TLS from the initiating client to the same SDP cloud. This enables both the client and an SDP device to connect outbound on the port TCP 443 to the SDP cloud.

With the service-initiated model, the client does not connect to the location of the application. Basically, the location of the application is irrelevant to the path access. This is completely different to how application access is built today. Instead, with SDP, a trust chain is built between the two sides of the service.

### Removing the network

This model of connectivity inverts our existing approach. Fundamentally, the user is never given access to the network until fully authenticated. Applications can literally exist anywhere as you don’t need an inbound path. This offers additional levels of security against the application DDoS and the ability to have overlapping IP addresses that are useful for mergers and acquisitions.

As per the initial security setup, in order to get access to an application you had to connect a user to a network. Further, if the users were external and not on the local network, you needed to create a virtual network. An inbound port was needed to expose the application to the public internet. However, this open port was visible to anyone. As you can imagine from a security standpoint, the idea of network connectivity to access an application is not a good idea.

The traditional chain of events is to connect first and then authenticate. This allows users, good or bad, to gain access to your network and services. Then we hand them off to the service to determine whether the user is permitted access.

Access before authentication allows both good and bad users to gain access to all the services. Evidently, ‘first, connect and then authenticate’ has many drawbacks which is why we must secure the user access with stronger levels of authentication and authorization.

### A robust way to validate

The first stage is authentication, which ensures that a user is who he or she claims to be. The second stage is authorization, which allows access to the resources based on the identity. Here, the SDP policies can define a set of network services (such as network geolocation and encryption for communications) that a given user or group of users is authorized to access, and under what circumstances.

### The authentication

The policies governing authentication may require single or multiple factors. SDP uses a combination of user authentication as well as device authentication for each connection between the initiating and accepting hosts.

The main part of the authentication stage is the “Authenticators”. Authenticators could be as simple as something you know, such as a password or potentially more complex, such as something you are, a fingerprint or other biometric data.

The authentication process provides authentication to two things, user and device authentication. Device authentication can be done by following protocols, such as single packet authorization (SPA), host-specific firewalls, mutual transport layer security, device fingerprinting, software verification, and geo-location

The user authentication can be provided by the trusted browser, SAML or authentication to an identity provider (IP).

### Authenticating the user

Firstly, the user needs to be authenticated. The SDP policy plane has a context that needs to be validated before access is granted. This will most likely be not just authentication but a full authorization.

The users will have a set of credentials on their device as a result of pre-authentication and pre-authorization. What is recommended here is to use SAML based services. With SAML you can get things back, such as SAML attributes. This ensures that if this user is part of this group or access path the user is allowed access to this application.

The identity can also be validated against an identity provider. The traditional VPNs would use an authorization database that had user credentials. But this was different from the centralized trust. The centralized trust would be provided by some kind of LDAP environment, such as an active directory (AD).

The considerable benefit of using an identity provider is that it acts as a gateway for users to authenticate against the same centralized trust. However, VPNs or other gateway services require a different database with a different management process. This can create an overhead to either add or delete the users from different databases.

Having everything controlled in one central database provider is the key to managing a single set of controls of trust. Essentially, in SDP, a user validates against an externally facing IDP and then the user is authenticated against the identity store. The identity store can be certificate-based and may even include multi-factor authentication (MFA).

With services, such as MS Azure AD and Octa, you can go deeper and include the contextual-based authentication against the IDP. The IDP can then take into consideration the geolocation details and other parameters that are not usually accessed with the standard authentication.

### Geo-location

Geo-location is a useful feature. It is the identification or estimation of the real-world’s geographic location. This can be used as a source of information which can help in making decisions regarding the access in an SDP.

Here, an ideal approach for the SDP would be to compare the user geolocation with the connection attempts to detect the credential theft. If the user does not meet the criteria in the IDP, the trust level is lowered, and the user will be given a subset of access instead of the full access path.

### Authenticating the device

Largely, the end goal of device validation is to make sure that the device is trusted. This stage occurs only after the user is validated. By employing some SDP solutions, the device validation can be carried out for the client’s software running on the client’s device.

The process is that the user authorizes himself or herself against the IDP. Then all the tests are run against the IDP. Once the user passes these validation steps and submits an application request to the SDP, the SDP will go to another layer of validation and test things like corporate certification tests, disk encryption, etc. The SDP will also verify if there a local firewall running. These tests are done under the enforcement of the policy.

The device validation should be done on a per-application and per policy rule. The device test is not a one-time test. It tests the device in relation to the access request at that particular time. On the other hand, SAML occurs only once, i.e. when a user logs in.

**This article is published as part of the IDG Contributor Network. [Want to Join?][8]**

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3433922/software-defined-perimeter-the-essence-of-trust.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.techhive.com/images/article/2015/11/millennials_trust-100625376-large.jpg
[2]: https://www.pluralsight.com/courses/sdp-leveraging-zero-trust-create-network-security-architecture
[3]: https://www.networkworld.com/article/3262145/lan-wan/customer-reviews-top-remote-access-tools.html#nww-fsb
[4]: https://www.networkworld.com/article/2287045/internet-of-things/wireless-153629-10-most-powerful-internet-of-things-companies.html#nww-fsb
[5]: https://www.networkworld.com/newsletters/signup.html#nww-fsb
[6]: https://www.pulsesecure.net/resource/2019-state-of-enterprise-secure-access/
[7]: https://network-insight.net/2019/06/zero-trust-single-packet-authorization-passive-authorization/
[8]: https://www.networkworld.com/contributor-network/signup.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
