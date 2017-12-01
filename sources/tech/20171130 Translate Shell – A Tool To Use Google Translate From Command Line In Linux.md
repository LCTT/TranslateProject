translate by darksun
Translate Shell – A Tool To Use Google Translate From Command Line In Linux
============================================================

I love to work and share about CLI apps since i’m very much interested on CLI applications. Basically i prefer CLI because most of the time i will be sitting in front of the black screen and it’s became habit for me to go with CLI apps instead of GUI.

We have wrote many articles about CLI applications in past. Recently i came to know about google CLI utilities such as “Google Translator”, “Google Calendar”, and “Google Contacts”. so, i just want to share about it.

Today we are going to discuss about “Google Translator”. I use many times in a day to know the meanings since my native language is Tamil.

Google translate is widely used by other language speakers.

#### What is Translate Shell

[Translate Shell][2] (formerly known as Google Translate CLI) is a command-line translator powered by Google Translate (default), Bing Translator, Yandex.Translate and Apertium. It allows you to access to one of these translation engines right from your terminal. Translate Shell is designed work on most of the Linux distributions.

#### How to Install Translate Shell

We can install the Translate Shell application in three methods.

*   Download self-contained executable file

*   Manual Method

*   Via Package Manager

#### Method-1 : Download self-contained executable file

Just Download the self-contained executable file and move into /usr/bin directory.

```
$ wget git.io/trans
$ chmod +x ./trans
$ sudo mv trans /usr/bin/
```

#### Method-2 : Manual Method

Just clone the Translate Shell github repository and compile manually for any distributions.

```
$ git clone https://github.com/soimort/translate-shell && cd translate-shell
$ make
$ sudo make install
```

#### Method-3 : Via Package Manager

Translate Shell is available in few of the distribution official repository that can be installed through package manager.

For Debian/Ubuntu, use [APT-GET Command][3] or [APT Command][4]to install Translate Shell.

```
$ sudo apt-get install translate-shell
```

For Fedora, use [DNF Command][5] to install Translate Shell.

```
$ sudo dnf install translate-shell
```

For Arch Linux based systems, use [Yaourt Command][6] or [Packer Command][7] to install Translate Shell from AUR repository.

```
$ yaourt -S translate-shell
or
$ packer -S translate-shell
```

#### How To Use Translate Shell

After successfully installed, open your terminal and fire the following command. Google Translate can identify the language of the source text automatically, and Translate Shell by default translates the source text into the language of your locale.

```
$ trans [Words]
```

I’m going to translated a Tamil word “நன்றி” (Nanri) to English. It’s use to thank people.

```
$ trans நன்றி
நன்றி
(Naṉṟi)

Thanks

Definitions of நன்றி
[ தமிழ் -> English ]

noun
    gratitude
        நன்றி
    thanks
        நன்றி

நன்றி
    Thanks
```

Alternatively translate a word into Tamil using following command.

```
$ trans :ta thanks
thanks
/THaNGks/

நன்றி
(Naṉṟi)

Definitions of thanks
[ English -> தமிழ் ]

noun
    நன்றி
        gratitude, thanks

thanks
    நன்றி
```

To Translate a word into more than one language use following command (In this example, i’m going to translate a word into Tamil & Hindi).

```
$ trans :ta+hi thanks
thanks
/THaNGks/

நன்றி
(Naṉṟi)

Definitions of thanks
[ English -> தமிழ் ]

noun
    நன்றி
        gratitude, thanks

thanks
    நன்றி

thanks
/THaNGks/

धन्यवाद
(dhanyavaad)

Definitions of thanks
[ English -> हिन्दी ]

noun
    धन्यवाद
        thanks, thank, gratitude, thankfulness, felicitation

thanks
    धन्यवाद, शुक्रिया
```

To Translate words into one argument (phrase) use following command (just quote the sentence into one argument).

```
$ trans :ta "what is going on your life?"
what is going on your life?

உங்கள் வாழ்க்கையில் என்ன நடக்கிறது?
(Uṅkaḷ vāḻkkaiyil eṉṉa naṭakkiṟatu?)

Translations of what is going on your life?
[ English -> தமிழ் ]

what is going on your life?
    உங்கள் வாழ்க்கையில் என்ன நடக்கிறது?
```

