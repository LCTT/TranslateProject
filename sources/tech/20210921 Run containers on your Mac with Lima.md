[#]: subject: "Run containers on your Mac with Lima"
[#]: via: "https://opensource.com/article/21/9/run-containers-mac-lima"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Run containers on your Mac with Lima
======
Lima can help overcome the challenges of running containers on a Mac.
![Containers for shipping overseas][1]

Running containers on your Mac can be a challenge. After all, containers are based on Linux-specific technologies like cgroups and namespaces.

Luckily, macOS has a built-in hypervisor, allowing virtual machines (VMs) on the Mac. The hypervisor is a low-level kernel feature, not a user-facing one.

Enter `hyperkit`, an [open source project][2] that will run VMs using the macOS hypervisor. The `hyperkit` tool is designed to be a "minimalist" VM runner. Unlike, say, VirtualBox, it does not come with fancy UI features to manage VMs.

You can grab `hyperkit`, a minimalist Linux distribution running a container manager, and plumb all the pieces together. This would be a lot of moving parts, and sounds like a lot of work. Especially if you want to make the network connections a bit more seamless by using `vpnkit`, an open source project to create a VM's network that feels more like part of the host's network.

### Lima

There is no reason to go to all that effort, when [the `lima` project][3] has figured out the details. One of the easiest ways to get `lima` running is with [Homebrew][4]. You can install `lima` with this command:


```
`$ brew install lima`
```

After installation, which might take a while, it is time to begin having some fun. In order to let `lima` know you are ready for some fun, you need to start it. Here's the command:


```
`$ limactl start`
```

If this is your first time, you will be asked if you like the defaults or whether you want to change any of them. The defaults are pretty safe, but I like to live on the wild side. This is why I jump into an editor and make the following modifications from:


```
 - location: "~"
    # CAUTION: `writable` SHOULD be false for the home directory.
    # Setting `writable` to true is possible but untested and dangerous.
    writable: false
```

to:


```
  - location: "~"
    # I *also* like to live dangerously -- Austin Powers
    writable: true
```

As it says in the comment, this can be dangerous. Many existing workflows, sadly, depend on this mounting to be read-write.

By default, `lima` runs `containerd` to manage containers. The `containerd` manager is also a pretty frill-less one. While it is not uncommon to use a wrapper daemon, like `dockerd`, to add those nice-to-have ergonomics, there is another way.

### The nerdctl tool

The `nerdctl` tool is a drop-in replacement for the Docker client which puts those features in the client, not the server. The `lima` tool allows running `nerdctl` without installing it locally, directly from inside the VM.

Putting it all together, it is time to run a container! This container will run an HTTP server. You can create the files on your Mac:


```
$ ls
index.html
$ cat index.html
hello
```

Now, mount and forward the ports:


```
$ lima nerdctl run --rm -it -p 8000:8000 -v $(pwd):/html --entrypoint bash python
root@9486145449ab:/#
```

Inside the container, run a simple web server:


```
$ lima nerdctl run --rm -it -p 8000:8000 -v $(pwd):/html --entrypoint bash python
root@9486145449ab:/# cd /html/
root@9486145449ab:/html# python -m http.server 8000
Serving HTTP on 0.0.0.0 port 8000 (<http://0.0.0.0:8000/>) ...
```

From a different terminal, you can check that everything looks good:


```
$ curl localhost:8000
hello
```

Back on the container, there is a log message documenting the HTTP client's connection:


```
`10.4.0.1 - - [09/Sep/2021 14:59:08] "GET / HTTP/1.1" 200 -`
```

One file is not enough, so times to make some things better. **CTRL-C** the server, and add another file:


```
^C
Keyboard interrupt received, exiting.
root@9486145449ab:/html# echo goodbye &gt; foo.html
root@9486145449ab:/html# python -m http.server 8000
Serving HTTP on 0.0.0.0 port 8000 (<http://0.0.0.0:8000/>) ...
```

Check that you can see the new file:


```
$ curl localhost:8000/foo.html
goodbye
```

### Wrap up

To recap, installing `lima` takes a while, but after you are done, you can do the following:

  * Run containers.
  * Mount arbitrary sub-directories of your home directory into containers.
  * Edit files in those directories.
  * Run network servers that appear to Mac programs like they are running on localhost.



All with `lima nerdctl`.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/run-containers-mac-lima

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_2015-2-osdc-lead.png?itok=kAfHrBoy (Containers for shipping overseas)
[2]: https://www.docker.com/blog/docker-unikernels-open-source/
[3]: https://github.com/lima-vm/lima
[4]: https://brew.sh/
