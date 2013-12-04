翻译中 by小眼儿

How to Crack a Wi-Fi Network's WPA Password with Reaver
================================================================================
![](http://img.gawkerassets.com/img/17pw3mgej3x93jpg/ku-xlarge.jpg)

Your Wi-Fi network is your conveniently wireless gateway to the internet, and since you're not keen on sharing your connection with any old hooligan who happens to be walking past your home, you secure your network with a password, right? Knowing, as you might, how [easy it is to crack a WEP password][1], you probably secure your network using the more bulletproof WPA security protocol.

Here's the bad news: A new, free, open-source tool called [Reaver][2] exploits a security hole in wireless routers and can crack most routers' current passwords with relative ease. Here's how to crack a WPA or WPA2 password, step by step, with Reaver—and how to protect your network against Reaver attacks.

In the first section of this post, I'll walk through the steps required to crack a WPA password using Reaver. You can follow along with either the video or the text below. After that, I'll explain how Reaver works, and what you can do to protect your network against Reaver attacks.

[http://www.youtube.com/embed/z1c1OIMbmb0?wmode=transparent&rel=0&autohide=1&showinfo=0&enablejsapi=1][3]

First, a quick note: As we remind often remind readers when we discuss topics that appear potentially malicious: Knowledge is power, but power doesn't mean you should be a jerk, or do anything illegal. Knowing how to pick a lock doesn't make you a thief. Consider this post educational, or a proof-of-concept intellectual exercise. The more you know, the better you can protect yourself.

### What You'll Need ###

You don't have to be a networking wizard to use Reaver, the command-line tool that does the heavy lifting, and if you've got a blank DVD, a computer with compatible Wi-Fi, and a few hours on your hands, you've got basically all you'll need. There are a number of ways you could set up Reaver, but here are the specific requirements for this guide:

![](http://img.gawkerassets.com/img/194pra0777vwyjpg/ku-xlarge.jpg)

- [**The BackTrack 5 Live DVD**][4]. BackTrack is a bootable Linux distribution that's filled to the brim with network testing tools, and while it's not strictly required to use Reaver, it's the easiest approach for most users. Download the Live DVD [from BackTrack's download page][5] and burn it to a DVD. You can alternately download a virtual machine image if you're using VMware, but if you don't know what VMware is, just stick with the Live DVD. As of this writing, that means you should select BackTrack 5 R3 from the Release drop-down, select Gnome, 32- or 64-bit depending on your CPU (if you don't know which you have, 32 is a safe bet), ISO for image, and then download the ISO.

- **A computer with Wi-Fi and a DVD drive**. BackTrack will work with the wireless card on most laptops, so chances are your laptop will work fine. However, BackTrack doesn't have a full compatibility list, so no guarantees. You'll also need a DVD drive, since that's how you'll boot into BackTrack. I used a six-year-old MacBook Pro.

- **A nearby WPA-secured Wi-Fi network**. Technically, it will need to be a network using WPA security with the WPS feature enabled. I'll explain in more detail in the "How Reaver Works" section how WPS creates the security hole that makes WPA cracking possible.

- **A little patience**. This is a 4-step process, and while it's not terribly difficult to crack a WPA password with Reaver, it's a brute-force attack, which means your computer will be testing a number of different combinations of cracks on your router before it finds the right one. When I tested it, Reaver took roughly 2.5 hours to successfully crack my password. The [Reaver home page][6] suggests it can take anywhere from 4-10 hours. Your mileage may vary.

### Let's Get Crackin' ###

At this point you should have BackTrack burned to a DVD, and you should have your laptop handy.

#### Step 1: Boot into BackTrack ####

To boot into BackTrack, just put the DVD in your drive and boot your machine from the disc. (Google around if you don't know anything about live CDs/DVDs and need help with this part.) During the boot process, BackTrack will prompt you to to choose the boot mode. Select "BackTrack Text - Default Boot Text Mode" and press Enter.

Eventually BackTrack will boot to a command line prompt. When you've reached the prompt, type `startx` and press Enter. BackTrack will boot into its graphical interface.

#### Step 2: Install Reaver ####

Update: This step is no longer necessary, as Reaver comes pre-installed on Backtrack 5 R3. Skip down to Step 3.

Reaver has been added to the bleeding edge version of BackTrack, but it's not yet incorporated with the live DVD, so as of this writing, you need to install Reaver before proceeding. (Eventually, Reaver will simply be incorporated with BackTrack by default.) To install Reaver, you'll first need to connect to a Wi-Fi network that you have the password to.

1. Click Applications > Internet > Wicd Network Manager
1. Select your network and click Connect, enter your password if necessary, click OK, and then click Connect a second time.

Now that you're online, let's install Reaver. Click the Terminal button in the menu bar (or click Applications > Accessories > Terminal). At the prompt, type:

    apt-get update

And then, after the update completes:

    apt-get install reaver

If all went well, Reaver should now be installed. It may seem a little lame that you need to connect to a network to do this, but it will remain installed until you reboot your computer. At this point, go ahead and disconnect from the network by opening Wicd Network Manager again and clicking Disconnect. (You may not strictly need to do this. I did just because it felt like I was somehow cheating if I were already connected to a network.)

#### Step 3: Gather Your Device Information, Prep Your Crackin' ####

In order to use Reaver, you need to get your wireless card's interface name, the BSSID of the router you're attempting to crack (the BSSID is a unique series of letters and numbers that identifies a router), and you need to make sure your wireless card is in monitor mode. So let's do all that.

**Find your wireless card:** Inside Terminal, type:

    iwconfig

Press Enter. You should see a wireless device in the subsequent list. Most likely, it'll be named `wlan0`, but if you have more than one wireless card, or a more unusual networking setup, it may be named something different.

![](http://img.gawkerassets.com/img/194prsh4oyo2mjpg/ku-xlarge.jpg)

**Put your wireless card into monitor mode**: Assuming your wireless card's interface name is `wlan0`, execute the following command to put your wireless card into monitor mode:

    airmon-ng start wlan0

This command will output the name of monitor mode interface, which you'll also want to make note of. Most likely, it'll be `mon0`, like in the screenshot below. Make note of that.

![](http://img.gawkerassets.com/img/194prrjkz8yorjpg/ku-xlarge.jpg)

**Find the BSSID of the router you want to crack**: Lastly, you need to get the unique identifier of the router you're attempting to crack so that you can point Reaver in the right direction. To do this, execute the following command:

    airodump-ng wlan0

(Note: If `airodump-ng wlan0` doesn't work for you, you may want to try the monitor interface instead—e.g., `airodump-ng mon0`.)

You'll see a list of the wireless networks in range—it'll look something like the screenshot below:

![](http://img.gawkerassets.com/img/194prtyebc284jpg/ku-xlarge.jpg)

When you see the network you want, press Ctrl+C to stop the list from refreshing, then copy that network's BSSID (it's the series of letters, numbers, and colons on the far left). The network should have WPA or WPA2 listed under the ENC column. (If it's WEP, use our [previous guide to cracking WEP passwords][7].)

Now, with the BSSID and monitor interface name in hand, you've got everything you need to start up Reaver.

#### Step 4: Crack a Network's WPA Password with Reaver ####

Now execute the following command in the Terminal, replacing `bssid` and moninterface with the BSSID and monitor interface and you copied down above:

    reaver -i moninterface -b bssid -vv

For example, if your monitor interface was `mon0` like mine, and your BSSID was `8D:AE:9D:65:1F:B2` (a BSSID I just made up), your command would look like:

    reaver -i mon0 -b 8D:AE:9D:65:1F:B2 -vv

Press Enter, sit back, and let Reaver work its disturbing magic. Reaver will now try a series of PINs on the router in a brute force attack, one after another. This will take a while. In my successful test, Reaver took 2 hours and 30 minutes to crack the network and deliver me with the correct password. As mentioned above, the Reaver documentation says it can take between 4 and 10 hours, so it could take more or less time than I experienced, depending. When Reaver's cracking has completed, it'll look like this:

![](http://img.gawkerassets.com/img/18qpo7omnvkbejpg/ku-medium.jpg)

**A few important factors to consider**: Reaver worked exactly as advertised in my test, but it won't necessarily work on all routers (see more below). Also, the router you're cracking needs to have a relatively strong signal, so if you're hardly in range of a router, you'll likely experience problems, and Reaver may not work. Throughout the process, Reaver would sometimes experience a timeout, sometimes get locked in a loop trying the same PIN repeatedly, and so on. I just let it keep on running, and kept it close to the router, and eventually it worked its way through.

Also of note, you can also pause your progress at any time by pressing Ctrl+C while Reaver is running. This will quit the process, but Reaver will save any progress so that next time you run the command, you can pick up where you left off-as long as you don't shut down your computer (which, if you're running off a live DVD, will reset everything).

### How Reaver Works ###

Now that you've seen how to use Reaver, let's take a quick overview of how Reaver works. The tool takes advantage of a vulnerability in something called Wi-Fi Protected Setup, or WPS. It's a feature that exists on many routers, intended to provide an easy setup process, and it's tied to a PIN that's hard-coded into the device. Reaver exploits a flaw in these PINs; the result is that, with enough time, it can reveal your WPA or WPA2 password.

Read more details about the vulnerability at [Sean Gallagher's excellent post on Ars Technica][8].

### How to Protect Yourself Against Reaver Attacks ###

Since the vulnerability lies in the implementation of WPS, your network should be safe if you can simply turn off WPS (or, even better, if your router doesn't support it in the first place). Unfortunately, as Gallagher [points out as Ars][9], even with WPS manually turned off through his router's settings, Reaver was still able to crack his password.

> In a phone conversation, Craig Heffner said that the inability to shut this vulnerability down is widespread. He and others have found it to occur with every Linksys and Cisco Valet wireless access point they've tested. "On all of the Linksys routers, you cannot manually disable WPS," he said. While the Web interface has a radio button that allegedly turns off WPS configuration, "it's still on and still vulnerable.

So that's kind of a bummer. You may still want to try disabling WPS on your router if you can, and test it against Reaver to see if it helps.

You could also set up MAC address filtering on your router (which only allows specifically whitelisted devices to connect to your network), but a sufficiently savvy hacker could detect the MAC address of a whitelisted device and use MAC address spoofing to imitate that computer.

Double bummer. So what will work?

I have the open-source router firmware [DD-WRT][10] installed on my router and I was unable to use Reaver to crack its password. As it turns out, [DD-WRT does not support WPS][11], so there's yet another reason to love the free router-booster. If that's got you interested in DD-WRT, check their [supported devices list][12] to see if your router's supported. It's a good security upgrade, and DD-WRT can also do cool things like [monitor your internet usage][13], [set up a network hard drive][14], act as a [whole-house ad blocker][15], [boost the range of your Wi-Fi network][16], and more. It essentially [turns your $60 router into a $600 router][17].

--------------------------------------------------------------------------------

via: http://lifehacker.com/5873407/how-to-crack-a-wi+fi-networks-wpa-password-with-reaver

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://lifehacker.com/5305094/how-to-crack-a-wi+fi-networks-wep-password-with-backtrack
[2]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fcode.google.com%2Fp%2Freaver-wps%2F&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5873407%2Fhow-to-crack-a-wi%2Bfi-networks-wpa-password-with-reaver&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[3]:http://www.youtube.com/embed/z1c1OIMbmb0?wmode=transparent&rel=0&autohide=1&showinfo=0&enablejsapi=1
[4]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fwww.backtrack-linux.org%2Fdownloads%2F&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5873407%2Fhow-to-crack-a-wi%2Bfi-networks-wpa-password-with-reaver&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[5]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fwww.backtrack-linux.org%2Fdownloads%2F&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5873407%2Fhow-to-crack-a-wi%2Bfi-networks-wpa-password-with-reaver&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[6]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fcode.google.com%2Fp%2Freaver-wps%2F&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5873407%2Fhow-to-crack-a-wi%2Bfi-networks-wpa-password-with-reaver&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[7]:http://lifehacker.com/5305094/how-to-crack-a-wi+fi-networks-wep-password-with-backtrack
[8]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Farstechnica.com%2Fbusiness%2Fnews%2F2011%2F12%2Fresearchers-publish-open-source-tool-for-hacking-wifi-protected-setup.ars&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5873407%2Fhow-to-crack-a-wi%2Bfi-networks-wpa-password-with-reaver&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[9]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Farstechnica.com%2Fbusiness%2Fnews%2F2012%2F01%2Fhands-on-hacking-wifi-protected-setup-with-reaver.ars&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5873407%2Fhow-to-crack-a-wi%2Bfi-networks-wpa-password-with-reaver&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[10]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fdd-wrt.com%2F&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5873407%2Fhow-to-crack-a-wi%2Bfi-networks-wpa-password-with-reaver&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[11]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fcode.google.com%2Fp%2Freaver-wps%2Fissues%2Fdetail%3Fid%3D44&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5873407%2Fhow-to-crack-a-wi%2Bfi-networks-wpa-password-with-reaver&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[12]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fdd-wrt.com%2Fwiki%2Findex.php%2FSupported_Devices&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5873407%2Fhow-to-crack-a-wi%2Bfi-networks-wpa-password-with-reaver&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[13]:http://lifehacker.com/5821773/how-to-monitor-your-internet-usage-so-you-dont-exceed-your-data-cap
[14]:http://lifehacker.com/5756233/get-more-out-of-your-dd+wrt-router-with-an-external-drive?tag=ddwrt
[15]:http://lifehacker.com/5680670/turn-your-dd+wrt-enabled-router-into-a-whole-house-ad-blocker?tag=ddwrt
[16]:http://lifehacker.com/5563196/turn-your-old-router-into-a-range+boosting-wi+fi-repeater?tag=ddwrt
[17]:http://lifehacker.com/178132/hack-attack-turn-your-60-router-into-a-600-router
