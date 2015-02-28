Chess in a Few Bytes
================================================================================
I am showing my age by mentioning that my introduction to computing was a ZX81, a home computer produced by a UK developer (Sinclair Research) which had a whopping 1KB of RAM. The 1KB is not a typographical error, the home computer really shipped with a mere 1KB of onboard memory. But this memory limitation did not prevent enthusiasts producing a huge variety of software. In fact the machine sparked a generation of programming wizards who were forced to get to grips with its workings. The machine was upgradable with a 16KB RAM pack which offered so many more coding possibilities. But the unexpanded 1KB machine still inspired programmers to release remarkable software.

![1K ZX Chess ](http://www.linuxlinks.com/portal/content2/reviews/Games2/1KZXChess.jpg)

My favourite ZX81 games were Flight Simulation, 3D Monster Maze, Galaxians, and above all 1K ZX Chess. Only the latter was written for the unexpanded ZX81. In fact, David Horne's 1K ZX Chess was coded in a mere 672 bytes of RAM. However, the game managed to implement most chess rules, and offer a computer opponent. While some important rules were omitted (castling, pawn promotion, and en passant capture), it was still amazing to be able to play against artificial intelligence. The game took up a fair chunk of my misspent youth.

1K ZX Chess remained the smallest implementation of chess on any computer for 33 years until the record was broken by BootChess this year, and subsequently by Toledo AtomChess. These three games do not implement all of the chess rules, so for completeness I have included my favourite small implementation of chess that implements a complete set of chess rules.

Linux has a good range of extremely strong chess engines such as Stockfish, Critter, Togo II, Crafty, GNU Chess, and Komodo. The chess engines featured in this article offer no match to a good chess engine, but they show how much can be achieved with a minuscule codebase.

----------

![](http://www.linuxlinks.com/portal/content2/png/ToledoAtomchess.png)

![](http://www.linuxlinks.com/portal/content/reviews/Games2/Screenshot-Toledo.png)

You may have seen a considerable amount of press coverage about BootChess, a chess program written in 487 bytes of code, smashing the record of the then smallest chess program, 1K ZX Chess. Óscar Toledo Gutiérrez took up the mantle and decided to code an even more compact chess game. Toledo Atomchess is a mere 481 bytes of x86 assembly code which fits in a boot sector. The engine plays a reasonable game of chess given the limitations of its incredibly small codebase.

Features include:

- Basic chess movements
- ASCII text representation of chess board
- Moves are entered in algebraic form
- Search depth of 3-ply

Obviously, to fit the chess of game into 481 bytes, the author had to make some sacrifices. These limitations include:

- No promotion of pawns
- No castling
- No en passant
- No move validation

The author has also written chess programs in C, JavaScript and Java; each are very small implementations of chess.

- Website: [nanochess.org/chess6.html][1]
- Developer: Óscar Toledo Gutiérrez
- License: Free for non-commercial use
- Version Number: -

----------

![](http://www.linuxlinks.com/portal/content2/png/BootChess.png)

![](http://www.linuxlinks.com/portal/content/reviews/Games2/Screenshot-BootChess.png)

BootChess is an extremely small computer implementation of chess. The game is crammed into a mere 487 bytes and runs on Windows, Mac OS X and Linux operating systems. The board and pieces of BootChess are represented by text alone, with P representing pawns, Q used for the queens and full stops entered for empty squares.

Features include:

- Graphic text representation of chess board and use input
- Bootsector sized (512 bytes) with a playable chess game
- x86 bios hardware only bootstrap (no software dependencies)
- All main legal moves including double square pawn start
- Pawn promotion to queen (contrary to 1k ZX Chess)
- CPU artificial intelligence called taxiMax > minMax half-ply
- Hard-coded Spanish white pieces opening

Again, there are some important limitations. Omissions include:

- Under-promotion
- En passant pawn capture
- No castling
- 3-repetition rule
- 50 move draw rule
- No opening or closing books
- One or more minMax/negaMax full plies for artificial intelligence

- Website: [www.pouet.net/prod.php?which=64962][2]
- Developer: Olivier "Baudsurfer/RSi" Poudade
- License: WTFPL v2
- Version Number: .02

----------

![](http://www.linuxlinks.com/portal/content2/png/Micro-Max.png)

![](http://www.linuxlinks.com/portal/content/reviews/Games2/Screenshot-Micro-Max.png)

Micro-Max is a 133-line chess source which is written in C

The author has implemented a (hash) transposition table, the engine checks the legality of the input moves, and full FIDE rules except for for under-promotions.

Features include:

- Recursive negamax search
- Quiescence search with recaptures
- Recapture extensions
- Iterative deepening
- Best-move-first 'sorting'
- Hash table storing score and best move
- Full FIDE rules (except under promotion) and move-legality checking

There is also a stripped-down 1433-character version, but allowing you to play under-promotions for full FIDE-rule compliance.

- Website: [home.hccnet.nl/h.g.muller/max-src2.html][3]
- Developer: Harm Geert Muller
- License: The MIT License
- Version Number: 3.2

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20150222033906262/ChessBytes.html

作者：Frazer Kline
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://nanochess.org/chess6.html
[2]:http://www.pouet.net/prod.php?which=64962
[3]:http://home.hccnet.nl/h.g.muller/max-src2.html