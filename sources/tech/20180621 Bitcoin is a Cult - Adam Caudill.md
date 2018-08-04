Translating by qhwdw
Bitcoin is a Cult — Adam Caudill
======
The Bitcoin community has changed greatly over the years; from technophiles that could explain a [Merkle tree][1] in their sleep, to speculators driven by the desire for a quick profit & blockchain startups seeking billion dollar valuations led by people who don’t even know what a Merkle tree is. As the years have gone on, a zealotry has been building around Bitcoin and other cryptocurrencies driven by people who see them as something far grander than they actually are; people who believe that normal (or fiat) currencies are becoming a thing of the past, and the cryptocurrencies will fundamentally change the world’s economy.

Every year, their ranks grow, and their perception of cryptocurrencies becomes more grandiose, even as [novel uses][2] of the technology brings it to its knees. While I’m a firm believer that a well designed cryptocurrency could ease the flow of money across borders, and provide a stable option in areas of mass inflation, the reality is that we aren’t there yet. In fact, it’s the substantial instability in value that allows speculators to make money. Those that preach that the US Dollar and Euro are on their deathbed have utterly abandoned an objective view of reality.

### A little background…

I read the Bitcoin white-paper the day it was released – an interesting use of [Merkle trees][1] to create a public ledger and a fairly reasonable consensus protocol – it got the attention of many in the cryptography sphere for its novel properties. In the years since that paper was released, Bitcoin has become rather valuable, attracted many that see it as an investment, and a loyal (and vocal) following of people who think it’ll change everything. This discussion is about the latter.

Yesterday, someone on Twitter posted the hash of a recent Bitcoin block, the thousands of Tweets and other conversations that followed have convinced me that Bitcoin has crossed the line into true cult territory.

It all started with this Tweet by Mark Wilcox:

> #00000000000000000021e800c1e8df51b22c1588e5a624bea17e9faa34b2dc4a
> — Mark Wilcox (@mwilcox) June 19, 2018

The value posted is the hash of [Bitcoin block #528249][3]. The leading zeros are a result of the mining process; to mine a block you combine the contents of the block with a nonce (and other data), hash it, and it has to have at least a certain number of leading zeros to be considered valid. If it doesn’t have the correct number, you change the nonce and try again. Repeat this until the number of leading zeros is the right number, and you now have a valid block. The part that people got excited about is what follows, 21e800.

Some are claiming this is an intentional reference, that whoever mined this block actually went well beyond the current difficulty to not just bruteforce the leading zeros, but also the next 24 bits – which would require some serious computing power. If someone had the ability to bruteforce this, it could indicate something rather serious, such as a substantial breakthrough in computing or cryptography.

You must be asking yourself, what’s so important about 21e800 – a question you would surely regret. Some are claiming it’s a reference to [E8 Theory][4] (a widely criticized paper that presents a standard field theory), or to the 21,000,000 total Bitcoins that will eventually exist (despite the fact that `21 x 10^8` would be 2,100,000,000). There are others, they are just too crazy to write about. Another important fact is that a block is mined on average on once a year that has 21e8 following the leading zeros – those were never seen as anything important.

This leads to where things get fun: the [theories][5] that are circulating about how this happened.

  * A quantum computer, that is somehow able to hash at unbelievable speed. This is despite the fact that there’s no indication in theories around quantum computers that they’ll be able to do this; hashing is one thing that’s considered safe from quantum computers.
  * Time travel. Yes, people are actually saying that someone came back from the future to mine this block. I think this is crazy enough that I don’t need to get into why this is wrong.
  * Satoshi Nakamoto is back. Despite the fact that there has been no activity with his private keys, some theorize that he has returned, and is somehow able to do things that nobody can. These theories don’t explain how he could do it.



> So basically (as i understand) Satoshi, in order to have known and computed the things that he did, according to modern science he was either:
>
> A) Using a quantum computer
>  B) Fom the future
>  C) Both
>
> — Crypto Randy Marsh [REKT] (@nondualrandy) [June 21, 2018][6]

If all this sounds like [numerology][7] to you, you aren’t alone.

All this discussion around special meaning in block hashes also reignited the discussion around something that is, at least somewhat, interesting. The Bitcoin genesis block, the first bitcoin block, does have an unusual property: the early Bitcoin blocks required that the first 32 bits of the hash be zero; however the genesis block had 43 leading zero bits. As the code that produced the genesis block was never released, it’s not known how it was produced, nor is it known what type of hardware was used to produce it. Satoshi had an academic background, so may have had access to more substantial computing power than was common at the time via a university. At this point, the oddities of the genesis block are a historical curiosity, nothing more.

### A brief digression on hashing

This hullabaloo started with the hash of a Bitcoin block; so it’s important to understand just what a hash is, and understand one very important property they have. A hash is a one-way cryptographic function that creates a pseudo-random output based on the data that it’s given.

