Writing eBPF tracing tools in Rust
============================================================

tl;dr: I made an experimental Rust repository that lets you write BPF tracing tools from Rust! It’s at [https://github.com/jvns/rust-bcc][4] or [https://crates.io/crates/bcc][5], and has a couple of hopefully easy to understand examples. It turns out that writing BPF-based tracing tools in Rust is really easy (in some ways easier than doing the same things in Python). In this post I’ll explain why I think this is useful/important.

For a long time I’ve been interested in the [BPF compiler collection][6], a C -> BPF compiler, C library, and Python bindings to make it easy to write tools like:

*   [opensnoop][1] (spies on which files are being opened)

*   [tcplife][2] (track length of TCP connections)

*   [cpudist][3] (count how much time every program spends on- and off-CPU)

and a lot more. The list of available tools in [the /tools directory][7] is really impressive and I could write a whole blog post about that. If you’re familiar with dtrace – the idea is that BCC is a little bit like dtrace, and in fact there’s a dtrace-like language [named ply][8] implemented with BPF.

This blog post isn’t about `ply` or the great BCC tools though – it’s about what tools we need to build more complicated/powerful BPF-based programs.

### What does the BPF compiler collection let you do?

Here’s a quick overview of what BCC lets you do:

*   compile BPF programs from C into eBPF bytecode.

*   attach this eBPF bytecode to a userspace function or kernel function (as a “uprobe” / “kprobe”) or install it as XDP

*   communicate with the eBPF bytecode to get information with it

A basic example of using BCC is this [strlen_count.py][9] program and I think it’s useful to look at this program to understand how BCC works and how you might be able to implement more advanced tools.

First, there’s an eBPF program. This program is going to be attached to the `strlen` function from libc (the C standard library) – every time we call `strlen`, this code will be run.

This eBPF program

*   gets the first argument to the `strlen` function (the address of a string)

*   reads the first 80 characters of that string (using `bpf_probe_read`)

*   increments a counter in a hashmap (basically `counts[str] += 1`)

The result is that you can count every call to `strlen`. Here’s the eBPF program:

```
struct key_t {
    char c[80];
};
BPF_HASH(counts, struct key_t);
int count(struct pt_regs *ctx) {
    if (!PT_REGS_PARM1(ctx))
        return 0;
    struct key_t key = {};
    u64 zero = 0, *val;
    bpf_probe_read(&key.c, sizeof(key.c), (void *)PT_REGS_PARM1(ctx));
    val = counts.lookup_or_init(&key, &zero);
    (*val)++;
    return 0;
};

```

After that program is compiled, there’s a Python part which does `b.attach_uprobe(name="c", sym="strlen", fn_name="count")` – it tells the Linux kernel to actually attach the compiled BPF to the `strlen` function so that it runs every time `strlen` runs.

The really exciting thing about eBPF is what comes next – there’s no use keeping a hashmap of string counts if you can’t access it! BPF has a number of data structures that let you share information between BPF programs (that run in the kernel / in uprobes) and userspace.

So in this case the Python program accesses this `counts` data structure.

### BPF data structures: hashmaps, buffers, and more!

There’s a great list of available BPF data structures in the [BCC reference guide][10].

There are basically 2 kinds of BPF data structures – data structures suitable for storing statistics (BPF_HASH, BPF_HISTOGRAM etc), and data structures suitable for storing events (like BPF_PERF_MAP) where you send a stream of events to a userspace program which then displays them somehow.

There are a lot of interesting BPF data structures (like a trie!) and I haven’t fully worked out what all of the possibilities are with them yet :)

### What I’m interested in: BPF for profiling & tracing

Okay!! We’re done with the background, let’s talk about why I’m interested in BCC/BPF right now.

I’m interested in using BPF to implement profiling/tracing tools for dynamic programming languages, specifically tools to do things like “trace all memory allocations in this Ruby program”. I think it’s exciting that you can say “hey, run this tiny bit of code every time a Ruby object is allocated” and get data back about ongoing allocations!

### Rust: a way to build more powerful BPF-based tools

The issue I see with the Python BPF libraries (which are GREAT, of course) is that while they’re perfect for building tools like `tcplife` which track tcp connnection lengths, once you want to start doing more complicated experiments like “stream every memory allocation from this Ruby program, calculate some metadata about it, query the original process to find out the class name for that address, and display a useful summary”, Python doesn’t really cut it.

