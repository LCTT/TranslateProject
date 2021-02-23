[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Real-time noise suppression for video conferencing)
[#]: via: (https://fedoramagazine.org/real-time-noise-suppression-for-video-conferencing/)
[#]: author: (lkiesow https://fedoramagazine.org/author/lkiesow/)

Real-time noise suppression for video conferencing
======

![][1]

With people doing video conferencing all day, good audio has recently become much more important. The best option is obviously a proper audio studio. Unfortunately, this is not something you will always have and you might need to make do with a much simpler setup.

In such situations, a noise reduction filter that keeps your voice but filters out ambient noises (street noise, keyboard, …) can be very helpful. In this article, we will take a look at how to integrate such a filter into PulseAudio so that it can easily be used in all applications with no additional requirements on their part.

Example of switching on noise reduction

### The Idea

We set up [PulseAudio][2] for live noise-reduction using [an LADSPA filter][3].

This creates a new PulseAudio source which can be used as a virtual microphone. Other applications will not even realize that they are not dealing with physical devices and you can select it as if you had an additional microphone connected.

### Terminology

Before we start, it is good to know the following two PulseAudio terms to better understand what we are doing:

  * _source_ – represents a source from which audio can be obtained. Like a microphone
  * _sink_ – represents a consumer of audio like a speaker



Each PulseAudio sink also has a source called monitor which can be used to get the audio put into that sink. For example, you could have audio put out by your headphones while using the monitor of your headphone device to record the output.

### Installation

While PulseAudio is usually pre-installed, we need to get the LADSPA filter for noise reduction. You can [build and install the filter manually][3], but it is much easier to install the filter via Fedora Copr:

```
sudo dnf copr enable -y lkiesow/noise-suppression-for-voice
sudo dnf install -y ladspa-realtime-noise-suppression-plugin
```

Note that the Copr projects are not maintained and quality-controlled by Fedora directly.

### Enable Noise Reduction Filter

First, you need to identify the name of the device you want to apply the noise reduction to. In this example, we’ll use the RODE NT-USB microphone as input.

```
$ pactl list sources short
0 alsa_input.usb-RODE_Microphones_RODE_NT-USB-00.iec958-stereo …
1 alsa_output.usb-0c76_USB_Headphone_Set-00.analog-stereo.monitor …
```

Next, we create a new PulseAudio sink, the filter and a loopback between microphone and filter. That way, the output from the microphone is used as input for the noise reduction filter. The output from this filter will then be available via the null sink monitor.

To visualize this, here is the path the audio will travel from the microphone to, for example, a browser:

```
mic → loopback → ladspa filter → null sink [monitor] → browser
```

While this sounds complicated, it is set up with just a few simple commands:

```
pacmd load-module module-null-sink \
    sink_name=mic_denoised_out
pacmd load-module module-ladspa-sink \
    sink_name=mic_raw_in \
    sink_master=mic_denoised_out \
    label=noise_suppressor_stereo \
    plugin=librnnoise_ladspa \
    control=50
pacmd load-module module-loopback \
    source=alsa_input.usb-RODE_Microphones_RODE_NT-USB-00.iec958-stereo \
    sink=mic_raw_in \
    channels=2
```

That’s it. You should now be able to select the new device.

![New recording devices in pavucontrol][4]

### Chromium

Unfortunately, browsers based on Chromium will hide monitor devices by default. This means, that we cannot select the newly created noise-reduction device in the browser. One workaround is to select another device first, then use pavucontrol to assign the noise-reduction device afterward.

But if you do this on a regular basis, you can work around the issue by using the _remap-source_ module to convert the null sink monitor to a regular PulseAudio source. The module is actually meant for remapping audio channels – e.g. swapping left and right channel on stereo audio – but we can just ignore these additional capabilities and create a new source similar to the monitor:

```
pacmd load-module module-remap-source \
    source_name=denoised \
    master=mic_denoised_out.monitor \
    channels=2
```

The remapped device delivers audio identical to the original one so that assigning this with PulseAudio will yield no difference. But this device does now show up in Chromium:

![Remapped monitor device in Chrome][5]

### Improvements

While the guide above should help you with all the basics and will get you a working setup, there are a few things you can improve.

But while the commands above should generally work, you might need to experiment with the following suggestions.

#### Latency

By default, the loopback module will introduce a slight audio latency. You can hear this by running an echo test:

```
gst-launch-1.0 pulsesrc ! pulsesink
```

You might be able to reduce this latency by using the _latency_msec_ option when loading the _loopback_ module:

```
pacmd load-module module-loopback \
    latency_msec=1 \
    source=alsa_input.usb-RODE_Microphones_RODE_NT- USB-00.iec958-stereo \
    sink=mic_raw_in \
    channels=2
```

#### Voice Threshold

The noise reduction library provides controls for a voice threshold. The filter will return silence if the probability for sound being voice is lower than this threshold. In other words, the higher you set this value, the more aggressive the filter becomes.

You can pass different thresholds to the filter by supplying them as control argument when the _ladspa-sink_ module is being loaded.

```
pacmd load-module module-ladspa-sink \
    sink_name=mic_raw_in \
    sink_master=mic_denoised_out \
    label=noise_suppressor_stereo \
    plugin=librnnoise_ladspa \
    control=95
```

#### Mono vs Stereo

The example above will work with stereo audio. When working with a simple microphone, you may want to use a mono signal instead.

For switching to mono, use the following values instead when loading the different modules:

  * _label=noise_suppressor_mono_ – when loading the _ladspa-sink_ module
  * _channels=1_ – when loading the _loopback_ and remap-source modules



#### Persistence

Using the _pacmd_ command for the setup, settings are not persistent and will disappear if PulseAudio is restarted. You can add these commands to your PulseAudio configuration file if you want them to be persistent. For that, edit _~/.config/pulse/default.pa_ and add your commands like this:

```
.include /etc/pulse/default.pa

load-module module-null-sink sink_name=mic_denoised_out
load-module module-ladspa-sink …
…
```

### Limitations

If you listen to the example above, you will notice that the filter reliably reduces background noise. But unfortunately, depending on the situation, it can also cause a loss in voice quality.

The following example shows the results with some street noise. Activating the filter reliably removes the noise, but in this example, the voice quality noticeably drops as well:

Noise reduction of constant street noise

As a conclusion, we can say that this can help if you find yourself in less than ideal audio scenarios. It is also very effective if you are not the main speaker in a video conference and you do not want to constantly mute yourself.

Still, good audio equipment and a quiet environment will always be better.

Have fun.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/real-time-noise-suppression-for-video-conferencing/

作者：[lkiesow][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lkiesow/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/07/noise-reduction-816x345.png
[2]: https://freedesktop.org/wiki/Software/PulseAudio/
[3]: https://github.com/werman/noise-suppression-for-voice
[4]: https://fedoramagazine.org/wp-content/uploads/2020/07/pavucontrol-white-1024x379.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/07/chrome-1024x243.png
