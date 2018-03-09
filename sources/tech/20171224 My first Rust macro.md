My first Rust macro
============================================================

Last night I wrote a Rust macro for the first time!! The most striking thing to me about this was how **easy** it was – I kind of expected it to be a weird hard finicky thing, and instead I found that I could go from “I don’t know how macros work but I think I could do this with a macro” to “wow I’m done” in less than an hour.

I used [these examples][2] to figure out how to write my macro.

### what’s a macro?

There’s more than one kind of macro in Rust –

*   macros defined using `macro_rules` (they have an exclamation mark and you call them like functions – `my_macro!()`)

*   “syntax extensions” / “procedural macros” like `#[derive(Debug)]` (you put these like annotations on your functions)

*   built-in macros like `println!`

[Macros in Rust][3] and [Macros in Rust part II][4] seems like a nice overview of the different kinds with examples

I’m not actually going to try to explain what a macro **is**, instead I will just show you what I used a macro for yesterday and hopefully that will be interesting. I’m going to be talking about `macro_rules!`, I don’t understand syntax extension/procedural macros yet.

### compiling the `get_stack_trace` function for 30 different Ruby versions

I’d written some functions that got the stack trace out of a running Ruby program (`get_stack_trace`). But the function I wrote only worked for Ruby 2.2.0 – here’s what it looked like. Basically it imported some structs from `bindings::ruby_2_2_0` and then used them.

```
use bindings::ruby_2_2_0::{rb_control_frame_struct, rb_thread_t, RString};
fn get_stack_trace(pid: pid_t) -> Vec<String> {
    // some code using rb_control_frame_struct, rb_thread_t, RString
}

```

Let’s say I wanted to instead have a version of `get_stack_trace` that worked for Ruby 2.1.6. `bindings::ruby_2_2_0` and `bindings::ruby_2_1_6` had basically all the same structs in them. But `bindings::ruby_2_1_6::rb_thread_t` wasn’t the **same** as `bindings::ruby_2_2_0::rb_thread_t`, it just had the same name and most of the same struct members.

So I could implement a working function for Ruby 2.1.6 really easily! I just need to basically replace `2_2_0` for `2_1_6`, and then the compiler would generate different code (because `rb_thread_t` is different). Here’s a sketch of what the Ruby 2.1.6 version would look like:

```
use bindings::ruby_2_1_6::{rb_control_frame_struct, rb_thread_t, RString};
fn get_stack_trace(pid: pid_t) -> Vec<String> {
    // some code using rb_control_frame_struct, rb_thread_t, RString
}

```

### what I wanted to do

I basically wanted to write code like this, to generate a `get_stack_trace` function for every Ruby version. The code inside `get_stack_trace` would be the same in every case, it’s just the `use bindings::ruby_2_1_3` that needed to be different

```
pub mod ruby_2_1_3 {
    use bindings::ruby_2_1_3::{rb_control_frame_struct, rb_thread_t, RString};
    fn get_stack_trace(pid: pid_t) -> Vec<String> {
        // insert code here
    }
}
pub mod ruby_2_1_4 {
    use bindings::ruby_2_1_4::{rb_control_frame_struct, rb_thread_t, RString};
    fn get_stack_trace(pid: pid_t) -> Vec<String> {
        // same code
    }
}
pub mod ruby_2_1_5 {
    use bindings::ruby_2_1_5::{rb_control_frame_struct, rb_thread_t, RString};
    fn get_stack_trace(pid: pid_t) -> Vec<String> {
        // same code
    }
}
pub mod ruby_2_1_6 {
    use bindings::ruby_2_1_6::{rb_control_frame_struct, rb_thread_t, RString};
    fn get_stack_trace(pid: pid_t) -> Vec<String> {
        // same code
    }
}

```

### macros to the rescue!

This really repetitive thing was I wanted to do was a GREAT fit for macros. Here’s what using `macro_rules!` to do this looked like!

```
macro_rules! ruby_bindings(
    ($ruby_version:ident) => (
    pub mod $ruby_version {
        use bindings::$ruby_version::{rb_control_frame_struct, rb_thread_t, RString};
        fn get_stack_trace(pid: pid_t) -> Vec<String> {
            // insert code here
        }
    }
));

```

I basically just needed to put my code in and insert `$ruby_version` in the places I wanted it to go in. So simple! I literally just looked at an example, tried the first thing I thought would work, and it worked pretty much right away.

(the [actual code][5] is more lines and messier but the usage of macros is exactly as simple in this example)

I was SO HAPPY about this because I’d been worried getting this to work would be hard but instead it was so easy!!

### dispatching to the right code

Then I wrote some super simple dispatch code to call the right code depending on which Ruby version was running!

```
    let version = get_api_version(pid);
    let stack_trace_function = match version.as_ref() {
        "2.1.1" => stack_trace::ruby_2_1_1::get_stack_trace,
        "2.1.2" => stack_trace::ruby_2_1_2::get_stack_trace,
        "2.1.3" => stack_trace::ruby_2_1_3::get_stack_trace,
        "2.1.4" => stack_trace::ruby_2_1_4::get_stack_trace,
        "2.1.5" => stack_trace::ruby_2_1_5::get_stack_trace,
        "2.1.6" => stack_trace::ruby_2_1_6::get_stack_trace,
        "2.1.7" => stack_trace::ruby_2_1_7::get_stack_trace,
        "2.1.8" => stack_trace::ruby_2_1_8::get_stack_trace,
        // and like 20 more versions
        _ => panic!("OH NO OH NO OH NO"),
    };

```

### it works!

I tried out my prototype, and it totally worked! The same program could get stack traces out the running Ruby program for all of the ~10 different Ruby versions I tried – it figured which Ruby version was running, called the right code, and got me stack traces!!

Previously I’d compile a version for Ruby 2.2.0 but then if I tried to use it for any other Ruby version it would crash, so this was a huge improvement.

There are still more issues with this approach that I need to sort out. The two main ones right now are: firstly the ruby binary that ships with Debian doesn’t have symbols and I need the address of the current thread, and secondly it’s still possible that `#ifdefs` will ruin my day.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2017/12/24/my-first-rust-macro/

作者：[Julia Evans ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca
[1]:https://jvns.ca/categories/ruby-profiler
[2]:https://gist.github.com/jfager/5936197
[3]:https://www.ncameron.org/blog/macros-in-rust-pt1/
[4]:https://www.ncameron.org/blog/macros-in-rust-pt2/
[5]:https://github.com/jvns/ruby-stacktrace/blob/b0b92863564e54da59ea7f066aff5bb0d92a4968/src/lib.rs#L249-L393
