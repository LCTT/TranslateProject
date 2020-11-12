[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Dell is Adding Webcam and Microphone Kill Switches in Linux Kernel)
[#]: via: (https://itsfoss.com/dell-privacy-driver/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Dell is Adding Webcam and Microphone Kill Switches in Linux Kernel
======

_**Dell is adding new code in Linux kernel that will enable you to disable newer Dell system’s webcam and microphone with keyboard shortcuts. Why? Because privacy.**_

Privacy is no longer a luxury. It has become the basic necessity.

Privacy-oriented niche devices like [Librem notebook][1] series offer hardware kill switches to block webcam, microphone, Bluetooth and Wi-Fi.

Dell will also be providing hardware kill switches in 2021 in the form of keyboard combination. It is implementing kill switch at kernel level and thus allowing you to disable webcam and microphone with keyboard shortcut.

### Dell is adding hardware privacy driver to Linux kernel

![][2]

In a [patch to Linux kernel][3], Dell [disclosed its privacy driver][4] that protects users privacy of audio and camera from hardware level. Once the audio or camera privacy mode enabled, any applications will not get any audio or video stream.

With Ctrl+F4 hotkey, audio privacy mode will be enabled and camera mute hotkey is Ctrl+F9.

#### Why is it important? Is Linux so unsecure that anyone can use your webcam remotely?

That’s the obvious question and I would like to clear a few things on this topic. We live in a connected world using internet extensively by means of a number of applications.

While your operating system may be secure at the core, there can be some level of intrusion at application level. [Browser extensions are being used for stealing data][5]. Imagine a rogue browser extension with access to your webcam or microphone?

This is why snapping the access to webcam, microphone etc at hardware level is a better option. The new privacy drivers from Dell provide this feature.

As [Phoronix noted][6], there is also indication that Dell is working on ‘privacy screen’ under the privacy driver. Privacy screen reduces the horizontal/vertical viewing angles of the display so that onlookers cannot clearly see the content on your screen.

#### When will Dell Privacy Driver be available? Will it be for everyone?

There is no timeline for now since the things are under development. Keep in mind that this is a Dell specific solution and they will be introducing this in their newer models in 2021.

Though I think it should be available for any Dell device because it is included in the Linux kernel but I cannot confirm that.

#### What if you want to ensure your privacy right now?

If you got intrigued and want to ensure your privacy by disabling the webcam, microphone, screen etc, you don’t necessarily need to buy new Dell machines. There are additional accessories available that help you in this regard.

For webcams, you may use external accessories like a webcam blocker with slider. I have one from [Free Software Foundation][7] when I opted for their annual membership. You can easily order one from Amazon or other e-commerce sites in your country.

Preview | Product | Price |
---|---|---|---
![Laptop Camera Cover Slide, Anti-spy Webcam Cover for Laptop, PC, MacBook,iMac,Computer,iPad,Smartphone,Echo Spot,Tablet,Ultra Thin Camera Slide Blocker][8] ![Laptop Camera Cover Slide, Anti-spy Webcam Cover for Laptop, PC, MacBook,iMac,Computer,iPad,Smartphone,Echo Spot,Tablet,Ultra Thin Camera Slide Blocker][8] | [Laptop Camera Cover Slide, Anti-spy Webcam Cover for Laptop, PC,...][9] | $6.99[][10] | [Buy on Amazon][11]

There are similar devices for blocking microphones as well. I have never used them, so _**I CANNOT vouch for their effectiveness**_.

Preview | Product | Price |
---|---|---|---
![Mic-Lock Microphone Blocker \(3 Pack\) – Signal Blocking Device \(3.5mm\) for Laptops, Smartphones, Tablets, and Desktop Computers - Data Security, Privacy Protection, Counter Surveillance Equipment][12] ![Mic-Lock Microphone Blocker \(3 Pack\) – Signal Blocking Device \(3.5mm\) for Laptops, Smartphones, Tablets, and Desktop Computers - Data Security, Privacy Protection, Counter Surveillance Equipment][12] | [Mic-Lock Microphone Blocker (3 Pack) – Signal Blocking Device (3.5mm) for Laptops, Smartphones,...][13] | $16.99[][10] | [Buy on Amazon][14]

You may also use privacy screen filters that disables viewing angles so that people cannot peep on what you are doing on your laptop in public places like cafés, airports etc. I have seen people using it in tech conferences and it works pretty nicely.

Preview | Product | Price |
---|---|---|---
![AmazonBasics Privacy Screen Filter for 14 Inch 16:9 Widescreen Monitor][15] ![AmazonBasics Privacy Screen Filter for 14 Inch 16:9 Widescreen Monitor][15] | [AmazonBasics Privacy Screen Filter for 14 Inch 16:9 Widescreen Monitor][16] | $23.86[][10] | [Buy on Amazon][17]

Overall, it is nice to see that big manufacturers like Dell are taking privacy seriously. Let’s hope more manufacturers also follow the suit.

--------------------------------------------------------------------------------

via: https://itsfoss.com/dell-privacy-driver/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/purism-librem-14/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/dell-privacy-drivers.jpg?resize=800%2C450&ssl=1
[3]: https://lore.kernel.org/lkml/20201103125542.8572-1-Perry_Yuan@Dell.com/
[4]: https://www.zdnet.com/article/dell-enables-linux-hardware-privacy-controls/#ftag=RSSbaffb68
[5]: https://www.laptopmag.com/uk/news/chrome-extensions-were-used-to-steal-data-from-millions-of-users-what-to-do
[6]: https://www.phoronix.com/scan.php?page=news_item&px=Dell-Hardware-Privacy-Linux
[7]: https://www.fsf.org/
[8]: https://i2.wp.com/m.media-amazon.com/images/I/41FY4vkFRkL._SL160_.jpg?ssl=1
[9]: https://www.amazon.com/dp/B07X54PV85?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Laptop Camera Cover Slide, Anti-spy Webcam Cover for Laptop, PC, MacBook,iMac,Computer,iPad,Smartphone,Echo Spot,Tablet,Ultra Thin Camera Slide Blocker)
[10]: https://www.amazon.com/gp/prime/?tag=chmod7mediate-20 (Amazon Prime)
[11]: https://www.amazon.com/dp/B07X54PV85?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[12]: https://i0.wp.com/m.media-amazon.com/images/I/31egbWnUApL._SL160_.jpg?ssl=1
[13]: https://www.amazon.com/dp/B078Z11LSG?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Mic-Lock Microphone Blocker (3 Pack) – Signal Blocking Device (3.5mm) for Laptops, Smartphones, Tablets, and Desktop Computers - Data Security, Privacy Protection, Counter Surveillance Equipment)
[14]: https://www.amazon.com/dp/B078Z11LSG?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[15]: https://i2.wp.com/m.media-amazon.com/images/I/311S9zmN9EL._SL160_.jpg?ssl=1
[16]: https://www.amazon.com/dp/B07PRBRD5K?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (AmazonBasics Privacy Screen Filter for 14 Inch 16:9 Widescreen Monitor)
[17]: https://www.amazon.com/dp/B07PRBRD5K?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
