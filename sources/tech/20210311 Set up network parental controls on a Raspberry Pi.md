[#]: subject: (Set up network parental controls on a Raspberry Pi)
[#]: via: (https://opensource.com/article/21/3/raspberry-pi-parental-control)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Set up network parental controls on a Raspberry Pi
======
With minimal investment of time and money, you can keep your kids safe
online.
![Family learning and reading together at night in a room][1]

Parents are always looking for ways to protect their kids online—from malware, banner ads, pop-ups, activity-tracking scripts, and other concerns—and to prevent them from playing games and watching YouTube when they should be doing their schoolwork. Many businesses use tools that regulate their employees' online safety and activities, but the question is how to make this happen at home?

The short answer is a tiny, inexpensive Raspberry Pi computer that enables you to set parental controls for your kids and your work at home. This article walks you through how easy it is to build your own parental control-enabled home network with a Raspberry Pi.

### Install the hardware and software

For this project, you'll need a Raspberry Pi and a home network router. If you spend only five minutes exploring online shopping sites, you will find a lot of options. The [Raspberry Pi 4][2] and a [TP-Link router][3] are good options for beginners.

Once you have your network device and Pi, you need to install [Pi-hole][4] as a Linux container or a supported operating system. There are several [ways to install it][5], but an easy way is to issue the following command on your Pi:


```
`curl -sSL https://install.pi-hole.net | bash`
```

### Configure Pi-hole as your DNS server

Next, you need to configure the DHCP settings in both your router and Pi-hole:

  1. Disable the DHCP server setting in your router
  2. Enable the DHCP server in Pi-hole



Every device is different, so there's no way for me to tell you exactly what you need to click on to adjust your settings. Generally, you access your home router through a web browser. Your router's address is sometimes printed on the bottom of the router, and it begins with either 192.168 or 10.

In your web browser, navigate to your router's address and log in with the credentials you received when you got your internet service. It's often as simple as `admin` with a numeric password (sometimes this password is also printed on the router). If you don't know the login, call your internet provider and ask for details.

In the graphical interface, look for a section within your LAN about DHCP, and deactivate the DHCP server. Your router's interface will almost certainly look different from mine, but this is an example of what I saw when setting it up. Uncheck **DHCP server**:

![Disable DHCP][6]

(Daniel Oh, [CC BY-SA 4.0][7])

Next, you _must_ activate the DHCP server on the Pi-hole. If you don't do that, none of your devices will be able to get online unless you manually assign IP addresses!

### Make your network family-friendly

You're all set. Now, your network devices (i.e., mobile phone, tablet PC, laptop, etc.) will automatically find the DHCP server on the Raspberry Pi. Then, each device will be assigned a dynamic IP address to access the internet.

Note: If your router device supports setting a DNS server, you can also configure the DNS clients in your router. The client will refer to the Pi-hole as your DNS server.

To set up rules for which sites and activities your kids can access, open a web browser to the Pi-hole admin page, `http://pi.hole/admin/`. On the dashboard, click on **Whitelist** to add web pages your kids are allowed to access. You can also add sites that your kids aren't allowed to access (e.g., gaming, adult, ads, shopping, etc.) to the **Blocklist**.

![Pi-hole admin dashboard][8]

(Daniel Oh, [CC BY-SA 4.0][7])

### What's next?

Now that you've set up your Raspberry Pi for parental control, you can keep your kids safer online while giving them access to approved entertainment options. This can also decrease your home internet usage by reducing how much your family is streaming. For more advanced usage, access Pi-hole's [documentation][9] and [blogs][10].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/raspberry-pi-parental-control

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/family_learning_kids_night_reading.png?itok=6K7sJVb1 (Family learning and reading together at night in a room)
[2]: https://www.raspberrypi.org/products/
[3]: https://www.amazon.com/s?k=tp-link+router&crid=3QRLN3XRWHFTC&sprefix=TP-Link%2Caps%2C186&ref=nb_sb_ss_ts-doa-p_3_7
[4]: https://pi-hole.net/
[5]: https://github.com/pi-hole/pi-hole/#one-step-automated-install
[6]: https://opensource.com/sites/default/files/uploads/disabledhcp.jpg (Disable DHCP)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/blocklist.png (Pi-hole admin dashboard)
[9]: https://docs.pi-hole.net/
[10]: https://pi-hole.net/blog/#page-content
