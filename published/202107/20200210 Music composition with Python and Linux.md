[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13547-1.html)
[#]: subject: (Music composition with Python and Linux)
[#]: via: (https://opensource.com/article/20/2/linux-open-source-music)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

“MAGFest 先生”专访：用 Python 和 Linux 进行音乐创作
======

> 与 “MAGFest 先生” Brendan Becker 的对话。

![](https://img.linux.net.cn/data/attachment/album/202107/04/174833k7uvo4l5vov7umv4.jpg)

1999 年，我在一家计算机商店工作时遇到了 Brendan Becker。我们都喜欢构建定制计算机并在其上安装 Linux。Brendan 一直在同时参与着从游戏编程到音乐创作的多个技术项目。从那之后快进几年，他继续编写 [pyDance][2]，这是一个多舞种游戏的开源实现，然后成为了音乐和游戏项目 [MAGFest][3] 的 CEO。他有时被称为 “MAGFest 先生”，因为他是该项目的负责人，Brendan 现在使用的音乐笔名是 “[Inverse Phase][4]”，是一位<ruby>电子合音<rt>chiptune</rt></ruby>（主要在 8 位计算机和游戏机上创作的音乐）作曲家。

我认为采访并询问他在整个职业生涯中如何从 Linux 和开源软件中受益的一些细节会很有趣。

![Inverse Phase 表演照片][5]

### 你是如何开始接触计算机和软件的？

Brendan Becker：从我记事起，我家就有一台电脑。我父亲热衷于技术；在康柏便携式电脑刚刚上市时，他就带了一台回家，当他不在上面工作时，我就可以使用它。由于我两岁时就开始阅读，使用电脑就成了我的第二天性——只要阅读磁盘上的内容，按照说明进行操作，我就可以玩游戏了！有时我会玩一些学习和教育软件，我们有几张装满游戏的磁盘，我可以在其他时间玩。我记得有一张磁盘，里面有一些流行游戏的免费副本。后来，我父亲向我展示了我们可以呼叫其他计算机（我 5 岁时就上了 BBS！），我看到了一些游戏来自那儿。我喜欢玩的一款游戏是用 BASIC 编写的，当我意识到我可以简单地修改游戏，只需阅读一些内容并重新输入它们游戏就会更轻松，玩游戏就没意思了。

### 这是上世纪 80 年代？

Becker：康柏便携式电脑于 1983 年推出，这可以给你一些参考。我爸爸有一个那个型号的初代产品。

### 你是如何进入 Linux 和开源软件的？

Becker：在上世纪 90 年代初，我酷爱 MOD 和<ruby>演示场景<rt>demoscene</rt></ruby>之类的东西，我注意到 Walnut Creek（即 [cdrom.com][6]；现已解散）在 FreeBSD 上开设了商店。总的来说，我对 Unix 和其他操作系统非常好奇，但没有太多的第一手资料，我认为是时候尝试一些东西了。当时 DOOM 刚刚发布，有人告诉我，我可以试着在计算机上运行它。在这与能够运行很酷的互联网服务器之间，我开始陷入两难取舍。有人看到我在阅读有关 FreeBSD 的文章，并建议我了解一下 Linux，这是一个为 x86 重新编写的新操作系统，与 BSD 不同，（他们说）后者存在一些兼容性问题。因此，我加入了 undernet IRC 上的 #linuxhelp 频道，询问如何开始使用 Linux，并表明我已经做了一些研究（我已经能问出 “Red Hat 和 Slackware 之间有什么区别？”这样的问题），想知道什么是最容易使用的。频道里唯一说话的人说他已经 13 岁了，他都能弄明白 Slackware，所以我应该不会有问题。学校的一个数学老师给了我一个硬盘，我下载了 “A” 盘组和一个启动盘，写入到软盘，安装了它，回头看也并没有花太多时间。

### 你是如何被称为 “MAGFest 先生”的？

Becker：嗯，这个很简单。在第一个活动后，我几乎立即成为了 MAGFest 的代理负责人。前任主席都各奔东西，我向负责人要求不要取消活动。解决方案就是自己运营它，当我慢慢地将项目塑造成我自己的时，这个昵称就成了我的。

### 我记得我在早期参加过，MAGFest 最终变得有多大？

Becker：第一届 MAGFest 是 265 人。现在它超大，有两万多名不同的参与者。

### 太棒了！你能简要描述一下 MAGFest 大会吗？

Becker：我的一个朋友 Hex 描述得非常好。他说：“就像是和你所有的朋友一起举办这个以电子游戏为主题的生日派对，那里恰好有几千人，如果你愿意，他们都可以成为你的朋友，然后还有摇滚音乐会。” 这很快被采用并缩短为 “这是一个为期四天的电子游戏派对，有多场电子游戏摇滚音乐会”。通常 “音乐和游戏节” 这句话就能让人们明白这个意思。

### 你是如何利用开源软件来运行 MAGFest 的？

Becker：当我成为 MAGFest 的负责人时，我已经用 Python 编写了一个游戏，所以我觉得用 Python 编写我们的注册系统最舒服。这是一个非常轻松的决定，因为不涉及任何费用，而且我已经有了经验。后来，我们的在线注册系统和拼车界面都是用 PHP/MySQL 编写的，我们的论坛使用了 Kboard。最终，这发展到我们用 Python 从头开始编写了自己的注册系统，我们也在活动中使用它，并在主网站上运行 Drupal。有一次，我还用 Python 编写了一个系统来管理视频室和邀请比赛站。哦，我们有一些游戏音乐收听站，你可以翻阅标志性的游戏 OST（原始音轨）的曲目和简介，和演奏 MAGFest 的乐队。

### 我知道几年前你减少了你在 MAGFest 的职责，去追求新的项目。你接下来的努力是什么？

Becker：我一直非常投入游戏音乐领域，并试图将尽可能多的音乐带到 MAGFest 中。随着我越来越多地成为这些社区的一部分，我想参与其中。我使用以前用过的自由开源版本的 DOS 和 Windows 演示场景工具编写了一些视频游戏曲调的混合曲、封面和编曲，我以前使用过的这种工具也是免费的，但不一定是开源的。我在运行 MAGFest 的最初几年发布了一些曲目，然后在 Jake Kaufman（也被称为 `virt`；在他的简历之外也叫 Shovel Knight 和 Shantae）的一些严厉的关爱和建议之后，我改变主题到我更擅长的电子和音。尽管我小时候就用我的康柏便携式电脑编写了 PC 扬声器发出的哔哔啵啵声，并在 90 年代的演示场景中写过 MOD 文件，但我在 2006 年发布了第一首 NES 规格的曲目，我真的能很自豪地称之为我自己的作品。随后还有几张流行音乐的作品和专辑。

2010 年，有很多人找我做游戏配乐工作。尽管配乐工作对它没有太大影响，但我开始更认真地缩减我在 MAGFest 的一些职责，并且在 2011 年，我决定更多地进入幕后。我会留在董事会担任顾问，帮助人们了解他们需要什么来管理他们的部门，但我不再掌舵了。与此同时，我的兼职工作，即给我支付账单的工作，解雇了他们所有的工人，我突然发现自己有了很多空闲时间。我开始写《 Pretty Eight Machine》，这是一首向《Nine Inch Nails》致敬的作品，我在这个事情和游戏配乐工作之间花了一年多，我向自己证明了我可以用音乐来（即便只是勉强）维持生计，这就是我接下来想做的。

![Inverse Phase CTM Tracker][7]

*版权所有 Inverse Phase，经许可使用。*

### 就硬件和软件而言，你的工作空间是什么样的？

Becker：在我的 DOS/Windows 时代，我主要使用 FastTracker 2。在 Linux 中，我将其替换为 SoundTracker（不是 Karsten Obarski 的原始版本，而是 GTK 重写版本；参见 [soundtracker.org][8]）。近来，SoundTracker 处于不断变化的状态——虽然我仍然需要尝试新的 GTK3 版本——但是当我无法使用 SoundTracker 时，[MilkyTracker][9] 是一个很好的替代品。如果我真的需要原版 FastTracker 2，虽然老旧但它也可以在 DOSBox 中运行起来。然而，那是我开始使用 Linux 的时候，所以这是我在 20-25 年前发现的东西。

在过去的十年里，我已经从基于采样的音乐转向了电子和音，这是由来自 8 位和 16 位游戏系统和计算机的旧声音芯片合成的音乐。有一个非常好的跨平台工具叫 [Deflemask][10]，可以为许多这些系统编写音乐。不过，我想为其创作音乐的一些系统不受支持，而且 Deflemask 是闭源的，因此我已经开始使用 Python 和 [Pygame][11] 从头开始构建自己的音乐创作环境。我使用 Git 维护我的代码树，并将使用开源的 [KiCad][12] 控制硬件合成器板。

### 你目前专注于哪些项目？

Becker：我断断续续地从事于游戏配乐和音乐委托工作。在此期间，我还一直致力于创办一个名为 [Bloop][13] 的电子娱乐博物馆。我们在档案和库存方面做了很多很酷的事情，但也许最令人兴奋的是我们一直在用树莓派构建展览。它们的用途非常广泛，而且我觉得很奇怪，如果我在十年前尝试这样做，我就不会有可以驱动我的展品的小型单板计算机；我可能会用把一个平板固定在笔记本电脑的背面！

### 现在有更多游戏平台进入 Linux，例如 Steam、Lutris 和 Play-on-Linux。你认为这种趋势会持续下去吗？这些会一直存在吗？

Becker：作为一个在 Linux 上玩了 25 年游戏的人——事实上，我 _是因为_ 游戏才接触 Linux 的——我想我认为这个问题比大多数人认为的更艰难。我已经玩了 Linux 原生游戏几十年了，我甚至不得不对收回我当年说的“要么存在 Linux 解决方案，要么编写出来”这样的话，但最终，我做到了，我编写了一个 Linux 游戏。

说实话：Android 问世于 2008 年。如果你在 Android 上玩过游戏，那么你就在 Linux 上玩过游戏。Steam 在 Linux 已经八年了。Steambox/SteamOS 发布在 Steam 发布一年后。我没有听到太多 Lutris 或 Play-on-Linux 的消息，但我知道它们并希望它们成功。我确实看到 GOG 的追随者非常多，我认为这非常好。我看到很多来自 Ryan Gordon（icculus）和 Ethan Lee（flibitijibibo）等人的高质量游戏移植，甚至有些公司在内部移植。Unity 和 Unreal 等游戏引擎已经支持 Linux。Valve 已经将 Proton 纳入 Linux 版本的 Steam 已有两年左右的时间了，所以现在 Linux 用户甚至不必搜索他们游戏的 Linux 原生版本。

我可以说，我认为大多数游戏玩家期待并将继续期待他们已经从零售游戏市场获得的支持水平。就我个人而言，我希望这个水平是增长而不是下降！

_详细了解 Brendan 的 [Inverse Phase][14] 工作。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/linux-open-source-music

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_other21x_cc.png?itok=JJJ5z6aB (Wires plugged into a network switch)
[2]: http://icculus.org/pyddr/
[3]: http://magfest.org/
[4]: http://www.inversephase.com/
[5]: https://opensource.com/sites/default/files/uploads/inverse_phase_performance_bw.png (Inverse Phase performance photo)
[6]: https://en.wikipedia.org/wiki/Walnut_Creek_CDROM
[7]: https://opensource.com/sites/default/files/uploads/inversephase_ctm_tracker_screenshot.png (Inverse Phase CTM Tracker)
[8]: http://soundtracker.org
[9]: http://www.milkytracker.org
[10]: http://www.deflemask.com
[11]: http://www.pygame.org
[12]: http://www.kicad-pcb.org
[13]: http://bloopmuseum.com
[14]: https://www.inversephase.com
