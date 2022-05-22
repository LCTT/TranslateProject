[#]: subject: (PipeWire: the new audio and video daemon in Fedora Linux 34)
[#]: via: (https://fedoramagazine.org/pipewire-the-new-audio-and-video-daemon-in-fedora-linux-34/)
[#]: author: (Christian Fredrik Schaller https://fedoramagazine.org/author/uraeus/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

PipeWire: the new audio and video daemon in Fedora Linux 34
======

![][1]

Photo by [Samuel Sianipar][2] on [Unsplash][3]

Wim Taymans has a long track record in the Linux community. He was one of the two original developers of the GStreamer multimedia framework and he was the principal maintainer for most of the project’s initial existence. He joined Red Hat in 2013 and has helped maintain GStreamer and PulseAudio for Red Hat since. In 2015 he started working on [PipeWire][4]: a project that has come to full fruition in [Fedora Workstation 34][5], where it handles both audio and video. In addition to that, it also merges the world of pro-audio with mainstream Linux. In this interview we will talk about where PipeWire came from, where it is at and where Wim sees it going from here.

![][6]

_Christian Schaller &amp; Wim Taymans testing PipeWire video filters at Flock_

**Christian Schaller: What was the origin of PipeWire in terms of what problems you wanted to resolve?**

Wim Taymans: PipeWire really evolved out of two earlier ideas. The first one was [PulseVideo][7], which was written by William Manley back in 2015. It was a small server that would send the video from a v4l2 camera to one or more other processes. It used GStreamer, DBus and file descriptor (fd) passing to do this fairly efficiently. It resulted in a bunch of patches to GStreamer regarding fdmemory.

Around that time we started to think about screen capture for Wayland. I was asked to investigate options. The idea was then to take the PulseVideo idea and implement the possibility for clients to provide streams as well (not just v4l2 devices). Another requirement was to make this secure and work well with Flatpak and Flatpak’s concept of portals to handle things that have potential security concerns.

**CS: Ah right, because when PipeWire was originally introduced to Fedora in Fedora 27 it was only dealing with video right? Providing a way to do screen sharing in GNOME Shell?**

WT: Yes, there were only wild ideas about trying to handle audio as well. The version that ended up in Fedora 27 needed another rewrite to make that happen, really.

**CS: Can you talk a little about how PipeWire interacts with things like Wayland and GNOME Shell?**

WT: GNOME Shell will send a stream to PipeWire when screen sharing is activated. PipeWire will route this stream to the applications like Firefox or the screen recorder. We have some more advanced features implemented such as DMABUF passing and metadata for the cursor and clipping regions when sharing a single window. There is also the volume control that interacts through the PulseAudio API with PipeWire to manage the volumes.

**CS: So there was no real PipeWire precursor for video, as most stuff just interacted directly with v4l, so I assume it must have been a big task porting over things like GNOME Shell and the web browsers to start using it?  **

WT: There was nothing for screen sharing, it was just X11 calls to grab the screen content. Jan Grulich worked with the upstream WebRTC project to add code to interact with the new portal APIS defined for Wayland, to negotiate screen sharing options and then native PipeWire support to fetch the screen content. Then Martin Stransky backported that work into the Firefox copy of WebRTC and Jan Grulich and Tomas Popela ensured the changes got merged into Chromium/Chrome.

For webcams there is not much progress yet. Browsers still access the v4l2 camera directly. There is a portal to negotiate webcam access through PipeWire but that has not been implemented in browsers as far as I know.

**CS: Talking about porting and developers, first question developers are likely to ask themselves when they hear about a new project like PipeWire is ‘Oh no, do I need to rewrite all my multimedia applications now?’. How is PipeWire dealing with that challenge?**

WT: PipeWire provides compatibility with ALSA, PulseAudio and JACK applications with an ALSA plugin, a replacement PulseAudio server and a JACK replacement client library respectively. Theoretically this should provide a way to run all existing applications without modifications.

With PipeWire, we should now start thinking about those audio APIs as Audio toolkits. It’s a bit like GUI toolkits such as GTK or Qt: both of them talk to the underlying display subsystem (Wayland/X11) and no application thinks about implementing raw Wayland backends in their applications.

It’s the same with JACK/PulseAudio, they provide applications with a model of the Audio subsystem and you select the Audio toolkit best suited for your use case. I don’t see this change unless someone comes up with the ultimate Audio Toolkit.

**CS: How did your thinking about the problem space evolve as you worked on it?**

WT: As the project went forward, I started to investigate if this framework could also support audio. It would need a substantial rewrite to make this work efficiently. GStreamer and dbus needed to be replaced with something more low level to make audio viable, especially pro-audio. At the same time both GObject and DBus started feeling heavy for the low level system I was designing.

I started experimenting with a new small media plugin API at around mid 2016. It was still all very GObject like but I started to reimplement the v4l2 and audiomixer plugins in this new framework. By the end of 2016, I moved away from DBus as well to a more Wayland like protocol.

Early 2017 was when I seriously started to think about implementing the features of an audio server as well. I started to investigate JACK and its processing model and audio plugin APIs such as lv2. This is also when we came up with the name PipeWire. By the end of 2018 I had a working audio server with a JACK-like graph model, well… at least working in the context of my basic test case. 

After some discussions with members of the Linux Pro-Audio community they convinced me that I needed to make some more drastic design changes in the way scheduling and mixing worked if this was ever going to be able to replace JACK for them . This is when the final re-architecting started and eventually became, after 2 years of development, the first 0.3 version in early 2020.

**CS: I know the Pro-audio support you mention has got a lot of buzz in the community, so who did you initially talk to and what has the reception been so far from the wider pro-audio community?**

WT: As mentioned, I had some discussions with them back in early 2018. Robin Gareus and Paul Davis were instrumental in driving the changes that lead to the current implementation.

I think everybody would love to have a seamless, integrated and user friendly experience that can be used for both Pro and Consumer Audio use cases and there is definitely interest in how PipeWire will evolve to make this happen. We’re not there yet in terms of feature parity although we are moving quickly. For instance, just this week I landed Freewheeling support in PipeWire, which should be out in Fedora by the time you read this. Beyond that latency reporting is the big TODO item remaining. Also, while PipeWire can manage the same latency as JACK we are not yet as reliable. So there is some more work to do.

**CS: And what about the PulseAudio developers? How have they taken the arrival of PipeWire? Does Lennart Poettering hate you now?**

WT: I think they are fine with it. We organized a hackfest in October 2018 with some of the PulseAudio developers to talk about PipeWire so it was not a surprise. In fact, Arun Ragahavan who is a long time PulseAudio contributor is currently working on PipeWire. I also talked with Lennart about it back in the early days and he was all for the idea of unifying Pro and Consumer Audio so I don’t think he hates me 🙂

**CS: You are also the creator of GStreamer, how do you see the two projects in terms of use cases?**

WT: I see PipeWire as a much lower-level framework to move data around between apps and devices. It’s very good at handling raw audio and video and interfacing with devices. It’s not so good at muxing and demuxing and it does not want to do some of the higher level multimedia tasks such as implementing an RTSP server or handle transmuxing formats. GStreamer still remains ideally suited for those higher level tasks, muxing, demuxing, encoding, decoding, etc.

**CS: So you see them compliment each other more than compete?**

WT: They absolutely complement each other. I don’t see one overtaking the other. It’s still early to know exactly where things will go but I can see that things like audio or video effect chains are better implemented in PipeWire. While the plumbing and post processing is better done in GStreamer.

**CS: Any community contributors you want to highlight so far beyond yourself?**

WT: Absolutely! Almost all of the new exciting Bluetooth work has been done by community contributors.

Pauli Virtanen has been doing fixes all over the place such as many Bluetooth improvements and general fixing and stability improvements to the SCO plugins, implementing codec switching and delay reporting. He also has his hands in other areas such as the PipeWire IPC connections and the default-node and policy in the session manager, as well as some object management improvements.

Huang-Huang Bao (eh5) who maintained a pulseaudio-modules-bt has been contributing a lot of changes such as LDAC ABR support, Hardware volume support and numerous stability and compatibility fixes all over the place to bring the bluetooth support to the same level as the pulseaudio module.

We also have Collabora contributors George Kiagiadakis and Frédéric Danis regularly contributing Bluetooth, build and other fixes as part of their AGL involvement. They have also been working on an improved session manager called WirePlumber, which we will try to include in Fedora 35.

Dmitry Sharshakov implemented the Bluetooth battery status reporting, which is a relatively new feature in bluez and now also supported by PipeWire.

While not directly tied to PipeWire itself ,the work I mentioned earlier by Jan Grulich, Martin Stransky, and Tomáš Popela getting PipeWire support into the web browsers was also a major step forward. The same goes for all the work Jonas Ådahl did to create the screen capture portal and implement it in GNOME Shell. I also want to give a special mention to Georges Stavracas for his great work on getting PipeWire support into OBS Studio. Jan Grulich has also done a lot of work getting PipeWire support into KDE.

There also also a lot of people active on the [issue tracker][8] that try to help triage bugs, provide help and improve the [wiki pages][9].

**CS: As you’ve been testing and using PipeWire has there been applications you didn’t know about before, but which you discovered due to people reporting they didn’t work with PipeWire or you found when looking for test cases?**

WT: Most of the midi tools, really. I never really used midi before I started to add support in PipeWire. I got fascinated by the various synths, like Helm, zynaddsubfx, and more recently Vital and the free Vitalium application.

There is a whole world of music creation tools that become available when you have midi and JACK compatibility that were previously little or unknown. I didn’t know about any of the lsp or calf plugins before.

I love the idea of [Inge][10] and I would love to see it developed some more. I imagine that a tool like this can be used to model and tweak the effect chains in PipeWire.

**CS: In terms of pro-audio and midi, are you a musician yourself and are these things you see yourself using personally going forward?**

WT: I play a little guitar myself but I’m old school, I plug into a real tube amp without effects and I jam. I did some recording of guitar and voice in Ardour using PipeWire to test things out. I’m really more interested in creating code so that other people can make music you actually want to listen to 🙂

**CS: What do you feel are the remaining items that need to be tackled in PipeWire?**

WT: There is a long TODO list of pending items…

For desktop use cases, we need to reach reasonable feature parity with PulseAudio. We’re missing the automatic detection and setup of network streams along with passthrough of compressed formats such as DTS and AC3 over HDMI.

For the PRO audio use cases we need to implement what in Jack is known as  Freewheeling and then latency reporting.

After that, we can start to look at all the exciting new things we can do now with PipeWire. We’re probably looking at a redesign of the sound control panel at some point.

On the video front, a lot can be improved. We don’t have a video processing pipeline yet, let alone the tools to manage such a video pipeline.

**CS: Are there any specific areas you would love to see more contributors to in** **PipeWire?**

WT: Sure! I think there are so many exciting things you can make now. For example, we don’t really have a native patchbay. We rely on JACK tools, but those don’t handle the video streams. I would say a simple curses based patchbay would be a nice contribution.

In PipeWire it is relatively easy to write new external sinks or sources. I would love to see a native implementation of a good general purpose network protocol like ROC or so.

**CS: You recently started a new job inside Red Hat, can you tell us a little about that and what that means for PipeWire?**

WT: Yes, I’m part of the new Infotainment group inside Red Hat that will initially focus on providing the software stack for the sutomotive sector. This is about enabling Audio and Video in cars and PipeWire will play a major part in realizing that. PipeWire is already part of Automotive Grade Linux, together with WirePlumber.** **

One of the challenges is to be able to route all the audio capture and playback streams in a car in a flexible way. Modern cars also have a large amount of video cameras that need to be managed. Part of the plan is to improve PipeWire for these use cases.

The expectation is that some of these use cases will also benefit desktop users eventually.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/pipewire-the-new-audio-and-video-daemon-in-fedora-linux-34/

作者：[Christian Fredrik Schaller][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/uraeus/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/05/pipewire-taymans-816x345.jpg
[2]: https://unsplash.com/@samthewam24?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/pipe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://pipewire.org/
[5]: https://fedoramagazine.org/whats-new-fedora-34-workstation/
[6]: https://lh5.googleusercontent.com/veQ7AR06E-vbSYabLZw0StEuX9pP5OVu7nDMuIiq9nPurMas0uPUXDUwI9rdAL9vWKZ8L-CPNR0PSRcXtJZamHmAWYPfxE9r4kwxYoT6p8qRlkbUq0tbkQgDLprmqAn1HOx8wsoj
[7]: https://github.com/wmanley/pulsevideo
[8]: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues
[9]: https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/home
[10]: https://drobilla.net/software/ingen
