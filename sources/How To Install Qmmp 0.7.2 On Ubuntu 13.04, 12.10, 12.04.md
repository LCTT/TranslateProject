#How To Install Qmmp 0.7.2 On Ubuntu 13.04, 12.10, 12.04

Hello Ubuntu Geeks!

How are you? This article aim is to teach you guys how to install the **Qmmp 0.7.2** app in your Ubuntu machine. There are many multimedia players for Ubuntu and Qmmp is one of them, a multimedia player based on Qt. The Qmpp audio player is written with the help of the Qt library and its user interface is similar to winamp or xmms. Do you like winamp interface? What about xmms? No? Ok, don’t worry, alternative user interfaces also are available. You can view them [here](http://qmmp.ylsoftware.com/links.php).

The actual stable release is Qmmp 0.7.2 which was released on August 26. This program is very powerful and simple to use. It uses MPEG v1/2 layer 1/2/3 decoder and support many output formats such as MPEG1 layer 2/3,Ogg Vorbis,Ogg Opus,Native FLAC/Ogg FLAC,Musepack,WavePack. The full list of supported output formats is shown below.

- MPEG1 layer 2/3
- Ogg Vorbis
- Ogg Opus
- Native FLAC/Ogg FLAC
- Musepack
- WavePack
- Tracker modules (mod, s3m, it, xm, etc)
- ADTS AAC
- CD Audio
- WMA, Monkey’s Audio (and other formats provided by FFmpeg library)
- PCM WAVE (and other formats provided by libsndfile library)
- Midi
- Chiptune formats (AY, GBS, GYM, HES, KSS, NSF, NSFE, SAP, SPC, VGM, VGZ, VTX)

The **Qmmp 0.7.2** app has many fixes and changes from the previous release. The api documentation is fixed and the unimplemented function has been removed. Are you curious to know all the changes since 0.7.1?

Changes since 0.7.1:

- fixed queue update bug;
- fixed track length formatting;
- fixed api documentation;
- fixed gcc warnings;
- fixed memory leaks;
- fixed wildmidi config path;
- fixed playlist autosave feature;
- fixed possible segmentation fault;
- fixed title format update bug;
- removed unimplemented function.

Now it is time to install Qmpp 0.7.2. Open a new terminal and type:

	$ sudo add-apt-repository ppa:forkotov02/ppa

Figure 1

Figure 2

Then to update sources list, type:

	$ sudo apt-get update

Figure 3

After the update is finished we download qmpp,  qmmp-plugin-pack and install them.

	$ sudo apt-get install qmmp qmmp-plugin-pack

Figure 4

via: http://www.unixmen.com/install-qmmp-0-7-2-ubuntu-13-04-12-10-12-04/