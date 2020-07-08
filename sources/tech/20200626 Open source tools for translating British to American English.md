[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open source tools for translating British to American English)
[#]: via: (https://opensource.com/article/20/6/british-american-cli-translator)
[#]: author: (Jeff Macharyas https://opensource.com/users/jeffmacharyas)

Open source tools for translating British to American English
======
Convert British English to American English (and vice versa) with these
command-line translators.
![Red telephone booth on a street in England][1]

Last Christmas, my wife and I traveled to my hometown of Ft. Pierce, Florida, and frequented a local establishment on the beach. There, we met a couple from The Midlands in the UK. The music was loud and so was the beer, so it was a bit hard to hear. Plus, even though it "seemed" they were speaking English, it was sometimes a challenge to understand what they were saying. I thought my time in Australia would have given me enough linguistic power, but, alas, a lot went over my head. There was more than the usual "soccer is football" or "trunk is a boot" sort of confusion.

Fortunately, there are open source solutions to translate "British" into "American." We may speak the same language, but our shared speech takes more twists and turns than Zig Zag Hill in Shaftesbury, Dorset!

If you happen to be at the bar with your Linux laptop, you can use a handy open source command-line program, cleverly called the [American British English Translator][2] (MIT license).

I installed the Translator on my repurposed MacBook running Linux with:


```
`$ npm install -g american-british-english-translator`
```

Which required me to [install Node.js][3] first.

### I do declare!

In addition to translating words and phrases, the American British English Translator will analyze, ummm, analyse, documents. I gave this a go with a popular document called _The Declaration of Independence_. (tl;dr). It analyzed the document and returned many results. One of the more interesting was:


```
fall:
issue: Different meanings
details:
American English: autumn
British English:
"""
to become pregnant. (Either as in 'I fell pregnant' or as in 'She fell for a baby.');
```

Not exactly "taken captive on the high seas" as the *Declaration's *authors accused:

> "He has constrained our fellow Citizens taken Captive on the high Seas to bear Arms against their Country, to become the executioners of their friends and Brethren, or to fall themselves by their Hands."

### Along comes MARY

For simple word replacements, you can try [Common_Language][4], an open source (MIT license) Python script.

Of course, if you're sharing a pint with your mates, you may need to actually speak to them in a voice and language they will understand. This would be a good time to bring MARY along with you.

[MaryTTS][5] is an open source, multilingual text-to-speech synthesis platform written in Java (GNU license). The handy [browser-based interface][6] makes it easy to translate your American bar talk into right good English (or other languages) in either a male or female voice.

So, now I am ready to meet my British friends (when it is safe to do so again), grab a few pints, and—Bob's your uncle—speak English like a native! Cheerio, y'all!

Translating documentation takes time and effort, but not nearly as much as starting over from...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/british-american-cli-translator

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffmacharyas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/england-telephone-booth-street.jpg?itok=JQsc_piX (Red telephone booth on a street in England)
[2]: https://github.com/hyperreality/American-British-English-Translator
[3]: https://nodejs.org/en/download/
[4]: https://github.com/willettk/common_language
[5]: https://github.com/marytts/marytts
[6]: http://mary.dfki.de:59125/
