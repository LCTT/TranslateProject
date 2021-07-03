[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Music composition with Python and Linux)
[#]: via: (https://opensource.com/article/20/2/linux-open-source-music)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Music composition with Python and Linux
用 Python 和 Linux 进行音乐创作
======
与 MAGFest 先生的聊天——Brendan Becker。
![接入网络交换机的网络线缆][1]

1999 年，我遇到了在一家计算机商店工作的 Brendan Becker。我们都喜欢构建定制计算机并在其上安装 Linux。 Brendan 总是同时参与多个技术项目，从游戏编程到音乐创作。从电脑商店的日子快进几年，他继续编写[pyDance][2]，一个多跳舞游戏的开源实现，然后成为音乐和游戏项目[MAGFest][3]的 CEO。有时被称为 “Mr. MAGFest”，因为他是项目的负责人，Brendan 现在使用音乐笔名 “[Inverse Phase][4]” 作为 `chiptunes`(电子和音)的作曲家——主要在8位计算机和游戏控制台上制作音乐。

我认为采访他并询问他在整个职业生涯中如何从 Linux 和开源软件中受益的一些细节会很有趣。

![Inverse Phase 表演照片][5]

版权所有 Nickeledge, CC BY-SA 2.0.

### Alan Formy-Duval: 您是如何开始使用计算机和软件的？

Brendan Becker：从我记事起，我家就有一台电脑。我父亲热衷于技术；当 Compaq Portable 第一次大量上市时，他带了一台回家，当他不用它工作时，我可以使用它。自从我两岁开始阅读来，使用电脑就成了我的第二天性——只要阅读磁盘上的内容，按照说明进行操作，我就可以玩游戏了！有时我会玩学习和教育软件，我们有几张装满游戏的磁盘，我可以在其他时间玩。我记得有一个磁盘，里面有一些流行主题的免费克隆。最终，我父亲向我展示了我们可以调用其他计算机（5 岁时在 BBS 上！），我看到了一些游戏的来源。我喜欢玩的一款游戏是用 BASIC 编写的，当我意识到我可以简单地修改游戏时，只需阅读一些内容并重新输入它们以使我的游戏更容易，所有的赌注都被取消了。

### Formy-Duval: 这是 80 年代？

Becker： Compaq Portable 康柏便携式电脑于 1983 年推出，为您提供了一个参考框架。我爸爸有第一个那个模型。

### Formy-Duval: 您是如何进入 Linux 和开源软件的？

Becker：在 90 年代初我酷爱 MOD 和演示场景的东西，我注意到 Walnut Creek（[cdrom.com][6]；现已解散）在 FreeBSD 上运行商店。总的来说，我对 Unix 和其他操作系统非常好奇，但没有太多的第一手资料，认为是时候尝试一些东西了。DOOM 刚刚发布，有人告诉我甚至可以让它运行。在这与能够运行很酷的互联网服务器之间，我开始陷入困境。有人看到我在阅读有关 FreeBSD 的文章，并建议我检查 Linux，这是一个重新为 x86 编写的新操作系统，与 BSD 不同，后者（他们说）存在一些兼容性问题。因此，我加入了在线交谈网络 IRC 上的 `#linuxhelp` 并询问如何开始使用 Linux，指出我已经做了一些研究（询问 “Red Hat 和 Slackware 之间有什么区别？”）并主要探讨什么是最简单的使用。频道里唯一说话的人说他已经 13 岁了，他可以弄清楚 Slackware，所以我应该没有问题。学校的一个数学老师给了我一个硬盘，我下载了 “A” 盘组和一个启动盘，写了出来，安装了它，回头看并没有花太多时间。

### Formy-Duval: 你是如何被称为 MAGFest 先生的？

Becker：嗯，这个很简单。在第一个项目后，我几乎立即成为了 MAGFest 的代理负责人。前任主席都各奔东西，我向负责人要求不要取消项目。解决方案是自己运行它，当我慢慢地将项目塑造成我自己的时，这个昵称就成了我的。

### Formy-Duval: 我记得在那些早期参加过。 MAGFest 到底有多大？

Becker：第一届 MAGFest 是 265 人。现在是一个可怕的庞大的罕见的 20,000+ 出席者。

### Formy-Duval: 太棒了！您能简要描述一下 MAGFest 大会吗？

Becker：我的一个朋友 Hex 描述得非常好。他说：“就像是和你所有的朋友一起举办这个以电子游戏为主题的生日派对，但那里恰好有几千人，如果你愿意，他们都可以成为你的朋友，然后还有摇滚音乐会。” 这很快被采用并缩短为 “这是一个为期四天的视频游戏派对，有多个视频游戏摇滚音乐会”。通常 “音乐和游戏节” 这个措词是人们所需要的。

### Formy-Duval: 您是如何利用开源软件来运行 MAGFest 的？

Becker：当我成为 MAGFest 的负责人时，我已经用 Python 编写了一个游戏，所以我觉得用 Python 编写我们的注册系统最舒服。这是一个非常容易的决定，因为不涉及任何成本，而且我已经有了经验。后来，我们的在线注册系统和拼车界面都是用 PHP/MySQL 编写的，我们的论坛使用了 Kboard。最终，从无到有逐渐形成在 Python 中滚动我们自己的注册系统，我们也在项目中使用它，并在主网站上运行 Drupal。有一次，我还用 Python 编写了一个系统来管理视频室和邀请比赛站。哦，我们有一些游戏音乐收听站，你可以翻阅曲目，标志性游戏的班轮笔记 OST（原始音轨）和演奏 MAGFest 的乐队。

### Formy-Duval: 我知道几年前你减少了你在 MAGFest 的职责，去追求新的项目。你接下来的努力是什么？

Becker：我一直非常投入游戏音乐领域，并试图将尽可能多的音乐带到 MAGFest 中。随着我越来越多地成为这些社区的一部分，我想参与其中。我使用我以前使用过的免费开源版本的 DOS 和 Windows 演示场景工具编写了一些视频游戏曲调的混合曲、封面和编曲，这些工具也是免费的，但不一定是开源的。我在运行 MAGFest 的最初几年发布了一些曲目，然后在 Jake Kaufman（也被称为 `virt`；其中包括 Shovel Knight 和 Shantae 等人在他的简历上）的一些严厉的爱和建议之后，我改变主题到我更擅长的—— `chiptunes`(电子和音)。尽管我在 90 年代的演示场景中用我的 Compaq Portable 和 MOD 文件编写了 PC 扬声器的哔哔声和嘘声，但我还是在 2006 年发布了第一首 NES-spec 曲目，我真的很自豪地称之为我自己的曲目。专辑紧随其后。

2010 年，有很多人找我做游戏配乐工作。尽管配乐工作对它没有太大影响，但我开始更认真地缩减我在 MAGFest 的一些职责，并且在 2011 年，我决定在后台采取更大的步骤。我会留在董事会担任顾问，帮助人们了解他们需要什么来管理他们的部门，但我不再掌舵了。与此同时，我的兼职工作，即支付账单，解雇了他们所有的工人，我突然发现自己有很多空闲时间。我开始写 Pretty Eight Machine， Nine Inch Nails 致敬，我花了一年多，在那和游戏配乐工作之间，我向自己证明了我可以用音乐把食物放在桌子上（如果只是勉强），这就是我接下来想做的。

###

![Inverse Phase CTM 跟踪器][7]

版权所有 Inverse Phase,经许可使用。

### Formy-Duval: 就硬件和软件而言，您的工作空间是什么样的？

Becker：在我的 DOS/Windows 时代，我主要使用 FastTracker 2。在 Linux 中，我将其替换为 SoundTracker（不是 Karsten Obarski 的原始版本，而是 GTK 重写；参见 [soundtracker.org][8]）。这些天，SoundTracker 处于不断变化的状态——虽然我仍然需要尝试新的 GTK3 版本——但是当我无法使用 SoundTracker 时，[MilkyTracker][9] 是一个很好的替代品。如果我真的需要原版，那么好老的 FastTracker 2 也可以在 DOSBox 中运行。然而，那是我开始使用 Linux 的时候，所以这是我在 20-25 年前发现的东西。

在过去的十年里，我已经从基于样本的音乐转向了`chiptunes`(电子和音)——由来自 8 位和 16 位游戏系统和计算机的旧声音芯片合成的音乐。有一个非常好的跨平台工具 [Deflemask][10] 可以为许多这些系统编写音乐。不过，我想为其创作音乐的一些系统不受支持，而且 Deflemask 是闭源的，因此我已经开始使用 Python 和 [Pygame][11] 从头开始构建自己的音乐创作环境。我使用 Git 维护我的代码树，并将使用开源 [KiCad][12] 控制硬件合成器板。

### Formy-Duval: 您目前专注于哪些项目？

Becker：我断断续续地制作游戏配乐和音乐委员会。在此期间，我还一直致力于创办一个名为 [Bloop][13] 的电子娱乐博物馆。我们在档案和详细目录方面做了很多很酷的事情，但也许最令人兴奋的是我们一直在用 Raspberry Pi 构建展览。它们是如此多才多艺，而且很奇怪，如果我在十年前尝试这样做，我就不会拥有小型单板计算机来驱动我的展品；我可能会用螺栓将笔记本电脑固定在平板的背面！

### Formy-Duval: 现在有更多游戏平台进入 Linux，例如 Steam、Lutris 和 Play-on-Linux。您认为这种趋势会持续下去吗？这些会一直存在吗？

Becker：作为一个在 Linux 上玩了 25 年游戏的人——事实上，我被带到 Linux _是因为_ 游戏——我想我认为这个问题比大多数人更难。几十年来，我一直在运行 Linux 原生游戏，我甚至不得不对“存在 Linux 解决方案或可以编写”的话表示食言，但最终，我做到了，编写了一个 Linux 游戏。

真心话：Android 于 2008 年问世。如果您在 Android 上玩过游戏，那么您就在 Linux 上玩过游戏。Steam 已可用于 Linux 八年。Steambox/SteamOS 仅在 Steam 发布一年后发布。我没有听到很多关于 Lutris 或 Play-on-Linux 的消息，但我知道它们存在并希望它们成功。我确实看到 GOG 的追随者非常多，我认为这非常好。我看到很多高质量的游戏端口来自 Ryan Gordon (icculus) 和 Ethan Lee (flibitijibibo) 等人，甚至有些公司在内部移植。Unity 和 Unreal 等游戏引擎已经支持 Linux。Valve 已经将 Proton 纳入 Linux 版本的 Steam 已有两年左右的时间了，所以现在 Linux 用户甚至不必搜索他们游戏的 Linux 原生版本。

我可以说，我认为大多数游戏玩家期待并将继续期待他们已经从零售游戏市场获得的支持水平。就我个人而言，我希望这个水平增长而不是下降！

_详细了解 Brendan 担任 [Inverse Phase][14] 的工作。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/linux-open-source-music

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

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
