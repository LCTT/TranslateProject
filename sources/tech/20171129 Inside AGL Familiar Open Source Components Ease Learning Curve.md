Inside AGL: Familiar Open Source Components Ease Learning Curve
============================================================

![Matt Porter](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/porter-elce-agl.png?itok=E-5xG98S "Matt Porter")
Konsulko’s Matt Porter (pictured) and Scott Murray ran through the major components of the AGL’s Unified Code Base at Embedded Linux Conference Europe.[The Linux Foundation][1]

Among the sessions at the recent [Embedded Linux Conference Europe (ELCE)][5] — 57 of which are [available on YouTube][2] -- are several reports on the Linux Foundation’s [Automotive Grade Linux project][6]. These include [an overview from AGL Community Manager Walt Miner ][3]showing how AGL’s Unified Code Base (UCB) Linux distribution is expanding from in-vehicle infotainment (IVI) to ADAS. There was even a presentation on using AGL to build a remote-controlled robot (see links below).

Here we look at the “State of AGL: Plumbing and Services,” from Konsulko Group’s CTO Matt Porter and senior staff software engineer Scott Murray. Porter and Murray ran through the components of the current [UCB 4.0 “Daring Dab”][7] and detailed major upstream components and API bindings, many of which will be appear in the Electric Eel release due in Jan. 2018.

Despite the automotive focus of the AGL stack, most of the components are already familiar to Linux developers. “It looks a lot like a desktop distro,” Porter told the ELCE attendees in Prague. “All these familiar friends.”

Some of those friends include the underlying Yocto Project “Poky” with OpenEmbedded foundation, which is topped with layers like oe-core, meta-openembedded, and metanetworking. Other components are based on familiar open source software like systemd (application control), Wayland and Weston (graphics), BlueZ (Bluetooth), oFono (telephony), PulseAudio and ALSA (audio), gpsd (location), ConnMan (Internet), and wpa-supplicant (WiFi), among others.

UCB’s application framework is controlled through a WebSocket interface to the API bindings, thereby enabling apps to talk to each other. There’s also a new W3C widget for an alternative application packaging scheme, as well as support for SmartDeviceLink, a technology developed at Ford that automatically syncs up IVI systems with mobile phones. 

AGL UCB’s Wayland/Weston graphics layer is augmented with an “IVI shell” that works with the layer manager. “One of the unique requirements of automotive is the ability to separate aspects of the application in the layers,” said Porter. “For example, in a navigation app, the graphics rendering for the map may be completely different than the engine used for the UI decorations. One engine layers to a surface in Wayland to expose the map while the decorations and controls are handled by another layer.”

For audio, ALSA and PulseAudio are joined by GENIVI AudioManager, which works together with PulseAudio. “We use AudioManager for policy driven audio routing,” explained Porter. “It allows you to write a very complex XML-based policy using a rules engine with audio routing.”

UCB leans primarily on the well-known [Smack Project][8] for security, and also incorporates Tizen’s [Cynara][9] safe policy-checker service. A Cynara-enabled D-Bus daemon is used to control Cynara security policies.

Porter and Murray went on to explain AGL’s API binding mechanism, which according to Murray “abstracts the UI from its back-end logic so you can replace it with your own custom UI.” You can re-use application logic with different UI implementations, such as moving from the default Qt to HTML5 or a native toolkit. Application binding requests and responses use JSON via HTTP or WebSocket. Binding calls can be made from applications or from other bindings, thereby enabling “stacking” of bindings.

Porter and Murray concluded with a detailed description of each binding. These include upstream bindings currently in various stages of development. The first is a Master binding that manages the application lifecycle, including tasks such as install, uninstall, start, and terminate. Other upstream bindings include the WiFi binding and the BlueZ-based Bluetooth binding, which in the future will be upgraded with Bluetooth [PBAP][10] (Phone Book Access Profile). PBAP can connect with contacts databases on your phone, and links to the Telephony binding to replicate caller ID.

The oFono-based Telephony binding also makes calls to the Bluetooth binding for Bluetooth Hands-Free-Profile (HFP) support. In the future, Telephony binding will add support for sent dial tones, call waiting, call forwarding, and voice modem support.

Support for AM/FM radio is not well developed in the Linux world, so for its Radio binding, AGL started by supporting [RTL-SDR][11] code for low-end radio dongles. Future plans call for supporting specific automotive tuner devices.

The MediaPlayer binding is in very early development, and is currently limited to GStreamer based audio playback and control. Future plans call for adding playlist controls, as well as one of the most actively sought features among manufacturers: video playback support.

Location bindings include the [gpsd][12] based GPS binding, as well as GeoClue and GeoFence. GeoClue, which is built around the [GeoClue][13] D-Bus geolocation service, “overlaps a little with GPS, which uses the same location data,” says Porter. GeoClue also gathers location data from WiFi AP databases, 3G/4G tower info, and the GeoIP database — sources that are useful “if you’re inside or don’t have a good fix,” he added.

GeoFence depends on the GPS binding, as well. It lets you establish a bounding box, and then track ingress and egress events. GeoFence also tracks “dwell” status, which is determined by arriving at home and staying for 10 minutes. “It then triggers some behavior based on a timeout,” said Porter. Future plans call for a customizable dwell transition time.

While most of these Upstream bindings are well established, there are also Work in Progress (WIP) bindings that are still in the early stages, including CAN, HomeScreen, and WindowManager bindings. Farther out, there are plans to add speech recognition and text-to-speech bindings, as well as a WWAN modem binding.

In conclusion, Porter noted: “Like any open source project, we desperately need more developers.” The Automotive Grade Linux project may seem peripheral to some developers, but it offers a nice mix of familiarity — grounded in many widely used open source projects -- along with the excitement of expanding into a new and potentially game changing computing form factor: your automobile. AGL has also demonstrated success — you can now [check out AGL in action in the 2018 Toyota Camry][14], followed in the coming month by most Toyota and Lexus vehicles sold in North America.

Watch the complete video below:

[视频][15]

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/event/elce/2017/11/inside-agl-familiar-open-source-components-ease-learning-curve

作者：[ ERIC BROWN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/ericstephenbrown
[1]:https://www.linux.com/licenses/category/linux-foundation
[2]:https://www.youtube.com/playlist?list=PLbzoR-pLrL6pISWAq-1cXP4_UZAyRtesk
[3]:https://www.youtube.com/watch?v=kfwEmjSjAzM&index=14&list=PLbzoR-pLrL6pISWAq-1cXP4_UZAyRtesk
[4]:https://www.linux.com/files/images/porter-elce-aglpng
[5]:http://events.linuxfoundation.org/events/embedded-linux-conference-europe
[6]:https://www.automotivelinux.org/
[7]:https://www.linux.com/blog/2017/8/automotive-grade-linux-moves-ucb-40-launches-virtualization-workgroup
[8]:http://schaufler-ca.com/
[9]:https://wiki.tizen.org/Security:Cynara
[10]:https://wiki.maemo.org/Bluetooth_PBAP
[11]:https://www.rtl-sdr.com/about-rtl-sdr/
[12]:http://www.catb.org/gpsd/
[13]:https://www.freedesktop.org/wiki/Software/GeoClue/
[14]:https://www.linux.com/blog/event/automotive-linux-summit/2017/6/linux-rolls-out-toyota-and-lexus-vehicles
[15]:https://youtu.be/RgI-g5h1t8I
