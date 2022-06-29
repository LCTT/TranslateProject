[#]: subject: "Notes on running containers with bubblewrap"
[#]: via: "https://jvns.ca/blog/2022/06/28/some-notes-on-bubblewrap/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Notes on running containers with bubblewrap
======
Hello! About a year ago I got mad about Docker container startup time. This was
because I was building an [nginx playground][1]
where I was starting a new “container” on every HTTP request, and so for it to
feel reasonably snappy, nginx needed to start quickly.

Also, I was running this project on a pretty small cloud machine (256MB RAM), a
small CPU, so I really wanted to avoid unnecessary overhead.

I’ve been looking for a way to run containers faster since then, but I couldn’t
find one until last week when I discovered
[bubblewrap][2]!! It’s very fast and I
think it’s super cool, but I also ran into a bunch of fun problems that I
wanted to write down for my future self.

#### some disclaimers

* I’m not sure if the way I’m using bubblewrap in this post is maybe not how it’s intended to be used
* there are a lot of sharp edges when using bubblewrap in this way, you need to
think a lot about Linux namespaces and how containers work
* bubblewrap is a security tool but I am not a security person and I am only
doing this for weird tiny projects. you should definitely not take security
advice from me.

Okay, all of that said, let’s talk about I’m trying to use bubblewrap to run
containers fast and in a relatively secure way :)

#### Docker containers take ~300ms to start on my machine

I ran a quick benchmark to see how long a Docker container takes to run a
simple command (`ls` ). For both Docker and Podman, it’s about 300ms.

```
$ time docker run --network none -it ubuntu:20.04 ls / > /dev/null
Executed in  378.42 millis 
$ time podman run --network none -it ubuntu:20.04 ls / > /dev/null
Executed in  279.27 millis
```

Almost all of this time is overhead from docker and podman – just running `ls` 
by itself takes about 3ms:

```
$ time ls / > /dev/null
Executed in    2.96 millis
```

I want to stress that, while I’m not sure exactly what the slowest part of
Docker and podman startup time is (I spent 5 minutes trying to profile them and
gave up), I’m 100% sure it’s something important.

The way we’re going to run containers faster with bubblewrap has a lot of
limitations and it’s a lower level interface which is a lot trickier to use.

#### goal 1: containers that start quickly

I felt like it *should* be possible to have containers that start essentially
instantly or at least in less than 5ms. My thought process:

* creating a new namespace with `unshare` is basically instant
* [containers are basically just a bunch of namespaces][3]
* what’s the problem?

#### container startup time is (usually) not that important

Most of the time when people are using containers, they’re running some
long-running process inside the container like a webserver, so it doesn’t
really matter if it takes 300ms to start.

So it makes sense to me that there aren’t a lot of container tools that
optimize for startup time. But I still wanted to optimize for startup time :)

#### goal 2: run the containers as an unprivileged user

Another goal I had was to be able to run my containers as an unprivileged user
instead of root.

I was surprised the first time I learned that Docker actually runs containers
as root – even though I run `docker run ubuntu:20.04` as an unprivileged user (`bork` ), that
message is actually sent to a daemon running as root, and the Docker container
process itself also runs as root (albeit a `root` that’s stripped of all its
capabilities).

That’s fine for Docker (they have lots of very smart people making sure that
they get it right!), but if I’m going to do container stuff *without* using
Docker (for the speed reasons mentioned above), I’d rather not do it as root to
keep everything a bit more secure.

#### podman can run containers as an non-root user

Before we start talking about how to do weird stuff with bubblewrap, I want to
quickly talk about a much more normal tool to run containers: podman!

Podman, unlike Docker, can run containers as an unprivileged user!

If I run this from my normal user:

```
$ podman run -it ubuntu:20.04 ls
```

it doesn’t secretly run as root behind the scenes! It just starts the container
as my normal user, and then uses something called “user namespaces” so that
*inside the container* I appear to be root.

The other cool thing aboud podman is that it has exactly the same interface as
Docker, so you can just take a Docker command and replace `docker` with
`podman` and it’ll Just Work. I’ve found that sometimes I need to do some extra
work to get podman to work in practice, but it’s still pretty nice that it has
the same command line interface.

