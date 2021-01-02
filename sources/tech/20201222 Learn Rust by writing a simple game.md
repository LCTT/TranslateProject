[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn Rust by writing a simple game)
[#]: via: (https://opensource.com/article/20/12/learn-rust)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Learn Rust by writing a simple game
======
Start programming with a simple game you can try in multiple languages.
![Ferris the crab under the sea, unofficial logo for Rust programming language][1]

When you want to learn a new programming language, it's good to focus on the things programming languages have in common:

  * Variables
  * Expressions
  * Statements



These concepts are the basis of most programming languages. Once you understand them, you can start figuring the rest out.

Because programming languages usually share similarities, once you know one language, you can learn the basics of another by understanding its differences.

A good way to learn new languages is using a standard program that you can use to practice. This allows you to focus on the language, not the program's logic. I'm doing that in this article series using a "guess the number" program, in which the computer picks a number between one and 100 and asks you to guess it. The program loops until you guess the number correctly.

This program exercises several concepts in programming languages:

  * Variables
  * Input
  * Output
  * Conditional evaluation
  * Loops



It's a great practical experiment to learn a new programming language.

### Install Rust

You can [install a Rust toolchain using Rustup][2], or you can [try Rust online][3] without installing it locally.

If you install it locally, you should update it periodically with `rustup update` to keep your toolchain fresh, and with `cargo update` to keep your libraries on their latest versions.

### Guess the number in Rust

[Rust][4] is a language that empowers anyone to build reliable and efficient software. You can explore Rust by writing a version of the "guess the number" game.

The first step is to write a `Cargo.toml` file. You can generate a skeleton `Cargo.toml` using the `cargo new` command. This is almost always the best way to start a Rust project.


```
$ cargo new guess
$ cd guess
$ ls -1
Cargo.toml
src/
```

The `Cargo.toml` file names your package, gives it some metadata, and, most importantly, specifies that it depends on the `rand` [crate][5].


```
[package]
name = "guess"
version = "2020.11.0"
authors = ["Moshe Zadka &lt;[moshez@opensource.com][6]&gt;"]
edition = "2018"

# See more keys and their definitions at <https://doc.rust-lang.org/cargo/reference/manifest.html>

[dependencies]
rand = "*"
```

Many things in Rust are not supplied by the language or the standard library. Instead, you get them from one of many external crates that are available to do many things.

The program logic goes in `src/main.rs`:


```
use rand::Rng;
use std::io::BufRead;

fn main() {
    let mut rng = rand::thread_rng();
    let random = rng.gen_range(1..101);
    println!("Guess a number between 1 and 100");
    for line in std::io::stdin().lock().lines() {
        let parsed = line.ok().as_deref().map(str::parse::&lt;i64&gt;);
        if let Some(Ok(guess)) = parsed {
            match guess {
                _ if guess &lt; random =&gt; println!("Too low"),
                _ if guess &gt; random =&gt; println!("Too high"),
                _ =&gt; {
                    println!("That's right");
                    break;
                }
            }
        }
    }
}
```

The first two lines of the code declare what you are going to do. In this case, `rand::Rng` generates a guess and the [trait][7] `std::io::BufRead` enables reading from standard input.

The entry point to the Rust code is in the `main()` function, so the next step is to define `main()`.

To assign a value to a variable put `let`, then the variable's name, followed by the `=` sign. This creates an [immutable][8] variable.

Most of your variables will be immutable, but the `rng` object must be mutable. For example, the statement `let random = 0` assigns a zero value to the `random` variable.

The first line of the function creates a thread-safe `Rng` object and assigns it to the variable `rng`. Rust is built on thread and memory safety, so you must think about those things as soon as you start writing code.

The next line of the program reads the result of the function `gen_range()` and assigns it to the variable called `random`. The function takes a minimum (inclusive) and an upper bound (not inclusive). To make the upper bound inclusive, you can mark the greater number with an equal sign (for example, `1..=100`), or you can just set the upper bound to 1 above your intended maximum, as I've done in my code. In this case, the range is `1` to `100`, making the game just challenging enough.

The central loop iterates over the lines in `std::io::stdin()`. Since there are all sorts of corner cases that might result in a line not being read, Rust requires you to wrap a line with a `Result`. It might also be impossible for a line to parse an integer.

This code uses conditional pattern-matching to ignore all lines that would have caused errors:


```
        let parsed = line.ok().as_deref().map(str::parse::&lt;i64&gt;);
        if let Some(Ok(guess)) = parsed {
            // ...
        }
```

The first line creates a `Result<Option<i64>, ...>` object because it might fail at the reading or parsing steps. Since the next line only matches on `Some(Ok(guess))`, whenever a line results in a value that does not match, it skips the `if` statement. This is a powerful way to ignore errors.

Rust supports conditional expressions and flow control, like loops. In the "guess the number" game, Rust continues looping as long as the value in the guess is not equal to `random`.

The body of the `if` statement contains a three-way branch using Rust's `match` statement. While `match` is most often used for pattern matching, it can also check arbitrary conditions. In this case, print an appropriate message and `break` the loop if the guess is correct.

### Sample output

Now that you've written your Rust program, you can run it to play the "guess the number" game. Every time you run the program, Rust will pick a different random number, so keep guessing until you find the correct number:


```
$ cargo run
   Compiling guess v2020.11.0 (/Users/mzadka/src/guess)
    Finished dev [unoptimized + debuginfo] target(s) in 0.70s
     Running `target/debug/guess`
Guess a number between 1 and 100
50
Too high
25
Too high
12
Too low
18
Too high
15
Too high
13
Too low
14
That's right
```

It is typical to test the program by running it with `cargo run`. Eventually, you'll probably use `cargo build` to [build an executable and run it][9] as two separate steps.

### Learn Rust

This "guess the number" game is a great introductory program for learning a new programming language because it exercises several common programming concepts in a pretty straightforward way. By implementing this simple game in different programming languages, you can demonstrate some core concepts of the languages and compare their details.

Do you have a favorite programming language? How would you write the "guess the number" game in it? Follow this article series to see examples of other programming languages that might interest you!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/learn-rust

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rust_programming_crab_sea.png?itok=2eWLz8A5 (Ferris the crab under the sea, unofficial logo for Rust programming language)
[2]: https://www.rust-lang.org/learn/get-started
[3]: https://play.rust-lang.org/
[4]: https://www.rust-lang.org/
[5]: https://doc.rust-lang.org/book/ch07-01-packages-and-crates.html
[6]: mailto:moshez@opensource.com
[7]: https://doc.rust-lang.org/rust-by-example/trait.html
[8]: https://en.wikipedia.org/wiki/Immutable_object
[9]: https://opensource.com/article/20/3/rust-cargo
