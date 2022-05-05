[#]: subject: "Debugging a weird 'file not found' error"
[#]: via: "https://jvns.ca/blog/2021/11/17/debugging-a-weird--file-not-found--error/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Debugging a weird 'file not found' error
======

Yesterday I ran into a weird error where I ran a program and got the error “file not found” even though the program I was running existed. It’s something I’ve run into before, but every time I’m very surprised and confused by it (what do you MEAN file not found, the file is RIGHT THERE???!!??)

So let’s talk about what happened and why!

### the error

Let’s start by showing the error message I got. I had a Go program called [serve.go][1], and I was trying to bundle it into a Docker container with this Dockerfile:

```

    FROM golang:1.17 AS go

    ADD ./serve.go /app/serve.go
    WORKDIR /app
    RUN go build serve.go

    FROM alpine:3.14

    COPY --from=go /app/serve /app/serve
    COPY ./static /app/static
    WORKDIR /app/static
    CMD ["/app/serve"]

```

This Dockerfile

  1. Builds the Go program
  2. Copies the binary into an Alpine container



Pretty simple. Seems like it should work, right?

But when I try to run `/app/serve`, this happens:

```

    $ docker build .
    $ docker run -it broken-container:latest /app/serve
    standard_init_linux.go:228: exec user process caused: no such file or directory

```

But the file definitely does exist:

```

    $ docker run -it broken-container:latest ls -l /app/serve
    -rwxr-xr-x    1 root     root       6220237 Nov 16 13:27 /app/serve

```

So what’s going on?

### idea 1: permissions

At first I thought “hmm, maybe the permissions are wrong?”. But this can’t be the problem, because:

  * permission problems don’t result in a “no such file or directory” error
  * in any case when we ran `ls -l`, we saw that the file was executable



(I’m including this even though it’s “obviously” wrong just because I have a lot of wrong thoughts when debugging, it’s part of the process :) )

### idea 2: strace

Then I decided to use strace, as always. Let’s see what stracing `/app/serve/` looks like

```

    $ docker run -it broken-container:latest /bin/sh
    $ /app/static # apk add strace
    (apk output omitted)
    $ /app/static # strace /app/serve
    execve("/app/serve", ["/app/serve"], 0x7ffdd08edd50 /* 6 vars */) = -1 ENOENT (No such file or directory)
    strace: exec: No such file or directory
    +++ exited with 1 +++

```

This is not that helpful, it just says “No such file or directory” again. But at least we know that the error is being thrown right away when we run the `evecve` system call, so that’s good.

Interestingly though, this is different from what happens when we try to strace a nonexistent binary:

```

    $ strace /app/asdf
    strace: Can't stat '/app/asdf': No such file or directory

```

### idea 3: google “enoent but file exists execve”

I vaguely remembered that there was some reason you could get an `ENOENT` error when executing a program even if the file did exist, so I googled it. This led me to [this stack overflow answer][2]

which said, very helpfully:

> When execve() returns the error ENOENT, it can mean more than one thing:
>  1\. the program doesn’t exist;
>  2\. the program itself exists, but it requires an “interpreter” that doesn’t exist.
>
> ELF executables can request to be loaded by another program, in a way very similar to `#!/bin/something` in shell scripts.

That answer says that we can find the interpreter with `readelf -l $PROGRAM | grep interpreter`. So let’s do that!

### step 4: use `readelf`

I didn’t have `readelf` installed in the container and I wasn’t sure how to install it, so I ran `mount` to get the path to the container’s filesystem and then ran `readelf` from the host using that overlay directory.

(as an aside: this is kind of a weird way to do this, but as a result of writing a [containers zine][3] I’m used to doing weird things with containers and I think doing weird things is fun, so this way just seemed fastest to me at the time. That trick won’t work if you’re on a Mac though, it only works on Linux)

```

    $ mount | grep docker
    overlay on /var/lib/docker/overlay2/1ed587b302af7d3182135d02257f261fd491b7acf4648736d4c72f8382ecba0d/merged type overlay (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/326ILTM2UXMVY64V7JFPCSDSKG:/var/lib/docker/overlay2/l/MGGPR357UOZZWXH3SH2AYHJL3E:/var/lib/docker/overlay2/l/EEEKSBSQ6VHGJ77YF224TBVMNV:/var/lib/docker/overlay2/l/RVKU36SQ3PXEQAGBRKSQRZFDGY,upperdir=/var/lib/docker/overlay2/1ed587b302af7d3182135d02257f261fd491b7acf4648736d4c72f8382ecba0d/diff,workdir=/var/lib/docker/overlay2/1ed587b302af7d3182135d02257f261fd491b7acf4648736d4c72f8382ecba0d/work,index=off)
    $ # (then I copy and paste the "merged" directory from the output)
    $ readelf -l /var/lib/docker/overlay2/1ed587b302af7d3182135d02257f261fd491b7acf4648736d4c72f8382ecba0d/merged/app/serve | grep interp
          [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]
       01     .interp
       03     .text .plt .interp .note.go.buildid

```

Okay, so the interpreter is `/lib64/ld-linux-x86-64.so.2`.

And sure enough, that file doesn’t exist inside our Alpine container

```

    $ docker run -it broken-container:latest ls /lib64/ld-linux-x86-64.so.2

```

### step 5: victory!

Then I googled a little more and found out that there’s a `golang:alpine` container that’s meant for doing Go builds targeted to be run in Alpine.

I switched to doing my build in the `golang:alpine` container and that fixed everything.

### question: why is my Go binary dynamically linked?

The problem was with the program’s interpreter. But I remembered that only dynamically linked programs have interpreters, which is a bit weird – I expected my Go binary to be statically linked! What’s going on with that?

First, I double checked that the Go binary was actually dynamically linked using `file` and `ldd`: (`ldd` lists the dependencies of a dynamically linked executable! it’s very useful!)

(I’m using the docker overlay filesystem to get at the binary inside the container again)

```

    $ file /var/lib/docker/overlay2/1ed587b302af7d3182135d02257f261fd491b7acf4648736d4c72f8382ecba0d/merged/app/serve
    /var/lib/docker/overlay2/1ed587b302af7d3182135d02257f261fd491b7acf4648736d4c72f8382ecba0d/merged/app/serve:
    ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked,
    interpreter /lib64/ld-linux-x86-64.so.2, Go
    BuildID=vd_DJvcyItRi4Q2RD0WL/z8P4ulttr6F6njfqx8CI/_odQWaUTR2e38bdHlD0-/ikjsOjlMbEOhj2qXv5AE,
    not stripped
    $ ldd /var/lib/docker/overlay2/1ed587b302af7d3182135d02257f261fd491b7acf4648736d4c72f8382ecba0d/merged/app/serve
        linux-vdso.so.1 (0x00007ffe095a6000)
        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007f565a265000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007f565a099000)
        /lib64/ld-linux-x86-64.so.2 => /usr/lib64/ld-linux-x86-64.so.2 (0x00007f565a2b4000)

```

Now that I know it’s dynamically linked, it’s not that surprising that it didn’t work on a different system than it was compiled on.

Some Googling tells me that I can get Go to produce a statically linked binary by setting `CGO_ENABLED=0`. Let’s see if that works.

```

    $ # first let's build it without that flag
    $ go build serve.go
    $ file ./serve
    ./serve: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, Go BuildID=UGBmnMfFsuwMky4-k2Mt/RaNGsMI79eYC4-dcIiP4/J7v5rNGo3sNiJqdgNR12/eR_7mqqrsil_Lr6vt-rP, not stripped
    $ ldd ./serve
        linux-vdso.so.1 (0x00007fff679a6000)
        libpthread.so.0 => /usr/lib/libpthread.so.0 (0x00007f659cb61000)
        libc.so.6 => /usr/lib/libc.so.6 (0x00007f659c995000)
        /lib64/ld-linux-x86-64.so.2 => /usr/lib64/ld-linux-x86-64.so.2 (0x00007f659cbb0000)
    $ # and now with the CGO_ENABLED_0 flag
    $ env CGO_ENABLED=0 go build serve.go
    $ file  ./serve
    ./serve: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, Go BuildID=Kq392IB01ShfNVP5TugF/2q5hN74m5eLgfuzTZzR-/EatgRjlx5YYbpcroiE9q/0Fg3zUxJKY3lbsZ9Ufda, not stripped
    $ ldd  ./serve
        not a dynamic executable

```

It works! I checked, and that’s an alternative way to fix this bug – if I just set the `CGO_ENABLED=0` environment variable in my build container, then I can build a static binary and I don’t need to switch to the `golang:alpine` container for my builds. I kind of like that fix better.

And statically linking in this case doesn’t even produce a bigger binary (for some reason it seems to produce a slightly _smaller_ binary?? I don’t know why that is)

I still don’t understand _why_ it’s using cgo here, I ran `env | grep CGO` and I definitely don’t have `CGO_ENABLED=1` set in my environment, but I don’t feel like solving that mystery right now.

### that was a fun bug!

I thought this bug was a nice way to see how you can run into problems when compiling a dynamically linked executable on one platform and running it on another one! And to learn about the fact that ELF files have an interpreter!

I’ve run into this “file not found” error a couple of times, and it feels kind of mind bending because it initially seems impossible (BUT THE FILE IS THERE!!! I SEE IT!!!). I hope this helps someone be less confused if you run into it!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/11/17/debugging-a-weird--file-not-found--error/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://gist.github.com/jvns/6147bc21fbb60b0090d543bb5e240134
[2]: https://superuser.com/a/507031
[3]: https://wizardzines.com/zines/containers
