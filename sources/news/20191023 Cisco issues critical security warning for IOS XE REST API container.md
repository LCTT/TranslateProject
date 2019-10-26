[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco issues critical security warning for IOS XE REST API container)
[#]: via: (https://www.networkworld.com/article/3447558/cisco-issues-critical-security-warning-for-ios-xe-rest-api-container.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco issues critical security warning for IOS XE REST API container
======
This Cisco IOS XE REST API vulnerability could lead to attackers obtaining the token-id of an authenticated user.
D3Damon / Getty Images

Cisco this week said it issued a software update to address a vulnerability in its [Cisco REST API virtual service container for Cisco IOS XE][1] software that scored a critical 10 out of 10 on the Common Vulnerability Scoring System (CVSS) system.

With the vulnerability an attacker could submit malicious HTTP requests to the targeted device and if successful, obtain the _token-id_ of an authenticated user. This _token-id_ could be used to bypass authentication and execute privileged actions through the interface of the REST API virtual service container on the affected Cisco IOS XE device, the company said.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][2]

According to Cisco the REST API is an application that runs in a virtual services container. A virtual services container is a virtualized environment on a device and is delivered as an open virtual application (OVA).  The OVA package has to be installed and enabled on a device through the device virtualization manager (VMAN) CLI.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][3] ]**

The Cisco REST API provides a set of RESTful APIs as an alternative method to the Cisco IOS XE CLI to provision selected functions on Cisco devices.

Cisco said the vulnerability can be exploited under the  following conditions:

  * The device runs an affected Cisco IOS XE Software release.
  * The device has installed and enabled an affected version of the Cisco REST API virtual service container.
  * An authorized user with administrator credentials (level 15) is authenticated to the REST API interface.



The REST API interface is not enabled by default. To be vulnerable, the virtual services container must be installed and activated. Deleting the OVA package from the device storage memory removes the attack vector. If the Cisco REST API virtual service container is not enabled, this operation will not impact the device's normal operating conditions, Cisco stated.   

This vulnerability affects Cisco devices that are configured to use a vulnerable version of Cisco REST API virtual service container. This vulnerability affected the following products:

  * Cisco 4000 Series Integrated Services Routers
  * Cisco ASR 1000 Series Aggregation Services Routers
  * Cisco Cloud Services Router 1000V Series
  * Cisco Integrated Services Virtual Router



Cisco said it has [released a fixed version of the REST API][4] virtual service container and   a hardened IOS XE release that prevents installation or activation of a vulnerable container on a device. If the device was already configured with an active vulnerable container, the IOS XE software upgrade will deactivate the container, making the device not vulnerable. In that case, to restore the REST API functionality, customers should upgrade the Cisco REST API virtual service container to a fixed software release, the company said.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3447558/cisco-issues-critical-security-warning-for-ios-xe-rest-api-container.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190828-iosxe-rest-auth-bypass
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[4]: https://www.cisco.com/c/en/us/about/legal/cloud-and-software/end_user_license_agreement.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
