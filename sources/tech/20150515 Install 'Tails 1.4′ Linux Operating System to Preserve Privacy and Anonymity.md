Install ‘Tails 1.4′ Linux Operating System to Preserve Privacy and Anonymity
================================================================================
In this Internet world and the world of Internet we perform most of our task online be it Ticket booking, Money transfer, Studies, Business, Entertainment, Social Networking and what not. We spend a major part of our time online daily. It has been getting hard to remain anonymous with each passing day specially when backdoors are being planted by organizations like NSA (National Security Agency) who are putting their nose in between every thing that we come across online. We have least or no privacy online. All the searches are logged upon the basis of user Internet surfing activity and machine activity.

A wonderful browser from Tor project is used by millions which help us surfing the web anonymously however it is not difficult to trace your browsing habits and hence tor alone is not the guarantee of your safety online. You may like to check Tor features and installation instructions here:

- [Anonymous Web Browsing using Tor][1]

There is a operating system named Tails by Tor Projects. Tails (The Amnesic Incognito Live System) is a live operating system, based on Debian Linux distribution, which mainly focused on preserving privacy and anonymity on the web while browsing internet, means all it’s outgoing connection are forced to pass through the Tor and direct (non-anonymous) requests are blocked. The system is designed to run from any boot-able media be it USB stick or DVD.

The latest stable release of Tails OS is 1.4 which was released on May 12, 2015. Powered by open source Monolithic Linux Kernel and built on top of Debian GNU/Linux Tails aims at Personal Computer Market and includes GNOME 3 as default user Interface.

#### Features of Tails OS 1.4 ####

- Tails is a free operating system, free as in beer and free as in speech.
- Built on top of Debian/GNU Linux. The most widely used OS that is Universal.
- Security Focused Distribution.
- Windows 8 camouflage.
- Need not to be installed and browse Internet anonymously using Live Tails CD/DVD.
- Leave no trace on the computer, while tails is running.
- Advanced cryptographic tools used to encrypt everything that concerns viz., files, emails, etc.
- Sends and Receive traffic through tor network.
- In true sense it provides privacy for anyone, anywhere.
- Comes with several applications ready to be used from Live Environment.
- All the softwares comes per-configured to connect to INTERNET only through Tor network.
- Any application that tries to connect to Internet without Tor Network is blocked, automatically.
- Restricts someone who is watching what sites you visit and restricts sites to learn your geographical location.
- Connect to websites that are blocked and/or censored.
- Designed specially not to use space used by parent OS even when there is free swap space.
- The whole OS loads on RAM and is flushed when we reboot/shutdown. Hence no trace of running.
- Advanced security implementation by encrypting USB disk, HTTPS ans Encrypt and sign emails and documents.

#### What can you expect in Tails 1.4 ####

- Tor Browser 4.5 with a security Slider.
- Tor Upgraded to version 0.2.6.7.
- Several Security holes fixed.
- Many of the bug fixed and patches applied to Applications like curl, OpenJDK 7, tor Network, openldap, etc.

To get a complete list of change logs you may visit [HERE][2]

**Note**: It is strongly recommended to upgrade to Tails 1.4, if you’re using any older version of Tails.

#### Why should I use Tails Operating System ####

You need Tails because you need:

- Freedom from network surveillance
- Defend freedom, privacy and confidentiality
- Security aka traffic analysis

This tutorial will walk through the installation of Tails 1.4 OS with a short review.

### Tails 1.4 Installation Guide ###

1. To download the latest Tails OS 1.4, you may use wget command to download directly.

    $ wget http://dl.amnesia.boum.org/tails/stable/tails-i386-1.4/tails-i386-1.4.iso

Alternatively you may download Tails 1.4 Direct ISO image or use a Torrent Client to pull the iso image file for you. Here is the link to both downloads:

- [tails-i386-1.4.iso][3]
- [tails-i386-1.4.torrent][4]

2. After downloading, verify ISO Integrity by matching SHA256 checksum with the SHA256SUM provided on the official website..

    $ sha256sum tails-i386-1.4.iso
    
    339c8712768c831e59c4b1523002b83ccb98a4fe62f6a221fee3a15e779ca65d

If you are interested in knowing OpenPGP, checking Tails signing key against Debian keyring and anything related to Tails cryptographic signature, you may like to point your browser [HERE][5].

3. Next you need to write the image to USB stick or DVD ROM. You may like to check the article, [How to Create Live Bootable USB][6] for details on how to make a flash drive bootable and write ISO to it.

4. Insert the Tails OS Bootable flash drive or DVD ROM in the disk and boot from it (select from BIOS to boot). The first screen – two options to select from ‘Live‘ and ‘Live (failsafe)‘. Select ‘Live‘ and press Enter.