To Translate Translate each word alone.

```
$ trans :ta curios happy
curios

ஆர்வம்
(Ārvam)

Translations of curios
[ Română -> தமிழ் ]

curios
    ஆர்வம், அறிவாளிகள், ஆர்வமுள்ள, அறிய, ஆர்வமாக
happy
/ˈhapē/

சந்தோஷமாக
(Cantōṣamāka)

Definitions of happy
[ English -> தமிழ் ]

    மகிழ்ச்சியான
        happy, convivial, debonair, gay
    திருப்தி உடைய
        happy

adjective
    இன்பமான
        happy

happy
    சந்தோஷமாக, மகிழ்ச்சி, இனிய, சந்தோஷமா
```

Brief Mode : By default, Translate Shell displays translations in a verbose manner. If you prefer to see only the brief information, just add -b option.

```
$ trans -b :ta thanks
நன்றி
```

Dictionary Mode : To use Translate Shell as a dictionary, just add -d option.

```
$ trans -d :en thanks
thanks
/THaNGks/

Synonyms
    noun
        - gratitude, appreciation, acknowledgment, recognition, credit

    exclamation
        - thank you, many thanks, thanks very much, thanks a lot, thank you kindly, much obliged, much appreciated, bless you, thanks a million

Examples
    - In short, thanks for everything that makes this city great this Thanksgiving.

    - many thanks

    - There were no thanks in the letter from him, just complaints and accusations.

    - It is a joyful celebration in which Bolivians give thanks for their freedom as a nation.

    - festivals were held to give thanks for the harvest

    - The collection, as usual, received a great response and thanks is extended to all who subscribed.

    - It would be easy to dwell on the animals that Tasmania has lost, but I prefer to give thanks for what remains.

    - thanks for being so helpful

    - It came back on about half an hour earlier than predicted, so I suppose I can give thanks for that.

    - Many thanks for the reply but as much as I tried to follow your advice, it's been a bad week.

    - To them and to those who have supported the office I extend my grateful thanks .

    - We can give thanks and words of appreciation to others for their kind deeds done to us.

    - Adam, thanks for taking time out of your very busy schedule to be with us tonight.

    - a letter of thanks

    - Thank you very much for wanting to go on reading, and thanks for your understanding.

    - Gerry has received a letter of thanks from the charity for his part in helping to raise this much needed cash.

    - So thanks for your reply to that guy who seemed to have a chip on his shoulder about it.

    - Suzanne, thanks for being so supportive with your comments on my blog.

    - She has never once acknowledged my thanks , or existence for that matter.

    - My grateful thanks go to the funders who made it possible for me to travel.

    - festivals were held to give thanks for the harvest

    - All you secretaries who made it this far into the article… thanks for your patience.

    - So, even though I don't think the photos are that good, thanks for the compliments!

    - And thanks for warning us that your secret service requires a motorcade of more than 35 cars.

    - Many thanks for your advice, which as you can see, I have passed on to our readers.

    - Tom Ryan was given a bottle of wine as a thanks for his active involvement in the twinning project.

    - Mr Hill insists he has received no recent complaints and has even been sent a letter of thanks from the forum.

    - Hundreds turned out to pay tribute to a beloved former headteacher at a memorial service to give thanks for her life.

    - Again, thanks for a well written and much deserved tribute to our good friend George.

    - I appreciate your doing so, and thanks also for the compliments about the photos!

See also
    Thanks!, thank, many thanks, thanks to, thanks to you, special thanks, give thanks, thousand thanks, Many thanks!, render thanks, heartfelt thanks, thanks to this
```

To Translate a File using Translate Shell, use the following format.

```
$ trans :ta file:///home/magi/gtrans.txt
உங்கள் வாழ்க்கையில் என்ன நடக்கிறது?
```

To open interactive Translate Shell, run the following command. Make sure you have to specify the source language and the target language(s) before starting an interactive shell. In this example, i’m going to translate a word from English to Tamil.

