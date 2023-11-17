[#]: subject: "Some notes on nix flakes"
[#]: via: "https://jvns.ca/blog/2023/11/11/notes-on-nix-flakes/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Some notes on nix flakes
======

I’ve been using nix for about [9 months now][1]. For all of that time I’ve been steadfastly ignoring flakes, but everyone keeps saying that flakes are great and the best way to use nix, so I decided to try to figure out what the deal is with them.

I found it very hard to find simple examples of flake files and I ran into a few problems that were very confusing to me, so I wanted to write down some very basic examples and some of the problems I ran into in case it’s helpful to someone else who’s getting started with flakes.

First, let’s talk about what a flake is a little.

### flakes are self-contained

Every explanation I’ve found of flakes explains them in terms of other nix concepts (“flakes simplify nix usability”, “flakes are processors of Nix code”). Personally I really needed a way to think about flakes in terms of other non-nix things and someone made an analogy to Docker containers that really helped me, so I’ve been thinking about flakes a little like Docker container images.

Here are some ways in which flakes are like Docker containers:

  * you can install and compile any software you want in them
  * you can use them as a dev environment (the flake sets up all your dependencies)
  * you can share your flake with other people with a `flake.nix` file and then they can build the software exactly the same way you built it (a little like how you can share a `Dockerfile`, though flakes are MUCH better at the “exactly the same way you built it” thing)



flakes are also different from Docker containers in a LOT of ways:

  * with a `Dockerfile`, you’re not actually guaranteed to get the exact same results as another user. With `flake.nix` and `flake.lock` you are.
  * they run natively on Mac (you don’t need to use Linux / a Linux VM the way you do with Docker)
  * different flakes can share dependencies very easily (you can technically share layers between Docker images, but flakes are MUCH better at this)
  * flakes can depend on other flakes and pick and choose which parts they want to take from their dependencies
  * `flake.nix` files are programs in the nix programming language instead of mostly a bunch of shell commands
  * the way they do isolation is completely different (nix uses [dynamic linker/rpath tricks][2] instead of filesystem overlays, and there are no cgroups or namespaces or VMs or anything with nix)



Obviously this analogy breaks down pretty quickly (the list of differences is VERY long), but they do share the “you can share a dev environment with a single configuration file” design goal.

### nix has a lot of pre-compiled binaries

To me one of the biggest advantages of nix is that I’m on a Mac and nix has a repository with a lot of pre-compiled binaries of various packages for Mac. I mostly mention this because people always say that nix is good because it’s “declarative” or “reproducible” or “functional” or whatever but my main motivation for using nix personally is that it has a lot of binary packages. I do appreciate that it makes it easier for me to build a [5-year-old version of hugo on mac][3] though.

My impression is that nix has more binary packages than Homebrew does, so installing things is faster and I don’t need to build as much from source.

### my goal: make a flake with every package I want installed on my system

Previously I was using nix as a Homebrew replacement like this (which I talk about more in [this blog post][1]):

  * run `nix-env -iA nixpkgs.whatever` to install stuff
  * that’s it



This worked great (except that it [randomly broke occasionally][4], but someone helped me find a workaround for that so the random breaking wasn’t a big issue).

I thought it might be fun to have a single `flake.nix` file where I could maintain a list of all the packages I wanted installed and then put all that stuff in a directory in my `PATH`. This isn’t very well motivated: my previous setup was generally working just fine, but I have a long history of fiddling with my computer setup (Arch Linux ftw) and so I decided to have a Day Of Fiddling.

I think the only practical advantages of flakes for me are:

  * I could theoretically use the `flake.nix` file to set up a new computer more easily
  * I can never remember how to **uninstall** software in nix, deleting a line in a configuration file is maybe easier to remember



These are pretty minor though.

### how do we make a flake?

Okay, so I want to make a flake with a bunch of packages installed in it, let’s say Ruby and cowsay to start. How do I do that? I went to [zero-to-nix][5] and copied and pasted some things and ended up with this `flake.nix` file ([here it is in a gist][6]):

```

    {
      inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";
      outputs = { self, nixpkgs }: {
        devShell.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.mkShell {
          buildInputs = with nixpkgs.legacyPackages.aarch64-darwin; [
            cowsay
            ruby
          ];
        };
      };
    }

```

This has a little bit of boilerplate so let’s list the things I understand about this:

  * [nixpkgs][7] is a huge central repository of nix packages
  * `aarch64-darwin` is my machine’s architecture, this is important because I’m asking nix to download binaries
  * I’ve been thinking of an “input” as a sort of dependency. `nixpkgs` is my one input. I get to pick and choose which bits of it I want to bring into my flake though.
  * `mkShell` is a nix function that’s apparently useful if you want to run `nix develop`. I stopped using it after this so I don’t know more than that.
  * `devShell.aarch64-darwin` is the name of the output. Apparently I need to give it that exact name or else `nix develop` will yell at me
  * `cowsay` and `ruby` are the things I’m taking from nixpkgs to put in my output
  * I don’t know what `self` is doing here or what `legacyPackages` is about



Okay, cool. Let’s try to build it:

```

    $ nix build
    error: getting status of '/nix/store/w1v41cyqyx4d7q4g7c8nb50bp9dvjm29-source/flake.nix': No such file or directory

```

This error is VERY mysterious – what is `/nix/store/w1v41cyqyx4d7q4g7c8nb50bp9dvjm29-source/` and why does nix think it should exist???

I was totally stuck until a very nice person on Mastodon helped me. So let’s talk about what’s going wrong here.

### problem 1: nix completely ignores untracked files

Apparently nix flakes have some Weird Rules about git. The way it works is:

  * if your current directory **isn’t** a git repo, everything is fine
  * if your **are** in a git repository, and all your files have been `git add`ed to git, everything is fine
  * but if you’re in a git directory and your `flake.nix` file isn’t tracked by git yet (because you just created it and are trying to get it to work), nix will COMPLETELY IGNORE YOUR FILE



After someone kindly told me what was happening, I found that this is [mentioned in this blog post about flakes][8], which says:

> Note that any file that is not tracked by Git is invisible during Nix evaluation

There’s also a [github issue][9] discussing what to do about this.

So we need to `git add` the file to get nix to pay attention to it. Cool. Let’s keep going.

### a note on enabling the flake feature

To get any of the commands we’re going to talk about to work (like `nix build`), you need to enable two nix features:

  1. flakes
  2. “commands”



I set this up by putting `experimental-features = nix-command flakes` in my `~/.config/nix/nix.conf`, but you can also run `nix --extra-experimental-features flakes nix-command build` instead of `nix build`.

### time for `nix develop`

The instructions I was following told me that I could now run `nix develop` and get a shell inside my new environment. I tried it and it works:

```

    $ nix develop
    grapefruit:nix bork$ cowsay hi
     ____
    < hi >
     ----
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\
                    ||----w |

```

Cool! I was curious about how the PATH was set up inside this environment so I took a look:

```

    grapefruit:nix bork$ echo $PATH
    /nix/store/v5q1bxrqs6hkbsbrpwc81ccyyfpbl8wk-clang-wrapper-11.1.0/bin:/nix/store/x9jmvvxcys4zscff39cnpw0kyfvs80vp-clang-11.1.0/bin:/nix/store/3f1ii2y5fs1w7p0id9mkis0ffvhh1n8w-coreutils-9.1/bin:/nix/store/8ldvi6b3ahnph19vm1s0pyjqrq0qhkvi-cctools-binutils-darwin-wrapper-973.0.1/bin:/nix/store/5kbbxk18fp645r4agnn11bab8afm0ry3-cctools-binutils-darwin-973.0.1/bin:/nix/store/5si884h02nqx3dfcdm5irpf7caihl6f8-cowsay-3.7.0/bin:/nix/store/5bs5q2dw5bl7c4krcviga6yhdrqbvdq6-ruby-3.1.4/bin:/nix/store/3f1ii2y5fs1w7p0id9mkis0ffvhh1n8w-coreutils-9.1/bin

```

It looks like every dependency has been added to the PATH separately: for example there’s `/nix/store/5si884h02nqx3dfcdm5irpf7caihl6f8-cowsay-3.7.0/bin` for `cowsay` and `/nix/store/5bs5q2dw5bl7c4krcviga6yhdrqbvdq6-ruby-3.1.4/bin` for `ruby`. That’s fine but it’s not how I wanted my setup to work: I wanted a single directory of symlinks that I could just put in my PATH in my normal shell.

### getting a directory of symlinks with `buildEnv`

I asked in the Nix discord and someone told me I could use `buildEnv` to turn my flake into a directory of symlinks. As far as I can tell it’s just a way to take nix packages and copy their symlinks into another directory.

After some fiddling, I ended up with this: ([here’s a gist][10])

```

    {
      inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";
      outputs = { self, nixpkgs }: {
        defaultPackage.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.buildEnv {
          name = "julia-stuff";
          paths = with nixpkgs.legacyPackages.aarch64-darwin; [
            cowsay
            ruby
          ];
          pathsToLink = [ "/share/man" "/share/doc" "/bin" "/lib" ];
          extraOutputsToInstall = [ "man" "doc" ];
        };
      };
    }

```

This put a bunch of symlinks in `result/bin`:

```

    $ ls result/bin/
    bundle  bundler  cowsay  cowthink  erb  gem  irb  racc  rake  rbs  rdbg  rdoc  ri  ruby  typeprof

```

Sweet! Now I have a thing I can theoretically put in my PATH – this `result` directory. Next I mostly just needed to add every other package I wanted to install to this `flake.nix` file (I got the list from `nix-env -q`).

### next step: add all the packages

I ran into a bunch of weird problems adding all the packges I already had installed to my nix, so let’s talk about them.

### problem 2: an unfree package

I wanted to install a non-free package called `ngrok`. Nix gave me 3 options for how I could do this. Option C seemed the most promising:

```

           c) For `nix-env`, `nix-build`, `nix-shell` or any other Nix command you can add
             { allowUnfree = true; }
           to ~/.config/nixpkgs/config.nix.

```

But adding `{ allowUnfree = true}` to `~/.config/nixpkgs/config.nix` didn’t do anything for some reason so instead I went with option A, which did seem to work:

```

                $ export NIXPKGS_ALLOW_UNFREE=1

            Note: For `nix shell`, `nix build`, `nix develop` or any other Nix 2.4+
            (Flake) command, `--impure` must be passed in order to read this
            environment variable.

```

### problem 3: installing a flake from a relative path doesn’t work

I made a couple of flakes for custom Nix packages I’d made (which I wrote about in [my first nix blog post][1], and I wanted to set them up like this (you can see the [full configuration here][11]):

```

          hugoFlake.url = "path:../hugo-0.40";
          paperjamFlake.url = "path:../paperjam";

```

This worked fine the first time I ran `nix build`, but when I reran `nix build` again later I got some totally inscrutable error.

My workaround was just to run `rm flake.lock` everytime before running `nix build`, which seemed to fix the problem.

I don’t really understand what’s going on here but there’s a [very long github issue thread about it][12].

### problem 4 : “error while reading the response from the build hook”

For a while, every time I ran `nix build`, I got this error:

```

    $ nix build
    error:
           … while reading the response from the build hook

           error: unexpected EOF reading a line

```

I spent a lot of time poking at my `flake.nix` trying to guess at what I could have gone wrong.

A very nice person on Mastodon also helped me with this one and it turned out that what I needed to do was find the `nix-daemon` process and kill it. I still have no idea what happened here or what that error message means, I did upgrade nix at some point during this whole process so I guess the upgrade went wonky somehow.

I don’t think this one is a common problem.

### problem 5: error with share/man symlink

I wanted to install the `zulu` package for Java, but when I tried to add it to my list of packages I got this error complaining about a broken symlink:

```

    $ nix build
    error: builder for '/nix/store/4n9c4707iyiwwgi9b8qqx7mshzrvi27r-julia-dev.drv' failed with exit code 2;
           last 1 log lines:
           > error: not a directory: `/nix/store/2vc4kf5i28xcqhn501822aapn0srwsai-zulu-11.62.17/share/man'
           For full logs, run 'nix log /nix/store/4n9c4707iyiwwgi9b8qqx7mshzrvi27r-julia-dev.drv'.
    $ ls /nix/store/2vc4kf5i28xcqhn501822aapn0srwsai-zulu-11.62.17/share/ -l
    lrwxr-xr-x 29 root 31 Dec  1969 man -> zulu-11.jdk/Contents/Home/man

```

I think what’s going on here is that the `zulu` package in `nixpkgs-23.05` was just broken (looks like it’s since been [fixed][13] in the unstable version).

I decided I didn’t feel like dealing with that and it turned out I already had Java installed another way outside nix, so I just removed `zulu` from my list and moved on.

### putting it in my PATH

Now that I knew how to fix all of the weird problems I’d run into, I wrote a little shell script called `nix-symlink` to build my flake and symlink it to the very unimaginitively named `~/.nix-flake`. The idea was that then I could put `~/.nix-flake` in my `PATH` and have all my programs available.

I think people usually use nix flakes in a per-project way instead of “a single global flake”, but this is how I wanted my setup to work so that’s what I did.

Here’s the `nix-symlink` script. The `rm flake.lock` is because of that relative path issue, and the `NIXPKGS_ALLOW_UNFREE` is so I could install ngrok.

```

    #!/bin/bash

    set -euo pipefail

    export NIXPKGS_ALLOW_UNFREE=1
    cd ~/work/nixpkgs/flakes/grapefruit || exit
    rm flake.lock
    nix build --impure --out-link ~/.nix-flake

```

I put `~/.nix-flake` at the beginning of my `PATH` (not at the end), but I might revisit that, we’ll see.

### a note on GC roots

At the end of all this, I wanted to run a garbage collection because I’d installed a bunch of random stuff that was taking about 20GB of extra hard drive space in my `/nix/store`. I think there are two different ways to collect garbage in nix:

  * `nix-store --gc`
  * `nix-collect-garbage`



I have no idea what the difference between them is, but `nix-collect-garbage` seemed to delete more stuff for some reason.

I wanted to check that my `~/.nix-flake` directory was actually a GC root, so that all my stuff wouldn’t get deleted when I ran a GC.

I ran `nix-store --gc --print-roots` to print out all the GC roots and my `~/.nix-flake` was in there so everything was good! This command also runs a GC so it was kind of a dangerous way to check if a GC was going to delete everything, but luckily it worked.

### that’s it!

Now my new nix workflow is:

  * edit my `flake.nix` to add or remove packages ([this file][14])
  * rerun my `nix-symlink` script after editing it
  * maybe periodically run `nix-collect-garbage`
  * that’s it



### setting up the nix registry

The last thing I wanted to do was run

```

    nix registry add nixpkgs github:NixOS/nixpkgs/nixpkgs-23.05-darwin

```

so that if I want to ad-hoc run a flake with `nix run nixpkgs#cowsay`, it’ll take the version from the 23.05 version of nixpkgs. Mostly I just wanted this so I didn’t have to download new versions of the nixpkgs repository all the time – I just wanted to pin the 23.05 version.

I think `nixpkgs-unstable` is the default which I’m sure is fine too if you want to have more up-to-date software.

### my solutions are probably not the best

My solutions to all the nix problems I described are maybe not The Best ™, but I’m happy that I figured out a way to install stuff that just involves one relatively simple `flake.nix` file and a 6-line bash script and not a lot of other machinery.

Personally I still feel extremely uncomfortable with nix and so it’s important to me to keep my configuration as simple as possible without a lot of extra abstraction layers that I don’t understand. I might try out [flakey-profile][15] at some point though because it seems extremely simple.

### you can do way fancier stuff

You can manage a lot more stuff with nix, like:

  * your npm / ruby / python / etc packages (I just do `npm install` and `pip install` and `bundle install`)
  * your config files



There are all kind of tools that build on top of nix and flakes like [home-manager][16]. Like I said before though, it’s important to me to keep my configuration super simple so that I can have any hope of understanding how it works and being able to fix problems when it breaks so I haven’t paid attention to any of that stuff.

### there’s a useful discord

I’ve been complaining about nix a little in this post, but as usual with open source projects I assume that nix has all of these papercuts because it’s a complicated system run by a small team of volunteers with very limited time.

Folks on the [unofficial nix discord][17] have been helpful, they have a “support forum” section in there and I’ve gotten answers to a lot of my questions.

### some other nix resources

the main resources I’ve found for understanding nix flakes are:

  * [Nix Flakes, Part 1: An introduction and tutorial][8], I think by their creator
  * [xe iaso’s blog][18]
  * [ian henry’s blog][19]
  * [the nix docs][20]
  * [zero to nix][5]



Also Kamal (my partner) uses nix and that really helps, I think using nix with an experienced friend around is a lot easier.

### that’s all!

I still kind of like nix after using it for 9 months despite how confused I am about it all the time, I feel like once I get things working they don’t usually break.

We’ll see if that’s continues to be the case with flakes! Maybe I’ll go back to just using `nix-env -iA`ing everything if it goes badly.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/11/11/notes-on-nix-flakes/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2023/02/28/some-notes-on-using-nix/
[2]: https://github.com/NixOS/patchelf
[3]: https://github.com/jvns/nixpkgs/blob/main/flakes/hugo-0.40/flake.nix
[4]: https://github.com/NixOS/nix/issues/9340
[5]: https://zero-to-nix.com/
[6]: https://gist.github.com/jvns/b51d4c2f04b705310cff18fcab291630
[7]: https://github.com/NixOS/nixpkgs
[8]: https://www.tweag.io/blog/2020-05-25-flakes/
[9]: https://github.com/NixOS/nix/issues/7107
[10]: https://gist.github.com/jvns/f0fa8de179cf2b14d210c9a5f9adbbd5
[11]: https://github.com/jvns/nixpkgs/blob/f26e3db8ea929d7f228893adf973e678cc9c1741/flakes/grapefruit/flake.nix#L5-L6
[12]: https://github.com/NixOS/nix/issues/3978
[13]: https://github.com/NixOS/nixpkgs/pull/259622
[14]: https://github.com/jvns/nixpkgs/blob/f26e3db8ea929d7f228893adf973e678cc9c1741/flakes/grapefruit/flake.nix
[15]: https://github.com/lf-/flakey-profile/
[16]: https://github.com/nix-community/home-manager
[17]: https://discord.gg/RbvHtGa
[18]: https://xeiaso.net/blog/
[19]: https://ianthehenry.com/posts/how-to-learn-nix/
[20]: https://nixos.org/manual/nix/stable/
