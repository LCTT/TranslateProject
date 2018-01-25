SPARTA – Network Penetration Testing GUI Toolkit
======

![](https://i0.wp.com/gbhackers.com/wp-content/uploads/2018/01/GjWDZ1516079830.png?resize=696%2C379&ssl=1)

SPARTA is GUI application developed with python and inbuild Network Penetration Testing Kali Linux tool. It simplifies scanning and enumeration phase with faster results.

Best thing of SPARTA GUI Toolkit it scans detects the service running on the target port.

Also, it provides Bruteforce attack for scanned open ports and services as a part of enumeration phase.


Also Read: Network Pentesting Checklist][1]

## Installation

Please clone the latest version of SPARTA from github:

```
git clone https://github.com/secforce/sparta.git
```

Alternatively, download the latest zip file [here][2].
```
cd /usr/share/
git clone https://github.com/secforce/sparta.git
```
Place the "sparta" file in /usr/bin/ and make it executable.
Type 'sparta' in any terminal to launch the application.


## The scope of Network Penetration Testing Work:

  * Organizations security weaknesses in their network infrastructures are identified by a list of host or targeted host and add them to the scope.
  * Select menu bar - File > Add host(s) to scope



[![Network Penetration Testing][3]][4]

[![Network Penetration Testing][5]][6]

  * Above figures show target Ip is added to the scope.According to your network can add the range of IPs to scan.
  * After adding Nmap scan will begin and results will be very faster.now scanning phase is done.



## Open Ports & Services:

  * Nmap results will provide target open ports and services.



[![Network Penetration Testing][7]][8]

  * Above figure shows that target operating system, Open ports and services are discovered as scan results.



## Brute Force Attack on Open ports:

  * Let us Brute force Server Message Block (SMB) via port 445 to enumerate the list of users and their valid passwords.



[![Network Penetration Testing][9]][10]

  * Right-click and Select option Send to Brute.Also, select discovered Open ports and service on target.
  * Browse and add dictionary files for Username and password fields.



[![Network Penetration Testing][11]][12]

  * Click Run to start the Brute force attack on the target.Above Figure shows Brute force attack is successfully completed on the target IP and the valid password is Found!
  * Always think failed login attempts will be logged as Event logs in Windows.
  * Password changing policy should be 15 to 30 days will be a good practice.
  * Always recommended to use a strong password as per policy.Password lockout policy is a good one to stop brute force attacks (After 5 failure attempts account will be locked)
  * The integration of business-critical asset to SIEM( security incident & Event Management) will detect these kinds of attacks as soon as possible.



SPARTA is timing saving GUI Toolkit for pentesters for scanning and enumeration phase.SPARTA Scans and Bruteforce various protocols.It has many more features! Happy Hacking.

--------------------------------------------------------------------------------

via: https://gbhackers.com/sparta-network-penetration-testing-gui-toolkit/

作者：[Balaganesh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://gbhackers.com/author/balaganesh/
[1]:https://gbhackers.com/network-penetration-testing-checklist-examples/
[2]:https://github.com/SECFORCE/sparta/archive/master.zip
[3]:https://i0.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-526.png?resize=696%2C495&ssl=1
[4]:https://i0.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-526.png?ssl=1
[5]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-527.png?resize=696%2C516&ssl=1
[6]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-527.png?ssl=1
[7]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-528.png?resize=696%2C519&ssl=1
[8]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-528.png?ssl=1
[9]:https://i1.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-529.png?resize=696%2C525&ssl=1
[10]:https://i1.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-529.png?ssl=1
[11]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-531.png?resize=696%2C523&ssl=1
[12]:https://i2.wp.com/gbhackers.com/wp-content/uploads/2018/01/Screenshot-531.png?ssl=1
