10 killer tools for the admin in a hurry
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT)

Administering networks and systems can get very stressful when the workload piles up. Nobody really appreciates how long anything takes, and everyone wants their specific thing done yesterday.

So it's no wonder so many of us are drawn to the open source spirit of figuring out what works and sharing it with everyone. Because, when deadlines are looming, and there just aren't enough hours in the day, it really helps if you can just find free answers you can implement immediately.

So, without further ado, here's my Swiss Army Knife of stuff to get you out of the office before dinner time.

### Server configuration and scripting

Let's jump right in.

**[NixCraft][1]**
Use the site's internal search function. With more than a decade of regular updates, there's gold to be found here—useful scripts and handy hints that can solve your problem straight away. This is often the second place I look after Google.

**[Webmin][2]**
This gives you a nice web interface to remotely edit your configuration files. It cuts down on a lot of time spent having to juggle directory paths and `sudo nano`, which is handy when you're handling several customers.

**[Windows Subsystem for Linux][3]**
The reality of the modern workplace is that most employees are on Windows, while the grown-up gear in the server room is on Linux. So sometimes you find yourself trying to do admin tasks from (gasp) a Windows desktop.

What do you do? Install a virtual machine? It's actually much faster and far less work to configure if you install the Windows Subsystem for Linux compatibility layer, now available at no cost on Windows 10.

This gives you a Bash terminal in a window where you can run Bash scripts and Linux binaries on the local machine, have full access to both Windows and Linux filesystems, and mount network drives. It's available in Ubuntu, OpenSUSE, SLES, Debian, and Kali flavors.

**[mRemoteNG][4]**
This is an excellent SSH and remote desktop client for when you have 100+ servers to manage.

### Setting up a network so you don't have to do it again

A poorly planned network is the sworn enemy of the admin who hates working overtime.

**[IP Addressing Schemes that Scale][5]**
The diabolical thing about running out of IP addresses is that, when it happens, the network's grown large enough that a new addressing scheme is an expensive, time-consuming pain in the proverbial.

Ain't nobody got time for that!

At some point, IPv6 will finally arrive to save the day. Until then, these one-size-fits-most IP addressing schemes should keep you going, no matter how many network-connected wearables, tablets, smart locks, lights, security cameras, VoIP headsets, and espresso machines the world throws at us.

**[Linux Chmod Permissions Cheat Sheet][6]**
A short but sweet cheat sheet of Bash commands to set permissions across the network. This is so when Bill from Customer Service falls for that ransomware scam, you're recovering just his files and not the entire company's.

**[VLSM Subnet Calculator][7]**
Just put in the number of networks you want to create from an address space and the number of hosts you want per network, and it calculates what the subnet mask should be for everything.

### Single-purpose Linux distributions

Need a Linux box that does just one thing? It helps if someone else has already sweated the small stuff on an operating system you can install and have ready immediately.

Each of these has, at one point, made my work day so much easier.

**[Porteus Kiosk][8]**
This is for when you want a computer totally locked down to just a web browser. With a little tweaking, you can even lock the browser down to just one website. This is great for public access machines. It works with touchscreens or with a keyboard and mouse.

**[Parted Magic][9]**
This is an operating system you can boot from a USB drive to partition hard drives, recover data, and run benchmarking tools.

**[IPFire][10]**
Hahahaha, I still can't believe someone called a router/firewall/proxy combo  "I pee fire." That's my second favorite thing about this Linux distribution. My favorite is that it's a seriously solid software suite. It's so easy to set up and configure, and there is a heap of plugins available to extend it.

So, how about you? What tools, resources, and cheat sheets have you found to make the workday easier? I'd love to know. Please share in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/tools-admin

作者：[Grant Hamono][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/grantdxm
[1]:https://www.cyberciti.biz/
[2]:http://www.webmin.com/
[3]:http://wsl-guide.org/en/latest/
[4]:https://mremoteng.org/
[5]:https://blog.dxmtechsupport.com.au/ip-addressing-for-a-small-business-that-might-grow/
[6]:https://isabelcastillo.com/linux-chmod-permissions-cheat-sheet
[7]:http://www.vlsm-calc.net/
[8]:http://porteus-kiosk.org/
[9]:https://partedmagic.com/
[10]:https://www.ipfire.org/
