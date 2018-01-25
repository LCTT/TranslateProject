Profiler adventures: resolving symbol addresses is hard!
============================================================

The other day I posted [How does gdb call functions?][1]. In that post I said:

> Using the symbol table to figure out the address of the function you want to call is pretty straightforward

Unsurprisingly, it turns out that figuring out the address in memory corresponding to a given symbol is actually not really that straightforward. This is actually something I’ve been doing in my profiler, and I think it’s interesting, so I thought I’d write about it!

Basically the problem I’ve been trying to solve is – I have a symbol (like `ruby_api_version`), and I want to figure out which address that symbol is mapped to in my target process’s memory (so that I can get the data in it, like the Ruby process’s Ruby version). So far I’ve run into (and fixed!) 3 issues when trying to do this:

1.  When binaries are loaded into memory, they’re loaded at a random address (so I can’t just read the symbol table)

2.  The symbol I want isn’t necessary in the “main” binary (`/proc/PID/exe`, sometimes it’s in some other dynamically linked library)

3.  I need to look at the ELF program header to adjust which address I look at for the symbol

I’ll start with some background, and then explain these 3 things! (I actually don’t know what gdb does)

### what’s a symbol?

Most binaries have functions and variables in them. For instance, Perl has a global variable called `PL_bincompat_options` and a function called `Perl_sv_catpv_mg`.

Sometimes binaries need to look up functions from another binary (for example, if the binary is a dynamically linked library, you need to look up its functions by name). Also sometimes you’re debugging your code and you want to know what function an address corresponds to.

Symbols are how you look up functions / variables in a binary. They’re in a section called the “symbol table”. The symbol table is basically an index for your binary! Sometimes they’re missing (“stripped”). There are a lot of binary formats, but this post is just about the usual binary format on Linux: ELF.

### how do you get the symbol table of a binary?

A thing that I learned today (or at least learned and then forgot) is that there are 2 possible sections symbols can live in: `.symtab` and `.dynsym`. `.dynsym` is the “dynamic symbol table”. According to [this page][2], the dynsym is a smaller version of the symtab that only contains global symbols.

There are at least 3 ways to read the symbol table of a binary on Linux: you can use nm, objdump, or readelf.

*   **read the .symtab**: `nm $FILE`, `objdump --syms $FILE`, `readelf -a $FILE`

*   **read the .dynsym**: `nm -D $FILE`, `objdump --dynamic-syms $FILE`, `readelf -a $FILE`

`readelf -a` is the same in both cases because `readelf -a` just shows you everything in an ELF file. It’s my favorite because I don’t need to guess where the information I want is, I can just print out everything and then use grep.

Here’s an example of some of the symbols in `/usr/bin/perl`. You can see that each symbol has a **name**, a **value**, and a **type**. The value is basically the offset of the code/data corresponding to that symbol in the binary. (except some symbols have value 0\. I think that has something to do with dynamic linking but I don’t understand it so we’re not going to get into it)

```
$ readelf -a /usr/bin/perl
...
   Num:    Value          Size Type   Ndx Name
   523: 00000000004d6590    49 FUNC    14 Perl_sv_catpv_mg
   524: 0000000000543410     7 FUNC    14 Perl_sv_copypv
   525: 00000000005a43e0   202 OBJECT  16 PL_bincompat_options
   526: 00000000004e6d20  2427 FUNC    14 Perl_pp_ucfirst
   527: 000000000044a8c0  1561 FUNC    14 Perl_Gv_AMupdate
...

```

### the question we want to answer: what address is a symbol mapped to?

That’s enough background!

Now – suppose I’m a debugger, and I want to know what address the `ruby_api_version` symbol is mapped to. Let’s use readelf to look at the relevant Ruby binary!

```
readelf -a  ~/.rbenv/versions/2.1.6/bin/ruby | grep ruby_api_version
   365: 00000000001f9180    12 OBJECT  GLOBAL DEFAULT   15 ruby_api_version

```

Neat! The offset of `ruby_api_version` is `0x1f9180`. We’re done, right? Of course not! :)

### Problem 1: ASLR (Address space layout randomization)

Here’s the first issue: when Linux loads a binary into memory (like `~/.rbenv/versions/2.1.6/bin/ruby`), it doesn’t just load it at the `0` address. Instead, it usually adds a random offset. Wikipedia’s article on ASLR explains why:

> Address space layout randomization (ASLR) is a memory-protection process for operating systems (OSes) that guards against buffer-overflow attacks by randomizing the location where system executables are loaded into memory.

We can see this happening in practice: I started `/home/bork/.rbenv/versions/2.1.6/bin/ruby` 3 times and every time the process gets mapped to a different place in memory. (`0x56121c86f000`, `0x55f440b43000`, `0x56163334a000`)

Here we’re meeting our good friend `/proc/$PID/maps` – this file contains a list of memory maps for a process. The memory maps tell us every address range in the process’s virtual memory (it turns out virtual memory isn’t contiguous! Instead process get a bunch of possibly-disjoint memory maps!). This file is so useful! You can find the address of the stack, the heap, every dynamically loaded library, anonymous memory maps, and probably more.

