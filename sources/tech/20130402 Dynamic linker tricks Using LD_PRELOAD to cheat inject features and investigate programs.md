Translating by qhwdw
# Dynamic linker tricks: Using LD_PRELOAD to cheat, inject features and investigate programs

**This post assumes some basic C skills.**

Linux puts you in full control. This is not always seen from everyone’s perspective, but a power user loves to be in control. I’m going to show you a basic trick that lets you heavily influence the behavior of most applications, which is not only fun, but also, at times, useful.

#### A motivational example

Let us begin with a simple example. Fun first, science later.


random_num.c:
```
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
 
int main(){
  srand(time(NULL));
  int i = 10;
  while(i--) printf("%d\n",rand()%100);
  return 0;
}
```

Simple enough, I believe. I compiled it with no special flags, just

> ```
> gcc random_num.c -o random_num
> ```

I hope the resulting output is obvious – ten randomly selected numbers 0-99, hopefully different each time you run this program.

Now let’s pretend we don’t really have the source of this executable. Either delete the source file, or move it somewhere – we won’t need it. We will significantly modify this programs behavior, yet without touching it’s source code nor recompiling it.

For this, lets create another simple C file:


unrandom.c:
```
int rand(){
    return 42; //the most random number in the universe
}
```

We’ll compile it into a shared library.

> ```
> gcc -shared -fPIC unrandom.c -o unrandom.so
> ```

So what we have now is an application that outputs some random data, and a custom library, which implements the rand() function as a constant value of 42\.  Now… just run  _random_num _ this way, and watch the result:

> ```
> LD_PRELOAD=$PWD/unrandom.so ./random_nums
> ```

If you are lazy and did not do it yourself (and somehow fail to guess what might have happened), I’ll let you know – the output consists of ten 42’s.

This may be even more impressive it you first:

> ```
> export LD_PRELOAD=$PWD/unrandom.so
> ```

and then run the program normally. An unchanged app run in an apparently usual manner seems to be affected by what we did in our tiny library…

###### **Wait, what? What did just happen?**

Yup, you are right, our program failed to generate random numbers, because it did not use the “real” rand(), but the one we provided – which returns 42 every time.

###### **But we *told* it to use the real one. We programmed it to use the real one. Besides, at the time we created that program, the fake rand() did not even exist!**

This is not entirely true. We did not choose which rand() we want our program to use. We told it just to use rand().

When our program is started, certain libraries (that provide functionality needed by the program) are loaded. We can learn which are these using  _ldd_ :

> ```
> $ ldd random_nums
> linux-vdso.so.1 => (0x00007fff4bdfe000)
> libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f48c03ec000)
> /lib64/ld-linux-x86-64.so.2 (0x00007f48c07e3000)
> ```

What you see as the output is the list of libs that are needed by  _random_nums_ . This list is built into the executable, and is determined compile time. The exact output might slightly differ on your machine, but a **libc.so** must be there – this is the file which provides core C functionality. That includes the “real” rand().

We can have a peek at what functions does libc provide. I used the following to get a full list:

> ```
> nm -D /lib/libc.so.6
> ```

The  _nm_  command lists symbols found in a binary file. The -D flag tells it to look for dynamic symbols, which makes sense, as libc.so.6 is a dynamic library. The output is very long, but it indeed lists rand() among many other standard functions.

Now what happens when we set up the environmental variable LD_PRELOAD? This variable **forces some libraries to be loaded for a program**. In our case, it loads  _unrandom.so_  for  _random_num_ , even though the program itself does not ask for it. The following command may be interesting:

> ```
> $ LD_PRELOAD=$PWD/unrandom.so ldd random_nums
> linux-vdso.so.1 =>  (0x00007fff369dc000)
> /some/path/to/unrandom.so (0x00007f262b439000)
> libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f262b044000)
> /lib64/ld-linux-x86-64.so.2 (0x00007f262b63d000)
> ```

Note that it lists our custom library. And indeed this is the reason why it’s code get’s executed:  _random_num_  calls rand(), but if  _unrandom.so_  is loaded it is our library that provides implementation for rand(). Neat, isn’t it?

#### Being transparent

This is not enough. I’d like to be able to inject some code into an application in a similar manner, but in such way that it will be able to function normally. It’s clear if we implemented open() with a simple “ _return 0;_ “, the application we would like to hack should malfunction. The point is to be **transparent**, and to actually call the original open:

inspect_open.c:
```
int open(const char *pathname, int flags){
  /* Some evil injected code goes here. */
  return open(pathname,flags); // Here we call the "real" open function, that is provided to us by libc.so
}
```

Hm. Not really. This won’t call the “original” open(…). Obviously, this is an endless recursive call.

How do we access the “real” open function? It is needed to use the programming interface to the dynamic linker. It’s simpler than it sounds. Have a look at this complete example, and then I’ll explain what happens there:

inspect_open.c:

```
#define _GNU_SOURCE
#include <dlfcn.h>
 
typedef int (*orig_open_f_type)(const char *pathname, int flags);
 
int open(const char *pathname, int flags, ...)
{
    /* Some evil injected code goes here. */
 
    orig_open_f_type orig_open;
    orig_open = (orig_open_f_type)dlsym(RTLD_NEXT,"open");
    return orig_open(pathname,flags);
}
```

The  _dlfcn.h_  is needed for  _dlsym_  function we use later. That strange  _#define_  directive instructs the compiler to enable some non-standard stuff, we need it to enable  _RTLD_NEXT_  in  _dlfcn.h_ . That typedef is just creating an alias to a complicated pointer-to-function type, with arguments just as the original open – the alias name is  _orig_open_f_type_ , which we’ll use later.