So I decided to spend 4 days trying to build a BCC library for Rust that lets you attach + interact with BPF programs from Rust!

Basically I worked on porting [https://github.com/iovisor/gobpf][11] (a go BCC library) to Rust.

The easiest and most exciting way to explain this is to show an example of what using the library looks like.

### Rust example 1: strlen

Let’s start with the strlen example from above. Here’s [strlen.rs][12] from the examples!

Compiling & attaching the `strlen` code is easy:

```
let mut module = BPF::new(code)?;
let uprobe_code = module.load_uprobe("count")?;
module.attach_uprobe("/lib/x86_64-linux-gnu/libc.so.6", "strlen", uprobe_code, -1 /* all PIDs */)?;
let table = module.table("counts");

```

This table contains a hashmap mapping strings to counts. So we need to iterate over that table and print out the keys and values. This is pretty simple: it looks like this.

```
let iter = table.into_iter();
for e in iter {
    // key and value are each a Vec<u8> so we need to transform them into a string and 
    // a u64 respectively
    let key = get_string(&e.key);
    let value = Cursor::new(e.value).read_u64::<NativeEndian>().unwrap();
    println!("{:?} {:?}", key, value);
}

```

Basically all the data that comes out of a BPF program is an opaque `Vec<u8>`right now, so you need to figure out how to decode them yourself. Luckily decoding binary data is something that Rust is quite good at – the `byteorder`crate lets you easily decode `u64`s, and translating a vector of bytes into a String is easy (I wrote a quick `get_string` helper function to do that).

I thought this was really nice because the code for this program in Rust is basically exactly the same as the corresponding Python version. So it very pretty approachable to start doing experiments and seeing what’s possible.

### Reading perf events from Rust

The next thing I wanted to do after getting this `strlen` example to work in rust was to handle events!!

Events are a little different / more complicated. The way you stream events in a BCC program is – it uses `perf_event_open` to create a ring buffer where the events get stored.

Dealing with events from a perf ring buffer normally is a huge pain because perf has this complicated data structure. The C BCC library makes this easier for you by letting you specify a C callback that gets called on every new event, and it handles dealing with perf. This is super helpful. To make this work with Rust, the `rust-bcc` library lets you pass in a Rust closure to run on every event.

### Rust example 2: opensnoop.rs (events!!)

To make sure reading BPF events actually worked, I implemented a basic version of `opensnoop.py` from the iovisor bcc tools: [opensnoop.rs][13].

I won’t walk through the [C code][14] in this case because there’s a lot of it but basically the eBPF C part generates an event every time a file is opened on the system. I copied the C code verbatim from [opensnoop.py][15].

Here’s the type of the event that’s generated by the BPF code:

```
#[repr(C)]
struct data_t {
    id: u64, // pid + thread id
    ts: u64,
    ret: libc::c_int,
    comm: [u8; 16], // process name
    fname: [u8; 255], // filename
}

```

The Rust part starts out by compiling BPF code & attaching kprobes (to the `open`system call in the kernel, `do_sys_open`). I won’t paste that code here because it’s basically the same as the `strlen` example. What happens next is the new part: we install a callback with a Rust closure on the `events` table, and then call `perf_map.poll(200)` in a loop. The design of the BCC library is a little confusing to me still, but you need to repeatedly poll the perf reader objects to make sure that the callbacks you installed actually get called.

```
let table = module.table("events");
let mut perf_map = init_perf_map(table, perf_data_callback)?;
loop {
    perf_map.poll(200);
}

```

This is the callback code I wrote, that gets called every time. Again, it takes an opaque `Vec<u8>` event and translates it into a `data_t` struct to print it out. Doing this is kind of annoying (I actually called `libc::memcpy` which is Not Encouraged Rust Practice), I need to figure out a less gross/unsafe way to do that. The really nice thing is that if you put `#[repr(C)]` on your Rust structs it represents them in memory the exact same way C will represent that struct. So it’s quite easy to share data structures between Rust and C.

```
fn perf_data_callback() -> Box<Fn(Vec<u8>)> {
    Box::new(|x| {
        // This callback
        let data = parse_struct(&x);
        println!("{:-7} {:-16} {}", data.id >> 32, get_string(&data.comm), get_string(&data.fname));
    })
}

```

You might notice that this is actually a weird function that returns a callback – this is because I needed to install 4 callbacks (1 per CPU), and in stable Rust you can’t copy closures yet.

output

Here’s what the output of that `opensnoop` program looks like!

This is kind of meta – these are the files that were being opened on my system when I saved this blog post :). You can see that git is looking at some files, vim is saving a file, and my static site generator Hugo is opening the changed file so that it can update the site. Neat!

