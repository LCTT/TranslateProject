socat as a handler for multiple reverse shells · System Overlord
======

I was looking for a new way to handle multiple incoming reverse shells. My shells needed to be encrypted and I preferred not to use Metasploit in this case. Because of the way I was deploying my implants, I wasn't able to use separate incoming port numbers or other ways of directing the traffic to multiple listeners.

Obviously, it's important to keep each reverse shell separated, so I couldn't just have a listener redirecting all the connections to STDIN/STDOUT. I also didn't want to wait for sessions serially - obviously I wanted to be connected to all of my implants simultaneously. (And allow them to disconnect/reconnect as needed due to loss of network connectivity.)

As I was thinking about the problem, I realized that I basically wanted `tmux` for reverse shells. So I began to wonder if there was some way to connect `openssl s_server` or something similar to `tmux`. Given the limitations of `s_server`, I started looking at `socat`. Despite it's versatility, I've actually only used it once or twice before this, so I spent a fair bit of time reading the man page and the examples.

I couldn't find a way to get `socat` to talk directly to `tmux` in a way that would spawn each connection as a new window (file descriptors are not passed to the newly-started process in `tmux new-window`), so I ended up with a strange workaround. I feel a little bit like Rube Goldberg inventing C2 software (and I need to get something more permanent and featureful eventually, but this was a quick and dirty PoC), but I've put together a chain of `socat` to get a working solution.

My implementation works by having a single `socat` process receive the incoming connections (forking on incoming connection), and executing a script that first starts a `socat` instance within tmux, and then another `socat` process to copy from the first to the second over a UNIX domain socket.

Yes, this is 3 socat processes. It's a little ridiculous, but I couldn't find a better approach. Roughly speaking, the communications flow looks a little like this:
```
TLS data <--> socat listener <--> script stdio <--> socat <--> unix socket <--> socat in tmux <--> terminal window

```

Getting it started is fairly simple. Begin by generating your SSL certificate. In this case, I'm using a self-signed certificate, but obviously you could go through a commercial CA, Let's Encrypt, etc.
```
openssl req -newkey rsa:2048 -nodes -keyout server.key -x509 -days 30 -out server.crt
cat server.key server.crt > server.pem

```

Now we will create the script that is run on each incoming connection. This script needs to launch a `tmux` window running a `socat` process copying from a UNIX domain socket to `stdio` (in tmux), and then connecting another `socat` between the `stdio` coming in to the UNIX domain socket.
```
#!/bin/bash

SOCKDIR=$(mktemp -d)
SOCKF=${SOCKDIR}/usock

# Start tmux, if needed
tmux start
# Create window
tmux new-window "socat UNIX-LISTEN:${SOCKF},umask=0077 STDIO"
# Wait for socket
while test ! -e ${SOCKF} ; do sleep 1 ; done
# Use socat to ship data between the unix socket and STDIO.
exec socat STDIO UNIX-CONNECT:${SOCKF}
```

The while loop is necessary to make sure that the last `socat` process does not attempt to open the UNIX domain socket before it has been created by the new `tmux` child process.

Finally, we can launch the `socat` process that will accept the incoming requests (handling all the TLS steps) and execute our per-connection script:
```
socat OPENSSL-LISTEN:8443,cert=server.pem,reuseaddr,verify=0,fork EXEC:./socatscript.sh

```

This listens on port 8443, using the certificate and private key contained in `server.pem`, performs a `fork()` on accepting each incoming connection (so they do not block each other) and disables certificate verification (since we're not expecting our clients to provide a certificate). On the other side, it launches our script, providing the data from the TLS connection via STDIO.

At this point, an incoming TLS connection connects, and is passed through our processes to eventually arrive on the `STDIO` of a new window in the running `tmux` server. Each connection gets its own window, allowing us to easily see and manage the connections for our implants.

--------------------------------------------------------------------------------

via: https://systemoverlord.com/2018/01/20/socat-as-a-handler-for-multiple-reverse-shells.html

作者：[David][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://systemoverlord.com/about
