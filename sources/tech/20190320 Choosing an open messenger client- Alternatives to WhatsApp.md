[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Choosing an open messenger client: Alternatives to WhatsApp)
[#]: via: (https://opensource.com/article/19/3/open-messenger-client)
[#]: author: (Chris Hermansen  https://opensource.com/users/clhermansen)

Choosing an open messenger client: Alternatives to WhatsApp
======

Keep in touch with far-flung family, friends, and colleagues without sacrificing your privacy.

![Team communication, chat][1]

Like many families, mine is inconveniently spread around, and I have many colleagues in North and South America. So, over the years, I've relied more and more on WhatsApp to stay in touch with people. The claimed end-to-end encryption appeals to me, as I prefer to maintain some shreds of privacy, and moreover to avoid forcing those with whom I communicate to use an insecure mechanism. But all this [WhatsApp/Facebook/Instagram "convergence"][2] has led our family to decide to vote with our feet. We no longer use WhatsApp for anything except communicating with others who refuse to use anything else, and we're working on them.

So what do we use instead? Before I spill the beans, I'd like to explain what other options we looked at and how we chose.

### Options we considered and how we evaluated them

There is an absolutely [crazy number of messaging apps out there][3], and we spent a good deal of time thinking about what we needed for a replacement. We started by reading Dan Arel's article on [five social media alternatives to protect privacy][4].

Then we came up with our list of core needs:

  * Our entire family uses Android phones.
  * One of us has a Windows desktop; the rest use Linux.
  * Our main interest is something we can use to chat, both individually and as a group, on our phones, but it would be nice to have a desktop client available.
  * It would also be nice to have voice and video calling as well.
  * Our privacy is important. Ideally, the code should be open source to facilitate security reviews. If the operation is not pure peer-to-peer, then the organization operating the server components should not operate a business based on the commercialization of our personal information.



At that point, we narrowed the long list down to [Viber][5], [Line][6], [Signal][7], [Threema][8], [Wire][9], and [Riot.im][10]. While I lean strongly to open source, we wanted to include some closed source and paid solutions to make sure we weren't missing something important. Here's how those six alternatives measured up.

### Line

[Line][11] is a popular messaging application, and it's part of a larger Line "ecosystem"—online gaming, Taxi (an Uber-like service in Japan), Wow (a food delivery service), Today (a news hub), shopping, and others. For us, Line checks a few too many boxes with all those add-on features. Also, I could not determine its current security quality, and it's not open source. The business model seems to be to build a community and figure out how to make money through that community.

### Riot.im

[Riot.im][12] operates on top of the Matrix protocol and therefore lets the user choose a Matrix provider. It also appears to check all of our "needs" boxes, although in operation it looks more like Slack, with a room-oriented and interoperable/federated design. It offers desktop clients, and it's open source. Since the Matrix protocol can be hosted anywhere, any business model would be particular to the Matrix provider.

### Signal

[Signal][13] offers a similar user experience to WhatsApp. It checks all of our "needs" boxes, with solid security validated by external audit. It is open source, and it is developed and operated by a not-for-profit foundation, in principle similar to the Mozilla Foundation. Interestingly, Signal's communications protocol appears to be used by other messaging apps, [including WhatsApp][14].

### Threema

[Threema][15] is extremely privacy-focused. It checks some of our "needs" boxes, with decent external audit results of its security. It doesn't offer a desktop client, and it [isn't fully open source][16] though some of its core components are. Threema's business model appears to be to offer paid secure communications.

### Viber

[Viber][17] is a very popular messaging application. It checks most of our "needs" boxes; however, it doesn't seem to have solid proof of its security—it seems to use a proprietary encryption mechanism, and as far as I could determine, its current security mechanisms are not externally audited. It's not open source. The owner, Rakuten, seems to be planning for a paid subscription as a business model.

### Wire

[Wire][18] was started and is built by some ex-Skype people. It appears to check all of our "needs" boxes, although I am not completely comfortable with its security profile since it stores client data that apparently is not encrypted on its servers. It offers desktop clients and is open source. The developer and operator, Wire Swiss, appears to have a [pay-for-service track][9] as its future business model.

### The final verdict

In the end, we picked Signal. We liked its open-by-design approach, its serious and ongoing [privacy and security stance][7] and having a Signal app on our GNOME (and Windows) desktops. It performs very well on our Android handsets and our desktops. Moreover, it wasn't a big surprise to our small user community; it feels much more like WhatsApp than, for example, Riot.im, which we also tried extensively. Having said that, if we were trying to replace Slack, we'd probably move to Riot.im.

_Have a favorite messenger? Tell us about it in the comments below._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/open-messenger-client

作者：[Chris Hermansen (Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_team_mobile_desktop.png?itok=d7sRtKfQ (Team communication, chat)
[2]: https://www.cnbc.com/2018/03/28/facebook-new-privacy-settings-dont-address-instagram-whatsapp.html
[3]: https://en.wikipedia.org/wiki/Comparison_of_instant_messaging_clients
[4]: https://opensource.com/article/19/1/open-source-social-media-alternatives
[5]: https://en.wikipedia.org/wiki/Viber
[6]: https://en.wikipedia.org/wiki/Line_(software)
[7]: https://en.wikipedia.org/wiki/Signal_(software)
[8]: https://en.wikipedia.org/wiki/Threema
[9]: https://en.wikipedia.org/wiki/Wire_(software)
[10]: https://en.wikipedia.org/wiki/Riot.im
[11]: https://line.me/en/
[12]: https://about.riot.im/
[13]: https://signal.org/
[14]: https://en.wikipedia.org/wiki/Signal_Protocol
[15]: https://threema.ch/en
[16]: https://threema.ch/en/faq/source_code
[17]: https://www.viber.com/
[18]: https://wire.com/en/
