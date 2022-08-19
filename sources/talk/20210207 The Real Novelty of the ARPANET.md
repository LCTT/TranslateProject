[#]: collector: (lujun9972)
[#]: translator: (aREversez)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Real Novelty of the ARPANET)
[#]: via: (https://twobithistory.org/2021/02/07/arpanet.html)
[#]: author: (Two-Bit History https://twobithistory.org)

The Real Novelty of the ARPANET
======

If you run an image search for the word “ARPANET,” you will find lots of maps showing how the [government research network][1] expanded steadily across the country throughout the late ’60s and early ’70s. I’m guessing that most people reading or hearing about the ARPANET for the first time encounter one of these maps.

Obviously, the maps are interesting—it’s hard to believe that there were once so few networked computers that their locations could all be conveyed with what is really pretty lo-fi cartography. (We’re talking 1960s overhead projector diagrams here. You know the vibe.) But the problem with the maps, drawn as they are with bold lines stretching across the continent, is that they reinforce the idea that the ARPANET’s paramount achievement was connecting computers across the vast distances of the United States for the first time.

Today, the internet is a lifeline that keeps us tethered to each other even as an airborne virus has us all locked up indoors. So it’s easy to imagine that, if the ARPANET was the first draft of the internet, then surely the world that existed before it was entirely disconnected, since that’s where we’d be without the internet today, right? The ARPANET must have been a big deal because it connected people via computers when that hadn’t before been possible.

That view doesn’t get the history quite right. It also undersells what made the ARPANET such a breakthrough.

### The Debut

The Washington Hilton stands near the top of a small rise about a mile and a half northeast of the National Mall. Its two white-painted modern facades sweep out in broad semicircles like the wings of a bird. The New York Times, reporting on the hotel’s completion in 1965, remarked that the building looks “like a sea gull perched on a hilltop nest.”[1][2]

The hotel hides its most famous feature below ground. Underneath the driveway roundabout is an enormous ovoid event space known as the International Ballroom, which was for many years the largest pillar-less ballroom in DC. In 1967, the Doors played a concert there. In 1968, Jimi Hendrix also played a concert there. In 1972, a somewhat more sedate act took over the ballroom to put on the inaugural International Conference on Computing Communication, where a promising research project known as the ARPANET was demonstrated publicly for the first time.

The 1972 ICCC, which took place from October 24th to 26th, was attended by about 800 people.[2][3] It brought together all of the leading researchers in the nascent field of computer networking. According to internet pioneer Bob Kahn, “if somebody had dropped a bomb on the Washington Hilton, it would have destroyed almost all of the networking community in the US at that point.”[3][4]

Not all of the attendees were computer scientists, however. An advertisement for the conference claimed it would be “user-focused” and geared toward “lawyers, medical men, economists, and government men as well as engineers and communicators.”[4][5] Some of the conference’s sessions were highly technical, such as the session titled “Data Network Design Problems I” and its sequel session, “Data Network Design Problems II.” But most of the sessions were, as promised, focused on the potential social and economic impacts of computer networking. One session, eerily prescient today, sought to foster a discussion about how the legal system could act proactively “to safeguard the right of privacy in the computer data bank.”[5][6]

The ARPANET demonstration was intended as a side attraction of sorts for the attendees. Between sessions, which were held either in the International Ballroom or elsewhere on the lower level of the hotel, attendees were free to wander into the Georgetown Ballroom (a smaller ballroom/conference room down the hall from the big one),[6][7] where there were 40 terminals from a variety of manufacturers set up to access the ARPANET.[7][8] These terminals were dumb terminals—they only handled input and output and could do no computation on their own. (In fact, in 1972, it’s likely that all of these terminals were hardcopy terminals, i.e. teletype machines.) The terminals were all hooked up to a computer known as a Terminal Interface Message Processor or TIP, which sat on a raised platform in the middle of the room. The TIP was a kind of archaic router specially designed to connect dumb terminals to the ARPANET. Using the terminals and the TIP, the ICCC attendees could experiment with logging on and accessing some of the computers at the 29 host sites then comprising the ARPANET.[8][9]

To exhibit the network’s capabilities, researchers at the host sites across the country had collaborated to prepare 19 simple “scenarios” for users to experiment with. These scenarios were compiled into [a booklet][10] that was handed to conference attendees as they tentatively approached the maze of wiring and terminals.[9][11] The scenarios were meant to prove that the new technology worked but also that it was useful, because so far the ARPANET was “a highway system without cars,” and its Pentagon funders hoped that a public demonstration would excite more interest in the network.[10][12]

The scenarios thus showed off a diverse selection of the software that could be accessed over the ARPANET: There were programming language interpreters, one for a Lisp-based language at MIT and another for a numerical computing environment called Speakeasy hosted at UCLA; there were games, including a chess program and an implementation of Conway’s Game of Life; and—perhaps most popular among the conference attendees—there were several AI chat programs, including the famous ELIZA chat program developed at MIT by Joseph Weizenbaum.

The researchers who had prepared the scenarios were careful to list each command that users were expected to enter at their terminals. This was especially important because the sequence of commands used to connect to any given ARPANET host could vary depending on the host in question. To experiment with the AI chess program hosted on the MIT Artificial Intelligence Laboratory’s PDP-10 minicomputer, for instance, conference attendees were instructed to enter the following:

_`[LF]`, `[SP]`, and `[CR]` below stand for the line feed, space, and carriage return keys respectively. I’ve explained each command after `//`, but this syntax was not used for the annotations in the original._

```
@r [LF]                   // Reset the TIP
@e [SP] r [LF]            // "Echo remote" setting, host echoes characters rather than TIP
@L [SP] 134 [LF]          // Connect to host number 134
:login [SP] iccXXX [CR]   // Login to the MIT AI Lab's system, where "XXX" should be user's initials
:chess [CR]               // Start chess program
```

If conference attendees were successfully able to enter those commands, their reward was the opportunity to play around with some of the most cutting-edge chess software available at the time, where the layout of the board was represented like this:

```
BR BN BB BQ BK BB BN BR
BP BP BP BP ** BP BP BP
-- ** -- ** -- ** -- **
** -- ** -- BP -- ** --
-- ** -- ** WP ** -- **
** -- ** -- ** -- ** --
WP WP WP WP -- WP WP WP
WR WN WB WQ WK WB WN WR
```

In contrast, to connect to UCLA’s IBM System/360 and run the Speakeasy numerical computing environment, conference attendees had to enter the following:

```
@r [LF]                   // Reset the TIP
@t [SP] o [SP] L [LF]     // "Transmit on line feed" setting
@i [SP] L [LF]            // "Insert line feed" setting, i.e. send line feed with each carriage return
@L [SP] 65 [LF]           // Connect to host number 65
tso                       // Connect to IBM Time-Sharing Option system
logon [SP] icX [CR]       // Log in with username, where "X" should be a freely chosen digit
iccc [CR]                 // This is the password (so secure!)
speakez [CR]              // Start Speakeasy
```

Successfully running that gauntlet gave attendees the power to multiply and transpose and do other operations on matrices as quickly as they could input them at their terminal:

```
:+! a=m*transpose(m);a [CR]
:+! eigenvals(a) [CR]
```

Many of the attendees were impressed by the demonstration, but not for the reasons that we, from our present-day vantage point, might assume. The key piece of context hard to keep in mind today is that, in 1972, being able to use a computer remotely, even from a different city, was not new. Teletype devices had been used to talk to distant computers for decades already. Almost a full five years before the ICCC, Bill Gates was in a Seattle high school using a teletype to run his first BASIC programs on a General Electric computer housed elsewhere in the city. Merely logging in to a host computer and running a few commands or playing a text-based game was routine. The software on display here was pretty neat, but the two scenarios I’ve told you about so far could ostensibly have been experienced without going over the ARPANET.

Of course, something new was happening under the hood. The lawyers, policy-makers, and economists at the ICCC might have been enamored with the clever chess program and the chat bots, but the networking experts would have been more interested in two other scenarios that did a better job of demonstrating what the ARPANET project had achieved.

The first of these scenarios involved a program called `NETWRK` running on MIT’s ITS operating system. The `NETWRK` command was the entrypoint for several subcommands that could report various aspects of the ARPANET’s operating status. The `SURVEY` subcommand reported which hosts on the network were functioning and available (they all fit on a single list), while the `SUMMARY.OF.SURVEY` subcommand aggregated the results of past `SURVEY` runs to report an “up percentage” for each host as well as how long, on average, it took for each host to respond to messages. The output of the `SUMMARY.OF.SURVEY` subcommand was a table that looked like this:

```
--HOST--  -#-  -%-UP-  -RESP-
UCLA-NMC  001  097%    00.80
SRI-ARC   002  068%    01.23
UCSB-75   003  059%    00.63
...
```

The host number field, as you can see, has room for no more than three digits (ha!). Other `NETWRK` subcommands allowed users to look at summary of survey results over a longer historical period or to examine the log of survey results for a single host.

The second of these scenarios featured a piece of software called the SRI-ARC Online System being developed at Stanford. This was a fancy piece of software with lots of functionality (it was the software system that Douglas Engelbart demoed in the “Mother of All Demos”), but one of the many things it could do was make use of what was essentially a file hosting service run on the host at UC Santa Barbara. From a terminal at the Washington Hilton, conference attendees could copy a file created at Stanford onto the host at UCSB simply by running a `copy` command and answering a few of the computer’s questions:

_`[ESC]`, `[SP]`, and `[CR]` below stand for the escape, space, and carriage return keys respectively. The words in parentheses are prompts printed by the computer. The escape key is used to autocomplete the filename on the third line. The file being copied here is called `<system>sample.txt;1`, where the trailing one indicates the file’s version number and `<system>` indicates the directory. This was a convention for filenames used by the TENEX operating system._[11][13]

```
@copy
(TO/FROM UCSB) to
(FILE) <system>sample [ESC] .TXT;1 [CR]
(CREATE/REPLACE) create
```

These two scenarios might not look all that different from the first two, but they were remarkable. They were remarkable because they made it clear that, on the ARPANET, humans could talk to computers but computers could also talk to _each other._ The `SURVEY` results collected at MIT weren’t collected by a human regularly logging in to each machine to check if it was up—they were collected by a program that knew how to talk to the other machines on the network. Likewise, the file transfer from Stanford to UCSB didn’t involve any humans sitting at terminals at either Stanford or UCSB—the user at a terminal in Washington DC was able to get the two computers to talk each other merely by invoking a piece of software. Even more, it didn’t matter which of the 40 terminals in the Ballroom you were sitting at, because you could view the MIT network monitoring statistics or store files at UCSB using any of the terminals with almost the same sequence of commands.

This is what was totally new about the ARPANET. The ICCC demonstration didn’t just involve a human communicating with a distant computer. It wasn’t just a demonstration of remote I/O. It was a demonstration of software remotely communicating with other software, something nobody had seen before.

To really appreciate why it was this aspect of the ARPANET project that was important and not the wires-across-the-country, physical connection thing that the host maps suggest (the wires were leased phone lines anyhow and were already there!), consider that, before the ARPANET project began in 1966, the ARPA offices in the Pentagon had a terminal room. Inside it were three terminals. Each connected to a different computer; one computer was at MIT, one was at UC Berkeley, and another was in Santa Monica.[12][14] It was convenient for the ARPA staff that they could use these three computers even from Washington DC. But what was inconvenient for them was that they had to buy and maintain terminals from three different manufacturers, remember three different login procedures, and familiarize themselves with three different computing environments in order to use the computers. The terminals might have been right next to each other, but they were merely extensions of the host computing systems on the other end of the wire and operated as differently as the computers did. Communicating with a distant computer was possible before the ARPANET; the problem was that the heterogeneity of computing systems limited how sophisticated the communication could be.

### Come Together, Right Now

So what I’m trying to drive home here is that there is an important distinction between statement A, “the ARPANET connected people in different locations via computers for the first time,” and statement B, “the ARPANET connected computer systems to each other for the first time.” That might seem like splitting hairs, but statement A elides some illuminating history in a way that statement B does not.

To begin with, the historian Joy Lisi Rankin has shown that people were socializing in cyberspace well before the ARPANET came along. In _A People’s History of Computing in the United States_, she describes several different digital communities that existed across the country on time-sharing networks prior to or apart from the ARPANET. These time-sharing networks were not, technically speaking, computer networks, since they consisted of a single mainframe computer running computations in a basement somewhere for many dumb terminals, like some portly chthonic creature with tentacles sprawling across the country. But they nevertheless enabled most of the social behavior now connoted by the word “network” in a post-Facebook world. For example, on the Kiewit Network, which was an extension of the Dartmouth Time-Sharing System to colleges and high schools across the Northeast, high school students collaboratively maintained a “gossip file” that allowed them to keep track of the exciting goings-on at other schools, “creating social connections from Connecticut to Maine.”[13][15] Meanwhile, women at Mount Holyoke College corresponded with men at Dartmouth over the network, perhaps to arrange dates or keep in touch with boyfriends.[14][16] This was all happening in the 1960s. Rankin argues that by ignoring these early time-sharing networks we impoverish our understanding of how American digital culture developed over the last 50 years, leaving room for a “Silicon Valley mythology” that credits everything to the individual genius of a select few founding fathers.

As for the ARPANET itself, if we recognize that the key challenge was connecting the computer _systems_ and not just the physical computers, then that might change what we choose to emphasize when we tell the story of the innovations that made the ARPANET possible. The ARPANET was the first ever packet-switched network, and lots of impressive engineering went into making that happen. I think it’s a mistake, though, to say that the ARPANET was a breakthrough because it was the first packet-switched network and then leave it at that. The ARPANET was meant to make it easier for computer scientists across the country to collaborate; that project was as much about figuring out how different operating systems and programs written in different languages would interface with each other than it was about figuring out how to efficiently ferry data back and forth between Massachusetts and California. So the ARPANET was the first packet-switched network, but it was also an amazing standards success story—something I find especially interesting given [how][17] [many][18] [times][19] I’ve written about failed standards on this blog.

Inventing the protocols for the ARPANET was an afterthought even at the time, so naturally the job fell to a group made up largely of graduate students. This group, later known as the Network Working Group, met for the first time at UC Santa Barbara in August of 1968.[15][20] There were 12 people present at that first meeting, most of whom were representatives from the four universities that were to be the first host sites on the ARPANET when the equipment was ready.[16][21] Steve Crocker, then a graduate student at UCLA, attended; he told me over a Zoom call that it was all young guys at that first meeting, and that Elmer Shapiro, who chaired the meeting, was probably the oldest one there at around 38. ARPA had not put anyone in charge of figuring out how the computers would communicate once they were connected, but it was obvious that some coordination was necessary. As the group continued to meet, Crocker kept expecting some “legitimate adult” with more experience and authority to fly out from the East Coast to take over, but that never happened. The Network Working Group had ARPA’s tacit approval—all those meetings involved lots of long road trips, and ARPA money covered the travel expenses—so they were it.[17][22]

The Network Working Group faced a huge challenge. Nobody had ever sat down to connect computer systems together in a general-purpose way; that flew against all of the assumptions that prevailed in computing in the late 1960s:

> The typical mainframe of the period behaved as if it were the only computer in the universe. There was no obvious or easy way to engage two diverse machines in even the minimal communication needed to move bits back and forth. You could connect machines, but once connected, what would they say to each other? In those days a computer interacted with devices that were attached to it, like a monarch communicating with his subjects. Everything connected to the main computer performed a specific task, and each peripheral device was presumed to be ready at all times for a fetch-my-slippers type command…. Computers were strictly designed for this kind of interaction; they send instructions to subordinate card readers, terminals, and tape units, and they initiate all dialogues. But if another device in effect tapped the computer on the shoulder with a signal and said, “Hi, I’m a computer too,” the receiving machine would be stumped.[18][23]

As a result, the Network Working Group’s progress was initially slow.[19][24] The group did not settle on an “official” specification for any protocol until June, 1970, nearly two years after the group’s first meeting.[20][25]

But by the time the ARPANET was to be shown off at the 1972 ICCC, all the key protocols were in place. A scenario like the chess scenario exercised many of them. When a user ran the command `@e r`, short for `@echo remote`, that instructed the TIP to make use of a facility in the new TELNET virtual teletype protocol to inform the remote host that it should echo the user’s input. When a user then ran the command `@L 134`, short for `@login 134`, that caused the TIP to invoke the Initial Connection Protocol with host 134, which in turn would cause the remote host to allocate all the necessary resources for the connection and drop the user into a TELNET session. (The file transfer scenario I described may well have made use of the File Transfer Protocol, though that protocol was only ready shortly before the conference.[21][26]) All of these protocols were known as “level three” protocols, and below them were the host-to-host protocol at level two (which defined the basic format for the messages the hosts should expect from each other), and the host-to-IMP protocol at level one (which defined how hosts communicated with the routing equipment they were linked to). Incredibly, the protocols all worked.

In my view, the Network Working Group was able to get everything together in time and just generally excel at its task because it adopted an open and informal approach to standardization, as exemplified by the famous Request for Comments (RFC) series of documents. These documents, originally circulated among the members of the Network Working Group by snail mail, were a way of keeping in touch between meetings and soliciting feedback to ideas. The “Request for Comments” framing was suggested by Steve Crocker, who authored the first RFC and supervised the RFC mailing list in the early years, in an attempt to emphasize the open-ended and collaborative nature of what the group was trying to do. That framing, and the availability of the documents themselves, made the protocol design process into a melting pot of contributions and riffs on other people’s contributions where the best ideas could emerge without anyone losing face. The RFC process was a smashing success and is still used to specify internet standards today, half a century later.

It’s this legacy of the Network Working Group that I think we should highlight when we talk about ARPANET’s impact. Though today one of the most magical things about the internet is that it can connect us with people on the other side of the planet, it’s only slightly facetious to say that that technology has been with us since the 19th century. Physical distance was conquered well before the ARPANET by the telegraph. The kind of distance conquered by the ARPANET was instead the logical distance between the operating systems, character codes, programming languages, and organizational policies employed at each host site. Implementing the first packet-switched network was of course a major feat of engineering that should also be mentioned, but the problem of agreeing on standards to connect computers that had never been designed to play nice with each other was the harder of the two big problems involved in building the ARPANET—and its solution was the most miraculous part of the ARPANET story.

In 1981, ARPA issued a “Completion Report” reviewing the first decade of the ARPANET’s history. In a section with the belabored title, “Technical Aspects of the Effort Which Were Successful and Aspects of the Effort Which Did Not Materialize as Originally Envisaged,” the authors wrote:

> Possibly the most difficult task undertaken in the development of the ARPANET was the attempt—which proved successful—to make a number of independent host computer systems of varying manufacture, and varying operating systems within a single manufactured type, communicate with each other despite their diverse characteristics.[22][27]

There you have it from no less a source than the federal government of the United States.

_If you enjoyed this post, more like it come out every four weeks! Follow [@TwoBitHistory][28] on Twitter or subscribe to the [RSS feed][29] to make sure you know when a new post is out._

_Previously on TwoBitHistory…_

> It's been too long, I know, but I finally got around to writing a new post. This one is about how REST APIs should really be known as FIOH APIs instead (Fuck It, Overload HTTP):<https://t.co/xjMZVZgsEz>
>
> — TwoBitHistory (@TwoBitHistory) [June 28, 2020][30]

  1. “Hilton Hotel Opens in Capital Today.” _The New York Times_, 20 March 1965, <https://www.nytimes.com/1965/03/20/archives/hilton-hotel-opens-in-capital-today.html?searchResultPosition=1>. Accessed 7 Feb. 2021. [↩︎][31]

  2. James Pelkey. _Entrepreneurial Capitalism and Innovation: A History of Computer Communications 1968-1988,_ Chapter 4, Section 12, 2007, <http://www.historyofcomputercommunications.info/Book/4/4.12-ICCC%20Demonstration71-72.html>. Accessed 7 Feb. 2021. [↩︎][32]

  3. Katie Hafner and Matthew Lyon. _Where Wizards Stay Up Late: The Origins of the Internet_. New York, Simon &amp; Schuster, 1996, p. 178. [↩︎][33]

  4. “International Conference on Computer Communication.” _Computer_, vol. 5, no. 4, 1972, p. c2, <https://www.computer.org/csdl/magazine/co/1972/04/01641562/13rRUxNmPIA>. Accessed 7 Feb. 2021. [↩︎][34]

  5. “Program for the International Conference on Computer Communication.” _The Papers of Clay T. Whitehead_, Box 42, <https://d3so5znv45ku4h.cloudfront.net/Box+042/013_Speech-International+Conference+on+Computer+Communications,+Washington,+DC,+October+24,+1972.pdf>. Accessed 7 Feb. 2021. [↩︎][35]

  6. It’s actually not clear to me which room was used for the ARPANET demonstration. Lots of sources talk about a “ballroom,” but the Washington Hilton seems to consider the room with the name “Georgetown” more of a meeting room. So perhaps the demonstration was in the International Ballroom instead. But RFC 372 alludes to a booking of the “Georgetown Ballroom” for the demonstration. A floorplan of the Washington Hilton can be found [here][36]. [↩︎][37]

  7. Hafner, p. 179. [↩︎][38]

  8. ibid., p. 178. [↩︎][39]

  9. Bob Metcalfe. “Scenarios for Using the ARPANET.” _Collections-Computer History Museum_, <https://www.computerhistory.org/collections/catalog/102784024>. Accessed 7 Feb. 2021. [↩︎][40]

  10. Hafner, p. 176. [↩︎][41]

  11. Robert H. Thomas. “Planning for ACCAT Remote Site Operations.” BBN Report No. 3677, October 1977, <https://apps.dtic.mil/sti/pdfs/ADA046366.pdf>. Accessed 7 Feb. 2021. [↩︎][42]

  12. Hafner, p. 12. [↩︎][43]

  13. Joy Lisi Rankin. _A People’s History of Computing in the United States_. Cambridge, MA, Harvard University Press, 2018, p. 84. [↩︎][44]

  14. Rankin, p. 93. [↩︎][45]

  15. Steve Crocker. Personal interview. 17 Dec. 2020. [↩︎][46]

  16. Crocker sent me the minutes for this meeting. The document lists everyone who attended. [↩︎][47]

  17. Steve Crocker. Personal interview. [↩︎][48]

  18. Hafner, p. 146. [↩︎][49]

  19. “Completion Report / A History of the ARPANET: The First Decade.” BBN Report No. 4799, April 1981, <https://walden-family.com/bbn/arpanet-completion-report.pdf>, p. II-13. [↩︎][50]

  20. I’m referring here to RFC 54, “Official Protocol Proffering.” [↩︎][51]

  21. Hafner, p. 175. [↩︎][52]

  22. “Completion Report / A History of the ARPANET: The First Decade,” p. II-29. [↩︎][53]




--------------------------------------------------------------------------------

via: https://twobithistory.org/2021/02/07/arpanet.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[aREversez](https://github.com/aREversez)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/ARPANET
[2]: tmp.pnPpRrCI3S#fn:1
[3]: tmp.pnPpRrCI3S#fn:2
[4]: tmp.pnPpRrCI3S#fn:3
[5]: tmp.pnPpRrCI3S#fn:4
[6]: tmp.pnPpRrCI3S#fn:5
[7]: tmp.pnPpRrCI3S#fn:6
[8]: tmp.pnPpRrCI3S#fn:7
[9]: tmp.pnPpRrCI3S#fn:8
[10]: https://archive.computerhistory.org/resources/access/text/2019/07/102784024-05-001-acc.pdf
[11]: tmp.pnPpRrCI3S#fn:9
[12]: tmp.pnPpRrCI3S#fn:10
[13]: tmp.pnPpRrCI3S#fn:11
[14]: tmp.pnPpRrCI3S#fn:12
[15]: tmp.pnPpRrCI3S#fn:13
[16]: tmp.pnPpRrCI3S#fn:14
[17]: https://twobithistory.org/2018/05/27/semantic-web.html
[18]: https://twobithistory.org/2018/12/18/rss.html
[19]: https://twobithistory.org/2020/01/05/foaf.html
[20]: tmp.pnPpRrCI3S#fn:15
[21]: tmp.pnPpRrCI3S#fn:16
[22]: tmp.pnPpRrCI3S#fn:17
[23]: tmp.pnPpRrCI3S#fn:18
[24]: tmp.pnPpRrCI3S#fn:19
[25]: tmp.pnPpRrCI3S#fn:20
[26]: tmp.pnPpRrCI3S#fn:21
[27]: tmp.pnPpRrCI3S#fn:22
[28]: https://twitter.com/TwoBitHistory
[29]: https://twobithistory.org/feed.xml
[30]: https://twitter.com/TwoBitHistory/status/1277259930555363329?ref_src=twsrc%5Etfw
[31]: tmp.pnPpRrCI3S#fnref:1
[32]: tmp.pnPpRrCI3S#fnref:2
[33]: tmp.pnPpRrCI3S#fnref:3
[34]: tmp.pnPpRrCI3S#fnref:4
[35]: tmp.pnPpRrCI3S#fnref:5
[36]: https://www3.hilton.com/resources/media/hi/DCAWHHH/en_US/pdf/DCAWH.Floorplans.Apr25.pdf
[37]: tmp.pnPpRrCI3S#fnref:6
[38]: tmp.pnPpRrCI3S#fnref:7
[39]: tmp.pnPpRrCI3S#fnref:8
[40]: tmp.pnPpRrCI3S#fnref:9
[41]: tmp.pnPpRrCI3S#fnref:10
[42]: tmp.pnPpRrCI3S#fnref:11
[43]: tmp.pnPpRrCI3S#fnref:12
[44]: tmp.pnPpRrCI3S#fnref:13
[45]: tmp.pnPpRrCI3S#fnref:14
[46]: tmp.pnPpRrCI3S#fnref:15
[47]: tmp.pnPpRrCI3S#fnref:16
[48]: tmp.pnPpRrCI3S#fnref:17
[49]: tmp.pnPpRrCI3S#fnref:18
[50]: tmp.pnPpRrCI3S#fnref:19
[51]: tmp.pnPpRrCI3S#fnref:20
[52]: tmp.pnPpRrCI3S#fnref:21
[53]: tmp.pnPpRrCI3S#fnref:22
