CISCO Announce New Open Source H.264 Codec
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2012/04/youtube.jpg)

*YouTube Is One of Many Sites Using H.264*

**American networking company Cisco [has announced plans to offer an open-source H.264 codec][1] - a move it says will “remove barriers” to its use in WebRTC.**

H.264 is widely used in HTML5 video streaming, though not all browsers and operating systems are able to make use of it.

This is because use of the codec for encoding or decoding requires royalty payments to be made to the MPEG LA, an organisation who license the tangle of patents related to it (which, perhaps not so coincidentally, [includes some patents owned by Cisco][2]).

Furthermore, the codec is prohibited from being distributed with open-source products like web browsers.

This is why some of  YouTube’s HTML5 videos don’t play in Firefox but do in Google Chrome. The latter is able to pay licensing costs on behalf of its users.

But Cisco are aiming to reset this inequality by offering an open-source implementation of the H.264 codec – called OpenH264, developed by them – that **can be used by any project**, including open-source ones, **for free**. No license fees and no restrictions will apply to the use of its binary modules.

The company say that by open-sourcing their H.264 codec, and offering a pre-compiled binary file for free download, it can be used to power newer technologies like WebRTC – a HTML5 API that allows for ‘real time communication’ between browsers.

> ‘Cisco aren’t the first to create an open-source implementation of H.264…’

Indeed, Mozilla [has already announced][3] that it plans to support Cisco’s H.264 binary modules in Firefox.

Cisco aren’t the first to create an open-source implementation of this code. The GNU libavcodec library includes both a decoder and an encoder, the latter based on [x264][4]. But what Cisco are offering is a legal foothold – something other open-source efforts have lacked. This makes the decoder far more useful to companies like Mozilla, who can use it without fear or legal redress.

The nitty-gritty of how this this new offering from Cisco will be offered is a little less straightforward, however.

Cisco will open-source their H.264 stack. This, along with pre-compiled binary modules, will be available to download, for free, from their website. Applications such as Firefox will be able to ‘load’ the binary (even auto-download it where needed) to make use of it.

While Cisco will pay patent license costs to the MPEG LA they won’t pass this on to users of their module. It’s less clear what protection those compiling directly from its source will have, though with the code due to hit Github in the coming weeks more information will be available.

### Summary ###

The tl;dr is that Cisco are helping to move the web forward. High-quality video streaming based on a widely used standard will, with OpenH264, be available to more people on more platforms thanks to some goodwill and open-source effort on behalf of Cisco.

Whether you’re a fan of H.264, or favour the adoption of truly free codecs like VP8, the ‘levelling of the playing field’ this move offers can only be seen as a good move.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2013/10/cisco-announce-open-source-h-264-codec

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://blogs.cisco.com/collaboration/open-source-h-264-removes-barriers-webrtc/
[2]:http://en.wikipedia.org/wiki/MPEG_LA#H.264.2FMPEG-4_AVC_Licensors
[3]:https://blog.mozilla.org/blog/2013/10/30/video-interoperability-on-the-web-gets-a-boost-from-ciscos-h-264-codec/
[4]:http://en.wikipedia.org/wiki/X264