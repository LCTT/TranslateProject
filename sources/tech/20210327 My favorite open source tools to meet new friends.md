[#]: subject: (My favorite open source tools to meet new friends)
[#]: via: (https://opensource.com/article/21/3/open-source-streaming)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

My favorite open source tools to meet new friends
======
Quarantine hasn't been all bad—it's allowed people to create fun online
communities that also help others.
![Two people chatting via a video conference app][1]

In March 2020, I joined the rest of the world in quarantine at home for two weeks. Then, two weeks turned into more. And more. It wasn't too hard on me at first. I had been working a remote job for a year already, and I'm sort of an introvert in some ways. Being at home was sort of "business as usual" for me, but I watched as it took its toll on others, including my wife.

### An unlikely lifeline

That spring, I found out a buddy and co-worker of mine was a Fairly Well-Known Streamer™ who had been doing a podcast for something ridiculous, like _15 years_. So, I popped into the podcast's Twitch channel, [2DorksTV][2]. What I found, I was not prepared for. My friend and his co-hosts perform their podcast _live_ on Twitch, like the cast of _Saturday Night Live_ or something! _**Live!**_ The hosts, Stephen, Ashley, and Jacob, joked and laughed, (sometimes) read news stories, and interacted with a vibrant community of followers—_live!_

I introduced myself in the chat, and Stephen looked into the camera and welcomed me, as though he were looking at and talking directly to me. I was surprised to find that there was a real back and forth. The community in the chat talked with the hosts and one another, and the hosts interacted with the chat.

It was a great time, and I laughed out loud for the first time in several months.

### Trying a new thing

Shortly after getting involved in the community, I thought I might try out streaming for myself. I didn't have a podcast or a co-host, but I really, _really_ like to play Dwarf Fortress, a video game that's not open source but is built for Linux. People stream themselves playing games, right? I had all the stuff I needed because I already worked remotely full time. Other folks were struggling to find a webcam in stock and a spot to work that wasn't a kitchen table, but I'd been set up for months.

When I looked into it more, I found that a free and open source video recording and streaming application named OBS Studio is one of the most popular ways to stream to Twitch and other platforms. Score one for open source!

[OBS worked][3] _right out of the box_ on my Fedora system, so there's not much to write about. And that's a good thing!

So, it wasn't because of the software that my first stream was…rough, to say the least. I didn't really know what I was doing, the quality wasn't that great, and I kept muting the mic to cough and forgetting to turn it back on. I think there were a grand total of zero viewers who saw that stream, and that's probably for the best.

The next day though, I shared what I'd done in chat, and everyone was amazingly supportive. I decided to try again. In the second stream, Stephen popped in and said hi, and I had the opportunity to be on the other side of the camera, talking to a friend in chat and really enjoying the interaction. Within a few more streams, more of the community started to hop on and chat and hang out and, despite having no idea what was going on (Dwarf Fortress is famously a bit dense), sticking around and interacting with me.

### The open source behind the stream

Eventually, I started to up my game. Not my Dwarf Fortress game, but my streaming game. My stream slowly became more polished and more frequent. I created my own official stream, called _It's Dwarf Fortress! …with Hammerdwarf!_

The entire production is powered by open source:

  * [VLC Media Player][4] plays the intro and outro music.
  * I use [GIMP][5] (GNU Image Manipulation Program) to make the logos and splash screens.
  * [OBS Studio][6] handles the recording and streaming.
  * Both GIMP and OBS are packaged with [Flatpak][7], a seriously cool next-generation packaging technology for Linux.
  * I've recently started using [OpenShot][8] to edit recordings of my stream before uploading them to YouTube.
  * Even the fonts I use are Open Font License fonts.
  * All this, the game included, live on a Fedora Linux system.



### Coding out in the open

As I got further into streaming, I discovered, again through Stephen, that folks stream themselves programming. What?! But it's oddly satisfying, listening to someone calmly talk about what they're doing and why and hearing the quiet clicks of their keyboard. I've started keeping those kinds of things on in the background while I work, just for ambiance.

Eventually, I thought to myself, "Why not? I could do that too. I program things." I had plenty of side projects to work on, and maybe folks would come hang out with me while I work on them.

I created a new stream called _It's _not_ Dwarf Fortress! …with Hammerdwarf!_ (Look—that's just how Dwarf Fortress-y I am.) I started up that stream and worked on a little side project, and—the very first time—a group of four or five folks from my previous job hopped in and hung out with me, despite it being the middle of their workday. Friends from the 2DorksTV Discord joined as well, and we had a nice big group of folks chatting and helping me troubleshoot code and regexes and missing whitespace. And then, some random folks I didn't know, folks looking around for a stream on Twitch, found it and jumped in as well!

### Sharing is what open source is about

Fast forward a few months, and I was talking (again) with Stephen. Over the months, we've discussed how folks represent themselves online and commiserated about feeling out of place at work, fighting to feel like we deserve to be there, to convince ourselves that we're good enough to be there. It's not just him or just me, I realize. I have this conversation with _so many people_. I told Stephen that I think it's because there is so little representation of _trying_. Everyone shares their success story on Twitter. They only ever _do_ or _don't_.

They never share themselves trying.

("Friggin Yoda, man," Stephen commented on the matter. You can see why he's got a successful podcast.)

Presentations at tech conferences are filled with complicated, difficult stories, but they're always success stories. The "internet famous" in our field, developer advocates and tech gurus, share amazing new things and present complicated demos, but all of them are backed by teams of people working with them that no one ever sees. Online, with tech specifically and honestly the rest of the world generally, you see only the finished sausage, not all the grind.

These are the things I think help people, and I realized that I need to be open about all of my processes. Projects I work on take me _forever_ to figure out. Code that I write _sucks_. I'm a senior software engineer/site reliability engineer for a large software company. I spend _hours and hours_ reading documentation, struggling to figure out how something works, and slowly, slowly incrementing on it. Even that first Dwarf Fortress stream needed a lot of help.

And this is normal!

Everyone does it, but we're so tuned into sharing our successes and hiding our failures that all we can compare our flawed selves to is other people's successes. We never see their failures, and we try to live up to a standard of illusion.

I even struggled to decide whether I should create a whole new channel for this thing I was trying to do. I spent all this time building a professional career image online—I couldn't show everyone how much of a Dwarf Dork I _really_ am! And once again, Stephen inspired me:

> "Hammerdwarf is you. And your coding stream was definitely a professional stream. The channel name didn't matter…Be authentic."

Professional Chris Collins and personal Hammerdwarf make up who I am. I have a wife and two dogs, I like space stuff, I get a headache every now and again, I write for Opensource.com and [EnableSysadmin][9], I speak at tech conferences, and sometimes, I have to take an afternoon off work to sit in the sun or lie awake at night because I miss my friends.

All that to say, my summer project, inspired by Stephen, Ashley, and Jacob and the community from 2DorksTV and powered by open source technology, is to fail publicly and to be real. To borrow a phrase from another excellent podcast: I am [failing out loud][10].

I've started a streaming program on Twitch called _Practically Programming_, dedicated to showing what it is like for me at work, working on real things and failing and struggling and needing help. I've been in tech for almost 20 years, and I still have to learn every day, and now I'm going to do so online where everyone can see me. Because it's important to show your failures and flaws as much as your successes, and it's important to see others fail and realize it's a normal part of life.

![Practically Programming logo][11]

(Chris Collins, [CC BY-SA 4.0][12])

That's what I did last summer.

And _Practically Programming_ is what I will be doing this spring and from now on. Please join me if you're interested, and please, if you fail at something or struggle with something, know that everyone else is doing so, too. As long as you keep trying and keep learning, it doesn't matter how many times you fail.

You got this!

* * *

_Practically Programming_ is on my [Hammerdwarf Twitch channel][13] on Tuesdays and Thursdays at 5pm Pacific time.

Dwarf Fortress is on almost any other time…

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/open-source-streaming

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/chat_video_conference_talk_team.png?itok=t2_7fEH0 (Two people chatting via a video conference app)
[2]: https://www.twitch.com/2dorkstv
[3]: https://opensource.com/article/20/4/open-source-live-stream
[4]: https://www.videolan.org/vlc/index.html
[5]: https://www.gimp.org/
[6]: https://obsproject.com/
[7]: https://opensource.com/article/21/2/linux-packaging
[8]: https://opensource.com/article/21/2/linux-python-video
[9]: http://redhat.com/sysadmin
[10]: https://open.spotify.com/show/1WcfOvSiD99zrVLFWlFHpo
[11]: https://opensource.com/sites/default/files/uploads/practically_programming_logo.png (Practically Programming logo)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://www.twitch.tv/hammerdwarf
