translating by wyxplus


Language engineering for great justice
============================================================

Whole-systems engineering, when you get good at it, goes beyond being entirely or even mostly about technical optimizations. Every artifact we make is situated in a context of human action that widens out to the economics of its use, the sociology of its users, and the entirety of what Austrian economists call “praxeology”, the science of purposeful human behavior in its widest scope.

This isn’t just abstract theory for me. When I wrote my papers on open-source development, they were exactly praxeology – they weren’t about any specific software technology or objective but about the context of human action within which technology is worked. An increase in praxeological understanding of technology can reframe it, leading to tremendous increases in human productivity and satisfaction, not so much because of changes in our tools but because of changes in the way we grasp them.

In this, the third of my unplanned series of posts about the twilight of C and the huge changes coming as we actually begin to see forward into a new era of systems programming, I’m going to try to cash that general insight out into some more specific and generative ideas about the design of computer languages, why they succeed, and why they fail.

In my last post I noted that every computer language is an embodiment of a relative-value claim, an assertion about the optimal tradeoff between spending machine resources and spending programmer time, all of this in a context where the cost of computing power steadily falls over time while programmer-time costs remain relatively stable or may even rise. I also highlighted the additional role of transition costs in pinning old tradeoff assertions into place. I described what language designers do as seeking a new optimum for present and near-future conditions.

Now I’m going to focus on that last concept. A language designer has lots of possible moves in language-design space from where the state of the art is now. What kind of type system? GC or manual allocation? What mix of imperative, functional, or OO approaches? But in praxeological terms his choice is, I think, usually much simpler: attack a near problem or a far problem?

“Near” and “far” are measured along the curves of falling hardware costs, rising software complexity, and increasing transition costs from existing languages. A near problem is one the designer can see right in front of him; a far problem is a set of conditions that can be seen coming but won’t necessarily arrive for some time. A near solution can be deployed immediately, to great practical effect, but may age badly as conditions change. A far solution is a bold bet that may smother under the weight of its own overhead before its future arrives, or never be adopted at all because moving to it is too expensive.

Back at the dawn of computing, FORTRAN was a near-problem design, LISP a far-problem one. Assemblers are near solutions. Illustrating that the categories apply to non-general-purpose languages, also roff markup. Later in the game, PHP and Javascript. Far solutions? Oberon. Ocaml. ML. XML-Docbook. Academic languages tend to be far because the incentive structure around them rewards originality and intellectual boldness (note that this is a praxeological cause, not a technical one!). The failure mode of academic languages is predictable; high inward transition costs, nobody goes there, failure to achieve community critical mass sufficient for mainstream adoption, isolation, and stagnation. (That’s a potted history of LISP in one sentence, and I say that as an old LISP-head with a deep love for the language…)

The failure modes of near designs are uglier. The best outcome to hope for is a graceful death and transition to a newer design. If they hang on (most likely to happen when transition costs out are high) features often get piled on them to keep them relevant, increasing complexity until they become teetering piles of cruft. Yes, C++, I’m looking at you. You too, Javascript. And (alas) Perl, though Larry Wall’s good taste mitigated the problem for many years – but that same good taste eventually moved him to blow up the whole thing for Perl 6.

This way of thinking about language design encourages reframing the designer’s task in terms of two objectives. (1) Picking a sweet spot on the near-far axis away from you into the projected future; and (2) Minimizing inward transition costs from one or more existing languages so you co-opt their userbases. And now let’s talk about about how C took over the world.

There is no more more breathtaking example than C than of nailing the near-far sweet spot in the entire history of computing. All I need to do to prove this is point at its extreme longevity as a practical, mainstream language that successfully saw off many competitors for its roles over much of its range. That timespan has now passed about 35 years (counting from when it swamped its early competitors) and is not yet with certainty ended.

OK, you can attribute some of C’s persistence to inertia if you want, but what are you really adding to the explanation if you use the word “inertia”? What it means is exactly that nobody made an offer that actually covered the transition costs out of the language!