This “run containers as a non-root user” feature is normally called “rootless
containers”. (I find that name kind of counterintuitive, but that’s what people call it)

#### failed attempt 1: write my own tool using runc

```
runc
```

I knew that Docker and podman use
[runc][4] under the hood, so I thought –
well, maybe I can just use `runc` directly to make my own tool that starts
containers faster than Docker does!

I tried to do this 6 months ago and I don’t remember most of the details, but basically
I spent 8 hours working on it, got frustrated because I couldn’t get anything
to work, and gave up.

One specific detail I remember struggling with was setting up a working `/dev` 
for my programs to use.

#### enter bubblewrap

Okay, that was a very long preamble so let’s get to the point! Last week, I
discovered a tool called `bubblewrap` that was basically exactly the thing I
was trying to build with `runc` in my failed attempt, except that it actually
works and has many more features and it’s built by people who know things about
security! Hooray!

The interface to bubblewrap is pretty different than the interface to Docker –
it’s much lower level. There’s no concept of a container image – instead you
map a bunch of directories on your host to directories in the container.

For example, here’s how to run a container with the same root directory as your
host operating system, but with only read access to that root directory, and only write access to `/tmp`.

```
bwrap \
    --ro-bind / / \
    --bind /tmp /tmp \
    --proc /proc --dev /dev \
    --unshare-pid \
    --unshare-net \
    bash
```

For example, you could imagine running some untrusted process under bubblewrap
this way and then putting all the files you the process to access in `/tmp`.

#### bubblewrap runs containers as an unprivileged (non-root) user

Like podman, bubblewrap runs containers as a non-root user, using user
namespaces. It can also run containers as root, but in this post we’re just
going to be talking about using it as an unprivileged user.

#### bubblewrap is fast

Let’s see how long it takes to run `ls` in a bubblewrap container!

```
$ time bwrap --ro-bind / / --proc /proc --dev /dev --unshare-pid ls /
Executed in    8.04 millis
```

That’s a big difference! 8ms is a lot faster than 279ms.

Of course, like we said before, the reason bubblewrap is faster is that it does
a lot less. So let’s talk about some things bubblewrap doesn’t do.

#### some things bubblewrap doesn’t do

Here are some things that Docker/podman do that bubblewrap doesn’t do:

* set up overlayfs mounts for you, so that your changes to the filesystem don’t affect the base image
* set up networking bridges so that you can connect to a webserver inside the container
* probably a bunch more stuff that I’m not thinking of

In general, bubblewrap is a much lower level tool than something like Docker.

Also, bubblewrap seems to have pretty different goals than Docker – the README
seems to say that it’s intended as a tool for sandboxing desktop software (I
think it comes from [flatpak][5]).

#### running a container image with bubblewrap

I couldn’t find instructions for running a Docker container image with
bubblewrap, so here they are. Basically I just use Docker to download the
container image and put it into a directory and then run it with `bwrap` :

There’s also a tool called [bwrap-oci][6] which looks cool but I
couldn’t get it to compile.

```
mkdir rootfs
docker export $(docker create frapsoft/fish) | tar -C rootfs -xf -
bwrap \
    --bind $PWD/rootfs / \
    --proc /proc --dev /dev \
    --uid 0 \
    --unshare-pid \
    --unshare-net \
    fish
```

One important thing to note is that this doesn’t create a temporary overlay
filesystem for the container’s file writes, so it’ll let the container edit
files in the image.

I wrote a post about [overlay filesystems][7] if
you want to see how you could do that yourself though.

#### running “containers” with bubblewrap isn’t the same as with podman

I just gave an example of how to “run a container” with bubblewrap, and you
might think “cool, this is just like podman but faster!”. It is not, and it’s
actually unlike using podman in even more ways than I expected.

I put “container” in scare quotes because there are two ways to define “container”:

* something that implements [OCI runtime specification][8]
* any way of running a process in a way that’s somehow isolated from the host system

bubblewrap is a “container” tool in the second sense. It definitely provides
isolation, and it does that using the same features – Linux namespaces – as
Docker.

