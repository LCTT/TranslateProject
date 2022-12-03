[#]: subject: "A couple of Rust error messages"
[#]: via: "https://jvns.ca/blog/2022/12/02/a-couple-of-rust-error-messages/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A couple of Rust error messages
======

Hello!

I’ve been doing [Advent of Code][1] in Rust for the past couple of days, because I’ve never really gotten comfortable with the language and I thought doing some Advent of Code problems might help.

My solutions aren’t anything special, but because I’m trying to learn, I’ve been trying to take a slightly more rigorous approach than usual to compiler errors. Instead of just fixing the error and moving on, I’m trying to make sure that I actually understand what the error message means and what it’s telling me about how the language works.

My steps to do that are:

  1. fix the bug
  2. make a tiny standalone program reproducing the same compiler error
  3. think about it and try to explain it to myself to make sure I actually understand why that error happened
  4. ask for help if I still don’t understand



So here are a couple of compiler errors and my explanations to myself of why the error is happening.

Both of them are pretty basic Rust errors, but I had fun thinking about them today. I wrote this for an imagined audience of “people who know some Rust basics but are still pretty bad at Rust”, if there are any of you out there.

### error 1: a borrowing error

Here’s some code ([rust playground link][2]):

```

    fn inputs() -> Vec<(i32, i32)> {
        return vec![(0, 0)];
    }
    fn main() {
        let scores = inputs().iter().map(|(a, b)| {
            a + b
        });
        println!("{}", scores.sum::<i32>());

    }

```

And here’s the compiler error:

```

    5 |     let scores = inputs().iter().map(|(a, b)| {
      |                  ^^^^^^^^ creates a temporary which is freed while still in use
    6 |         a + b
    7 |     });
      |       - temporary value is freed at the end of this statement
    8 |     println!("{}", scores.sum::<i32>());
      |                    ------ borrow later used here
      help: consider using a `let` binding to create a longer lived value
      |
    5 ~     let binding = inputs();
    6 ~     let scores = binding.iter().map(|(a, b)| {
      |

    For more information about this error, try `rustc --explain E0716`.

```

This is a pretty basic Rust error message about borrowing, but I’ve forgotten everything about Rust so I didn’t understand it.

There are 2 things I didn’t know / wasn’t thinking about here:

**thing 1**: Variables are **semantically meaningful** in Rust.

What I mean by that is that this code:

```

    let scores = inputs().iter().map(|(a, b)| { ... };

```

does **not do the same thing** as if we factor out `inputs()` into a variable, in this code:

```

    let input = inputs();
    let scores = input.iter().map(|(a, b)| { ... };

```

If some memory is allocated and it isn’t in its own variable, then it’s freed at the end of the expression (though there are some exceptions to this apparently, see `rustc --explain E0716` for more). But it _does_ have its own variable, then it’s kept around until the end of the block.

In the error message the Rust compiler actually suggests an explanation to read (`rustc --explain E0716`), which explains all of this and more. I didn’t notice it right away, but once I read it (and Googled a little), it really helped me.

**thing 2**:. Computations with `iter()` **don’t happen right away**.

This is something that I theoretically knew, but wasn’t thinking about how it might relate to compiler errors.

When I call `.map(...)`, that doesn’t actually do the `map` right away – it just sets up an iterator that can do actual calculation later, when we call `.sum()`.

This means that I need to keep around the memory from `inputs()`, because none of the calculation has even happened yet!

### error 2: summing an `Iterator<()>`

Here’s some code ([rust playground link][3]) (This isn’t the actual code I was debugging, but it’s the fastest way to demonstrate the error message)

```

    fn main() {
        vec![(), ()].iter().sum::<i32>();
    }

```

This has a pretty obvious bug: You can’t sum a bunch of `()` (the empty type) and get an `i32` as a result. Here’s the compiler error, though:

```

    2 |     vec![(), ()].iter().sum::<i32>();
      |     ^^^^^^^^^^^^^^^^^^^ --- required by a bound introduced by this call
      |     |
      |     the trait `Sum<&()>` is not implemented for `i32`

```

This was very confusing to me – I’d expect to see an error saying something like `Sum is not implemented for Iterator<()>`. But instead it says that `Sum` is not implemented for **i32**. But I’m not trying to sum i32s! What’s going on?

What’s actually going on here is (thanks to some lovely people who helped me out!):

  * `i32` has a static method called `sum(iter: Iterator<i32>)`, that comes from the [`Sum` trait][4]. ([defined here for integers][5])
  * `Iterator` has a `sum()` method that calls this static method on `i32` ([defined here][6])
  * when I run `my_iter.sum()`, it tries to call `i32::sum(my_iter)`
  * But `i32::sum` isn’t defined for `Iterator<&()>`!
  * The type parameter in `Sum` (eg) `Sum<&()>` refers to the type of the _iterator_ that’s being passed to `i32::sum()`
  * as a result, we get the error message `the trait Sum<&()> is not implemented for i32`



I might not have gotten all the types/terms exactly right here, but I think that’s the gist of it.

This was a good reminder that sometimes methods (like `sum()` on `Iterator` are defined in slightly indirect/counterintuitive ways and that you have to hunt down the details of how it’s implemented to understand the compiler errors.

(my actual bug here was actually that I’d accidentally added an extra `;` in my code, which meant that I accidentally created an `Iterator<()>` instead of an `Iterator<i32>`, and the confusing error message made it harder to figure out that out)

### Rust error messages are cool

I found these error messages pretty helpful, I especially really apprecated the `--explain` output on the borrowing error.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/12/02/a-couple-of-rust-error-messages/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://adventofcode.com/2022
[2]: https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=20f26bdcd30f5f8c1bccb17b36cc32de
[3]: https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=275f94fe419f49479dabf1704068c5d3
[4]: https://doc.rust-lang.org/std/iter/trait.Sum.html#
[5]: https://github.com/rust-lang/rust/blob/32e613bbaafee1bcabba48a2257b838f8d1c03d3/library/core/src/iter/traits/accum.rs#L41-L47
[6]: https://github.com/rust-lang/rust/blob/e526d123aa4703aa7b85c5b8e70c20b5ee0deade/library/core/src/iter/traits/iterator.rs#L3376-L3382