Conversely, an underappreciated strength of the language was the low inward transition costs. C is an almost uniquely protean tool that, even at the beginning of its long reign, could readily accommodate programming habits acquired from languages as diverse as FORTRAN, Pascal, assemblers and LISP. I noticed back in the 1980s that I could often spot a new C programmer’s last language by his coding style, which was just the flip side of saying that C was damn good at gathering all those tribes unto itself.

C++ also benefited from having low transition costs in. Later, most new languages at least partly copied C syntax in order to minimize them.Notice what this does to the context of future language designs: it raises the value of being a C-like as possible in order to minimize inward transition costs from anywhere.

Another way to minimize inward transition costs is to simply be ridiculously easy to learn, even to people with no prior programming experience. This, however, is remarkably hard to pull off. I evaluate that only one language – Python – has made the major leagues by relying on this quality. I mention it only in passing because it’s not a strategy I expect to see a  _systems_  language execute successfully, though I’d be delighted to be wrong about that.

So here we are in late 2017, and…the next part is going to sound to some easily-annoyed people like Go advocacy, but it isn’t. Go, itself, could turn out to fail in several easily imaginable ways. It’s troubling that the Go team is so impervious to some changes their user community is near-unanimously and rightly (I think) insisting it needs. Worst-case GC latency, or the throughput sacrifices made to lower it, could still turn out to drastically narrow the language’s application range.

That said, there is a grand strategy expressed in the Go design that I think is right. To understand it, we need to review what the near problem for a C replacement is. As I noted in the prequels, it is rising defect rates as systems projects scale up – and specifically memory-management bugs because that category so dominates crash bugs and security exploits.

We’ve now identified two really powerful imperatives for a C replacement: (1) solve the memory-management problem, and (2) minimize inward-transition costs from C. And the history – the praxeological context – of programming languages tells us that if a C successor candidate don’t address the transition-cost problem effectively enough, it almost doesn’t matter how good a job it does on anything else. Conversely, a C successor that  _does_  address transition costs well buys itself a lot of slack for not being perfect in other ways.

This is what Go does. It’s not a theoretical jewel; it has annoying limitations; GC latency presently limits how far down the stack it can be pushed. But what it is doing is replicating the Unix/C infective strategy of being easy-entry and  _good enough_  to propagate faster than alternatives that, if it didn’t exist, would look like better far bets.

Of course, the proboscid in the room when I say that is Rust. Which is, in fact, positioning itself as the better far bet. I’ve explained in previous installments why I don’t think it’s really ready to compete yet. The TIOBE and PYPL indices agree; it’s never made the TIOBE top 20 and on both indices does quite poorly against Go.

Where Rust will be in five years is a different question, of course. My advice to the Rust community, if they care, is to pay some serious attention to the transition-cost problem. My personal experience says the C to Rust energy barrier is  _[nasty][2]_ . Code-lifting tools like Corrode won’t solve it if all they do is map C to unsafe Rust, and if there were an easy way to automate ownership/lifetime annotations they wouldn’t be needed at all – the compiler would just do that for you. I don’t know what a solution would look like, here, but I think they better find one.

I will finally note that Ken Thompson has a history of designs that look like minimal solutions to near problems but turn out to have an amazing quality of openness to the future, the capability to  _be improved_ . Unix is like this, of course. It makes me very cautious about supposing that any of the obvious annoyances in Go that look like future-blockers to me (like, say, the lack of generics) actually are. Because for that to be true, I’d have to be smarter than Ken, which is not an easy thing to believe.

--------------------------------------------------------------------------------

via: http://esr.ibiblio.org/?p=7745

作者：[Eric Raymond ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://esr.ibiblio.org/?author=2
[1]:http://esr.ibiblio.org/?author=2
[2]:http://esr.ibiblio.org/?p=7711&cpage=1#comment-1913931
[3]:http://esr.ibiblio.org/?p=7745
