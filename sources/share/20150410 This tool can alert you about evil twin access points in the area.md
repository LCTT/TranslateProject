This tool can alert you about evil twin access points in the area
================================================================================
**EvilAP_Defender can even attack rogue Wi-Fi access points for you, the developer says**

A new open-source tool can periodically scan an area for rogue Wi-Fi access points and can alert network administrators if any are found.

The tool, called EvilAP_Defender, was designed specifically to detect malicious access points that are configured by attackers to mimic legitimate ones in order to trick users to connect to them.

These access points are known as evil twins and allow hackers to intercept Internet traffic from devices connected to them. This can be used to steal credentials, spoof websites, and more.

Most users configure their computers and devices to automatically connect to some wireless networks, like those in their homes or at their workplace. However, when faced with two wireless networks that have the same name, or SSID, and sometimes even the same MAC address, or BSSID, most devices will automatically connect to the one that has the stronger signal.

This makes evil twin attacks easy to pull off because both SSIDs and BSSIDs can be spoofed.

[EvilAP_Defender][1] was written in Python by a developer named Mohamed Idris and was published on GitHub. It can use a computer's wireless network card to discover rogue access points that duplicate a real access point's SSID, BSSID, and even additional parameters like channel, cipher, privacy protocol, and authentication.

The tool will first run in learning mode, so that the legitimate access point [AP] can be discovered and whitelisted. It can then be switched to normal mode to start scanning for unauthorized access points.

If an evil AP is discovered, the tool can alert the network administrator by email, but the developer also plans to add SMS-based alerts in the future.

There is also a preventive mode in which the tool can launch a denial-of-service [DoS] attack against the evil AP to buy the administrator some time to take defensive measures.

"The DoS will only be performed for evil APs which have the same SSID but a different BSSID (AP's MAC address) or run on a different channel," Idris said in the tool's documentation. "This is to avoid attacking your legitimate network."

However, users should remember that attacking someone else's access point, even a likely malicious one operated by an attacker, is most likely illegal in many countries.

In order to run, the tool needs the Aircrack-ng wireless suite, a wireless card supported by Aircrack-ng, MySQL and the Python runtime.

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2905725/security0/this-tool-can-alert-you-about-evil-twin-access-points-in-the-area.html

作者：[Lucian Constantin][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Lucian-Constantin/
[1] https://github.com/moha99sa/EvilAP_Defender/blob/master/README.TXT
