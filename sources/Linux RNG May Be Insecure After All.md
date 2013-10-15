Linux RNG May Be Insecure After All
================================================================================
> As a followup to Linus's [opinion people skeptical of the Linux random number generator][1], a new paper [analyzes the robustness of /dev/urandom and /dev/random][2] . From the paper: 'From a practical side, we also give a precise assessment of the security of the two Linux PRNGs, /dev/random and /dev/urandom. In particular, we show several attacks proving that these PRNGs are not robust according to our definition, and do not accumulate entropy properly. These attacks are due to the vulnerabilities of the entropy estimator and the internal mixing function of the Linux PRNGs. These attacks against the Linux PRNG show that it does not satisfy the "robustness" notion of security, but it remains unclear if these attacks lead to actual exploitable vulnerabilities in practice.'

Of course, you [might not even be able to trust hardware RNGs][3]. Rather than simply proving that the Linux PRNGs are not robust thanks to their run-time entropy estimator, the authors provide a new property for proving the robustness of the entropy accumulation stage of a PRNG, and offer an alternative PRNG model and proof that is both robust and more efficient than the current Linux PRNGs.

--------------------------------------------------------------------------------

via: http://it.slashdot.org/story/13/10/14/2318211/linux-rng-may-be-insecure-after-all

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://linux.slashdot.org/story/13/09/10/1311247/linus-responds-to-rdrand-petition-with-scorn
[2]:http://eprint.iacr.org/2013/338.pdf
[3]:http://slashdot.org/story/13/09/13/1228216/stealthy-dopant-level-hardware-trojans