```
$ cat /proc/(pgrep -f 2.1.6)/maps | grep 'bin/ruby'
56121c86f000-56121caf0000 r-xp 00000000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
56121ccf0000-56121ccf5000 r--p 00281000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
56121ccf5000-56121ccf7000 rw-p 00286000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
$ cat /proc/(pgrep -f 2.1.6)/maps | grep 'bin/ruby'
55f440b43000-55f440dc4000 r-xp 00000000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
55f440fc4000-55f440fc9000 r--p 00281000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
55f440fc9000-55f440fcb000 rw-p 00286000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
$ cat /proc/(pgrep -f 2.1.6)/maps | grep 'bin/ruby'
56163334a000-5616335cb000 r-xp 00000000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
5616337cb000-5616337d0000 r--p 00281000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
5616337d0000-5616337d2000 rw-p 00286000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby

```

Okay, so in the last example we see that our binary is mapped at `0x56163334a000`. If we combine this with the knowledge that `ruby_api_version` is at `0x1f9180`, then that means that we just need to look that the address `0x1f9180 + 0x56163334a000` to find our variable, right?

Yes! In this case, that works. But in other cases it won’t! So that brings us to problem 2.

### Problem 2: dynamically loaded libraries

Next up, I tried running system Ruby: `/usr/bin/ruby`. This binary has basically no symbols at all! Disaster! In particular it does not have a `ruby_api_version`symbol.

But when I tried to print the `ruby_api_version` variable with gdb, it worked!!! Where was gdb finding my symbol? I found the answer with the help of our good friend: `/proc/PID/maps`

It turns out that `/usr/bin/ruby` dynamically loads a library called `libruby-2.3`. You can see it in the memory maps here:

```
$ cat /proc/(pgrep -f /usr/bin/ruby)/maps | grep libruby
7f2c5d789000-7f2c5d9f1000 r-xp 00000000 00:14 /usr/lib/x86_64-linux-gnu/libruby-2.3.so.2.3.0
7f2c5d9f1000-7f2c5dbf0000 ---p 00268000 00:14 /usr/lib/x86_64-linux-gnu/libruby-2.3.so.2.3.0
7f2c5dbf0000-7f2c5dbf6000 r--p 00267000 00:14 /usr/lib/x86_64-linux-gnu/libruby-2.3.so.2.3.0
7f2c5dbf6000-7f2c5dbf7000 rw-p 0026d000 00:14 /usr/lib/x86_64-linux-gnu/libruby-2.3.so.2.3.0

```

And if we read it with `readelf`, we find the address of that symbol!

```
readelf -a /usr/lib/x86_64-linux-gnu/libruby-2.3.so.2.3.0 | grep ruby_api_version
   374: 00000000001c72f0    12 OBJECT  GLOBAL DEFAULT   13 ruby_api_version

```

So in this case the address of the symbol we want is `0x7f2c5d789000` (the start of the libruby-2.3 memory map) plus `0x1c72f0`. Nice! But we’re still not done. There is (at least) one more mystery!

### Problem 3: the `vaddr` offset in the ELF program header

This one I just figured out today so it’s the one I have the shakiest understanding of. Here’s what happened.

I was running system ruby on Ubuntu 14.04: Ruby 1.9.3\. And my usual code (find the libruby map, get its address, get the symbol offset, add them up) wasn’t working!!! I was confused.

But I’d asked Julian if he knew of any weird stuff I need to worry about a while back and he said “well, you should read the code for `dlsym`, you’re trying to do basically the same thing”. So I decided to, instead of randomly guessing, go read the code for `dlsym`.

The man page for `dlsym` says “dlsym, dlvsym - obtain address of a symbol in a shared object or executable”. Perfect!!

[Here’s the dlsym code from musl I read][3]. (musl is like glibc, but, different. Maybe easier to read? I don’t understand it that well.)

The dlsym code says (on line 1468) `return def.dso->base + def.sym->st_value;` That sounds like what I’m doing!! But what’s `dso->base`? It looks like `base = map - addr_min;`, and `addr_min = ph->p_vaddr;`. (there’s also some stuff that makes sure `addr_min` is aligned with the page size which I should maybe pay attention to.)

So the code I want is something like `map_base - ph->p_vaddr + sym->st_value`.

I looked up this `vaddr` thing in the ELF program header, subtracted it from my calculation, and voilà! It worked!!!

### there are probably more problems!

I imagine I will discover even more ways that I am calculating the symbol address wrong. It’s interesting that such a seemingly simple thing (“what’s the address of this symbol?”) is so complicated!

It would be nice to be able to just call `dlsym` and have it do all the right calculations for me, but I think I can’t because the symbol is in a different process. Maybe I’m wrong about that though! I would like to be wrong about that. If you know an easier way to do all this I would very much like to know!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/01/09/resolving-symbol-addresses/

作者：[Julia Evans ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca
[1]:https://jvns.ca/blog/2018/01/04/how-does-gdb-call-functions/
[2]:https://blogs.oracle.com/ali/inside-elf-symbol-tables
[3]:https://github.com/esmil/musl/blob/194f9cf93da8ae62491b7386edf481ea8565ae4e/src/ldso/dynlink.c#L1451
