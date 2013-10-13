The Debian OpenSSL Bug: Backdoor or Security Accident?
======================================================

On Monday, Ed wrote about [Software Transparency][1], the idea that software is more resistant to intentional backdoors (and unintentional security vulnerabilities) if the process used to create it is transparent. Elements of software transparency include the availability of source code and the ability to read or contribute to a project’s issue tracker or internal developer discussion. He mentioned a case that I want to discuss in detail: in 2008, the Debian Project (a popular Linux distribution used for many web servers) [announced][2] that the pseudorandom number generator in Debian’s version of [OpenSSL][3] was broken and insecure.

First, some background: A pseudorandom number generator (PRNG) is a program F that, given a short random seed s, gives you a long stream of bits F(s) which appear to be random. If you and I put in the same seed s, we’ll get the same stream of bits. But if I choose s at random and don’t tell you what it is, you can’t predict F(s) at all—as far as you’re concerned, F(s) might as well be random. The OpenSSL PRNG tries to grab some unpredictable information (“entropy”) from the system, such as the current process ID, the contents of some memory that are likely to be different (for example, uninitialized memory which is or might be controlled by other processes) and so on, and turns these into the seed s. Then it gives back the random stream F(s).

In 2006, in order to [fix warnings][4] spit out by [a tool][5] that can help find memory access bugs in software, one of the Debian maintainers [decided to comment][6] [out two lines of code][7] in the OpenSSL PRNG. It turns out that these lines were important: they were responsible for grabbing almost all of the unpredictable entropy that became the seed for the OpenSSL PRNG. Without them, the PRNG only had 32,767 choices for s, so there were only that many possible choices for F(s).

And so programs that relied on the OpenSSL random number generator weren’t seeing nearly as much randomness as they thought they were. One such program generates the cryptographic keys used for SSL (secure web browsing) and SSH (secure remote login). Critically, these keys have to be random: if you can guess what my secret key is, you can break into anything I protect using that key. That means you have the ability to read encrypted traffic, [log into remote servers[8], [or to make forged messages appear authentic][9]. Because the vulnerability had first been introduced in late 2006, the bug also [made its way into Ubuntu][10] (another popular Linux distribution widely used for web servers). All told, the bug affected thousands of servers and [persisted for a long time][11] because patching the affected servers was not enough to fix the problem—you also had to replace any predictable weak keys you had made while the vulnerability was present.

As an aside, the problem of finding entropy to feed pseudorandom number generators is [famously][12] [hard][13]. Indeed, it’s still a [big challenge][14] to get right even today. Errors in randomness are hard to detect, because if you just eyeball the output, it will look random-ish and will change each time you run the program. Weak randomness can be very hard to spot, but it can render the cryptography in a (seemingly) secure system useless. Still, the Debian bug was obvious enough that it inspired a [lot of ridicule][15] [in the security community][16] once it was discovered.

So was this problem a backdoor, purposefully introduced? It seems unlikely. The maintainer who made the change, [Kurt Roeckx][17], was later [made Secretary of the Debian Project][18], suggesting that he’s a real and trustworthy person and probably not a fake identity made up by the NSA to insert a vulnerability. The Debian Project is famous for requiring significant effort to reach the inner circle. And in this case, the mistake itself was not completely damning—a [cascade of failures][19] made the vulnerability possible and contributed to its severity.

But the vulnerability did happen in a transparent setting. Everything that was done was done in public. And yet the vulnerability still got introduced and wasn’t noticed for a long time. That’s in part because all the transparency made for a lot of noise, so the people to whom the vulnerability would have been obvious weren’t paying attention. But it’s also because the vulnerability was subtle and the system wasn’t designed to make the impact of the change obvious to a casual observer.

Does that mean that software transparency doesn’t help? I don’t think so—lots of people agree that transparent software is more secure than non-transparent software. But that doesn’t mean failures can’t still happen or that we should be less vigilant just because lots of other people can see what’s going on.

At the very least, transparency lets us look back, years later, and figure out what caused the bug—in this case, engineering error and not deliberate sabotage.

---

via: https://freedom-to-tinker.com/blog/kroll/software-transparency-debian-openssl-bug/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)


[1]:https://freedom-to-tinker.com/blog/felten/software-transparency/
[2]:http://www.debian.org/security/2008/dsa-1571
[3]:https://www.openssl.org/
[4]:http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=363516
[5]:http://valgrind.org/
[6]:http://marc.info/?l=openssl-dev&m=114651085826293&w=2
[7]:http://svn.debian.org/viewsvn/pkg-openssl/openssl/trunk/rand/md_rand.c?rev=141&view=diff&r1=141&r2=140&p1=openssl/trunk/rand/md_rand.c&p2=/openssl/trunk/rand/md_rand.c
[8]:http://www.exploit-db.com/exploits/5622/
[9]:http://plog.sesse.net/blog/tech/2008-05-14-17-21_some_maths.html
[10]:http://www.ubuntu.com/usn/usn-612-1/
[11]:http://cseweb.ucsd.edu/~hovav/dist/debiankey.pdf
[12]:http://xkcd.com/221/
[13]:http://dilbert.com/strips/comic/2001-10-25/
[14]:https://factorable.net/weakkeys12.extended.pdf
[15]:http://www.xkcd.com/424/
[16]:http://www.links.org/?p=327
[17]:http://www.roeckx.be/journal/
[18]:http://lists.debian.org/debian-devel-announce/2009/02/msg00009.html
[19]:http://research.swtch.com/openssl
