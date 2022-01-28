[#]: subject: "Software Privacy Day: Use Delta Chat, an open source chat tool"
[#]: via: "https://opensource.com/article/22/1/delta-chat-software-privacy-day"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Software Privacy Day: Use Delta Chat, an open source chat tool
======
The best chat application is the one that isn't a chat application.
![Chat via email][1]

It's Software Privacy Day again, the day meant to encourage users everywhere to spare a thought about where their data actually goes when it's posted on, over, or through the Internet. One of the cottage industries around Internet communication that seems to ebb and flow in popularity is the venerable chat application. People use chat applications for all manner of conversations, and most people don't think about what bots are recording and monitoring what's being said, whether it's to effectively target ads or just to build a profile for future use. This makes chat applications particularly vulnerable to poor privacy practices, but luckily there are several open source, privacy-focused apps out there, including [Signal][2], [Rocket.Chat][3], and [Mattermost][4]. I've run Mattermost and Rocket.Chat, and I use Signal, but the application I'm most excited about is Delta Chat, the chat service that's so hands-off it doesn’t even use chat servers. Instead, Delta Chat uses the most massive and diverse open messaging system you already use yourself. It uses email to send and receive messages through a chat application, and it features end-to-end encryption with [Autocrypt][5].

### Install Delta Chat

Delta Chat uses standard email protocol as its back end, but to you and me as mere users, it appears and acts exactly like a chat application. That means you need to install the open source Delta Chat app.

On Linux, you can install Delta Chat as a [Flatpak][6] or from your software repository.

On macOS and Windows, download an installer from [delta.chat/downloads][7].

On Android, you can install Delta Chat from the Play Store or the open source [F-droid repository][8].

On iOS, install Delta Chat from the App Store.

Because Delta Chat uses email for message delivery, you can also receive messages to your inbox if you're away from your chat app. Yes, you can use Delta Chat even without having Delta Chat installed!

### Configure Delta Chat

When you first launch Delta Chat, you must log in to your email account. This tends to be the hardest part about Delta Chat because it requires you to either know details about your email server or else to create an "app password" in your email provider's security settings.

If you're running your own server and you have everything configured as the usual defaults (port 993 for incoming IMAP, port 465 for outgoing SMTP, SSL/TLS enabled), then you can probably just type in your email address and your password and continue.

![Delta Chat login][9]

(Opensource.com [CC BY-SA 4.0][10])

If you're running your own server but you have custom settings, then click the **Advanced** button and enter your settings. You may need to do this if you're using an unusual subdomain to denote your mail server, or a custom port, or a complex login and password configuration.

If you're using an email provider like Gmail, Fastmail, Yahoo, or similar, then you must create an app password so you can login to your account through Delta Chat instead of a web browser. Many email providers restrict login in order to avoid endless bots and scripts making attempts to brute force their ways into people's accounts, so to your provider, Delta Chat looks a lot like a bot. When you grant Delta Chat special permissions, you're alerting your email provider that lots of short messages from a remote app is expected behavior.

Each email provider has a different way of providing app passwords, but Fastmail (in my opinion) makes it the easiest:

  1. Navigate to **Settings**
  2. Click **Passwords &amp; Security**
  3. Next to **Third-party apps**, click the **Add** button



Verify your password, and create a new app password. Use the password you create to login to Delta Chat.

![Fastmail app password][11]

(Opensource.com [CC BY-SA 4.0][10])

### Chatting with Delta Chat

Once you've gotten past the hurdle of logging in, the rest is easy. Because Delta Chat just uses email, you can add friends by email address rather than by a chat application username or phone number. You can technically add any email address to Delta Chat. It is, after all, just an email app with a very specific use case. It's polite to tell your friend about Delta Chat, though, rather than expect them to carry out a casual chat with you through their email client.

The application, whether you're running it on your phone or your computer, looks exactly like you'd expect a chat application to look. You can initiate chats, send messages, and hang out with friends over encrypted text.

![Delta Chat chat list][12]

(Image courtesy Delta Chat)

### Get chatting

Delta Chat is decentralized, fully encrypted, and relies on a proven infrastructure. Thanks to Delta Chat, you get to choose what servers sit between you and your contacts, and you can communicate in private. There's no complex server to install, no hardware to maintain. It's a simple solution to what seems like a complex problem, and it's open source. There's every reason to try it, especially on Software Privacy Day.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/delta-chat-software-privacy-day

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://opensource.com/article/21/9/alternatives-zoom#signal
[3]: https://opensource.com/article/22/1/rocketchat-open-source-communications-platform-puts-data-privacy-first
[4]: https://opensource.com/education/16/3/mattermost-open-source-chat
[5]: https://autocrypt.org/
[6]: https://opensource.com/article/21/11/install-flatpak-linux
[7]: https://delta.chat/en/download
[8]: https://f-droid.org/app/com.b44t.messenger
[9]: https://opensource.com/sites/default/files/delta-chat-log-in_0.jpg (Delta Chat login)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: https://opensource.com/sites/default/files/fastmail-app-password.jpg (Fastmail app password)
[12]: https://opensource.com/sites/default/files/delta-chat-google-play-release-chat-list-light.png (Delta Chat chat list)
