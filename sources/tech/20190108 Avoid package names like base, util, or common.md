[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Avoid package names like base, util, or common)
[#]: via: (https://dave.cheney.net/2019/01/08/avoid-package-names-like-base-util-or-common)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Avoid package names like base, util, or common
======

Writing a good Go package starts with its name. Think of your package’s name as an elevator pitch, you have to describe what it does using just one word.

A common cause of poor package names are _utility packages_. These are packages where helpers and utility code congeal. These packages contain an assortment of unrelated functions, as such their utility is hard to describe in terms of what the package _provides_. This often leads to a package’s name being derived from what the package _contains_ —utilities.

Package names like `utils` or `helpers` are commonly found in projects which have developed deep package hierarchies and want to share helper functions without introducing import loops. Extracting utility functions to new package breaks the import loop, but as the package stems from a design problem in the project, its name doesn’t reflect its purpose, only its function in breaking the import cycle.

> [A little] duplication is far cheaper than the wrong abstraction.

— [Sandy Metz][1]

My recommendation to improve the name of `utils` or `helpers` packages is to analyse where they are imported and move the relevant functions into the calling package. Even if this results in some code duplication this is preferable to introducing an import dependency between two packages. In the case where utility functions are used in many places, prefer multiple packages, each focused on a single aspect with a correspondingly descriptive name.

Packages with names like `base` or `common` are often found when functionality common to two or more related facilities, for example common types between a client and server or a server and its mock, has been refactored into a separate package. Instead the solution is to reduce the number of packages by combining client, server, and common code into a single package named after the facility the package provides.

For example, the `net/http` package does not have `client` and `server` packages, instead it has `client.go` and `server.go` files, each holding their respective types. `transport.go` holds for the common message transport code used by both HTTP clients and servers.

Name your packages after what they _provide_ , not what they _contain_.

### Related posts:

  1. [Simple profiling package moved, updated][2]
  2. [The package level logger anti pattern][3]
  3. [How to include C code in your Go package][4]
  4. [Why I think Go package management is important][5]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2019/01/08/avoid-package-names-like-base-util-or-common

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://www.sandimetz.com/blog/2016/1/20/the-wrong-abstraction
[2]: https://dave.cheney.net/2014/10/22/simple-profiling-package-moved-updated (Simple profiling package moved, updated)
[3]: https://dave.cheney.net/2017/01/23/the-package-level-logger-anti-pattern (The package level logger anti pattern)
[4]: https://dave.cheney.net/2013/09/07/how-to-include-c-code-in-your-go-package (How to include C code in your Go package)
[5]: https://dave.cheney.net/2013/10/10/why-i-think-go-package-management-is-important (Why I think Go package management is important)
