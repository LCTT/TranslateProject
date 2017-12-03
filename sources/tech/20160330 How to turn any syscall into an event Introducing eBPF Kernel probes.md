How to turn any syscall into an event: Introducing eBPF Kernel probes
============================================================


TL;DR: Using eBPF in recent (>=4.4) Linux kernel, you can turn any kernel function call into a user land event with arbitrary data. This is made easy by bcc. The probe is written in C while the data is handled by python.

If you are not familiar with eBPF or linux tracing, you really should read the full post. It tries to progressively go through the pitfalls I stumbled unpon while playing around with bcc / eBPF while saving you a lot of the time I spent searching and digging.

### A note on push vs pull in a Linux world

When I started to work on containers, I was wondering how we could update a load balancer configuration dynamically based on actual system state. A common strategy, which works, it to let the container orchestrator trigger a load balancer configuration update whenever it starts a container and then let the load balancer poll the container until some health check passes. It may be a simple “SYN” test.

While this configuration works, it has the downside of making your load balancer waiting for some system to be available while it should be… load balancing.

Can we do better?

When you want a program to react to some change in a system there are 2 possible strategies. The program may  _poll_  the system to detect changes or, if the system supports it, the system may  _push_ events and let the program react to them. Wether you want to use push or poll depends on the context. A good rule of the thumb is to use push events when the event rate is low with respect to the processing time and switch to polling when the events are coming fast or the system may become unusable. For example, typical network driver will wait for events from the network card while frameworks like dpdk will actively poll the card for events to achieve the highest throughput and lowest latency.

In an ideal world, we’d have some kernel interface telling us:

> *   “Hey Mr. ContainerManager, I’ve just created a socket for the Nginx-ware of container  _servestaticfiles_ , maybe you want to update your state?”
> 
> *   “Sure Mr. OS, Thanks for letting me know”

While Linux has a wide range of interfaces to deal with events, up to 3 for file events, there is no dedicated interface to get socket event notifications. You can get routing table events, neighbor table events, conntrack events, interface change events. Just, not socket events. Or maybe there is, deep hidden in a Netlink interface.

Ideally, we’d need a generic way to do it. How?

### Kernel tracing and eBPF, a bit of history

Until recently the only way was to patch the kernel or resort on SystemTap. [SytemTap][5] is a tracing Linux system. In a nutshell, it provides a DSL which is then compiled into a kernel module which is then live-loaded into the running kernel. Except that some production system disable dynamic module loading for security reasons. Including the one I was working on at that time. The other way would be to patch the kernel to trigger some events, probably based on netlink. This is not really convenient. Kernel hacking come with downsides including “interesting” new “features” and increased maintenance burden.

Hopefully, starting with Linux 3.15 the ground was laid to safely transform any traceable kernel function into userland events. “Safely” is common computer science expression referring to “some virtual machine”. This case is no exception. Linux has had one for years. Since Linux 2.1.75 released in 1997 actually. It’s called Berkeley Packet Filter of BPF for short. As its name suggests, it was originally developed for the BSD firewalls. It had only 2 registers and only allowed forward jumps meaning that you could not write loops with it (Well, you can, if you know the maximum iterations and you manually unroll them). The point was to guarantee the program would always terminate and hence never hang the system. Still not sure if it has any use while you have iptables? It serves as the [foundation of CloudFlare’s AntiDDos protection][6].

OK, so, with Linux the 3.15, [BPF was extended][7] turning it into eBPF. For “extended” BPF. It upgrades from 2 32 bits registers to 10 64 bits 64 registers and adds backward jumping among others. It has then been [further extended in Linux 3.18][8] moving it out of the networking subsystem, and adding tools like maps. To preserve the safety guarantees, it [introduces a checker][9] which validates all memory accesses and possible code path. If the checker can’t guarantee the code will terminate within fixed boundaries, it will deny the initial insertion of the program.

For more history, there is [an excellent Oracle presentation on eBPF][10].

Let’s get started.

### Hello from from `inet_listen`

As writing assembly is not the most convenient task, even for the best of us, we’ll use [bcc][11]. bcc is a collection of tools based on LLVM and Python abstracting the underlying machinery. Probes are written in C and the results can be exploited from python allowing to easily write non trivial applications.

