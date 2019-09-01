[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Google opens Android speech transcription and gesture tracking, Twitter's telemetry tooling, Blender's growing adoption, and more news)
[#]: via: (https://opensource.com/19/8/news-august-31)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

Google opens Android speech transcription and gesture tracking, Twitter's telemetry tooling, Blender's growing adoption, and more news
======
Catch up on the biggest open source headlines from the past two weeks.
![Weekly news roundup with TV][1]

In this edition of our open source news roundup, we take a look two open source releases from Google, Twitter's latest observability tooling, anime studio adopts Blender, and more!

### A double hit of open source from Google

Developers at search engine giant Google have been busy on the open source front lately. In the last two weeks, they've released two very different systems as open source.

The first of those is the [speech engine for Live Transcribe][2], a speech recognition and transcription tool for Android, which "uses machine learning algorithms to turn audio into real-time captions" on mobile devices. Google's announcement states it is making Live Transcribe open source to "let any developer deliver captions for long-form conversations." You can browse or download Live Transcribe's source code [on GitHub][3].

Google also open sourced [gesture tracking software][4] for Android and iOS, built on top of its [MediaPipe][5] machine learning framework. The software combines three artificial intelligence components: a palm detector, a model that "returns 3D hand points," and a gesture recognizer. The goal, according to Google's researchers, is to improve "the user experience across a variety of technological domains and platforms." The source code and documentation for the software is [available on GitHub][6].

### Twitter open sources Rezolus telemetry tool

When you think of network outages, what comes to mind are big crashes or slowdowns that affect the performance of a site or service. What may surprise us is the importance of small blips that slowly eat away at performance. To make detecting those blips easier, Twitter developed a tool called Rezolus which the company [has open sourced][7].

> Our existing telemetry, which samples minutely, was failing to reflect these anomalies. This was because the anomalies, which were about 10 seconds in duration, were being masked by a low sample rate relative to the length of the anomalies. This made it difficult to understand what was happening and tune the system for higher performance.

Rezolus is designed to detect "very brief but sometimes significant performance anomalies," which only last a few seconds. Twitter has been running Rezolus for about a year and has been using what it collects "with the backend service logs to determine the source of spikes." 

If you're curious about adding Rezolus to your Observability stack, check out the source code in Twitter's [GitHub repository][8].

### Japan's Khara animation studio adopts Blender

Blender is considered the gold standard of open source animation and visual effects software. It's been adopted by several production companies, the latest of which is [Japanese anime studio Khara][9].

Khara is using Blender to develop _Evangelion: 3.0+1.0_, the latest installment of the film series based on the popular anime series _Neon Genesis Evangelion_. While the work for the movie won't be completely done in Blender, Khara's employees "will start using Blender for the majority of their work" starting in June, 2020. To underscore its commitment to both Blender and open source, "Khara announced that it would be joining the Blender Foundation’s Development Fund as a corporate member."

### NSA to share its firmware security tool

Following on the heels of its Australian counterpart [sharing one of its tools][10], the National Security Agency (NSA) is [making available][11] the fruits of a project that "that could better protect machines from firmware attacks." This latest release, along with other open source efforts to protect firmware, can be found under the [Coreboot Gerrit repository][12].

The catchy name SMI Transfer Monitor with Protected Execution (STM-PE) "will work with x86 processors that run Coreboot" to guard against firmware attacks. According to Eugene Meyers of the NSA's Laboratory for Advanced Cybersecurity, STM-PE takes low-level operating system code "and puts it in a box such that it can only access the device system that it needs to access." This helps prevent tampering and, Myers said, "will improve the security of the system."

#### In other news

  * [exFAT in the Linux kernel? Yes!][13]
  * [Valencia continues its support for Linux school distro][14]
  * [Spain's First Open Source Satellite][15]
  * [Western Digital's Long Trip from Open Standards to Open Source Chips][16]
  * [Waymo open-sources data set for autonomous vehicle multimodal sensors][17]



_Thanks, as always, to Opensource.com staff members and moderators for their help this week._

--------------------------------------------------------------------------------

via: https://opensource.com/19/8/news-august-31

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/weekly_news_roundup_tv.png?itok=B6PM4S1i (Weekly news roundup with TV)
[2]: https://venturebeat.com/2019/08/16/google-open-sources-live-transcribes-speech-engine/
[3]: https://github.com/google/live-transcribe-speech-engine
[4]: https://venturebeat.com/2019/08/19/google-open-sources-gesture-tracking-ai-for-mobile-devices/
[5]: https://github.com/google/mediapipe
[6]: https://github.com/google/mediapipe/blob/master/mediapipe/docs/hand_tracking_mobile_gpu.md
[7]: https://blog.twitter.com/engineering/en_us/topics/open-source/2019/introducing-rezolus.html
[8]: https://github.com/twitter/rezolus
[9]: https://www.neowin.net/news/anime-studio-khara-is-planning-to-use-open-source-blender-software/
[10]: https://opensource.com/article/19/8/news-august-17#ASD
[11]: https://www.cyberscoop.com/nsa-firmware-open-source-coreboot-stm-pe-eugene-myers/
[12]: https://review.coreboot.org/admin/repos
[13]: https://cloudblogs.microsoft.com/opensource/2019/08/28/exfat-linux-kernel/
[14]: https://joinup.ec.europa.eu/collection/open-source-observatory-osor/news/120000-lliurex-desktops
[15]: https://hackaday.com/2019/08/15/spains-first-open-source-satellite/
[16]: https://www.datacenterknowledge.com/open-source/western-digitals-long-trip-open-standards-open-source-chips
[17]: ttps://venturebeat.com/2019/08/21/waymo-open-sources-data-set-for-autonomous-vehicle-multimodal-sensors/
