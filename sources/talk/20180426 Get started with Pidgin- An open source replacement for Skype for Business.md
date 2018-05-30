translating----geekpi

Get started with Pidgin: An open source replacement for Skype for Business
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/meeting-team-listen-communicate.png?itok=KEBP6vZ_)
Technology is at an interesting crossroads, where Linux rules the server landscape but Microsoft rules the enterprise desktop. Office 365, Skype for Business, Microsoft Teams, OneDrive, Outlook... the list goes on of Microsoft software and services that dominate the enterprise workspace.

What if you could replace that proprietary software with free and open source applications and make them work with an Office 365 backend you have no choice but to use? Buckle up, because that is exactly what we are going to do with Pidgin, an open source replacement for Skype.

### Installing Pidgin and SIPE

Microsoft's Office Communicator became Microsoft Lync which became what we know today as Skype for Business. There are [pay software options][1] for Linux that provide feature parity with Skype for Business, but [Pidgin][2] is a fully free and open source option licensed under the GNU GPL.

Pidgin can be found in just about every Linux distro's repository, so getting your hands on it should not be a problem. The only Skype feature that won't work with Pidgin is screen sharing, and file sharing can be a bit hit or miss—but there are ways to work around it.

You also need a [SIPE][3] plugin, as it's part of the secret sauce to make Pidgin work as a Skype for Business replacement. Please note that the `sipe` library has different names in different distros. For example, the library's name on System76's Pop_OS! is `pidgin-sipe` while in the Solus 3 repo it is simply `sipe`.

With the prerequisites out of the way, you can begin configuring Pidgin.

### Configuring Pidgin

When firing up Pidgin for the first time, click on **Add** to add a new account. In the Basic tab (shown in the screenshot below), select** Office Communicator** in the **Protocol** drop-down, then type your **business email address** in the **Username** field.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pidgin_basic_account_screen_final.png?itok=1zoSbZjy)

Next, click on the Advanced tab. In the **Server[:Port]** field enter **sipdir.online.lync.com:443** and in **User Agent** enter **UCCAPI/16.0.6965.5308 OC/16.0.6965.2117**.

Your Advanced tab should now look like this:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pidgin_advanced_account_screen.png?itok=Z6loRfGi)

You shouldn't need to make any changes to the Proxy tab or the Voice and Video tab. Just to be certain, make sure **Proxy type** is set to **Use Global Proxy Settings** and in the Voice and Video tab, the **Use silence suppression** checkbox is **unchecked**.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pidgin_account_proxy_screen.png?itok=iDgszWy0)

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pidgin_voiceandvideo_screen.png?itok=klkbt5hr)

After you've completed those configurations, click **Add,** and you'll be prompted for your email account's password.

### Adding contacts

To add contacts to your buddy list, click on **Manage Accounts** in the **Buddy Window**. Hover over your account and select **Contact Search** to look up your colleagues. If you run into any problems when searching by first and last name, try searching with your colleague's full email address, and you should always get the right person.

You are now up and running with a Skype for Business replacement that gives you about 98% of the functionality you need to banish the proprietary option from your desktop.

Ray Shimko will be speaking about [Linux in a Microsoft World][4] at [LinuxFest NW][5] April 28-29. See program highlights or register to attend.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/pidgin-open-source-replacement-skype-business

作者：[Ray Shimko][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/shickmo
[1]:https://tel.red/linux.php
[2]:https://pidgin.im/
[3]:http://sipe.sourceforge.net/
[4]:https://www.linuxfestnorthwest.org/conferences/lfnw18/program/proposals/32
[5]:https://www.linuxfestnorthwest.org/conferences/lfnw18