What this means, for the purposes of this discussion, is that for each input you get a random output. Random numbers have a way of sometimes looking interesting, simply as a result of being random and the human brain’s affinity to find order in everything. When you start looking for order in random data, you find interesting things – that are yet meaningless, as it’s simply random. When people ascribe significant meaning to random data, it tells you far more about the mindset of those involved rather than the data itself.

### Cult of the Coin

First, let us define a couple of terms:

  * Cult: a system of religious veneration and devotion directed toward a particular figure or object.
  * Religion: a pursuit or interest to which someone ascribes supreme importance.



The Cult of the Coin has many saints, perhaps none greater than Satoshi Nakamoto, the pseudonym used by the person(s) that created Bitcoin. Vigorously defended, ascribed with ability and understanding far above that of a normal researcher, seen as a visionary beyond compare that is leading the world to a new economic order. When combined with Satoshi’s secretive nature and unknown true identify, adherents to the Cult view Satoshi as a truly venerated figure.

That is, of course, with the exception of adherents that follow a different saint, who is unquestionably correct, and any criticism is seen as not only an attack on their saint, but on themselves as well. Those that follow EOS for example, may see Satoshi has a hack that developed a failed project, yet will react fiercely to the slightest criticism of EOS, a reaction so strong that it’s reserved only for an attack on one’s deity. Those that follow IOTA react with equal fierceness; and there are many others.

These adherents have abandoned objectivity and reasonable discourse, and allowed their zealotry to cloud their vision. Any discussion of these projects and the people behind them that doesn’t include glowing praise inevitably ends with a level of vitriolic speech that is beyond reason for a discussion of technology.

This is dangerous, for many reasons:

  * Developers & researchers are blinded to flaws. Due to the vast quantities of praise by adherents, those involved develop a grandiose view of their own abilities, and begin to view criticism as unjustified attacks – as they couldn’t possibly have been wrong.
  * Real problems are attacked. Instead of technical issues being seen as problems to be solved and opportunities to improve, they are seen as attacks from people who must be motivated to destroy the project.
  * One coin to rule them all. Adherents are often aligned to one, and only one, saint. Acknowledging the qualities of another project means acceptance of flaws or deficiencies in their own, which they will not do.
  * Preventing real progress. Evolution is brutal, it requires death, it requires projects to fail and that the reasons for those failures to be acknowledged. If lessons from failure are ignored, if things that should die aren’t allowed to, progress stalls.



Discussions around many of the cryptocurrencies and related blockchain projects are becoming more and more toxic, becoming impossible for well-intentioned people to have real technical discussions without being attacked. With discussions of real flaws, flaws that would doom a design in any other environment, being instantly treated as heretical without any analysis to determine the factual claims becoming routine, the cost for the well-intentioned to get involved has become extremely high. There are at least some that are aware of significant security flaws that have opted to remain silent due to the highly toxic environment.

What was once driven by curiosity, a desire to learn and improve, to determine the viability of ideas, is now driven by blind greed, religious zealotry, self-righteousness, and self-aggrandizement.

I have precious little hope for the future of projects that inspire this type of zealotry, and its continuous spread will likely harm real research in this area for many years to come. These are technical projects, some projects succeed, some fail – this is how technology evolves. Those designing these systems are human, just as flawed as the rest of us, and so too are the projects flawed. Some are well suited to certain use cases and not others, some aren’t suited to any use case, none yet are suited to all. The discussions about these projects should be focused on the technical aspects, and done so to evolve this field of research; adding a religious to these projects harms all.

[Note: There are many examples of this behavior that could be cited, however in the interest of protecting those that have been targeted for criticizing projects, I have opted to minimize such examples. I have seen too many people who I respect, too many that I consider friends, being viciously attacked – I have no desire to draw attention to those attacks, and risk restarting them.]



--------------------------------------------------------------------------------

via: https://adamcaudill.com/2018/06/21/bitcoin-is-a-cult/

作者：[Adam Caudill][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://adamcaudill.com/author/adam/
[1]:https://en.wikipedia.org/wiki/Merkle_tree
[2]:https://hackernoon.com/how-crypto-kitties-disrupted-the-ethereum-network-845c22aa1e6e
[3]:https://blockchain.info/block-height/528249
[4]:https://en.wikipedia.org/wiki/An_Exceptionally_Simple_Theory_of_Everything
[5]:https://medium.com/@coop__soup/00000000000000000021e800c1e8df51b22c1588e5a624bea17e9faa34b2dc4a-cd4b67d446be
[6]:https://twitter.com/nondualrandy/status/1009609117768605696?ref_src=twsrc%5Etfw
[7]:https://en.wikipedia.org/wiki/Numerology
