Building A Raspberry Pi VPN Part One: How And Why To Build A Server
================================================================================
> Trust no one and build a server that encrypts your Web data from prying eyes.

Free, unencrypted wireless is everywhere, but you shouldn't be checking your bank account on it unless you don’t mind somebody else snooping. The solution? A [virtual private network][1], or VPN.

A VPN extends your own private network into public places, so even if you’re using Starbucks' Wi-Fi connection, your Internet browsing stays encrypted and secure.

There are plenty of ways to set up a VPN, both with [free and paid services][2], but each solution has its own pros and cons, determined by the way the VPN provider operates and charges and the kinds of VPN options it provides. 

The easiest and cheapest solution to keep your data safe is to just abstain from public Wi-Fi completely. But that sounds a little extreme to me when it’s relatively simple and inexpensive to build your own VPN server at home, and run it off of a tiny, inexpensive ($35) Raspberry Pi. 

My Raspberry Pi is about the size of a smartphone, but it runs a fully functional VPN server. That means no matter where I am, I can connect my computer to my home network and access shared files and media over a secure connection. It came in handy on a recent trip to Boston, where I was still able to watch videos stored on my network back home in DC.  

This is the part where I’d link you to a handy tutorial on how to set this up. The problem is one doesn't exist—or at least one that could satisfy this average computer user. And while there are plenty of tutorials about how to set up a VPN server on Raspberry Pi, there are very few that explain why. 

I read several different tutorials and cobbled together the results into this semi-coherent tutorial for setting up a VPN on Raspberry Pi, which even I can understand, complete with the why behind the how. Most prominently, I relied on Eric Jodoin's VPN tutorial for experts, and dumbed it down for me. 

So follow me down the cryptography rabbit hole and learn that no matter how paranoid you are, whoever came up with the methods to generate VPNs was even more so.  

### Materials ###

#### Hardware ####

![](http://readwrite.com/files/Raspberry_Pi_Model_B_Rev._2.jpg)

**Raspberry Pi Model B**: Plus everything that comes with it—by that, I mean a regular power source and a case to put it in. A case can help prevent accidental short-circuits that could permanently damage the machine—the case can even be as simple as a cardboard box you fold yourself.

**SD card**: I’m suggesting 8GB or more, just to make sure you have the space. As always for all Raspberry Pi projects, this should already have NOOBS installed. 

**Cat5e cable**: This will connect the Pi’s ethernet port to the ethernet port on the router. 

#### Software ####

[Open VPN][3]: This is the open source VPN service we’ll be installing today. 

### Pre-Project Requirements ###

1) You need to [set up NOOBS][4] and install [Raspbian][5]. I wrote a [step-by-step][6] for this in my quantified fish tank tutorial, so you can refer to it there. 

2) You need a static IP address for the Raspberry Pi on your home network. This depends on the model of your router, so use the instructions provided by the router’s manufacturer. If you don’t already have this set up, [read ReadWrite’s tutorial][7].  

3) You'll need SSH enabled. We’ll be connecting to the Raspberry Pi with [SSH][8], a connection tool that lets us access the Pi from another computer. This way, we don’t need to set up the Pi to a monitor and wireless keyboard for this project. Once again, check ReadWrite’s [tutorial][9]. 

4) You'll need to forward port 1194 ([UDP traffic][10]) to your Raspberry Pi’s internal IP address, but the way you do this will vary depending on your router, so check with your router manufacturer’s information. If you want to use another port or TCP, that’s fine, but just be sure to change 1194 in the tutorial to the correct number for you, and anywhere it says "UDP" to "TCP." You guessed it, there's a [ReadWrite tutorial][11] for this, too.

You can tell we’re building off of some more basic Raspberry Pi concepts, which is why building a VPN with Raspberry Pi isn't a good first project for most beginners. 

### A Quick Word Of Caution ###

