[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (11 Uses for a Raspberry Pi Around the Office)
[#]: via: (https://blog.dxmtechsupport.com.au/11-uses-for-a-raspberry-pi-around-the-office/)
[#]: author: (James Mawson https://blog.dxmtechsupport.com.au/author/james-mawson/)

11 Uses for a Raspberry Pi Around the Office
======

Look, I know what you’re thinking: a Raspberry Pi is really just for tinkering, prototyping and hobby use. It’s not actually meant for running a business on.

And it’s definitely true that this computer’s relatively low processing power, corruptible SD card, lack of battery backup and the DIY nature of the support means it’s not going to be a viable replacement for a [professionally installed and configured business server][1] for your most mission-critical operations any time soon.

But the board is affordable, incredibly frugal with power, small enough to fit just about anywhere and endlessly flexible – it’s actually a pretty great way to handle some basic tasks around the office.

And, even better, there’s a whole world of people out there who have done these projects before and are happy to share how they did it.

### DNS Server

Every time you type a website address or click a link in your browser, it needs to convert the domain name into a numeric IP address before it can show you anything.

Normally this means a request to a DNS server somewhere on the internet – but you can speed up your browsing by handling this locally.

You can also assign your own subdomains for local access to machines around the office.

[Here’s how to get this working.][2]

### Toilet Occupied Sign

Ever get queues at the loos?

That’s annoying for those left waiting and the time spent dealing with it is a drain on your whole office’s productivity.

I guess you could always hang those signs they have on airplanes all through your office.

[Occu-pi][3] is a much simpler solution, using a magnetic switch and a Raspberry Pi to tell when the bolt is closed and update a Slack channel as to when it’s in use – meaning that the whole office can tell at a glance of their computer or mobile device whether there’s a cubicle free.

### Honeypot Trap for Hackers

It should scare most business owners just a little bit that their first clue that a hacker’s breached the network is when something goes badly wrong.

That’s where it can help to have a honeypot: a computer that serves no purpose except to sit on your network with certain ports open to masquerade as a juicy target to hackers.

Security researchers often deploy honeypots on the exterior of a network, to collect data on what attackers are doing.

But for the average small business, these are more usefully deployed in the interior, to serve as kind of a tripwire. Because no ordinary user has any real reason to want to connect to the honeypot, any login attempts that occur are a very good indicator that mischief is afoot.

This can provide early warning of outsider intrusion, and of trusted insiders up to no good.

In larger, client/server networks, it might be more practical to run something like this as a virtual machine. But in small-office/home-office situations with a peer-to-peer network running on a wireless router, something like [HoneyPi][4] is a great little burglar alarm.

### Print Server

Network-attached printers are so much more convenient.

But it can be expensive to replace all your printers- especially if you’re otherwise happy with them.

It might make a lot more sense to [set up a Raspberry Pi as a print server][5].

### Network Attached Storage

Turning simple hard drives into network attached storage was one of the earliest practical uses for a Raspberry Pi, and it’s still one of the best.

[Here’s how to create a NAS with your Raspberry Pi.][6]

### Ticketing Server

Looking for a way to manage the support tickets for your help desk on a shoestring budget?

There’s a totally open source ticketing program called osTicket that you can install on your Pi, and it’s even available as [a ready-to-go SD card image][7].

### Digital Signage

Whether it’s for events, advertising, a menu, or something else entirely, a lot of businesses need a way to display digital signage – and the Pi’s affordability and frugal electricity needs make it a very attractive choice.

[There are a wealth of options to choose from here.][8]

### Directories and Kiosks

[FullPageOS][9] is a Linux distribution based on Raspbian that boots straight into a full screen version of Chromium – ideal for shopping directoriers, library catalogues and so on.

### Basic Intranet Web Server

For hosting a public-facing website, you’re really much better off just getting a hosting account. A Raspberry Pi is not really built to serve any real volume of web traffic.

But for small offices, it can host an internal business wiki or basic company intranet. It can also work as a sandbox environment for experimenting with code and server configurations.

[Here’s how to get Apache, MySQL and PHP running on a Pi.][10]

### Penetration Tester

Kali Linux is an operating system built specifically to probe networks for security vulnerabilities. By installing it on a Pi, you’ve got a super portable penetration tester with more than 600 tools included.

[You can find a torrent link for the Raspberry Pi image here.][11]

Be absolutely scrupulous to only use this on your own network or networks you’ve got permission to perform a security audit on – using this to hack other networks is a serious crime.

### VPN Server

When you’re out on the road, relying on public wireless internet, you’ve not really any say in who else might be on the network, snooping on all your traffic. That’s why it can be reassuring to encrypt everything with a VPN connection.

There are any number of commercial VPN services you can subscribe to – and you can install your own in the cloud – but by running one from your office, you can also access the local network from anywhere.

For light use – say, the occasional bit of business travel – a Raspberry Pi is a great, power-efficient way to set up a VPN server. (It’s also worth checking first that your router doesn’t offer this functionality already – very many do.)

[Here’s how to install OpenVPN on a Raspberry Pi.][12]

### Wireless Coffee Machine

Ahh, ambrosia: sweet nectar of the gods and the backbone of all productive enterprise.

So why not [hack the office coffee machine into a smart coffee machine][13] for precision temperature control and wireless network connectivity?

--------------------------------------------------------------------------------

via: https://blog.dxmtechsupport.com.au/11-uses-for-a-raspberry-pi-around-the-office/

作者：[James Mawson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.dxmtechsupport.com.au/author/james-mawson/
[b]: https://github.com/lujun9972
[1]: https://dxmtechsupport.com.au/server-configuration
[2]: https://www.1and1.com/digitalguide/server/configuration/how-to-make-your-raspberry-pi-into-a-dns-server/
[3]: https://blog.usejournal.com/occu-pi-the-bathroom-of-the-future-ed69b84e21d5
[4]: https://trustfoundry.net/honeypi-easy-honeypot-raspberry-pi/
[5]: https://opensource.com/article/18/3/print-server-raspberry-pi
[6]: https://howtoraspberrypi.com/create-a-nas-with-your-raspberry-pi-and-samba/
[7]: https://everyday-tech.com/a-raspberry-pi-ticketing-system-image-with-osticket/
[8]: https://blog.capterra.com/7-free-and-open-source-digital-signage-software-options-for-your-next-event/
[9]: https://github.com/guysoft/FullPageOS
[10]: https://maker.pro/raspberry-pi/projects/raspberry-pi-web-server
[11]: https://www.offensive-security.com/kali-linux-arm-images/
[12]: https://medium.freecodecamp.org/running-your-own-openvpn-server-on-a-raspberry-pi-8b78043ccdea
[13]: https://www.techradar.com/au/how-to/how-to-build-your-own-smart-coffee-machine