```
$ trans -shell en:ta thanks
Translate Shell
(:q to quit)
thanks
/THaNGks/

நன்றி
(Naṉṟi)

Definitions of thanks
[ English -> தமிழ் ]

noun
    நன்றி
        gratitude, thanks

thanks
    நன்றி
```

To know the language code, just fire the following command.

```
$ trans -R
or
$ trans -T
┌───────────────────────┬───────────────────────┬───────────────────────┐
│ Afrikaans      -   af │ Hindi          -   hi │ Punjabi        -   pa │
│ Albanian       -   sq │ Hmong          -  hmn │ Querétaro Otomi-  otq │
│ Amharic        -   am │ Hmong Daw      -  mww │ Romanian       -   ro │
│ Arabic         -   ar │ Hungarian      -   hu │ Russian        -   ru │
│ Armenian       -   hy │ Icelandic      -   is │ Samoan         -   sm │
│ Azerbaijani    -   az │ Igbo           -   ig │ Scots Gaelic   -   gd │
│ Basque         -   eu │ Indonesian     -   id │ Serbian (Cyr...-sr-Cyrl
│ Belarusian     -   be │ Irish          -   ga │ Serbian (Latin)-sr-Latn
│ Bengali        -   bn │ Italian        -   it │ Sesotho        -   st │
│ Bosnian        -   bs │ Japanese       -   ja │ Shona          -   sn │
│ Bulgarian      -   bg │ Javanese       -   jv │ Sindhi         -   sd │
│ Cantonese      -  yue │ Kannada        -   kn │ Sinhala        -   si │
│ Catalan        -   ca │ Kazakh         -   kk │ Slovak         -   sk │
│ Cebuano        -  ceb │ Khmer          -   km │ Slovenian      -   sl │
│ Chichewa       -   ny │ Klingon        -  tlh │ Somali         -   so │
│ Chinese Simp...- zh-CN│ Klingon (pIqaD)tlh-Qaak Spanish        -   es │
│ Chinese Trad...- zh-TW│ Korean         -   ko │ Sundanese      -   su │
│ Corsican       -   co │ Kurdish        -   ku │ Swahili        -   sw │
│ Croatian       -   hr │ Kyrgyz         -   ky │ Swedish        -   sv │
│ Czech          -   cs │ Lao            -   lo │ Tahitian       -   ty │
│ Danish         -   da │ Latin          -   la │ Tajik          -   tg │
│ Dutch          -   nl │ Latvian        -   lv │ Tamil          -   ta │
│ English        -   en │ Lithuanian     -   lt │ Tatar          -   tt │
│ Esperanto      -   eo │ Luxembourgish  -   lb │ Telugu         -   te │
│ Estonian       -   et │ Macedonian     -   mk │ Thai           -   th │
│ Fijian         -   fj │ Malagasy       -   mg │ Tongan         -   to │
│ Filipino       -   tl │ Malay          -   ms │ Turkish        -   tr │
│ Finnish        -   fi │ Malayalam      -   ml │ Udmurt         -  udm │
│ French         -   fr │ Maltese        -   mt │ Ukrainian      -   uk │
│ Frisian        -   fy │ Maori          -   mi │ Urdu           -   ur │
│ Galician       -   gl │ Marathi        -   mr │ Uzbek          -   uz │
│ Georgian       -   ka │ Mongolian      -   mn │ Vietnamese     -   vi │
│ German         -   de │ Myanmar        -   my │ Welsh          -   cy │
│ Greek          -   el │ Nepali         -   ne │ Xhosa          -   xh │
│ Gujarati       -   gu │ Norwegian      -   no │ Yiddish        -   yi │
│ Haitian Creole -   ht │ Pashto         -   ps │ Yoruba         -   yo │
│ Hausa          -   ha │ Persian        -   fa │ Yucatec Maya   -  yua │
│ Hawaiian       -  haw │ Polish         -   pl │ Zulu           -   zu │
│ Hebrew         -   he │ Portuguese     -   pt │                       │
└───────────────────────┴───────────────────────┴───────────────────────┘
```

To know more options, navigate to man page.

```
$ man trans
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/translate-shell-a-tool-to-use-google-translate-from-command-line-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[2]:https://github.com/soimort/translate-shell
[3]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[6]:https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/
[7]:https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/
