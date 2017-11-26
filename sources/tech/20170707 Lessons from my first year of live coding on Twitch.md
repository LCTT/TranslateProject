Translating by lonaparte

Lessons from my first year of live coding on Twitch
============================================================

I gave streaming a go for the first time last July. Instead of gaming, which the majority of streamers on Twitch do, I wanted to stream the open source work I do in my personal time. I work on NodeJS hardware libraries a fair bit (most of them my own). Given that I was already in a niche on Twitch, why not be in an even smaller niche, like JavaScript powered hardware ;) I signed up for [my own channel][1], and have been streaming regularly since.

Of course I’m not the first to do this. [Handmade Hero][2] was one of the first programmers I watched code online, quickly followed by the developers at Vlambeer who [developed Nuclear Throne live on Twitch][3]. I was fascinated by Vlambeer especially.

What tipped me over the edge of  _wishing_  I could do it to  _actually doing it_  is credited to [Nolan Lawson][4], a friend of mine. I watched him [streaming his open source work one weekend][5], and it was awesome. He explained everything he was doing along the way. Everything. Replying to issues on GitHub, triaging bugs, debugging code in branches, you name it. I found it fascinating, as Nolan maintains open source libraries that get a lot of use and activity. His open source life is very different to mine.

You can even see this comment I left under his video:

