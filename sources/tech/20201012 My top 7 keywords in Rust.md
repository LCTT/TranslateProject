[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My top 7 keywords in Rust)
[#]: via: (https://opensource.com/article/20/10/keywords-rust)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

My top 7 keywords in Rust
======
Learn a handful of useful keywords from the Rust standard library.
![Rustacean t-shirt][1]

I've been using [Rust][2] for a few months now, writing rather more of it than I expected—though quite a lot of that has been thrown away as I've learned, improved what I'm writing, and taken some more complex tasks beyond what I originally intended.

I still love it and thought it might be good to talk about some of the important keywords that come up again and again in Rust. I'll provide my personal summary of what they do, why you need to think about how you use them, and anything else that's useful, particularly for people who are new to Rust or coming from another language (such as Java; see my article [_Why I'm enjoying learning Rust as a Java programmer_][3]).

Without further ado, let's get going. A good place for further information is always the official Rust documentation—you'll probably want to start with the [std library][4].

  1. **const** – You get to declare constants with const, and you should. This isn't rocket science, but do declare with const, and if you're going to use constants across different modules, then do the right thing and create a `lib.rs` file (the Rust default) into which you can put all of them with a nicely named module. I've had clashes of const variable names (and values!) across different files in different modules simply because I was too lazy to do anything other than cut and paste across files when I could have saved myself lots of work simply by creating a shared module.
  2. **let** – You don't _always_ need to declare a variable with a let statement, but your code will be clearer when you do. What's more, always add the type if you can. Rust will do its very best to guess what it should be, but it may not always be able to do so at runtime (in which case [Cargo][5], the compiler, will tell you), or it may even not do what you expect. In the latter case, it's always simpler for Cargo to complain that the function you're assigning from (for instance) doesn't match the declaration than for Rust to try to help you do the wrong thing, only for you to have to spend ages debugging elsewhere.
  3. **match** – match was new to me, and I love it. It's not dissimilar to "switch" in other languages but is used extensively in Rust. It makes for legible code, and Cargo will have a good go at warning you if you do something foolish (such as miss possible cases). My general rule of thumb, where I'm managing different options or doing branching, is to ask whether I can use match. If I can, I will.
  4. **mut** – When declaring a variable, if it's going to change after its initialisation, then you need to declare it mutable. A common mistake is to declare something mutable when it _isn't_ changed—but the compiler will warn you about that. If you get a warning from Cargo that a mutable variable isn't changed when you think it _is_, then you may wish to check the scope of the variable and make sure that you're using the right version.
  5. **return** – I actually very rarely use return, which is for returning a value from a function, because it's usually simpler and clearer to read if you just provide the value (or the function providing the return value) at the end of the function as the last line. Warning: you _will_ forget to omit the semicolon at the end of this line on many occasions; if you do, the compiler won't be happy.
  6. **unsafe** – This does what it says on the tin: If you want to do things where Rust can't guarantee memory safety, then you're going to need to use this keyword. I have absolutely no intention of declaring any of my Rust code unsafe now or at any point in the future; one of the reasons Rust is so friendly is because it stops this sort of hackery. If you really need to do this, think again, think yet again, and then redesign. Unless you're a seriously low-level systems programmer, _avoid_ unsafe.
  7. **use** – When you want to use an item, e.g., struct, variable, function, etc. from another crate, then you need to declare it at the beginning of the block where you'll be using it. Another common mistake is to do this but fail to add the crate (preferably with a minimum version number) to the `Cargo.toml` file.



This isn't the most complicated article I've ever written, I know, but it's the sort of article I would have appreciated when I was starting to learn Rust. I plan to create similar articles on key functions and other Rust must-knows: let me know if you have any requests!

* * *

_This article was originally published on [Alice, Eve, and Bob][6] and is reprinted with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/keywords-rust

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rustacean-tshirt.jpg?itok=u7LBmyaj (Rustacean t-shirt)
[2]: https://www.rust-lang.org/
[3]: https://opensource.com/article/20/5/rust-java
[4]: https://doc.rust-lang.org/std/
[5]: https://doc.rust-lang.org/cargo/
[6]: https://aliceevebob.com/2020/09/01/rust-my-top-7-keywords/
