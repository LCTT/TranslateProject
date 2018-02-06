How To Safely Generate A Random Number — Quarrelsome
======
### Use urandom

Use [urandom][1]. Use [urandom][2]. Use [urandom][3]. Use [urandom][4]. Use [urandom][5]. Use [urandom][6].

### But what about for crypto keys?

Still [urandom][6].

### Why not {SecureRandom, OpenSSL, havaged, &c}?

These are userspace CSPRNGs. You want to use the kernel’s CSPRNG, because:

  * The kernel has access to raw device entropy.

  * It can promise not to share the same state between applications.

  * A good kernel CSPRNG, like FreeBSD’s, can also promise not to feed you random data before it’s seeded.




Study the last ten years of randomness failures and you’ll read a litany of userspace randomness failures. [Debian’s OpenSSH debacle][7]? Userspace random. Android Bitcoin wallets [repeating ECDSA k’s][8]? Userspace random. Gambling sites with predictable shuffles? Userspace random.

Userspace OpenSSL also seeds itself from “from uninitialized memory, magical fairy dust and unicorn horns” generators almost always depend on the kernel’s generator anyways. Even if they don’t, the security of your whole system sure does. **A userspace CSPRNG doesn’t add defense-in-depth; instead, it creates two single points of failure.**

### Doesn’t the man page say to use /dev/random?

You But, more on this later. Stay your pitchforks. should ignore the man page. Don’t use /dev/random. The distinction between /dev/random and /dev/urandom is a Unix design wart. The man page doesn’t want to admit that, so it invents a security concern that doesn’t really exist. Consider the cryptographic advice in random(4) an urban legend and get on with your life.

### But what if I need real random values, not psuedorandom values?

Both urandom and /dev/random provide the same kind of randomness. Contrary to popular belief, /dev/random doesn’t provide “true random” data. For cryptography, you don’t usually want “true random”.

Both urandom and /dev/random are based on a simple idea. Their design is closely related to that of a stream cipher: a small secret is stretched into an indefinite stream of unpredictable values. Here the secrets are “entropy”, and the stream is “output”.

Only on Linux are /dev/random and urandom still meaningfully different. The Linux kernel CSPRNG rekeys itself regularly (by collecting more entropy). But /dev/random also tries to keep track of how much entropy remains in its kernel pool, and will occasionally go on strike if it decides not enough remains. This design is as silly as I’ve made it sound; it’s akin to AES-CTR blocking based on how much “key” is left in the “keystream”.

If you use /dev/random instead of urandom, your program will unpredictably (or, if you’re an attacker, very predictably) hang when Linux gets confused about how its own RNG works. Using /dev/random will make your programs less stable, but it won’t make them any more cryptographically safe.

### There’s a catch here, isn’t there?

No, but there’s a Linux kernel bug you might want to know about, even though it doesn’t change which RNG you should use.

On Linux, if your software runs immediately at boot, and/or the OS has just been installed, your code might be in a race with the RNG. That’s bad, because if you win the race, there could be a window of time where you get predictable outputs from urandom. This is a bug in Linux, and you need to know about it if you’re building platform-level code for a Linux embedded device.

This is indeed a problem with urandom (and not /dev/random) on Linux. It’s also a [bug in the Linux kernel][9]. But it’s also easily fixed in userland: at boot, seed urandom explicitly. Most Linux distributions have done this for a long time. But don’t switch to a different CSPRNG.

### What about on other operating systems?

FreeBSD and OS X do away with the distinction between urandom and /dev/random; the two devices behave identically. Unfortunately, the man page does a poor job of explaining why this is, and perpetuates the myth that Linux urandom is scary.

FreeBSD’s kernel crypto RNG doesn’t block regardless of whether you use /dev/random or urandom. Unless it hasn’t been seeded, in which case both block. This behavior, unlike Linux’s, makes sense. Linux should adopt it. But if you’re an app developer, this makes little difference to you: Linux, FreeBSD, iOS, whatever: use urandom.

### tl;dr

Use urandom.

### Epilog

[ruby-trunk Feature #9569][10]

> Right now, SecureRandom.random_bytes tries to detect an OpenSSL to use before it tries to detect /dev/urandom. I think it should be the other way around. In both cases, you just need random bytes to unpack, so SecureRandom could skip the middleman (and second point of failure) and just talk to /dev/urandom directly if it’s available.

Resolution:

> /dev/urandom is not suitable to be used to generate directly session keys and other application level random data which is generated frequently.
>
> [the] random(4) [man page] on GNU/Linux [says]…

Thanks to Matthew Green, Nate Lawson, Sean Devlin, Coda Hale, and Alex Balducci for reading drafts of this. Fair warning: Matthew only mostly agrees with me.

--------------------------------------------------------------------------------

via: https://sockpuppet.org/blog/2014/02/25/safely-generate-random-numbers/

作者：[Thomas;Erin;Matasano][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://sockpuppet.org/blog
[1]:http://blog.cr.yp.to/20140205-entropy.html
[2]:http://cr.yp.to/talks/2011.09.28/slides.pdf
[3]:http://golang.org/src/pkg/crypto/rand/rand_unix.go
[4]:http://security.stackexchange.com/questions/3936/is-a-rand-from-dev-urandom-secure-for-a-login-key
[5]:http://stackoverflow.com/a/5639631
[6]:https://twitter.com/bramcohen/status/206146075487240194
[7]:http://research.swtch.com/openssl
[8]:http://arstechnica.com/security/2013/08/google-confirms-critical-android-crypto-flaw-used-in-5700-bitcoin-heist/
[9]:https://factorable.net/weakkeys12.extended.pdf
[10]:https://bugs.ruby-lang.org/issues/9569