I've pasted the actual code I used to complete this project, but when going back through the tutorial myself, I noticed that copying and pasting the code from the article onto the command line often results in errors due to spacing and formatting. If you are having a problem with any step of this tutorial, my first troubleshooting suggestion is to rewrite the command manually! 

### First Steps ###

1) Boot up and change your password. If you’re still using the default username (pi) and password (raspberry), it makes the rest of this security project totally pointless! 

Open up a terminal/PuTTY window and type:

    sudo passwd

Change the username and password to something strong and memorable ([Microsoft offers some tips][12]), otherwise why bother building a private network? 

2) Now let’s be safe and update the Raspberry Pi. There are two commands you want to input: 

    sudo apt-get update

    sudo apt-get upgrade

This shouldn’t take long, and it’ll save us a troubleshooting step later on. 

3) Next we need the open source software. Type: 

    sudo apt-get install openvpn

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%2010.22.19%20AM.png)

The Raspberry Pi is going to ask if you’re sure, since it uses up a bit of space. But since we prepared by getting an 8GB or bigger SD card, we’re totally fine. 

### Generating Keys ###

4) You don’t want anyone who finds your VPN server address to be able to connect. So next, we’re going to make a key for the server address. It’s just like keeping the door to your house locked. 

OpenVPN comes with Easy_RSA, a light and easy package for using the RSA encryption method. Developed in 1977, RSA was one of the first usable cryptosystems that is still used today. The encryption key is public, while the decryption key is secret. If you’ve read anything about how Bitcoin works, this might sound a bit familiar. 

With Easy_RSA, you run an algorithm that comes with the software to generate a new unique key. 

So first, let’s give ourselves superuser privileges. You’ll know it’s working when the command line prompt switches from “pi@raspberrypi” to “root@raspberrypi.”

    sudo -s

This command creates another instance of the window we’re working in, but with root privileges. The reason we need to do this is because if we don’t, the Raspberry Pi will try and tell us we don’t have permission to mess around with making keys. 

So next, we type:

    cp –r /usr/share/doc/openvpn/examples/easy-rsa/2.0 /etc/openvpn/easy-rsa 

Here, “cp” stands for copy and “-r” stands for recursive (having to do with smaller instances, too). That means we’re telling the computer, “Copy this directory and everything underneath it.” 

The space between **/2.0** and **/etc** means we’re copying the first address (an example file) into the second folder, which is where you’ll tell OpenVPN to find your keys. 

    cd /etc/openvpn/easy-rsa 

5) Next, we need to cd, or change directory, to the place we just moved the Easy_RSA file. Once there, we need to open the file **/etc/openvpn/easy-rsa/vars** for editing. We could do that by writing nano **/etc/openvpn/easy-rsa/vars**, but since we’re in the folder, there’s a shortcut:

    nano vars

Nano is a built-in editing tool on Raspbian, and while there are others out there for more tech-savvy people, we’re just going to use nano for all our text editing in this tutorial. 

Now, find and change EASY_RSA variable to: 

    export EASY_RSA=”/etc/openvpn/easy-rsa” 

For me, it was on line 13.  

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%2010.26.48%20AM.png)

Why make this change? Basically, you’re answering the computer’s question, “Where do you want the file to go to?” We want it to export to the same folder where we will keep our keys—in this case, the top level of the easy-rsa file tree. 

There’s one extra thing you can do in vars if you’re paranoid about the Illuminati reading your email—change the encryption method from 1024-bit to 2048-bit. The document literally says, “increase this to 2048 if you are paranoid.”  

But since that method makes keys take way longer to generate, we’re not doing it here. We’ll keep it looking like the text below:

    export KEY_SIZE=1024

Type **Control+X** to save your changes and exit the nano editor. 

### Getting Cryptographic ###

6) It’s time to build the CA Certificate and Root CA certificate. 

In cryptography, a certificate authority (CA) is an entity that issues digital certificates. The digital certificate certifies the ownership of a public key.

