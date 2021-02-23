[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 open source chat applications you should use right now)
[#]: via: (https://opensource.com/article/20/4/open-source-chat)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)

4 open source chat applications you should use right now
======
Collaborating remotely is an essential capability now, making open
source real-time chat an essential piece of your toolbox.
![Chat bubbles][1]

The first thing we usually do after waking up in the morning is to check our cellphone to see if there are important messages from our colleagues and friends. Whether or not it's a good idea, this behavior has become part of our daily lifestyle.

> _"Man is a rational animal. He can think up a reason for anything he wants to believe."_
>  _– Anatole France_

No matter the soundness of the reason, we all have a suite of communication tools—email, phone calls, web-conferencing tools, or social networking—we use on a daily basis. Even before COVID-19, working from home already made these communication tools an essential part of our world. And as the pandemic has made working from home the new normal, we're facing unprecedented changes to how we communicate, which makes these tools not merely essential but now required.

### Why chat?

When working remotely as a part of a globally distributed team, we must have a collaborative environment. Chat applications play a vital role in helping us stay connected. In contrast to email, chat applications provide fast, real-time communications with colleagues around the globe.

There are a lot of factors involved in choosing a chat application. To help you pick the right one for you, in this article, I'll explore four open source chat applications and one open source video-communication tool (for when you need to be "face-to-face" with your colleagues), then outline some of the features you should look for in an effective communication application.

### 4 open source chat apps

#### Rocket.Chat

![Rocket.Chat][2]

[Rocket.Chat][3] is a comprehensive communication platform that classifies channels as public (open to anyone who joins) or private (invitation-only) rooms. You can also send direct messages to people who are logged in; share documents, links, photos, videos, and GIFs; make video calls; and send audio messages without leaving the platform.

Rocket.Chat is free and open source, but what makes it unique is its self-hosted chat system. You can download it onto your server, whether it's an on-premises server or a virtual private server on a public cloud.

Rocket.Chat is completely free, and its [source code][4] is available on GitHub. Many open source projects use Rocket.Chat as their official communication platform. It is constantly evolving with new features and improvements.

The things I like the most about Rocket.Chat are its ability to be customized according to user requirements and that it uses machine learning to do automatic, real-time message translation between users. You can also download Rocket.Chat for your mobile device and use it on the go.

#### IRC

![IRC on WeeChat 0.3.5][5]

[Internet Relay Chat (IRC)][6] is a real-time, text-based form of communication. Although it's one of the oldest forms of electronic communication, it remains popular among many well-known software projects.

IRC channels are discrete chat rooms. It allows you to have conversations with multiple people in an open channel or chat with someone privately one-on-one. If a channel name starts with a #, you can assume it to be official, whereas chat rooms that begin with ## are unofficial and usually casual.

[Getting started with IRC][7] is easy. Your IRC handle or nickname is what allows people to find you, so it must be unique. But your choice of IRC client is completely your decision. If you want a more feature-rich application than a standard IRC client, you can connect to IRC with [Riot.im][8].

Given its age, why should you still be on IRC? For one reason, it remains the home for many of the free and open source projects we depend on. If you want to participate in open source software and communities, IRC is the option to get started.

#### Zulip

![Zulip][9]

[Zulip][10] is a popular group-chat application that follows the topic-based threading model. In Zulip, you subscribe to streams, just like in IRC channels or Rocket.Chat. But each Zulip stream opens a topic that is unique, which helps you track conversations later, thus making it more organized.

Like other platforms, it supports emojis, inline images, video, and tweet previews. It also supports LaTeX for sharing math formulas or equations and Markdown and syntax highlighting for sharing code.

Zulip is cross-platform and offers APIs for building your own integrations. Something I especially like about Zulip is its integration feature with GitHub: if I'm working on an issue, I can use Zulip's marker to link back to the pull request ID.

Zulip is open source (you can access its [source code][11] on GitHub) and free to use, but it has paid offerings for on-premises support, [LDAP][12] integration, and more storage.

#### Let's Chat

![Let's Chat][13]

[Let's Chat][14] is a self-hosted chat solution for small teams. It runs on Node.js and MongoDB and can be deployed to local servers or hosted services with a few clicks. It's free and open source, with the [source code][15] available on GitHub.

What differentiates Let's Chat from other open source chat tools is its enterprise features: it supports LDAP and [Kerberos][16] authentication. It also has all the features a new user would want: you can search message history in the archives and tag people with mentions like @username.

What I like about Let's Chat is that it has private and password-protected rooms, image embeds, GIPHY support, and code pasting. It is constantly evolving and adding more features to its bucket.

### Bonus: Open source video chat with Jitsi

![Jitsi][17]

Sometimes text chat isn't enough, and you need to talk to someone face-to-face. In times like these, when in-person meetings aren't an option, video chat is the best alternative. [Jitsi][18] is a complete, open source, multi-platform, and WebRTC-compliant videoconferencing tool.

Jitsi began with Jitsi Desktop and has evolved into multiple [projects][19], including Jitsi Meet, Jitsi Videobridge, jibri, and libjitsi, with [source code][20] published for each on GitHub.

Jitsi is secure and scalable and supports advanced video-routing concepts such as simulcast and bandwidth estimation, as well as typical capabilities like audio, recording, screen-sharing, and dial-in features. You can set a password to secure your video-chat room and protect it against intruders, and it also supports live-streaming over YouTube. You can also build your own Jitsi server and host it on-premises or on a virtual private server, such as a Digital Ocean Droplet.

What I like most about Jitsi is that it is free and frictionless; anyone can start a meeting in no time by visiting [meet.jit.si][21], and users are good to go with no need for registration or installation. (However, registration gives you calendar integrations.) This low-barrier-to-entry alternative to popular videoconferencing services is helping Jitsi's popularity spread rapidly.

### Tips for choosing a chat application

The variety of open source chat applications can make it hard to pick one. The following are some general guidelines for choosing a chat app.

  * Tools that have an interactive interface and simple navigation are ideal.
  * It's better to look for a tool that has great features and allows people to use it in various ways.
  * Integrations with tools you use can play an important role in your decision. Some tools have great and seamless integrations with GitHub, GitLab, and certain applications, which is a useful feature.
  * It's convenient to use tools that have a pathway to hosting on cloud-based services.
  * The security of the chat service should be taken into account. The ability to host services on a private server is necessary for many organizations and individuals.
  * It's best to select communication tools that have rich privacy settings and allow for both private and public chat rooms.



Since people are more dependent than ever on online services, it is smart to have a backup communication platform available. For example, if a project is using Rocket.Chat, it should also have the option to hop into IRC, if necessary. Since these services are continuously updating, you may find yourself connected to multiple channels, and this is where integration becomes so valuable.

Of the different open source chat services available, which ones do you like and use? How do these tools help you work remotely? Please share your thoughts in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/open-source-chat

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_communication_team.png?itok=CYfZ_gE7 (Chat bubbles)
[2]: https://opensource.com/sites/default/files/uploads/rocketchat.png (Rocket.Chat)
[3]: https://rocket.chat/
[4]: https://github.com/RocketChat/Rocket.Chat
[5]: https://opensource.com/sites/default/files/uploads/irc.png (IRC on WeeChat 0.3.5)
[6]: https://en.wikipedia.org/wiki/Internet_Relay_Chat
[7]: https://opensource.com/article/16/6/getting-started-irc
[8]: https://opensource.com/article/17/5/introducing-riot-IRC
[9]: https://opensource.com/sites/default/files/uploads/zulip.png (Zulip)
[10]: https://zulipchat.com/
[11]: https://github.com/zulip/zulip
[12]: https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol
[13]: https://opensource.com/sites/default/files/uploads/lets-chat.png (Let's Chat)
[14]: https://sdelements.github.io/lets-chat/
[15]: https://github.com/sdelements/lets-chat
[16]: https://en.wikipedia.org/wiki/Kerberos_(protocol)
[17]: https://opensource.com/sites/default/files/uploads/jitsi_0_0.jpg (Jitsi)
[18]: https://jitsi.org/
[19]: https://jitsi.org/projects/
[20]: https://github.com/jitsi
[21]: http://meet.jit.si
