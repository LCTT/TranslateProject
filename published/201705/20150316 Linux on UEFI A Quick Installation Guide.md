详解 UEFI 模式下安装 Linux 
============================================================

> 此页面是免费浏览的，没有烦人的外部广告；然而，我的确花了时间准备，网站托管也花了钱。如果您发现此页面帮到了您，请考虑进行小额[捐款](http://www.rodsbooks.com/linux-uefi/)，以帮助保持网站的运行。谢谢！
> 原著于 2013/10/19；最后修改于 2015/3/16

### 引言

几年来，一种新的固件技术悄然出现，而大多数普通用户对此并无所知。该技术被称为 [ <ruby>可扩展固件接口<rt>Extensible Firmware Interface</rt></ruby>][29]（EFI）， 或更新一些的统一可扩展固件接口（Unified EFI，UEFI，本质上是 EFI 2.x），它已经开始替代古老的[<ruby>基本输入/输出系统<rt>Basic Input/Output System</rt></ruby>][30]（BIOS）固件技术，有经验的计算机用户或多或少都有些熟悉 BIOS。

本页面是给 Linux 用户使用 EFI 技术的一个快速介绍，其中包括有关开始将 Linux 安装到此类计算机上的建议。不幸的是，EFI 是一个庞杂的话题；EFI 软件本身是复杂的，许多实现有系统特定的怪异行为甚至是缺陷。因此，我无法在一个页面上描述在 EFI 计算机上安装和使用 Linux 的一切知识。我希望你能将本页面作为一个有用的起点，不管怎么说，每个部分以及末尾[参考文献][31]部分的链接可以指引你找到更多的文档。

### 你的计算机是否使用 EFI 技术？

EFI 是一种_固件_，意味着它是内置于计算机中处理低级任务的软件。最重要的是，固件控制着计算机的引导过程，反过来说这代表着基于 EFI 的计算机与基于 BIOS 的计算机的引导过程不同。（有关此规律的例外之处稍后再说。）这种差异可能使操作系统安装介质的设计超级复杂化，但是一旦安装好并运行之后，它对计算机的日常操作几乎没有影响。请注意，大多数制造商使用术语 “BIOS” 来表示他们的 EFI。我认为这种用法很混乱，所以我避免了；在我看来，EFI 和 BIOS 是两种不同类型的固件。

> **注意：**苹果公司的 Mac 使用的 EFI 在许多方面是不同寻常的。尽管本页面的大部分内容同样适用于 Mac，但有些细节上的出入，特别是在设置 EFI 引导加载程序的时候。这个任务最好在 OS X 上进行，使用 Mac 的 [bless utility][49]工具，我不在此做过多描述。

自从 2006 年第一次推出以来，EFI 已被用于基于英特尔的 Mac 上。从 2012 年底开始，大多数安装 Windows 8 或更高版本系统的计算机就已经默认使用 UEFI 启动，实际上大多数 PC 从 2011 年中期就开始使用 UEFI，虽然默认情况下它们可能无法以 EFI 模式启动。2011 年前销出的 PC 也有一些支持 EFI，尽管它们大都默认使用 BIOS 模式启动。

如果你不确定你的计算机是否支持 EFI，则应查看固件设置实用程序和参考用户手册关于 _EFI_、_UEFI_ 以及 _legacy booting_ 的部分。（可以通过搜索用户手册的 PDF 文件来快速了解。）如果你没有找到类似的参考，你的计算机可能使用老式的（“legacy”） BIOS 引导；但如果你找到了这些术语的参考，几乎可以肯定它使用了 EFI 技术。你还可以尝试_只_有 EFI 模式的引导加载器的安装介质。使用 [rEFInd][50] 制作的 USB 闪存驱动器或 CD-R 镜像是用来测试不错的选择。

在继续之前，你应当了解大多数 x86 和 x86-64 架构的计算机上的 EFI 都包含一个叫做<ruby>兼容支持模块<rt>Compatibility Support Module</rt></ruby>（CSM）的组件，这使得 EFI 能够使用旧的 BIOS 风格的引导机制来引导操作系统。这会非常方便，因为它向后兼容；但是这样也导致一些意外情况的发生，因为计算机不论以 EFI 模式引导还是以 BIOS （也称为 CSM 或 legacy）模式引导，在控制时没有标准的使用规范和用户界面。特别地，你的 Linux 安装介质非常容易意外的以 BIOS/CSM/legacy 模式启动，这会导致 Linux 以 BIOS/CSM/legacy 模式安装。如果 Linux 是唯一的操作系统，也可以正常工作，但是如果与在 EFI 模式下的 Windows 组成双启动的话，就会非常复杂。（反过来问题也可能发生。）以下部分将帮助你以正确模式引导安装程序。如果你在阅读这篇文章之前就已经以 BIOS 模式安装了 Linux，并且希望切换引导模式，请阅读后续章节，[哎呀：将传统模式下安装的引导转为 EFI 模式下的引导][51]。

UEFI 的一个附加功能值得一提：<ruby>安全启动<rt>Secure Boot</rt></ruby>。此特性旨在最大限度的降低计算机受到 _boot kit_ 病毒感染的风险，这是一种感染计算机引导加载程序的恶意软件。Boot kits 很难检测和删除，阻止它们的运行刻不容缓。微软公司要求所有带有支持 Windows 8 标志的台式机和笔记本电脑启用 安全启动。这一配置使 Linux 的安装变得复杂，尽管有些发行版可以较好的处理这个问题。不要将安全启动和 EFI 或 UEFI 混淆；支持 EFI 的计算机不一定支持 安全启动，而且支持 EFI 的 x86-64 的计算机也可以禁用 安全启动。微软同意用户在 Windows 8 认证的 x86 和 x86-64 计算机上禁用安全启动功能；然而对装有 Windows 8 的 ARM 计算机而言却相反，它们必须**不允许**用户禁用 安全启动。幸运的是，基于 ARM 的 Windows 8 计算机目前很少见。我建议避免使用它们。

### 你的发行版是否支持 EFI 技术？

大多数 Linux 发行版已经支持 EFI 好多年了。然而，不同的发行版对 EFI 的支持程度不同。大多数主流发行版（Fedora，OpenSUSE，Ubuntu 等）都能很好的支持 EFI，包括对安全启动的支持。另外一些“自行打造”的发行版，比如 Gentoo，对 EFI 的支持较弱，但它们的性质使其很容易添加 EFI 支持。事实上，可以向_任意_ Linux 发行版添加 EFI 支持：你需要安装 Linux（即使在 BIOS 模式下），然后在计算机上安装 EFI 引导加载程序。有关如何执行此操作的信息，请参阅[哎呀：将传统模式下安装的引导转为 EFI 模式下的引导][52]部分。

你应当查看发行版的功能列表，来确定它是否支持 EFI。你还应当注意你的发行版对安全启动的支持情况，特别是如果你打算和 Windows 8 组成双启动。请注意，即使正式支持安全启动的发行版也可能要求禁用此功能，因为 Linux 对安全启动的支持通常很差劲，或者导致意外情况的发生。

### 准备安装 Linux

下面几个准备步骤有助于在 EFI 计算机上 Linux 的安装，使其更加顺利：

#### 1、 升级固件

有些 EFI 是有问题的，不过硬件制造商偶尔会发布其固件的更新。因此我建议你将固件升级到最新可用的版本。如果你从论坛的帖子知道自己计算机的 EFI 有问题，你应当在安装 Linux 之前更新它，因为如果安装 Linux 之后更新固件，会有些问题需要额外的操作才能解决。另一方面，升级固件是有一定风险的，所以如果制造商提供了 EFI 支持，最好的办法就是按它们提供的方式进行升级。

#### 2、 了解如何使用固件

通常你可以通过在引导过程之初按 Del 键或功能键进入固件设置实用程序。按下开机键后尽快查看相关的提示信息，或者尝试每个功能键。类似的，ESC 键或功能键通常可以进入固件的内置引导管理器，可以选择要进入的操作系统或外部设备。一些制造商把这些设置隐藏的很深。在某些情况下，如[此页面][32]所述，你可以在 Windows 8 内做到这些。

#### 3、调整以下固件设置

*   **快速启动** — 此功能可以通过在硬件初始化时使用快捷方式来加快引导过程。这很好用，但有时候会使 USB 设备不能初始化，导致计算机无法从 USB 闪存驱动器或类似的设备启动。因此禁用快速启动_可能_有一定的帮助，甚至是必须的；你可以让它保持激活，而只在 Linux 安装程序启动遇到问题时将其停用。请注意，此功能有时可能会以其它名字出现。在某些情况下，你必须_启用_ USB 支持，而不是_禁用_快速启动功能。
*   **安全启动** — Fedora，OpenSUSE，Ubuntu 以及其它的发行版官方就支持安全启动；但是如果在启动引导加载程序或内核时遇到问题，可能需要禁用此功能。不幸的是，没办法具体描述怎么禁用，因为不同计算机的设置方法也不同。请参阅[我的安全启动页面][1]获取更多关于此话题的信息。

	> **注意：** 一些教程说安装 Linux 时需要启用 BIOS/CSM/legacy 支持。通常情况下，这样做是错的。启用这些支持可以解决启动安装程序涉及的问题，但也会带来新的问题。以这种方式安装的教程通常可以通过“引导修复”来解决这些问题，但最好从一开始就做对。本页面提供了帮助你以 EFI 模式启动 Linux 安装程序的提示，从而避免以后的问题。
*   **CSM/legacy 选项** — 如果你想以 EFI 模式安装，请_关闭_这些选项。一些教程推荐启用这些选项，有时这是必须的 —— 比如，有些附加视频卡需要在固件中启用 BIOS 模式。尽管如此，大多数情况下启用 CSM/legacy 支持只会无意中增加以 BIOS 模式启动 Linux 的风险，但你并_不想_这样。请注意，安全启动和 CSM/legacy 选项有时会交织在一起，因此更改任一选项之后务必检查另一个。

#### 4、  禁用 Windows 的快速启动功能

[这个页面][33]描述了如何禁用此功能，不禁用的话会导致文件系统损坏。请注意此功能与固件的快速启动不同。

#### 5、  检查分区表

使用 [GPT fdisk][34]、parted 或其它任意分区工具检查磁盘分区。理想情况下，你应该创建一个包含每个分区确切起点和终点（以扇区为单位）的纸面记录。这会是很有用的参考，特别是在安装时进行手动分区的时候。如果已经安装了 Windows，确定可以识别你的 [EFI 系统分区（ESP）][35]，它是一个 FAT 分区，设置了“启动标记”（在 parted 或 Gparted 中）或在 gdisk 中的类型码为 EF00。

### 安装 Linux

大部分 Linux 发行版都提供了足够的安装说明；然而我注意到了在 EFI 模式安装中的几个常见的绊脚石：

*   **确保使用正确位深的发行版** — EFI 启动加载器和 EFI 自身的位深相同。现代计算机通常是 64 位，尽管最初几代基于 Intel 的 Mac、一些现代的平板电脑和变形本、以及一些鲜为人知的电脑使用 32 位 EFI。虽然可以将 32 位 EFI 引导加载程序添加至 32 位发行版，但我还没有遇到过正式支持 32 位 EFI 的 Linux 发行版。（我的 《[在 Linux 上管理  EFI 引导加载程序][36]》 一文概述了引导加载程序，而且理解了这些原则你就可以修改 32 位发行版的安装程序，尽管这不是一个初学者该做的。）在 64 位 EFI 的计算机上安装 32 位发行版最让人头疼，我不准备在这里描述这一过程；在具有 64 位 EFI 的计算机上，你应当使用 64 位的发行版。
*   **正确准备引导介质** — 将 .iso 镜像传输到 USB 闪存驱动器的第三方工具，比如 unetbootin，在创建正确的 EFI 模式引导项时经常失败。我建议按照发行版维护者的建议来创建 USB 闪存驱动器。如果没有类似的建议，使用 Linux 的 dd 工具，通过执行 `dd if=image.iso of=/dev/sdc` 在识别为 `/dev/sdc` 的 USB 闪存驱动器上创建一个镜像。至于 Windows，有 [WinDD][37] 和 [dd for windows][38]，但我从没测试过它们。请注意，使用不兼容 EFI 的工具创建安装介质是错误的，这会导致人们进入在 BIOS 模式下安装然后再纠正它们的误区，所以不要忽视这一点！
*   **备份 ESP 分区** — 如果计算机已经存在 Windows 或者其它的操作系统，我建议在安装 Linux 之前备份你的 ESP 分区。尽管 Linux _不应该_ 损坏 ESP 分区已有的文件，但似乎这时不时发生。发生这种事情时备份会有很大用处。只需简单的文件级的备份（使用 cp，tar，或者 zip 类似的工具）就足够了。
*   **以 EFI 模式启动** — 以 BIOS/CSM/legacy 模式引导 Linux 安装程序的意外非常容易发生，特别是当固件启用 CSM/legacy 选项时。下面一些提示可以帮助你避免此问题：
	*   进入 Linux shell 环境执行 `ls /sys/firmware/efi` 验证当前是否处于 EFI 引导模式。如果你看到一系列文件和目录，表明你已经以 EFI 模式启动，而且可以忽略以下多余的提示；如果没有，表明你是以 BIOS 模式启动的，应当重新检查你的设置。
	*   使用固件内置的引导管理器（你应该已经知道在哪；请参阅[了解如何使用固件][26]）使之以 EFI 模式启动。一般你会看到 CD-R 或 USB 闪存驱动器两个选项，其中一个选项包括 _EFI_ 或 _UEFI_ 字样的描述，另一个不包括。使用 EFI/UEFI 选项来启动介质。
	*   禁用安全启动 - 即使你使用的发行版官方支持安全启动，有时它们也不能生效。在这种情况下，计算机会静默的转到下一个引导加载程序，它可能是启动介质的 BIOS 模式的引导加载程序，导致你以 BIOS 模式启动。请参阅我的[安全启动的相关文章][27]以得到禁用安全启动的相关提示。
	*   如果 Linux 安装程序总是无法以 EFI 模式启动，试试用我的 [rEFInd 引导管理器][28] 制作的 USB 闪存驱动器或 CD-R。如果 rEFInd 启动成功，那它保证是以 EFI 模式运行的，而且在基于 UEFI 的 PC 上，它只显示 EFI 模式的引导项，因此若您启动到 Linux 安装程序，则应处于 EFI 模式。（但是在 Mac 上，除了 EFI 模式选项之外，rEFInd 还显示 BIOS 模式的引导项。）
*   **准备 ESP 分区** — 除了 Mac，EFI 使用 ESP 分区来保存引导加载程序。如果你的计算机已经预装了 Windows，那么 ESP 分区就已存在，可以在 Linux 上直接使用。如果不是这样，那么我建议创建一个大小为 550 MB 的 ESP 分区。（如果你已有的 ESP 分区比这小，别担心，直接用就行。）在此分区上创建一个 FAT32 文件系统。如果你使用 Gparted 或者 parted 准备 ESP 分区，记得给它一个“启动标记”。如果你使用 GPT fdisk（gdisk，cgdisk 或 sgdisk）准备 ESP 分区，记得给它一个名为 EF00 的类型码。有些安装程序会创建一个较小的 ESP 分区，并且设置为 FAT16 文件系统。尽管这样能正常工作，但如果你之后需要重装 Windows，安装程序会无法识别 FAT16 文件系统的 ESP 分区，所以你需要将其备份后转为 FAT32 文件系统。
*   **使用 ESP 分区** — 不同发行版的安装程序以不同的方式辨识 ESP 分区。比如，Debian 和 Ubuntu 的某些版本把 ESP 分区称为“EFI boot partition”，而且不会明确显示它的挂载点（尽管它会在后台挂载）；但是有些发行版，像 Arch 或 Gentoo，需要你去手动挂载。尽管将 ESP 分区挂载到 /boot 进行相应配置后可以正常工作，特别是当你想使用 gummiboot 或 ELILO（译者注：gummiboot 和 ELILO 都是 EFI 引导工具）时，但是在 Linux 中最标准的 ESP  分区挂载点是 /boot/efi。某些发行版的 /boot 不能用 FAT 分区。因此，当你设置 ESP 分区挂载点时，请将其设置为 /boot/efi。除非 ESP 分区没有，否则_不要_为其新建文件系统 — 如果已经安装 Windows 或其它操作系统，它们的引导文件都在 ESP 分区里，新建文件系统会销毁这些文件。
*   **设置引导程序的位置** — 某些发行版会询问将引导程序（GRUB）装到何处。如果 ESP 分区按上述内容正确标记，不必理会此问题，但有些发行版仍会询问。请尝试使用 ESP 分区。
*   **其它分区** — 除了 ESP 分区，不再需要其它的特殊分区；你可以设置 根（/）分区，swap 分区，/home 分区，或者其它分区，就像你在 BIOS 模式下安装时一样。请注意 EFI 模式下_不需要设置_[BIOS 启动分区][39]，所以如果安装程序提示你需要它，意味着你可能意外的进入了 BIOS 模式。另一方面，如果你创建了 BIOS 启动分区，会更灵活，因为你可以安装 BIOS 模式下的 GRUB，然后以任意模式（EFI 模式 或 BIOS 模式）引导。
*   **解决无显示问题** — 2013 年，许多人在 EFI 模式下经常遇到（之后出现的频率逐渐降低）无显示的问题。有时可以在命令行下通过给内核添加 `nomodeset` 参数解决这一问题。在 GRUB 界面按 `e` 键会打开一个简易文本编辑器。大多数情况下你需要搜索有关此问题的更多信息，因为此问题更多是由特定硬件引起的。

在某些情况下，你可能不得不以 BIOS 模式安装 Linux。但你可以手动安装 EFI 引导程序让 Linux 以 EFI 模式启动。请参阅《 [在 Linux 上管理  EFI 引导加载程序][53]》 页面获取更多有关它们以及如何安装的可用信息。

### 解决安装后的问题

如果 Linux 无法在 EFI 模式下工作，但在 BIOS 模式下成功了，那么你可以完全放弃 EFI 模式。在只有 Linux 的计算机上这非常简单；安装 BIOS 引导程序即可（如果你是在 BIOS 模式下安装的，引导程序也应随之装好）。如果是和 EFI 下的 Windows 组成双系统，最简单的方法是安装我的 [rEFInd 引导管理器][54]。在 Windows 上安装它，然后编辑 `refind.conf` 文件：取消注释 `scanfor` 一行，并确保拥有 `hdbios` 选项。这样 rEFInd 在引导时会重定向到 BIOS 模式的引导项。

如果重启后计算机直接进入了 Windows，很可能是 Linux 的引导程序或管理器安装不正确。（但是应当首先尝试禁用安全启动；之前提到过，它经常引发各种问题。）下面是关于此问题的几种可能的解决方案：

*   **使用 efibootmgr** — 你可以以 _EFI 模式_引导一个 Linux 急救盘，使用 efibootmgr 实用工具尝试重新注册你的 Linux 引导程序，如[这里][40]所述。
*   **使用 Windows 上的 bcdedit** — 在 Windows 管理员命令提示符窗口中，输入 `bcdedit /set {bootmgr}path \EFI\fedora\grubx64.efi` 会用 ESP 分区的 `EFI/fedora/grubx64.efi` 文件作为默认的引导加载程序。根据需要更改此路径，指向你想设置的引导文件。如果你启用了安全启动，需要设置 `shim.efi`，`shimx64.efi` 或者 `PreLoader.efi`（不管有哪个）为引导而不是 `grubx64.efi`。
*   **安装 rEFInd** — 有时候 rEFInd 可以解决这个问题。我推荐使用 [CD-R 或者 USB 闪存驱动器][41]进行测试。如果 Linux 可以启动，就安装 Debian 软件包、RPM 程序，或者 .zip 文件包。（请注意，你需要在一个高亮的 Linux vmlinuz* 选项按两次 `F2` 或 `Insert` 修改启动选项。如果你的启动分区是单独的，这就更有必要了，因为这种情况下，rEFInd 无法找到根（/）分区，也就无法传递参数给内核。）
*   **使用修复引导程序** — Ubuntu 的[引导修复实用工具][42]可以自动修复一些问题；然而，我建议只在 Ubuntu 和 密切相关的发行版上使用，比如 Mint。有时候，有必要通过高级选项备份并替换 Windows 的引导。
*   **劫持 Windows 引导程序** — 有些不完整的 EFI 引导只能引导 Windows，就是 ESP 分区上的 `EFI/Microsoft/Boot/bootmgfw.efi` 文件。因此，你可能需要将引导程序改名（我建议将其移动到上级目录 `EFI/Microsoft/bootmgfw.efi`），然后将首选引导程序复制到这里。（大多数发行版会在 EFI 的子目录放置 GRUB 的副本，例如 Ubuntu 的 EFI/ubuntu，Fedora 的 EFI/fedora。）请注意此方法是个丑陋的解决方法，有用户反映 Windows 会替换引导程序，所以这个办法不是 100% 有效。然而，这是在不完整的 EFI 上生效的唯一办法。在尝试之前，我建议你升级固件并重新注册自己的引导程序，Linux 上用 efibootmgr，Windows 上用 bcdedit。

有关引导程序的其它类型的问题 - 如果 GRUB（或者你的发行版默认的其它引导程序或引导管理器）没有引导操作系统，你必须修复这个问题。因为 GRUB 2 引导 Windows 时非常挑剔，所以 Windows 经常启动失败。在某些情况下，安全启动会加剧这个问题。请参阅[我的关于 GRUB 2 的页面][55]获取一个引导 Windows 的 GRUB 2 示例。还会有很多原因导致 Linux 引导出现问题，类似于 BIOS 模式下的情况，所以我没有全部写出来。

尽管 GRUB 2 使用很普遍，但我对它的评价却不高 - 它很复杂，而且难以配置和使用。因此，如果你在使用 GRUB 的时候遇到了问题，我的第一反应就是用别的东西代替。[我的用于 Linux 的 EFI 引导程序页面][56]有其它的选择。其中包括我的 [rEFInd 引导管理器][57]，它除了能够让许多发行版上的 GRUB 2 工作，也更容易安装和维护 - 但是它还不能完全代替 GRUB 2。

除此之外，EFI 引导的问题可能很奇怪，所以你需要去论坛发帖求助。尽量将问题描述完整。[Boot Info Script][58] 可帮助你提供有用的信息 - 运行此脚本，将生成的名为 RESULTS.txt 的文件粘贴到论坛的帖子上。一定要将文本粘贴到 `[code]` 和 `[/code]` 之间；不然会遭人埋怨。或者将 RESULTS.txt 文件上传到 pastebin 网站上，比如 [pastebin.com][59]，然后将网站给你的 URL 地址发布到论坛。

### 哎呀：将传统模式下安装的系统转为 EFI 模式下引导

**警告：**这些指南主要用于基于 UEFI 的 PC。如果你的 Mac 已经安装了 BIOS 模式下的 Linux，但想以 EFI 模式启动 Linux，可以_在 OS X_ 中安装引导程序。rEFInd（或者旧式的 rEFIt）是 Mac 上的常用选择，但 GRUB 可以做的更多。

论坛上有很多人看了错误的教程，在已经存在 EFI 模式的 Windows 的情况下，安装了 BIOS 引导的 Linux，这一问题在 2015 年初很普遍。这样配置效果很不好，因为大多数 EFI 很难在两种模式之间切换，而且 GRUB 也无法胜任这项工作。你可能会遇到不完善的 EFI 无法启动外部介质的情况，也可能遇到 EFI 模式下的显示问题，或者其它问题。

如前所述，在[解决安装后的问题][60]部分，解决办法之一就是_在 Windows_ 上安装 rEFInd，将其配置为支持 BIOS 模式引导。然后可以引导 rEFInd 并链式引导到你的 BIOS 模式的 GRUB。在 Linux 上遇到 EFI 特定的问题时，例如无法使用显卡，我建议你使用这个办法修复。如果你没有这样的 EFI 特定的问题，在 Windows 中安装 rEFInd 和合适的 EFI 文件系统驱动可以让 Linux 直接以 EFI 模式启动。这个解决方案很完美，它和我下面描述的内容等同。

大多数情况下，最好将 Linux 配置为以 EFI 模式启动。有很多办法可以做到，但最好的是使用 Linux 的 EFI 引导模式（或者，可以想到，Windows，或者一个 EFI shell）注册到你首选的引导管理器。实现这一目标的方法如下：

1.  下载适用于 USB 闪存驱动器或 CD-R 的 [rEFInd 引导管理器][43]。
2.  从下载的镜像文件生成安装介质。可以在任何计算机上准备，不管是 EFI 还是 BIOS 的计算机都可以（或者在其它平台上使用其它方法）。
3.  如果你还没有这样做，[请禁用安全启动][44]。因为 rEFInd CD-R 和 USB 镜像不支持安全启动，所以这很必要，你可以在以后重新启用它。
4.  在目标计算机上启动 rEFInd。如前所述，你可能需要调整固件设置，并使用内置引导管理器选择要引导的介质。你选择的那一项也许在其描述中包含 _UEFI_ 这样的字符串。
5.  在 rEFInd 上测试引导项。你应该至少看到一个启动 Linux 内核的选项（名字含有 vmlinuz 这样的字符串）。有两种方法可以启动它：
    *   如果你_没有_独立的 `/boot` 分区，只需简单的选择内核并按回车键。Linux 就会启动。
    *   如果你_确定有_一个独立的 `/boot` 分区，按两次 `Insert` 或 `F2` 键。这样会打开一个行编辑器，你可以用它来编辑内核选项。增加一个 `root=` 格式以标识根（/）文件系统，如果根（/）分区在 `/dev/sda5` 上，就添加 `root=/dev/sda5`。如果不知道根文件系统在哪里，那你需要重启并尽可能想到办法。
    
	在一些罕见的情况下，你可能需要添加其它内核选项来代替或补充 `root=` 选项。比如配置了 LVM（LCTT 译注：Logical Volume Manager，逻辑卷管理）的 Gentoo 就需要 `dolvm` 选项。
6.  Linux 一旦启动，安装你想要的引导程序。rEFInd 的安装很简单，可以通过 RPM、Debian 软件包、PPA，或从[rEFInd 下载页面][45]下载的二进制 .zip 文件进行安装。在 Ubuntu 和相关的发行版上，引导修改程序可以相对简单地修复你的 GRUB 设置，但你要对它有信心可以正常工作。（它通常工作良好，但有时候会把事情搞得一团糟。）另外一些选项都在我的 《[在 Linux 上管理  EFI 引导加载程序][46]》 页面上。
7.  如果你想在安全启动激活的情况下引导，只需重启并启用它。但是，请注意，可能需要额外的安装步骤才能将引导程序设置为使用安全启动。有关详细信息，请参阅[我关于这个主题的页面][47]或你的引导程序有关安全启动的文档资料。

重启时，你可以看到刚才安装的引导程序。如果计算机进入了 BIOS 模式下的 GRUB，你应当进入固件禁用 BIOS/CSM/legacy 支持，或调整引导顺序。如果计算机直接进入了 Windows，那么你应当阅读前一部分，[解决安装后的问题][61]。

你可能想或需要调整你的配置。通常是为了看到额外的引导选项，或者隐藏某些选项。请参阅引导程序的文档资料，以了解如何进行这些更改。

### 参考和附加信息

*   **信息网页**
    *   我的 《[在 Linux 上管理  EFI 引导加载程序][2]》 页面含有可用的 EFI 引导程序和引导管理器。
    *   [OS X's bless tool 的手册页][3] 页面在设置 OS X 平台上的引导程序或引导管理器时可能会很有用。
    *   [EFI 启动过程][4] 描述了 EFI 启动时的大致框架。
    *   [Arch Linux UEFI wiki page][5] 有大量关于 UEFI 和 Linux 的详细信息。
    *   亚当·威廉姆森写的一篇不错的 《[什么是 EFI，它是怎么工作的][6]》。
    *   [这个页面][7] 描述了如何从 Windows 8 调整 EFI 的固件设置。
    *   马修·J·加勒特是 Shim 引导程序的开发者，此程序支持安全启动，他维护的[博客][8]经常更新有关 EFI 的问题。
    *   如果你对 EFI 软件的开发感兴趣，我的 《[EFI 编程][9]》 页面可以为你起步助力。
*   **附加程序**
    *   [rEFInd 官网][10]
    *   [gummiboot 官网][11]
    *   [ELILO 官网][12]
    *   [GRUB 官网][13]
    *   [GPT fdisk 分区软件官网][14]
    *   Ubuntu 的 [引导修复实用工具][15]可帮助解决一些引启动问题
*   **交流**
    *   [Sourceforge 上的 rEFInd 交流论坛][16]是 rEFInd 用户互相交流或与我联系的一种方法。
    *   Pastebin 网站，比如 [http://pastebin.com][17]， 是在 Web 论坛上与其他用户交换大量文本的一种便捷的方法。

--------------------------------------------------------------------------------

via: http://www.rodsbooks.com/linux-uefi/

作者：[Roderick W. Smith][a]
译者：[fuowang](https://github.com/fuowang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:rodsmith@rodsbooks.com
[1]:http://www.rodsbooks.com/efi-bootloaders/secureboot.html#disable
[2]:http://www.rodsbooks.com/efi-bootloaders/
[3]:http://ss64.com/osx/bless.html
[4]:http://homepage.ntlworld.com/jonathan.deboynepollard/FGA/efi-boot-process.html
[5]:https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface
[6]:https://www.happyassassin.net/2014/01/25/uefi-boot-how-does-that-actually-work-then/
[7]:http://www.eightforums.com/tutorials/20256-uefi-firmware-settings-boot-inside-windows-8-a.html
[8]:http://mjg59.dreamwidth.org/
[9]:http://www.rodsbooks.com/efi-programming/
[10]:http://www.rodsbooks.com/refind/
[11]:http://freedesktop.org/wiki/Software/gummiboot
[12]:http://elilo.sourceforge.net/
[13]:http://www.gnu.org/software/grub/
[14]:http://www.rodsbooks.com/gdisk/
[15]:https://help.ubuntu.com/community/Boot-Repair
[16]:https://sourceforge.net/p/refind/discussion/
[17]:http://pastebin.com/
[18]:http://www.rodsbooks.com/linux-uefi/#intro
[19]:http://www.rodsbooks.com/linux-uefi/#isitefi
[20]:http://www.rodsbooks.com/linux-uefi/#distributions
[21]:http://www.rodsbooks.com/linux-uefi/#preparing
[22]:http://www.rodsbooks.com/linux-uefi/#installing
[23]:http://www.rodsbooks.com/linux-uefi/#troubleshooting
[24]:http://www.rodsbooks.com/linux-uefi/#oops
[25]:http://www.rodsbooks.com/linux-uefi/#references
[26]:http://www.rodsbooks.com/linux-uefi/#using_firmware
[27]:http://www.rodsbooks.com/efi-bootloaders/secureboot.html#disable
[28]:http://www.rodsbooks.com/refind/getting.html
[29]:https://en.wikipedia.org/wiki/Uefi
[30]:https://en.wikipedia.org/wiki/BIOS
[31]:http://www.rodsbooks.com/linux-uefi/#references
[32]:http://www.eightforums.com/tutorials/20256-uefi-firmware-settings-boot-inside-windows-8-a.html
[33]:http://www.eightforums.com/tutorials/6320-fast-startup-turn-off-windows-8-a.html
[34]:http://www.rodsbooks.com/gdisk/
[35]:http://en.wikipedia.org/wiki/EFI_System_partition
[36]:http://www.rodsbooks.com/efi-bootloaders
[37]:https://sourceforge.net/projects/windd/
[38]:http://www.chrysocome.net/dd
[39]:https://en.wikipedia.org/wiki/BIOS_Boot_partition
[40]:http://www.rodsbooks.com/efi-bootloaders/installation.html
[41]:http://www.rodsbooks.com/refind/getting.html
[42]:https://help.ubuntu.com/community/Boot-Repair
[43]:http://www.rodsbooks.com/refind/getting.html
[44]:http://www.rodsbooks.com/efi-bootloaders/secureboot.html#disable
[45]:http://www.rodsbooks.com/refind/getting.html
[46]:http://www.rodsbooks.com/efi-bootloaders/
[47]:http://www.rodsbooks.com/efi-bootloaders/secureboot.html
[48]:mailto:rodsmith@rodsbooks.com
[49]:http://ss64.com/osx/bless.html
[50]:http://www.rodsbooks.com/refind/getting.html
[51]:http://www.rodsbooks.com/linux-uefi/#oops
[52]:http://www.rodsbooks.com/linux-uefi/#oops
[53]:http://www.rodsbooks.com/efi-bootloaders/
[54]:http://www.rodsbooks.com/refind/
[55]:http://www.rodsbooks.com/efi-bootloaders/grub2.html
[56]:http://www.rodsbooks.com/efi-bootloaders
[57]:http://www.rodsbooks.com/refind/
[58]:http://sourceforge.net/projects/bootinfoscript/
[59]:http://pastebin.com/
[60]:http://www.rodsbooks.com/linux-uefi/#troubleshooting
[61]:http://www.rodsbooks.com/linux-uefi/#troubleshooting