![Tails Boot Menu](http://www.tecmint.com/wp-content/uploads/2015/05/1.png)
Tails Boot Menu

5. Just before login. You have two options. Click ‘More Options‘ if you want to configure and set advanced options else click ‘No‘.

![Tails Welcome Screen](http://www.tecmint.com/wp-content/uploads/2015/05/2.png)
Tails Welcome Screen

6. After clicking Advanced option, you need to setup root password. This is important if you want to upgrade it. This root password is valid till you shutdown/reboot the machine.

Also you may enable Windows Camouflage, if you want to run this OS on a public place, so that it seems as you are running Windows 8 operating system. Good option indeed! Is not it? Also you have a option to configure Network and Mac Address. Click ‘Login‘ when done!.

![Tails OS Configuration](http://www.tecmint.com/wp-content/uploads/2015/05/3.png)
Tails OS Configuration

7. This is Tails GNU/Linux OS camouflaged by Windows Skin.

![Tails Windows Look](http://www.tecmint.com/wp-content/uploads/2015/05/4.jpg)
Tails Windows Look

8. It will start Tor Network in the background. Check the Notification on the top-right corner of the screen – Tor is Ready / You are now connected to the Internet.

Also check what it contains under Internet Menu. Notice – It has Tor Browser (safe) and Unsafe Web Browser (Where incoming and outgoing data don’t pass through TOR Network) along with other applications.

![Tails Menu and Tools](http://www.tecmint.com/wp-content/uploads/2015/05/5.jpg)
Tails Menu and Tools

9. Click Tor and check your IP Address. It confirms my physical location is not shared and my privacy is intact.

![Check Privacy on Tails](http://www.tecmint.com/wp-content/uploads/2015/05/6.jpg)
Check Privacy on Tails

10. You may Invoke Tails Installer to clone & Install, Clone & Upgrade and Upgrade from ISO.

![Tails Installer Options](http://www.tecmint.com/wp-content/uploads/2015/05/7.jpg)
Tails Installer Options

11. The other option was to select Tor without any advanced option, just before login (Check step #5 above).

![Tails Without Advance Option](http://www.tecmint.com/wp-content/uploads/2015/05/8.png)
Tails Without Advance Option

12. You will get log-in to Gnome3 Desktop Environment.

![Tails Gnome Desktop](http://www.tecmint.com/wp-content/uploads/2015/05/9.png)
Tails Gnome Desktop

13. If you click to Launch Unsafe browser in Camouflage or without Camouflage, you will be notified.

![Tails Browsing Notification](http://www.tecmint.com/wp-content/uploads/2015/05/10.png)
Tails Browsing Notification

If you do, this is what you get in a Browser.

![Tails Browsing Alert](http://www.tecmint.com/wp-content/uploads/2015/05/11.png)
Tails Browsing Alert

#### Is Tails for me? ####

To get the above question answered, first answer a few question.

- Do you need your privacy to be intact while you are online?
- Do you want to remain hidden from Identity thieves?
- Do you want somebody to put your nose in between your private chat online?
- Do you really want to show your geographical location to anybody there?
- Do you carry out banking transactions online?
- Are you happy with the censorship by government and ISP?

If the answer to any of the above question is ‘YES‘ you preferably need Tails. If answer to all the above question is ‘NO‘ you perhaps don’t need it.

To know more about Tails? Point your browser to user Documentation : [https://tails.boum.org/doc/index.en.html][7]

### Conclusion ###

Tails is an OS which is must for those who work in an unsafe environment. An OS focused on security yet contains bundles of Application – Gnome Desktop, Tor, Firefox (Iceweasel), Network Manager, Pidgin, Claws mail, Liferea feed addregator, Gobby, Aircrack-ng, I2P.

It also contain several tools for Encryption and Privacy Under the Hood, viz., LUKS, GNUPG, PWGen, Shamir’s Secret Sharing, Virtual Keyboard (against Hardware Keylogging), MAT, KeePassX Password Manager, etc.

That’s all for now. Keep Connected to Tecmint. Share your thoughts on Tails GNU/Linux Operating System. What do you think about the future of the Project? Also test it Locally and let us know your experience.

You may run it in [Virtualbox][8] as well. Remember Tails loads the whole OS in RAM hence give enough RAM to run Tails in VM.

I tested in 1GB Environment and it worked without lagging. Thanks to all our readers for their Support. In making Tecmint a one place for all Linux related stuffs your co-operation is needed. Kudos!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-tails-1-4-linux-operating-system-to-preserve-privacy-and-anonymity/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/tor-browser-for-anonymous-web-browsing/
[2]:https://tails.boum.org/news/version_1.4/index.en.html
[3]:http://dl.amnesia.boum.org/tails/stable/tails-i386-1.4/tails-i386-1.4.iso
[4]:https://tails.boum.org/torrents/files/tails-i386-1.4.torrent
[5]:https://tails.boum.org/download/index.en.html#verify
[6]:http://www.tecmint.com/install-linux-from-usb-device/
[7]:https://tails.boum.org/doc/index.en.html
[8]:http://www.tecmint.com/install-virtualbox-on-redhat-centos-fedora/