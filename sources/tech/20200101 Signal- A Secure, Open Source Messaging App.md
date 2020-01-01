[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Signal: A Secure, Open Source Messaging App)
[#]: via: (https://itsfoss.com/signal-messaging-app/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Signal: A Secure, Open Source Messaging App
======

**_Brief: Signal is a secure open-source messaging app for smartphones. It also offers a standalone desktop app for Linux, Windows, and macOS_. _Here, we take a look at its features and usability._**

### Signal is an Excellent Alternative to WhatsApp (and Telegram) for Privacy Concerned People

![Signal App On Linux][1]

Signal is an open source application with a keen focus on privacy. It is recommended by privacy advocates like [Edward Snowden][2].

It may not have as many features as Telegram or WhatsApp – but if you want to enhance your privacy while having a conversation, this is a solid open-source solution.

You can install it on your smartphone ([iOS][3]/[Android][4]) and it is also available for Linux, Windows, and macOS.

### Features of Signal Messenger

**Note:** _Some of the features are specific/exclusive to smartphones. You may not observe all the features mentioned in the desktop app._

As I already mentioned, this is tailored to enhance your privacy. So, the user experience may not be the “best” you’ve ever seen. But, privacy/security-wise, I think it is a good option to have.

![Signal Features][5]

#### Disappearing Messages

You can set a timer for messages in a conversation – so that it will be automatically deleted as per the timer.

Essentially, anyone in the conversation can activate this feature. So, you control if the messages should stay in a conversation or disappear.

#### Use it As Default SMS App

If you want to utilize an open-source app for all your SMSs, you can simply go to Signal’s app settings and set it as the default for SMS and MMS.

#### Screen Security

There’s a neat feature to block screenshots in-app, “Screen Security”.

If you enable it, you won’t be able to take a screenshot of any conversation in the app. You can find the option to enable or disable it from the app settings.

It may not be useful to everyone – but you can try it out.

#### Safety Number

If you want to verify the security of your encryption with a friend, you can simply tap on the profile and scroll down to find “View Safety Number”.

You can either scan it to verify or simply take a look at it to mark it verified.

#### Locked Messages

If you protect the app with a lock (pin/fingerprint), even if your device has been unlocked, you won’t be able to see the messages on your notifications.

So, when you get a notification while Signal is locked, you will notice the content of the notification as “**Locked Message**” – which is a plus for privacy-oriented users.

#### Other Features

![][6]

As you would expect in a messaging app – you get a couple of stickers to utilize and you can also create a group if you want.

However, you won’t have the ability to moderate your group – you can just add members and change the profile picture.

In addition to this, Signal also supports biometric security for its app.

### Installing Signal on Ubuntu/Linux

Unfortunately, you don’t get a .**deb** or .**AppImage** to install it on your Linux distro. So, you will need to utilize the terminal as per the [official installation instructions][7].

Here’s what you have to type in the terminal:

```
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop
```

Simply copy-paste the commands one by one in the terminal and you should be good to go.

[Download Signal for Other Devices][7]

### My Thoughts On Signal

I’ve been using Signal for a few years now and it has improved with what it offers. However, I still feel that the user experience can be improved.

Privacy-wise, it is definitely a good alternative to what we already have (in my opinion). You can give it a try and see how well it works for your usage.

You can also take a look at their [GitHub page][8] for the latest developments and beta releases if you want to try them out.

Signal app may not be a popular messaging app when compared to WhatsApp or even [Telegram on Linux][9]. But, you can try it for yourself and encourage your friends to use an open-source messaging app.

Have you tried it yet? Let me know what you think about the ‘Signal’ app in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/signal-messaging-app/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/signal-shot.jpg?ssl=1
[2]: https://en.wikipedia.org/wiki/Edward_Snowden
[3]: https://apps.apple.com/us/app/signal-private-messenger/id874139669
[4]: https://play.google.com/store/apps/details?id=org.thoughtcrime.securesms&hl=en_IN
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/signal-phone.jpg?ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/12/signal-shot-1.jpg?ssl=1
[7]: https://signal.org/download/
[8]: https://github.com/signalapp
[9]: https://itsfoss.com/install-telegram-desktop-linux/
