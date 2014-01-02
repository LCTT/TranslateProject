Ubuntu Stores Your Wi-Fi Passwords By Default!
================================================================================

### Akagi201 is TRANSLATING

Ubuntu is not as secure as you perhaps thought it to be. According to reports, the Linux-driven distribution stores its Wi-Fi profiles outside its home folder, which makes them more accessible. This includes passwords for the Wi-Fi profiles. Reports say that a user pointed out that Wi-Fi passwords on Ubuntu aren’t encrypted as they are stored outside the Home folder. This folder though can be encrypted during the OS’ installation.

“I recently stumbled over the fact, that NetworkManager by default stores Wifi profiles *including clear text passwords* under ‘/etc/NetworkManager/system-connections/.’ I think that is not what one expects when he/she turns on home folder encryption and should because of that be corrected somehow,” Softpedia quoted user Per Guth from a mailing list.

The issue is apparently a result of “All users may connect to this network”, the option that is enabled by default. In order to switch this feature off, users have to open the Network Indicator and go to Edit Connections. Then choose Select Network and clock on Edit. In the General tab here, untick the option in order to switch it off.

Unchecking the option reportedly moves the password into the required folder, but the Softpedia report speculated that majority of the users won’t be aware of this issue. Whether Canonical will make any changes to this or not remains to be seen. 

--------------------------------------------------------------------------------

via: http://www.efytimes.com/e1/fullnews.asp?edid=125483

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出