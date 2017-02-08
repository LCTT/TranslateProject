translating by livc
4 ways to improve your security online right now
============================================================

 ![4 ways to improve your security online right now](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=VNmpz6K- "4 ways to improve your security online right now") 
Image by : Opensource.com

The last few years have seen a massive jump in the frequency of reports about digital security breaches and personal privacy issues, and no doubt this trend will continue. We hear about scammers moving to social media, nations using cyberattacks as part of coordinated offensive strategies, and the rise of companies making millions tracking our online behavior. 

Feeling apathetic about these events is all too easy, but you can do a great deal to improve your online security so that when you are caught up by a security event, you can mitigate the risk to yourself and quickly protect yourself from further risk. Security consciousness is surprisingly easy to learn, and many open source projects exist that can help you.

The point of security isn't to turn your computer into a virtual Fort Knox, but to make accessing your data a big enough task that attackers will move on to easier targets. 

### Get a password manager

In a world where almost every site you visit has a username and password requirement, most people are suffering from password fatigue and have developed complex systems to create and remember usernames and passwords (or have given up entirely and just use the same username and password everywhere). Password managers are the solution to this issue, and I don't know a single security professional that doesn't use them. Also, they are surprisingly easy to set up and use. 

For those who have not encountered one before, a password manager is software that acts like a digital vault for information, storing it in an encrypted environment. You create a master password, which is a single, strong password that protects access to a vault containing your collection of other username and passwords. Often password managers will auto-input stored passwords when you connect to a known site, generate strong passwords, and allow you to store other information. 

A good number of password managers are available, and many of them are FOSS solutions. I have personal experience with [KeePass][4] on Windows and [KeePassX][5] on Linux and MacOS, and I recommend them as a good place to start. (Here are three more [open source password managers][6] you might like to try.)

However, each person should choose the best solution his or her situation. Some password managers have cloud storage in addition to local storage, which can be useful if you use multiple devices. More popular managers are more likely to be maintained and receive regular security updates. Some password managers have 2FA integration, which I would highly recommend you enable along with any other account you have that incorporates it. 

Most password managers do not have a facility to recover forgotten master passwords. Choose wisely and make sure it's something you can or will remember. 

### Use a VPN to improve security on shared networks

Virtual private networks (VPNs) allow your computer to send and receive data over a shared network as if it was communicating directly with a server on a private network through end-to-end encryption.

You may be familiar with the process from connecting to your corporate intranet while working away from the office. While using a VPN that is connected to a public network at a cafe or hotel will protect you from others on the public network seeing your traffic, it does not stop your VPN provider from seeing that traffic, and disreputable providers have been known to collect and sell data. A VPN provider may also receive pressure from governments or law enforcement to pass on information about the data that you have sent over their network. For this reason, remember that VPNs do not protect if you are carrying out illicit activities.

When choosing a VPN provider, consider which country it operates from because these are the laws it will be bound by, and even the most innocuous of activities might land you in hot water.

[OpenVPN][7] is a free and open source VPN protocol that is available on most platforms and has become one of the most widely used VPNs. You can even host your own OpenVPN server—just be careful to implement it securely. If you would prefer to use a VPN service, remember that many reputable providers want your business.

Some charge a fee, like [ExpressVPN][8], [NordVPN][9], or [AirVPN][10]. Some providers offer free services; however, I would strongly recommend that you do not use them. Remember, when you aren't paying for the service, your data is the product. 

### Browser extensions are your friend

While Internet browsers have some built-in security tools, extensions are a great way to increase both your privacy and security. There's a huge variety of them though, so which extensions are the right ones for you? This probably depends on what you use the Internet for primarily and how tech savvy you are. As a baseline, I would use the following extensions:

*   [Privacy Badger​][1]: This extension, developed by the EFF, blocks spying adverts and hidden trackers. It works by putting a Do Not Track header in traffic requests and then evaluating how likely it is that the traffic is still being tracked. If that likelihood is high, it blocks further traffic from that domain unless you tell it otherwise. The extension is licensed under GNU GPL v3.
*   [HTTPS Everywhere​][2]: A joint collaboration between the EFF and The Tor Project, this extension ensures that HTTPS is used automatically wherever possible. This is important, because it means that your web traffic with a given domain is encrypted rather than in plain text, providing privacy and ensuring integrity of exchanged data. The extension is licensed under GNU GPL v3.

### Don't forget about old accounts

Do you remember Bebo, iTunes Ping, Del.icio.us, Digg, MySpace, or Friendster? Did you have accounts on any of them? Did you actually close your account or did you just stop using it? Have you ever stopped to wonder what information may be sitting on these sites, forgotten?

Old social media accounts can be a goldmine for those who trawl and collect data, including marketers, fraudsters, and hackers alike. They can use this information to build a picture of you as a person, and such information can often reveal important facts that are used for identification in password resets, such as the name of your first pet or what your first car was. 

Some sites can make deleting an account a difficult process or actually impossible. [Justdelete.me][11] is a great resource for finding instructions on how to delete social media accounts across a wide variety of platforms. If the website you're looking for isn't there and you find the information yourself, consider contributing to the project on GitHub. If you aren't sure of the social media accounts you may have forgotten about, [Knowem.com][12] allows you to search a large selection of social networks by user name. The search facility isn't immune to false positives though and you may not have been the only person to have ever used a given username, but it's a good starting place, despite not being open source. 

If you are unsure what old usernames you may have used, Google is a great resource. Try searching old nicknames and email addresses. You may be surprised by what you find. 

### Conclusion

Regardless of how monumental a task digital security can seem, you can lay a strong foundation when you get started. Remember that being secure is an ongoing process, rather than a state of being. Keep the tools you use up to date and periodically check your habits and tools to ensure your security is the best it can be. Security doesn't have to be overly complex if you take it one step at a time.

--------------------------------------------------------------------------------

作者简介：

Tiberius Hefflin - Tibbs recently graduated from the University of West of Scotland with a degree in computer security. She has relocated to Portland, OR, where she evangelizes for privacy and security while doing security assurance work for Portland General Electric. She is passionate about encouraging small children to take the plunge into STEM and about laughing at cats on the internet.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/4-ways-improve-your-online-security

作者：[Tiberius Hefflin][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/whatatiberius
[1]:https://www.eff.org/privacybadger
[2]:https://www.eff.org/Https-everywhere
[3]:https://opensource.com/article/17/1/4-ways-improve-your-online-security?rate=sa9kEW1QXWaWvvq4F5YWv2EhiAHVDoWOqzZS2a95Uas
[4]:http://keepass.info/
[5]:https://opensource.com/business/16/5/keepassx
[6]:https://opensource.com/article/16/12/password-managers
[7]:https://openvpn.net/
[8]:https://www.expressvpn.com/
[9]:https://nordvpn.com/
[10]:https://airvpn.org/
[11]:http://backgroundchecks.org/justdeleteme/
[12]:http://knowem.com/
[13]:https://opensource.com/user/108496/feed
[14]:https://opensource.com/article/17/1/4-ways-improve-your-online-security#comments
[15]:https://opensource.com/users/whatatiberius
