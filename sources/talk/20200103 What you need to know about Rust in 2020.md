[#]: collector: (lujun9972)
[#]: translator: (JonnieWayy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What you need to know about Rust in 2020)
[#]: via: (https://opensource.com/article/20/1/rust-resources)
[#]: author: (Ryan Levick https://opensource.com/users/ryanlevick)

What you need to know about Rust in 2020
======
While many programmers have long used Rust for hobby projects, in 2019,
the language attracted support from major technology companies, as the
top Rust articles on Opensource.com explain.
![Person using a laptop][1]

[Rust][2] has drawn plenty of attention from programmers on sites like Hacker News for a while. While many have long [loved using the language][3] for hobby projects, it didn't start catching on in industry until 2019, when this really started to change.

Over the last year, many large companies, including [Microsoft][4], [Facebook][5], and [Intel][6], came out in support of Rust, and many [smaller ones][7] took notice. As the first emcee at [RustFest][8], the largest Rust conference in Europe, in 2016, I didn't meet a single person professionally using Rust who didn't work at Mozilla. Three years later, it seemed like every other person I talked to at RustFest 2019 was using Rust in their day job for another company, whether as a game developer, a backend engineer at a bank, a creator of developer tools, or something else.

In 2019, Opensource.com also played a role by reporting on the growing interest in Rust. In case you missed them, here are the top articles about Rust on Opensource.com over the last year.

### Building the virtualization stack of the future with rust-vmm

Amazon's [Firecracker][9] is the virtualization technology that powers AWS Lambda and Fargate, and it is written completely in Rust. One of the technology's authors, Andreea Florescu, offers insight into Firecracker and its related technologies in [_**Building the virtualization stack of the future with rust-vmm**_][10].

Firecracker started life as a fork of Google's [CrosVM][11] but quickly diverged due to the differing needs of the two projects. Despite this, there are many common pieces that are best shared across the project and in any other virtual machine manager (VMM) written in Rust. With that in mind, the [rust-vmm][12] project started as a way for Amazon and Google, as well as Intel and Red Hat, to share common Rust "crates" (i.e., packages) with each other and the rest of the open source community. These include interfaces to KVM (Linux virtualization APIs), Virtio device support, and a kernel loader.

It's truly amazing to see some of the titans of the software industry working together around a common technology stack written in Rust. Given this and other partnerships around [technology stacks written in Rust][13], I wouldn't be surprised to see more of this in 2020.

### Why to choose Rust as your next programming language

Adopting a new language, especially at a large company with a long-established technology stack, is no easy task. I had the pleasure of writing [_**Why to choose Rust as your next programming language**_][14] about how Microsoft is looking into adopting Rust when so many other interesting programming languages have not been considered.

Choosing a programming language involves many different criteria—from technical to organizational to even emotional. Some of these criteria are easier to measure than others. For instance, it's easier to understand the costs of technical changes, like adapting build systems and building new tooling, than it is to understand organizational or emotional issues like how productive or happy developers will be using this new language. What's more, the easy-to-measure criteria are often cost-related, while the hard-to-measure criteria are often benefits-oriented. This often leads to costs getting more weight in the decision-making process, even though it's not necessarily true that the costs outweigh the benefits—it's just that they're easier to measure. This makes it unlikely for a company to adopt a new language.

However, one of Rust's largest benefits is how easy it is to measure its ability to write secure yet performant systems software. Given that 70% of severe vulnerabilities at Microsoft are due to memory-safety issues that Rust is designed to prevent, and that these issues cost the company billions of dollars per year, it's easy to measure and understand the benefits of adopting the language.

Whether full-scale adoption of Rust at Microsoft will happen remains to be seen, but Rust's future is bright if only for the fact that is has a clear and measurable benefit over existing technologies.

### Rust in 2020

Rust is really starting to gain traction in industry. Although it still has a long way to go to reach the popularity of languages like C++. I expect more companies to start adopting Rust in 2020. The Rust community must now set its sights on welcoming people and companies into the community while ensuring that the things that have driven the language to this point remain in place.

Rust is more than just a compiler and a set of libraries. It's a group of people who care about making systems programming easy, safe, and fun. The coming year will be critical in Rust's journey from a hobbyist language to one of the main languages used in the software industry.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/rust-resources

作者：[Ryan Levick][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ryanlevick
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: http://rust-lang.org/
[3]: https://insights.stackoverflow.com/survey/2019#technology-_-most-loved-dreaded-and-wanted-languages
[4]: https://youtu.be/o01QmYVluSw
[5]: https://youtu.be/kylqq8pEgRs
[6]: https://youtu.be/l9hM0h6IQDo
[7]: https://oxide.computer/blog/introducing-the-oxide-computer-company/
[8]: https://rustfest.eu
[9]: https://firecracker-microvm.github.io/
[10]: https://opensource.com/article/19/3/rust-virtual-machine
[11]: https://chromium.googlesource.com/chromiumos/platform/crosvm/
[12]: https://github.com/rust-vmm
[13]: https://bytecodealliance.org/
[14]: https://opensource.com/article/19/10/choose-rust-programming-language
