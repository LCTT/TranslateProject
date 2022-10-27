[#]: subject: "How to Record Streaming Audio in Ubuntu and other Linux Distributions"
[#]: via: "https://itsfoss.com/record-streaming-audio/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Record Streaming Audio in Ubuntu and other Linux Distributions
======
How to record audio in Ubuntu and other Linux distributions?

If you want to record a voice over through the microphone of your computer, you can use GNOME Sound recorder or Audacity.

Using GNOME Sound Recorder is easy but it lacks features. Audacity could be overwhelming initially but it has plenty of features for professional level recording. However, I am not going into that detail in this tutorial.

GNOME Sound Recorder works with the microphone. There is another tool called Audio recorder and you can use it to record streaming music (from Sptify, YouTube, internet radio, Skype and most other sources) apart from microphone input.

To summarize, I’ll show you the steps:

* To record sound using GNOME Sound Recorder
* To record streaming audio using Audio Recorder

### Using Sound Recorder to record audio from the microphone

GNOME desktop environment has a good variety of useful applications. Sound Recorder is one of them.

You can install the [Sound Recorder][1] from the Ubuntu Software Center.

![Sound Recorder can be installed from the Ubuntu Software Center][2]

Or, you can use this command in the terminal to install it:

```
sudo apt install gnome-sound-recorder
```

Once installed, you can find it in the system menu and start from there.

![GNOME Sound Recorder][3]

Before you start using it, you should ensure that you have the correct input source chosen in the system settings. GNOME Sound Recorder

![Ensure that you have chosen correct input in system settings][4]

Once you open the Sound Recorder application, it will show an interface like the one below.

![Hit the Record button to start audio recording][5]

Hit on the record button and it starts recording audio instantly. While recording, you get options to pause, stop or discord the recording.

![Options while recording audio][6]

Your recordings are saved and available from the application interface itself. Click on the saved recordings to highlight it.

You can replay the recordings or delete it. You can choose to save it to another location by clicking the save/download button. You may also rename the recordings using the edit button.

![Saved recordings][7]

That’s quite convenient, right? You can choose to record in MP3, FLAC and a couple of more formats.

#### Removing GNOME Sound Recorder

Don’t like it or find it lacking in terms of features?

You can remove GNOME Sound Recorder from the Ubuntu Software Center or use the following command:

```
sudo apt remove gnome-sound-recorder
```

The application of GNOME Sound recorder is limited. It only records from the microphone and this is not what you would want in certain situations.

Imagin you want to record a Skype call or something which is playing in an application or web browser? The nifty Audio Recorder helps in such cases.

### Using Audio Recorder to record streaming audio

You can watch this video to see how to use Audio Recorder. It’s a bit old but the steps are the same.

![A Video from YouTube][8]

[Subscribe to our YouTube channel for more Linux videos][9]

You can use the [official PPA][10] to install Audio Recorder in Ubuntu and Linux Mint. Use the following commands in the terminal (Ctrl+Alt+T) one by one:

```
sudo apt-add-repository ppa:audio-recorder/ppa
sudo apt update
sudo apt install audio-recorder
```

Alternatively, you can download the source code from [launchpad][11]. Once installed, you can start the application from the Activity Overview:

![Audio Recorder][12]

#### Record all kinds of sound from various sources

Audio Recorder records all kinds of sounds your computer makes.

It records audio played through your system’s soundcard, microphones, browsers, webcams and more.

In other words, it records even if your system sneezes (given that you want to record it). It allows you to select the recording device such as webcam, microphone, Skype, etc.

To record the streaming music, select the appropriate source. For example, if you are playing streaming radio in Rhythmbox, then select Rythmbox.

![Audio-Recorder Audio Settings][13]

#### Record at your convenience

Audio Recorder also gives you the option of setting timer. You can start, stop or pause recording at a given clock time or at a pre-defined interval. You can also set the limit on the recorded file size.

Moreover, you can pause (and stop) when there is no audio (or very low sound) and resume it when sound comes back.

All you have to do is to edit the text in the Timer panel. Comment out the “rules” you don’t want to apply and edit the ones per your requirement.

![Audio-recorder Timer Settings][14]

It provides additional settings like auto start at login, show tray icon and other record settings.

![Audio-recorder Additional Settings][15]

#### Save the recorded music file in various file formats

Another gem. You can save the recorded file in your favourite file format. Supported file formats are OGG audio, Flac, MP3, SPX and WAV. I prefer MP3 for my recordings.

The **recorded files are stored in ~/Audio** i.e., in the Audio folder inside your home directory.

![Audio-recorder Audio Formats][16]

#### How good is Audio Recorder?

I used Audio Recorder in Ubuntu to [record the music played on YouTube][17]. I saved a 2-minute video in MP3 format that took 934 KB of space. But I must say I was not expecting the recorded sound quality to be so good. Honestly, I could not distinguish it from the original YouTube song.

#### Removing Audio Recorder

If you don’t find Audio Recorder to your liking, you can remove it using the following commands:

```
sudo apt remove audio-recorder
```

It will be a good idea to [remove the PPA as well][18]:

```
sudo apt-add-repository -r ppa:audio-recorder/ppa
```

### Conclusion

There are probably several other tools for audio recording in Linux. Like GNOME, other desktop environments may also have sound recording apps. I know Deepin has one for sure.

GNOME Sound Recorder is a decent tool for recording sound from your microphone. For recording sound from various sources, Audio Recorder is a good choice.

I hope it helps with your audio recording needs. Let me know if you have any suggestions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/record-streaming-audio/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://wiki.gnome.org/Apps/SoundRecorder
[2]: https://itsfoss.com/wp-content/uploads/2022/08/sound-recorder-ubuntu.png
[3]: https://itsfoss.com/wp-content/uploads/2022/08/sound-recorder.png
[4]: https://itsfoss.com/wp-content/uploads/2022/08/microphone-settings-ubuntu.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/using-sound-recorder-linux.png
[6]: https://itsfoss.com/wp-content/uploads/2022/08/sound-recording-with-sound-recorder.png
[7]: https://itsfoss.com/wp-content/uploads/2022/08/sound-recorder-interface.png
[8]: https://youtu.be/o7Ia2QGeB7Q
[9]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[10]: https://launchpad.net/~audio-recorder/+archive/ubuntu/ppa
[11]: https://launchpad.net/audio-recorder
[12]: https://itsfoss.com/wp-content/uploads/2022/08/audio-recorder-in-overview.png
[13]: https://itsfoss.com/wp-content/uploads/2022/08/audio-recorder-audio-settings.png
[14]: https://itsfoss.com/wp-content/uploads/2022/08/audio-recorder-timer-settings.png
[15]: https://itsfoss.com/wp-content/uploads/2022/08/audio-recorder-additional-settings.png
[16]: https://itsfoss.com/wp-content/uploads/2022/08/audio-recorder-audio-formats.png
[17]: https://itsfoss.com/youtube-dl-audio-only/
[18]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
