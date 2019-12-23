[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Magic GOPATH)
[#]: via: (https://www.jtolio.com/2017/01/magic-gopath)
[#]: author: (jtolio.com https://www.jtolio.com/)

Magic GOPATH
======

_**Update:** With the advent of Go 1.11 and [Go modules][1], this whole post is now useless. Unset your GOPATH entirely and switch to Go modules today!_

Maybe someday I’ll start writing about things besides Go again.

Go requires that you set an environment variable for your workspace called your `GOPATH`. The `GOPATH` is one of the most confusing aspects of Go to newcomers and even relatively seasoned developers alike. It’s not immediately clear what would be better, but finding a good `GOPATH` value has implications for your source code repository layout, how many separate projects you have on your computer, how default project installation instructions work (via `go get`), and even how you interoperate with other projects and libraries.

It’s taken until Go 1.8 to decide to [set a default][2] and that small change was one of [the most talked about code reviews][3] for the 1.8 release cycle.

After [writing about GOPATH himself][4], [Dave Cheney][5] [asked me][6] to write a blog post about what I do.

### My proposal

I set my `GOPATH` to always be the current working directory, unless a parent directory is clearly the `GOPATH`.

Here’s the relevant part of my `.bashrc`:

```
# bash command to output calculated GOPATH.
calc_gopath() {
  local dir="$PWD"

  # we're going to walk up from the current directory to the root
  while true; do

    # if there's a '.gopath' file, use its contents as the GOPATH relative to
    # the directory containing it.
    if [ -f "$dir/.gopath" ]; then
      ( cd "$dir";
        # allow us to squash this behavior for cases we want to use vgo
        if [ "$(cat .gopath)" != "" ]; then
          cd "$(cat .gopath)";
          echo "$PWD";
        fi; )
      return
    fi

    # if there's a 'src' directory, the parent of that directory is now the
    # GOPATH
    if [ -d "$dir/src" ]; then
      echo "$dir"
      return
    fi

    # we can't go further, so bail. we'll make the original PWD the GOPATH.
    if [ "$dir" == "/" ]; then
      echo "$PWD"
      return
    fi

    # now we'll consider the parent directory
    dir="$(dirname "$dir")"
  done
}

my_prompt_command() {
  export GOPATH="$(calc_gopath)"

  # you can have other neat things in here. I also set my PS1 based on git
  # state
}

case "$TERM" in
xterm*|rxvt*)
  # Bash provides an environment variable called PROMPT_COMMAND. The contents
  # of this variable are executed as a regular Bash command just before Bash
  # displays a prompt. Let's only set it if we're in some kind of graphical
  # terminal I guess.
  PROMPT_COMMAND=my_prompt_command
  ;;
*)
  ;;
esac
```

The benefits are fantastic. If you want to quickly `go get` something and not have it clutter up your workspace, you can do something like:

```
cd $(mktemp -d) && go get github.com/the/thing
```

On the other hand, if you’re jumping between multiple projects (whether or not they have the full workspace checked in or are just library packages), the `GOPATH` is set accurately.

More flexibly, if you have a tree where some parent directory is outside of the `GOPATH` but you want to set the `GOPATH` anyways, you can create a `.gopath` file and it will automatically set your `GOPATH` correctly any time your shell is inside that directory.

The whole thing is super nice. I kinda can’t imagine doing something else anymore.

### Fin.

--------------------------------------------------------------------------------

via: https://www.jtolio.com/2017/01/magic-gopath

作者：[jtolio.com][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.jtolio.com/
[b]: https://github.com/lujun9972
[1]: https://golang.org/cmd/go/#hdr-Modules__module_versions__and_more
[2]: https://rakyll.org/default-gopath/
[3]: https://go-review.googlesource.com/32019/
[4]: https://dave.cheney.net/2016/12/20/thinking-about-gopath
[5]: https://dave.cheney.net/
[6]: https://twitter.com/davecheney/status/811334240247812097