But it’s not a container tool in the first sense. And it’s a lower level tool
so you can get into a bunch of weird states and you really need to think about
all the weird details of how container work while using it.

For the rest of the post I’m going to talk about some weird things that can
happen with bubblewrap that would not happen with podman/Docker.

#### weird thing 1: processes that don’t exist

Here’s an example of a weird situation I got into with bubblewrap that confused
me for a minute:

```
$ bwrap --ro-bind / / --unshare-all bash
$ ps aux
... some processes
root      390073  0.0  0.0   2848   124 pts/9    S    14:28   0:00 bwrap --ro-bind / / --unshare-all --uid 0 bash
... some other processes
$ kill 390073
bash: kill: (390073) - No such process
$ ps aux | grep 390073
root      390073  0.0  0.0   2848   124 pts/9    S    14:28   0:00 bwrap --ro-bind / / --unshare-all --uid 0 bash
```

Here’s what happened

* I started a bash shell inside bubblewrap
* I ran `ps aux`, and saw a process with PID `390073`
* I try to kill the process. It fails with the error `no such process`. What?
* I ran `ps aux`, and still see the process with PID `390073`

What’s going on? Why doesn’t the process `390073` exist, even though `ps` says it does? Isn’t that impossible?

Well, the problem is that `ps` doesn’t actually list all the processes in your
current PID namespace. Instead, it iterates through all the entries in `/proc` 
and prints those out. Usually, what’s in `/proc` is actually the same as the processes on your system.

But with Linux containers these things can get out of sync. What’s happening in
this example is that we have the `/proc` from the host PID namespace, but those
aren’t actually the processes that we have access to in our PID namespace.

Passing `--proc /proc` to bwrap fixes the issue – `ps` then actually lists the correct processes.

```
$ bwrap --ro-bind / / --unshare-all --dev /dev --proc /proc ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
bork           1  0.0  0.0   3644   136 ?        S+   16:21   0:00 bwrap --ro-bind / / --unshare-all --dev /dev --proc /proc ps au
bork           2  0.0  0.0  21324  1552 ?        R+   16:21   0:00 ps aux
```

Just 2 processes! Everything is normal!

#### weird thing 2: trying to listen on port 80

Passing `--uid 0` to bubblewrap makes the user inside the container `root`. You
might think that this means that the root user has administrative privileges
inside the container, but that’s not true!

For example, let’s try to listen on port 80:

```
$ bwrap --ro-bind / / --unshare-all --uid 0 nc -l 80
nc: Permission denied
```

What’s going on here is that the new root user actually doesn’t have the
**capabilities** it needs to listen on port 80. (you need special permissions
to listen on ports less than 1024, and 80 is less than 1024)

There’s actually a capability specifically for listening on privileged ports
called `CAP_NET_BIND_SERVICE`.

So to fix this all we need to do is to tell bubblewrap to give our user that
capability.

```
$ bwrap --ro-bind / / --unshare-all --uid 0 --cap-add cap_net_bind_service nc -l 80
(no output, success!!!)
```

This works! Hooray!

#### finding the right capabilities is pretty annoying

bubblewrap doesn’t give out any capabilities by default, and I find that
figuring out all the right capabilities and adding them manually is kind of
annoying. Basically my process is

* run the thing
* see what fails
* read `man capabilities` to figure out what capabilities I’m missing
* add the capability with `--cap-add`
* repeat until everything is running

But that’s the price I pay for wanting things to be fast I guess :)

#### weird thing 2b: --dev /dev makes listening on privileged ports not work

```
--dev /dev
```

One other strange thing is that if I take the exact same command above (which
worked!) and add `--dev /dev` (to set up the `/dev/` directory), it causes it to not work again:

```
$ bwrap --ro-bind / / --dev /dev --unshare-all --uid 0 --cap-add cap_net_bind_service nc -l 80
nc: Permission denied
```

I think this might be a bug in bubblewrap, but I haven’t mustered the courage
to dive into the bubblewrap code and start investigating yet. Or maybe there’s
something obvious I’m missing!

