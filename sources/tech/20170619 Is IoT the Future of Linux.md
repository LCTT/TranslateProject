translating---geekpi

Is IoT the Future of Linux?
============================================================ 

_Linux will certainly play a key role in the Internet of Things, but it likely will share the spotlight._ 


With [Canonical refocusing][8] on becoming profitable and new technologies, some among us have found ourselves pondering where Linux is headed in the future and whether or not IoT (Internet of Things) is the future of Linux? This article aims to address both issues head on.

### Mycroft runs Linux

Unknown to most of the non-tech savvy world, there is in fact a few different IoT projects out there that aren't the over-commercialized ones we keep seeing ads for on the Web. The most successful among there has to be the [Mycroft][9] project.

Part of what makes Mycroft interesting is that you're not required to get it as stand alone hardware. This means you can actually download it to a Raspberry Pi or even your own PC. This is an element of freedom not found in more commonly known commercialized alternatives from other players in the IoT device space. Another interesting fact about the Mycroft project is that it was initially funded with crowd funding. So from its inception, it was truly a community inspired project.

So what about its skills, the term used to describe recipes for its abilities? As it stands now, I've heard some mixed reviews. By taking a look into the listed skills available on Github, the overall list seems to be fairly impressive. Digging deeper, it's easy to see that many of the skills are geekier than those found with proprietary IoT devices.

It's also worth noting that there's a distinctive difference between an official skill for IoT devices and those developed by community members. The official skills list for Mycroft is actually pretty weak. Let's face it, as cool as it is to have Linux running an IoT device, it's mind-blowing to me that there are no official email checking skills listed on the [Mycroft Github][10] page. Okay, there is one for Gmail in the community skills section...and it's listed with a question mark as it's apparently not verified as working (or not).

### Google Home – It's a Linux puzzle wrapped in a riddle

So what about Google's IoT offering, Google Home. Surely this runs on Linux, right? Well, in a very broad sense...sort of. It turns out that Google Home is [based on the Chromecast][11]. And the Chromecast? Well, it's based on Google TV. Are we at the Linux part yet? Not exactly.

Apparently the Chromecast is basically running a [stripped down version of Android][12]. And as most of us know, Android does indeed utilize a customized version of the Linux kernel.

It's at this point, I feel like we need to ask ourselves – is Google the best representative for Linux IoT that we can come up with? I'd argue no, as I feel like they're willing to make privacy compromises we wouldn't see in a pure Linux IoT environment. But that's just my personal belief.

Assuming we're willing to give Google Home the benefit of the doubt and assuming that there is some Linux worth recognizing under the hood, how does it compare to the pure open source experience found with Mycroft?

Currently, Google is crushing it. First of all, you can indeed install the "brains" of Google Home (called Google Assistant) to a Raspberry Pi if you wish to. This is made available through the [Google Assistant SDK][13].

The SDK is you guessed it...available to be installed on Linux. After installing portaudio, various libs and a pip install of google-assistant-sdk, you're ready to start talking to your Pi much like you would a Google Home device.

Getting back to the actual Google Home device itself, you might be wondering about its available skills? Out of the box, it provides music playback with Google Play Music, Pandora, Spotify, and iHeart Radio, among other streaming music services. Not only does Google Home have more "conversation" skills available than Mycroft, it works with services like Netflix and home brands such as Philips, Nest and [IFTTT][14] for various smart home tasks. Did I mention it can also schedule stuff on Google Calendar or order pizza?

Comparatively, Mycroft is better for the DIY developer who is looking to create their own skills where Google Home is ready to roll now, not someday.

### Amazon Echo can run on Linux

I'll be first to admit that I have no idea if the Amazon Echo itself runs on some element of Linux or not. That said, I do know you can install the brains behind the Echo onto a Linux powered Raspberry Pi! When it was [first released for the Pi][15], it was a bit of a let down since you had to press a button to activate the Echo's listening mode.

Flash forward to now, Echo for the Pi now supports a programmable "hot word" to activate it. This means you can run a Pi installed with Linux that operates in a similar manner to an official Amazon Echo. Then again, if you buy an Echo Dot, you could just skip the extra work and save the geeky stuff for a Mycroft install on a Pi instead.

Just like Mycroft and Google Home, the Amazon Echo being available on a Pi is important as it makes the IoT technology available to anyone – not just those who opt for the official hardware. And because Amazon has had more time to develop the technology, the Echo is arguably ahead of the competition with programmable skills and overall progress.

So even though Google Home does a far better job answering questions with better answers, the Echo supports more third party IoT devices and some believe has a more natural voice than Google Home. Personally, I think the voices on both devices sound good. But that's just my opinion.

### IoT is Linux at its best

Assuming for a minute we continue to see these IoT devices that are compatible with Linux or projects like Mycroft that are genuinely partners with the community using Linux, one thing is for sure – Linux continues to be a part of the equation.

I would argue that not using a free/open source platform like Linux is just foolish. After all, these devices will often times be connected to other IoT automation components. This means security needs to be a real consideration. Running IoT with Linux under the hood means that we're able as a community to ensure that security is job one, instead of hoping the manufacturer does this for us.

Need an example as to why this is important? Look to any consumer router not running open source firmware. What happens when the manufacturer stops supporting that device – security risks crop up.

Is IoT the future of Linux? In my opinion, I think it is...but not in its entirety. I think that for many it will be a stepping ground. But in the end, I think that there will be so much proprietary "stuff" piled on top of the Linux portion that only pure projects like Mycroft will remain Linux only.

So what say you? Do you think that open source projects like Mycroft are proper competition with Google and Amazon offerings now? Perhaps instead, you feel that there are other Linux based offerings better suited for the job? Whatever it may be, hit the Comments and let's talk about it.

--------------------------------------------------------------------------------

via: http://www.datamation.com/open-source/is-iot-the-future-of-linux.html

作者：[Matt Hartley ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.datamation.com/author/Matt-Hartley-3080.html
[1]:http://www.datamation.com/feedback/http://www.datamation.com/open-source/is-iot-the-future-of-linux.html
[2]:http://www.datamation.com/author/Matt-Hartley-3080.html
[3]:http://www.datamation.com/e-mail/http://www.datamation.com/open-source/is-iot-the-future-of-linux.html
[4]:http://www.datamation.com/print/http://www.datamation.com/open-source/is-iot-the-future-of-linux.html
[5]:http://www.datamation.com/open-source/is-iot-the-future-of-linux.html#comment_form
[6]:http://www.datamation.com/open-source/is-iot-the-future-of-linux.html#
[7]:http://www.datamation.com/author/Matt-Hartley-3080.html
[8]:https://insights.ubuntu.com/2017/04/05/growing-ubuntu-for-cloud-and-iot-rather-than-phone-and-convergence/
[9]:https://mycroft.ai/
[10]:https://github.com/MycroftAI/mycroft-skills
[11]:https://www.theverge.com/circuitbreaker/2016/5/31/11822032/google-home-chromecast-android
[12]:https://www.extremetech.com/computing/162463-chromecast-hacked-its-based-on-google-tv-and-android-not-chrome-os
[13]:https://developers.google.com/assistant/sdk/
[14]:https://ifttt.com/google_assistant
[15]:https://www.raspberrypi.org/blog/amazon-echo-homebrew-version/
