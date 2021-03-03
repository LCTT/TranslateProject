[#]: subject: (5 signs you might be a Rust programmer)
[#]: via: (https://opensource.com/article/21/3/rust-programmer)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 signs you might be a Rust programmer
======
During my journey to learning Rust, I've noticed a few common behaviors
of fellow Rustaceans.
![name tag that says hello my name is open source][1]

I'm a fairly recent [convert to Rust][2], which I started to learn around the end of April 2020. But, like many converts, I'm an enthusiastic evangelist. I'm also not a very good Rustacean, truth be told, in that my coding style isn't great, and I don't write particularly idiomatic Rust. I suspect this is partly because I never really finished learning Rust before diving in and writing quite a lot of code (some of which is coming back to haunt me) and partly because I'm just not that good a programmer.

But I love Rust, and so should you. It's friendly—well, more friendly than C or C++; it's ready for low-level systems tasks—more so than Python, it's well-structured—more than Perl; and, best of all, it's completely open source from the design level up—much more than Java, for instance.

Despite my lack of expertise, I noticed a few things that I suspect are common to many Rust enthusiasts and programmers. If you say "yes" to the following five signs (the first of which was sparked by some exciting recent news), you, too, might be a Rust programmer.

### 1\. The word "foundation" excites you

For Rust programmers, the word "foundation" will no longer be associated first and foremost with Isaac Asimov but with the newly formed [Rust Foundation][3]. Microsoft, Huawei, Google, AWS, and Mozilla are providing the directors (and presumably most of the initial funding) for the Foundation, which will look after all aspects of the language, "heralding Rust's arrival as an enterprise production-ready technology," [according to interim executive director][4] Ashley Williams. (On a side note, it's great to see a woman heading up such a major industry initiative.)

The Foundation seems committed to safeguarding the philosophy of Rust and ensuring that everybody has the opportunity to get involved. Rust is, in many ways, a poster-child example of an open source project. Not that it's perfect (neither the language nor the community), but in that there seem to be sufficient enthusiasts who are dedicated to preserving the high-involvement, low-bar approach to community, which I think of as core to much of open source. I strongly welcome the move, which I think can only help promote Rust's adoption and maturity over the coming years and months.

### 2\. You get frustrated by newsfeed references to Rust (the game)

There's another computer-related thing out there that goes by the name "Rust," and it's a "multi-player only survival video game." It's newer than Rust the language (having been announced in 2013 and released in 2018), but I was once searching for Rust-related swag and made the mistake of searching for the game by that name. The interwebs being what they are, this meant that my news feed is now infected with this alternative Rust beast, and I now get random updates from their fandom and PR folks. This is low-key annoying, but I'm pretty sure I'm not alone in the Rust (language) community. I strongly suggest that if you _do_ want to find out more about this upstart in the computing world, you use a privacy-improving (I refuse to say "privacy-preserving") [open source browser][5] to do your research.

### 3\. The word "unsafe" makes you recoil in horror

Rust (the language, again) does a _really_ good job of helping you do the Right Thing™, certainly in terms of memory safety, which is a major concern within C and C++ (not because it's impossible but because it's really hard to get right consistently). Dave Herman wrote a post in 2016 on why safety is such a positive attribute of the Rust language: [_Safety is Rust's fireflower_][6]. Safety (memory, type safety) may not be glamourous, but it's something you become used to—and grateful for—as you write more Rust, particularly if you're involved in any systems programming, which is where Rust often excels.

Now, Rust doesn't _stop_ you from doing the Wrong Thing™, but it does make you make a conscious decision when you wish to go outside the bounds of safety by making you use the `unsafe` keyword. This is good not only for you, as it will (hopefully) make you think really, really carefully about what you're putting in any code block that uses it; it is also good for anyone reading your code. It's a trigger-word that makes any half-sane Rustacean shiver at least slightly, sit upright in their chair, and think, "hmm, what's going on here? I need to pay special attention." If you're lucky, the person reading your code may be able to think of ways of rewriting it such that it _does_ make use of Rust's safety features or at least reduces the amount of unsafe code that gets committed and released.

### 4\. You wonder why there's no emoji for `?;` or `{:?}` or `::<>`

Everybody loves (to hate) the turbofish (`::<>`) but there are other semantic constructs that you see regularly in Rust code. In particular, `{:?}` (for string formatting) and `?;` (`?` is a way of propagating errors up the calling stack, and `;` ends the line/block, so you often see them together). They're so common in Rust code that you just learn to parse them as you go, and they're also so useful that I sometimes wonder why they've not made it into normal conversation, at least as emojis. There are probably others, too. What would be your suggestions?

### 5\. Clippy is your friend (and not an animated paperclip)

Clippy, the Microsoft animated paperclip, was a "feature" that Office users learned very quickly to hate and has become the starting point for many [memes][7]. On the other hand, `cargo clippy` is one of those [amazing Cargo commands][8] that should become part of every Rust programmer's toolkit. Clippy is a language linter and helps improve your code to make it cleaner, tidier, more legible, more idiomatic, and generally less embarrassing when you share it with your colleagues or the rest of the world. Cargo has arguably rehabilitated the name "Clippy," and although it's not something I'd choose to name one of my kids, I don't feel a sense of unease whenever I come across the term on the web anymore.

* * *

_This article was originally published on [Alice, Eve, and Bob][9] and is reprinted with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/rust-programmer

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_OSDC_IntroOS_520x292_FINAL.png?itok=woiZamgj (name tag that says hello my name is open source)
[2]: https://opensource.com/article/20/6/why-rust
[3]: https://foundation.rust-lang.org/
[4]: https://foundation.rust-lang.org/posts/2021-02-08-hello-world/
[5]: https://opensource.com/article/19/7/open-source-browsers
[6]: https://www.thefeedbackloop.xyz/safety-is-rusts-fireflower/
[7]: https://knowyourmeme.com/memes/clippy
[8]: https://opensource.com/article/20/11/commands-rusts-cargo
[9]: https://aliceevebob.com/2021/02/09/5-signs-that-you-may-be-a-rust-programmer/
