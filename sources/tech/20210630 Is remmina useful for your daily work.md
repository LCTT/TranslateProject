[#]: subject: (Is remmina useful for your daily work?)
[#]: via: (https://fedoramagazine.org/is-remmina-useful-for-your-daily-work/)
[#]: author: (zexcon https://fedoramagazine.org/author/zexcon/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Is remmina useful for your daily work?
======

![][1]

Photo by [Oğuzhan Akdoğan][2] on [Unsplash][3]

[Remmina][4] is a Remote Desktop Client that supports numerous protocols allowing you to connect to many remote systems. This full featured client program allows you to set up a shared folder, select the screen size and type of connection being used. There are many more options that give you the ability to customize your connection to fit your individual needs. In this article we will utilize Remote Desktop Protocol (RDP) to demonstrate its capabilities. RDP is commonly used for logging into Microsoft Windows machines remotely and that will be used as an example.

### How I came to use remmina

Using _remmina_ has become a staple of my work and personal life. At one point I’m sitting at my desk looking at a 13″ monitor trying to perform work on an inadequate laptop. To my left is a 34″ ultra-wide connected to my personal box running Fedora Linux. Then it dawned on me, I should see if I can remote in and use my 34″ monitor to make my life better and offload resource intensive processes. The answer is yes, maybe? Lets try it out and see if it works for you.

### Installing remmina

The _remmina_ software is available in the Fedora Linux repository by default. Install it by running the following.
```

```

sudo dnf install remmina
```

```

### Collecting Windows Information

On the the Windows computer you are going to remote into you will need to get the IP address, domain name and username. Type the _Windows Key + r_ and this will display the run box. Type _cmd_ and select OK.

![][5]

The terminal (command line) displayed allows us to obtain the IP address. At the prompt type _ipconfig_.
```

```

ipconfig
```

```

You will see options labeled “IPv6 Address” or “IPv4 Address” or both. Keep this address handy for the next section. In the terminal enter _set user_ to obtain the Server, Domain and Username.
```

```

set user
```

```

This displays the USERDOMAIN and USERNAME. Make note of this along with the IP address you captured in the last step. You will have the following three items.

  * Server = IPv4 or IPv6
  * USERDOMAIN = Domain
  * USERNAME = Username



With these three pieces of information you are ready to move to creating the connection.

### Running remmina

Execute the following command to start _remmina:_
```

```

remmina
```

```

![Remnina startup screen][6]

### Creating the connection

Lets look at creating a connection. Select the icon to the left of the magnifying class at the top to create a connection profile (middle icon of the three).

![][7]

In the Remote Connection Profile you provide all the options to create the connection. Provide a meaningful title under the Name field. You can also add your connection to a Group if you are going to manage several connections with _remmina_. For the Protocol select “RDP – Remote Desktop Protocol”.

Under the Basic options you will need to provide your IPv4 or IPv6 address for the host computer, your login name for the Username and the corresponding password. Use of the Domain will be specific to your situation and may not be needed.

At this point, you are ready to connect to your remote desktop and can click “Save and Connect” at the bottom or you can continue reading and learn about some of the additional options.

### The fun stuff “options”

Here is where all the fun begins. Under Basic you can select Enable multi monitor, Span screen over multiple monitors and List monitor IDs. This allows you to use one or more monitors in many different configurations. You can even set the resolution or select a Color depth.

One of my favorite options available is the Share folder that allows you to setup a folder on your local machine and it will automatically mount on the remote computer. This affords you the opportunity to move files back and forth easily and no more emailing yourself!

![][8]

We will only cover two items under the Advanced section one is Quality and allows you to select performance over visual appeal or vise versa. The second option is the security protocol negotiation that I recommend leaving set to Automatic negotiation.

![][9]

### Alternative

In all fairness I didn’t start with _remmina_. It took using others, notably [FreeRDP,][10] for me to see that the learning curve could be substantial and I didn’t want it to effect my availability and productivity at work. With a little bit of time and research you can dig in and learn the many features of FreeRDP and see if it might be the better choice for you.

### Conclusion

A basic setup for an RDP connection to a Windows system was described. Some options were discussed, such as setting the Resolution, Share folder, and Quality. We only touched on a minimal set available among an abundance of options. If you find that _remmina_ is right for you, I highly recommend you go through the remaining options. Many of the options can help tweak the desktop to fit your personal preferences and create a better experience.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/is-remmina-useful-for-your-daily-work/

作者：[zexcon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zexcon/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/06/remote_display-816x345.jpg
[2]: https://unsplash.com/@jeffgry?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/remote-display?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://remmina.org/
[5]: https://fedoramagazine.org/wp-content/uploads/2021/06/Remmina05.jpg
[6]: https://fedoramagazine.org/wp-content/uploads/2021/06/Remmina01.jpg
[7]: https://fedoramagazine.org/wp-content/uploads/2021/06/Remmina02.jpg
[8]: https://fedoramagazine.org/wp-content/uploads/2021/06/Rammina03.jpg
[9]: https://fedoramagazine.org/wp-content/uploads/2021/06/Remmina04.jpg
[10]: https://www.freerdp.com/
