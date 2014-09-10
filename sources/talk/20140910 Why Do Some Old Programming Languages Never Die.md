(translating by runningwater)
Why Do Some Old Programming Languages Never Die?
================================================================================
> We like what we already know.

![](http://a4.files.readwrite.com/image/upload/c_fill,h_900,q_70,w_1600/MTIzMDQ5NjY0MTUxMjU4NjM2.jpg)

Many of today’s most well-known programming languages are old enough to vote. PHP is 20. Python is 23. HTML is 21. Ruby and JavaScript are 19. C is a whopping 42 years old.

Nobody could have predicted this. Not even computer scientist [Brian Kernighan][1], co-author of the very first book on C, which is still being printed today. (The language itself was the work of Kernighan's [co-author Dennis Ritchie][2], who passed away in 2011.)

“I dimly recall a conversation early on with the editors, telling them that we’d sell something like 5,000 copies of the book,” Kernighan told me in a recent interview. “We managed to do better than that. I didn’t think students would still be using a version of it as a textbook in 2014.”

What’s especially remarkable about C's persistence is that Google developed a new language, Go, specifically to more efficiently solve the problems C solves now. Still, it’s hard for Kernighan to imagine something like Go outright killing C no matter how good it is.

“Most languages don’t die—or at least once they get to a certain level of acceptance they don’t die," he said. "C still solves certain problems better than anything else, so it sticks around.”

### Write What You Know ###

Why do some computer languages become more successful than others? Because developers choose to use them. That’s logical enough, but it gets tricky when you want to figure out why developers choose to use the languages they do.

Ari Rabkin and Leo Meyerovich are researchers from, respectively, Princeton and the University of California at Berkeley who devoted two years to answering just that question. Their resulting paper, [Empirical Analysis of Programming Language Adoption][3], describes their analysis of more than 200,000 Sourceforge projects and polling of more than 13,000 programmers. 

Their main finding? Most of the time programmers choose programming languages they know.

“There are languages we use because we’ve always used them,” Rabkin told me. “For example, astronomers historically use IDL [Interactive Data Language] for their computer programs, not because it has special features for stars or anything, but because it has tremendous inertia. They have good programs they’ve built with it that they want to keep.”

In other words, it’s partly thanks to name recognition that established languages retain monumental staying power. Of course, that doesn’t mean popular languages don’t change. Rabkin noted that the C we use today is nothing like the language Kernighan first wrote about, which probably wouldn’t be fully compatible with a modern C compiler.

“There’s an old, relevant joke in which an engineer is asked which language he thinks people will be using in 30 years and he says, ‘I don’t know, but it’ll be called Fortran’,” Rabkin said. “Long-lived languages are not the same as how they were when they were designed in the '70s and '80s. People have mostly added things instead of removed because that doesn’t break backwards compatibility, but many features have been fixed.”

This backwards compatibility means that not only can programmers continue to use languages as they update programs, they also don’t need to go back and rewrite the oldest sections. That older ‘legacy code’ keeps languages around forever, but at a cost. As long as it’s there, people’s beliefs about a language will stick around, too. 

### PHP: A Case Study Of A Long-Lived Language ###

Legacy code refers to programs—or portions of programs—written in outdated source code. Think, for instance, of key programming functions for a business or engineering project that are written in a language that no one supports. They still carry out their original purpose and are too difficult or expensive to rewrite in modern code, so they stick around, forcing programmers to turn handsprings to ensure they keep working even as other code changes around them.

Any language that's been around more than a few years has a legacy-code problem of some sort, and PHP is no exception. PHP is an interesting example because its legacy code is distinctly different from its modern code, in what proponents say—and critics admit—is a huge improvement.

Andi Gutmans is a co-inventor of the Zend Engine, the compiler that became standard by the time PHP4 came around. Gutmans said he and his partner originally wanted to improve PHP3, and were so successful that the original PHP inventor, Rasmus Lerdorf, joined their project. The result was a compiler for PHP4 and its successor, PHP5.

As a consequence, the PHP of today is quite different from its progenitor, the original PHP. Yet in Gutmans' view, the base of legacy code written in older PHP versions keeps alive old prejudices against the language—such as the notion that PHP is riddled with security holes, or that it can't "scale" to handle large computing tasks. 

"People who criticize PHP are usually criticizing where it was in 1998,” he says. “These people are not up-to-date with where it is today. PHP today is a very mature ecosystem.”

Today, Gutmans says, the most important thing for him as a steward is to encouraging people to keep updating to the latest versions. “PHP is a big enough community now that you have big legacy code bases," he says. "But generally speaking, most of our communities are on PHP5.3 at minimum.”

The issue is that users never fully upgrade to the latest version of any language. It’s why many Python users are still using Python 2, released in 2000, instead of Python 3, released in 2008. Even after six years major users like Google still aren’t upgrading. There are a variety of reasons for this, but it made many developers wary about taking the plunge.

“Nothing ever dies," Rabkin says. "Any language with legacy code will last forever. Rewrites are expensive and if it’s not broke don’t fix it.”

### Developer Brains As Scarce Resources ###

Of course, developers aren’t choosing these languages merely to maintain pesky legacy code. Rabkin and Meyerovich found that when it comes to language preference, age is just a number. As Rabkin told me:

> A thing that really shocked us and that I think is important is that we grouped people by age and asked them how many languages they know. Our intuition was that it would gradually rise over time; it doesn’t. Twenty-five-year-olds and 45-year-olds all know about the same number of languages. This was constant through several rewordings of the question. Your chance of knowing a given language does not vary with your age.

In other words, it’s not just old developers who cling to the classics; young programmers are also discovering and adopting old languages for the first time. That could be because the languages have interesting libraries and features, or because the communities these developers are a part of have adopted the language as a group.

“There’s a fixed amount of programmer attention in the world,” said Rabkin. “If a language delivers enough distinctive value, people will learn it and use it. If the people you exchange code and knowledge with you share a language, you’ll want to learn it. So for example, as long as those libraries are Python libraries and community expertise is Python experience, Python will do well.”

Communities are a huge factor in how languages do, the researchers discovered. While there's not much difference between high level languages like Python and Ruby, for example, programmers are prone to develop strong feelings about the superiority of one over the other.

“Rails didn’t have to be written in Ruby, but since it was, it proves there were social factors at work,” Rabkin says. “For example, the thing that resurrected Objective-C is that the Apple engineering team said, ‘Let’s use this.’ They didn’t have to pick it.”

Through social influence and legacy code, our oldest and most popular computer languages have powerful inertia. How could Go surpass C? If the right people and companies say it ought to. 

“It comes down to who is better at evangelizing a language,” says Rabkin.

Lead image by [Blake Patterson][4]

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/09/02/programming-language-coding-lifetime

作者：[Lauren Orsini][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://readwrite.com/author/lauren-orsini
[1]:http://en.wikipedia.org/wiki/Brian_Kernighan
[2]:http://en.wikipedia.org/wiki/Dennis_Ritchie
[3]:http://asrabkin.bitbucket.org/papers/oopsla13.pdf
[4]:https://www.flickr.com/photos/blakespot/2444037775/