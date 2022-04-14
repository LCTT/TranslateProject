[#]: subject: "A list of new(ish) command line tools"
[#]: via: "https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A list of new(ish) command line tools
======

Hello! Today I asked [on twitter][1] about newer command line tools, like `ripgrep` and `fd` and `fzf` and `exa` and `bat`.

I got a bunch of replies with tools I hadn’t heard of, so I thought I’d make a list here. A lot of people also pointed at the [modern-unix][2] list.

### replacements for standard tools

  * [ripgrep][3], [ag][4], [ack][5] (grep)
  * [exa][6], [lsd][7] (ls)
  * [mosh][8] (ssh)
  * [bat][9] (cat)
  * [delta][10] (a pager for git)
  * [fd][11] (find)
  * [drill][12], [dog][13] (dig)
  * [duf][14] (df)
  * [dust][15], ncdu (du)
  * [pgcli][16] (psql)
  * [btm][17], [btop][18], [glances][19], [gtop][20], [zenith][21] (top)
  * [tldr][22] (man, sort of)
  * [sd][23] (sed)
  * [difftastic][24] (diff)
  * mtr (traceroute)
  * [plocate][25] (locate)
  * xxd, [hexyl][26] (hexdump)



### new inventions

Here are some tools that are not exactly replacements for standard tools:

  * [z][27], [fasd][28], [autojump][29], [zoxide][30] (tools to make it easier to find files / change directories)
  * [broot][31], [nnn][32], [ranger][33] (file manager)
  * [direnv][34] (load environment variables depending on the current directory)
  * [fzf][35], [peco][36] (“fuzzy finder”)
  * [croc][37] and [magic-wormhole][38] (send files from one computer to another)
  * [hyperfine][39] (benchmarking)
  * [httpie][40], [curlie][41], [xh][42] (for making HTTP requests)
  * [entr][43] (run arbitrary commands when files change)
  * [asdf][44] (version manager for multiple languages)
  * [tig][45], [lazygit][46] (interactive interfaces for git)
  * [lazydocker][47] (interactive interface for docker)
  * [choose][48] (the basics of awk/cut)
  * [ctop][49] (top for containers)
  * [fuck][50] (autocorrect command line errors)
  * [tmate][51] (share your terminal with a friend)
  * [lnav][52], [angle-grinder][53] (tools for managing logs)
  * [mdp][54], [glow][55] (ways to display markdown in the terminal)
  * pbcopy/pbpaste (for clipboard <> stdin/stdout) maybe aren’t “new” but were mentioned a lot. You can [use xclip][56] to do the same thing on Linux.



**JSON/YAML/CSV things:**

  * [jq][57] (a great JSON-wrangling tool)
  * [jc][58] (convert various tools’ output into JSON)
  * [jo][59] (create JSON objects)
  * [yq][60] (like `jq`, but for YAML). there’s also [another yq][61]
  * [fq][62] (like `jq`, but for binary)
  * [htmlq][63] (like `jq`, but for HTML)
  * [fx][64] (interactive json tool)
  * [jless][65] (json pager)
  * [xsv][66] (a command line tool for csv files, from burntsushi)
  * [visidata][67] (“an interactive multitool for tabular data”)
  * [miller][68] (“like awk/sed/cut/join/sort for CSV/TSV/JSON/JSON lines”)



**grep things:**

  * [pdfgrep][69] (grep for PDF)
  * [gron][70] (make JSON greppable)
  * [ripgrep-all][71] (ripgrep, but also PDF, zip, ebooks, etc)



### less-new tools

Here are a few of not-so-new tools folks mentioned aren’t that well known:

  * pv (“pipe viewer”, gives you a progress bar for a pipe)
  * vidir (from [moreutils][72], lets you batch rename/delete files in vim)
  * sponge, ts, parallel (also from moreutils)



### some of my favourites

My favourites of these that I use already are `entr`, `ripgrep`, `git-delta`, `httpie`, `plocate`, and `jq`.

I’m interested in trying out `direnv`, `btm`, `z`, `xsv`, and `duf`, but I think the most exciting tool I learned about is `vidir`.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

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