Start by install bcc. For some of these examples, you may require a recent (read >= 4.4) version of the kernel. If you are willing to actually try these examples, I highly recommend that you setup a VM.  _NOT_  a docker container. You can’t change the kernel in a container. As this is a young and dynamic projects, install instructions are highly platform/version dependant. You can find up to date instructions on [https://github.com/iovisor/bcc/blob/master/INSTALL.md][12]

So, we want to get an event whenever a program starts to listen on TCP socket. When calling the `listen()` syscall on a `AF_INET` + `SOCK_STREAM` socket, the underlying kernel function is [`inet_listen`][13]. We’ll start by hooking a “Hello World” `kprobe` on it’s entrypoint.

```
from bcc import BPF

# Hello BPF Program
bpf_text = """ 
#include <net/inet_sock.h>
#include <bcc/proto.h>

// 1\. Attach kprobe to "inet_listen"
int kprobe__inet_listen(struct pt_regs *ctx, struct socket *sock, int backlog)
{
    bpf_trace_printk("Hello World!\\n");
    return 0;
};
"""

# 2\. Build and Inject program
b = BPF(text=bpf_text)

# 3\. Print debug output
while True:
    print b.trace_readline()

```

This program does 3 things: 1\. It attaches a kernel probe to “inet_listen” using a naming convention. If the function was called, say, “my_probe”, it could be explicitly attached with `b.attach_kprobe("inet_listen", "my_probe"`. 2\. It builds the program using LLVM new BPF backend, inject the resulting bytecode using the (new) `bpf()` syscall and automatically attaches the probes matching the naming convention. 3\. It reads the raw output from the kernel pipe.

Note: eBPF backend of LLVM is still young. If you think you’ve hit a bug, you may want to upgrade.

Noticed the `bpf_trace_printk` call? This is a stripped down version of the kernel’s `printk()`debug function. When used, it produces tracing informations to a special kernel pipe in `/sys/kernel/debug/tracing/trace_pipe`. As the name implies, this is a pipe. If multiple readers are consuming it, only 1 will get a given line. This makes it unsuitable for production.

Fortunately, Linux 3.19 introduced maps for message passing and Linux 4.4 brings arbitrary perf events support. I’ll demo the perf event based approach later in this post.

```
# From a first console
ubuntu@bcc:~/dev/listen-evts$ sudo /python tcv4listen.py 
              nc-4940  [000] d... 22666.991714: : Hello World!

# From a second console
ubuntu@bcc:~$ nc -l 0 4242
^C

```

Yay!

### Grab the backlog

Now, let’s print some easily accessible data. Say the “backlog”. The backlog is the number of pending established TCP connections, pending to be `accept()`ed.

Just tweak a bit the `bpf_trace_printk`:

```
bpf_trace_printk("Listening with with up to %d pending connections!\\n", backlog);

```

If you re-run the example with this world-changing improvement, you should see something like:

```
(bcc)ubuntu@bcc:~/dev/listen-evts$ sudo python tcv4listen.py 
              nc-5020  [000] d... 25497.154070: : Listening with with up to 1 pending connections!

```

`nc` is a single connection program, hence the backlog of 1\. Nginx or Redis would output 128 here. But that’s another story.

Easy hue? Now let’s get the port.

### Grab the port and IP

Studying `inet_listen` source from the kernel, we know that we need to get the `inet_sock` from the `socket` object. Just copy from the sources, and insert at the beginning of the tracer:

```
// cast types. Intermediate cast not needed, kept for readability
struct sock *sk = sock->sk;
struct inet_sock *inet = inet_sk(sk);

```

The port can now be accessed from `inet->inet_sport` in network byte order (aka: Big Endian). Easy! So, we could just replace the `bpf_trace_printk` with:

```
bpf_trace_printk("Listening on port %d!\\n", inet->inet_sport);

```

Then run:

```
ubuntu@bcc:~/dev/listen-evts$ sudo /python tcv4listen.py 
...
R1 invalid mem access 'inv'
...
Exception: Failed to load BPF program kprobe__inet_listen

```

Except that it’s not (yet) so simple. Bcc is improving a  _lot_  currently. While writing this post, a couple of pitfalls had already been addressed. But not yet all. This Error means the in-kernel checker could prove the memory accesses in program are correct. See the explicit cast. We need to help is a little by making the accesses more explicit. We’ll use `bpf_probe_read` trusted function to read an arbitrary memory location while guaranteeing all necessary checks are done with something like:

```
// Explicit initialization. The "=0" part is needed to "give life" to the variable on the stack
u16 lport = 0;

// Explicit arbitrary memory access. Read it:
//    Read into 'lport', 'sizeof(lport)' bytes from 'inet->inet_sport' memory location
bpf_probe_read(&lport, sizeof(lport), &(inet->inet_sport));

```

Reading the bound address for IPv4 is basically the same, using `inet->inet_rcv_saddr`. If we put is all together, we should get the backlog, the port and the bound IP:

```
from bcc import BPF  

# BPF Program  
bpf_text = """   
#include <net/sock.h>  
#include <net/inet_sock.h>  
#include <bcc/proto.h>  

// Send an event for each IPv4 listen with PID, bound address and port  
int kprobe__inet_listen(struct pt_regs *ctx, struct socket *sock, int backlog)  
{  
    // Cast types. Intermediate cast not needed, kept for readability  
    struct sock *sk = sock->sk;  
    struct inet_sock *inet = inet_sk(sk);  

    // Working values. You *need* to initialize them to give them "life" on the stack and use them afterward  
    u32 laddr = 0;  
    u16 lport = 0;  

    // Pull in details. As 'inet_sk' is internally a type cast, we need to use 'bpf_probe_read'  
    // read: load into 'laddr' 'sizeof(laddr)' bytes from address 'inet->inet_rcv_saddr'  
    bpf_probe_read(&laddr, sizeof(laddr), &(inet->inet_rcv_saddr));  
    bpf_probe_read(&lport, sizeof(lport), &(inet->inet_sport));  

    // Push event
    bpf_trace_printk("Listening on %x %d with %d pending connections\\n", ntohl(laddr), ntohs(lport), backlog);  
    return 0;
};  
"""  

# Build and Inject BPF  
b = BPF(text=bpf_text)  

# Print debug output  
while True:  
  print b.trace_readline()

```

A test run should output something like:

```
(bcc)ubuntu@bcc:~/dev/listen-evts$ sudo python tcv4listen.py 
              nc-5024  [000] d... 25821.166286: : Listening on 7f000001 4242 with 1 pending connections

```

Provided that you listen on localhost. The address is displayed as hex here to avoid dealing with the IP pretty printing but that’s all wired. And that’s cool.

Note: you may wonder why `ntohs` and `ntohl` can be called from BPF while they are not trusted. This is because they are macros and inline functions from “.h” files and a small bug was [fixed][14]while writing this post.

All done, one more piece: We want to get the related container. In the context of networking, that’s means we want the network namespace. The network namespace being the building block of containers allowing them to have isolated networks.

### Grab the network namespace: a forced introduction to perf events

On the userland, the network namespace can be determined by checking the target of `/proc/PID/ns/net`. It should look like `net:[4026531957]`. The number between brackets is the inode number of the network namespace. This said, we could grab it by scrapping ‘/proc’ but this is racy, we may be dealing with short-lived processes. And races are never good. We’ll grab the inode number directly from the kernel. Fortunately, that’s an easy one:

```
// Create an populate the variable
u32 netns = 0;

// Read the netns inode number, like /proc does
netns = sk->__sk_common.skc_net.net->ns.inum;

```

Easy. And it works.

But if you’ve read so far, you may guess there is something wrong somewhere. And there is:

```
bpf_trace_printk("Listening on %x %d with %d pending connections in container %d\\n", ntohl(laddr), ntohs(lport), backlog, netns);

```

If you try to run it, you’ll get some cryptic error message:

```
(bcc)ubuntu@bcc:~/dev/listen-evts$ sudo python tcv4listen.py
error: in function kprobe__inet_listen i32 (%struct.pt_regs*, %struct.socket*, i32)
too many args to 0x1ba9108: i64 = Constant<6>

```

What clang is trying to tell you is “Hey pal, `bpf_trace_printk` can only take 4 arguments, you’ve just used 5.“. I won’t dive into the details here, but that’s a BPF limitation. If you want to dig it, [here is a good starting point][15].

The only way to fix it is to… stop debugging and make it production ready. So let’s get started (and make sure run at least Linux 4.4). We’ll use perf events which supports passing arbitrary sized structures to userland. Additionally, only our reader will get it so that multiple unrelated eBPF programs can produce data concurrently without issues.

To use it, we need to:

1.  define a structure

2.  declare the event

3.  push the event

4.  re-declare the event on Python’s side (This step should go away in the future)

5.  consume and format the event

This may seem like a lot, but it ain’t. See:

```
// At the begining of the C program, declare our event
struct listen_evt_t {
    u64 laddr;
    u64 lport;
    u64 netns;
    u64 backlog;
};
BPF_PERF_OUTPUT(listen_evt);

// In kprobe__inet_listen, replace the printk with
struct listen_evt_t evt = {
    .laddr = ntohl(laddr),
    .lport = ntohs(lport),
    .netns = netns,
    .backlog = backlog,
};
listen_evt.perf_submit(ctx, &evt, sizeof(evt));

```

Python side will require a little more work, though:

```
# We need ctypes to parse the event structure
import ctypes

# Declare data format
class ListenEvt(ctypes.Structure):
    _fields_ = [
        ("laddr",   ctypes.c_ulonglong),
        ("lport",   ctypes.c_ulonglong),
        ("netns",   ctypes.c_ulonglong),
        ("backlog", ctypes.c_ulonglong),
    ]

# Declare event printer
def print_event(cpu, data, size):
    event = ctypes.cast(data, ctypes.POINTER(ListenEvt)).contents
    print("Listening on %x %d with %d pending connections in container %d" % (
        event.laddr,
        event.lport,
        event.backlog,
        event.netns,
    ))

# Replace the event loop
b["listen_evt"].open_perf_buffer(print_event)
while True:
    b.kprobe_poll()

```

Give it a try. In this example, I have a redis running in a docker container and nc on the host:

```
(bcc)ubuntu@bcc:~/dev/listen-evts$ sudo python tcv4listen.py
Listening on 0 6379 with 128 pending connections in container 4026532165
Listening on 0 6379 with 128 pending connections in container 4026532165
Listening on 7f000001 6588 with 1 pending connections in container 4026531957

```

### Last word

Absolutely everything is now setup to use trigger events from arbitrary function calls in the kernel using eBPF, and you should have seen most of the common pitfalls I hit while learning eBPF. If you want to see the full version of this tool, along with some more tricks like IPv6 support, have a look at [https://github.com/iovisor/bcc/blob/master/tools/solisten.py][16]. It’s now an official tool, thanks to the support of the bcc team.

To go further, you may want to checkout Brendan Gregg’s blog, in particular [the post about eBPF maps and statistics][17]. He his one of the project’s main contributor.


--------------------------------------------------------------------------------

via: https://blog.yadutaf.fr/2016/03/30/turn-any-syscall-into-event-introducing-ebpf-kernel-probes/

作者：[Jean-Tiare Le Bigot ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.yadutaf.fr/about
[1]:https://blog.yadutaf.fr/tags/linux
[2]:https://blog.yadutaf.fr/tags/tracing
[3]:https://blog.yadutaf.fr/tags/ebpf
[4]:https://blog.yadutaf.fr/tags/bcc
[5]:https://en.wikipedia.org/wiki/SystemTap
[6]:https://blog.cloudflare.com/bpf-the-forgotten-bytecode/
[7]:https://blog.yadutaf.fr/2016/03/30/turn-any-syscall-into-event-introducing-ebpf-kernel-probes/TODO
[8]:https://lwn.net/Articles/604043/
[9]:http://lxr.free-electrons.com/source/kernel/bpf/verifier.c#L21
[10]:http://events.linuxfoundation.org/sites/events/files/slides/tracing-linux-ezannoni-linuxcon-ja-2015_0.pdf
[11]:https://github.com/iovisor/bcc
[12]:https://github.com/iovisor/bcc/blob/master/INSTALL.md
[13]:http://lxr.free-electrons.com/source/net/ipv4/af_inet.c#L194
[14]:https://github.com/iovisor/bcc/pull/453
[15]:http://lxr.free-electrons.com/source/kernel/trace/bpf_trace.c#L86
[16]:https://github.com/iovisor/bcc/blob/master/tools/solisten.py
[17]:http://www.brendangregg.com/blog/2015-05-15/ebpf-one-small-step.html
