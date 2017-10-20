Tips to Secure Your Network in the Wake of KRACK
============================================================


![KRACK](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/krack-security.jpg?itok=_gKsJm7N "KRACK")
The recent KRACK vulnerability targets the link between your device and the Wi-Fi access point, which is probably a router either in your home, your office, or your favorite cafe. These tips can help improve the security of your connection.[Creative Commons Zero][1]Pixabay

The [KRACK attacks vulnerability][4] is now more than 48 hours old and has been discussed in detail on a number of [technology-related sites][5], so I won’t repeat the technical details of the attack here. To summarize:

*   A flaw in the WPA2 wireless handshake protocol allows attackers to sniff or manipulate the traffic between your device and the wi-fi access point.

*   It is particularly bad for Linux and Android devices, due either to ambiguous wording in the WPA2 standard or to misunderstanding during its implementation. Effectively, until the underlying OS is patched, the vulnerability allows attackers to force all wireless traffic to happen without any encryption at all.

*   This vulnerability can be patched on the client, so the sky hasn’t fallen and the WPA2 wireless encryption standard is not obsoleted in the same sense that the WEP standard is (do NOT “fix” this problem by switching to WEP).

*   Most popular Linux distributions are already shipping updates that fix this vulnerability on the client, so apply your updates dutifully.

*   Android will be shipping fixes for this vulnerability Very Soon. If your device is receiving Android security patches, you will receive a fix before long. If your device is no longer receiving such updates, then this particular vulnerability is merely another reason why you should stop using old, unsupported Android devices.

That said, from my perspective, Wi-Fi is merely another link in the chain of untrusted infrastructure and we should altogether avoid treating it as a trusted communication channel.

### Wi-Fi as untrusted infrastructure