```
PID     COMMAND          FILENAME
   8519 git              /home/bork/work/homepage/.gitmodules
   8519 git              /home/bork/.gitconfig
   8519 git              .git/config
  22877 vim              content/post/2018-02-05-writing-ebpf-programs-in-rust.markdown
  22877 vim              .
   7312 hugo             /home/bork/work/homepage/content/post/2018-02-05-writing-ebpf-programs-in-rust.markdown
   7312 hugo             /home/bork/work/homepage/content/post/2018-02-05-writing-ebpf-programs-in-rust.markdown

```

### using rust-bcc to implement Ruby experiments

Now that I have this basic library that I can use I can get counts + stream events in Rust, I’m excited about doing some experiments with making BCC programs in Rust that talk to Ruby programs!

The first experiment (that I blogged about last week) is [count-ruby-allocs.rs][16]which prints out a live count of current allocation activity. Here’s an example of what it prints out: (the numbers are counts of the number of objects allocated of that type so far).

```
      RuboCop::Token 53
      RuboCop::Token 112
           MatchData 246
Parser::Source::Rang 255
                Proc 323
          Enumerator 328
                Hash 475
               Range 1210
                 ??? 1543
              String 3410
               Array 7879
Total allocations since we started counting: 16932
Allocations this second: 954

```

### Related work

Geoffrey Couprie is interested in building more advanced BPF tracing tools with Rust too and wrote a great blog post with a cool proof of concept: [Compiling to eBPF from Rust][17].

I think the idea of not requiring the user to compile the BPF program is exciting, because you could imagine distributing a statically linked Rust binary (which links in libcc.so) with a pre-compiled BPF program that the binary just installs and then uses to do cool stuff.

Also there’s another Rust BCC library at [https://bitbucket.org/photoszzt/rust-bpf/][18] at which has a slightly different set of capabilities than [jvns/rust-bcc][19] (going to spend some time looking at that one later, I just found about it like 30 minutes ago :)).

### that’s it for now

This crate is still extremely sketchy and there are bugs & missing features but I wanted to put it on the internet because I think the examples of what you can do with it are really exciting!!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/02/05/rust-bcc/

作者：[Julia Evans ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about/
[1]:https://github.com/iovisor/bcc/blob/master/tools/opensnoop.py
[2]:https://github.com/iovisor/bcc/blob/master/tools/tcplife.py
[3]:https://github.com/iovisor/bcc/blob/master/tools/cpudist.py
[4]:https://github.com/jvns/rust-bcc
[5]:https://crates.io/crates/bcc
[6]:https://github.com/iovisor/bcc
[7]:https://github.com/iovisor/bcc/tree/master/tools
[8]:https://github.com/iovisor/ply
[9]:https://github.com/iovisor/bcc/blob/master/examples/tracing/strlen_count.py
[10]:https://github.com/iovisor/bcc/blob/master/docs/reference_guide.md#maps
[11]:https://github.com/iovisor/gobpf
[12]:https://github.com/jvns/rust-bcc/blob/f15d2983ddbe349aac3d2fcaeacf924a66db4be7/examples/strlen.rs
[13]:https://github.com/jvns/rust-bcc/blob/f15d2983ddbe349aac3d2fcaeacf924a66db4be7/examples/opensnoop.rs
[14]:https://github.com/jvns/rust-bcc/blob/f15d2983ddbe349aac3d2fcaeacf924a66db4be7/examples/opensnoop.c
[15]:https://github.com/iovisor/bcc/blob/master/tools/opensnoop.py
[16]:https://github.com/jvns/ruby-mem-watcher-demo/blob/dd189b178a2813e6445063f0f84063e6e978ee79/src/bin/count-ruby-allocs.rs
[17]:https://unhandledexpression.com/2018/02/02/poc-compiling-to-ebpf-from-rust/
[18]:https://bitbucket.org/photoszzt/rust-bpf/
[19]:https://github.com/jvns/rust-bcc
