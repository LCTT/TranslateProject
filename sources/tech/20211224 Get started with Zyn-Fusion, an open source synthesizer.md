[#]: subject: "Get started with Zyn-Fusion, an open source synthesizer"
[#]: via: "https://opensource.com/article/21/12/zyn-fusion"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Get started with Zyn-Fusion, an open source synthesizer
======
Whether you've got musical skill or not, if you want to make electronic
noise, you can do it with Zyn-Fusion.
![Woman programming][1]

A wall of synth. That's what I dream of. Given the chance, on one wall of my office, I'd have a modular synthesizer that only Bob Moog himself could truly ever understand. Until I realize this dream, I make do with a very good approximation: Zyn-Fusion.

![ZynAddSubFX reborn][2]

(Seth Kenlon, CC BY-SA 4.0)

Zyn-Fusion is the evolution of the ZynAddSubFX synthesizer, the modular soft synth that's got so many oscillators, oscilloscopes, filters, effects, presets, and knobs that you'll wonder how there were any left for all the other great open source synths out there. Whether you've got musical skill or not, if you want to make electronic noise, you can do it with Zyn-Fusion. You don't need to know what you're doing or why you're doing it to make otherworldly soundtracks. Here's how I musically enhance my workday, and you can do it, too.

### Install

Modular synths are made of different components. While Zyn-Fusion bundles a lot into its interface, there are still a few things you need to install.

#### Zyn-Fusion

On Linux, you may find Zyn-Fusion in your software repository, or if you want to support the project [you can pay for it][3].

It's open source, so you can also [download and compile its source code][4].

#### JACK

You must also install JACK, which is available from your software repository.

### Assembling your modular synth

First, identify your audio output using `aplay`. Depending on your computer, the output you see might be very simple or very complex, and because you're looking at raw system information, it's likely that you won't recognize all of the names and terms you see. It only looks complex, though:


```


$ aplay --list-devices | grep card
**** List of PLAYBACK Hardware Devices ****
card 0: NVidia [HDA NVidia], device 3: HDMI 0 [HDMI 0]
card 0: NVidia [HDA NVidia], device 7: HDMI 1 [HDMI 1]
[...]
card 1: Generic [HD-Audio Generic], device 0: ALC897 Analog [ALC897 Analog]
card 2: DSP [Plantronics .Audio 626 DSP], device 0: USB Audio [USB Audio]

```

Look through the output and think about each card. Don't worry about repeats, just establish what card represents your hardware. For example, I've got HDMI outputs that I don't use on my graphics card, and I have a Plantronics USB headset attached, but I only use that for voice calls. I want my synth to play through my speakers or headphones.

Through the process of elimination, I know that the **Generic** device is the sound card built into my motherboard. The way Linux refers to this device is `hw:1` because it's `card 1`. My gaming headset is `hw:2`, and the digital output of my NVidia card is `hw:0`.

Once you have the device of your preferred sound card, start the JACK daemon. On Linux, you use the ALSA system as the sound driver, the ALSA sequencer (`seq`) for MIDI data, and your preferred sound card (`hw:1` in this example) for output. 


```


$ jackd --realtime \
-d alsa \
\--midi seq \
\--playback hw:1

```

And finally, start your synth with the `--auto-connect` option to ensure that it attaches to JACK:


```
`$ zynaddsubfx --auto-connect`
```

### Connecting a keyboard

If you're using a MIDI keyboard (the one like a piano, not QWERTY), you can connect it to Zyn-Fusion using the `aconnect` command. First, identify MIDI inputs:


```


$ aconnect --input | grep client
client 0: 'System' [type=kernel]
client 14: 'Midi Through' [type=kernel]
client 32: 'USB Device 0x2702:0x1110' [type=kernel,card=4]

```

In this example, `client 32` is the USB keyboard I've got plugged into my computer.

Next, identify applications on the system that can accept MIDI input:


```


$ aconnect --output | grep client
client 14: 'Midi Through' [type=kernel]
client 32: 'USB Device 0x2702:0x1110' [type=kernel,card=4]
client 129: 'ZynAddSubFX' [type=user,pid=18063]

```

In this example, `client 129` is ZynAddSubFX.

Finally, connect the two:


```
`$ aconnect 32:0 129:0`
```

Press a key on your MIDI keyboard to hear Zyn-Fusion's default patch.

### Sculpting sound

Zyn-Fusion has three primary methods of forming sound: additive synthesis, subtractive synthesis, and synth pads. The left panel of the Zyn-Fusion interface provides access to each one.

![Three modes of synthesis][5]

(Seth Kenlon, CC BY-SA 4.0)

To activate one of the modes, click the **Power** button to the left of the mode.

To enter a mode's editing screen, click the mode button itself.

### Additive synthesis

Additive synthesis combines _oscillators_, each with its own waveform, to build a sound. An oscillator, in soft synths, is an emulated electronic circuit that produces a basic waveform, such as a sine wave, square, or saw. Zyn-Fusion also refers to an oscillator as a _voice_ or _vce_ for short. You can have up to eight voices in any sound you're designing.

Zyn-Fusion interface displays the current voice that's active in two places. It shows up as an array of buttons in the left panel:

![Voice buttons][6]

(Seth Kenlon, CC BY-SA 4.0)

It's also displayed as a combo-box with the tabs of the **Add** editing panel.

![Voices and tabs][7]

(Seth Kenlon, CC BY-SA 4.0)

Each oscillator in Zyn-Fusion has its own _envelope_ filter, which controls four attributes (commonly abbreviated as ADSR) of the waveform: the sharpness of its attack, how quickly the sound decays, how long the waveform is sustained, and how quickly it falls off after it's released.

There are dozens of other filters for each oscillator available in the **Add** panel, so click all of the tabs, turn all of the dials and knobs, draw new patterns to define resonance, change the shape of soundwaves, and combine oscillators through modulators until you re-invent white noise.

### Subtractive synthesis

Additive synthesis is fun because the more oscillators you add, the more your sound changes. In stark contrast, subtractive synthesis is just you and one soundwave. You have filters, such as envelope settings, amplitude, harmonics, and bandwidth, and with those, you truly sculpt the soundwave into a form you like. It can be difficult to know what exactly to sculpt, at first, especially if you're not used to looking at a soundwave and translating its visual form into a template for audio. However, after sufficient experimentation, you develop not just a sense for what you're doing but comprehension.

If you want to understand the components of a synthesis, start with subtractive synthesis. It's raw and maybe overwhelming, but it's very powerful when you know exactly the sound you want to hear and just need a tool to help you carve it out of an oscillator's output.

### Pad

The Pad panel contains complex filters and effects you can use to alter the characteristics of a voice. Using a combination of adjustments to the oscillator and samples to create a harmonic profile, the pad editor lets you create a consistent soundscape worthy of the term _synth pad_.

### Presets

Sculpting soundwaves is fun, but there's a place for instant gratification, too. I haven't counted them all, but Zyn-Fusion comes with at least 100 patches ready to play. Click the **Preset** button in the left panel to see them.

![Patch browser][8]

(Seth Kenlon, CC BY-SA 4.0)

The browser uses a filter system to help you find the types of sounds you're looking for. The leftmost column contains patch banks contributed by Zyn-Fusion users, while the middle two columns filter by type and tag. In the right column are the patches contained in the selected patch bank. Until you're used to the presets available, ignore the middle two columns and just browse the unfiltered lists in the left and right columns. There's a lot to choose from, and you can easily spend half a year exploring these patches.

### Sound

Peace and quiet are nice for a while, but sometimes you just have to make some noise. Zyn-Fusion is a classic open source synth with a modern interface. With so many different ways to create new sounds and discover great patches, Zyn-Fusion is one of the truly great soft synths. Download it, and lose a few days to it. You won't regret it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/zyn-fusion

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://opensource.com/sites/default/files/zyn-fusion-ui.jpg (ZynAddSubFX reborn)
[3]: https://gum.co/zyn-fusion
[4]: https://github.com/zynaddsubfx
[5]: https://opensource.com/sites/default/files/zyn-fusion-modes.jpg (Three modes of synthesis)
[6]: https://opensource.com/sites/default/files/zyn-fusion-left-vce.jpg (Voice buttons)
[7]: https://opensource.com/sites/default/files/zyn-fusion-top-vce.jpg (Voices and tabs)
[8]: https://opensource.com/sites/default/files/zyn-fusion-browser.jpg (Patch browser)
