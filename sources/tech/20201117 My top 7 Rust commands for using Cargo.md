[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My top 7 Rust commands for using Cargo)
[#]: via: (https://opensource.com/article/20/11/commands-rusts-cargo)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

My top 7 Rust commands for using Cargo
======
Spend some time investigating Rust's package manager, Cargo.
![Person drinking a hot drink at the computer][1]

I've been using Rust for a little over six months now. I'm far from an expert, but I have stumbled across many, many gotchas and learned many, many things along the way; things that I hope will be of use to those who are learning what is easily my favourite programming language.

This is the third article in my miniseries for Rust newbs like me. You can find my other excursions into Rust in:

  * [My top 7 keywords in Rust][2]
  * [My top 7 functions in Rust][3]



I plan to write more, and this article is about Rust's package manager, [Cargo][4]. I'm ashamed to admit that I don't use Cargo's power as widely as I should, but researching this article gave me a better view of its commands' capabilities. In fact, I wasn't even aware of some of the options available until I started looking in more detail.

For this list of my top seven Cargo commands, I'll assume you have basic familiarity with Cargo—that you have it installed, and you can create a package using `cargo new <package>`, for instance. I could have provided more commands (there are many options!), but here are my "lucky 7."

  1. **cargo help &lt;command&gt;:** You can always find out more about a command with the `--help` option. The same goes for Cargo itself: `cargo --help` will give you a quick intro to what's out there. To get more information on a command (more like a man page), you can try using the command `new`. For instance, `cargo help new` will give extended information about `cargo new`. This behaviour is pretty typical for command-line tools, particularly in the Linux/Unix world, but it's very expressively implemented for Cargo, and you can gain lots of quick information with it.

  2. **cargo build --bin &lt;target&gt;:** What happens when you have multiple .rs files in your package, but you want to build just one of them? I have a package called `test-and-try` that I use for, well, testing and trying functionality, features, commands, and crates. It has around a dozen different files in it. By default, `cargo build` will try to build _all_ of them, and as they're often in various states of repair (some of them generating lots of warnings, some of them not even fully compiling), this can be a real pain. Instead, I place a section in my `Cargo.toml` file for each one like this: [code]

[[bin]]
name = "warp-body"
path = "src/warp-body.rs"

[/code] I can then use `cargo build --bin warp-body` to build _just_ this file (and any dependencies). I can then run it with a similar command: `cargo run --bin warp-body`.

  3. **cargo test:** I have an admission; I am not as assiduous about creating automatic tests in my Rust code as I ought to be. This is because I'm currently mainly writing proof of concept rather than production code, and also because I'm lazy. Maybe changing this behaviour should be a New Year's resolution, but when I _do_ get round to writing tests, Cargo is there to help me (as it is for you). All you need to do is add a line before the test code in your .rs file: [code]`#[cfg(test)]`[/code] When you run `cargo test`, Cargo will "automagically" find these tests, run them, and tell you if you have problems. As with many of the commands here, you'll find much more information online, but it's particularly worth familiarising yourself with the basics of this capability in the relevant [Rust By Example section][5].

  4. **cargo search &lt;query&gt;:** This is one of the commands that I didn't even know existed until I started researching this article—and which would have saved me so much time over the past few months if I'd known about it. It searches [Crates.io][6], Rust's repository of public (and _sometimes_ maintained) packages and tells you which ones may be relevant. (You can specify a different repository if you want, with the intuitively named `--registry` option.) I've recently been doing some work on network protocols for non-String data, so I've been working with Concise Binary Object Representation ([CBOR][7]). Here's what happens if I use `cargo search`:

![Cargo search output][8]

(Mike Bursell, [CC BY-SA 4.0][9])

This is great! I can, of course, also combine this command with tools like grep to narrow down the search yet further, like so: `cargo search cbor --limit 70 | grep serde`.

  5. **cargo tree:** Spoiler alert: this one may scare you. You've probably noticed that when you first build a new package, or when you add a new dependency, or just do a `cargo clean` and then `cargo build`, you see a long list of crates printed out as Cargo pulls them down from the relevant repositories and compiles them. How can you tell ahead of time, however, what will be pulled down and what version it will be? More importantly, how can you know what other dependencies a new crate has pulled into your build? The answer is `cargo tree`. Just to warn you: For any marginally complex project, you can expect to have a _lot_ of dependencies. I tried `cargo tree | wc -l` to count the number of dependent crates for a smallish project I'm working on and got an answer of 350! I tried providing an example, but it didn't display well, so I recommend that you try it yourself—be prepared for lots of output!

  6. **cargo clippy:** If you try running this and it doesn't work, that's because I cheated a little with these last two commands: you may have to install them explicitly (depending on your setup). For this one, run `cargo install clippy`—you'll be glad you did. Clippy is Rust's linter; it goes through your code, looking at ways to reduce and declutter it by removing or changing commands. I try to run `cargo clippy` before every `git commit`—partly because the Git repositories I tend to commit to have automatic actions to reject files that need linting, and partly to keep my code generally more tidy. Here's an example:

![Cargo clippy output][10]

(Mike Bursell, [CC BY-SA 4.0][9])

Let's face it; this isn't a major issue (though clippy will find errors, too, if you run it on non-compiling code), but it's an easy fix, so you might as well deal with it—either by removing the code or prefixing the variable with an underscore. As I plan to use this variable later but haven't yet implemented the function to consume it, I will perform the latter fix.

  7. **cargo readme:** While it's not the most earth-shattering of commands, this is another that is very useful (and that, as with `cargo clippy`, you may need to install explicitly). If you add the relevant lines to your .rs files, you can output README files from Cargo. For instance, I have the following lines at the beginning of my main.rs file:

![Cargo readme input][11]

(Mike Bursell, [CC BY-SA 4.0][9])

I'll leave the `cargo readme` command's output as an exercise for the reader, but it's interesting to me that the Licence (or "License," if you must) declaration is added. Use this to create simple documentation for your users and make them happy with minimal effort (always a good approach!).




I've just scratched the surface of Cargo's capabilities in this article; all the commands above are actually way more powerful than I described. I heartily recommend that you spend some time investigating Cargo and finding out how it can make your life better.

* * *

_This article was originally published on [Alice, Eve, and Bob][12] and is reprinted with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/commands-rusts-cargo

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/article/20/10/keywords-rust
[3]: https://opensource.com/article/20/10/rust-functions
[4]: https://doc.rust-lang.org/cargo/
[5]: https://doc.rust-lang.org/stable/rust-by-example/testing/unit_testing.html
[6]: https://crates.io/
[7]: https://cbor.io/
[8]: https://opensource.com/sites/default/files/uploads/cargo-search-output-5.png (Cargo search output)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/cargo-clippy-output-1.png (Cargo clippy output)
[11]: https://opensource.com/sites/default/files/uploads/cargo-readme-input.png (Cargo readme input)
[12]: https://aliceevebob.com/2020/11/03/my-top-7-cargo-rust-commands/
