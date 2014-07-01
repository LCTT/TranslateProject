翻译中 by小眼儿

How Many Languages Do Developers Need To Know?
================================================================================
![](http://readwrite.com/files/styles/1400_0/public/fields/code%20example%20Flickr%20Ruiwen%20Chua.jpg)

> Big companies like Apple, Facebook and Google are developing their own programming languages, forcing developers to adapt.

At its Worldwide Developer Conference last week, Apple announced its new programming language [Swift][1]. It’s the latest in a rash of new languages developed by big tech companies, in some cases for specific use with their own platforms.

Apple has Swift for iOS developers; [Facebook has Hack][2], a language for back-end development. Google, meanwhile, has its own entries—the would-be Javascript replacement Dart and a new general programming language called Go.

This rash of new languages raises a number of issues for developers. Perhaps the most significant is one my colleague [Adriana Lee][3] raised after Apple's Swift announcement:

> (How many languages are devs supposed to learn?)
> — Adriana Lee (@adra_la) [June 2, 2014][4]

### A Computer-Language Babel ###

There are already [hundreds of programming languages][5] in existence, and more are popping into existence all the time. Many are designed for use in a relatively narrow range of applications, and large numbers never catch on beyond small groups of coders.

Similarly, big tech companies have been developing new languages for about as long as there have been big tech companies. The [seminal general-purpose language C][6] originated at AT&T Bell Labs in the early 1970s. Java, now the primary language for development of Android apps, was [born at Sun Microsystems][7] in the 1990s.

What's different these days is the extent to which companies embrace new languages to further their specific business objectives—a process that also has the effect of creating a dedicated base of developers who are effectively "locked in" to a company's particular platform. That sort of dual strategy dates back at least to Sun's introduction of Java, which the company promoted as a way to challenge Microsoft's dominance on the PC desktop. (Things didn't work out the way Sun planned, although Java eventually found a home in enterprise middleware systems before Google adopted it for Android.)

It's also clearly Apple's goal with Swift. Should it live up to the company's early hype, Swift seems likely to simplify iOS app development by filing the rough edges off Objective-C, the current lingua franca of iOS and Mac OS X developers. But it will also require those same developers to learn the ins and outs of a new language that they're unlikely to use anywhere else.

### Why Companies Roll Their Own ###

Which cuts against the ingrained "don’t reinvent the wheel” philosophy that animates most developers. So why don't more companies just adopt already existing languages to new uses?

One answer is simply that companies build their own languages because they can. Designing a new language can be complex, but it's not particularly resource-intensive. What's hard is building support for it, both in terms of providing software resources (shared code libraries, APIs, compilers, documentation and so forth) and winning the hearts and minds of developers. Companies are uniquely positioned to do both.

There's also the fact that existing languages are often difficult to shoehorn into today's complex code frameworks. Take, for instance, [Facebook's decision to create Hack][8], a superset of the [scripting language PHP][9] that's commonly used in Web development.

Facebook's main goal with Hack—a common one these days—was to improve code reliability, in this case by enforcing data-type checking before a program is executed. Such checks ensure that a program won't, say, try to interpret an integer as a string of characters, an error that could yield unpredictable results if not caught. In Hack, those checks take place in advance so that programmers can identify such errors long before their code goes live.

According to Julien Verlaguet, a core developer on Facebook’s Hack team, the company first looked for an an existing language that might allow for more efficient programming. But much of Facebook was already built on PHP, and the company has built up a substantial software infrastructure to support PHP and its offshoots. While it's possible to make PHP work with code written in a different language, it's not easy—nor is it fast.

“Let’s say I try to rewrite our PHP codebase in Scala,” Verlaguet said. “It’s a well designed, beautiful language, but it’s not at all compatible with PHP. Everytime I need to call to PHP from the Scala part of the code base, I’ll lose performance speed. We would have liked to use an existing language but for us, it just wasn’t an option.”

Instead, Facebook invented Hack, which has enough in common with PHP that it can share the company's existing infrastructure. The vast majority of the Facebook codebase has been migrated from PHP to Hack, said Verlaguet, but the company has open sourced the language in hopes that independent developers will find uses for it outside of Facebook. 

“You can still use PHP,” he said. “But we’re hoping you’ll want to use Hack.”

### Who Holds The Power ###

Therein lies the balance of power between companies and developers. Companies can make their languages as specific as they like. But if developers don’t want to use them, nobody is going to—outside, that is, of anyone who might harbor hopes of one day working at the company that invented the language.

It’s not unusual for companies to make it easiest to develop in one language over another. For example, you would use Objective-C to develop iOS apps, but Java to develop Android apps. This has never been a major sticking point with developers because both Objective-C and Java are general purpose object-oriented languages. They’re useful for a number of purposes. 

Hack, Dart, Go, and Swift, however, so far have only proven useful for particular company-designated programming solutions, usually in tandem with that company’s programming environment of choice. Granted, it may be too soon to judge. Hack, for example, can be used in several back-end implementations; it’s just so new that Facebook doesn’t yet have any data that people want to use it that way.

It’s not that developers aren’t capable of learning multiple languages. Most already do. Think of them like the Romance languages—if you know Spanish, it’ll be easier to learn French and so on than if you didn’t already know one. Likewise, if you already know Java, it’ll be easier to learn Ruby or Perl. And if you know PHP, you basically already know Hack.

On the contrary, it’s more of a question of habit. If Java already solves your specific problems, you don’t have any incentive to learn Ruby. And if you are happy coding iOS apps in Objective-C, you’re not going to feel very tempted to pick up Swift.

To some developers, though, ecosystem-specific languages just make life harder for everybody. Freelance designer Jack Watson-Hamblin, for instance, told me that initiatives like Apple's Swift risk overburdening programmers and fragmenting the developer community:

> It's important for programmers to know multiple languages, but forcing them to keep up with new languages all the time doesn't make sense. If I'm making a simple cross-platform app, I don't want to have to know four languages to do it. I only want to use the single-purpose language if I really need to.

Watson-Hamblin argues that when companies each build their own language for their own needs, it slows down overall progress both by dividing the attention of coders and by enforcing a monolithic perspective on development within that language. "When companies are in charge of a language vs. an open-source community, it's like the difference between a corporation and a start-up," he said. Communities are more flexible and adaptive by definition. 

Of course, Apple had [a lot of very good reasons to start from scratch][10] with Swift, just as Facebook did when it invented Hack. That doesn't mean it's not going to force change on developers—some of it doubtless unwelcome. 

“As new languages are invented, it gets more hegemonic,” said Verlaguet. “It can be frustrating to have to keep up. But on the other hand, you’re more likely to have a new language to fit your exact problem. Imagine the reverse—a world where programmers used the same language for everything. It’d be a language that could do everything poorly but nothing well.” 

Lead image by [Flickr user Ruiwen Chua][11], CC 2.0

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/06/17/apple-swift-facebook-hack-google-dart

译者：[Mr小眼儿](https://github.com/tinyeyeser) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://developer.apple.com/swift/
[2]:http://readwrite.com/2014/03/20/facebook-new-programming-language-hack
[3]:http://readwrite.com/author/adriana-lee#awesm=~oGfPbJlSrFBamJ
[4]:https://twitter.com/adra_la/statuses/473537386266112000
[5]:http://en.wikipedia.org/wiki/List_of_programming_languages
[6]:http://en.wikipedia.org/wiki/C_(programming_language)
[7]:http://en.wikipedia.org/wiki/Java_(programming_language)
[8]:http://readwrite.com/2014/03/20/facebook-new-programming-language-hack
[9]:http://en.wikipedia.org/wiki/PHP
[10]:http://blog.erratasec.com/2014/06/why-it-had-to-be-swift.html#.U58BJI1dXtA
[11]:https://www.flickr.com/photos/ruiwen/3260095534