You probably use this all the time and don’t even know it. For example, when I log into my bank account, I see an HTTPS in front of the address. If I click on the lock, I see that a company called [GeoTrust][13] verified my bank website’s legitimacy, so I know it's not a phishing scam. (Of course, the recent [Heartbleed bug][14] revealed that HTTPS isn't the security measure we all used to think it was.)

In the case of Raspberry Pi, I’m acting as my own certificate authority and signing off on the OpenVPN keys myself, instead of trusting it to a third party company. 

    cd /etc/openvpn/easy-rsa  

Now that we’ve changed directories, type each of these lines one after another:

**source ./vars** → This “sources” or loads the vars document you edited earlier.

**./clean-all** → This will remove any previous keys, if there are any. If you have keys you don’t want to remove in this folder (like you’re doing this tutorial a second time), skip this command. 

**./build-ca** → This final line builds your certificate authority.

After the third command, the Raspberry Pi is going to shoot back with a bunch of optional fields for you to fill out if you want to—Country Name, State or Province Name, Locality Name, Organization Name, Organizational Unit, Common Name, Name, and Email Address. If you don't care to fill out these fields, just hit “enter” each instance to have the Pi fill in the default value. The screenshot below shows what that looks like:

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.32.35%20PM.png)

Now you can name the server. I creatively named mine “Server.” Call it whatever you want, but don’t forget it:

    ./build-key-server [Server_Name] 

Once again, the Pi is going to spit out some optional fields. Press enter or whatever you want, but pay attention to these three fields:  

**Common Name** MUST be the server name you picked. It should default to this.

**A challenge password?** MUST be left blank.

**Sign the certificate? [y/n]** Obviously, you must type “y.”

You’ll get a message that says the certificate will be certified for 3,650 more days. So basically if you use your VPN long enough, you’ll have to do this process again in 10 years.

**1 out of 1 certificate requests certified, commit? [y/n]** Obviously, type “y.”

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.35.28%20PM.png)

6) That’s the server side setup. Now it’s time to build keys for each user, or "client." I have five keys at home—one for each computer, tablet, and cell phone in the house. It’s possible to be lazy and create just one client key for all of them, but in that case, only one device would be able to access the VPN at a time.  

    ./build-key-pass UserName 

I found it simplest to make the usernames Client1, Client2, Client3… 

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.37.00%20PM.png)

And after that, more prompts! 

**Enter PEM pass phrase** Make it a password you will remember! It asks you to input this twice, so there’s no danger of ruining it. 

**A challenge password?** MUST be left blank.

**Sign the certificate? [y/n]** Signing certifies it for 10 more years.

    cd keys

    openssl rsa -in Client1.key -des3 -out Client1.3des.key 

The important takeaway from this string of text is that we’re using des3 encryption, in which a complex [encryptionalgorithm][15] that's applied three times to each data block to keep hackers from breaking through it with brute force. OpenSSL stands for an open source implementation of Secure Socket Layer, a standard method of setting up a secure connection. You need to perform this step for every client you set up. 

Some argue this step is unnecessary, and that you could simply skip this line. But if you’re running OpenVPN Connect clients on Android or iOS, this needs to be done. Otherwise, current versions could have difficulty parsing the keys you just generated. 

    Enter pass phrase for Client1.key

Honestly, I just used the same passphrase as before. And then two more times, as shown.

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.40.04%20PM.png)

Now that we’ve created a server certificate and (at least one) client certificate, type the following: 

    cd /etc/openvpn/easy-rsa/ 

OR

    cd .. 

Either way, the computer will take you up one directory, back to /easy-rsa/. 

7) Now let’s generate the [Diffie-Hellman key exchange][16]. This is the central code that makes your VPN server tick, an exchange that lets two entities with no prior knowledge of one another share secret keys over a public server. Like RSA, it’s one of the earliest cryptosystems out there.  

    ./build-dh

