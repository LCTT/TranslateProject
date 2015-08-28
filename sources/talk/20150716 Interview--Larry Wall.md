Interview: Larry Wall
================================================================================
> Perl 6 has been 15 years in the making, and is now due to be released at the end of this year. We speak to its creator to find out what’s going on.

Larry Wall is a fascinating man. He’s the creator of Perl, a programming language that’s widely regarded as the glue holding the internet together, and mocked by some as being a “write-only” language due to its density and liberal use of non-alphanumeric characters. Larry also has a background in linguistics, and is well known for delivering entertaining “State of the Onion” presentations about the future of Perl.

At FOSDEM 2015 in Brussels, we caught up with Larry to ask him why Perl 6 has taken so long (Perl 5 was released in 1994), how difficult it is to manage a project when everyone has strong opinions and pulling in different directions, and how his background in linguistics influenced the design of Perl from the start. Get ready for some intriguing diversions…

![](http://www.linuxvoice.com/wp-content/uploads/2015/07/wall1.jpg)

**Linux Voice: You once had a plan to go and find an undocumented language somewhere in the world and create a written script for it, but you never had the opportunity to fulfil this plan. Is that something you’d like to go back and do now?**

Larry Wall: You have to be kind of young to be able to carry that off! It’s actually a lot of hard work, and organisations that do these things don’t tend to take people in when they’re over a certain age. Partly this is down to health and vigour, but also because people are much better at picking up new languages when they’re younger, and you have to learn the language before making a script for it.

I started trying to teach myself Japanese about 10 years ago, and I could speak it quite well, because of my phonology and phonetics training – but it’s very hard for me to understand what anybody says. So I can go to Japan and ask for directions, but I can’t really understand the answers!

> “With Perl 6, we found some ways to make the computer more sure about what the user is talking about.”

So usually learning a language well enough to develop a writing system, and to at least be conversational in the language, takes some period of years before you can get to the point where you can actually do literacy and start educating people on their own culture, as it were. And then you teach them to write about their own culture as well.

Of course, if you have language helpers – and we were told not to call them “language informants”, or everyone would think we were working for the CIA! – if you have these people, you can get them to come in and help you learn the foreign language. They are not teachers but there are ways of eliciting things from someone who’s not a language teacher – they can still teach you how to speak. They can take a stick and point to it and say “that’s a stick”, and drop it and say “the stick falls”. Then you start writing things down and systematising things.

The motivation that most people have, going out to these groups, is to translate the Bible into their languages. But that’s only one part of it; the other is also culture preservation. Missionaries get kind of a bad rep on that, because anthropologists think they should be left to sit their in their own culture. But somebody is probably going to change their culture anyway – it’s usually the army, or businesses coming in, like Coca Cola or the sewing machine people, or missionaries. And of those three, the missionaries are the least damaging, if they’re doing their job right.

**LV: Many writing systems are based on existing scripts, and then you have invented ones like Greenlandic…**

LW: The Cherokee invented their own just by copying letters, and they have no mapping much to what we think of letters, and it’s fairly arbitrary in that sense. It just has to represent how the people themselves think of the language, and sufficiently well to communicate. Often there will be variations on Western orthography, using characters from Latin where possible. Tonal languages have to mark the tones somehow, by accents or by numbers.

As soon as you start leaning towards a phoenetic or phonological representation, then you also start to lose dialectical differences – or you have to write the dialectal differences. Or you have conventional spelling like we have in English, but pronunciation that doesn’t really match it.

**LV: When you started working on Perl, what did you take from your background in linguistics that made you think: “this is really important in a programming language”?**

LW: I thought a lot about how people use languages. In real languages, you have a system of nouns and verbs and adjectives, and you kind of know which words are which type. And in real natural languages, you have a lot of instances of shoving one word into a different slot. The linguistic theory I studied was called tagmemics, and it accounts for how this works in a natural language – that you could have something that you think of as a noun, but you can verb it, and people do that all time.

You can pretty much shove anything in any slot, and you can communicate. One of my favourite examples is shoving an entire sentence in as an adjective. The sentence goes like this: “I don’t like your I-can-use-anything-as-an-adjective attitude”!

So natural language is very flexible this way because you have a very intelligent listener – or at least, compared with a computer – who you can rely on to figure out what you must have meant, in case of ambiguity. Of course, in a computer language you have to manage the ambiguity much more closely.

Arguably in Perl 1 through to 5 we didn’t manage it quite adequately enough. Sometimes the computer was confused when it really shouldn’t be. With Perl 6, we discovered some ways to make the computer more sure about what the user is talking about, even if the user is confused about whether something is really a string or a number. The computer knows the exact type of it. We figured out ways of having stronger typing internally but still have the allomorphic “you can use this as that” idea.

![](http://www.linuxvoice.com/wp-content/uploads/2015/07/wall2.jpg)

**LV: For a long time Perl was seen as the “glue” language of the internet, for fitting bits and pieces together. Do you see Perl 6 as a release to satisfy the needs of existing users, or as a way to bring in new people, and bring about a resurgence in the language?**

LW: The initial intent was to make a better Perl for Perl programmers. But as we looked at the some of the inadequacies of Perl 5, it became apparent that if we fixed these inadequacies, Perl 6 would be more applicable, as I mentioned in my talk – like how J. R. R. Tolkien talked about applicability [see http://tinyurl.com/nhpr8g2].

The idea that “easy things should be easy and hard things should be possible” goes way back, to the boundary between Perl 2 and Perl 3. In Perl 2, we couldn’t handle binary data or embedded nulls – it was just C-style strings. I said then that “Perl is just a text processing language – you don’t need those things in a text processing language”.

But it occurred to me at the time that there were a large number of problems that were mostly text, and had a little bit of binary data in them – network addresses and things like that. You use binary data to open the socket but then text to process it. So the applicability of the language more than doubled by making it possible to handle binary data.

That began a trade-off about what things should be easy in a language. Nowadays we have a principle in Perl, and we stole the phrase Huffman coding for it, from the bit encoding system where you have different sizes for characters. Common characters are encoded in a fewer number of bits, and rarer characters are encoded in more bits.

> “There had to be a very careful balancing act. There were just so many good ideas at the beginning.”

We stole that idea as a general principle for Perl, for things that are commonly used, or when you have to type them very often – the common things need to be shorter or more succinct. Another bit of that, however, is that they’re allowed to be more irregular. In natural language, it’s actually the most commonly used verbs that tend to be the most irregular.

And there’s a reason for that, because you need more differentiation of them. One of my favourite books is called The Search for the Perfect Language by Umberto Eco, and it’s not about computer languages; it’s about philosophical languages, and the whole idea that maybe some ancient language was the perfect language and we should get back to it.

All of those languages make the mistake of thinking that similar things should always be encoded similarly. But that’s not how you communicate. If you have a bunch of barnyard animals, and they all have related names, and you say “Go out and kill the Blerfoo”, but you really wanted them to kill the Blerfee, you might get a cow killed when you want a chicken killed.

So in realms like that it’s actually better to differentiate the words, for more redundancy in the communication channel. The common words need to have more of that differentiation. It’s all about communicating efficiently, and then there’s also this idea of self-clocking codes. If you look at a UPC label on a product – a barcode – that’s actually a self-clocking code where each pair of bars and spaces is always in a unit of seven columns wide. You rely on that – you know the width of the bars will always add up to that. So it’s self-clocking.

There are other self-clocking codes used in electronics. In the old transmission serial protocols there were stop and start bits so you could keep things synced up. Natural languages also do this. For instance, in the writing of Japanese, they don’t use spaces. Because the way they write it, they will have a Kanji character from Chinese at the head of each phrase, and then the endings are written in the a syllabary.

**LV: Hiragana, right?**

LW: Yes, Hiragana. So naturally the head of each phrase really stands out with this system. Similarly, in ancient Greek, most of the verbs were declined or conjugated. So they had standard endings were sort-of a clocking mechanism. Spaces were optional in their writing system as well – it was a more modern invention to put the spaces in.

So similarly in computer languages, there’s value in having a self-clocking code. We rely on this heavily in Perl, and even more heavily in Perl 6 than in previous releases. The idea that when you’re parsing an expression, you’re either expecting a term or an infix operator. When you’re expecting a term you might also get a prefix operator – that’s kind-of in the same expectation slot – and when you’re expecting an infix you might also get a postfix for the previous term.

But it flips back and forth. And if the compiler actually knows which it is expecting, you can overload those a little bit, and Perl does this. So a slash when it’s expecting a term will introduce a regular expression, whereas a slash when you’re expecting an infix will be division. On the other hand, we don’t want to overload everything, because then you lose the self-clocking redundancy.

Most of our best error messages, for syntax errors, actually come out of noticing that you have two terms in a row. And then we try to figure out why there are two terms in a row – “oh, you must have left a semicolon out on the previous line”. So we can produce much better error messages than the more ad-hoc parsers.

![](http://www.linuxvoice.com/wp-content/uploads/2015/07/wall3.jpg)

**LV: Why has Perl 6 taken fifteen years? It must be hard overseeing a language when everyone has different opinions about things, and there’s not always the right way to do things, and the wrong way.**

LW: There had to be a very careful balancing act. There were just so many good ideas at the beginning – well, I don’t want to say they were all good ideas. There were so many pain points, like there were 361 RFCs [feature proposal documents] when I expected maybe 20. We had to sit back and actually look at them all, and ignore the proposed solutions, because they were all over the map and all had tunnel vision. Each one many have just changed one thing, but if we had done them all, it would’ve been a complete mess.

So we had to re-rationalise based on how people were actually hurting when they tried to use Perl 5. We started to look at the unifying, underlying ideas. Many of these RFCs were based on the fact that we had an inadequate type system. By introducing a more coherent type system we could fix many problems in a sane fashion and a cohesive fashion.

And we started noticing other ways how we could unify the featuresets and start reusing ideas in different areas. Not necessarily that they were the same thing underneath. We have a standard way of writing pairs – well, two ways in Perl! But the way of writing pairs with a colon could also be reused for radix notation, or for literal numbers in any base. It could also be used for various alternative forms of quoting. We say in Perl that it’s “strangely consistent”.

> “People who made early implementations of Perl 6 came back to me, cap in hand, and said “We really need a language designer.””

Similar ideas pop up, and you say “I’m already familiar with how that syntax works, but I see it’s being used for something else”. So it took some unity of vision to find these unifications. People who had the various ideas and made early implementations of Perl 6 came back to me, cap-in-hand, and said “We really need a language designer. Could you be our benevolent dictator?”

So I was the language designer, but I was almost explicitly told: “Stay out of the implementation! We saw what you did made out of Perl 5, and we don’t like it!” It was really funny because the innards of the new implementation started looking a whole lot like Perl 5 inside, and maybe that’s why some of the early implementations didn’t work well.

Because we were still feeling our way into the whole design, the implementations made a lot of assumptions about what VM should do and shouldn’t do, so we ended up with something like an object oriented assembly language. That sort of problem was fairly pervasive at the beginning. Then the Pugs guys came along and said “Let’s use Haskell, because it makes you think very clearly about what you’re doing. Let’s use it to clarify our semantic model underneath.”

So we nailed down some of those semantic models, but more importantly, we started building the test suite at that point, to be consistent with those semantic models. Then after that, the Parrot VM continued developing, and then another implementation, Niecza, came along and it was based on .NET. It was by a young fellow who was very smart and implemented a large subset of Perl 6, but he was kind of a loner, didn’t really figure out a way to get other people involved in his project.

At the same time the Parrot project was getting too big for anyone to really manage it inside, and very difficult to refactor. At that point the fellows working on Rakudo decided that we probably needed to be on more platforms than just the Parrot VM. So they invented a portability layer called NQP which stands for “Not Quite Perl”. They ported it to first of all run on the JVM (Java Virtual Machine), and while they were doing that they were also secretly working on a new VM called MoarVM. That became public a little over a year ago.

Both MoarVM and JVM run a pretty much equivalent set of regression tests – Parrot is kind-of trailing back in some areas. So that has been very good to flush out VM-specific assumptions, and we’re starting to think about NQP targeting other things. There was a Google Summer of Code project year to target NQP to JavaScript, and that might fit right in, because MoarVM also uses Node.js for much of its more mundane processing.

We probably need to concentrate on MoarVM for the rest of this year, until we actually define 6.0, and then the rest will catch up.

**LV: Last year in the UK, the government kicked off the Year of Code, an attempt to get young people interested in programming. There are lots of opinions about how this should be done – like whether you should teach low-level languages at the start, so that people really understand memory usage, or a high-level language. What’s your take on that?**

LW: Up until now, the Python community has done a much better job of getting into the lower levels of education than we have. We’d like to do something in that space too, and that’s partly why we have the butterfly logo, because it’s going to be appealing to seven year old girls!

But we do think that Perl 6 will be learnable as a first language. A number of people have surprised us by learning Perl 5 as their first language. And you know, there are a number of fairly powerful concepts even in Perl 5, like closures, lexical scoping, and features you generally get from functional programming. Even more so in Perl 6.

> “Until now, the Python community has done a much better job of getting into the lower levels of education.”

Part of the reason the Perl 6 has taken so long is that we have around 50 different principles we try to stick to, and in language design you’re end up juggling everything and saying “what’s really the most important principle here”? There has been a lot of discussion about a lot of different things. Sometimes we commit to a decision, work with it for a while, and then realise it wasn’t quite the right decision.

We didn’t design or specify pretty much anything about concurrent programming until someone came along who was smart enough about it and knew what the different trade-offs were, and that’s Jonathan Worthington. He has blended together ideas from other languages like Go and C#, with concurrent primitives that compose well. Composability is important in the rest of the language.

There are an awful lot of concurrent and parallel programming systems that don’t compose well – like threads and locks, and there have been lots of ways to do it poorly. So in one sense, it’s been worth waiting this extra time to see some of these languages like Go and C# develop really good high-level primitives – that’s sort of a contradiction in terms – that compose well.

--------------------------------------------------------------------------------

via: http://www.linuxvoice.com/interview-larry-wall/

作者：[Mike Saunders][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxvoice.com/author/mike/
