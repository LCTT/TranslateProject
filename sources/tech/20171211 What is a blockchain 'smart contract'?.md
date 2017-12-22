What is a blockchain 'smart contract'?
======
The first thing to know about blockchain smart contracts is they're not contracts, smart, or necessarily on a blockchain. They are, in fact, singularly ill-named.1 Let's address these issues in reverse order, and we should find out exactly what a smart contract actually is along the way. First, an introduction to what transactions are and things that aren't transactions.

### An intro to transactions and non-transactions

The best known blockchains are crypto-currencies like Bitcoin.2 The thing about currencies--virtual or not--is that what you mainly want to do is buy or sell things using them. What you want is a simple transaction model: "Once I provide you with this service, you'll give me this amount of currency." We know how this works, because every time we buy something in a shop or online, that's what happens: The starting state is that "I have x amount," and the state after completion of the transaction is "I have x-y amount, and you have y amount."4 It's the moving from one state to another that you care about before you complete the transaction. Most cryptocurrencies are set up to support this type of construct.

This is great, but some clever people realised that there are actually many different ways to do this. Ethereum was where non-transactional constructs made it big time, and [Solidity][1] is the best known example. Both, I'm pleased to say, are open source projects. Why not have a more complex set of conditions that need to be met before I hand over whatever it is that I'm handing over? And--here's the clever bit--why not write those in code that can be executed by computers? You might want the currency--or whatever--to only be released after a certain amount of time, or if a stock price keeps within a particular set of boundaries, or if a certain person continues to be prime minister,5 or if there's no unexpected eclipse within the next five days.6 You could have complex dependencies, too: only complete if I write a new post three weeks in a row and nobody writes unpleasant comments about any of them.7 Write this code, and if the conditions are met, then you move to the next state.

### Not just for blockchains

Let's start addressing those "not" statements.

Now, in a blockchain, the important thing is that once the state has changed, you then ensure it's recorded on the blockchain so that it's public and nobody can change or challenge it. But there are other uses for blockchain technology, as I explained in "[Is blockchain a security topic?][2]" Permissionless systems, often referred to as distributed ledger technologies (DLTs) are a great fit for non-transactional state models, largely because the sort of people who are interested in them are closed groups of organisations that want to have complex sets of conditions met before they move to the next state. These aren't, by the tightest definition, blockchains. Banks and other financial institutions may be the most obvious examples where DLTs are gaining traction, but they are very useful in supply chain sectors, for instance, where you may have conditions around changing market rates, availability, and shipping times or costs, which may all play into the final price of the commodity or service being provided.

### Not that smart

Smart contracts could, I suppose, be smart, but for me, that means complex and able to react to unexpected or unlikely situations. I think that people call them "smart" because they're embodied in code, not for the reasons I've suggested above.

That's actually a very good thing, I think, because I don't think we want them to mean what I was talking out. Most of the usages that I'm aware of for "smart contracts" are where two or more organisations agree on a set of possible outcomes of a system based on a set of known and well-constrained conditions. This is what contracts are generally about, and although I'm about to argue with that part of the nomenclature as well, in this context it's fairly apposite.

What you want, generally, is not unexpected or unlikely situations and smart processing in an artificial intelligence/machine learning-type way, because if you do, then the outcomes are likely to be surprising, and likely unhappy, to one or more of the parties involved. Simple--or at least easily defined--is a key property that you're going to want built into the system. The Solidity project, for example, seems aware of at least some of these pitfalls and suggests that people employing smart contracts employ formal verification, but as we'll see below, that just scratches the surface of the problem.

### Not contracts

Of course, there are some contracts--"in real life" contracts--that exist to manage complex and unexpected conditions. And they exist within a clear legal jurisdiction. The words and phrases that make them up are subject to specific and well-defined processes, with known sanctions and punishments when the conditions of the contract are not met or are broken. There are often instances where these are challenged, but again, clear mechanisms exist for such challenges.

