翻译中 by小眼儿

Yes, This Trojan Infects Linux. No, It’s Not The Tuxpocalypse
================================================================================
![Is something watching you?](http://www.omgubuntu.co.uk/wp-content/uploads/2014/12/spyware.jpg)

Is something watching you?

Grab a crate of canned food, start digging a deep underground bunker and prepare to settle into a world that will never be the same again: [a powerful trojan has been uncovered on Linux][1].

Yes, the hitherto impregnable fortress of computing nirvana has been compromised in a way that has left security experts a touch perturbed.

Unplug your PC, disinfect your keyboard and buy a cat (no more YouTube ). The Tuxpocalypse is upon us. We’ve reached the end of days.

Right? RIGHT? Nah, not quite.

### A Terrifying Anomalous Thing! ###

Let me set off by saying that **I am not underplaying the severity of this threat (known by the nickname ‘Turla’)** nor, for the avoidance of doubt, am I suggesting that we as Linux users shouldn’t be concerned by the implications.

The discovery of a silent trojan infecting Linux systems is terrifying. The fact it was tasked with sucking up and sending off all sorts of sensitive information is horrific. And to learn it’s been doing this for at least four years and doesn’t require root privileges? My seat is wet. I’m sorry.

But — and along with hyphens and typos, there’s always a ‘but’ on this site — the panic currently sweeping desktop Linux fans, Mexican wave style, is a little out of context.

Vulnerability may be a new feeling for some of us, yet let’s keep it in check: Linux remains an inherently secure operating system for desktop users. One clever workaround does not negate that and shouldn’t send you scurrying offline.

### State Sponsored, Targeting Governments ###

![Is a penguin snake a ‘Penguake’ or a ‘Snaguin’?](http://www.omgubuntu.co.uk/wp-content/uploads/2014/12/penguin-snakle-by-icao-292x300.jpg)

Is a penguin snake a ‘Penguake’ or a ‘Snaguin’?

‘Turla’ is a complex APT (Advanced Persistent Threat) that has (thus far) targeted government, embassy and pharmaceutical companies’ systems for around four years using a method based on [14 year old code, no less][2].

On Windows, where the superhero security researchers at Symantec and Kaspersky Lab first sighted the slimy snake, Turla and components of it were found to have **infected hundreds (100s) of PCs across 45 countries**, many through unpatched zero-day exploits.

*Nice one Microsoft.* 

Further diligence by Kaspersky Lab has now uncovered that parts of the same trojan have also been active on Linux for some time.

The Trojan doesn’t require elevated privileges and can “intercept incoming packets and run incoming commands on the system”, but it’s not yet clear how deep its tentacles reach or how many Linux systems are infected, nor is the full extent of its capabilities known.

“Turla” (and its children) are presumed to be nation-state sponsored due to its choice of targets. US and UK readers shouldn’t assume it’s “*them*“, either. Our own governments are just as happy to play in the mud, too.

#### Perspective and Responsibility ####

As terrible a breach as this discovery is emotionally, technically and ethically it remains far, far, far away from being an indication that we’re entering a new “free for all” era of viruses and malware aimed at the desktop.

**Turla is not a user-focused “i wantZ ur CredIt carD” virus** bundled inside a faux software download. It’s a complex, finessed and adaptable threat with specific targets in mind (ergo grander ambitions than collecting a bunch of fruity tube dot com passwords, sorry ego!).

Kaspersky Lab explains:

> “The Linux Turla module is a C/C++ executable statically linked against multiple libraries, greatly increasing its file size. It was stripped of symbol information, more likely intended to increase analysis effort than to decrease file size. Its functionality includes hidden network communications, arbitrary remote command execution, and remote management. Much of its code is based on public sources.”

Regardless of impact or infection rate its precedes will still raise big, big questions that clever, clever people will now spend time addressing, analysing and (importantly) solving.

IANACSE (I am not a computer security expert) but IAFOA (I am a fan of acronyms), and AFAICT (as far as I can tell) this news should be viewed as as a cautionary PSA or FYI than the kind of OMGGTFO that some sites are painting it as.

Until more details are known none of us should panic. Let’s continue to practice safe computing. Avoid downloading/running scripts, apps, or binaries from untrusted sites or PPAs, and don’t venture into dodgy dark parts of the web.

If you remain super concerned you can check out the [Kaspersky blog][1] for details on how to check that you’re not infected.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/12/government-spying-turla-linux-trojan-found

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://securelist.com/blog/research/67962/the-penquin-turla-2/
[2]:https://twitter.com/joernchen/status/542060412188262400
[3]:https://securelist.com/blog/research/67962/the-penquin-turla-2/
