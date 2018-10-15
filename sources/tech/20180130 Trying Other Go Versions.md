Trying Other Go Versions
============================================================

While I generally use the current release of Go, sometimes I need to try a different version. For example, I need to check that all the examples in my [Guide to JSON][2] work with [both the supported releases of Go][3](1.8.6 and 1.9.3 at time of writing) along with go1.10rc1.

I primarily use the current version of Go, updating it when new versions are released. I try out other versions as needed following the methods described in this article.

### Trying Betas and Release Candidates[¶][4]

When [go1.8beta2 was released][5], a new tool for trying the beta and release candidates was also released that allowed you to `go get` the beta. It allowed you to easily run the beta alongside your Go installation by getting the beta with:

```
go get golang.org/x/build/version/go1.8beta2
```

This downloads and builds a small program that will act like the `go` tool for that specific version. The full release can then be downloaded and installed with:

```
go1.8beta2 download
```

This downloads the release from [https://golang.org/dl][6] and installs it into `$HOME/sdk` or `%USERPROFILE%\sdk`.

Now you can use `go1.8beta2` as if it were the normal Go command.

This method works for [all the beta and release candidates][7] released after go1.8beta2.

### Trying a Specific Release[¶][8]

While only beta and release candidates are provided, they can easily be adapted to work with any released version. For example, to use go1.9.2:

```
package main

import (
	"golang.org/x/build/version"
)

func main() {
	version.Run("go1.9.2")
}
```

Replace `go1.9.2` with the release you want to run and build/install as usual.

Since the program I use to build my [Guide to JSON][9] calls `go` itself (for each example), I build this as `go` and prepend the directory to my `PATH` so it will use this one instead of my normal version.

### Trying Any Release[¶][10]

This small program can be extended so you can specify the release to use instead of having to maintain binaries for each version.

```
package main

import (
	"fmt"
	"os"

	"golang.org/x/build/version"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Printf("USAGE: %v <version> [commands as normal]\n",
			os.Args[0])
		os.Exit(1)
	}

	v := os.Args[1]
	os.Args = append(os.Args[0:1], os.Args[2:]...)

	version.Run("go" + v)
}
```

I have this installed as `gov` and run it like `gov 1.8.6 version`, using the version I want to run.

### Trying a Source Build (e.g., tip)[¶][11]

I also use this same infrastructure to manage source builds of Go, such as tip. There’s just a little trick to it:

*   use the directory `$HOME/sdk/go<version>` (e.g., `$HOME/sdk/gotip`)

*   [build as normal][1]

*   `touch $HOME/sdk/go<version>/.unpacked-success` This is an empty file used as a sentinel to indicate the download and unpacking was successful.

(On Windows, replace `$HOME/sdk` with `%USERPROFILE%\sdk`)


--------------------------------------------------------------------------------

via: https://pocketgophers.com/trying-other-versions/

作者：[Nathan Kerr ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:nathan@pocketgophers.com
[1]:https://golang.org/doc/install/source
[2]:https://pocketgophers.com/guide-to-json/
[3]:https://pocketgophers.com/when-should-you-upgrade-go/
[4]:https://pocketgophers.com/trying-other-versions/#trying-betas-and-release-candidates
[5]:https://groups.google.com/forum/#!topic/golang-announce/LvfYP-Wk1s0
[6]:https://golang.org/dl
[7]:https://godoc.org/golang.org/x/build/version#pkg-subdirectories
[8]:https://pocketgophers.com/trying-other-versions/#trying-a-specific-release
[9]:https://pocketgophers.com/guide-to-json/
[10]:https://pocketgophers.com/trying-other-versions/#trying-any-release
[11]:https://pocketgophers.com/trying-other-versions/#trying-a-source-build-e-g-tip