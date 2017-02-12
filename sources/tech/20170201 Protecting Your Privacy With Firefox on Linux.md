translating by ypingcn

### Protecting Your Privacy With Firefox on Linux


Contents

*   *   [1. Introduction][12]
    *   [2. Firefox Settings][13]
        *   [2.1. Health Report][1]
        *   [2.2. Search][2]
        *   [2.3. Do Not Track][3]
        *   [2.4. Disable Pocket][4]
    *   [3. Add-ons][14]
        *   [3.1. HTTPS Everywhere][5]
        *   [3.2. Privacy Badger][6]
        *   [3.3. Ublock Origin][7]
        *   [3.4. NoScript][8]
        *   [3.5. Disconnect][9]
        *   [3.6. Random Agent Spoofer][10]
    *   [4. System Settings][15]
        *   [4.1. Private DNS][11]
    *   [5. Closing Thoughts][16]

### Introduction

Privacy and security are becoming increasingly important topics. Though it's impossible to be 100% secure, there are measures that you can take, especially on Linux, to help defend your online privacy and security when browsing the web. 

Firefox is probably your best option when selecting a browser for these purposes. Google Chrome cannot be trusted. It's owned by Google, a company known for data collection, and it's closed source. Chromium may be okay, but can't be guaranteed. Only Firefox has maintained a degree of commitment to user rights.

