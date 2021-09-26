[#]: subject: "6 open source tools for orchestral composers"
[#]: via: "https://opensource.com/article/21/9/open-source-orchestral-composers"
[#]: author: "Pete Savage https://opensource.com/users/psav"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

6 open source tools for orchestral composers
======
Think it's impossible to compose orchestral tracks with just open source
software? Think again.
![Sheet music with geometry graphic][1]

As an avid amateur musician, I've worked with many different software programs to create both simple and complex pieces. As my projects have grown in scope, I've used composition software ranging from basic engraving to MIDI-compatible notation to playback of multi-instrument works. Composers have their choice of proprietary software, but I wanted to prove that, regardless of the need, there is an open source tool that will more than satisfy them.

### Music engraving programs

When my needs were simple and my projects few, I used the excellent resource [Lilypond][2], part of the GNU project, for engraving my music score. Lilypond is a markup language used to create sheet music. What looks like a mass of letters and numbers on the screen becomes a beautiful music score that can be exported as a PDF to share with all your musical acquaintances. For creating small snippets of a score, Lilypond performs excellently.

Using a text markup language might be a tolerable experience for a software engineer, but waiting to save and run the renderer before seeing the result of your edit can be frustrating. [Frescobaldi][3] is an effective solution to this problem, allowing you to work in a text editor on the left and see a live preview updating on the right. For small scores, this works well. For larger scores, however, the render time can make for a painful experience. Though Frescobaldi has a built-in MIDI-style player, hooking it up to play something requires both knowledge of [JACK][4] (an audio connection API) and a user interface such as [qSynth][5]. For me, Frescobaldi is best for projects when I already know what the score looks like. It's not a composing tool; it's an engraving tool.

### Music notation programs

A few months ago, I started creating a songbook for my former band. For this project, I needed to add chord diagrams, guitar tablature, and multiple staves, so I moved over to [Denemo.][6] Denemo is a fabulously configurable tool that uses LilyPond as its rendering backend. The key benefit to Denemo is the ability to enter notes on a stave. The stave you enter notes on might not look exactly like the score will appear on rendering—in fact, it almost certainly won't. However, in most cases, it's far easier to enter the notes directly on a stave than to write them in a text markup language.

Denemo served me well when creating my songbook, but I had greater ambitions. When I started composing a few piano and small ensemble pieces, I could have handled these in Denemo, but I decided to try [MuseScore][7] to compare the programs. Though MuseScore doesn't use a text-based markup language like Lilypond, it has many other benefits over the LilyPond-based offerings, such as single-note dynamics and rendering out to WAV or MP3.

In my latest project, I took a piano concept I wrote for a fictional role-playing game (RPG) and turned it into a full orchestral version. MuseScore was fantastic for this. The program definitely became part of my composing process, and it would have been much more difficult for me to arrange 18 instruments in LilyPond than in MuseScore. I was also able to hear single-note dynamics, such as a single violin note moving from silence to loud and back. I do not know of any editors for Lilypond that allow for this.

#### Piano Concept

#### Orchestral Concept

### Going beyond the score

My next task will be to take the MIDI from this project and code it into a Digital Audio Workstation (DAW), such as [Ardour][8]. The difference between the audio output from MuseScore and something created with a DAW is that a DAW allows much more than single-note dynamics. Expression, volume, and other parameters can be adjusted in time, allowing for a more realistic sound, assuming the instrument can handle it. I'm currently working on packaging up [sFizz][9] for Fedora. sFizz is an SFZ instrument VST plugin that can be used in an open source DAW and has fantastic support for the different expressions I'd like to use in my piece.

The ultimate aim of this project is to show that open source tooling can be used to create an orchestral track that sounds authentic. Think it's impossible to make realistic-sounding orchestral tracks just with open source software? That's for next time.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/open-source-orchestral-composers

作者：[Pete Savage][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/psav
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/sheet_music_graphic.jpg?itok=t-uXNbzE (Sheet music with geometry graphic)
[2]: https://lilypond.org/
[3]: https://frescobaldi.org/
[4]: https://jackaudio.org/
[5]: https://qsynth.sourceforge.io/
[6]: http://www.denemo.org/
[7]: https://musescore.org/en
[8]: https://ardour.org/
[9]: https://sfz.tools/sfizz/
