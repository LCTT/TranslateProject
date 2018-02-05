Translate Shell ：一款在 Linux 命令行中使用谷歌翻译的工具
============================================================

我对 CLI 应用非常感兴趣，因此热衷于使用并分享 CLI 应用。 我之所以更喜欢 CLI 很大原因是因为我在大多数的时候都使用的是字符界面（black screen），已经习惯了使用 CLI 应用而不是 GUI 应用。

我写过很多关于 CLI 应用的文章。 最近我发现了一些谷歌的 CLI 工具，像 “Google Translator”、“Google Calendar” 和 “Google Contacts”。 这里，我想在给大家分享一下。

今天我们要介绍的是 “Google Translator” 工具。 由于我的母语是泰米尔语，我在一天内用了很多次才理解了它的意义。

谷歌翻译为其它语系的人们所广泛使用。

### 什么是 Translate Shell

[Translate Shell][2] (之前叫做 Google Translate CLI) 是一款借助谷歌翻译（默认）、必应翻译、Yandex.Translate 以及 Apertium 来翻译的命令行翻译器。它让你可以在终端访问这些翻译引擎。 Translate Shell 在大多数 Linux 发行版中都能使用。

### 如何安装 Translate Shell

有三种方法安装 Translate Shell。

*   下载自包含的可执行文件
*   手工安装
*   通过包管理器安装

#### 方法 1 : 下载自包含的可执行文件

下载自包含的可执行文件放到 `/usr/bin` 目录中。

```
$ wget git.io/trans
$ chmod +x ./trans
$ sudo mv trans /usr/bin/
```

#### 方法 2 : 手工安装

克隆 Translate Shell 的 GitHub 仓库然后手工编译。

```
$ git clone https://github.com/soimort/translate-shell && cd translate-shell
$ make
$ sudo make install
```

#### 方法 3 : 通过包管理器

有些发行版的官方仓库中包含了 Translate Shell，可以通过包管理器来安装。

对于 Debian/Ubuntu， 使用 [APT-GET 命令][3] 或者 [APT 命令][4]来安装。

```
$ sudo apt-get install translate-shell
```

对于 Fedora, 使用 [DNF 命令][5] 来安装。

```
$ sudo dnf install translate-shell
```

对于基于 Arch Linux 的系统, 使用 [Yaourt 命令][6] 或 [Packer 明快][7] 来从 AUR 仓库中安装。

```
$ yaourt -S translate-shell
or
$ packer -S translate-shell
```

### 如何使用 Translate Shell

安装好后，打开终端闭关输入下面命令。 谷歌翻译会自动探测源文本是哪种语言，并且在默认情况下将之翻译成你的 `locale` 所对应的语言。

```
$ trans [Words]
```

下面我将泰米尔语中的单词 “நன்றி” (Nanri) 翻译成英语。 这个单词的意思是感谢别人。

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

使用下面命令也能将英语翻译成泰米尔语。

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

要将一个单词翻译到多个语种可以使用下面命令(本例中，我将单词翻译成泰米尔语以及印地语)。

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

使用下面命令可以将多个单词当成一个参数（句子）来进行翻译。(只需要把句子应用起来作为一个参数就行了)。

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

下面命令单独地翻译各个单词。

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

简洁模式：默认情况下，Translate Shell 尽可能多的显示翻译信息。如果你希望只显示简要信息，只需要加上 `-b`选项。

```
$ trans -b :ta thanks
நன்றி
```

字典模式：加上 `-d` 可以把 Translate Shell 当成字典来用。

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

使用下面格式可以使用 Translate Shell 来翻译文件。

```
$ trans :ta file:///home/magi/gtrans.txt
உங்கள் வாழ்க்கையில் என்ன நடக்கிறது?
```

下面命令可以让 Translate Shell 进入交互模式。 在进入交互模式之前你需要明确指定源语言和目标语言。本例中，我将英文单词翻译成泰米尔语。

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

想知道语言代码，可以执行下面命令。

```
$ trans -R
```
或者

```
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

想了解更多选项的内容，可以查看其 man 手册。

```
$ man trans
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/translate-shell-a-tool-to-use-google-translate-from-command-line-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[lujun9972](https://github.com/lujun9972 )
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[2]:https://github.com/soimort/translate-shell
[3]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[6]:https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/
[7]:https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/
