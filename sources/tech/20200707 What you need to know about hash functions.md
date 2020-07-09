[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What you need to know about hash functions)
[#]: via: (https://opensource.com/article/20/7/hash-functions)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

What you need to know about hash functions
======
It should be computationally implausible to work backwards from the
output hash to the input.
![City with numbers overlay][1]

There is a tool in the security practitioner's repertoire that's helpful for everyone to understand, regardless of what they do with computers: cryptographic hash functions. That may sound mysterious, technical, and maybe even boring, but I have a concise explanation of what hashes are and why they matter to you.

A cryptographic hash function, such as SHA-256 or MD5, takes as input a set of binary data (typically as bytes) and gives output that is hopefully unique for each set of possible inputs. The length of the output—"the hash"—for any particular hash function is typically the same for any pattern of inputs (for SHA-256, it is 32 bytes or 256 bits—the clue's in the name). The important thing is this: It should be computationally implausible (cryptographers hate the word _impossible_) to work backward from the output hash to the input. This is why they are sometimes referred to as one-way hash functions.

But what are hash functions used for? And why is the property of being unique so important?

### Unique output

The phrase "hopefully unique" when describing the output of a hash function is vital because hash functions are used to render wholly unique output. Hash functions, for example, are used as a way to verify that the copy of a file _you_ downloaded is a byte-for-byte duplicate of the file _I_ downloaded. You'll see this verification process at work when you download a Linux ISO, or software from a Linux repository. Without uniqueness, the technology is rendered useless, at least for the purpose you generally have for it.

Should two inputs yield the same output, the hash is said to have a "collision." In fact, MD5 has become deprecated because it is now trivially possible to find collisions with commercially available hardware and software systems.

Another important property is that a tiny change in a message, even changing a single bit, is expected to generate a noticeable change to the output (this is the "avalanche effect").

### Verifying binary data

The typical use for hash functions is to ensure that when someone hands you a piece of binary data, it is what you expect. All data in the world of computing can be described in binary format, whether it is text, an executable, a video, an image, or a complete database of data, so hashes are broadly applicable, to say the least. Comparing binary data directly is slow and arduous computationally, but hash functions are designed to be very quick. Given two files several megabytes or gigabytes in size, you can produce hashes of them ahead of time and defer the comparisons to when you need them.

It's also generally easier to digitally sign hashes of data rather than large sets of data themselves. This is such an important feature that one of the most common uses of hashes in cryptography is to generate "digital" signatures.

Given the fact that it is easy to produce hashes of data, there's often no need to have both sets of data. Let's say you want to run an executable file on your computer. Before you do, though, you want to check that it really is the file you think it is and that no malicious actor has tampered with it. You can hash that file very quickly and easily, and as long as you have a copy of what the hash should look like, you can be fairly certain you have the file you want.

Here's a simple example:


```
$ shasum -a256 ~/bin/fop
87227baf4e1e78f6499e4905e8640c1f36720ae5f2bd167de325fd0d4ebc791c  /home/bob/bin/fop
```

If I know that the SHA-256 sum of the `fop` executable, as delivered by its vendor (Apache Foundation, in this case) is:


```
`87227baf4e1e78f6499e4905e8640c1f36720ae5f2bd167de325fd0d4ebc791c`
```

then I can be confident that the executable on my drive is indeed the same executable that Apache Foundation distributes on its website. This is where the lack of collisions (or at least the _difficulty in computing collisions_) property of hash functions is so important. If a malicious actor can craft a _replacement_ file that shares the same hash as the real file, then the process of verification is essentially useless.

In fact, there are more technical names for the various properties, and what I've described above mashes three important ones together. More accurately, those technical names are:

  1. **Pre-image resistance:** Given a hash, it should be difficult to find the message from which it was created, even if you know the hash function used.
  2. **Second pre-image resistance:** Given a message, it should be difficult to find another message that, when hashed, generates the same hash.
  3. **Collision resistance:** It should be difficult to find any two messages that generate the same hash.



_Collision resistance_ and _second pre-image resistance_ may sound like the same property, but they're subtly (and significantly) different. Pre-image resistance says that if you _already_ have a message, you will not be able to find another message with a matching hash. Collision resistance makes it hard for you to invent two messages that will generate the same hash and is a much harder property to fulfill in a hash function.

Allow me to return to the scenario of a malicious actor attempting to exchange a file (with a hash, which you can check) with another one. Now, to use cryptographic hashes "in the wild"—out there in the real world, beyond the perfectly secure, bug-free implementations populated by unicorns and overflowing with fat-free doughnuts—there are some important and difficult provisos that need to be met. Very paranoid readers may already have spotted some of them; in particular:

  1. You must have assurances that the copy of the hash you have has also not been subject to tampering.
  2. You must have assurances that the entity performing the hash performs and reports it correctly.
  3. You must have assurances that the entity comparing the two hashes does indeed report the result of that comparison correctly.



Ensuring that you can meet such assurances is not necessarily an easy task. This is one of the reasons Trusted Platform Modules (TPMs) are part of many computing systems. They act as a hardware root of trust with capabilities to provide assurances about the cryptography tools verifying the authenticity of important binary data. TPMs are a useful and important tool for real-world systems, and I plan to write an article about them in the future.

* * *

_This article was originally published on [Alice, Eve, and Bob][2] and is adapted and reprinted with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/hash-functions

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_OpenData_CityNumbers.png?itok=lC03ce76 (City with numbers overlay)
[2]: https://aliceevebob.com/2020/06/16/whats-a-hash-function/
