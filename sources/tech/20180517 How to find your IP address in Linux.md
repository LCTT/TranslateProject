translating---geekpi

How to find your IP address in Linux
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/satellite_radio_location.jpg?itok=KJUKSB6x)
Internet Protocol (IP) needs no introduction—we all use it daily. Even if you don't use it directly, when you type website-name.com on your web browser, it looks up the IP address of that URL and then loads the website.

Let's divide IP addresses into two categories: private and public. Private IP addresses are the ones your WiFi box (and company intranet) provide. They are in the range of 10.x.x.x, 172.16.x.x-172.31.x.x, and 192.168.x.x, where x=0 to 255. Public IP addresses, as the name suggests, are "public" and you can reach them from anywhere in the world. Every website has a unique IP address that can be reached by anyone and from anywhere; that is considered a public IP address.

Furthermore, there are two types of IP addresses: IPv4 and IPv6.

IPv4 addresses have the format x.x.x.x, where x=0 to 255. There are 2^32 (approximately 4 billion) possible IPv4 addresses.

IPv6 addresses have a more complex format using hex numbers. The total number of bits is 128, which means there are 2^128—340 undecillion!—possible IPv6 addresses. IPv6 was introduced to tackle the foreseeable exhaustion of IPv4 addresses in the near future.

As a network engineer, I recommend not sharing your machine’s public IP address with anyone. Your WiFi router has a public IP, which is the WAN (wide-area network) IP address, and it will be the same for any device connected to that WiFi. All the devices connected to the same WiFi have private IP addresses locally identified by the range provided above. For example, my laptop is connected with the IP address 192.168.0.5, and my phone is connected with 192.168.0.8. These are private IP addresses, but both would have the same public IP address.

The following commands will get you the IP address list to find public IP addresses for your machine:

  1. `ifconfig.me`
  2. `curl -4/-6 icanhazip.com`
  3. `curl ipinfo.io/ip`
  4. `curl api.ipify.org`
  5. `curl checkip.dyndns.org`
  6. `dig +short myip.opendns.com @resolver1.opendns.com`
  7. `host myip.opendns.com resolver1.opendns.com`
  8. `curl ident.me`
  9. `curl bot.whatismyipaddress.com`
  10. `curl ipecho.net/plain`



The following commands will get you the private IP address of your interfaces:

  1. `ifconfig -a`
  2. `ip addr (ip a)`
  3. `hostname -I | awk ‘{print $1}’`
  4. `ip route get 1.2.3.4 | awk '{print $7}'`
  5. `(Fedora) Wifi-Settings→ click the setting icon next to the Wifi name that you are connected to → Ipv4 and Ipv6 both can be seen`
  6. `nmcli -p device show`



_Note: Some utilities need to be installed on your system based on the Linux distro you are using. Also, some of the noted commands use a third-party website to get the IP_

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/how-find-ip-address-linux

作者：[Archit Modi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
