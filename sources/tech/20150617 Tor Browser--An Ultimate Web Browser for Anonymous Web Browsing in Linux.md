Tor Browser: An Ultimate Web Browser for Anonymous Web Browsing in Linux
================================================================================
Most of us give a considerable time of ours to Internet. The primary Application we require to perform our internet activity is a browser, a web browser to be more perfect. Over Internet most of our’s activity is logged to Server/Client machine which includes IP address, Geographical Location, search/activity trends and a whole lots of Information which can potentially be very harmful, if used intentionally the other way.

![Install Tor Browser in Linux](http://www.tecmint.com/wp-content/uploads/2014/04/Install-tor-browser-in-linux.jpg)

Tor Browser: Anonymous Browsing

Moreover the National Security Agency (NSA) aka International Spying Agency keeps tracks of ours digital footprints. Not to mention a restricted proxy server which again can be used as data ripping server is not the answer. And most of the corporates and companies wont allow you to access a proxy server.

So, what we need here is an application, preferably small in size and let it be standalone, portable and which servers the purpose. Here comes an application – the Tor Browser, which has all the above discussed features and even beyond that.

In this article we will be discussing Tor browser, its features, its usages and Area of Application, Installation and other important aspects of The Tor Browser Application.

#### What is Tor Browser? ####

Tor is a Freely distributed Application Software, released under BSD style Licensing which allows to surf Internet anonymously, through its safe and reliable onion like structure. Tor previously was called as ‘The Onion Router‘ because of its structure and functioning mechanism. This Application is written in C programming Language.

#### Features of Tor Browser ####

- Cross Platform Availability. i.e., this application is available for Linux, Windows as well as Mac.
- Complex Data encryption before it it sent over Internet.
- Automatic data decryption at client side.
- It is a combination of Firefox Browser + Tor Project.
- Provides anonymity to servers and websites.
- Makes it possible to visit locked websites.
- Performs task without revealing IP of Source.
- Capable of routing data to/from hidden services and application behind firewall.
- Portable – Run a preconfigured web browser directly from the USB storage Device. No need to install it locally.
- Available for architectures x86 and x86_64.
- Easy to set FTP with Tor using configuration as “socks4a” proxy on “localhost” port “9050”
- Tor is capable of handling thousands of relay and millions of users.

#### How Tor Browser Works? ####

Tor works on the concept of Onion routing. Onion routing resemble to onion in structure. In onion routing the layers are nested one over the other similar to the layers of onion. This nested layer is responsible for encrypting data several times and sends it through virtual circuits. On the client side each layer decrypt the data before passing it to the next level. The last layer decrypts the innermost layer of encrypted data before passing the original data to the destination.

In this process of decryption all the layers function so intelligently that there is no need to reveal IP and Geographical location of User thus limiting any chance of anybody watching your internet connection or the sites you are visiting.

All these working seems a bit complex, but the end user execution and working of Tor browser is nothing to worry about. In-fact Tor browser resembles any other browser (Especially Mozilla Firefox) in functioning.

### Installation of Tor Browser in Linux ###

As discussed above, Tor browser is available for Linux, Windows and Mac. The user need to download the latest version (i.e. Tor Browser 4.0.4) application from the link below as per their system and architecture.

- [https://www.torproject.org/download/download-easy.html.en][1]

After downloading the Tor browser, we need to install it. But the good thing with ‘Tor’ is that we don’t need to install it. It can run directly from a Pen Drive and the browser can be preconfigured. That means plug and Run Feature in perfect sense of Portability.

After downloading the Tar-ball (*.tar.xz) we need to Extract it.

**On 32-Bit System**

    $ wget https://www.torproject.org/dist/torbrowser/4.0.4/tor-browser-linux32-4.0.4_en-US.tar.xz
    $ tar xpvf tor-browser-linux32-4.0.4_en-US.tar.xz

**On 64-Bit System**

    $ wget https://www.torproject.org/dist/torbrowser/4.0.4/tor-browser-linux64-4.0.4_en-US.tar.xz
    $ tar -xpvf tor-browser-linux64-4.0.4_en-US.tar.xz 

**Note** : In the above command we used ‘$‘ which means that the package is extracted as user and not root. It is strictly suggested to extract and run tor browser not as root.

After successful extraction, we can move the extracted browser to anywhere/USB Mass Storage device. And run the application from the extracted folder and run ‘start-tor-browser’ strictly not as root.

    $ cd tor-browser_en-US
    $ ./start-tor-browser

![Starting Tor Browser](http://www.tecmint.com/wp-content/uploads/2014/04/Starting-Tor-Network.jpg)

Starting Tor Browser

**1. Trying to connect to the Tor Network. Click “Connect” and Tor will do rest of the settings for you.**

![Connecting to Tor Network](http://www.tecmint.com/wp-content/uploads/2014/04/Tor-Network-Settings.jpg)

Connecting to Tor Network

**2. The welcome Window/Tab.**

![Tor Welcome Screen](http://www.tecmint.com/wp-content/uploads/2014/04/Tor-Welcome-Screen.png)

Tor Welcome Screen

**3. Tor Browser Running a Video from Youtube.**

![Watching Video on Youtube](http://www.tecmint.com/wp-content/uploads/2014/04/Watching-Video-on-Youtube.jpg)

Watching Video on Youtube

**4. Opening a banking site for online Purchasing/Transaction.**

![Browsing a Banking Site](http://www.tecmint.com/wp-content/uploads/2014/04/Browsing-Site.jpg)

Browsing a Banking Site

**5. The browser showing my current proxy IP. Note that the text that reads “Proxy Server detected”.**

![Checking IP Address](http://www.tecmint.com/wp-content/uploads/2014/04/Checking-IP-Address.jpg)

Checking IP Address

**Note**: That you need to point to the Tor startup script using text session, everytime you want to run Tor. Moreover a terminal will be busy all the time till you are running tor. How to overcome this and create a desktop/dock-bar Icon?

6. We need to create `tor.desktop` file inside the directory where extracted files resides.

$ touch tor.desktop

Now edit the file using your favourite editor with the text below. Save and exit. I used nano.

    $ nano tor.desktop 

----------

    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Encoding=UTF-8
    Name=Tor
    Comment=Anonymous Browse
    Type=Application
    Terminal=false
    Exec=/home/avi/Downloads/tor-browser_en-US/start-tor-browser
    Icon=/home/avi/Downloads/tor-browser_en-US/Browser/browser/icons/mozicon128.png
    StartupNotify=true
    Categories=Network;WebBrowser;

**Note**: Make sure to replace the path with the location of your tor browser in the above.

**7. Once done! Double click the file `tor.desktop` to fire Tor browser. You may need to trust it for the first time.**

![Tor Application Launcher](http://www.tecmint.com/wp-content/uploads/2014/04/Tor-Application-Launcher.jpg)

Tor Application Launcher

**8. Once you trust you might note that the icon of `tor.desktop` changed.**

![Tor icon Changed](http://www.tecmint.com/wp-content/uploads/2014/04/Tor-icon-changed.jpg)

Tor icon Changed

9. You may drag and drop the `tor.desktop` icon to create shortcut on Desktop and Dock Bar.

![Add Tor Shortcut on Desktop](http://www.tecmint.com/wp-content/uploads/2014/04/Add-Tor-Shortcut-on-Desktop.jpg)

Add Tor Shortcut on Desktop

**10. About Tor Browser.**

![About Tor Browser](http://www.tecmint.com/wp-content/uploads/2014/04/About-Tor-Browser.jpg)

About Tor Browser

**Note**: If you are using older version of Tor, you may update it from the above window.

#### Usability/Area of Application ####

- Anonymous communication over web.
- Surf to Blocked web Pages.
- Link other Application Viz (FTP) to this secure Internet Browsing Application.

#### Controversies of Tor-browser ####

- No security at the boundary of Tor Application i.e., Data Entry and Exit Points.
- A study in 2011 reveals that a specific way of attacking Tor will reveal IP address of BitTorrent Users.
- Some protocols shows the tendency of leaking IP address, revealed in a study.
- Earlier version of Tor bundled with older versions of Firefox browser were found to be JavaScript Attack Vulnerable.
- Tor Browser Seems to Work slow.

#### Real world Implementation of Tor-browser ####

- Vuze BitTorrent Client
- Anonymous Os
- Os’es from Scratch
- whonix, etc.

#### Future of Tor Browser ####

Tor browser is promising. Perhaps the first application of its kind is implemented very brilliantly. Tor browser must invest for Support, Scalability and research for securing the data from latest attacks. This application is need of the future.

#### Download Free eBook ####

Unofficial Guide to Tor Private Browsing

[![](http://img.tradepub.com/free/w_make129/images/w_make129c4.gif)][2]

### Conclusion ###

Tor bowser is a must tool in the present time where the organization you are working for don’t allow you to access certain websites or if you don’t want others to look into your private business or you don’t want to provide your digital footprints to NSA.

**Note**: Tor Browser don’t provide any safety from Viruses, Trojans or other threats of this kind. Moreover by writing an article of this we never mean to indulge into illegal activity by hiding our identity over Internet. This Post is totally for educational Purpose and for any illegal use of it neither the author of the post nor Tecmint will be responsible. It is the sole responsibility of user.

Tor-browser is a wonderful application and you must give it a try. That’s all for now. I’ll be here again with another interesting article you people will love to read. Till then stay tuned and connected to Tecmint. Don’t forget to provide us with your value-able feedback in our comment section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/tor-browser-for-anonymous-web-browsing/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://www.torproject.org/download/download-easy.html.en
[2]:http://tecmint.tradepub.com/free/w_make129/prgm.cgi