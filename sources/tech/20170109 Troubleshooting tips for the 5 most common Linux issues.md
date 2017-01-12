  Vic020

Troubleshooting tips for the 5 most common Linux issues
============================================================

### Learn how to tackle the most common challenges Linux desktop users encounter.

 ![Troubleshooting tips for the 5 most common Linux issues](https://opensource.com/sites/default/files/styles/image-full-size/public/images/law/rh_003601_05_mech_osyearbook2016_containers_cc.png?itok=0ZEfXLEE "Troubleshooting tips for the 5 most common Linux issues") 
Image by : 

Opensource.com

Although Linux installs and operates as expected for most users, inevitably some users will run into problems. For my final article in The Queue column for the year, I thought it would be interesting to summarize the most common technical Linux issues people ran into in 2016\. I posted the question to LinuxQuestions.org and on social media, and I analyzed LQ posting patterns. Here are the results.

### 1\. Wifi drivers (especially Broadcom chips)

Generally speaking, wifi drivers—and Broadcom cards in particular—continue to be one of the most problematic technical issues facing Linux. There were hundreds of posts about this topic on LQ alone in 2016, and myriad more elsewhere. Dozens of Broadcom wireless cards are available, and detailed instructions for getting them to work with each distribution is far too involved for a single article, but the basic troubleshooting steps are the same:

*   ascertain exactly which Broadcom card you have by using _lspci_ to find out the PCI ID,
*   determine whether the distribution you use supports that card,
*   and if it does, identify the proper way to get the card working.

For example, if you have a 14e4:4315 PCI ID and are using Ubuntu, then you know the BCM4312 card is supported by installing the _firmware-b43-installer_package. The other option you have is to research the wifi card before your purchase to ensure it's fully supported by your distribution of choice out of the box.

### 2\. Printer drivers (especially Canon and Lexmark)

Printers also continue to be problematic, with Canon and Lexmark repeatedly cited for being an issue. If you're purchasing a new printer, research compatibility before you buy. But if you are migrating from another operating system, that may not be an option. If you are doing research, the [OpenPrinting][1] database and the official support channel for your distribution are the two best places to start. Note that you should ensure all functionality of a device is fully compatible, especially if it's a multifunction product. One common complaint with Canon printers is that the drivers are often only available on non-English and sometimes obscure sites.

>If you're purchasing a new printer, research compatibility before you buy.

### 3\. Video

Video is a nuanced topic, as simple straightforward video works extremely well out of the box on Linux. Where the issues pop up are video accelerators/​acceleration; the latest video cards and newest technologies, such as NVIDIA Optimus and ATI dynamic GPU switching; installation and stability of proprietary drivers; efficient power management; and reliable suspend and resume. If you're not a gamer, do not need high-end graphics for another reason, and are not on a laptop, then you probably don't have to worry about this. If you're looking for a new laptop, be sure to research compatibility before your purchase. If you're a gamer or need the highest-end graphics, you'll need to know exactly what your requirements are and start your research there. Luckily, the situation here is improving and, Wayland teething issues aside, the situation should be quite a bit better in 2017.

### 4\. Audio

Once again, for simple setups, audio has been easy to configure and reliable under Linux for a while. As soon as you get into professional production, echo cancellation, audio routing, unified mixing, and other complex setups, however, it can go south pretty quickly. My suggestion is to use one of the dedicated audio-related distributions if you need high-end real-time audio.

### 5\. Installation

With a category this all-encompassing, it's almost guaranteed to be high volume. That said, I don't know that it's fair to say Linux has wide-spread installation issues. The vast majority of installs go as expected. The sheer variety of hardware that Linux supports, and nearly infinite combinations of hardware on which Linux installs are attempted, inevitably lead to edge cases here and there. Keep in mind that end users rarely install other operating systems, such as Mac OS and Windows, as they come pre-installed on new devices.

>The vast majority of installs go as expected.

### Future looks bright

Other issues that were mentioned frequently include Bluetooth, suspend/resume, HiDPI, and touchscreens. You may see a pattern forming here—most of the issues noted in this article focus on desktop use cases. When you think about it, that makes sense. With Linux desktop adoption being relatively low, the result is that less testing and resources go into finding and fixing related issues. As desktop usage increases, you can anticipate these areas improving.

On that note, I thought it would be nice to end with a mention of one area that used to pop up frequently as a problem area for Linux, and very rarely does these days: fonts. Only a few short years ago, getting high-quality antialiased fonts were the exception. With modern distribution releases, it has become the rule.

What technical Linux issues did you find most common in 2016? Let me know about them in the comments.

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/jeremy-garcia.jpg?itok=kqOMWJIg)

Jeremy Garcia - Jeremy Garcia is the founder of LinuxQuestions.org  and an ardent but realistic open source advocate. Follow Jeremy on Twitter: @linuxquestions

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/yearbook-linux-troubleshooting-tips

作者：[Jeremy Garcia][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jeremy-garcia
[1]:http://www.openprinting.org/printers