![](https://cdn-images-1.medium.com/max/1600/0*tm8xC8CJV9ZimCCI.png)

I gave it a go myself a week or so later, after setting up my Twitch channel and bumbling my way through using OBS. I believe I worked on [Avrgirl-Arduino][6], which I still frequently work on while streaming. It was a rough first stream. I was very nervous, and I had stayed up late rehearsing everything I was going to do the night before.

The tiny number of viewers I got that Saturday were really encouraging though, so I kept at it. These days I have more than a thousand followers, and a lovely subset of them are regular visitors who I call “the noopkat fam”.

We have a lot of fun, and I like to call the live coding parts “massively multiplayer online pair programming”. I am truly touched by the kindness and wit of everyone joining me each weekend. One of the funniest moments I have had was when one of the fam pointed out that my Arduino board was not working with my software because the microchip was missing from the board:


I have logged off a stream many a time, only to find in my inbox that someone has sent a pull request for some work that I had mentioned I didn’t have the time to start on. I can honestly say that my open source work has been changed for the better, thanks to the generosity and encouragement of my Twitch community.

I have so much more to say about the benefits that streaming on Twitch has brought me, but that’s for another blog post probably. Instead, I want to share the lessons I have learned for anyone else who would like to try live coding in this way for themselves. Recently I’ve been asked by a few developers how they can get started, so I’m publishing the same advice I have given them!

Firstly, I’m linking you to a guide called [“Streaming and Finding Success on Twitch”][7] which helped me a lot. It’s focused towards Twitch and gaming streams specifically, but there are still relevant sections and great advice in there. I’d recommend reading this first before considering any other details about starting your channel (like equipment or software choices).

My own advice is below, which I have acquired from my own mistakes and the sage wisdom of fellow streamers (you know who you are!).

### Software

There’s a lot of free streaming software out there to stream with. I use [Open Broadcaster Software (OBS)][8]. It’s available on most platforms. I found it really intuitive to get up and going, but others sometimes take a while to learn how it works. Your mileage may vary! Here is a screen-grab of what my OBS ‘desktop scene’ setup looks like as of today (click for larger image):

![](https://cdn-images-1.medium.com/max/1600/0*s4wyeYuaiThV52q5.png)

You essentially switch between ‘scenes’ while streaming. A scene is a collection of ‘sources’, layered and composited with each other. A source can be things like a camera, microphone, your desktop, a webpage, live text, images, the list goes on. OBS is very powerful.

This desktop scene above is where I do all of my live coding, and I mostly live here for the duration of the stream. I use iTerm and vim, and also have a browser window handy to switch to in order to look up documentation and triage things on GitHub, etc.

The bottom black rectangle is my webcam, so folks can see me work and have a more personal connection. 

I have a handful of ‘labels’ for my scenes, many of which are to do with the stats and info in the top banner. The banner just adds personality, and is a nice persistent source of info while streaming. It’s an image I made in [GIMP][9], and you import it as a source in your scene. Some labels are live stats that pull from text files (such as most recent follower). Another label is a [custom one I made][10] which shows the live temperature and humidity of the room I stream from.

I have also ‘alerts’ set up in my scenes, which show cute banners over the top of my stream whenever someone follows or donates money. I use the web service [Stream Labs][11] to do this, importing it as a browser webpage source into the scene. Stream Labs also creates my recent followers live text file to show in my banner.

I also have a standby screen that I use when I’m about to be live:

![](https://cdn-images-1.medium.com/max/1600/0*cbkVjKpyWaWZLSfS.png)

I additionally need a scene for when I’m entering secret tokens or API keys. It shows me on the webcam but hides my desktop with an entertaining webpage, so I can work in privacy:

![](https://cdn-images-1.medium.com/max/1600/0*gbhowQ37jr3ouKhL.png)

As you can see, I don’t take stuff too seriously when streaming, but I like to have a good setup for my viewers to get the most out of my stream.

But now for an actual secret: I use OBS to crop out the bottom and right edges of my screen, while keeping the same video size ratio as what Twitch expects. That leaves me with space to watch my events (follows, etc) on the bottom, and look at and respond to my channel chat box on the right. Twitch allows you to ‘pop out’ the chatbox in a new window which is really helpful.

This is what my full desktop  _really _ looks like:

![](https://cdn-images-1.medium.com/max/1600/0*sENLkp3Plh7ZTjJt.png)

I started doing this a few months ago and haven’t looked back. I’m not even sure my viewers realise this is how my setup works. I think they take for granted that I can see everything, even though I cannot see what is actually being streamed live when I’m busy programming!

You might be wondering why I only use one monitor. It’s because two monitors was just too much to manage on top of everything else I was doing while streaming. I figured this out quickly and have stuck with one screen since.

### Hardware

I used cheaper stuff to start out, and slowly bought nicer stuff as I realised that streaming was going to be something I stuck with. Use whatever you have when getting started, even if it’s your laptop’s built in microphone and camera.

Nowadays I use a Logitech Pro C920 webcam, and a Blue Yeti microphone on a microphone arm with a mic shock. Totally worth the money in the end if you have it to spend. It made a difference to the quality of my streams.

I use a large monitor (27"), because as I mentioned earlier using two monitors just didn’t work for me. I was missing things in the chat because I was not looking over to the second laptop screen enough, etc etc. Your milage may vary here, but having everything on one screen was key for me to pay attention to everything happening.

That’s pretty much it on the hardware side; I don’t have a very complicated setup.

If you were interested, my desk looks pretty normal except for the obnoxious looming microphone:

![](https://cdn-images-1.medium.com/max/1600/0*EyRimlrHNEKeFmS4.jpg)

### Tips

This last section has some general tips I’ve picked up, that have made my stream better and more enjoyable overall.

#### Panels

Spend some time on creating great panels. Panels are the little content boxes on the bottom of everyone’s channel page. I see them as the new MySpace profile boxes (lol but really). Panel ideas could be things like chat rules, information about when you stream, what computer and equipment you use, your favourite cat breed; anything that creates a personal touch. Look at other channels (especially popular ones) for ideas!

An example of one of my panels:

![](https://cdn-images-1.medium.com/max/1600/0*HlLs6xlnJtPwN4D6.png)

#### Chat

Chat is really important. You’re going to get the same questions over and over as people join your stream halfway through, so having chat ‘macros’ can really help. “What are you working on?” is the most common question asked while I’m coding. I have chat shortcut ‘commands’ for that, which I made with [Nightbot][12]. It will put an explanation of something I have entered in ahead of time, by typing a small one word command like  _!whatamidoing_ 

When folks ask questions or leave nice comments, talk back to them! Say thanks, say their Twitch handle, and they’ll really appreciate the attention and acknowledgement. This is SUPER hard to stay on top of when you first start streaming, but multitasking will come easier as you do more. Try to take a few seconds every couple of minutes to look at the chat for new messages.

When programming,  _explain what you’re doing_ . Talk a lot. Make jokes. Even when I’m stuck, I’ll say, “oh, crap, I forget how to use this method lemme Google it hahaha” and folks are always nice and sometimes they’ll even read along with you and help you out. It’s fun and engaging, and keeps folks watching.

I lose interest quickly when I’m watching programming streams where the streamer is sitting in silence typing code, ignoring the chat and their new follower alerts.

It’s highly likely that 99% of folks who find their way to your channel will be friendly and curious. I get the occasional troll, but the moderation tools offered by Twitch and Nightbot really help to discourage this.

#### Prep time

Automate your setup as much as possible. My terminal is iTerm, and it lets you save window arrangements and font sizes so you can restore back to them later. I have one window arrangement for streaming and one for non streaming. It’s a massive time saver. I hit one command and everything is the perfect size and in the right position, ready to go.

There are other apps out there that automate all of your app window placements, have a look to see if any of them would also help.

Make your font size really large in your terminal and code editor so everyone can see.

#### Regularity

Be regular with your schedule. I only stream once a week, but always at the same time. Let folks know if you’re not able to stream during an expected time you normally do. This has netted me a regular audience. Some folks love routine and it’s exactly like catching up with a friend. You’re in a social circle with your community, so treat it that way.

I want to stream more often, but I know I can’t commit to more than once a week because of travel. I am trying to come up with a way to stream in high quality when on the road, or perhaps just have casual chats and save programming for my regular Sunday stream. I’m still trying to figure this out!

#### Awkwardness

It’s going to feel weird when you get started. You’re going to feel nervous about folks watching you code. That’s normal! I felt that really strongly at the beginning, even though I have public speaking experience. I felt like there was nowhere for me to hide, and it scared me. I thought, “everyone is going to think my code is bad, and that I’m a bad developer”. This is a thought pattern that has plagued me my  _entire career_  though, it’s nothing new. I knew that with this, I couldn’t quietly refactor code before pushing to GitHub, which is generally much safer for my reputation as a developer.

I learned a lot about my programming style by live coding on Twitch. I learned that I’m definitely the “make it work, then make it readable, then make it fast” type. I don’t rehearse the night before anymore (I gave that up after 3 or 4 streams right at the beginning), so I write pretty rough code on Twitch and have to be okay with that. I write my best code when alone with my thoughts and not watching a chat box + talking aloud, and that’s okay. I forget method signatures that I’ve used a thousand times, and make ‘silly’ mistakes in almost every single stream. For most, it’s not a productive environment for being at your best.

My Twitch community never judges me for this, and they help me out a lot. They understand I’m multitasking, and are really great about pragmatic advice and suggestions. Sometimes they bail me out, and other times I have to explain to them why their suggestion won’t work. It’s really just like regular pair programming!

I think the ‘warts and all’ approach to this medium is a strength, not a weakness. It makes you more relatable, and it’s important to show that there’s no such thing as the perfect programmer, or the perfect code. It’s probably quite refreshing for new coders to see, and humbling for myself as a more experienced coder.

### Conclusion

If you’ve been wanting to get into live coding on Twitch, I encourage you to give it a try! I hope this post helped you if you have been wondering where to start.

If you’d like to join me on Sundays, you can [follow my channel on Twitch][13] :)

On my last note, I’d like to personally thank [Mattias Johansson][14] for his wisdom and encouragement early on in my streaming journey. He was incredibly generous, and his [FunFunFunction YouTube channel][15] is a continuous source of inspiration.

Update: a bunch of folks have been asking about my keyboard and other parts of my workstation. [Here is the complete list of what I use][16]. Thanks for the interest!

--------------------------------------------------------------------------------

via: https://medium.freecodecamp.org/lessons-from-my-first-year-of-live-coding-on-twitch-41a32e2f41c1

作者：[ Suz Hinton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.freecodecamp.org/@suzhinton
[1]:https://www.twitch.tv/noopkat
[2]:https://www.twitch.tv/handmade_hero
[3]:http://nuclearthrone.com/twitch/
[4]:https://twitter.com/nolanlawson
[5]:https://www.youtube.com/watch?v=9FBvpKllTQQ
[6]:https://github.com/noopkat/avrgirl-arduino
[7]:https://www.reddit.com/r/Twitch/comments/4eyva6/a_guide_to_streaming_and_finding_success_on_twitch/
[8]:https://obsproject.com/
[9]:https://www.gimp.org/
[10]:https://github.com/noopkat/study-temp
[11]:https://streamlabs.com/
[12]:https://beta.nightbot.tv/
[13]:https://www.twitch.tv/noopkat
[14]:https://twitter.com/mpjme
[15]:https://www.youtube.com/channel/UCO1cgjhGzsSYb1rsB4bFe4Q
[16]:https://gist.github.com/noopkat/5de56cb2c5917175c5af3831a274a2c8
