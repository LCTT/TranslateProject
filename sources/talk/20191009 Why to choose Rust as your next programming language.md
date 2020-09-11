[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why to choose Rust as your next programming language)
[#]: via: (https://opensource.com/article/19/10/choose-rust-programming-language)
[#]: author: (Ryan Levick https://opensource.com/users/ryanlevick)

Why to choose Rust as your next programming language
======
Selecting a programming language can be complicated, but some
enterprises are finding that switching to Rust is a relatively easy
decision.
![Programming books on a shelf][1]

Choosing a programming language for a project is often a complicated decision, particularly when it involves switching from one language to another. For many programmers, it is not only a technical exercise but also a deeply emotional one. The lack of known or measurable criteria for picking a language often means the choice digresses into a series of emotional appeals.

I've been involved in many discussions about choosing a programming language, and they usually conclude in one of two ways: either the decision is made using measurable, yet unimportant criteria while ignoring relevant, yet hard to measure criteria; or it is made using anecdotes and emotional appeals.

There has been one language selection process that I've been a part of that has gone—at least so far—rather smoothly: the growing [consideration inside Microsoft][2] for using [Rust][3].

This article will explore several issues related to choosing a programming language in general and Rust in particular. They are: What are the criteria usually used for selecting a programming language, especially in large businesses, and why does this process rarely end successfully? Why has the consideration of Rust in Microsoft gone smoothly so far, and are there some general best practices that can be gleaned from it?

### Criteria for choosing a language

There are many criteria for deciding whether to switch to a new programming language. In general, the criteria that are most easily measured are the ones that are most often talked about, even if they are less important than other, more difficult-to-measure criteria.

#### Technical criteria

The first group of criteria are the technical considerations; they are often the first that come to mind because they are the easiest to measure.

Interestingly, the technical costs (e.g., build system integration, monitoring, tooling, support libraries, and more) are often easier to measure than the technical benefits. This is especially detrimental to the adoption of new programming languages, as the downsides of adoption are often the clearest part of the picture.

While some technical benefits (like performance) can be measured relatively easily, others are much harder to measure. For example, what are the relative merits of a dynamic typing system (like in Python) to a relatively verbose and feature-poor system (like Java), and how does this change when compared to stronger typed systems like Scala or Haskell? Many people have strong gut feelings that such technical differences should be taken very seriously in language considerations, but they are no good ways to measure them.

A side effect of the discrepancy in measurement ease is that the easiest-to-measure items are often given the most weight in the decision-making process even if that would not be the case with perfect information. This not only throws off the cost/benefit analysis but also the process of assigning importance to different costs and benefits.

#### Organizational criteria

Organizational criteria, which are the second consideration, include:

  * How easy will it be to hire developers in this language?
  * How easy is it to enforce programming standards?
  * How quickly, on average, will developers be able to deliver software?



Costs and benefits of organizational criteria are hard to measure. People usually have vague, "gut feeling" answers to them, which create strong opinions on the matter. Unfortunately, however, it's often very difficult to measure these criteria. For example, it might be obvious to most that TypeScript allows programmers to deliver functioning, relatively bug-free software to customers more quickly than C does, but where is the data to back this up?

Moreover, it's often extremely difficult to assign importance weights to these criteria. It's easy to see that Go enforces standardized coding practices more easily than Scala (due to the wide use of gofmt), but it is extremely difficult to measure the concrete benefits to a company from standardizing codebases.

These criteria are still extremely important but, because of the difficulty in measuring them, they are often either ignored or reasoned about through anecdotes.

#### Emotional criteria

Third are the emotional criteria, which tend to be overlooked if not outright dismissed.

Software programming has traditionally tried to emulate more true "engineering" practices, where technical considerations are generally the most important. Some would argue that programming languages are "just tools" and should be measured only against technical criteria. Others would argue that programming languages assist the programmer in some of the more artistic aspects of the job. These criteria are extremely difficult to measure in any meaningful way.

In general, this comes down to how happy (and thus productive) programmers feel using this language. Such considerations can have a real impact on programmers, but how this translates to benefitting to an entire team is next to impossible to measure.

Because of the difficulty of quantifying these criteria, this is often ignored. But does this mean that emotional considerations of programming languages have no significant impact on programmers or programming organizations?

#### Unknown criteria

Finally, there's a set of criteria that are often overlooked because a new programming language is usually judged by the criteria set by the language currently in use. New languages may have capabilities that have no equivalent in other languages, so many people will not be familiar with them. Having no exposure to those capabilities may mean the evaluator unknowingly ignores or downplays them.

These criteria can be technical (e.g., the merits of Kotlin data classes over Java constructs), organizational (e.g., how helpful Elm error messages are for teaching those new to the language), or emotional (e.g., the way Ruby makes the programmer feel when writing it).

Because these aspects are hard to measure, and someone completely unfamiliar with them has no existing framework for judging them based on experience, intuition, or anecdote, they are often undervalued versus more well-understood criteria—if not outright ignored.

### Why Rust?

This brings us back to the growing excitement for Rust in Microsoft. I believe the discussions around Rust adoption have gone relatively smoothly so far because Rust offers an extremely clear and compelling advantage—not only over the language it seeks to replace (C++)—but also over any other language practically available to industry: great performance, a high level of control, and being memory safe.

Microsoft's decision to investigate Rust (and other languages) began due to the fact that roughly [70% of Common Vulnerabilities and Exposures][4] (CVEs) in Microsoft products were related to memory safety issues in C and C++. When it was discovered that most of the affected codebases could not be effectively rewritten in C# because of performance concerns, the search began. Rust was viewed as the only possible candidate to replace C++. It was similar enough that not everything had to be reworked, but it has a differentiator that makes it measurably better than the current alternative: being able to eliminate nearly 70% of Microsoft's most serious security vulnerabilities.

There are other reasons beyond memory safety, performance, and control that make Rust appealing (e.g., strong type safety guarantees, being an extremely loved language, etc.) but as expected, they were hard to talk about because they were hard to measure. In general, most people involved in the selection process were more interested in verifying that these other aspects of the language weren't perceivably worse than C++ but, because measuring these aspects was so difficult, they weren't considered active reasons to adopt the language.

However, the Microsoft teams that had already adopted Rust, like for the [IoT Edge Security Daemon][5], touted other aspects of the language (particularly "correctness" due to the advanced type system) as the reasons they were most keen on investing more in the language. These teams couldn't provide reliable measurements for these criteria, but they had clearly developed an intuition that this aspect of the language was extremely important.

With Rust at Microsoft, the main criteria being judged happened to be an easily measurable one. But what happens when an organization's most important issues are hard to measure? These issues are no less important just because they are currently difficult to measure.

### What now?

Having clearly measurable criteria is important when adopting a new programming language, but this does not mean that hard-to-measure criteria aren't real and shouldn't be taken seriously. We simply lack the tools to evaluate new languages holistically.

There has been some research into this question, but it has not yet produced anything that has been widely adopted by industry. While the case for Rust was relatively clear inside Microsoft, this doesn't mean new languages should be adopted only where there is one clear, technical reason to do so. We should become better at evaluating more aspects of programming languages beyond just the traditional ones (such as performance).

The path to Rust adoption is just beginning at Microsoft, and having just one reason to justify investment in Rust is definitely not ideal. While we're beginning to form collective, anecdotal evidence to justify Rust adoption further, there is definitely a need to quantify this understanding better and be able to talk about it in more objective terms.

We're still not quite sure how to do this, but stay tuned for more as we go down this path.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/choose-rust-programming-language

作者：[Ryan Levick][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ryanlevick
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/books_programming_languages.jpg?itok=KJcdnXM2 (Programming books on a shelf)
[2]: https://msrc-blog.microsoft.com/tag/rust
[3]: https://www.rust-lang.org/
[4]: https://github.com/microsoft/MSRC-Security-Research/blob/master/presentations/2019_02_BlueHatIL/2019_01%20-%20BlueHatIL%20-%20Trends%2C%20challenge%2C%20and%20shifts%20in%20software%20vulnerability%20mitigation.pdf
[5]: https://msrc-blog.microsoft.com/2019/09/30/building-the-azure-iot-edge-security-daemon-in-rust/
