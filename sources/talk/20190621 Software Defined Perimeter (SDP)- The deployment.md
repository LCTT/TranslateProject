[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Software Defined Perimeter (SDP): The deployment)
[#]: via: (https://www.networkworld.com/article/3404477/software-defined-perimeter-sdp-the-deployment.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

Software Defined Perimeter (SDP): The deployment
======
After discussing with numerous SDP vendors, I have discovered that the current SDP landscape tends to be based on specific use cases and projects, as opposed to a technology that has to be implemented globally.
![bigstock][1]

Deploying zero trust software-defined perimeter (SDP) architecture is not about completely replacing virtual private network (VPN) technologies and firewalls. By and large, the firewall demarcation points that mark the inside and outside are not going away anytime soon. The VPN concentrator will also have its position for the foreseeable future.

A rip and replace is a very aggressive deployment approach regardless of the age of technology. And while SDP is new, it should be approached with care when choosing the correct vendor. An SDP adoption should be a slow migration process as opposed to the once off rip and replace. 

As I wrote about on Network Insight _[Disclaimer: the author is employed by Network Insight]_, while [SDP is a disruptive technology][2], after discussing with numerous SDP vendors, I have discovered that the current SDP landscape tends to be based on specific use cases and projects, as opposed to a technology that has to be implemented globally. To start with, you should be able to implement SDP for only certain user segments.

**[ Learn more about SDN: Find out [where SDN is going][3] and learn the [difference between SDN and NFV][4]. | Get regularly scheduled insights by [signing up for Network World newsletters][5]. ]**

The traditional legacy VPNs and new SDP architecture will most likely co-exist side by side for a while. Therefore, if possible, you should opt for a solution that supports a dual-mode VPN and SDP architecture that is controlled within a single-pane-of-glass.

### The types of SDP architectures

Various SDP architectures have different characteristics and are not identical to each other. But what’s important is to make the architecture available so that it’s easy for the customer to consume without too many changes, including opening up the new firewall ports. In such a scenario, there is a cloud-first SDP solution whereby the private cloud of a vendor is used to control the network resource access.

There are vendors that provide the SDP components, enabling you to implement in the cloud and on-premise locations. Then we have the infrastructure providers where you have to run all of their components to make things work. We also have an overlay option.

Finally, pure content delivery network (CDN) provides SDP solutions that require you to use their network delivery services. In this post, let's discuss the SDP architecture where the vendor provides the components that allow you to implement yourself or with their professional service team. It is here some vendors follow closely the Cloud Security Alliance (CSA) SDP architectural guidelines while others do not.

A common SDP architecture consists of an SDP controller, client, and gateway components. The self-service compliance approach should give the option that allows both; the SDP and perimeter-based VPN functionality to work in parallel fashion, while still enabling the zero trust principles. You should aim to make sure that the new SDP components are easily integrated with the existing platforms and vendors already deployed.

### The controller – the centralized policy enforcement engine

For centralized authentication and authorization, a controller component keeps track of the users, devices, and applications. The controller acts as the centralized policy enforcement engine that governs the control and data plane for all the users, devices, and applications.

The control plane offers features like granular segmentation i.e. you can get very specific, even to microsegmentation in context to per application, user or device. Everyone and everything that connects to the network will have a policy that governs where they can go, what they can see and do.

The controller keeps track and communicates with the entities triggering the authentication process. By doing so, the controller can determine which hosts can communicate with each other. The controller may relay information to external services such as attestation, geo-location, and/or identity services to determine its decision on what the requesting host can access.

A keynote about the controller is the type of integration points it can support. The SDP controllers should have the capability to connect and support the authorization services, for example, PKI, device fingerprinting, geolocation, SAML, OpenID, OAuth, LDAP, Kerberos, and multi-factor authentication.

The controller centralizes the policies and conducts an interface between the SDP client and the SDP gateway. This not only enables classification but also imparts the ability to push the policy out to the gateways that are located closer to the requesting client. Hence, one of the biggest gains is the visibility of who is on the network and where can they go. As discussed in one of the previous posts on SDP, today visibility is a major gap in enterprise networking.

We have a “dark” network as the end users do not have the ability to see IP or DNS entries of internal resources ( also enabling protection from a DDoS attack ). Then, based on the authentication and authorization set by the centralized controller and pushed to the gateways, the administrator is essentially turning the lights on.

### The role of the gateway

The gateway can be a physical appliance or virtual machine (VM) positioned in the cloud accessible through a public clouds marketplace or located on-premise.

Ideally, the gateway can be established in the locations which are close to the requesting resource. The geolocation integration point is useful here in the sense that only certain locations can access the information due to security reasons or enhance the user experience by redirecting to the services that are logically closer.

It will be common to have users with multiple tunnels to multiple gateways, all at the same time. It’s not a static path or a one to one relationship but more of a user to application relationship. As a result, the applications can exist everywhere and anywhere whereby the tunnel is dynamic and ephemeral providing access to the protected assets. You could say that the gateway is a type of middleware device.

Once the user is authenticated and authorized to the controller, additional checks occur at the gateway. For example, SAML insertion can be used to authenticate the user which then passes the information to the SaaS-based offering.

There are policy and configurations located on each one of the gateways enabling the gateway to carry out endpoint validation stages. This makes sure that the endpoint is fulfilling the enforced posture assessment before access is granted to the network.

In essence, all the device information about the user, device security state, along with geolocation information is extracted from the controller and sent to the gateways via a secure control plane.

### The role of the agent

Trust is the bidirectional belief that two communicating entities are doing what they should be doing within the context. Therefore, trust should be established closest to the endpoint. This can be carried out with an agent, or agentless client on an endpoint. The client should work across different operating systems, so the users do not have to manage anything by themselves.

With browser-based solutions, the user is using a web browser to access the protected applications. Therefore, it doesn’t give you the full range of TCP and UDP ports, but you can do many things that speak natively across HTML5.

### The typical flow of the SDP process

So, let us summarize the flow of process. The client first makes a request to the controller. The controller then responds to the request and returns a list of resources that the client has access to. The controller determines this based on the policy that is already set.

As soon as the controller has completed all the determinations along with geolocation to make sure they are going to the correct gateway, the controller then forwards the policy information to the selected gateway via the control plane. The gateways then contact the client (agent or agentless) on the endpoint.

The client recognizes the policies that it needs to run and the gateways it needs to connect to. Now the client knows the correct gateways that offer the requested services. It then initiates an additional authentication process for that client. The authentication is based on the identity, device, configuration of the device and other contextual information.

This information is then sent to the controller via the control plane. The controller then checks to see if the client fulfills all the authentication requirements and matches the security state that is appropriate to access the resources.

Once the process is complete, the client sets up a secure connection to the gateway and the data plane can be established. The client communicates directly with the gateway via the data plane, without traffic flowing through the centralized controller.

### Common stages to all SDP architectures

We have a number of SDP architectures but most of them operate on similar philosophies and stages as mentioned below.

SDP architectures are user-centric; meaning they validate the user and the device before permitting any access. Access policies are created based on user attributes. This is in comparison to the traditional networking systems, which are solely based on the IP addresses that do not consider the details of the user and their devices.

Assessing contextual information is a key aspect of SDP. Anything tied to IP is ridiculous as we don’t have a valid hook to hang things on for security policy enforcement. We need to assess more than the IP address.

For device and user assessment, we need to look deeper and go beyond IP not only as an anchor for network location but also for trust. Ideally, a viable SDP solution must analyze the user, role, device, location, time, network and application, along with the endpoint security state.

Also, by leveraging the elements, such as directory group membership and IAM-assigned attributes and user roles, an organization can define and control access to the network resources. This can be performed in a way that’s meaningful to the business, security, and compliance teams.

Essentially, the first piece of the puzzle is to authenticate and authorize every user and connection. For this, we need to carry out a number of stages as listed below.

#### Verify posture of the user

First of all, the SDP vendor needs to verify the user. This can be carried out with SSO (single sign-on) via security assertion markup language (SAML), or multi-factor authentication. Verification of the user depends on what the user is trying to access. The network resource can be in the cloud, such as, a SaaS-based application or local to the enterprise network, which depicts the verification method.

Utilizing extensive multi-factor authentication and authorization options ensure that the client and the resources they access are continuously verified during the transaction. The periodic checking of the client makes sure that the policy is continuously enforced. It protects from additional things that you are not allowed to do while you have the connection open.

#### Verify posture of the device

Secondly, to validate at an endpoint level we need to verify the security posture of the device. Authenticating and authorizing is as important for the device as for the user. This validation should be done for both; pre and post connection, ensuring that the device is valid along with the corresponding user. There is no point having a verified device if the user is rogue carrying out malicious behavior.

 From the host checking and location awareness perspective, we need to ensure if the device is accessing the network from an unusual or risky place? Determining this can help in preventing malware, rooted or jailbroken devices from connecting to the network. Once resolved, we have the option to quarantine, permit or deny via a configured policy.

On the endpoint, the SDP vendor should be able to check things, such as registry settings, malware, anti-virus settings, firewall, hard drive (HD) encryption and so on. Some vendors can check even more minutely and look for specific Microsoft patches.

It is here that we can put to use the context-based policies which are deployed across the devices, connections, and locations. When a policy is context-based, you are taking in as much information as possible to verify the overall posture.

#### Protect the data

In the third stage, we need to protect the data. This is the stage where the vendor should deploy per-app tunnels to ensure that the transactions are secure, and the data is encrypted for the duration of the session.

**This article is published as part of the IDG Contributor Network. [Want to Join?][6]**

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3404477/software-defined-perimeter-sdp-the-deployment.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/12/sdn-100782493-large.jpg
[2]: https://network-insight.net/2019/06/software-defined-perimeter-sdp-a-disruptive-technology/
[3]: https://www.networkworld.com/article/3209131/lan-wan/what-sdn-is-and-where-its-going.html
[4]: https://www.networkworld.com/article/3206709/lan-wan/what-s-the-difference-between-sdn-and-nfv.html
[5]: https://www.networkworld.com/newsletters/signup.html
[6]: /contributor-network/signup.html
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
