[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I use Stream Deck on Linux with open source tools)
[#]: via: (https://opensource.com/article/20/12/stream-deck)
[#]: author: (Lorna Mitchell https://opensource.com/users/lornajane)

How I use Stream Deck on Linux with open source tools
======
Stream Deck is not just a keypad full of shiny buttons; it's a
customizable workhorse that makes it easier to manage your video
streams.
![Working from home at a laptop][1]

Most of us have gotten a lot more familiar with working from home this year. In my role as a developer advocate, this has meant a lot less travel and a lot more video work, including [streaming on Twitch][2].

As I transitioned to working and streaming video from home in spring 2020, I decided to get a [Stream Deck][3], but I wasn't exactly sure what I'd use it for.

The Stream Deck is a keypad that makes it easier to manage your video streaming. You can customize its buttons to do things like switching scenes, adjusting audio, inserting media, interacting with viewers, and much more. I got the 32-button version because that's all that was in stock anywhere when I bought it.

![Lorna's video streaming setup][4]

(Lorna Mitchell, [CC BY-SA 4.0][5])

Six months in, it's become my best desk accessory. I want to introduce you to it and share my current setup.

### Stream Deck software for Linux

Stream Deck offers several software options for driving the device, but I'm on Ubuntu Linux, so the official Stream Deck tools aren't an option. I found a Python graphical user interface (GUI), but it really just mapped shell scripts onto buttons; since I don't use a mouse, I found the interface pretty awkward.

Instead, I glued together a lovely selection of open source libraries and created [a rather weird and knobbly Golang application][6] that perfectly suits my needs. That sounds like the hard way to drive some perfectly good hardware. Perhaps it is, but now that it's finished, it fits me perfectly, and I love it! I'm going to claim it's not purely a "works-on-my-machine" solution because it works on both of my Thinkpads running Ubuntu.

### Meet my Stream Deck

![Stream Deck][7]

(Lorna Mitchell, [CC BY-SA 4.0][5])

My setup is still changing weekly, but here's how it looks in November 2020. The top row is [Open Broadcaster Software][8] (OBS) integration; the second row is mainly bot/chat integration and window-focusing with a bonus screenshot button on the end; row three holds the lighting controls and a little bit of Twitch API integration; and the bottom row has sound effects and the all-important mute button. If you'd like a bit more detail, read on.

#### Start with streaming

It's a Stream Deck; the clue is in the name! So I began by adding some integration with OBS, the program I use to stream. OBS has a [plugin to support WebSockets][9], and there was already a [library for Golang][10], which really helped. Crucially, the library also handles events, so I have buttons that select scenes and a little indicator to show which scene is active—even if I change scenes via OBS rather than the Stream Deck.

Using the Stream Deck to change scenes is amazing when you're screen-sharing because it means you don't have to focus on another window while you're in the middle of something.

#### Window management

Window focus—keeping all the right things visible and everything else not visible—is definitely a huge challenge when streaming. Let's just say that I had to rotate a lot of keys in the first few months of my streaming journey!

There's a lot to look at, between OBS, probably some chat/moderation/events, the stream itself… you get the idea. My setup's buttons focus on the applications I use the most while streaming (they call a mixture of [wmctrl][11] and [gtk-launch][12]), and it has made things much easier to operate. I have one button for OBS, one for stream manager, and one for my featured chat dashboard (the last two are web pages packaged to make them standalone apps using [Nativefier][13]). Now my streams are more about the topics I have in mind, rather than mostly showing Alt+Tab.

I can absolutely imagine using this for other day-to-day applications, such as if you regularly rotate among a set of applications and want the ability to conjure one up immediately. I'm using browser tabs in a known order for this purpose, but I feel I have missed an opportunity for a productivity hack here.

#### The bot and the clipboard

I stream a bunch of different technologies, and my geeky audience asks a lot of questions and recommends a lot of tools, which is brilliant. However, that means I spent a lot of time finding and focusing on the chat window (and the text box within that window) to share links. To improve this, I switched the channel bot to [Nightbot][14], a chatbot that adds moderation and other features to a stream's chat function. Many bots are available, but I chose this one because it has API integration and buttons to help me get things into chat when I need them.

The first two buttons cue things up. I often paste URLs into my streams, but I don't want to risk accidentally pasting a password. So the cue button first cues up what I have in my clipboard (shout out to [Clipboard for Go][15] for the clipboard integration) and shows it to me. The other cue button reads the next line from a file I keep of things I might want to share on a stream—maybe I want to mention an event where I'm speaking that I think the crowd would like, or I know I'm going to promote a particular tool on the stream that day—and shows me what it's going to send. I can press the cue button again to see another line from the file.

The Send button causes the bot to "chat" the cued-up text into my channel. This is a much better setup than searching for a chat window when you are mid-spiel about a topic.

#### Lights and sounds

I'm not the only streamer with funky, changeable light colors in the background of my streaming location, and having control over them is very useful. The shelf that sits behind me has a custom groove for a strip of neopixels. My Stream Deck has buttons to turn the lights on and off and implement some color presets. Everything works over [MQTT][16], and I use the [Eclipse Paho client in Go][17] to control it all. Another button on the Stream Deck turns my video light on and off so that I can get everything set up and cue the lights when I'm ready to stream, rather than blinding myself when I'm not live. I will happily admit to flipping the LED strip colors as a sort of video meeting party trick or even when nobody is watching! Buttons to press and colorful lights… what's not to like?

I also have sound effects on my Stream Deck, but I haven't made cute icons for those buttons yet. Technology-wise, I'm running [CasterSoundboard][18], which supports the [Open Sound Control][19] protocol, and using the [hypebeast/osc][20] library in my application to wrangle it. I have a few different sounds; they make me (and hopefully others!) smile. I have seen some really engaging sound effects on streams, but I think I'm at a beginner stage so far!

#### Non-streaming buttons

There are not many other features on my Stream Deck, but those are the ones I use the most, by far, usually when I'm not streaming. The first is a screenshot button. I write a lot of technical documentation, and sometimes that means I need to create screenshots. Having a one-press button that captures the current window in two seconds is very useful, and I am so happy with it. The button activates the command I'd use for this:


```
/usr/bin/gnome-screenshot -w -d 2
```

Finally, something I never want to part with: a microphone mute button. It mutes at the system level via [pulsemixer][21], and it shows an indicator of the device's current state. I'm writing this in 2020, when video calling is my primary human contact. Since many platforms don't have a way to hover or click to get to the mute icon, having control of my sound device like this is fabulous. Lots of video calling applications will pick up these settings and show you as muted when you are and unmuting when you want to make an important point. Sometimes the smallest things are the most life-changing!

### Give it a go

There are many features I use daily, and not just when I'm streaming. I have had a lot of fun dreaming up improvements and features for the Stream Deck and sometimes streaming while I implement them.

There are some features that I wouldn't want to live without now. If you're on the fence about getting a device like this, I'd recommend giving it a go. There are lots of great libraries to help you make it your own.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/stream-deck

作者：[Lorna Mitchell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lornajane
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://twitch.tv/lornajanetv
[3]: https://www.elgato.com/en/gaming/stream-deck
[4]: https://opensource.com/sites/default/files/uploads/lorna.jpg (Lorna's video streaming setup)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://github.com/lornajane/streamdeck-tricks
[7]: https://opensource.com/sites/default/files/uploads/streamdeck.jpg (Stream Deck)
[8]: https://obsproject.com/
[9]: https://github.com/Palakis/obs-websocket
[10]: https://github.com/christopher-dG/go-obs-websocket
[11]: https://en.wikipedia.org/wiki/Wmctrl
[12]: https://developer.gnome.org/gtk3/stable/gtk-launch.html
[13]: https://github.com/jiahaog/Nativefier
[14]: https://nightbot.tv/
[15]: https://github.com/atotto/clipboard
[16]: https://mqtt.org/
[17]: https://github.com/eclipse/paho.mqtt.golang
[18]: https://github.com/JupiterBroadcasting/CasterSoundboard
[19]: http://opensoundcontrol.org/osc
[20]: https://github.com/hypebeast/go-osc
[21]: https://pypi.org/project/pulsemixer/