If you’re reading this article from your laptop or your mobile device, then your chain of communication probably looks something like this:

 ![Blank Network Diagram - Basics.png](https://lh4.googleusercontent.com/ihouLL-yQ-ZZCKpp3MvLH6-iWC3cMlxNqN6YySOqa6cIR9ShSHIwjR04KAXnkU9TO7vMZ27QEz1QjA0j0MrECcEZSpJoA4uURwHZjec4TSQpgd7-982isvpx89C73N9wt1cEzq9l) 

The KRACK attack targets the link between your device and the Wi-Fi access point, which is probably a router either in your home, your office, your neighborhood library, or your favorite cafe.

 ![Blank Network Diagram - Where Kracks happen (1).png](https://lh3.googleusercontent.com/xvW0IhutTplAB3VHO00lSMLcJNK31DfjTCxEB8_0PkcenM9P46y0K-w8WZjVWQapj2pU9a8mRmG57sVhwv8kVn6lghoTnv8qkz8FRbo2VBCk_gK8M2ipi20di1qDTdj_dPGyRqWi) 

In reality, this diagram should look something like this:

 ![Blank Network Diagram - Everywhere (1).png](https://lh4.googleusercontent.com/e4InTHN5ql28nw21NM8cz3HwO1VMZN4-itSArWqH2_6m492ZZKu851uD4pn0Ms3kfHEc2Rst1_c8ENIsoFJ-mEkhFjMH7zUbg9r0t0la78cPnLls_iaVeBwmf5vjS9XWpUIgHScS) 

Wi-Fi is merely the first link in a long chain of communication happening over channels that we should not trust. If I were to guess, the Wi-Fi router you’re using has probably not received a security update since the day it got put together. Worse, it probably came with default or easily guessable administrative credentials that were never changed. Unless you set up and configured that router yourself and you can remember the last time you updated its firmware, you should assume that it is now controlled by someone else and cannot be trusted.

Past the Wi-Fi router, we enter the zone of generally distrusting the infrastructure at large -- depending on your general paranoia levels. Here we have upstream ISPs and providers, many of whom have been caught monitoring, altering, analyzing, and selling our personal traffic in an attempt to make additional money off our browsing habits. Often their own security patching schedules leave a lot to be desired and end up exposing our traffic to malicious eyes.

On the Internet at large, we have to worry about powerful state-level actors with ability to manipulate [core networking protocols][6] in order to carry out mass surveillance programs or perform state-level traffic filtering.

### HTTPS Protocol

Thankfully, we have a solution to the problem of secure communication over untrusted medium, and we use it every day -- the HTTPS protocol encrypts our Internet traffic point-to-point and ensures that we can trust that the sites we communicate with are who they say they are.

The Linux Foundation initiatives like [Let’s Encrypt][7] make it easy for site owners worldwide to offer end-to-end encryption that helps ensure that any compromised equipment between our personal devices and the websites we are trying to access does not matter.

 ![Blank Network Diagram - HTTPS (1).png](https://lh6.googleusercontent.com/aFzS-eiJCJpTTQD967NzKZOfFcS0rQ8rTW4L_aiKQ3Q3pTkkeqGjBBAdYASw38VMxKLbNOwbKpGOT9CGzI1XVmyzeiuGqI9YSdkBjBwwJZ0Ee2k8EZonl43HeAv4o6hk2YKonbtW) 

Well... almost does not matter.

### DNS remains a problem

Even if we dutifully use HTTPS to create a trusted communication channel, there is still a chance that an attacker with access to our Wi-Fi router or someone who can alter our Wi-Fi traffic -- as is the case with KRACK -- can trick us into communicating with the wrong website. They can do so by taking advantage of the fact that we still greatly rely on DNS -- an unencrypted, easily spoofed [protocol from the 1980s][8].

 ![Blank Network Diagram - LOL DNS.png](https://lh4.googleusercontent.com/EZfhN4crHvLX2cn3wbukh9z7aYsaB073jHMqI5IbOHba4VPhsc2GHMud75D9B_T6K2-ry6zXu_54jDa16gc0G3OC-RP7crchc0ltNGZPhoHpTsc_T6T0XXtMofUYw_iqlW5bG_0g) 

DNS is a system that translates human-friendly domain names like “linux.com” into IP addresses that computers can use to communicate with each other. To translate a domain name into an IP address, the computer would query the resolver software -- usually running on the Wi-Fi router or on the system itself. The resolver would then query a distributed network of “root” nameservers to figure out which system on the Internet has what is called “authoritative” information about what IP address corresponds to the “linux.com” domain name.

The trouble is, all this communication happens over unauthenticated, [easily spoofable][9], cleartext protocols, and responses can be easily altered by attackers to make the query return incorrect data. If someone manages to spoof a DNS query and return the wrong IP address, they can manipulate where our system ends up sending the HTTP request.

Fortunately, HTTPS has a lot of built-in protection to make sure that it is not easy for someone to pretend to be another site. The TLS certificate on the malicious server must match the DNS name you are requesting -- and be issued by a reputable [Certificate Authority][10] recognized by your browser. If that is not the case, the browser will show a big warning that the host you are trying to communicate with is not who they say they are. If you see such warning, please be extremely cautious before choosing to override it, as you could be giving away your secrets to people who will use them against you.

If the attackers have full control of the router, they can prevent your connection from using HTTPS in the first place, by intercepting the response from the server that instructs your browser to set up a secure connection (this is called “[the SSL strip attack][11]”). To help protect you from this attack, sites may add a [special response header][12] telling your browser to always use HTTPS when communicating with them in the future, but this only works after your first visit. For some very popular sites, browsers now include a [hardcoded list of domains][13] that should always be accessed over HTTPS even on the first visit.

The solution to DNS spoofing exists and is called [DNSSEC][14], but it has seen very slow adoption due to important hurdles -- real and perceived. Until DNSSEC is used universally, we must assume that DNS information we receive cannot be fully trusted.

### Use VPN to solve the last-mile security problem

So, if you cannot trust Wi-Fi -- and/or the wireless router in the basement that is probably older than most of your pets -- what can be done to ensure the integrity of the “last-mile” communication, the one that happens between your device and the Internet at large?

One acceptable solution is to use a reputable VPN provider that will establish a secure communication link between your system and their infrastructure. The hope here is that they pay closer attention to security than your router vendor and your immediate Internet provider, so they are in a better position to assure that your traffic is protected from being sniffed or spoofed by malicious parties. Using VPN on all your workstations and mobile devices ensures that vulnerabilities like KRACK attacks or insecure routers do not affect the integrity of your communication with the outside world.

 ![Blank Network Diagram - VPN.png](https://lh4.googleusercontent.com/vdulGCwUB239d76QXgtV3AcC0fG0YEi_LWCzOAYAEhFlEExtXXSOyXB-aq4PAI652egsUcgAXNi1KfUNWnUewWBlHkyRHSBDb5jWpD11MrSsfjbkTRZGTVhRv6wOszNdTQ12TKG8) 

The important caveat here is that when choosing a VPN provider you must be reasonably assured of their trustworthiness; otherwise, you’re simply trading one set of malicious actors for another. Stay far away from anything offering “free VPN,” as they are probably making money by spying on you and selling your traffic to marketing firms. [This site][2] is a good resource that would allow you to compare various VPN providers to see how they stack against each other.

Not all of your devices need to have VPN installed on them, but the ones that you use daily to access sites with your private personal information -- and especially anything with access to your money and your identity (government, banking sites, social networking, etc.) must be secured. VPN is not a panacea against all network-level vulnerabilities, but it will definitely help protect you when you’re stuck using unsecured Wi-Fi at the airport, or the next time a KRACK-like vulnerability is discovered.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2017/10/tips-secure-your-network-wake-krack

作者：[KONSTANTIN RYABITSEV][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.vpnmentor.com/bestvpns/overall/
[3]:https://www.linux.com/files/images/krack-securityjpg
[4]:https://www.krackattacks.com/
[5]:https://blog.cryptographyengineering.com/2017/10/16/falling-through-the-kracks/
[6]:https://en.wikipedia.org/wiki/BGP_hijacking
[7]:https://letsencrypt.org/
[8]:https://en.wikipedia.org/wiki/Domain_Name_System#History
[9]:https://en.wikipedia.org/wiki/DNS_spoofing
[10]:https://en.wikipedia.org/wiki/Certificate_authority
[11]:https://en.wikipedia.org/wiki/Moxie_Marlinspike#Notable_research
[12]:https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security
[13]:https://hstspreload.org/
[14]:https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions
