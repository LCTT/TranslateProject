Translating by gitlilys

GOOGLE CHROME–ONE YEAR IN
========================================


Four weeks ago, emailed notice of a free massage credit revealed that I’ve been at Google for a year. Time flies when you’re [drinking from a firehose][3].

When I mentioned my anniversary, friends and colleagues from other companies asked what I’ve learned while working on Chrome over the last year. This rambling post is an attempt to answer that question.

### NON-MASKABLE INTERRUPTS

While I _started_ at Google just over a year ago, I haven’t actually _worked_ there for a full year yet. My second son (Nate) was born a few weeks early, arriving ten workdays after my first day of work.

I took full advantage of Google’s very generous twelve weeks of paternity leave, taking a few weeks after we brought Nate home, and the balance as spring turned to summer. In a year, we went from having an enormous infant to an enormous toddler who’s taking his first steps and trying to emulate everything his 3 year-old brother (Noah) does.

 ![Baby at the hospital](https://textplain.files.wordpress.com/2017/01/image55.png?w=318&h=468 "New Release") 

 ![First birthday cake](https://textplain.files.wordpress.com/2017/01/image56.png?w=484&h=466) 

I mention this because it’s had a huge impact on my work over the last year—_much_ more than I’d naively expected.

When Noah was born, I’d been at Telerik for [almost a year][4], and I’d been hacking on Fiddler alone for nearly a decade. I took a short paternity leave, and my coding hours shifted somewhat (I started writing code late at night between bottle feeds), but otherwise my work wasn’t significantly impacted.

As I pondered joining Google Chrome’s security team, I expected pretty much the same—a bit less sleep, a bit of scheduling awkwardness, but I figured things would fall into a good routine in a few months.

Things turned out somewhat differently.

Perhaps sensing that my life had become too easy, fate decided that 2016 was the year I’d get sick. _Constantly_. (Our theory is that Noah was bringing home germs from pre-school; he got sick a bunch too, but recovered quickly each time.) I was sick more days in 2016 than I was in the prior decade, including a month-long illness in the spring. _That_ ended with a bout of pneumonia that concluded with a doctor-mandated seven days away from the office. As I coughed my brains out on the sofa at home, I derived some consolation in thinking about Google’s generous life insurance package. But for the most part, my illnesses were minor—enough to keep me awake at night and coughing all day, but otherwise able to work.

Mathematically, you might expect two kids to be twice as much work as one, but in our experience, it hasn’t worked out that way. Instead, it varies between 80% (when the kids happily play together) to 400% (when they’re colliding like atoms in a runaway nuclear reactor). Thanks to my wife’s heroic efforts, we found a workable _daytime _routine. The nights, however, have been unexpectedly difficult. Big brother Noah is at an age where he usually sleeps through the night, but he’s sure to wake me up every morning at 6:30am sharp. Fortunately, Nate has been a pretty good sleeper, but even now, at just over a year old, he usually still wakes up and requires attention twice a night or so.

I can’t_ remember _the last time I had eight hours of sleep in a row. And that’s been _extremely _challenging… because I can’t remember _much else_ either. Learning new things when you don’t remember them the next day is a brutal, frustrating process.

When Noah was a baby, I could simply sleep in after a long night. Even if I didn’t get enough sleep, it wouldn’t really matter—I’d been coding in C# on Fiddler for a decade, and deadlines were few and far between. If all else failed, I’d just avoid working on any especially gnarly code and spend the day handling support requests, updating graphics, or doing other simple and straightforward grunt work from my backlog.

Things are much different on Chrome.

### ROLES

When I first started talking to the Chrome Security team about coming aboard, it was for a role on the Developer Advocacy team. I’d be driving HTTPS adoption across the web and working with big sites to unblock their migrations in any way I could. I’d already been doing the first half of that for fun (delivering [talks][5] at conferences like Codemash and [Velocity][6]), and I’d previously spent eight years as a Security Program Manager for the Internet Explorer team. I had _tons _of relevant experience. Easy peasy.

I interviewed for the Developer Advocate role. The hiring committee kicked back my packet and said I should interview as a Technical Program Manager instead.

I interviewed as a Technical Program Manager. The hiring committee kicked back my packet and said I should interview as a Developer Advocate instead.

The Chrome team resolved the deadlock by hiring me as a Senior Software Engineer (SWE).

I was initially _very _nervous about this, having not written any significant C++ code in over a decade—except for one [in-place replacement][7] of IE9’s caching logic which I’d coded as a PM because I couldn’t find a developer to do the work. But eventually I started believing in my own pep talk: _“I mean, how hard could it be, right? I’ve been troubleshooting code in web browsers for almost two decades now. I’m not a complete dummy. I’ll ramp up. It’ll be rough, but it’ll work out. Hell, I started writing Fiddler not knowing either C# nor HTTP, and _that _turned out pretty good. I’ll buy some books and get caught up. There’s no way that Google would have just hired me as a C++ developer without asking me any C++ coding questions if it wasn’t going to all be okay. Right? Right?!?”_

### THE FIREHOSE

I knew I had a lot to learn, and fast, but it took me a while to realize just how much else I didn’t know.

Google’s primary development platform is Linux, an OS that I would install every few years, play with for a day, then forget about. My new laptop was a Mac, a platform I’d used a bit more, but still one for which I was about a twentieth as proficient as I was on Windows. The Chrome Windows team made a half-hearted attempt to get me to join their merry band, but warned me honestly that some of the tooling wasn’t quite as good as it was on Linux and it’d probably be harder for me to get help. So I tried to avoid Windows for the first few months, ordering a puny Windows machine that took around four times longer to build Chrome than my obscenely powerful Linux box (with its 48 logical cores). After a few months, I gave up on trying to avoid Windows and started using it as my primary platform. I was more productive, but incredibly slow builds remained a problem for a few months. Everyone told me to just order _another_ obscenely powerful box to put next to my Linux one, but it felt wrong to have hardware at my desk that collectively cost more than my first car—especially when, at Microsoft, I bought all my own hardware. I eventually mentioned my cost/productivity dilemma to a manager, who noted I was getting paid a Google engineer’s salary and then politely asked me if I was just really terrible at math. I ordered a beastly Windows machine and now my builds scream. (To the extent that _any_ C++ builds can scream, of course. At Telerik, I was horrified when a full build of Fiddler slowed to a full 5 seconds on my puny Windows machine; my typical Chrome build today still takes about 15 minutes.)

Beyond learning different operating systems, I’d never used Google’s apps before (Docs/Sheets/Slides); luckily, I found these easy to pick up, although I still haven’t fully figured out how Google Drive file organization works. Google Docs, in particular, is so good that I’ve pretty much given up on Microsoft Word (which headed downhill after the 2010 version). Google Keep is a low-powered alternative to OneNote (which is, as far as I can tell, banned because it syncs to Microsoft servers) and I haven’t managed to get it to work well for my needs. Google Plus still hasn’t figured out how to support pasting of images via CTRL+V, a baffling limitation for something meant to compete in the space… hell, even _Microsoft Yammer _supports that, for gods sake. The only real downside to the web apps is that tab/window management on modern browsers is still a very much unsolved problem (but more on that in a bit).

But these speedbumps all pale in comparison to Gmail. Oh, Gmail. As a program manager at Microsoft, pretty much your _entire life _is in your inbox. After twelve years with Outlook and Exchange, switching to Gmail was a train wreck. “_What do you mean, there aren’t folders? How do I mark this message as low priority? Where’s the button to format text with strikethrough? What do you mean, I can’t drag an email to my calendar? What the hell does this Archive thing do? Where’s that message I was just looking at? Hell, where did my Gmail tab even go—it got lost in a pile of sixty other tabs across four top-level Chrome windows. WTH??? How does anyone get anything done?”_

### COMMUNICATION AND REMOTE WORK

While Telerik had an office in Austin, I didn’t interact with other employees very often, and when I did they were usually in other offices. I thought I had a handle on remote work, but I really didn’t. Working with a remote team on a daily basis is just _different_.

With communication happening over mail, IRC, Hangouts, bugs, document markup comments, GVC (video conferencing), G+, and discussion lists, it was often hard to [figure out which mechanisms to use][8], let alone which recipients to target. Undocumented pitfalls abounded (many discussion groups were essentially abandoned while others were unexpectedly broad; turning on chat history was deemed a “no-no” for document retention reasons).

It often it took a bit of research to even understand who various communication participants were and how they related to the projects at hand.

After years of email culture at Microsoft, I grew accustomed to a particular style of email, and Google’s is just _different._ Mail threads were long, with frequent additions of new recipients and many terse remarks. Many times, I’d reply privately to someone on a side thread, with a clarifying question, or suggesting a counterpoint to something they said. The response was often “_Hey, this just went to me. Mind adding on the main thread?_”

I’m working remotely, with peers around the world, so real-time communication with my team is essential. Some Chrome subteams use Hangouts, but the Security team largely uses IRC.

[
 ![XKCD comic on IRC](https://textplain.files.wordpress.com/2017/01/image30.png?w=1320&h=560 "https://xkcd.com/1782/") 
][9]

Now, I’ve been chatting with people online since BBSes were a thing (I’ve got a five digit ICQ number somewhere), but my knowledge of IRC was limited to the fact that it was a common way of taking over suckers’ machines with buffer overflows in the ‘90s. My new teammates tried to explain how to IRC repeatedly: “_Oh, it’s easy, you just get this console IRC client. No, no, you don’t run it on your own workstation, that’d be crazy. You wouldn’t have history! You provision a persistent remote VM on a machine in Google’s cloud, then SSH to that, then you run screens and then you run your IRC client in that. Easy peasy._”

Getting onto IRC remained on my “TODO” list for five months before I finally said “F- it”, installed [HexChat][10] on my Windows box, disabled automatic sleep, and called it done. It’s worked fairly well.

### GOOGLE DEVELOPER TOOLING

When an engineer first joins Google, they start with a week or two of technical training on the Google infrastructure. I’ve worked in software development for nearly two decades, and I’ve never even dreamed of the development environment Google engineers get to use. I felt like Charlie Bucket on his tour of Willa Wonka’s Chocolate Factory—astonished by the amazing and unbelievable goodies available at any turn. The computing infrastructure was something out of Star Trek, the development tools were slick and amazing, the _process_ was jaw-dropping.

While I was doing a “hello world” coding exercise in Google’s environment, a former colleague from the IE team pinged me on Hangouts chat, probably because he’d seen my tweets about feeling like an imposter as a SWE.  He sent me a link to click, which I did. Code from Google’s core advertising engine appeared in my browser. Google’s engineers have access to nearly all of the code across the whole company. This alone was astonishing—in contrast, I’d initially joined the IE team so I could get access to the networking code to figure out why the Office Online team’s website wasn’t working. “Neat, I can see everything!” I typed back. “Push the Analyze button” he instructed. I did, and some sort of automated analyzer emitted a report identifying a few dozen performance bugs in the code. “Wow, that’s amazing!” I gushed. “Now, push the Fix button” he instructed. “Uh, this isn’t some sort of security red team exercise, right?” I asked. He assured me that it wasn’t. I pushed the button. The code changed to fix some unnecessary object copies. “Amazing!” I effused. “Click Submit” he instructed. I did, and watched as the system compiled the code in the cloud, determined which tests to run, and ran them. Later that afternoon, an owner of the code in the affected folder typed LGTM (Googlers approve changes by typing the acronym for Looks Good To Me) on the change list I had submitted, and my change was live in production later that day. I was, in a word, gobsmacked. That night, I searched the entire codebase for [misuse][11] of an IE cache control token and proposed fixes for the instances I found. I also narcissistically searched for my own name and found a bunch of references to blog posts I’d written about assorted web development topics.

Unfortunately for Chrome Engineers, the introduction to Google’s infrastructure is followed by a major letdown—because Chromium is open-source, the Chrome team itself doesn’t get to take advantage of most of Google’s internal goodies. Development of Chrome instead resembles C++ development at most major companies, albeit with an automatically deployed toolchain and enhancements like a web-based code review tool and some super-useful scripts. The most amazing of these is called [bisect-builds][12], and it allows a developer to very quickly discover what build of Chrome introduced a particular bug. You just give it a “known good” build number and a “known bad” build number and it  automatically downloads and runs the minimal number of builds to perform a binary search for the build that introduced a given bug:

 ![Console showing bisect builds running](https://textplain.files.wordpress.com/2017/01/image31.png?w=1320&h=514 "Binary searching for regressions") 

Firefox has [a similar system][13], but I’d’ve killed for something like this back when I was reproducing and reducing bugs in IE. While it’s easy to understand how the system functions, it works so well that it feels like magic. Other useful scripts include the presubmit checks that run on each change list before you submit them for code review—they find and flag various style violations and other problems.

Compilation itself typically uses a local compiler; on Windows, we use the MSVC command line compiler from Visual Studio 2015 Update 3, although work is underway to switch over to [Clang][14]. Compilation and linking all of Chrome takes quite some time, although on my new beastly dev boxes it’s not _too_ bad. Googlers do have one special perk—we can use Goma (a distributed compiler system that runs on Google’s amazing internal cloud) but I haven’t taken advantage of that so far.

For bug tracking, Chrome recently moved to [Monorail][15], a straightforward web-based bug tracking system. It works fairly well, although it is somewhat more cumbersome than it needs to be and would be much improved with [a few tweaks][16]. Monorail is open-source, but I haven’t committed to it myself yet.

For code review, Chrome presently uses [Rietveld][17], a web-based system, but this is slated to change in the near(ish) future. Like Monorail, it’s pretty straightforward although it would benefit from some minor usability tweaks; I committed one trivial change myself, but the pending migration to a different system means that it isn’t likely to see further improvements.

As an open-source project, Chromium has quite a bit of public [documentation for developers][18], including [Design Documents][19]. Unfortunately, Chrome moves so fast that many of the design documents are out-of-date, and it’s not always obvious what’s current and what was replaced long ago. The team does _value_ engineers’ investment in the documents, however, and various efforts are underway to update the documents and reduce Chrome’s overall architectural complexity. I expect these will be ongoing battles forever, just like in any significant active project.

### WHAT I’VE DONE

“That’s all well and good,” my reader asks, “but _what have you done_ in the last year?”

### I WROTE SOME CODE

My first check in to Chrome [landed][20] in February; it was a simple adjustment to limit Public-Key-Pins to 60 days. Assorted other checkins trickled in through the spring before I went on paternity leave. The most _fun_ fix I did cleaned up a tiny [UX glitch][21] that sat unnoticed in Chrome for almost a decade; it was mostly interesting because it was a minor thing that I’d tripped over for years, including back in IE. (The root cause was arguably that MSDN documentation about DWM lied; I fixed the bug in Chrome, sent the fix to IE, and asked MSDN to fix their docs).

I fixed a number of [minor][22] [security][23] [bugs][24], and lately I’ve been working on [UX issues][25] related to Chrome’s HTTPS user-experience. Back in 2005, I wrote [a blog post][26] complaining about websites using HTTPS incorrectly, and now, just over a decade later, Chrome and Firefox are launching UI changes to warn users when a site is collecting sensitive information on pages which are Not Secure; I’m delighted to have a small part in those changes.

Having written a handful of Internet Explorer Extensions in the past, I was excited to discover the joy of writing Chrome extensions. Chrome extensions are fun, simple, and powerful, and there’s none of the complexity and crashes of COM.

[
 ![My 3 Chrome Extensions](https://textplain.files.wordpress.com/2017/01/image201.png?w=1288&h=650 "My 3 Chrome Extensions") 
][27]

My first and most significant extension is the moarTLS Analyzer– it’s related to my HTTPS work at Google and it’s proven very useful in discovering sites that could improve their security. I [blogged about it][28] and the process of [developing it][29] last year.

Because I run several different Chrome instances on my PC (and they update daily or weekly), I found myself constantly needing to look up the Chrome version number for bug reports and the like. I wrote a tiny extension that shows the version number in a button on the toolbar (so it’s captured in screenshots too!):

 ![Show Chrome Version screenshot](https://textplain.files.wordpress.com/2017/02/image.png?w=886&h=326 "Show Chrome Version") 

More than once, I spent an hour or so trying to reproduce and reduce a bug that had been filed against Chrome. When I found out the cause, I’d jubilently add my notes to the issue in the Monorail bug tracker, click “Save changes” and discover that someone more familiar with the space had beaten me to the punch and figured it out while I’d had the bug open on my screen. Adding an “Issue has been updated” alert to the bug tracker itself seemed like the right way to go, but it would require some changes that I wasn’t able to commit on my own. So, instead I built an extension that provides such alerts within the page until the [feature][30] can be added to the tracker itself.

Each of these extensions was a joy to write.

### I FILED SOME BUGS

I’m a diligent self-hoster, and I run Chrome Canary builds on all of my devices. I submit crash reports and [file bugs][31] with as much information as I can. My proudest moment was in helping narrow down a bizarre and intermittent problem users had with Chrome on Windows 10, where Chrome tabs would crash on every startup until you rebooted the OS. My [blog post][32] explains the full story, and encourages others to file bugs as they encounter them.

### I TRIAGED MORE BUGS

I’ve been developing software for Windows for just over two decades, and inevitably I’ve learned quite a bit about it, including the undocumented bits. That’s given me a leg up in understanding bugs in the Windows code. Some of the most fun include issues in Drag and Drop, like this [gem][33] of a bug that means that you can’t drop files from Chrome to most applications in Windows. More meaningful [bugs][34] [relate][35] [to][36] [problems][37] with Windows’ Mark-of-the-Web security feature (about which I’ve [blogged][38] [about][39] [several][40] times).

### I TOOK SHERIFF ROTATIONS

Google teams have the notion of sheriffs—a rotating assignment that ensures that important tasks (like triaging incoming security bugs) always has a defined owner, without overwhelming any single person. Each Sheriff has a term of ~1 week where they take on additional duties beyond their day-to-day coding, designing, testing, etc.

The Sheriff system has some real benefits—perhaps the most important of which is creating a broad swath of people experienced and qualified in making triage decisions around security vulnerabilities. The alternative is to leave such tasks to a single owner, rapidly increasing their [bus factor][41] and thus the risk to the project. (I know this from first-hand experience. After IE8 shipped, I was on my way out the door to join another team. Then IE’s Security PM left, leaving a gaping hole that I felt obliged to stay around to fill. It worked out okay for me and the team, but it was tense all around.)

I’m on two sheriff rotations: [Enamel][42] (my subteam) and the broader Chrome Security Sheriff.

The Enamel rotation’s tasks are akin to what I used to do as a Program Manager at Microsoft—triage incoming bugs, respond to questions in the [Help Forums][43], and generally act as a point of contact for my immediate team.

In contrast, the Security Sheriff rotation is more work, and somewhat more exciting. The Security Sheriff’s [duties][44] include triaging all bugs of type “Security”, assigning priority, severity, and finding an owner for each. Most security bugs are automatically reported by [our fuzzers][45] (a tireless robot army!), but we also get reports from the public and from Chrome team members and [Project Zero][46] too.

At Microsoft, incoming security bug reports were first received and evaluated by the Microsoft Security Response Center (MSRC); valid reports were passed along to the IE team after some level of analysis and reproduction was undertaken. In general, all communication was done through MSRC, and the turnaround cycle on bugs was _typically _on the order of weeks to months.

In contrast, anyone can [file a security bug][47] against Chrome, and every week lots of people do. One reason for that is that Chrome has a [Vulnerability Rewards program][48] which pays out up to $100K for reports of vulnerabilities in Chrome and Chrome OS. Chrome paid out just under $1M USD in bounties [last year][49]. This is an _awesome _incentive for researchers to responsibly disclose bugs directly to us, and the bounties are _much _higher than those of nearly any other project.

In his “[Hacker Quantified Security][50]” talk at the O’Reilly Security conference, HackerOne CTO and Cofounder Alex Rice showed the following chart of bounty payout size for vulnerabilities when explaining why he was using a Chromebook. Apologies for the blurry photo, but the line at the top shows Chrome OS, with the 90th percentile line miles below as severity rises to Critical:

[
 ![Vulnerability rewards by percentile. Chrome is WAY off the chart.](https://textplain.files.wordpress.com/2017/01/image_thumb6.png?w=962&h=622 "Chrome Vulnerability Rewards are Yuuuuge") 
][51]

With a top bounty of $100000 for an exploit or exploit chain that fully compromises a Chromebook, researchers are much more likely to send their bugs to us than to try to find a buyer on the black market.

Bug bounties are great, except when they’re not. Unfortunately, many filers don’t bother to read the [Chrome Security FAQ][52] which explains what constitutes a security vulnerability and the great many things that do not. Nearly every week, we have at least one person (and often more) file a bug noting “_I can use the Developer Tools to read my own password out of a webpage. Can I have a bounty?_” or “_If I install malware on my PC, I can see what happens inside Chrome” _or variations of these.

Because we take security bug reports very seriously, we often spend a lot of time on what seem like garbage filings to verify that there’s not just some sort of communication problem. This exposes one downside of the sheriff process—the lack of continuity from week to week.

In the fall, we had one bug reporter file a new issue every week that was just a collection of security related terms (XSS! CSRF! UAF! EoP! Dangling Pointer! Script Injection!) lightly wrapped in prose, including screenshots, snippets from websites, console output from developer tools, and the like. Each week, the sheriff would investigate, ask for more information, and engage in a fruitless back and forth with the filer trying to figure out what claim was being made. Eventually I caught on to what was happening and started monitoring the sheriff’s queue, triaging the new findings directly and sparing the sheriff of the week. But even today we still catch folks who lookup old bug reports (usually Won’t Fixed issues), copy/paste the content into new bugs, and file them into the queue. It’s frustrating, but coming from a closed bug database, I’d choose the openness of the Chrome bug database every time.

Getting ready for my first Sherriff rotation, I started watching the incoming queue a few months earlier and felt ready for my first rotation in September. Day One was quiet, with a few small issues found by fuzzers and one or two junk reports from the public which I triaged away with pointers to the “_Why isn’t a vulnerability_” entries in the Security FAQ. I spent the rest of the day writing a fix for a lower-priority security [bug][53] that had been filed a month before. A pretty successful day, I thought.

Day Two was more interesting. Scanning the queue, I saw a few more fuzzer issues and [one external report][54] whose text started with “Here is a Chrome OS exploit chain.” The report was about two pages long, and had a forty-two page PDF attachment explaining the four exploits the finder had used to take over a fully-patched Chromebook.

 ![Star Wars trench run photo](https://textplain.files.wordpress.com/2017/02/image1.png?w=478&h=244 "Defenses can't keep up!") 

Watching Luke’s X-wing take out the Death Star in Star Wars was no more exciting than reading the PDF’s tale of how a single byte memory overwrite in the DNS resolver code could weave its way through the many-layered security features of the Chromebook and achieve a full compromise. It was like the most amazing magic trick you’ve ever seen.

I hopped over to IRC. “So, do we see full compromises of Chrome OS every week?” I asked innocently.

“No. Why?” came the reply from several corners. I pasted in the bug link and a few moments later the replies started flowing in “OMG. Amazing!” Even guys from Project Zero were impressed, and they’re magicians who build exploits like this (usually for other products) all the time. The researcher had found one small bug and a variety of neglected components that were thought to be unreachable and put together a deadly chain.

The first patches were out for code review that evening, and by the next day, we’d reached out to the open-source owner of the DNS component with the 1-byte overwrite bug so he could release patches for the other projects using his code. Within a few days, fixes to other components landed and had been ported to all of the supported versions of Chrome OS. Two weeks later, the Chrome Vulnerability rewards team added the [reward-100000][55] tag, the only bug so far to be so marked. Four weeks after that, I had to hold my tongue when Alex mentioned that “no one’s ever claimed that $100000 bounty” during his “Hacker Quantified Security” talk. Just under 90 days from filing, the bug was unrestricted and made available for public viewing.

The remainder of my first Sheriff rotation was considerably less exciting, although still interesting. I spent some time looking through the components the researcher had abused in his exploit chain and filed a few bugs. Ultimately, the most risky component he used was removed entirely.

### OUTREACH AND BLOGGING

Beyond working on the Enamel team (focused on Chrome’s security UI surface), I also work on the “MoarTLS” project, designed to help encourage and assist the web as a whole in moving to HTTPS. This takes a number of forms—I help maintain the [HTTPS on Top Sites Report Card][56], I do consultations and HTTPS Audits with major sites as they enable HTTPS on their sites. I discover, reduce, and file bugs on Chrome’s and other browsers’ support of features like Upgrade-Insecure-Requests. I publish a [running list of articles][57] on why and how sites should enable TLS. I hassle teams all over Google (and the web in general) to enable HTTPS on every single hyperlink they emit. I responsibly disclosed security bugs in a number of products and sites, including [a vulnerability][58] in Hillary Clinton’s fundraising emails. I worked to send a notification to many many many thousands of sites collecting user information non-securely, warning them of the [UI changes in Chrome 56][59].

When I applied to Google for the Developer Advocate role, I expected I’d be delivering public talks _constantly_, but as a SWE I’ve only given a few talks, including my  [Migrating to HTTPS talk][60] at the first O’Reilly Security Conference. I had a lot of fun at that conference, catching up with old friends from the security community (mostly ex-Microsofties). I also went to my first [Chrome Dev Summit][61], where I didn’t have a public talk (my colleagues did) but I did get to talk to some major companies about deploying HTTPS.

I also blogged [quite a bit][62]. At Microsoft, I started blogging because I got tired of repeating myself, and because our Exchange server and document retention policies had started making it hard or impossible to find old responses—I figured “Well, if I publish everything on the web, Google will find it, and Internet Archive will back it up.”

I’ve kept blogging since leaving Microsoft, and I’m happy that I have even though my reader count numbers are much lower than they were at Microsoft. I’ve managed to mostly avoid trouble, although my posts are not entirely uncontroversial. At Microsoft, they wouldn’t let me publish [this post][63] (because it was too frank); in my first month at Google, I got a phone call at home (during the first portion of my paternity leave) from a Google Director complaining that I’d written [something][64] that was too harsh about a change Microsoft had made. But for the most part, my blogging seems not to ruffle too many feathers.

### TIDBITS

*   Food at Google is generally _really _good; I’m at a satellite office in Austin, so the selection is much smaller than on the main campuses, but the rotating menu is fairly broad and always has at least three major options. And the breakfasts! I gained about 15 pounds in my first few months, but my pneumonia took it off and I’ve restrained my intake since I came back.
*   At Microsoft, I always sneered at companies offering free food (“I’m an adult professional. I can pay for my lunch.”), but it’s definitely convenient to not have to hassle with payments. And until the government closes the loophole, it’s a way to increase employees’ compensation without getting taxed.
*   For the first three months, I was impressed and slightly annoyed that all of the snack options in Google’s micro-kitchens are healthy (e.g. fruit)—probably a good thing, since I sit about twenty feet from one. Then I saw someone open a drawer and pull out some M&Ms, and I learned the secret—all of the junk food is in drawers. The selection is impressive and ranges from the popular to the high end.
*   Google makes heavy use of the “open-office concept.” I think this makes sense for some teams, but it’s not at all awesome for me. I’d gladly take a 10% salary cut for a private office. I doubt I’m alone.
*   Coworkers at Google range from very smart to insanely off-the-scales-smart. Yet, almost all of them are humble, approachable, and kind.
*   Google, like Microsoft, offers gift matching for charities. This is an awesome perk, and one I aim to max out every year. I’m awed by people who go [far][1] beyond that.
*   **Window Management – **I mentioned earlier that one downside of web-based tools is that it’s hard to even _find _the right tab when I’ve got dozens of open tabs that I’m flipping between. The [Quick Tabs extension][2] is one great mitigation; it shows your tabs in a searchable, most-recently-used list in a convenient dropdown:

[
 ![QuickTabs Extension](https://textplain.files.wordpress.com/2017/01/image59.png?w=526&h=376 "A Searchable MRU of open tabs. Yes please!") 
][65]

Another trick that I learned just this month is that you can instruct Chrome to open a site in “App” mode, where it runs in its own top-level window (with no other tabs), showing the site’s icon as the icon in the Windows taskbar. It’s easy:

On Windows, run chrome.exe –app=https://mail.google.com

While on OS X, run open -n -b com.google.Chrome –args –app=’[https://news.google.com][66]‘

_Tip: The easy way to create a shortcut to a the current page in app mode is to click the Chrome Menu > More Tools > Add to {shelf/desktop} and tick the Open as Window checkbox._

I now have [SlickRun][67] MagicWords set up for **mail**, **calendar**, and my other critical applications.

--------------------------------------------------------------------------------

via: https://textslashplain.com/2017/02/01/google-chrome-one-year-in/

作者：[ericlaw][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://textslashplain.com/author/ericlaw1979/
[1]:https://www.jefftk.com/p/leaving-google-joining-wave
[2]:https://chrome.google.com/webstore/detail/quick-tabs/jnjfeinjfmenlddahdjdmgpbokiacbbb
[3]:https://textslashplain.com/2015/12/23/my-next-adventure/
[4]:http://sdtimes.com/telerik-acquires-fiddler-debugger-along-with-its-creator/
[5]:https://bayden.com/dl/Codemash2015-ericlaw-https-in-2015.pptx
[6]:https://conferences.oreilly.com/velocity/devops-web-performance-2015/public/content/2015/04/16-https-stands-for-user-experience
[7]:https://textslashplain.com/2015/04/09/on-appreciation/
[8]:https://xkcd.com/1254/
[9]:http://m.xkcd.com/1782/
[10]:https://hexchat.github.io/
[11]:https://blogs.msdn.microsoft.com/ieinternals/2009/07/20/internet-explorers-cache-control-extensions/
[12]:https://www.chromium.org/developers/bisect-builds-py
[13]:https://mozilla.github.io/mozregression/
[14]:https://chromium.googlesource.com/chromium/src/+/lkgr/docs/clang.md
[15]:https://bugs.chromium.org/p/monorail/adminIntro
[16]:https://bugs.chromium.org/p/monorail/issues/list?can=2&q=reporter%3Aelawrence
[17]:https://en.wikipedia.org/wiki/Rietveld_(software)
[18]:https://www.chromium.org/developers
[19]:https://www.chromium.org/developers/design-documents
[20]:https://codereview.chromium.org/1733973004/
[21]:https://codereview.chromium.org/2244263002/
[22]:https://codereview.chromium.org/2323273003/
[23]:https://codereview.chromium.org/2368593002/
[24]:https://codereview.chromium.org/2347923002/
[25]:https://codereview.chromium.org/search?closed=1&owner=elawrence&reviewer=&cc=&repo_guid=&base=&project=&private=1&commit=1&created_before=&created_after=&modified_before=&modified_after=&order=&format=html&keys_only=False&with_messages=False&cursor=&limit=30
[26]:https://blogs.msdn.microsoft.com/ie/2005/04/20/tls-and-ssl-in-the-real-world/
[27]:https://chrome.google.com/webstore/search/bayden?hl=en-US&_category=extensions
[28]:https://textslashplain.com/2016/03/17/seek-and-destroy-non-secure-references-using-the-moartls-analyzer/
[29]:https://textslashplain.com/2016/03/18/building-the-moartls-analyzer/
[30]:https://bugs.chromium.org/p/monorail/issues/detail?id=1739
[31]:https://bugs.chromium.org/p/chromium/issues/list?can=1&q=reporter%3Ame&colspec=ID+Pri+M+Stars+ReleaseBlock+Component+Status+Owner+Summary+OS+Modified&x=m&y=releaseblock&cells=ids
[32]:https://textslashplain.com/2016/08/18/file-the-bug/
[33]:https://bugs.chromium.org/p/chromium/issues/detail?id=540547
[34]:https://bugs.chromium.org/p/chromium/issues/detail?id=601538
[35]:https://bugs.chromium.org/p/chromium/issues/detail?id=595844#c6
[36]:https://bugs.chromium.org/p/chromium/issues/detail?id=629637
[37]:https://bugs.chromium.org/p/chromium/issues/detail?id=591343
[38]:https://textslashplain.com/2016/04/04/downloads-and-the-mark-of-the-web/
[39]:https://blogs.msdn.microsoft.com/ieinternals/2011/03/23/understanding-local-machine-zone-lockdown/
[40]:https://blogs.msdn.microsoft.com/ieinternals/2012/06/19/enhanced-protected-mode-and-local-files/
[41]:https://en.wikipedia.org/wiki/Bus_factor
[42]:https://www.chromium.org/Home/chromium-security/enamel
[43]:https://productforums.google.com/forum/#!forum/chrome
[44]:https://www.chromium.org/Home/chromium-security/security-sheriff
[45]:https://blog.chromium.org/2012/04/fuzzing-for-security.html
[46]:https://en.wikipedia.org/wiki/Project_Zero_(Google)
[47]:https://bugs.chromium.org/p/chromium/issues/entry?template=Security%20Bug
[48]:https://www.google.com/about/appsecurity/chrome-rewards/
[49]:https://security.googleblog.com/2017/01/vulnerability-rewards-program-2016-year.html
[50]:https://conferences.oreilly.com/security/network-data-security-ny/public/schedule/detail/53296
[51]:https://textplain.files.wordpress.com/2017/01/image58.png
[52]:https://dev.chromium.org/Home/chromium-security/security-faq
[53]:https://bugs.chromium.org/p/chromium/issues/detail?id=639126#c11
[54]:https://bugs.chromium.org/p/chromium/issues/detail?id=648971
[55]:https://bugs.chromium.org/p/chromium/issues/list?can=1&q=label%3Areward-100000&colspec=ID+Pri+M+Stars+ReleaseBlock+Component+Status+Owner+Summary+OS+Modified&x=m&y=releaseblock&cells=ids
[56]:https://www.google.com/transparencyreport/https/grid/?hl=en
[57]:https://whytls.com/
[58]:https://textslashplain.com/2016/09/22/use-https-for-all-inbound-links/
[59]:https://security.googleblog.com/2016/09/moving-towards-more-secure-web.html
[60]:https://www.safaribooksonline.com/library/view/the-oreilly-security/9781491960035/video287622.html
[61]:https://developer.chrome.com/devsummit/
[62]:https://textslashplain.com/2016/
[63]:https://blogs.msdn.microsoft.com/ieinternals/2013/10/16/strict-p3p-validation/
[64]:https://textslashplain.com/2016/01/20/putting-users-first/
[65]:https://chrome.google.com/webstore/detail/quick-tabs/jnjfeinjfmenlddahdjdmgpbokiacbbb
[66]:https://news.google.com/
[67]:https://bayden.com/slickrun/
