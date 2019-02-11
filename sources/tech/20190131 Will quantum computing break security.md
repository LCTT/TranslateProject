[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Will quantum computing break security?)
[#]: via: (https://opensource.com/article/19/1/will-quantum-computing-break-security)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

Will quantum computing break security?
======

Do you want J. Random Hacker to be able to pretend they're your bank?

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_privacy_lock.png?itok=ZWjrpFzx)

Over the past few years, a new type of computer has arrived on the block: the quantum computer. It's arguably the sixth type of computer:

  1. **Humans:** Before there were artificial computers, people used, well, people. And people with this job were called "computers."

  2. **Mechanical analogue:** These are devices such as the [Antikythera mechanism][1], astrolabes, or slide rules.

  3. **Mechanical digital:** In this category, I'd count anything that allowed discrete mathematics but didn't use electronics for the actual calculation: the abacus, Babbage's Difference Engine, etc.

  4. **Electronic analogue:** Many of these were invented for military uses such as bomb sights, gun aiming, etc.

  5. **Electronic digital:** I'm going to go out on a limb here and characterise Colossus as the first electronic digital computer1: these are basically what we use today for anything from mobile phones to supercomputers.

  6. **Quantum computers:** These are coming and are fundamentally different from all of the previous generations.




### What is quantum computing?

Quantum computing uses concepts from quantum mechanics to allow very different types of calculations from what we're used to in "classical computing." I'm not even going to try to explain, because I know I'd do a terrible job, so I suggest you try something like [Wikipedia's definition][2] as a starting point. What's important for our purposes is to understand that quantum computers use qubits to do calculations, and for quite a few types of mathematical algorithms—and therefore computing operations––they can solve problems much faster than classical computers.

What's "much faster"? Much, much faster: orders of magnitude faster. A calculation that might take years or decades with a classical computer could, in certain circumstances, take seconds. Impressive, yes? And scary. Because one of the types of problems that quantum computers should be good at solving is decrypting encrypted messages, even without the keys.

This means that someone with a sufficiently powerful quantum computer should be able to read all of your current and past messages, decrypt any stored data, and maybe fake digital signatures. Is this a big thing? Yes. Do you want J. Random Hacker to be able to pretend they're your bank?2 Do you want that transaction on the blockchain where you were sold a 10 bedroom mansion in Mayfair to be "corrected" to be a bedsit in Weston-super-Mare?3

### Some good news

This is all scary stuff, but there's good news of various types.

The first is that, in order to make any of this work at all, you need a quantum computer with a good number of qubits operating, and this is turning out to be hard.4 The general consensus is that we've got a few years before anybody has a "big" enough quantum computer to do serious damage to classical encryption algorithms.

The second is that, even with a sufficient number of qubits to attacks our existing algorithms, you still need even more to allow for error correction.

The third is that, although there are theoretical models to show how to attack some of our existing algorithms, actually making them work is significantly harder than you or I5 might expect. In fact, some of the attacks may turn out to be infeasible or just take more years to perfect than we worry about.

The fourth is that there are clever people out there who are designing quantum-computation-resistant algorithms (sometimes referred to as "post-quantum algorithms") that we can use, at least for new encryption, once they've been tested and become widely available.

All in all, in fact, there's a strong body of expert opinion that says we shouldn't be overly worried about quantum computing breaking our encryption in the next five or even 10 years.

### And some bad news

It's not all rosy, however. Two issues stick out to me as areas of concern.

  1. People are still designing and rolling out systems that don't consider the issue. If you're coming up with a system that is likely to be in use for 10 or more years or will be encrypting or signing data that must remain confidential or attributable over those sorts of periods, then you should be considering the possible impact of quantum computing on your system.

  2. Some of the new, quantum-computing-resistant algorithms are proprietary. This means that when you and I want to start implementing systems that are designed to be quantum-computing resistant, we'll have to pay to do so. I'm a big proponent of open source, and particularly of [open source cryptography][3], and my big worry is that we just won't be able to open source these things, and worse, that when new protocol standards are created––either de-facto or through standards bodies––they will choose proprietary algorithms that exclude the use of open source, whether on purpose, through ignorance, or because few good alternatives are available.




### What to do?

Luckily, there are things you can do to address both of the issues above. The first is to think and plan when designing a system about what the impact of quantum computing might be on it. Often—very often—you won't need to implement anything explicit now (and it could be hard to, given the current state of the art), but you should at least embrace [the concept of crypto-agility][4]: designing protocols and systems so you can swap out algorithms if required.7

The second is a call to arms: Get involved in the open source movement and encourage everybody you know who has anything to do with cryptography to rally for open standards and for research into non-proprietary, quantum-computing-resistant algorithms. This is something that's very much on my to-do list, and an area where pressure and lobbying is just as important as the research itself.

1\. I think it's fair to call it the first electronic, programmable computer. I know there were earlier non-programmable ones, and that some claim ENIAC, but I don't have the space or the energy to argue the case here.

2\. No.

3\. See 2. Don't get me wrong, by the way—I grew up near Weston-super-Mare, and it's got things going for it, but it's not Mayfair.

4\. And if a quantum physicist says something's hard, then to my mind, it's hard.

5\. And I'm assuming that neither of us is a quantum physicist or mathematician.6

6\. I'm definitely not.

7\. And not just for quantum-computing reasons: There's a good chance that some of our existing classical algorithms may just fall to other, non-quantum attacks such as new mathematical approaches.

This article was originally published on [Alice, Eve, and Bob][5] and is reprinted with the author's permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/will-quantum-computing-break-security

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Antikythera_mechanism
[2]: https://en.wikipedia.org/wiki/Quantum_computing
[3]: https://opensource.com/article/17/10/many-eyes
[4]: https://aliceevebob.com/2017/04/04/disbelieving-the-many-eyes-hypothesis/
[5]: https://aliceevebob.com/2019/01/08/will-quantum-computing-break-security/
