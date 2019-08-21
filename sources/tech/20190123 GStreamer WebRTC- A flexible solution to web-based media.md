[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (GStreamer WebRTC: A flexible solution to web-based media)
[#]: via: (https://opensource.com/article/19/1/gstreamer)
[#]: author: (Nirbheek Chauhan https://opensource.com/users/nirbheek)

GStreamer WebRTC: A flexible solution to web-based media
======
GStreamer's WebRTC implementation eliminates some of the shortcomings of using WebRTC in native apps, server applications, and IoT devices.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe)

Currently, [WebRTC.org][1] is the most popular and feature-rich WebRTC implementation. It is used in Chrome and Firefox and works well for browsers, but the Native API and implementation have several shortcomings that make it a less-than-ideal choice for uses outside of browsers, including native apps, server applications, and internet of things (IoT) devices.

Last year, our company ([Centricular][2]) made an independent implementation of a Native WebRTC API available in GStreamer 1.14. This implementation is much easier to use and more flexible than the WebRTC.org Native API, is transparently compatible with WebRTC.org, has been tested with all browsers, and is already in production use.

### What are GStreamer and WebRTC?

[GStreamer][3] is an open source, cross-platform multimedia framework and one of the easiest and most flexible ways to implement any application that needs to play, record, or transform media-like data across a diverse scale of devices and products, including embedded (IoT, in-vehicle infotainment, phones, TVs, etc.), desktop (video/music players, video recording, non-linear editing, video conferencing, [VoIP][4] clients, browsers, etc.), servers (encode/transcode farms, video/voice conferencing servers, etc.), and [more][5].

The main feature that makes GStreamer the go-to multimedia framework for many people is its pipeline-based model, which solves one of the hardest problems in API design: catering to applications of varying complexity; from the simplest one-liners and quick solutions to those that need several hundreds of thousands of lines of code to implement their full feature set. If you want to learn how to use GStreamer, [Jan Schmidt's tutorial][6] from [LCA 2018][7] is a good place to start.

[WebRTC][8] is a set of draft specifications that build upon existing [RTP][9], [RTCP][10], [SDP][11], [DTLS][12], [ICE][13], and other real-time communication (RTC) specifications and define an API for making them accessible using browser JavaScript (JS) APIs.

People have been doing real-time communication over [IP][14] for [decades][15] with the protocols WebRTC builds upon. WebRTC's real innovation was creating a bridge between native applications and web apps by defining a standard yet flexible API that browsers can expose to untrusted JavaScript code.

These specifications are [constantly being improved][16], which, combined with the ubiquitous nature of browsers, means WebRTC is fast becoming the standard choice for video conferencing on all platforms and for most applications.

### **Everything is great, let's build amazing apps!**

Not so fast, there's more to the story! For web apps, the [PeerConnection API][17] is [everywhere][18]. There are some browser-specific quirks, and the API keeps changing, but the [WebRTC JS adapter][19] handles most of that. Overall, the web app experience is mostly 👍.

Unfortunately, for native code or applications that need more flexibility than a sandboxed JavaScript app can achieve, there haven't been a lot of great options.

[Libwebrtc][20] (Google's implementation), [Janus][21], [Kurento][22], and [OpenWebRTC][23] have traditionally been the main contenders, but each implementation has its own inflexibilities, shortcomings, and constraints.

Libwebrtc is still the most mature implementation, but it is also the most difficult to work with. Since it's embedded inside Chrome, it's a moving target and the project [is quite difficult to build and integrate][24]. These are all obstacles for native or server app developers trying to quickly prototype and experiment with things.

Also, WebRTC was not built for multimedia, so the lower layers get in the way of non-browser use cases and applications. It is quite painful to do anything other than the default "set raw media, transmit" and "receive from remote, get raw media." This means if you want to use your own filters or hardware-specific codecs or sinks/sources, you end up having to fork libwebrtc.

[**OpenWebRTC**][23] by Ericsson was the first attempt to rectify this situation. It was built on top of GStreamer. Its target audience was app developers, and it fit the bill quite well as a proof of concept—even though it used a custom API and some of the architectural decisions made it quite inflexible for most other uses. However, after an initial flurry of activity around the project, momentum petered out, the project failed to gather a community, and it is now effectively dead. Full disclosure: Centricular worked with Ericsson to polish some of the rough edges around the project immediately prior to its public release.

### WebRTC in GStreamer

GStreamer's WebRTC implementation gives you full control, as it does with any other [GStreamer pipeline][25].

As we said, the WebRTC standards build upon existing standards and protocols that serve similar purposes. GStreamer has supported almost all of them for a while now because they were being used for real-time communication, live streaming, and many other IP-based applications. This led Ericsson to choose GStreamer as the base for its OpenWebRTC project.

Combined with the [SRTP][26] and DTLS plugins that were written during OpenWebRTC's development, it means that the implementation is built upon a solid and well-tested base, and implementing WebRTC features does not involve as much code-from-scratch work as one might presume. However, WebRTC is a large collection of standards, and reaching feature-parity with libwebrtc is an ongoing task.

Due to decisions made while architecting WebRTCbin's internals, the API follows the PeerConnection specification quite closely. Therefore, almost all its missing features involve writing code that would plug into clearly defined sockets. For instance, since the GStreamer 1.14 release, the following features have been added to the WebRTC implementation and will be available in the next release of the GStreamer WebRTC:

  * Forward error correction
  * RTP retransmission (RTX)
  * RTP BUNDLE
  * Data channels over SCTP



We believe GStreamer's API is the most flexible, versatile, and easy to use WebRTC implementation out there, and it will only get better as time goes by. Bringing the power of pipeline-based multimedia manipulation to WebRTC opens new doors for interesting, unique, and highly efficient applications. If you'd like to demo the technology and play with the code, build and run [these demos][27], which include C, Rust, Python, and C# examples.

Matthew Waters will present [GStreamer WebRTC—The flexible solution to web-based media][28] at [linux.conf.au][29], January 21-25 in Christchurch, New Zealand.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/gstreamer

作者：[Nirbheek Chauhan][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nirbheek
[b]: https://github.com/lujun9972
[1]: http://webrtc.org/
[2]: https://www.centricular.com/
[3]: https://gstreamer.freedesktop.org/documentation/application-development/introduction/gstreamer.html
[4]: https://en.wikipedia.org/wiki/Voice_over_IP
[5]: https://wiki.ligo.org/DASWG/GstLAL
[6]: https://www.youtube.com/watch?v=ZphadMGufY8
[7]: http://lca2018.linux.org.au/
[8]: https://en.wikipedia.org/wiki/WebRTC
[9]: https://en.wikipedia.org/wiki/Real-time_Transport_Protocol
[10]: https://en.wikipedia.org/wiki/RTP_Control_Protocol
[11]: https://en.wikipedia.org/wiki/Session_Description_Protocol
[12]: https://en.wikipedia.org/wiki/Datagram_Transport_Layer_Security
[13]: https://en.wikipedia.org/wiki/Interactive_Connectivity_Establishment
[14]: https://en.wikipedia.org/wiki/Internet_Protocol
[15]: https://en.wikipedia.org/wiki/Session_Initiation_Protocol
[16]: https://datatracker.ietf.org/wg/rtcweb/documents/
[17]: https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection
[18]: https://caniuse.com/#feat=rtcpeerconnection
[19]: https://github.com/webrtc/adapter
[20]: https://github.com/aisouard/libwebrtc
[21]: https://janus.conf.meetecho.com/
[22]: https://www.kurento.org/kurento-architecture
[23]: https://en.wikipedia.org/wiki/OpenWebRTC
[24]: https://webrtchacks.com/building-webrtc-from-source/
[25]: https://gstreamer.freedesktop.org/documentation/application-development/introduction/basics.html
[26]: https://en.wikipedia.org/wiki/Secure_Real-time_Transport_Protocol
[27]: https://github.com/centricular/gstwebrtc-demos/
[28]: https://linux.conf.au/schedule/presentation/143/
[29]: https://linux.conf.au/
