[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5-Minute Breakdown: Wi-Fi 6)
[#]: via: (https://www.networkworld.com/article/3390239/5-minute-breakdown-wi-fi-6.html#tk.rss_all)
[#]: author: (Kevin Blackburn )

5-Minute Breakdown: Wi-Fi 6
======
Understanding the real benefits of W-Fi 6, the next generation of wireless.
![Aruba][1]

The Wi-Fi Alliance has announced the standard for the next-generation of Wi-Fi and that standard is Wi-Fi 6.

The first thing that people are thrown off by is the newer, uncommon naming convention. From basic consumers to techies alike, we are used to the 802.11 technology designations. I'm not saying the naming didn’t exist before, but the 802.11 standards designation was much more commonly used. To break it down simply, here is what Wi-Fi 6 translates to along with other well-known technologies:

  * **Wi-Fi 6** → 802.11ax
  * **Wi-Fi 5** → 802.11ac
  * **Wi-Fi 4** → 802.11n
  * **Wi-Fi 3** → 802.11g
  * **Wi-Fi 2** → 802.11a
  * **Wi-Fi 1** → 802.11b



That being said, you can treat the Wi-Fi 6 designation as a generation number of sorts.

**Benefits of Wi-Fi 6**
When we think of the past generational improvements to Wi-Fi, the main thing that a lot of people focus on is the increased capabilities in terms of bandwidth. Wi-Fi 6 does not disappoint in this area. A single stream of 802.11ax communication has a potential speed of 1.2Gbps at a 160MHz channel width. Compare this to 802.11ac at 866Mbps for a similar size stream. Compare this to 802.11ac at 866 Mbps. Of course, this all depends on the configuration and settings, such as the chosen channel width.

Speed is great if you are the only client on an access point, but nowadays, the capacity of an access point is the name of the game. When I say capacity, I mean total capacity in terms of client-count while maintaining good performance. Wi-Fi 6 makes use of a new feature called [Orthogonal Frequency Division Multiple Access][2] (OFDMA). At a high-level, this feature breaks up a single Wi-Fi channel into smaller frequencies called resource units. By utilizing these resource units, or sub-channels, the access point can communicate with multiple devices at the same time which decreases overall congestion and latency. This is one of the ways that Wi-Fi 6 is allowing for increased client-counts per access point while still maintaining usable, low-latency, network performance.

Something I think many people will appreciate about Wi-Fi 6 is the improvements it might bring to your device’s battery life. There is a feature called [Target Wake Time][3] that allows a device to negotiate how often it is waking from sleep to send data, instead of needing to constantly check in with the wireless network. One big thing to call out about this, though–the device saves battery life by going to sleep (in terms of its wireless NIC).

If you have a device like a laptop or smartphone that is constantly checking for updates, uploading data, or streaming media, the TWT feature isn’t going to help you. On the flip side, though, think of IoT devices such as temperature monitors, for instance. They will only report in at a set interval, such as hourly or in when there is an alert. That device can save a lot of battery by spending all that inactive time in a sleep status.

**Looking for more?**
If you are looking for more information about Wi-Fi 6 and what’s under the hood of this new technology, [read this in-depth whitepaper from Aruba.][4]

Listen to the Aruba Unplugged podcast, [“What You Need to Know About Wi-Fi 6”][5].

About the Author

![Kevin Blackburn Blog Contributor][6]

Kevin blogs at The Routing Table, a networking and technology blog focusing on networking, certification and technical development.

[Full bio][7]

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3390239/5-minute-breakdown-wi-fi-6.html#tk.rss_all

作者：[Kevin Blackburn][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/post-8-image-1-aruba-802.11-100794141-large.jpg
[2]: https://blogs.arubanetworks.com/solutions/why-ofdma-is-a-magical-feature-in-802-11ax-standard/
[3]: https://blogs.arubanetworks.com/solutions/why-802-11ax-is-ideal-for-iot/
[4]: https://www.arubanetworks.com/assets/wp/WP_802.11AX.pdf
[5]: https://blogs.arubanetworks.com/podcasts/episode-6-what-you-need-to-know-about-wi-fi-6/
[6]: https://images.idgesg.net/images/article/2019/04/kevin-100794139-small.jpg
[7]: https://blogs.arubanetworks.com/author/theroutingtable/