This could take a while, longer if you’re on 2048-bit encryption. There’s no way really to predict how long it will take because it is using random numbers and looking for some specific relationships. In fact, while I was making this tutorial, it only took 5 minutes with 1024-bit encryption.

![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.41.40%20PM.png)

8) Finally, we’re going to implement OpenVPN’s build-in Denial of Service (DoS) attack protection. You might already know that a DoS attack is successful when a hacker finds out your server’s address, and generates such a large number of access requests that your server crashes. 

OpenVPN has a way to prevent this kind of attack from occurring before it even starts by generating a static pre-shared [hash-based message authentication code][17] (HMAC) key. With this in place, the server won't even entertain the idea of authenticating an access request unless it detects this static key first. Thus, a hacker can’t just spam the server with random repeated requests. 

Generate the static HMAC key with the following line:

    openvpn –-genkey –-secret keys/ta.key

### Putting It All Together ###

9) We’ve generated keys and a Certificate Authority to sign them. What we’re still missing are the settings to tell OpenVPN how we want this server configured.

The OpenVPN program is already running. The problem is, it doesn’t know which keys to use, where you’re going to be connecting from, what kind of connection you’re building, or which IP address and port to use. 

Since we’re using Linux on a Raspberry Pi, there’s no graphical user interface (GUI) for telling OpenVPN what it needs to know. That’s why we have to actually create a .conf (configuration) file in the nano editor off of the command line. 

    nano /etc/openvpn/server.conf 

the reason we’re starting this address with /etc/openvpn is so it will end up in the openvpn folder. But for now, this file is completely blank. [Fill it in with this][18]. I commented in all caps where you absolutely need to change numbers and titles to your own IP address/names. Hit Control+X to save your changes. 

10) Let’s quickly edit another configuration file. By default, Raspbian does not forward Internet traffic. We need to edit another file to allow the Pi to forward Internet traffic through our new network. 

    nano /etc/sysctl.conf

Near the top it says, “Uncomment the next line to enable packet forwarding for IPv4.” I've highlighted that part of the file in the screenshot below. 
![](http://readwrite.com/files/Screen%20Shot%202014-04-09%20at%207.46.38%20PM.png)

To uncomment the line, remove the # immediately in front of it. This is setting up the configuration so it knows to forward to IPv4. Now that you’ve uncommented this line, the Pi has permission to act as a relay on the Internet instead of just a receiver, by both sending and receiving packets. 

Hit Control+X to save your changes. Apply these changes by typing the following command:

    sysctl -p 

The sysctl command “[configures kernel parameters at runtime][19].” The -p tells it to reload the file with the changes you just made. 

11) We just made a functioning server that can access the Internet. But we can’t use it yet because Raspbian has a built-in [firewall][20] that will block incoming connections. 

Raspbian has a firewall to protect your Raspberry Pi from unknown and unexpected Internet sources. We still want the firewall to protect us from most incoming and outgoing network traffic, but we need to poke an OpenVPN-shaped hole in the firewall. 

Additionally, Raspbian’s firewall configuration resets by default when you reboot the Pi. We want to make sure it remembers the OpenVPN connection is always permitted, so what we’re going to do is create a simple script which runs on boot:

    nano /etc/firewall-openvpn-rules.sh

This is currently a blank shell executable file. Fill it with this:

    #!/bin/sh 

    iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j SNAT --to-source 192.168.XX.X

Don’t forget to change the default IP address to your Pi’s IP address!

Let’s break this down: 10.8.0.0 is the default address for Raspberry Pi for clients that are connected to the VPN. "eth0" stands for ethernet port. Switch this to "wlan0" if you’re on a wireless connection, which is not recommended. Hit Control+X to save your changes.  