For now, "smart contracts" don't fit this description of a contract. Mapping legal contractual wording to computer code is a very complex process, and the types of errors that processing of code is prone to don't have a good analogue within the justice system. There's the question, as well, of jurisdiction. This is usually described in the contract terms, but what if the processing of the "smart contract" takes place in a different jurisdiction from the parties involved, or even in an unknown jurisdiction? Should this matter? Could this matter? I don't know, and I also don't know what other issues are going to crawl out of the woodwork once people start relying on these constructs in legally enforceable ways, but I doubt they're going to be welcome.

We're not helped, as well, by the fact that when IT people talk about software contracts, they're talking about something completely different: It's the advertised behaviour of a system in the context of known inputs and starting conditions.

### What does this have to do with security?

Once a transaction--or "smart contract"--has completed and made its way onto the blockchain or distributed ledger, it is immutable, pretty much by definition. But what about before it's completed? Well, simple transactions of the type described at the beginning of this post are atomic--they happen or they don't, they are "indivisible and irreducible," to use the jargon. They are, for most purposes, instantaneous.

The same is not true for "smart contracts". They require processing and therefore exist over time. This means that while they are being processed, they are subject to all sorts of attacks to which any system may be vulnerable. The standard list is:

  * Confidentiality. The state of a "smart contract" may be subject to snooping, which may lead to asymmetric knowledge or leakage to non-approved parties.
  * Integrity. This is the nightmare case for many "smart contracts". If an entity--whether a party to the underlying contract or not--can (intentionally or unintentionally) change the internal state of the code executing the "smart contract," then the outcomes of that "smart contract" will not be as they're expected to be, and any of the parties involved may have good cause to dispute the outcome. What's more, such a dispute may not even depend on proof of loss of integrity, but just on suspicion. Proving run-time integrity--let alone mitigating when it is shown to have been lost--is extremely difficult within an execution context.
  * Availability. If one party sees that the conditions associated with a "smart contract" are turning out to be unfavourable to them, they might try to affect the availability of any part of the system that makes up the "smart contract," whether the processing of the code itself, the inputs to the system, or the outputs from the system. Any of these might have a significant impact on the real-life outcomes.



### So what?

This post started with what may have seemed to be a pedantic attack on a naming convention. As I think will probably be clear,8 I'm not comfortable with the phrase "smart contract," and that's mainly because I think it has caused some people to think that these constructs are things that they're not. This, in turn, is likely to mean that people will use them in contexts where they're not appropriate.

I also worry that because words bring baggage with them, this will lead to people not fully thinking through the impact of security on these constructs. And I think that the impact can be very major. So, if you're looking into these constructs, please do so with your eyes open. I've not talked much in this article about mitigations, but some exist. Keep an eye on future posts for more.

1 I like to think that the late, lamented authors Terry Pratchett and Douglas Adams would both appreciate smart contracts for exactly this reason.

2 The first thing you'll find many Bitcoin commentators saying is, "I wish I'd bought in early: I'd be a multi-millionaire by now."3

3 I wish I'd bought in early: I'd be a multi-millionaire by now.

4 Less taxes or house cut. Sorry--that's just the way the world works.

5 Or doesn't.

6 I'm not expecting one. I'd tell you, honest.

7 This is not an invitation.

8 If it isn't by now, either you've not read this carefully enough, or I've done a bad job of explaining. Try reading it again, and if that doesn't help, write a comment and I'll try to explain better.

This article originally appeared on [Alice, Eve, and Bob--a security blog][3] and is republished with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/whats-blockchain-smart-contract

作者：[Mike Bursell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mikecamel
[1]:https://solidity.readthedocs.io/en/develop/
[2]:https://opensource.com/article/17/11/blockchain-security-topic
[3]:https://aliceevebob.com/2017/11/14/whats-a-blockchain-smart-contract/
