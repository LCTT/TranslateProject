[#]: subject: "Spotify Introduces an Open-Source Tool to Fix a Big Problem for Modern Musicians"
[#]: via: "https://news.itsfoss.com/spotify-basic-pitch/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Spotify Introduces an Open-Source Tool to Fix a Big Problem for Modern Musicians
======
Spotify’s new open-source tool helps you convert audio to MIDI version. Explore why it is a big deal for modern musicians.

![spotify][1]

Spotify is a leading music streaming platform with several open-source projects.

While most of the projects/tools are built for niche users, they have finally introduced something that seems enticing to all the modern musicians involved with digital music production.

‘Basic Pitch’ is a new free and open-source tool by Spotify that lets you convert any audio file to its MIDI (Musical Instrument Digital Interface) version.

In case you did not know, with MIDI notes, you can easily tweak what’s being played and analyze more to help you in digital music production.

### Basic Pitch: Making Things Easier

With Basic Pitch, one can easily have MIDI notes of an audio file they have always wanted, and with better accuracy.

![spotify basic pitch][2]

Spotify explains that it is better than existing note-detection systems by offering some advantages that include:

> **Polyphonic + instrument-agnostic:** Unlike most other note-detection algorithms, Basic Pitch can track multiple notes at a time and across various instruments, including piano, guitar, and ocarina. Many systems limit users to only monophonic output (one note at a time, like a single vocal melody), or are built for only one kind of instrument.

> **Pitch bend detection:** Instruments, like guitar or the human voice, allow for more expressiveness through pitch-bending: vibrato, glissando, bends, slides, etc. However, this valuable information is often lost when turning audio into MIDI. Basic Pitch supports this right out of the box.

> **Speed:** Basic Pitch is light on resources, and is able to run faster than real time on most modern computers ([Bittner et al. 2022][3]).

Basic Pitch uses a machine learning model that turns various instrumental performances into MIDI. The audio file may also contain your voice, but it should still be able to convert the instrument to its MIDI version.

![Basic Pitch demo: Convert audio into MIDI using ML][4]

I tried converting an MP3 karaoke file with a single instrument to get the MIDI notes, and it seemed to work pretty well.

The tool also lets you process more than one audio file at a time and offers a few parameter controls that include note segmentation, confidence threshold, minimum/maximum pitch, and note length.

### Made for Creators and Researchers

Spotify mentions that it targets the creators primarily, but they are also interested to learn how machine learning researchers build upon it and help develop better solutions using the [open-source project on GitHub][5].

As a creator/musician, you can access the open-source tool on its [official website][6] for a demo. The parameters can be adjusted using the website, and you can also download the MIDI file from there.

[Basic Pitch][7]

![spotify basic pitch][8]

It is also available via [PyPI][9] to install and use via the command-line interface on Linux, Windows, and macOS.

You can explore its [GitHub page][10] to know more about its usage/commands.

If you are curious, the [official announcement post][11] provides more technical comparisons and explanations regarding the development of the tool.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/spotify-basic-pitch/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/spotify-midi.jpg
[2]: https://news.itsfoss.com/wp-content/uploads/2022/06/spotify-basic-pitch-1024x531.png
[3]: https://ieeexplore.ieee.org/document/9746549
[4]: https://youtu.be/DhlvfgS73ZQ?list=PLf1KFlSkDLIAYLdb-SD9s8TdGy0rWIwVr
[5]: https://github.com/spotify/basic-pitch
[6]: https://basicpitch.spotify.com/
[7]: https://basicpitch.spotify.com/
[8]: https://news.itsfoss.com/wp-content/uploads/2022/06/basic-pitch-parameters.jpg
[9]: https://pypi.org/
[10]: https://github.com/spotify/basic-pitch
[11]: https://engineering.atspotify.com/2022/06/meet-basic-pitch/
