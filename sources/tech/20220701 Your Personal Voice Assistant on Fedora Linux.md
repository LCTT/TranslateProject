[#]: subject: "Your Personal Voice Assistant on Fedora Linux"
[#]: via: "https://fedoramagazine.org/your-personal-voice-assistant-on-fedora-linux/"
[#]: author: "Marius Schwarz https://fedoramagazine.org/author/mschwarz/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Your Personal Voice Assistant on Fedora Linux
======

![Your Personal Voice Assistant on Fedora Linux][1]

Background image excerpted from [HAL 9000][2], public domain via Wikimedia Commons

_It’s 7 PM. I sit down at my Fedora Linux PC and start a [MMORPG][3]. We want to brawl with Red Alliance over some systems they attacked; the usual stuff on a Friday evening in EVE. While we are waiting on a Titan to bridge us to the fighting area, a tune comes to my mind. “Carola, I wanna hear hurricanes.” My HD LED starts to blink for a second and I hear Carola saying “I found one match” and the music starts._

What sounded like Sci-Fi twenty years ago is now a reality for many PC users. For Linux users, this is now possible by installing “Carola” as your Personal Voice Assistant (PVA)[[1]][4].

### Carola

The first thing people often ask is, “Why did you name it Carola?” 🙂 This is a common misconception. Carola is not the project name. It’s the keyword the PVA reacts to by default. It is similar to “Alexa” or “OK, Google” for those who are familiar with those products. You can configure this keyword. You can also configure other things such as your location, which applications to use by default when opening media files, what [CardDAV][5] server to use when looking up contact information, etc. These settings can be personalized for each user. Some of them can even be changed by voice command (e.g. the name, the default TTS engine, and the default apps).

In 2021 I read an article about the Speech-To-Text (STT) system Vosk[[2]][4] and started to play a bit with it. The installation was easy. But there was no use-case except for writing what one said down to the screen. A few hours and a hundred lines of Java code later, I could give my PC simple commands. After a few more days of work, it was capable of executing more complex commands. Today, you can tell him/her/it to start apps, redirect audio streams, control audio and video playback, call someone, handle incoming calls, and more. If you have a smart-home (which I haven’t 😉) you can even switch on the light in the kitchen. But back to why I chose “Carola” — it was the most recognizable by the STT system I was using at the time. 😉

**Note**: _This PVA has no English translations yet because it was developed in German. I will use rough translations here which should work once someone helps with translating the config. There are videos out about Carola which show these kinds of interactions in reality_[[6]][4]_. For now, because a few dependencies are unavailable from Fedora Linux’s default repositories, you will need to install the system manually. But don’t be afraid, it is all described in the [READ.ME][6] and it is pretty simple._

### The time of eSpeak has run out

A voice assistant doesn’t just react to your speech. It can also reply back to you. You might expect it to sound like a creepy robot voice from the 1960s when it was invented. But trust me, Fedora Linux can do better. 😉 Naturally, eSpeak was the first choice because it was installed on the system by default. But today we can choose (even by voice command 😉) what speech engine we want to use.

### Text-To-Speech (TTS) systems

Text-To-Speech systems translate the written text to a listenable waveform. Some systems output the waveform directly. Others produce MP3 or WAV files which you can then play with, for example, _sox_. Over the last year, we’ve experimented with several TTS systems. One outputs the text via the Samsung TTS engine on an Android device. It sounds great, but it requires your cellphone and a special server application. 😉

One of the first speech engines I tried was MBROLA[[3]][4]. It produces more understandable audio than eSpeak. But it’s still far from being “good”, as it relies on eSpeak. Think of it as an eSpeak pre-processor. Unfortunately, it is not currently available from Fedora Linux’s default repositories.

Next was Pico2Wave, which still uses the same technique as eSpeak, but on a higher level. Still, this does not meet our vision of speech quality. Also, it has to be extracted from an old Ubuntu package because it isn’t available from the Fedora Linux repositories.

With MaryTTS[[4]][4] we reach the first speech processor that produces human speech patterns combined with accent and dialect. MaryTTS was developed in Germany at the Saarland University &amp; the German Research Center for AI. It’s not meant to run on your local PC (but does quite well). Rather, it is meant to run on a network to offer speech output to any kind of client that asks for it. Because modern PCs have way more CPU power than it requires, you can also run it solo on your PC. However, running it locally requires compiling the source code which can be a little tricky to do.

MaryTTS comes with different languages and one remarkable voice for Germans — an old Bavarian woman. This voice model was trained from an old speech archive in Munich and it’s so good that you’d think your PC is at least seventy years old. 🙂 This also makes it seem like you are giving commands to an old women who should be in retirement. This makes giving commands to your PC problematic; trust me. 😉

The top of the line of available TTS systems is GTTS[[5]][4]. It is available from the default Fedora Linux repositories. This TTS produces the best sound quality for a wide variety of languages and, for standard voices, “the first 4 million characters are free each month”[[7]][4]. The downside of this TTS is that the text is sent to Google’s servers[[8]][7] for processing and translation into an audible speech format. This might be a privacy concern depending on the nature of the data that you are sending for translation. Be mindful that the PVA will repeat parts of what you said if it did not understand your command or when it tells you things in response to your question. For this reason, GTTS is not the default TTS. However, it is pre-configured in the PVA repo[[1]][4] and ready to use.

### Let’s talk about privacy

You just read that your TTS system could rat you out to Google. This leads to other questions. Namely, “Does the STT system do this too?” It doesn’t. Vosk runs entirely on your PC. There are no cloud services involved. But of course, your assistant needs to know things in order to assist you.

One of the simpler functions is to produce a weather report. For this to work, the assistant needs to relay your question to the weather provider’s API server. The provider can reasonably assume that you normally aren’t interested in the weather for places you do not live. So the server can derive where that you live based on what city you most frequently inquire about and it can collaborate its deduction based on your device’s IP address.

Consequently, if you configure a service in your PVA’s config, you should ask yourself if this service will cause a privacy problem for you. Many PVA functions won’t because they work locally or they use services under your control (the CalDAV and CardDAV address book services, for example). The same is true for the upcoming [IMAP][8] feature. You will use the same email provider that your email app is already configured to use. So there are no _extra_ concerns for the IMAP feature. But what happens if you decided to use GTTS because these simple text fragments are “no big deal” and the PVA reads out loud the incoming email? Here the decision for a TTS engine gets more and more important.

One of PVA’s functions is playing music on command. By itself, this function may not seem concerning. However, an upcoming feature might change this. It will be able to tell what you want to listen to by the use of abstract requests like “Jazz”. At the moment, the PVA searches for this term in filenames and metadata it found in your MP3 archive. In the future, it will have a local track list of all the audiophile wishes you had in the past and it will produce a TOP song list for the search term.

It will write every file you added to the playlist to a database and it will count how many times a match to your abstract request is found and play the song(s) with the best score. On the plus side, you get your favorite music. But what happens if an external plugin or hacked app takes this list and exfiltrates the data to someone who pays for this kind of information?

Now this feature becomes a privacy concern. There is no great risk at the moment since this feature needs to be enabled and, for now, PVA is not widespread enough to be a target. But this may change and you should be aware of these kinds of privacy concerns before they become a problem.

As a best effort to address such privacy concerns, PVA will disable features that require external communication by default. So if you use the base installation, there should be very few privacy concerns. There is one known exception — all texts sent to the PVA app are recorded in ~/.var/log/pva.log. This should make it easier to find flaws in the STT engine and track down other problems.

Always keep in mind that privacy can also be undermined by third-party add-ons.

### What can you expect from your assistant?

PVA auto-configures itself on first start-up with a basic configuration. For example, it adds the default paths from the freedesktop.org specs to all your pictures, music, documents and videos. It creates a local cache and config directory where you can place your version of the config files, add new ones, or overwrite existing ones. Usually user customizations are added to the config. But you can overwrite existing values. Before we dig deeper, let’s present some more of PVA’s features.

The Weather Report app is a classic. No assistant would be complete without it. 🙂 All it needs to know is the name of your hometown. The weather provider used is _[wttr.in][9]_. You can point your browser at this URL to find for your city’s unique identifier. You have no idea how many “Neustadt” exists in Germany alone. 😉 Because it is a webservice, you don’t need to install anything. It works out-of-the-box using [cURL][10].

Asking your PVA what time it is, is also a classic and it works out of the box. You can also ask your PC how it feels: “Carola, what is the actual load?” Or, more abstractly, “Carola, how do you feel?” 😉

For playing audio, PVA uses QMMP by default. It comes with an easy to use command line interface and a rich feature set. You will need to install this app before you can use it. Luckily, Fedora Linux ships this. QMMP gives you remote control over loudness, track number, track-position, playback, and it gives us information about what is currently playing. So you can ask your PVA what is playing when it is playing random tracks.

Controlling QMMP by voice is one of the features I cannot do without again. I often end up in situations where I have full-screen windows with complex code on the screen. If you loose your focus, you loose your workflow. Developers call this “being in the flow” or “in the tunnel”. Here, voice control comes in very handy. You do not need to divert your focus from your work. You can just say what you want and it “magically” it happens! 😉

The phone-call feature works in a similar way. You can now ask your SIP software to make a call to a contact in your CardDAV address book without diverting your focusing from your work. As this is a complex process, it needs a little extra care. There is a special internal function for handling the parsing of the command sentence. “Carola, call Andreas” is enough to initiate a call. The first match in the address book will be called. If you know more than one person with the same name, I hope they have nicknames. 😉 Also, since one contact might have multiple phone numbers (e.g. for home and for work), you can specify which number should be called: “Carola, call Andreas at work.”

_Even if it doesn’t look like a complex problem, consider which of the words the PVA receives are part of the name and which are just binding words like “at” in the above example? It is not that easy to determine. So we need to follow a precise syntax. But it needs to be natural or humans will not use it. Another thing that is important when interacting with humans is that they tend to alternate their command structures. Parsing a human sentence is more complex for a computer than you might think. It’s natural for you, but the opposite of logic for a computer. Keep this in mind as you read further. It is a reoccurring challenge._

Another example of when voice control can come in handy is controlling video playback is while you exercise. You are likely not in reach of a mouse or a remote (KDE Connect) nor do you want to stop your work out just because someone asks you something. With voice control, you can ask the PC to pause playback and then ask it to resume after you have answered the question or otherwise addressed the problem.

For audio and video players that offer a MPRIS2 interface on DBUS, you can control them on the spot without adding the CLI (command line interface) commands to your config. Based on MPRIS2 you can even control Netflix or YouTube in your Firefox browser. OK, you can’t currently choose the track to watch. But you can change the volume and (un)pause the playback. And all of this can be done with the same set of commands in your config.

There are many situations where voice control is superior or even necessary. What I haven’t told you yet is that the first device I deployed PVA to was a PinePhone. Smartphones can be used for many things. You might use it as an MP3 player while you drive or as a navigational tool. It doesn’t work with Gnome Maps (yet). But controlling a PinePhone via voice while driving will be more and more important in the Linux community. So hopefully further advancements will be made in this area. Fun fact/tip, if you use it as an MP3 player, don’t make it too loud. Or better yet, use an external speaker system[[6]][4].

If you use Thunderbird to manage your email, it is capable of composing and sending an email using only CLI arguments. Consequently, your PVA can compose and send email using Thunderbird. All you need to do is to tell your PVA the recipient, the subject, and then dictate the content of the body. It will also do some minor interpretation for you. While I still write my emails by hand, I can imagine situations where it could be useful. I did not have an opportunity to work with a disabled person to test this method of email composition. But it might be interesting.

The PVA can also be handy for short reminders. You can tell your PVA when and what it should remind you about. For example, “Carola, remind me in 10 minutes to check the kitchen” or, “Carola, remind me at 10 to call Andreas”. The PVA will respond if it understood and acknowledge your reminder.

The best comes last. With Twinkle, your PVA can take a call and interact with the caller just as it does with you. One thing I have not explained yet is that your PVA requires authorization codes for vital or potentially dangerous operations. I find it reminiscent of a scene from “Star Trek”. 😉

_“Carola, reboot PC.”
“Authorization code alpha is needed to perform this operation.”
“Carola, authorization code alpha three four seven.”_

And if the code is correct, the requested action will proceed. Requiring these authorization codes helps to alleviate the fear that someone might hack your PC through the PVA and cause trouble. Though about the worst that could happen at the moment is that you could unwillingly send spam to someone or your PC might be left playing music all day long. 😉 However, if you have home automation running and configured, it is probably better not to have Twinkle answer the phone.

### Let’s take a look behind the curtain

This list is long and detailed. So I will focus on some basics.

PVA comes with a rudimentary form of hard-coded human responses. You can modify and expand them as you like. But there is no intelligence in them. You can, however, build reaction chains that are so long that a normal human cannot detect the repeating phrases.

Here are two examples. Let’s ask the PVA for its name.

_reaction:”what is your name”,””,”my name is %KEYWORD”_

Here is a more complex example that uses the word “not”.

_reaction:”this works”,”not”,”of course it does”
reaction:”this works not”,””,”uh oh, please contact my developer”_

As the absence of the word “not” is crucial to the meaning of a sentence, reactions contain “positive” and “negative” terms to work. The rule is as follows.

Positive words MUST be inside the sentence, negative words MUST NOT be inside the sentence. In developer terms it can be written as “if ( p &amp;&amp; !n ) do …”.

If your reaction texts give a human a new clue what to say next and you can anticipate this, then it is possible to build complex reaction chains that will simulate a conversation. I have even heard from people using this feature that they _like_ talking to their PC (and these are not your stereotypical nerds 😉). As you can use the same trigger for multiple reactions, alternative chains are possible.

### Starting applications

Part of the basic functionality is to start the apps that you’ve named. In the beginning, there was a fixed list of apps that was hard-coded. But now, you can extend this via the config. Let’s take a quick look at it.

_app:”office”,”openoffice4″
app:”txt”,”gedit”
app:”pdf”,”evince”
app:”gfx”,”gnome-open”
app:”mail”,”thunderbird”_

The corresponding voice commands would be “Carola, start mail”, “Carola, open mail” or, in free-form, you could say, “Carola, start Krita” (Krita is an OpenSource paint app that is available on Fedora Linux). You can configure several alternative versions of the command sentences. These can be [regular expressions][11] (regex) or multiple entries in the config file. These apps are also used in complex commands like searching for files and opening the resultant set with an app. For example, “Carola, search pictures of Iceland and open them with Krita.” The previous command would cause the PVA to search in your configured picture paths for filenames matching “iceland” and then open them with Krita. This works for all apps as long as their launchers accept filenames as arguments on their CLI. Even if this isn’t the case for your favorite app, you might still be able to write a small “wrapper” script in Bash and then use that script as the app target for the PVA.

Via voice command, you can switch apps out for a configured alternative on the fly.

_alternatives:”firefox”,”web”,”firefox”
alternatives:”google chrome”,”web”,”google-chrome”
alternatives:”chromium free”,”web”,” chromium-freeworld”
alternatives:”chromium privacy”,”web”,” chromium-privacy-browser”
alternatives:”openoffice”,”office”,”openoffice4″
alternatives:”libreoffice”,”office”,”libreoffice”_

By using the “use {alternative}” syntax you select what you want to use next. For example, “Carola use Firefox” or “Carola use Chromium free”. It’s working for any app in the app list. But how are these commands defined?

_command:”start”,”STARTAPP”,”app”,””
command:”open”,”OPENAPP”,”app”,””_

Quite simple: “Carola, start Firefox app” will start Firefox. “Carola, start Firefox” would also work because the term “app” is filtered out.

Next is the positive and negative list of words again. Here is the reaction syntax.

_command:”how is the weather”,”CURRENTWEATHERNOW”,””,”tomorrow”
command:”how will the weather be”,”CURRENTWEATHERNEXT”,””,”tomorrow”
command:”how will the weather be tomorro_w”,”CURRENTWEATHERTOMORROW”,””,””

The commands in the second column are some of PVA’s internal function names. They are coded internally because processing the result can be tricky. You can, however, outsource those commands to an external Bash script. Below is an example that shows how to call a custom Bash script.

_replacements:”h d m i”,”hdmi”
replacements:”u s b”,”usb”_

_command:”switch .* to kopfhörer”,”EXEC:pulse.outx:x%0x:xhdmi”
command:”switch .* to lautsprecher”,”EXEC:pulse.outx:x%0x:xdefault”
command:”switch .* to .* now”,”EXEC:pulse.outx:x%0x:x%1″_

The last of the above commands will switch the output device of a named (first “.*”) running app in pulseaudio to the named (second “.*”) device. As you can see, it works using regular-expression-like syntax. The syntax is not, however, fully-featured. All three of the above commands call the script _pulse.out_ with two parameters. That is, “pulse.out <procname> <devicename>”. Now there is no need to start PAVUControl anymore. Instead, you can just grab your headset and tell your PC to use it. 🙂

There is no limit to the number of .* wildcards in the command or execution part. Feel free to code a response for something like, “Carola, switch on the light in the kitchen.”

comm_and:”switch .* the light in .*”,”EXEC:smarthomex:x%0x:x%1″_

If you are wondering about those “x:x” character sequences in the execution part, those are being used to escape whitespaces because they tend to appear in filenames.

### Oops, it sent your mail to Hermine instead of Hermann

All these voice commands only work correctly when the STT system works flawlessly. Of course, it often does not. Do not have false hopes. It’s not perfect. However, PVA can auto-correct some common errors by configuring _replacements_.

PVA can correct simple mistakes.

_replacements:”hi länder”,”highlander”
replacements:”cash”,”cache”
replacements:”karola”,”carola”_

Or, it can perform _context_ replacements. These are only done if a command has been recognized.

co_ntextreplacements:”STARTAPP”,”kreta”,”krita”
contextreplacements:”STARTAPP”,”konfig”,”config”
contextreplacements:”ADDTITLE”,”föge”,”füge”_

Shown above is the entry “Krita” which sounds like the German word “Kreta” which is a Greek island. STT Vosk likes “Kreta”. So we need to replace this. But not every time. If we perform a web search for “Kreta”, it would be counter productive to replace it with “Krita”. You can add simple replacements to the config. I suggest that you use the _user_ config for these because other users my encounter different problems.

If you don’t know why a command is not being recognized correctly, you can the always check the log at ~/.var/log/pva.log.

### Contribution

If you want to contribute to this project, feel free to do so. It is available on Github[[1]][4]. Since Vosk now has support for eighteen languages, translating the texts to different languages would be a great place that a contributor could get started.

To get PVA installed on Fedora Linux, it is required to rebuild Vosk and its libraries with Fedora sources. We tried to do so earlier this year, but we failed when we ran into some exotic mathlib dependencies that we couldn’t get to compile on Fedora Linux. We are hoping that a good, skilled C developer could solve this problem and get those resulting packages reviewed by Fedora packagers. 🙂

I hope I have awoken some interest from our dear readers. The world of PVA needs your awesome configs! 🙂

Best regards,
Marius Schwarz

### References

[1] <https://github.com/Cyborgscode/Personal-Voice-Assistent>

[2] <https://alphacephei.com/vosk>

[3] <https://github.com/numediart>

  * [/MBROLA][12]
  * [/MBROLA-voices][13]



[4] <https://marytts.github.io>

[5] Available from the Fedora Linux repositories:

  * _dnf install gtts_



[6] <http://static.bloggt-in-braunschweig.de/Pinephone-PVA-TEST1.mp4>

[7] <https://cloud.google.com/text-to-speech>

[8] <https://cloud.google.com/text-to-speech/docs/reference/rest>

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/your-personal-voice-assistant-on-fedora-linux/

作者：[Marius Schwarz][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mschwarz/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/06/hal9000-816x345.jpg
[2]: https://en.wikipedia.org/wiki/File:HAL_9000.JPG
[3]: https://en.wikipedia.org/wiki/Massively_multiplayer_online_role-playing_game
[4]: tmp.WvYZ1CkAYG#references
[5]: https://en.wikipedia.org/wiki/CardDAV
[6]: https://github.com/Cyborgscode/Personal-Voice-Assistent/blob/main/README.txt
[7]: tmp.WvYZ1CkAYG#reference
[8]: https://en.wikipedia.org/wiki/Internet_Message_Access_Protocol
[9]: https://wttr.in/
[10]: https://en.wikipedia.org/wiki/CURL
[11]: https://en.wikipedia.org/wiki/Regular_expression
[12]: https://github.com/numediart/MBROLA
[13]: https://github.com/numediart/MBROLA-voices
