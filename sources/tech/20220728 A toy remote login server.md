[#]: subject: "A toy remote login server"
[#]: via: "https://jvns.ca/blog/2022/07/28/toy-remote-login-server/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A toy remote login server
======

Hello! The other day we talked about [what happened when you press a key in your terminal][1].

As a followup, I thought it might be fun to implement a program that’s like a tiny ssh server, but without the security. You can find it [on github here][2], and I’ll explain how it works in this blog post.

### the goal: “ssh” to a remote computer

Our goal is to be able to login to a remote computer and run commands, like you do with SSH or telnet.

The biggest difference between this program and SSH is that there’s literally no security (not even a password) – anyone who can make a TCP connection to the server can get a shell and run commands.

Obviously this is not a useful program in real life, but our goal is to learn a little more about how terminals works, not to write a useful program.

(I will run a version of it on the public internet for the next week though, you can see how to connect to it at the end of this blog post)

### let’s start with the server!

We’re also going to write a client, but the server is the interesting part, so let’s start there. We’re going to write a server that listens on a TCP port (I picked 7777) and creates remote terminals for any client that connects to it to use.

When the server receives a new connection it needs to:

  1. create a pseudoterminal for the client to use
  2. start a `bash` shell process for the client to use
  3. connect `bash` to the pseudoterminal
  4. continuously copy information back and forth between the TCP connection and the pseudoterminal



I just said the word “pseudoterminal” a lot, so let’s talk about what that means.

### what’s a pseudoterminal?

Okay, what the heck is a pseudoterminal?

A pseudoterminal is a lot like a bidirectional pipe or a socket – you have two ends, and they can both send and receive information. You can read more about the information being sent and received in [what happens if you press a key in your terminal][1]

Basically the idea is that on one end, we have a TCP connection, and on the other end, we have a `bash` shell. So we need to hook one part of the pseudoterminal up to the TCP connection and the other end to bash.

The two parts of the pseudoterminal are called:

  * the “pseudoterminal master”. This is the end we’re going to hook up to the TCP connection.
  * the “slave pseudoterminal device”. We’re going to set our bash shell’s `stdout`, `stderr`, and `stdin` to this.



Once they’re conected, we can communicate with `bash` over our TCP connection and we’ll have a remote shell!

### why do we need this “pseudoterminal” thing anyway?

You might be wondering – Julia, if a pseudoterminal is kind of like a socket, why can’t we just set our bash shell’s `stdout` / `stderr` / `stdin` to the TCP socket?

And you can! We could write a TCP connection handler like this that does exactly that, it’s not a lot of code ([server-notty.go][3]).

```

    func handle(conn net.Conn) {
        tty, _ := conn.(*net.TCPConn).File()
        // start bash with tcp connection as stdin/stdout/stderr
        cmd := exec.Command("bash")
        cmd.Stdin = tty
        cmd.Stdout = tty
        cmd.Stderr = tty
        cmd.Start()
    }

```

It even kind of works – if we connect to it with `nc localhost 7778`, we can run commands and look at their output.

But there are a few problems. I’m not going to list all of them, just two.

**problem 1: Ctrl + C doesn’t work**

The way Ctrl + C works in a remote login session is

  * you press ctrl + c
  * That gets translated to `0x03` and sent through the TCP connection
  * The terminal receives it
  * the Linux kernel on the other end notes “hey, that was a Ctrl + C!”
  * Linux sends a `SIGINT` to the appropriate process (more on what the “appropriate process” is exactly later)



If the “terminal” is just a TCP connection, this doesn’t work, because when you send `0x04` to a TCP connection, Linux won’t magically send `SIGINT` to any process.

**problem 2: `top` doesn’t work**

When I try to run `top` in this shell, I get the error message `top: failed tty get`. If we strace it, we see this system call:

```

    ioctl(2, TCGETS, 0x7ffec4e68d60)        = -1 ENOTTY (Inappropriate ioctl for device)

```

So `top` is running an `ioctl` on its output file descriptor (2) to get some information about the terminal. But Linux is like “hey, this isn’t a terminal!” and returns an error.

There are a bunch of other things that go wrong, but hopefully at this point you’re convinced that we actually need to set bash’s stdout/stderr to be a terminal, not some other thing like a socket.

So let’s start looking at the server code and see what creating a pseudoterminal actually looks like.

### step 1: create a pseudoterminal

Here’s some Go code to create a pseudoterminal on Linux. This is copied from [github.com/creack/pty][4], but I removed some of the error handling to make the logic a bit easier to follow:

```

    pty, _ := os.OpenFile("/dev/ptmx", os.O_RDWR, 0)
    sname := ptsname(p)
    unlockpt(p)
    tty, _ := os.OpenFile(sname, os.O_RDWR|syscall.O_NOCTTY, 0)

```

In English, what we’re doing is:

  * open `/dev/ptmx` to get the “pseudoterminal master” Again, that’s the part we’re going to hook up to the TCP connection
  * get the filename of the “slave pseudoterminal device”, which is going to be `/dev/pts/13` or something.
  * “unlock” the pseudoterminal so that we can use it. I have no idea what the point of this is (why is it locked to begin with?) but you have to do it for some reason
  * open `/dev/pts/13` (or whatever number we got from `ptsname`) to get the “slave pseudoterminal device”



What do those `ptsname` and `unlockpt` functions do? They just make some `ioctl` system calls to the Linux kernel. All of the communication with the Linux kernel about terminals seems to be through various `ioctl` system calls.

Here’s the code, it’s pretty short: (again, I just copied it from [creack/pty][5])

```

    func ptsname(f *os.File) string {
        var n uint32
        ioctl(f.Fd(), syscall.TIOCGPTN, uintptr(unsafe.Pointer(&n)))
        return "/dev/pts/" + strconv.Itoa(int(n))
    }

    func unlockpt(f *os.File) {
        var u int32
        // use TIOCSPTLCK with a pointer to zero to clear the lock
        ioctl(f.Fd(), syscall.TIOCSPTLCK, uintptr(unsafe.Pointer(&u)))
    }

```

### step 2: hook the pseudoterminal up to `bash`

The next thing we have to do is connect the pseudoterminal to `bash`. Luckily, that’s really easy – here’s the Go code for it! We just need to start a new process and set the stdin, stdout, and stderr to `tty`.

```

    cmd := exec.Command("bash")
    cmd.Stdin = tty
    cmd.Stdout = tty
    cmd.Stderr = tty
    cmd.SysProcAttr = &syscall.SysProcAttr{
      Setsid: true,
    }
    cmd.Start()

```

Easy! Though – why do we need this `Setsid: true` thing, you might ask? Well, I tried commenting out that code to see what went wrong. It turns out that what goes wrong is – Ctrl + C doesn’t work anymore!

`Setsid: true` creates a new **session** for the new bash process. But why does that make `Ctrl + C` work? How does Linux know which process to send `SIGINT` to when you press `Ctrl + C`, and what does that have to do with sessions?

### how does Linux know which process to send Ctrl + C to?

I found this pretty confusing, so I reached for my favourite book for learning about this kind of thing: [the linux programming interface][6], specifically chapter 34 on process groups and sessions.

That chapter contains a few key facts: (#3, #4, and #5 are direct quotes from the book)

  1. Every process has a **session id** and a **process group id** (which may or may not be the same as its PID)
  2. A session is made up of multiple process groups
  3. All of the processes in a session share a single controlling terminal.
  4. A terminal may be the controlling terminal of at most one session.
  5. At any point in time, one of the process groups in a session is the **foreground process group** for the terminal, and the others are background process groups.
  6. When you press `Ctrl+C` in a terminal, SIGINT gets sent to all the processes in the foreground process group



What’s a process group? Well, my understanding is that:

  * processes in the same pipe `x | y | z` are in the same process group
  * processes you start on the same shell line (`x && y && z`) are in the same process group
  * child processes are by default in the same process group, unless you explicitly decide otherwise



I didn’t know most of this (I had no idea processes had a session ID!) so this was kind of a lot to absorb. I tried to draw a sketchy ASCII art diagram of the situation

```

    (maybe)  terminal --- session --- process group --- process
                                   |                 |- process
                                   |                 |- process
                                   |- process group
                                   |
                                   |- process group

```

So when we press Ctrl+C in a terminal, here’s what I think happens:

  * `\x04` gets written to the “pseudotermimal master” of a terminal
  * Linux finds the **session** for that terminal (if it exists)
  * Linux find the **foreground process group** for that session
  * Linux sends `SIGINT`



If we don’t create a new session for our new bash process, our new pseudoterminal actually won’t have **any** session associated with it, so nothing happens when we press `Ctrl+C`. But if we do create a new session, then the new pseudoterminal will have the new session associated with it.

### how to get a list of all your sessions

As a quick aside, if you want to get a list of all the sessions on your Linux machine, grouped by session, you can run:

```

    $ ps -eo user,pid,pgid,sess,cmd | sort -k3

```

This includes the PID, process gruoup ID, and session ID. As an example of the output, here are the two processes in the pipeline:

```

    bork       58080   58080   57922 ps -eo user,pid,pgid,sess,cmd
    bork       58081   58080   57922 sort -k3

```

You can see that they share the same process group ID and session ID, but of course they have different PIDs.

That was kind of a lot but that’s all we’re going to say about sessions and process groups in this post. Let’s keep going!

### step 3: set the window size

We need to tell the terminal how big to be!

Again, I just copied this from `creack/pty`. I decided to hardcode the size to 80x24.

```

    Setsize(tty, &Winsize{
            Cols: 80,
            Rows: 24,
        })

```

Like with getting the terminal’s pts filename and unlocking it, setting the size is just one `ioctl` system call:

```

    func Setsize(t *os.File, ws *Winsize) {
        ioctl(t.Fd(), syscall.TIOCSWINSZ, uintptr(unsafe.Pointer(ws)))
    }

```

Pretty simple! We could do something smarter and get the real window size, but I’m too lazy.

### step 4: copy information between the TCP connection and the pseudoterminal

As a reminder, our rough steps to set up this remote login server were:

  1. create a pseudoterminal for the client to use
  2. start a `bash` shell process
  3. connect `bash` to the pseudoterminal
  4. continuously copy information back and forth between the TCP connection and the pseudoterminal



We’ve done 1, 2, and 3, now we just need to ferry information between the TCP connection and the pseudoterminal.

There are two `io.Copy` calls, one to copy the input _from_ the tcp connection, and one to copy the output _to_ the TCP connection. Here’s what the code looks like:

```

     go func() {
                io.Copy(pty, conn)
        }()
      io.Copy(conn, pty)

```

The first one is in a goroutine just so they can both run in parallel.

Pretty simple!

### step 5: exit when we’re done

I also added a little bit of code to close the TCP connection when the command exits

```

    go func() {
      cmd.Wait()
      conn.Close()
    }()

```

And that’s it for the server! You can see all of the Go code here: [server.go][2].

### next: write a client

Next, we have to write a client. This is a lot than the server because we don’t need to do quite as much terminal setup. there are just 3 steps:

  1. Put the terminal into raw mode
  2. copy stdin/stdout to the TCP connection
  3. reset the terminal



### client step 1: put the terminal into “raw” mode

We need to put the client terminal into “raw” mode so that every time you press a key, it gets sent to the TCP connection immediately. If we don’t do this, everything will only get sent when you press enter.

“Raw mode” isn’t actually a single thing, it’s a bunch of flags that you want to turn off. There’s a good tutorial explaining all the flags we have to turn off called [Entering raw mode][7].

Like everything else with terminals, this requires `ioctl` system calls. In this case we get the terminal’s current settings, modify them, and save the old settings so that we can restore them later.

I figured out how to do this in Go by going to <https://grep.app> and typing in `syscall.TCSETS` to find some other Go code that was doing the same thing.

```

    func MakeRaw(fd uintptr) syscall.Termios {
        // from https://github.com/getlantern/lantern/blob/devel/archive/src/golang.org/x/crypto/ssh/terminal/util.go
        var oldState syscall.Termios
        ioctl(fd, syscall.TCGETS, uintptr(unsafe.Pointer(&oldState)))

        newState := oldState
        newState.Iflag &^= syscall.ISTRIP | syscall.INLCR | syscall.ICRNL | syscall.IGNCR | syscall.IXON | syscall.IXOFF
        newState.Lflag &^= syscall.ECHO | syscall.ICANON | syscall.ISIG
        ioctl(fd, syscall.TCSETS, uintptr(unsafe.Pointer(&newState)))
        return oldState
    }

```

### client step 2: copy stdin/stdout to the TCP connection

This is exactly like what we did with the server. It’s very little code:

```

    go func() {
            io.Copy(conn, os.Stdin)
        }()
        io.Copy(os.Stdout, conn)

```

### client step 3: restore the terminal’s state

We can put the terminal back into the mode it started in like this (another `ioctl`!):

```

    func Restore(fd uintptr, oldState syscall.Termios) {
        ioctl(fd, syscall.TCSETS, uintptr(unsafe.Pointer(&oldState)))
    }

```

### we did it!

We have written a tiny remote login server that lets anyone log in! Hooray!

Obviously this has zero security so I’m not going to talk about that aspect.

### it’s running on the public internet! you can try it out!

For the next week or so I’m going to run a demo of this on the internet at `tetris.jvns.ca`. It runs tetris instead of a shell because I wanted to avoid abuse, but if you want to try it with a shell you can run it on your own computer :).

If you want to try it out, you can use `netcat` as a client instead of the custom Go client program we wrote, because copying information to/from a TCP connection is what netcat does. Here’s how:

```

    stty raw -echo && nc tetris.jvns.ca 7777 && stty sane

```

This will let you play a terminal tetris game called `tint`.

You can also use the [client.go program][8] and run `go run client.go tetris.jvns.ca 7777`.

### this is not a good protocol

This protocol where we just copy bytes from the TCP connection to the terminal and nothing else is not good because it doesn’t allow us to send over information information like the terminal or the actual window size of the terminal.

I thought about implementing telnet’s protocol so that we could use telnet as a client, but I didn’t feel like figuring out how telnet works so I didn’t. (the server 30% works with telnet as is, but a lot of things are broken, I don’t quite know why, and I didn’t feel like figuring it out)

### it’ll mess up your terminal a bit

As a warning: using this server to play tetris will probably mess up your terminal a bit because it sets the window size to 80x24. To fix that I just closed the terminal tab after running that command.

If we wanted to fix this for real, we’d need to restore the window size after we’re done, but then we’d need a slightly more real protocol than “just blindly copy bytes back and forth with TCP” and I didn’t feel like doing that.

Also it sometimes takes a second to disconnect after the program exits for some reason, I’m not sure why that is.

### other tiny projects

That’s all! There are a couple of other similar toy implementations of programs I’ve written here:

  * [toy tls 1.3 implementation][9]
  * [toy dns resolver][10]



--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/07/28/toy-remote-login-server/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2022/07/20/pseudoterminals/
[2]: https://github.com/jvns/tiny-remote-login/blob/main/server.go
[3]: https://github.com/jvns/tiny-remote-login/blob/main/server-notty.go
[4]: https://github.com/creack/pty/blob/7de28cee0d53510e719c1aeb1850af0fa647c343/pty_linux.go
[5]: https://github.com/creack/pty/blob/7de28cee0d53510e719c1aeb1850af0fa647c343/pty_linux.go#L41-L54
[6]: https://man7.org/tlpi/
[7]: https://viewsourcecode.org/snaptoken/kilo/02.enteringRawMode.html
[8]: https://github.com/jvns/tiny-remote-login/blob/main/client.go
[9]: https://jvns.ca/blog/2022/03/23/a-toy-version-of-tls/
[10]: https://jvns.ca/blog/2022/02/01/a-dns-resolver-in-80-lines-of-go/
