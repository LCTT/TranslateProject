[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A secure and private open source alternative to Alexa)
[#]: via: (https://opensource.com/article/20/6/open-source-voice-assistant)
[#]: author: (Steve Ovens https://opensource.com/users/stratusss)

A secure and private open source alternative to Alexa
======
Mycroft brings more privacy, security, and freedom into your voice
assistant applications.
![radio communication signals][1]

I grew up in rural towns all over Ontario, Canada. We weren't particularly well off, although, as a kid in the middle of nowhere, I wasn't really aware of our socioeconomic status. What I was aware of was this beige box called a computer that sat in my dad's office. Dad worked for the bank, and for his job, it was essential for him to have a computer. So while we never had the latest gaming console, we always had a computer.

It's probably because of this that I developed a pretty intense relationship with all things computers. Today, I am fortunate to work for Red Hat, but that's another story altogether. Growing up in the '80s and having my teenage years in the mid-90s, I have a vivid awareness of how computers have changed. I remember watching as my dad logged online for the first time on our 9600-baud modem. I remember the first time I was able to download skins for buildings in my favorite game, Sim City 2000.

I mention all this for a reason: I have watched computers evolve my entire life, from mashing arcane commands into DOS (ironically, some say I still perform the same tasks years later in my role at Red Hat), to GUIs of "fat" applications, to web apps, and mobile. The one commonality that has stood out has been the end user's demand for an ever-simplified interface to interact with technology.

### From touch to voice

For several years, the cool thing was to be able to poke at your device's screen and have it react. Touch screens were all the rage. Nowadays, the consumer space is trending towards digital assistants. Some stats say that by 2022, 55% of US households will have a voice assistant. Other sources say that Amazon sells approximately 14 million of these devices _per quarter_, while Google trails behind with around 11 million. If you want a concrete market value, MarketWatch estimates the value of this industry will be $7.8 billion by 2023. This doesn't even take into account the phones that everyone has in their pockets! Whatever metrics you use, one thing is clear: voice assistants are becoming increasingly important.

So are your only options Google, Amazon, or Apple? _NOPE!_ If they were, I wouldn't be writing this article, where I'll introduce you to [Mycroft][2].

### Mycroft: An open source voice assistant for developers

For me, Mycroft's big selling feature is that it is open source. This means that I can get in, tinker around, and contribute to the project. It's largely based in Python, which works out just fine for me.

Before I go any further, I want to draw your attention to the subheading: "for developers." These are my words, and while I contribute to the project, I do not speak for it. However, I want to emphasize that the project is not at a state where it's ready to gain mass adoption. Mycroft's [official documentation][3] is generally very good, but there are rough edges that are being smoothed out all the time. So, if you are willing to put in some effort, perhaps file some bugs, and take the long view, this project is absolutely worth your time. If you are looking for an off-the-shelf, ready to go project, you may need to come back in a year or so.

Here are some of the major reasons it makes sense to get involved with the Mycroft project.

#### Privacy

As I mentioned, voice assistants are everywhere, and that's only increasing. Although they are often forgotten, they are listening to everything. [Apple][4], [Google][5], and [Amazon][6] have all been found listening to the recordings their voice assistants capture. In [some cases][7], these recordings are even being used in courts of law.

What if you work out of your home office (even before the world got turned upside down by COVID-19)? How can you protect the privacy of your users and clients, especially when most people don't even realize that the technology meant to make their lives easier is capturing their private conversations?

Even if you aren't worried about exposing your conversations, are you OK with companies gathering this data for targeted advertising? Mycroft puts privacy at the forefront. Its default speech-to-text (STT) backend is Google's STT service, but you can choose from a wide variety of providers, including Google, IBM's Watson, Mozilla, Kaldi, Microsoft Azure, and more. In addition, Mycroft proxies all STT requests that go through their servers for specific providers (Google being one of them).

#### Security

Remember how I said Mycroft is for developers? Since you self-host Mycroft, this means its security is as good as you can make it. You can (and should) implement VLANs, routing rules, firewall rules, and whatever other security that is relevant for your environment.

Even if your security is not top-notch, the obfuscation you receive from having such a tiny footprint means that, outside of random chance or a targeted attack, your Mycroft instance is relatively safe from the outside world. If it's on your network, you control what and who has access to your voice assistant. That's a good thing.

#### Did I mention Python?

I love Python. It's one of the main reasons I was able to get involved so quickly. I use Python extensively in my day-to-day, both for fun and profit. I introduced my wife to Mycroft, and she immediately started adding tasks to _my_ backlog for all the things she wants _her_ voice assistant to be able to do.

While I was hard at work picking through my backlog, I noticed that one of the Mycroft intent parsers (which I will discuss in my next article) did not handle apostrophes properly. So, in true open source fashion, I forked the code, fixed it up, and created a pull request (PR) against the project. After some small back and forth, my PR was brought up to the project standards and voila! Mycroft now handles apostrophes better. How cool is that?

A) I was able to fork the code, fix it, and run the fix locally and 

B) have these changes accepted by the project to benefit everyone 

 

It's mind-blowing.

Not only that, but other projects including [KDE Plasma on TV][8] have integrated Mycroft to make their projects more widely appealing. I'd love to hear about more projects that have taken advantage of Mycroft, so please reach out on Twitter or leave a comment below if you know of any.

### Science non-fiction

As a kid, I always loved science fiction; I still do, in fact. I wanted to be able to be like Jean-Luc Picard and say, "Computer, Earl Grey. Hot," and have things magically happen. While food replicators are still a long way off, with Mycroft and a little bit of know-how, I can say things like, "Hey, Mycroft, start the tea kettle" or "Hey, Mycroft, add bread to my shopping list," and Mycroft will make it so.

I'm relatively new to the Mycroft developer community, but we are a small group of tightly knit folks who want to live in a world where there is an open source competitor to the Alexas, Siris, and Googles of the world. Stop by and chat with us on [Mattermost][9].

Need to keep your schedule straight? Learn how to do it using open source with these free...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/open-source-voice-assistant

作者：[Steve Ovens][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stratusss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/sound-radio-noise-communication.png?itok=KMNn9QrZ (radio communication signals)
[2]: https://mycroft.ai/
[3]: https://mycroft-ai.gitbook.io/docs/
[4]: https://www.forbes.com/sites/kateoflahertyuk/2019/07/28/apple-siri-eavesdropping-puts-millions-of-users-at-risk/#3eea76e6a530
[5]: https://www.digitalmusicnews.com/2019/07/12/google-employees-google-home/
[6]: https://www.cnbc.com/2019/04/11/how-to-stop-amazon-from-listening-to-what-you-say-to-alexa.html
[7]: https://www.cnn.com/2017/03/07/tech/amazon-echo-alexa-bentonville-arkansas-murder-case/index.html
[8]: https://dot.kde.org/2020/03/26/plasma-tv-presenting-plasma-bigscreen
[9]: https://chat.mycroft.ai/