The body of our custom open(…) consists of some custom code. The last part of it creates a new function pointer  _orig_open_  which will point to the original open(…) function. In order to get the address of that function, we ask  _dlsym_  to find for us the next “open” function on dynamic libraries stack. Finally, we call that function (passing the same arguments as were passed to our fake “open”), and return it’s return value as ours.

As the “evil injected code” I simply used:

inspect_open.c (fragment):

```
printf("The victim used open(...) to access '%s'!!!\n",pathname); //remember to include stdio.h!
```

To compile it, I needed to slightly adjust compiler flags:

> ```
> gcc -shared -fPIC  inspect_open.c -o inspect_open.so -ldl
> ```

I had to append  _-ldl_ , so that this shared library is linked to  _libdl_ , which provides the  _dlsym_  function. (Nah, I am not going to create a fake version of  _dlsym_ , though this might be fun.)

So what do I have in result? A shared library, which implements the open(…) function so that it behaves **exactly** as the real open(…)… except it has a side effect of  _printf_ ing the file path :-)

If you are not convinced this is a powerful trick, it’s the time you tried the following:

> ```
> LD_PRELOAD=$PWD/inspect_open.so gnome-calculator
> ```

I encourage you to see the result yourself, but basically it lists every file this application accesses. In real time.

I believe it’s not that hard to imagine why this might be useful for debugging or investigating unknown applications. Please note, however, that this particular trick is not quite complete, because  _open()_  is not the only function that opens files… For example, there is also  _open64()_  in the standard library, and for full investigation you would need to create a fake one too.

#### **Possible uses**

If you are still with me and enjoyed the above, let me suggest a bunch of ideas of what can be achieved using this trick. Keep in mind that you can do all the above without to source of the affected app!

1.  ~~Gain root privileges.~~ Not really, don’t even bother, you won’t bypass any security this way. (A quick explanation for pros: no libraries will be preloaded this way if ruid != euid)

2.  Cheat games: **Unrandomize.** This is what I did in the first example. For a fully working case you would need also to implement a custom  _random()_ ,  _rand_r()_  _, random_r()_ . Also some apps may be reading from  _/dev/urandom_  or so, you might redirect them to  _/dev/null_  by running the original  _open()_  with a modified file path. Furthermore, some apps may have their own random number generation algorithm, there is little you can do about that (unless: point 10 below). But this looks like an easy exercise for beginners.

3.  Cheat games: **Bullet time. **Implement all standard time-related functions pretend the time flows two times slower. Or ten times slower. If you correctly calculate new values for time measurement, timed  _sleep_ functions, and others, the affected application will believe the time runs slower (or faster, if you wish), and you can experience awesome bullet-time action.
    Or go **even one step further** and let your shared library also be a DBus client, so that you can communicate with it real time. Bind some shortcuts to custom commands, and with some additional calculations in your fake timing functions you will be able to enable&disable the slow-mo or fast-forward anytime you wish.

4.  Investigate apps: **List accessed files.** That’s what my second example does, but this could be also pushed further, by recording and monitoring all app’s file I/O.

5.  Investigate apps: **Monitor internet access.** You might do this with Wireshark or similar software, but with this trick you could actually gain control of what an app sends over the web, and not just look, but also affect the exchanged data. Lots of possibilities here, from detecting spyware, to cheating in multiplayer games, or analyzing & reverse-engineering protocols of closed-source applications.

6.  Investigate apps: **Inspect GTK structures.** Why just limit ourselves to standard library? Let’s inject code in all GTK calls, so that we can learn what widgets does an app use, and how are they structured. This might be then rendered either to an image or even to a gtkbuilder file! Super useful if you want to learn how does some app manage its interface!

7.  **Sandbox unsafe applications.** If you don’t trust some app and are afraid that it may wish to _ rm -rf / _ or do some other unwanted file activities, you might potentially redirect all it’s file IO to e.g. /tmp by appropriately modifying the arguments it passes to all file-related functions (not just  _open_ , but also e.g. removing directories etc.). It’s more difficult trick that a chroot, but it gives you more control. It would be only as safe as complete your “wrapper” was, and unless you really know what you’re doing, don’t actually run any malicious software this way.

8.  **Implement features.** [zlibc][1] is an actual library which is run this precise way; it uncompresses files on the go as they are accessed, so that any application can work on compressed data without even realizing it.

9.  **Fix bugs. **Another real-life example: some time ago (I am not sure this is still the case) Skype – which is closed-source – had problems capturing video from some certain webcams. Because the source could not be modified as Skype is not free software, this was fixed by preloading a library that would correct these problems with video.

10.  Manually **access application’s own memory**. Do note that you can access all app data this way. This may be not impressive if you are familiar with software like CheatEngine/scanmem/GameConqueror, but they all require root privileges to work. LD_PRELOAD does not. In fact, with a number of clever tricks your injected code might access all app memory, because, in fact, it gets executed by that application itself. You might modify everything this application can. You can probably imagine this allows a lot of low-level hacks… but I’ll post an article about it another time.

These are only the ideas I came up with. I bet you can find some too, if you do – share them by commenting!

--------------------------------------------------------------------------------

via: https://rafalcieslak.wordpress.com/2013/04/02/dynamic-linker-tricks-using-ld_preload-to-cheat-inject-features-and-investigate-programs/

作者：[Rafał Cieślak ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://rafalcieslak.wordpress.com/
[1]:http://www.zlibc.linux.lu/index.html