### Firefox Settings

 ![private browsing with firefox](https://linuxconfig.org/images/private-browsing-firefox-linux.jpg) 
There are some settings in Firefox that you can set to better protect your privacy. These are readily available and help to control the data that you share when you browse.

### Health Report

The first thing that you can set to limit the amount of data being sent is the Firefox health report. Sure, the data is just being sent to Mozilla, but it's still transmitting data. 

Open up the Firefox menu and click on "Preferences." Go to the "Advanced" tab on the side and click "Data Choices." There you can disable any data reporting.

### Search

By default, newer versions of Firefox use Yahoo as their search engine. Some distributions configure them to use Google instead. Either way isn't ideal. Firefox does have the option to use DuckDuckGo as the default instead. 

<center style="box-sizing: inherit;">
 ![Use DuckDuckGo on Firefox](https://linuxconfig.org/images/ff-ddg.jpg) 
</center>

To enable DuckDuckGo, open up the Firefox menu and click on "Preferences." Head over to "Search" on the side menu. Then, use the "Default Search Engine" drop down menu to select DuckDuckGo.

### Do Not Track

Do Not Track isn't perfect, but it does send a signal to sites telling them not to record your activity through analytics tools. Those sites may or may not comply, but it's still best to enable Do Not Track in case they do. 

<center style="box-sizing: inherit;">
 ![Enable Do Not Track on Firefox](https://linuxconfig.org/images/ff-tracking.jpg) 
</center>

Open the Firefox menu again. Click on "Preferences" then "Privacy." At the top of the page there is a "Tracking" section. In the line that reads, "You can also manage your Do Not Track settings," click the link. A pop-up will appear with a checkbox allowing you to enable Do Not Track.

### Disable Pocket

There is no evidence that Pocket is doing anything nefarious, but it may be a good idea to disable it anyway, since it does link to a proprietary application. 

Disabling Pocket isn't too difficult, but you have to be careful that Pocket is the only thing that you mess with. To get to the configuration that you need, type `about:config` in Firefox's address bar. 

The page will lode a table of settings. At the top of that table is a search bar. Search for "Pocket" there. 

You will be taken to a new table containing the results. You are looking for a setting called, "extensions.pocket.enabled." When you find it, double click on it to switch it to "false." You can edit the other Pocket related settings there too. It's not necessary, though. Just be sure not to edit anything that's not directly related to the Pocket extension.

<center style="box-sizing: inherit;">
 ![Disable Pocket on Firefox](https://linuxconfig.org/images/ff-pocket.jpg) 
</center>

### Add-ons

<center style="box-sizing: inherit;">
 ![Add-ons to help secure Firefox](https://linuxconfig.org/images/ff-addons.jpg) 
</center>

The most effective ways to protect your privacy and security in Firefox come from add-ons. Firefox has a massive add-on library, and many of those add-ons are free and open source software. The add-ons highlighted in this guide are among the best for securing your browser.

### HTTPS Everywhere

The Electronic Frontier Foundation developed HTTPS Everywhere in response to the large number of sites not using SSL certificates and the tendency for many links to not use the `https://` prefix and sending users to unsecured version of sites. HTTPS Everywhere ensures that if an encrypted version of a site exists, it is used. 

HTTPS Everywhere is available for Firefox through the Firefox Add-on Search here `https://addons.mozilla.org/en-us/firefox/addon/https-everywhere/`

### Privacy Badger

The Electronic Frontier Foundation is also behind Privacy Badger. Privacy Badger aims to pick up where Do Not Track leaves off by blocking unwanted tracking from websites. It is also available through the Firefox Add-on repository here `https://addons.mozilla.org/en-us/firefox/addon/privacy-badger17`.

### Ublock Origin

Now for one of the more commonly privacy add-ons, ad blocking. In this case, the ad-blocker of choice is uBlock Origin. uBlock Origin is a lighter weight ad blocker that doesn't make exceptions when it comes to which ads it blocks. uBlock Origin will generally block any ad, especially the more invasive ones. You can find uBlock Origin here `https://addons.mozilla.org/en-us/firefox/addon/ublock-origin/`.

### NoScript

Blocking JavaScript is a bit controversial. JavaScript powers so much of the web, yet it is also notorious for being a vehicle for privacy invasion and a myriad or attacks. NoScript is an excellent solution for dealing with JavaScript. 

<center style="box-sizing: inherit;">
 ![Add sites to NoScript's whitelist](https://linuxconfig.org/images/ff-noscript.jpg) 
</center>

NoScript is a JavaScript whitelist. It will block all JavaScript universally until a site is added to the whitelist. Adding a site can be done preemptively through the plugin's "Options" menu, or it can be done by clicking the NoScript icon while on the page. 

<center style="box-sizing: inherit;">
 ![Add the site you're on to NoScript's Whitelist](https://linuxconfig.org/images/ff-noscript2.jpg) 
</center>

NoScript is a available through the Firefox add-on repository `https://addons.mozilla.org/en-US/firefox/addon/noscript/`. If the page says that it is unsupported on your version of Firefox, click "Download Anyway." It's been tested and is working with Firefox 51.

### Disconnect

Disconnect does much the same thing as Privacy Badger. It just provides yet another barrier of protection. You can find it in the add-on repository `https://addons.mozilla.org/en-US/firefox/addon/disconnect/`. If the page says that your version of Firefox isn't supported, click "Download Anyway." It has been tested and is working with Firefox 51.

### Random Agent Spoofer

The Random Agent Spoofer can change the browser signature of Firefox to make it appear as though it is virtually any other browser on any other platform. Though it has many other applications, it also guards against browser fingerprinting. 

Browser Fingerprinting is yet another way that sites can track users based on the browser and operating system they are using. Browser fingerprinting affects Linux users and users of other "alternative" operating systems more than Windows users because their browser signatures are more unique. 

You can add the Random Agent Spoofer through the Firefox add-on repository `https://addons.mozilla.org/en-us/firefox/addon/random-agent-spoofer/`. Like some of the others, the page may say that it isn't compatible with the newest versions of Firefox, and again, that wouldn't be true. 

<center style="box-sizing: inherit;">
 ![Using Random Agent Spoofer on Firefox](https://linuxconfig.org/images/ff-random-agent.jpg) 
</center>

You can use the Random Agent Spoofer by clicking its icon on the Firefox menu bar. A drop down will appear with different browser options to emulate. One of the better options is to select "Random Desktop" and a random interval to change. This way, there is absolutely no pattern to track. It also ensures that you only get the desktop versions of sites.

### System Settings

### Private DNS

Avoid the use of Public or ISP DNS servers! Even though you configure your browser to the absolute privacy standard, your DNS query against public DNS server reveals all domains you have visited. Services such as Google Public DNS ( IP's: 8.8.8.8, 8.8.4.4 ) will log your IP address, information about your ISP and geolocation. This information may be shared as part of any legal processes and enforceable governmental requests.

> **What information does Google log when I use the Google Public DNS service?**
> 
> The Google Public DNS privacy page has a complete list of information that we collect. Google Public DNS complies with Google's main privacy policy, available at our Privacy Center. Your client IP address is only logged temporarily (erased within a day or two), but information about ISPs and city/metro-level locations are kept longer for the purpose of making our service faster, better, and more secure.
> REF: `https://developers.google.com/speed/public-dns/faq#privacy`

From this reason, if possible configure and use your private non-forwarding DNS server. Nowadays, this task may be as trivial as a deployment of some preconfigured DNS server Docker container on your local host. For example, given that the docker service is already installed on your system, the below command will deploy your private local DNS server:
```
# docker run -d --name bind9 -p 53:53/udp -p 53:53 fike/bind9
```
DNS server is now up and running:
```
# dig @localhost google.com
; <<>> DiG 9.9.5-9+deb8u6-Debian <<>> @localhost google.com                                                                                   
; (2 servers found)                                                                                                                           
;; global options: +cmd                                                                                                                       
;; Got answer:                                                                                                                                
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 51110                                                                                     
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 4, ADDITIONAL: 5

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;google.com.                    IN      A

;; ANSWER SECTION:
google.com.             242     IN      A       216.58.199.46
```
Now, set your nameserver within`/etc/resolv.conf `to:
```

nameserver 127.0.0.1
```

### Closing Thoughts

No security or privacy solution is perfect. The steps in this guide are definitely an improvement, though. If you are really serious about privacy, the Tor Browser `https://www.torproject.org/projects/torbrowser.html.en` is a better option. Tor is a bit overkill for daily use, but it actually does employ some of the same measures outlined in this guide.

--------------------------------------------------------------------------------

via: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux

作者：[Nick Congleton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux
[1]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h2-1-health-report
[2]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h2-2-search
[3]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h2-3-do-not-track
[4]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h2-4-disable-pocket
[5]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-1-https-everywhere
[6]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-2-privacy-badger
[7]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-3-ublock-origin
[8]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-4-noscript
[9]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-5-disconnect
[10]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-6-random-agent-spoofer
[11]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h4-1-private-dns
[12]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h1-introduction
[13]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h2-firefox-settings
[14]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-add-ons
[15]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h4-system-settings
[16]:https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h5-closing-thoughts
