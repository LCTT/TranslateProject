Netflix Offers to Work with Ubuntu to Bring Native Playback to All
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/08/netflix-ubuntu.jpg)

**We saw [last month just how close native Netflix support for Linux is][1] to arriving, with now only a few simple steps required to enable HTML5 video streaming on Ubuntu desktops.**

Now Netflix wants to go one step further. It wants to bring true, out-of-the-box Netflix playback to all Ubuntu users. And all it requires is an update to the **Network Security** Services library. 

### Netflix Natively? Neato. ###

In [an e-mail][2] sent to the Ubuntu Developer mailing list Netflix’s Paul Adolph explains the current situation:

> “Netflix will play with Chrome stable in 14.02 if NSS version 3.16.2 or greater is installed. If this version is generally installed across 14.02, Netflix would be able to make a change so users would no longer have to hack their User-Agent to play.”

While the upcoming release of Ubuntu 14.10 offers the newer [NSS v3.17][3], Ubuntu 14.04 LTS — used by the majority of users — currently offers v3.15.x.

NSS is a set of libraries that supports a range of security-enabled client and server applications, including SSL, TLS, PKCS and other security standards. Keen to enable native HTML5 Netflix for Ubuntu LTS users, Paul asks:

> “What is the process of getting a new NSS version into the update stream? Or can somebody please provide me with the right contact?”

Netflix began offering HTML5 video playback on Windows 8.1 and OS X Yosemite earlier this year, negating the need for any extra downloads or plugins. The switch has been made possible through the [Encrypted Media Extension][4] spec.

While we wait for the discussions to move forward (and hopefully solve it for all) you can still “hack” HTML5 Netflix on Ubuntu by [following our guide][5]. 

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/09/netflix-linux-html5-nss-change-request

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgubuntu.co.uk/2014/08/netflix-linux-html5-support-plugins
[2]:https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2014-September/015048.html
[3]:https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.17_release_notes
[4]:http://en.wikipedia.org/wiki/Encrypted_Media_Extensions
[5]:http://www.omgubuntu.co.uk/2014/08/netflix-linux-html5-support-plugins