[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Music composition with Python and Linux)
[#]: via: (https://opensource.com/article/20/2/linux-open-source-music)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Music composition with Python and Linux
======
A chat with Mr. MAGFest—Brendan Becker.
![Wires plugged into a network switch][1]

I met Brendan Becker working in a computer store in 1999. We both enjoyed building custom computers and installing Linux on them. Brendan was always involved in several technology projects at once, ranging from game coding to music composition. Fast-forwarding a few years from the days of computer stores, he went on to write [pyDance][2], an open source implementation of multiple dancing games, and then became the CEO of music and gaming event [MAGFest][3]. Sometimes referred to as "Mr. MAGFest" because he was at the helm of the event, Brendan now uses the music pseudonym "[Inverse Phase][4]" as a composer of chiptunes—music predominantly made on 8-bit computers and game consoles.

I thought it would be interesting to interview him and ask some specifics about how he has benefited from Linux and open source software throughout his career.

![Inverse Phase performance photo][5]

Copyright Nickeledge, CC BY-SA 2.0.

### Alan Formy-Duval: How did you get started in computers and software?

Brendan Becker: There's been a computer in my household almost as far back as I can remember. My dad has fervently followed technology; he brought home a Compaq Portable when they first hit the market, and when he wasn't doing work on it, I would have access to it. Since I began reading at age two, using a computer became second nature to me—just read what it said on the disk, follow the instructions, and I could play games! Some of the time I would be playing with learning and education software, and we had a few disks full of games that I could play other times. I remember a single disk with a handful of free clones of popular titles. Eventually, my dad showed me that we could call other computers (BBS'ing at age 5!), and I saw where some of the games came from. One of the games I liked to play was written in BASIC, and all bets were off when I realized that I could simply modify the game by just reading a few things and re-typing them to make my game easier.

### Formy-Duval: This was the 1980s?

Becker: The Compaq Portable dropped in 1983 to give you a frame of reference. My dad had one of the first of that model.

### Formy-Duval: How did you get into Linux and open source software?

Becker: I was heavy into MODs and demoscene stuff in the early 90s, and I noticed that Walnut Creek ([cdrom.com][6]; now defunct) ran shop on FreeBSD. I was super curious about Unix and other operating systems in general, but didn't have much firsthand exposure, and thought it might be time to finally try something. DOOM had just released, and someone told me I might even be able to get it to run. Between that and being able to run cool internet servers, I started going down the rabbit hole. Someone saw me reading about FreeBSD and suggested I check out Linux, this new OS that was written from the ground up for x86, unlike BSD, which (they said) had some issues with compatibility. So, I joined #linuxhelp on undernet IRC and asked how to get started with Linux, pointing out that I had done a modicum of research (asking "what's the difference between Red Hat and Slackware?") and probing mainly about what would be easiest to use. The only person talking in the channel said that he was 13 years old and he could figure out Slackware, so I should not have an issue. A math teacher in my school gave me a hard disk, I downloaded the "A" disk sets and a boot disk, wrote it out, installed it, and didn't spend much time looking back.

### Formy-Duval: How'd you become known as Mr. MAGFest?

Becker: Well, this one is pretty easy. I became the acting head of MAGFest almost immediately after the first event. The former chairpeople were all going their separate ways, and I demanded the event not be canceled to the guy in charge. The solution was to run it myself, and that nickname became mine as I slowly molded the event into my own.

### Formy-Duval: I remember attending in those early days. How large did MAGFest eventually become?

Becker: The first MAGFest was 265 people. It is now a scary huge 20,000+ unique attendees.

### Formy-Duval: That is huge! Can you briefly describe the MAGFest convention?

Becker: One of my buddies, Hex, described it really well. He said, "It's like this video-game themed birthday party with all of your friends, but there happen to be a few thousand people there, and all of them can be your friends if you want, and then there are rock concerts." This was quickly adopted and shortened to "It's a four-day video game party with multiple video game rock concerts." Often the phrase "music and gaming festival" is all people need to get the idea.

### Formy-Duval: How did you make use of open source software in running MAGFest?

Becker: At the time I became the head of MAGFest, I had already written a game in Python, so I felt most comfortable also writing our registration system in Python. It was a pretty easy decision since there were no costs involved, and I already had the experience. Later on, our online registration system and rideshare interfaces were written in PHP/MySQL, and we used Kboard for our forums. Eventually, this evolved to us rolling our own registration system from scratch in Python, which we also use at the event, and running Drupal on the main website. At one point, I also wrote a system to manage the video room and challenge stations in Python. Oh, and we had a few game music listening stations that you could flip through tracks and liner notes of iconic game OSTs (Original Sound Tracks) and bands who played MAGFest.

### Formy-Duval: I understand that a few years ago you reduced your responsibilities at MAGFest to pursue new projects. What was your next endeavor?

Becker: I was always rather heavily into the game music scene and tried to bring as much of it to MAGFest as possible. As I became a part of those communities more and more, I wanted to participate. I wrote some medleys, covers, and arrangements of video game tunes using free, open source versions of the DOS and Windows demoscene tools that I had used before, which were also free but not necessarily open source. I released a few tracks in the first few years of running MAGFest, and then after some tough love and counseling from Jake Kaufman (also known as virt; Shovel Knight and Shantae are on his resume, among others), I switched gears to something I was much better at—chiptunes. Even though I had written PC speaker beeps and boops as a kid with my Compaq Portable and MOD files in the demoscene throughout the 90s, I released the first NES-spec track that I was truly proud to call my own in 2006. Several pop tributes and albums followed.

In 2010, I was approached by multiple individuals for game soundtrack work. Even though the soundtrack work didn't affect it much, I began to scale back some of my responsibilities with MAGFest more seriously, and in 2011, I decided to take a much larger step into the background. I would stay on the board as a consultant and help people learn what they needed to run their departments, but I was no longer at the helm. At the same time, my part-time job, which was paying the bills, laid off all of their workers, and I suddenly found myself with a lot of spare time. I began writing Pretty Eight Machine, a Nine Inch Nails tribute, which I spent over a year on, and between that and the game soundtrack work, I proved to myself that I could put food on the table (if only barely) with music, and this is what I wanted to do next.

###

![Inverse Phase CTM Tracker][7]

Copyright Inverse Phase, Used with permission.

### Formy-Duval: What is your workspace like in terms of hardware and software?

Becker: In my DOS/Windows days, I used mostly FastTracker 2. In Linux, I replaced that with SoundTracker (not Karsten Obarski's original, but a GTK rewrite; see [soundtracker.org][8]). These days, SoundTracker is in a state of flux—although I still need to try the new GTK3 version—but [MilkyTracker][9] is a good replacement when I can't use SoundTracker. Good old FastTracker 2 also runs in DOSBox, if I really need the original. This was when I started using Linux, however, so this is stuff I figured out 20-25 years ago.

Within the last ten years, I've gravitated away from sample-based music and towards chiptunes—music synthesized by old sound chips from 8- and 16-bit game systems and computers. There is a very good cross-platform tool called [Deflemask][10] to write music for a lot of these systems. A few of the systems I want to write music for aren't supported, though, and Deflemask is closed source, so I've begun building my own music composition environment from scratch with Python and [Pygame][11]. I maintain my code tree using Git and will control hardware synthesizer boards using open source [KiCad][12].

### Formy-Duval: What projects are you currently focused on?

Becker: I work on game soundtracks and music commissions off and on. While that's going on, I've also been working on starting an electronic entertainment museum called [Bloop][13]. We're doing a lot of cool things with archival and inventory, but perhaps the most exciting thing is that we've been building exhibits with Raspberry Pis. They're so versatile, and it's weird to think that, if I had tried to do this even ten years ago, I wouldn't have had small single-board computers to drive my exhibits; I probably would have bolted a laptop to the back of a flat-panel!

### Formy-Duval: There are a lot more game platforms coming to Linux now, such as Steam, Lutris, and Play-on-Linux. Do you think this trend will continue, and these are here to stay?

Becker: As someone who's been gaming on Linux for 25 years—in fact, I was brought to Linux _because_ of games—I think I find this question harder than most people would. I've been running Linux-native games for decades, and I've even had to eat my "either a Linux solution exists or can be written" words back in the day, but eventually, I did, and wrote a Linux game.

Real talk: Android's been out since 2008. If you've played a game on Android, you've played a game on Linux. Steam's been available for Linux for eight years. The Steambox/SteamOS was announced only a year after Steam. I don't hear a whole lot about Lutris or Play-on-Linux, but I know they exist and hope they succeed. I do see a pretty big following for GOG, and I think that's pretty neat. I see a lot of quality game ports coming out of people like Ryan Gordon (icculus) and Ethan Lee (flibitijibibo), and some companies even port in-house. Game engines like Unity and Unreal already support Linux. Valve has incorporated Proton into the Linux version of Steam for something like two years now, so now Linux users don't even have to search for Linux-native versions of their games.

I can say that I think most gamers expect and will continue to expect the level of support they're already receiving from the retail game market. Personally, I hope that level goes up and not down!

_Learn more about Brendan's work as [Inverse Phase][14]._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/linux-open-source-music

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
