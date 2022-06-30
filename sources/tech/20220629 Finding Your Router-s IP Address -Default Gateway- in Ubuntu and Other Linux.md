[#]: subject: "Finding Your Router’s IP Address (Default Gateway) in Ubuntu and Other Linux"
[#]: via: "https://itsfoss.com/router-ip-address-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Finding Your Router’s IP Address (Default Gateway) in Ubuntu and Other Linux
======
You probably already know how to get your system’s IP address in Linux.

But how do you know the IP address of your router?

I am not talking about the public-facing IP which you can get by connecting to websites like [Show My IP][1] or simply [searching for ‘what is my ip’][2] in [DuckDuckGo][3].

I am talking about the default gateway IP which your Linux desktop uses to connect to it.

Why do you need it? Well, if you need to change the SSID, password, or other configuration of your wi-fi/network, you have to connect to it. And the simples way is to type the IP address of the router in a web browser and then use the router’s username and password.

While I cannot help you with the username and password of your router, I can surely tell you how to get its IP.

As always, I’ll show both GUI and command-line methods.

### Method 1: Get the router’s IP address in Linux using GUI

It’s quite simple actually. I am using GNOME desktop with Ubuntu here. If you use some [other desktop environments][4], screenshots may look different.

Open System Settings:

![go to settings][5]

Now go to Wi-Fi or Network (if you are using a wired, Ethernet connection). Here, click on the little settings symbol beside your currently used network.

![access network settings ubuntu][6]

It will open a new window with several details about your connection such as the IP address, DNS, and [Mac address][7]. You can also see the [saved wifi password][8] under the security tab.

You’ll also see an entry named ‘Default Route’. This is what you are looking for. The IP address of your router.

![defaul gateway ip ubuntu][9]

Your system and all other devices on your network connect to the router using this IP address. This is the setup most households have.

Now that I have shown the GUI method, let’s go to the terminal route.

### Method 2: Get the router’s IP address in Linux command line

Open a terminal and use the following command:

```
ip route
```

It will show you a few entries.

```
[email protected]:~$ ip route
default via 192.168.1.1 dev wlp0s20f3 proto dhcp metric 600 
169.254.0.0/16 dev wlp0s20f3 scope link metric 1000 
192.168.1.0/24 dev wlp0s20f3 proto kernel scope link src 192.168.1.34 metric 600
```

The first line, which starts with ‘default via’, gives you the gateway IP. This is your router’s IP address.

![defaul route linux terminal][10]

As you can see, 192.168.1.1 is the IP address of my router. Usually, the router’s IP address is the first number of the subnet. However, this is not a hard and fast rule. I have seen routers with x.y.z.30 addresses as well.

### Bonus tip

As shared by Samir in the comments, you can also use the ping command to get the gateway IP:

```
ping _gateway
```

![ping gateway][11]

In case you didn’t know, you have to [use the Ctrl+C to stop a running command in Linux][12].

I hope you find this tip useful when you need it.

--------------------------------------------------------------------------------

via: https://itsfoss.com/router-ip-address-linux/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://www.showmyip.com/
[2]: https://duckduckgo.com/?q=what+is+my+ip&t=h_&ia=answer
[3]: https://itsfoss.com/duckduckgo-easter-eggs/
[4]: https://itsfoss.com/best-linux-desktop-environments/
[5]: https://itsfoss.com/wp-content/uploads/2022/02/go_to_settings.jpg
[6]: https://itsfoss.com/wp-content/uploads/2022/06/access-network-settings-ubuntu-800x448.png
[7]: https://itsfoss.com/change-mac-address-linux/
[8]: https://itsfoss.com/how-to-find-saved-wireless-wifi-passwords-ubuntu/
[9]: https://itsfoss.com/wp-content/uploads/2022/06/defaul-gateway-ip-ubuntu.png
[10]: https://itsfoss.com/wp-content/uploads/2022/06/defaul-route-linux-terminal.png
[11]: https://itsfoss.com/wp-content/uploads/2022/06/ping-gateway.png
[12]: https://itsfoss.com/stop-program-linux-terminal/
