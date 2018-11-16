translating by dianbanjiu   4 tips for learning Golang
======
Arriving in Golang land: A senior developer's journey.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_laptop_code_programming_mountain_view.jpg?itok=yx5buqkr)

In the summer of 2014...

> IBM: "We need you to go figure out this Docker thing."
>  Me: "OK."
>  IBM: "Start contributing and just get involved."
>  Me: "OK." (internal voice): "This is written in Go. What's that?" (Googles) "Oh, a programming language. I've learned a few of those in my career. Can't be that hard."

My university's freshman programming class was taught using VAX assembler. In data structures class, we used Pascal—loaded via diskette on tired, old PCs in the library's computer center. In one upper-level course, I had a professor that loved to show all examples in ADA. I learned a bit of C via playing with various Unix utilities' source code on our Sun workstations. At IBM we used C—and some x86 assembler—for the OS/2 source code, and we heavily used C++'s object-oriented features for a joint project with Apple. I learned shell scripting soon after, starting with csh, but moving to Bash after finding Linux in the mid-'90s. I was thrust into learning m4 (arguably more of a macro-processor than a programming language) while working on the just-in-time (JIT) compiler in IBM's custom JVM code when porting it to Linux in the late '90s.

Fast-forward 20 years... I'd never been nervous about learning a new programming language. But [Go][1] felt different. I was going to contribute publicly, upstream on GitHub, visible to anyone interested enough to look! I didn't want to be the laughingstock, the Go newbie as a 40-something-year-old senior developer! We all know that programmer pride that doesn't like to get bruised, no matter your experience level.

My early investigations revealed that Go seemed more committed to its "idiomatic-ness" than some languages. It wasn't just about getting the code to compile; I needed to be able to write code "the Go way."

Now that I'm four years and several hundred pull requests into my personal Go journey, I don't claim to be an expert, but I do feel a lot more comfortable contributing and writing Go code than I did in 2014. So, how do you teach an old guy new tricks—or at least a new programming language? Here are four steps that were valuable in my own journey to Golang land.

### 1. Don't skip the fundamentals

While you might be able to get by with copying code and hunting and pecking your way through early learnings (who has time to read the manual?!?), Go has a very readable [language spec][2] that was clearly written to be read and understood, even if you don't have a master's in language or compiler theory. Given that Go made some unique decisions about the order of the **parameter:type** constructs and has interesting language features like channels and goroutines, it is important to get grounded in these new concepts. Reading this document alongside [Effective Go][3], another great resource from the Golang creators, will give you a huge boost in readiness to use the language effectively and properly.

### 2. Learn from the best

There are many valuable resources for digging in and taking your Go knowledge to the next level. All the talks from any recent [GopherCon][4] can be found online, like this exhaustive list from [GopherCon US in 2018][5]. Talks range in expertise and skill level, but you can easily find something you didn't know about Go by watching the talks. [Francesc Campoy][6] created a Go programming video series called [JustForFunc][7] that has an ever-increasing number of episodes to expand your Go knowledge and understanding. A quick search on "Golang" reveals many other video and online resources for those who want to learn more.

Want to look at code? Many of the most popular cloud-native projects on GitHub are written in Go: [Docker/Moby][8], [Kubernetes][9], [Istio][10], [containerd][11], [CoreDNS][12], and many others. Language purists might rate some projects better than others regarding idiomatic-ness, but these are all good starting points to see how large codebases are using Go in highly active projects.

### 3. Use good language tools

You will learn quickly about the value of [gofmt][13]. One of the beautiful aspects of Go is that there is no arguing about code formatting guidelines per project— **gofmt** is built into the language runtime, and it formats Go code according to a set of stable, well-understood language rules. I don't know of any Golang-based project that doesn't insist on checking with **gofmt** for pull requests as part of continuous integration.

Beyond the wide, valuable array of useful tools built directly into the runtime/SDK, I strongly recommend using an editor or IDE with good Golang support features. Since I find myself much more often at a command line, I rely on Vim plus the great [vim-go][14] plugin. I also like what Microsoft has offered with [VS Code][15], especially with its [Go language][16] plugins.

Looking for a debugger? The [Delve][17] project has been improving and maturing and is a strong contender for doing [gdb][18]-like debugging on Go binaries.

### 4. Jump in and write some Go!

You'll never get better at writing Go unless you start trying. Find a project that has some "help needed" issues flagged and make a contribution. If you are already using an open source project written in Go, find out if there are some bugs that have beginner-level solutions and make your first pull request. As with most things in life, the only real way to improve is through practice, so get going.

And, as it turns out, apparently you can teach an old senior developer new tricks—or languages at least.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/learning-golang

作者：[Phill Estes][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/estesp
[b]: https://github.com/lujun9972
[1]: https://golang.org/
[2]: https://golang.org/ref/spec
[3]: https://golang.org/doc/effective_go.html
[4]: https://www.gophercon.com/
[5]: https://tqdev.com/2018-gophercon-2018-videos-online
[6]: https://twitter.com/francesc
[7]: https://www.youtube.com/channel/UC_BzFbxG2za3bp5NRRRXJSw
[8]: https://github.com/moby/moby
[9]: https://github.com/kubernetes/kubernetes
[10]: https://github.com/istio/istio
[11]: https://github.com/containerd/containerd
[12]: https://github.com/coredns/coredns
[13]: https://blog.golang.org/go-fmt-your-code
[14]: https://github.com/fatih/vim-go
[15]: https://code.visualstudio.com/
[16]: https://code.visualstudio.com/docs/languages/go
[17]: https://github.com/derekparker/delve
[18]: https://www.gnu.org/software/gdb/
