[#]: subject: "A list of new（ish） command line tools"
[#]: via: "https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

一个新的命令行工具列表
======

你好！今天我[在 twitter][1] 询问了一些新的命令行工具，比如 `ripgrep` 和 `fd` 以及 `fzf` 和 `exa` 以及 `bat`。

我收到了一大堆我没有听说过的工具的回复，所以我想我应该在这里列出一个清单。很多人还指出了 [modern-unix][2] 的列表。

### 标准工具的替代物

  * [ripgrep][3]、[ag][4]、[ack][5] （grep）
  * [exa][6]、[lsd][7] （ls）
  * [mosh][8] （ssh）
  * [bat][9] （cat）
  * [delta][10] （git 分页器）
  * [fd][11] （find）
  * [drill][12]、[dog][13] （dig）
  * [duf][14] （df）
  * [dust][15]、ncdu （du）
  * [pgcli][16] （psql）
  * [btm][17]、[btop][18]、[glances][19]、[gtop][20]、[zenith][21] （top）
  * [tldr][22] （类似 man）
  * [sd][23] （sed）
  * [difftastic][24] （diff）
  * mtr （traceroute）
  * [plocate][25] （locate）
  * xxd、[hexyl][26] （hexdump）



### 新的发明

这里有一些不完全是替代标准工具的工具：

  * [z][27]、[fasd][28]、[autojump][29]、[zoxide][30] （使查找文件/改变目录更容易的工具）
  * [broot][31]、[nnn][32]、[ranger][33] （文件管理器）
  * [direnv][34] （根据当前目录加载环境变量）
  * [fzf][35]、[peco][36] （“模糊查找器”）
  * [croc][37] and [magic-wormhole][38] （将文件从一台计算机发送到另一台）
  * [hyperfine][39] 基准测试
  * [httpie][40]、[curlie][41]、[xh][42] （用于发出 HTTP 请求）
  * [entr][43] （当文件改变时运行任意命令）
  * [asdf][44] （多语言的版本管理器）
  * [tig][45]、[lazygit][46] （git 的交互界面）
  * [lazydocker][47] （docker 的交互式界面）
  * [choose][48] （awk/cut 的基础）
  * [ctop][49] （容器的 top）
  * [fuck][50] （自动纠正命令行错误）
  * [tmate][51] （与朋友分享你的终端）
  * [lnav][52]、[angle-grinder][53] （管理日志的工具）
  * [mdp][54]、[glow][55] （在终端显示 markdown 的方法）
  * pbcopy/pbpaste （用于剪贴板标准输入/标准输出，可能不是“新的”，但被提到了很多。你可以使用 xclip 在 Linux 上做同样的事情。）



**JSON/YAML/CSV 工具：**

  * [jq][57] （一个很好的 JSON 处理工具）
  * [jc][58] （将各种工具的输出转换成 JSON）
  * [jo][59] （创建 JSON 对象）
  * [yq][60] （类似 `jq`，但用于 YAML）。还有[另一个 yq][61] 。
  * [fq][62] （类似 `jq`，但用于二进制）
  * [htmlq][63] （类似 `jq`，但用于 HTML）
  * [fx][64] （交互式 json 工具）
  * [jless][65] （json 分页器）
  * [xsv][66] （一个用于 csv 文件的命令行工具，来自 burntsushi）
  * [visidata][67] （“一个用于表格数据的交互式多功能工具”）
  * [miller][68] （“像 awk/sed/cut/join/sort 一样用于 CSV/TSV/JSON/JSON 行”）



**grep 工具：**

  * [pdfgrep][69] （用于 PDF 的 grep）
  * [gron][70] （使 JSON 可 grep）
  * [ripgrep-all][71] （ripgrep，但包括 PDF、zip、ebooks 等）



### 不太新的工具

下面是一些不那么新的工具，人们提到的不那么知名的工具：

  * pv （“pipe viewer”, 给你一个管道的进度条）
  * vidir （来自 [moreutils][72]，让你在 vim 中批量重命名/删除文件）
  * sponge、ts、parallel （也来自 moreutils）



### 我的一些最爱

我最喜欢的是 `entr`、`ripgrep`、`git-delta`、`httpie`、`plocate`和 `jq`，这些都是我已经使用的。

我有兴趣尝试 `direnv`、`btm`、`z`、`xsv` 和 `duf`，但我认为我了解到的最令人兴奋的工具是 `vidir`。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[geekpi]（https://github.com/geekpi）
校对：[校对者ID]（https://github.com/校对者ID）

本文由 [LCTT]（https://github.com/LCTT/TranslateProject） 原创编译，[Linux中国]（https://linux.cn/） 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/b0rk/status/1513903221466664962
[2]: https://github.com/ibraheemdev/modern-unix
[3]: https://github.com/BurntSushi/ripgrep/
[4]: https://github.com/ggreer/the_silver_searcher
[5]: https://github.com/beyondgrep/ack3
[6]: https://github.com/ogham/exa
[7]: https://github.com/Peltoche/lsd
[8]: https://mosh.org/
[9]: https://github.com/sharkdp/bat
[10]: https://github.com/dandavison/delta
[11]: https://github.com/sharkdp/fd
[12]: https://www.nlnetlabs.nl/projects/ldns/about/
[13]: https://github.com/ogham/dog
[14]: https://github.com/muesli/duf
[15]: https://github.com/bootandy/dust
[16]: https://www.pgcli.com/
[17]: https://github.com/ClementTsang/bottom
[18]: https://github.com/aristocratos/btop
[19]: https://github.com/nicolargo/glances
[20]: https://github.com/aksakalli/gtop
[21]: https://github.com/bvaisvil/zenith
[22]: https://tldr.sh/
[23]: https://github.com/chmln/sd
[24]: https://github.com/Wilfred/difftastic
[25]: https://plocate.sesse.net/
[26]: https://github.com/sharkdp/hexyl
[27]: https://github.com/rupa/z
[28]: https://github.com/clvv/fasd
[29]: https://github.com/wting/autojump
[30]: https://github.com/ajeetdsouza/zoxide
[31]: https://github.com/Canop/broot
[32]: https://github.com/jarun/nnn
[33]: https://github.com/ranger/ranger
[34]: https://github.com/direnv/direnv
[35]: https://github.com/junegunn/fzf
[36]: https://github.com/peco/peco
[37]: https://github.com/schollz/croc
[38]: https://github.com/magic-wormhole/magic-wormhole
[39]: https://github.com/sharkdp/hyperfine
[40]: https://httpie.io/
[41]: https://github.com/rs/curlie
[42]: https://github.com/ducaale/xh
[43]: https://github.com/eradman/entr
[44]: https://github.com/asdf-vm/asdf
[45]: https://github.com/jonas/tig
[46]: https://github.com/jesseduffield/lazygit
[47]: https://github.com/jesseduffield/lazydocker
[48]: https://github.com/theryangeary/choose
[49]: https://github.com/bcicen/ctop
[50]: https://github.com/nvbn/thefuck
[51]: https://tmate.io/
[52]: https://github.com/tstack/lnav
[53]: https://github.com/rcoh/angle-grinder
[54]: https://github.com/visit1985/mdp
[55]: https://github.com/charmbracelet/glow
[56]: https://stackoverflow.com/questions/5130968/how-can-i-copy-the-output-of-a-command-directly-into-my-clipboard/41843618#41843618
[57]: https://stedolan.github.io/jq/
[58]: https://github.com/kellyjonbrazil/jc
[59]: https://github.com/jpmens/jo
[60]: https://github.com/mikefarah/yq
[61]: https://github.com/kislyuk/yq
[62]: https://github.com/wader/fq
[63]: https://github.com/mgdm/htmlq
[64]: https://github.com/antonmedv/fx
[65]: https://github.com/PaulJuliusMartinez/jless
[66]: https://github.com/BurntSushi/xsv
[67]: https://www.visidata.org/
[68]: https://github.com/johnkerl/miller
[69]: https://pdfgrep.org/
[70]: https://github.com/tomnomnom/gron
[71]: https://github.com/phiresky/ripgrep-all
[72]: https://joeyh.name/code/moreutils
