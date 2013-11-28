How to Crack a Wi-Fi Network's WEP Password with BackTrack
================================================================================
![](http://img.gawkerassets.com/img/17idgc21242wbjpg/ku-xlarge.jpg)

You already know that if you want to lock down your Wi-Fi network, you should [opt for WPA encryption][1] because WEP is easy to crack. But did you know how easy? Take a look.

*Note: This post demonstrates how to crack WEP passwords, an older and less often used network security protocol. If the network you want to crack is using the more popular WPA encryption, see our [guide to cracking a Wi-Fi network's WPA password with Reaver][2] instead.*

Today we're going to run down, step-by-step, how to crack a Wi-Fi network with WEP security turned on. But first, a word: Knowledge is power, but power doesn't mean you should be a jerk, or do anything illegal. Knowing [how to pick a lock][3] doesn't make you a thief. Consider this post educational, or a proof-of-concept intellectual exercise.

Dozens of tutorials on how to crack WEP are already all over the internet using this method. Seriously—Google it. This ain't what you'd call "news." But what is surprising is that someone like me, with minimal networking experience, can get this done with free software and a cheap Wi-Fi adapter. Here's how it goes.

### What You'll Need ###

![](http://img.gawkerassets.com/img/17ggkrsu8hf19png/original.png)

Unless you're a computer security and networking ninja, chances are you don't have all the tools on hand to get this job done. Here's what you'll need:

- **A compatible wireless adapter**—This is the biggest requirement. You'll need a wireless adapter that's capable of packet injection, and chances are the one in your computer is not. After consulting with my friendly neighborhood security expert, I purchased an Alfa AWUS050NH USB adapter, pictured here, and it set me back about $50 on Amazon. Update: Don't do what I did. Get the [Alfa AWUS036H][4], not the US050NH, instead. [The guy in this video][5] below is using a $12 model he bought on Ebay (and is even [selling his router of choice)][6]. There are [plenty of resources on getting aircrack-compatible adapters out there][7].

- **[A BackTrack Live CD][8]**. We already took you on a [full screenshot tour of how to install and use BackTrack 3][9], the Linux Live CD that lets you do all sorts of security testing and tasks. Download yourself a copy of the CD and burn it, or load it up in VMware to get started.

- **A nearby WEP-enabled Wi-Fi network**. The signal should be strong and ideally people are using it, connecting and disconnecting their devices from it. The more use it gets while you collect the data you need to run your crack, the better your chances of success.

- **Patience with the command line**. This is an ten-step process that requires typing in long, arcane commands and waiting around for your Wi-Fi card to collect data in order to crack the password. Like the doctor said to the short person, be a little patient.

### Crack That WEP ###

To crack WEP, you'll need to launch Konsole, BackTrack's built-in command line. It's right there on the taskbar in the lower left corner, second button to the right. Now, the commands.

First run the following to get a list of your network interfaces:

    airmon-ng

The only one I've got there is labeled ra0. Yours may be different; take note of the label and write it down. From here on in, substitute it in everywhere a command includes (interface).

Now, run the following four commands. See the output that I got for them in the screenshot below.

    airmon-ng stop (interface)
    ifconfig (interface) down
    macchanger —mac 00:11:22:33:44:55 (interface)
    airmon-ng start (interface)

![](http://img.gawkerassets.com/img/17ggkrsub9llbpng/ku-xlarge.png)

If you don't get the same results from these commands as pictured here, most likely your network adapter won't work with this particular crack. If you do, you've successfully "faked" a new MAC address on your network interface, 00:11:22:33:44:55.

Now it's time to pick your network. Run:

    airodump-ng (interface)

To see a list of wireless networks around you. When you see the one you want, hit Ctrl+C to stop the list. Highlight the row pertaining to the network of interest, and take note of two things: its BSSID and its channel (in the column labeled CH), as pictured below. Obviously the network you want to crack should have WEP encryption (in the ENC) column, not WPA or anything else.

![](http://img.gawkerassets.com/img/17ggkrut97td8png/ku-xlarge.png)

Like I said, hit Ctrl+C to stop this listing. (I had to do this once or twice to find the network I was looking for.) Once you've got it, highlight the BSSID and copy it to your clipboard for reuse in the upcoming commands.

Now we're going to watch what's going on with that network you chose and capture that information to a file. Run:

    airodump-ng -c (channel) -w (file name) —bssid (bssid) (interface)

Where (channel) is your network's channel, and (bssid) is the BSSID you just copied to clipboard. You can use the Shift+Insert key combination to paste it into the command. Enter anything descriptive for (file name). I chose "yoyo," which is the network's name I'm cracking.

![](http://img.gawkerassets.com/img/17ggkrutbx04dpng/ku-xlarge.png)

You'll get output like what's in the window in the background pictured below. Leave that one be. Open a new Konsole window in the foreground, and enter this command:

    aireplay-ng -1 0 -a (bssid) -h 00:11:22:33:44:55 -e (essid) (interface)

Here the ESSID is the access point's SSID name, which in my case is yoyo. What you want to get after this command is the reassuring "Association successful" message with that smiley face.

![](http://img.gawkerassets.com/img/17ggkrut9v67spng/ku-xlarge.png)

You're almost there. Now it's time for:

    aireplay-ng -3 -b (bssid) -h 00:11:22:33:44:55 (interface)

Here we're creating router traffic to capture more throughput faster to speed up our crack. After a few minutes, that front window will start going crazy with read/write packets. (Also, I was unable to surf the web with the yoyo network on a separate computer while this was going on.) Here's the part where you might have to grab yourself a cup of coffee or take a walk. Basically you want to wait until enough data has been collected to run your crack. Watch the number in the "#Data" column—you want it to go above 10,000. (Pictured below it's only at 854.)

Depending on the power of your network (mine is inexplicably low at -32 in that screenshot, even though the yoyo AP was in the same room as my adapter), this process could take some time. Wait until that #Data goes over 10k, though—because the crack won't work if it doesn't. In fact, you may need more than 10k, though that seems to be a working threshold for many.

![](http://img.gawkerassets.com/img/17ggkrwseb5uipng/ku-xlarge.png)

Once you've collected enough data, it's the moment of truth. Launch a third Konsole window and run the following to crack that data you've collected:

    aircrack-ng -b (bssid) (file name-01.cap)

Here the filename should be whatever you entered above for (file name). You can browse to your Home directory to see it; it's the one with .cap as the extension.

If you didn't get enough data, aircrack will fail and tell you to try again with more. If it succeeds, it will look like this:

![](http://img.gawkerassets.com/img/17ggkrws8f1gepng/ku-medium.png)

The WEP key appears next to "KEY FOUND." Drop the colons and enter it to log onto the network.

### Problems Along the Way ###

With this article I set out to prove that cracking WEP is a relatively "easy" process for someone determined and willing to get the hardware and software going. I still think that's true, but unlike the guy in the video below, I had several difficulties along the way. In fact, you'll notice that the last screenshot up there doesn't look like the others—it's because it's not mine. Even though the AP which I was cracking was my own and in the same room as my Alfa, the power reading on the signal was always around -30, and so the data collection was very slow, and BackTrack would consistently crash before it was complete. After about half a dozen attempts (and trying BackTrack on both my Mac and PC, as a live CD and a virtual machine), I still haven't captured enough data for aircrack to decrypt the key.

So while this process is easy in theory, your mileage may vary depending on your hardware, proximity to the AP point, and the way the planets are aligned. Oh yeah, and if you're on deadline—Murphy's Law almost guarantees it won't work if you're on deadline.

To see the video version of these exact instructions, check out this dude's YouTube video.

[http://www.youtube.com/embed/kDD9PjiQ2_U?wmode=transparent&rel=0&autohide=1&showinfo=0&enablejsapi=1][10]

Got any experience with the WEP cracking courtesy of BackTrack? What do you have to say about it? Give it up in the comments.

--------------------------------------------------------------------------------

via: http://lifehacker.com/5305094/how-to-crack-a-wi+fi-networks-wep-password-with-backtrack

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://lifehacker.com/386675/secure-your-home-wi+fi-network
[2]:http://lifehacker.com/5873407/how-to-crack-a-wi+fi-networks-wpa-password-with-reaver
[3]:http://lifehacker.com/399735/how-to-pick-a-lock-with-a-bump-key
[4]:http://www.amazon.com/Alfa-AWUS036H-802-11b-Wireless-network/dp/B002WCEWU8?tag=lifehackeramzn-20&ascsubtag=[referrer|lifehacker.com[type|link[postId|5305094[asin|B002WCEWU8[authorId|5774310829120954491
[5]:http://www.youtube.com/watch?v=oHq-cKoYcr8
[6]:http://www.youtube.com/watch?v=bFlOHMj7Qoc
[7]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fwww.aircrack-ng.org%2Fdoku.php%3Fid%3Dcompatible_cards&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5305094%2Fhow-to-crack-a-wi%2Bfi-networks-wep-password-with-backtrack&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[8]:http://go.redirectingat.com/?id=33330X911647&site=lifehacker.com&xs=1&isjs=1&url=http%3A%2F%2Fwww.backtrack-linux.org%2F&xguid=&xcreo=0&sref=http%3A%2F%2Flifehacker.com%2F5305094%2Fhow-to-crack-a-wi%2Bfi-networks-wep-password-with-backtrack&pref=http%3A%2F%2Flifehacker.com%2F5953047%2Fhow-to-crack-wep-and-wpa-wi%2Bfi-passwords&xtz=-480&abp=1
[9]:http://lifehacker.com/5166530/backtrack-is-a-security+focused-live-cd-packed-with-system-tools
[10]:http://www.youtube.com/embed/kDD9PjiQ2_U?wmode=transparent&rel=0&autohide=1&showinfo=0&enablejsapi=1