As a safety measure, files you create are not executable by default, so we’ll need to change the permissions and ownership of **/etc/firewall-openvpn-rules.sh**. First we’ll change the mode to [700][21] (owner can read, write, and execute). Then, we’ll change the owner to root, in which “root” is Linux’s standard name for the superuser. 

    chmod 700 /etc/firewall-Openvpn-rules.sh 

    chown root /etc/firewall-Openvpn-rules.sh

12) We’ve created the script that punches an OpenVPN-shaped hole in the firewall. Now we just need to inject it into the interfaces setup code so it runs on boot. 

    nano /etc/network/interfaces

Find the line that goes: “iface eth0 inet dhcp.” We want to add a line below it at an indent. So this is what the two lines, existing and new, will look like when you’re done:

    iface eth0 inet dhcp

    pre-up /etc/firewall-openvpn-rules.sh

Hit Control+X to save your changes (as you should be doing whenever you use nano). 

Finally, finally, finally: Reboot your Pi. 

    sudo reboot

Congratulations! That's the server! Again, it's no good if you don't have a client computer to connect with it, so remember the client names and keys you generated in step six, and then move onto [Part Two of this tutorial][22] to learn how to create an encrypted client side. 

Raspberry Pi Model B photo by [Tors][23]. All other screenshots by Lauren Orsini. Illustration via ReadWrite.

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/04/10/raspberry-pi-vpn-tutorial-server-secure-web-browsing

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://en.wikipedia.org/wiki/Virtual_private_network
[2]:http://netforbeginners.about.com/od/readerpicks/tp/The-Best-VPN-Service-Providers.htm
[3]:http://openvpn.net/
[4]:http://learn.adafruit.com/setting-up-a-raspberry-pi-with-noobs/overview
[5]:http://www.raspbian.org/
[6]:http://readwrite.com/2014/03/04/raspberry-pi-quantified-fish-acquarium
[7]:http://readwrite.com/2014/04/09/raspberry-pi-projects-ssh-remote-desktop-static-ip-tutorial?utm_content=readwrite3-orionautotweet&awesm=readwr.it_b1UN&utm_campaign=&utm_medium=readwr.it-twitter&utm_source=t.co#awesm=~oAXilI0BMOHsS3
[8]:http://en.wikipedia.org/wiki/Secure_Shell
[9]:http://readwrite.com/2014/04/09/raspberry-pi-projects-ssh-remote-desktop-static-ip-tutorial
[10]:http://en.wikipedia.org/wiki/User_Datagram_Protocol
[11]:http://readwrite.com/2014/04/09/raspberry-pi-projects-ssh-remote-desktop-static-ip-tutorial?utm_content=readwrite3-orionautotweet&awesm=readwr.it_b1UN&utm_campaign=&utm_medium=readwr.it-twitter&utm_source=t.co#awesm=~oAXilI0BMOHsS3
[12]:http://windows.microsoft.com/en-us/windows-vista/tips-for-creating-a-strong-password
[13]:http://www.geotrust.com/
[14]:http://readwrite.com/2014/04/08/heartbleed-openssl-bug-cryptography-web-security
[15]:http://osxdaily.com/2012/01/30/encrypt-and-decrypt-files-with-openssl/#
[16]:http://www.google.com/patents/US4200770
[17]:http://en.wikipedia.org/wiki/Hash-based_message_authentication_code
[18]:https://gist.github.com/laurenorsini/9925434
[19]:http://linux.about.com/library/cmd/blcmdl8_sysctl.htm
[20]:http://en.wikipedia.org/wiki/Firewall_(computing)
[21]:http://www.thinkplexx.com/learn/article/unix/command/chmod-permissions-flags-explained-600-0600-700-777-100-etc
[22]:http://readwrite.com/2014/04/11/building-a-raspberry-pi-vpn-part-two-creating-an-encrypted-client-side#awesm=~oB89WBfWrt21bV
[23]:http://commons.wikimedia.org/wiki/File:Raspberry_Pi_Model_B_Rev._2.jpg