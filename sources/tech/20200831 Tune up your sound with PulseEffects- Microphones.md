[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tune up your sound with PulseEffects: Microphones)
[#]: via: (https://fedoramagazine.org/tune-up-your-sound-with-pulseeffects-microphones/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Tune up your sound with PulseEffects: Microphones
======

![][1]

The PulseEffects [app][2] is a full-featured set of modular effects you can use to adjust sound devices. In a [previous article][3], you learned how you can use PulseEffects to correct or enhance output devices like speakers. However, that’s not where its features stop. You can also enhance sound input devices such as microphones. This can help when recording sound for podcasts, videos, or the like.

This article assumes you’ve already installed PulseEffects as shown in the [previous article][3]. It will not cover advanced topics like recording musical instruments, but it will show you how to do better voice or spoken-word recordings.

### A word on microphones

Microphones come in a variety of forms. The one almost every laptop user has at hand is the condenser microphone built into the hardware. These microphones are limited in terms of producing quality sound. They’re built to provide basic sound, and they will pick up a lot of environmental noise due to how they work. If you want better results for a voice recording, there are many choices available based on budget.

  * USB headset with built-in condenser microphone: Generally [budget-friendly][4] and almost always gives better results than a laptop’s built-in mic. The resulting sound can be somewhat harsh and tinny, but this can be corrected. Manufacturers such as Logitech make units that are plug-and-play ready for Linux. They show up as USB sound devices (both input and output).
  * Handheld dynamic microphone: You’ll see the singer in a live band using one of these. You have to be close to them (and maintain that distance steadily) for best results, but they sound full and well-defined. These are typically [a little more expensive][5] than a USB headset.
  * Large diaphragm condenser microphone: You’ll see this type used by a singer or speaker in a broadcast or recording studio. Like other condensers they pick up a lot of the surrounding environment. By being fairly close to the mic you can essentially “turn down” the rest of the room. You can find budget friendly, good quality large condensers [starting at the same price][6] as a good dynamic mic. Prices go up from there to astronomical levels!



Most dynamic and large diaphragm condenser mics need to be plugged into a _digital audio interface_, using a microphone cable. This converts the signal from the mic into digital audio for the computer to use. However, you can find specialty mics made for direct connection via USB. These may be advertised as “podcaster mics,” and you can [save some money][7] using one of these, versus buying both a mic and an interface.

### Making the mic sound better

Effects help you improve the recorded sound of your microphone. Whether you know it or not, you hear these effects all the time in recorded sound — in music, in TV shows and movies, on professional podcasts, and via commercial and satellite radio. Engineers apply these effects using either hardware units, or via software.

PulseEffects provides these effects in a software form, before your recording is saved on disk. Here is a list, in the order they are usually applied:

  * A _gate_ reduces or entirely mutes the microphone when sound falls below a certain level. With proper settings, when you start speaking, the gate quickly opens, unmuting the mic. When you finish, the gate closes and other environmental sound will be either silenced or much quieter.
  * A _compressor_ reduces the dynamic range of the input. Louder sounds are caught by the compressor and squashed down. You then turn the entire signal up slightly to compensate. This way, quieter and louder sounds become closer in volume, making the sound more even and less “peaky.” This results in a more professional, polished sound that’s much more enjoyable for listeners.
  * An _equalizer_ (EQ) tunes up the sound of the voice. Use it to mitigate tones in your voice that you find unflattering. In addition, when you speak close to a mic, the bass frequencies in the voice are unnaturally emphasized. Sound engineers call this the _proximity effect_. By using an EQ to roll off the low end frequencies, you can reduce this effect and create a more pleasant sound.
  * A _limiter_ is often the last step in a signal chain. This effect puts an absolute limit on the volume of a sound, so that unexpectedly hard sounds (such as _p_ or _b_ sounds, called _plosives_) that aren’t caught by compression don’t distort and ruin your recording.



### Dive into PulseEffects

Open up the _PulseEffects_ app. In the top left corner, choose the microphone selector icon. This lets you set up the effects chain you want for the mic as an input device. As with output devices (speakers), you can save your effects chain as well.

Use recording software that registers as a PulseAudio client to see your effects at work. The _PulseCaster_ app is one such app, but there are many others you can choose.

### Tips from a mix engineer

These guidelines may help you find the optimal sound. Remember that no two sound situations are ever the same. Use your ears, and do some test recordings, to figure out what’s best for your situation.

  * When you apply the gate, use a fast response of 5-10ms. The human voice has a significant “startup time,” so this speed makes the gate unnoticeable. Give the gate some time to close, though, so you don’t cut off the end of speech. Typically 100-200ms sounds fairly natural. A gain reduction of -12 or -18dB suffices to reduce environmental noise, and sounds more natural than more extreme values.
  * If you find a module is overloading when you speak, either reduce the output of the effects module before it, or the input of the module itself.
  * If you like the sound of your recorded voice without an EQ, use the _Filter_ module instead to simply apply a high pass filter. For male voices, use a roll-off frequency of 80-100 Hz. For female voices, use a higher value. If you set the filter too high, the recording may sound weak or nasal.
  * Use a compressor ratio between 3 and 4 (this is actually 3:1 – 4:1) which works well with a human voice. An attack of 20ms and a release of 100-200ms is typical.
  * You may want to try the _Deesser_ module as well, to reduce the “sizzling” of _s_, _z_, _t_, and _f_ sounds. Because voices vary so widely, you’ll need to tune this to taste. A split of 6kHz and a threshold of -18dB is a good place to start.
  * A limiter setting of -1 to -3dB usually works well. Much lower settings result in a very “squashed” sounding track. In some cases that may be useful; in others it will sound unnatural.



Refer to the previous article to save your effects chain. Remember, you can store multiple chains, and then select the one you want for your particular needs.

* * *

_Photo by [Jacek Dylag][8] on [Unsplash][9]_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/tune-up-your-sound-with-pulseeffects-microphones/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/08/pulseeffects-2-816x345.jpg
[2]: https://flathub.org/apps/details/com.github.wwmm.pulseeffects
[3]: https://fedoramagazine.org/tune-up-your-sound-with-pulseeffects-speakers/
[4]: https://www.google.com/search?q=usb+headset+with+mic&tbm=shop
[5]: https://www.google.com/search?tbm=shop&q=handheld+dynamic+microphone
[6]: https://www.google.com/search?tbm=shop&q=large+condenser+microphone
[7]: https://www.google.com/search?tbm=shop&q=usb+microphone
[8]: https://unsplash.com/@dylu?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[9]: https://unsplash.com/s/photos/microphone?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
