[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use internal packages to reduce your public API surface)
[#]: via: (https://dave.cheney.net/2019/10/06/use-internal-packages-to-reduce-your-public-api-surface)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Use internal packages to reduce your public API surface
======

In the beginning, before the `go` tool, before Go 1.0, the Go distribution stored the standard library in a subdirectory called `pkg/` and the commands which built upon it in `cmd/`. This wasn’t so much a deliberate taxonomy but a by product of the original `make` based build system. In [September 2014][1], the Go distribution dropped the `pkg/` subdirectory, but then this tribal knowledge had set root in large Go projects and continues to this day.

I tend to view empty directories inside a Go project with suspicion. Often they are a hint that the module’s author may be trying to create a taxonomy of packages rather than ensuring each package’s name, and thus its enclosing directory, [uniquely describes its purpose][2]. While the symmetry with `cmd/` for `package main` commands is appealing, a directory that exists only to hold other packages is a potential design smell.

More importantly, the boilerplate of an empty `pkg/` directory distracts from the more useful idiom of an `internal/` directory. `internal/` is a special directory name recognised by the `go` tool which will prevent one package from being imported by another unless both share a common ancestor. Packages within an `internal/` directory are therefore said to be _internal packages_.

To create an internal package, place it within a directory named `internal/`. When the `go` command sees an import of a package with `internal/` in the import path, it verifies that the importing package is within the tree rooted at the _parent_ of the `internal/` directory.

For example, a package `/a/b/c/internal/d/e/f` can only be imported by code in the directory tree rooted at `/a/b/c`. It cannot be imported by code in `/a/b/g` or in any other repository.

If your project contains multiple packages you may find you have some exported symbols which are intended to be used by other packages in your project, but are not intended to be part of your project’s public API. Although Go has limited visibility modifiers–public, exported, symbols and private, non exported, symbols–internal packages provide a useful mechanism for controlling visibility to parts of your project which would otherwise be considered part of its public versioned API.

You can, of course, promote internal packages later if you want to commit to supporting that API; just move them up a directory level or two. The key is this process is _opt-in_. As the author, internal packages give you control over which symbols in your project’s public API without being forced to glob concepts together into unwieldy mega packages to avoid exporting them.

### Related posts:

  1. [Stress test your Go packages][3]
  2. [Practical public speaking for Nerds][4]
  3. [Five suggestions for setting up a Go project][5]
  4. [Automatically fetch your project’s dependencies with gb][6]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2019/10/06/use-internal-packages-to-reduce-your-public-api-surface

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://groups.google.com/forum/m/#!msg/golang-dev/c5AknZg3Kww/OFLmvGyfNR0J
[2]: https://dave.cheney.net/2019/01/08/avoid-package-names-like-base-util-or-common
[3]: https://dave.cheney.net/2013/06/19/stress-test-your-go-packages (Stress test your Go packages)
[4]: https://dave.cheney.net/2015/02/17/practical-public-speaking-for-nerds (Practical public speaking for Nerds)
[5]: https://dave.cheney.net/2014/12/01/five-suggestions-for-setting-up-a-go-project (Five suggestions for setting up a Go project)
[6]: https://dave.cheney.net/2016/06/26/automatically-fetch-your-projects-dependencies-with-gb (Automatically fetch your project’s dependencies with gb)
