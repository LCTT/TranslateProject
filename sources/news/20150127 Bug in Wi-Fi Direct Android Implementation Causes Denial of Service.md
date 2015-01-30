zpl1025
Bug in Wi-Fi Direct Android Implementation Causes Denial of Service
----
*Google marks the issue as having low severity, is not in a hurry to fix it*

![Wi-Fi Direct glitch crashes Android](http://i1-news.softpedia-static.com/images/news2/Bug-In-Wi-Fi-Direct-Android-Implementation-Causes-Denial-of-Service-471299-2.jpg)

#A vulnerability in the way Android handles Wi-Fi Direct connections leads to rebooting the device when searching for peers to connect to, which can be anything from other phones, cameras, gaming devices, computers, or printers.

The Wi-Fi Direct technology allows devices capable of wireless connection to establish communication directly, without the need to join a local network.

##Security company insisted on proper coordination for a fix

The vulnerability allows an attacker to send a specially crafted 802.11 Probe Response frame to the device and crashes it due to an unhandled exception occurring on the WiFi monitoring class.

Core Security discovered the flaw (CVE-2014-0997) through its CoreLabs team, and reported it to Google back in September 2014. The vendor acknowledged it but classified the glitch as having low severity, with no timeline for a fix being provided.

The same answer was received by Core Security each time they contacted the Android security team to inform of a timeframe for rolling out a fix. The last reply of this kind was received on January 20, meaning that there is no patch for the time being. On Monday, the security company made their findings public.

The security company created a (proof-of-concept)[1] to demonstrate the validity of the results obtained during their research.

According to the technical details of the vulnerability, some Android devices can be induced a denial-of-service condition if they receive a malformed wpa_supplicant event, which makes available the interface between the wireless driver and the Android platform framework.

##Google is not in a hurry to eliminate the problem

The relaxed stance from the Android security team regarding the issue may be on account of the fact that denial-of-service condition occurs only for a short period of time, when scanning for peers.

More than this, the result is not severe in nature as it consists in rebooting the device. There is no risk of data exfiltration or an attack that could lead to this, which would make it unappealing to a threat actor. On the other hand, a patch should be provided regardless, in order to mitigate any potential future risks.

Core Security says that the issue was not detected on Android 5.0.1 and above, and among the devices affected they found Nexus 5 and 4 running version 4.4.4 of the mobile operating system, LG D806 and Samsung SM-T310 with Android 4.2.2, and Motorola RAZR HD with build 4.1.2 of the OS.

For the time being, mitigation consists in refraining from using Wi-Fi Direct or updating to a non-vulnerable version of Android.


--------------------------------------------------------------------------------

via:http://news.softpedia.com/news/Bug-In-Wi-Fi-Direct-Android-Implementation-Causes-Denial-of-Service-471299.shtml

本文发布时间:27 Jan 2015, 09:11 GMT

作者：[Ionut Ilascu][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/ionut-ilascu
[1]:http://www.coresecurity.com/advisories/android-wifi-direct-denial-service