#### weird thing 3: UID mappings

Another slightly weird thing was – I tried to run `apt-get update` inside a bubblewrap Ubuntu container and everything went very poorly.

Here’s how I ran `apt-get update` inside the Ubuntu container:

```
mkdir rootfs
docker export $(docker create ubuntu:20.04) | tar -C rootfs -xf -
bwrap \
    --bind $PWD/rootfs / \
    --proc /proc\
    --uid 0 \
    --unshare-pid \
    apt-get update
```

And here are the error messages:

```
E: setgroups 65534 failed - setgroups (1: Operation not permitted)
E: setegid 65534 failed - setegid (22: Invalid argument)
E: seteuid 100 failed - seteuid (22: Invalid argument)
E: setgroups 0 failed - setgroups (1: Operation not permitted)
.... lots more similar errors
```

At first I thought “ok, this is a capabilities problem, I need to set
`CAP_SETGID` or something to give the container permission to change groups. But I did that and it didn’t help at all!

I think what’s going on here is a problem with UID maps. What are UID maps?
Well, every time you run a container using “user namespaces” (which podman is
doing), it creates a mapping of UIDs inside the container to UIDs on the host.

Let’s look that the UID maps! Here’s how do that:

````
[[email protected]][9]:/# cat /proc/self/uid_map
0 1000 1
[[email protected]][10]:/# cat /proc/self/gid_map
1000 1000 1

```
This is saying that user 0 in the container is mapped to user 1000 on in the
host, and group 1000 is mapped to group 1000. (My normal user's UID/GID is 1000, so this makes sense). You can find out
about this `uid_map` file in `man user_namespaces`.

All other users/groups that aren't 1000 are mapped to user 65534 by default, according
to `man user_namespaces`.

### what's going on: non-mapped users can't be used

The only users and groups that have been mapped are `0` and `1000`. But `man user_namespaces` says:

> After the uid_map and gid_map files have been written, only the mapped values may be used in system calls that change user and group IDs.

`apt` is trying to use users 100 and 65534. Those aren't on the list of mapped
users! So they can't be used!

This works fine in podman, because podman sets up its UID and GID mappings differently:
```

$ podman run -it ubuntu:20.04 bash
[[email protected]][11]:/# cat /proc/self/uid_map
0 1000 1
1 100000 65536
[[email protected]][12]:/# cat /proc/self/gid_map
0 1000 1
1 100000 65536
```

All the users get mapped, not just 1000.

I don’t quite know how to fix this, but I think it’s probably possible in
bubblewrap to set up the uid mappings the same way as podman does – there’s an
[issue about it here that links to a workaround][13].

But this wasn’t an actual problem I was trying to solve so I didn’t dig further
into it.

#### it works pretty great!

I’ve talked about a bunch of issues, but the things I’ve been trying to do in bubblewrap
have been very constrained and it’s actually been pretty simple. For example, I
was working on a git project where I really just want to run `git` inside a
container and map a git repository from the host.

That’s very simple to get to work with bubblewrap! There were basically no weird problems!
It’s really fast!

So I’m pretty excited about this tool and I might use it for more stuff in the
future.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/06/28/some-notes-on-bubblewrap/

作者：[Julia Evans][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lkxed
[1]: https://jvns.ca/blog/2021/09/24/new-tool--an-nginx-playground/
[2]: https://github.com/containers/bubblewrap
[3]: https://jvns.ca/blog/2016/10/10/what-even-is-a-container/
[4]: https://github.com/opencontainers/runc
[5]: https://flatpak.org/
[6]: https://github.com/projectatomic/bwrap-oci
[7]: https://jvns.ca/blog/2019/11/18/how-containers-work--overlayfs/
[8]: https://opencontainers.org/about/overview/
[9]: https://jvns.ca/cdn-cgi/l/email-protection
[10]: https://jvns.ca/cdn-cgi/l/email-protection
[11]: https://jvns.ca/cdn-cgi/l/email-protection
[12]: https://jvns.ca/cdn-cgi/l/email-protection
[13]: https://github.com/containers/bubblewrap/issues/468
