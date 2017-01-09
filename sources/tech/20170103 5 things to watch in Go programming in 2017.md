translating---geekpi

5 things to watch in Go programming in 2017
============================================================

### What will innovations like dynamic plugins, serverless Go, and HTTP/2 Push mean for your development this year?

Go 1.8 is due to be released next month and it’s slated to have several new features, including:

*   [HTTP/2 Push][1]
*   [HTTP Server Graceful Shutdown][2]
*   [Plugins][3]
*   [Default GOPATH][4]

Which of these new features will have the most impact probably depends on how you and your development team use Go. Since Go 1.0 released in 2012, its emphasis on simplicity, concurrency, and built-in support has kept its [popularity][9] pointed up and to the right, so the answers to “_What is Go good for?_” keep multiplying.

Here I’ll offer some thoughts on a few things from the upcoming release and elsewhere in the Go world that have caught my eye recently. It’s hardly an exhaustive list, so [let me know][10] what else you think is going to be important in Go for 2017.

### Go’s super deployability + plugins = containers, anyone?

The [1.8 release][11] planned for next month has several folks I’ve talked with wondering how the addition of dynamic plugins — for loading shared libraries with code that wasn’t part of the program when it was compiled — will affect things like containers. Dynamic plugins should make it simpler to use high-concurrency microservices in containers. You’ll be able to easily load plugins as external processes, with all the added benefits of microservices in containers: protecting your main process from crashes and not having anything messing around in your memory space. Dynamic support for plugins should really be a boon for using containers in Go.

_For some expert live Go training, sign up for _[_Go Beyond the Basics_][12]_._

### Cross-platform support will keep pulling in developers

In the 7 years since Go was open-sourced, it has been adopted across the globe. [Daniel Whitenack][13], a data scientist and engineer who maintains the Go kernel for Jupyter, told me he recently [gave a data science and Go training in Siberia][14], (yes, Siberia! And, yes data science and Go — more on that in a bit . . .) and “was amazed to see how vibrant and active the Go community was there.” Another big reason folks will continue to adopt Go for their projects is cross compilation, which, as several Go experts have explained, [got even easier with the 1.5 release][15]. Developers from other languages such as Python should find the ability to build a bundled, ready-to-deploy application for multiple operating systems with no VM on target platforms a key draw for working in Go.

Pair this cross-platform support with projected [15% speed improvements in compile time][16] in the 1.8 release, and you can see why Go is a favorite language for startups.

_Interested in the basics of Go? Check out the _[_Go Fundamentals Learning Path_][17]_ for guidance from O’Reilly experts to get you started._

### A Go interpreter is in the works; goodbye Read-Eval-Print-Loop

Some really smart people are working on a [Go Interpreter][18], and I will definitely be watching this. As many of you know too well, there are several Read-Eval-Print-Loop (REPL) solutions out there that can evaluate expressions and make sure your code works as expected, but these methods often mean tolerating inconvenient caveats, or slogging through several to find the one that fits your use case. A robust, consistent interpreter would be great, and as soon as I hear more, I’ll let you know.

_Working with Go complexities in your development? Watch the _[_Intermediate Go_][19]_ video training from O’Reilly._

### Serverless for Go — what will that look like?

Yes, there’s a lot of hype right now around serverless architecture, a.k.a. function as a service (FaaS). But sometimes where there’s smoke there’s fire, so what’s happening in the Go space around serverless? Could we see a serverless service with native support for Go this year?

AWS Lambda is the most well-known serverless provider, but Google also recently launched [Google Cloud Functions][20]. Both of these FaaS solutions let you run code without managing servers; your code is stored on a cluster of servers managed for you and run only when a triggering event calls it. AWS Lambda currently supports JavaScript, Python, and Java, plus you can launch Go, Ruby, and bash processes. Google Cloud Functions only supports JavaScript, but it seems likely that both Java and Python will soon be supported, too. A lot of IoT devices already make use of a serverless approach, and with Go’s growing adoption by startups, serverless seems a likely spot for growth, so I’m watching what develops to support Go in these serverless solutions.

There are already [several frameworks that have Go support][21] underway for AWS Lambdas:

*   [λ Gordon][5] — Create, wire and deploy AWS Lambdas using CloudFormation
*   [Apex][6] — Build, deploy, and manage AWS Lambda functions
*   [Sparta][7] — A Go framework for AWS Lambda microservices

There’s also an AWS Lambda alternative that supports Go:

*   [Iron.io][8]: Built on top of Docker and Go; language agnostic; supports Golang, Python, Ruby, PHP, and .NET

_For more on serverless architecture, watch Mike Roberts’ keynote from the O’Reilly Software Architecture Conference in San Francisco: _[_An Introduction to Serverless​_][22]_._

### Go for Data — no really!

I hinted at this at the beginning of this article: perhaps surprisingly, a lot of people are using Go for data science and machine learning. There’s some debate about whether this is a good fit, but based on things like the annual Advent Posts for [Gopher Academy for December 2016][23], where you’ll note at least 4 of the 30 posts are on ML or distributed data processing of some kind, it’s happening.

My earlier point about Go’s easy deployability is probably one key reason data scientists are working with Go: they can more easily show their data models to others in a readable and productionable application. Pair this with the broad adoption of Go (as I mentioned earlier, its popularity is pointed up and to the right!), and you have data folks creating applications that “work and play well with others.” Any applications data scientists build in Go will speak the same language as the rest of the company, or at least fit very well with modern architectures.

_For more on Go for data science, Daniel Whitenack has written an excellent overview that explains more about how it’s being used: _[_Data Science Gophers_][24]_._

--------------------------------------------------------------------------------

作者简介：

![](https://cdn-images-1.medium.com/fit/c/60/60/1*MFGykrfk6_HjkJzePBtaMw.png)

Supervising Editor at O’Reilly Media, works with an editorial team that covers a wide variety of programming topics.

--------------------------------------------------------------------------------

via: https://medium.com/@sconant/5-things-to-watch-in-go-programming-in-2017-39cd7a7e58e3#.8t4to5jr1

作者：[Susan Conant][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@sconant?source=footer_card
[1]:https://beta.golang.org/doc/go1.8#h2push
[2]:https://beta.golang.org/doc/go1.8#http_shutdown
[3]:https://beta.golang.org/doc/go1.8#plugin
[4]:https://beta.golang.org/doc/go1.8#gopath
[5]:https://github.com/jorgebastida/gordon
[6]:https://github.com/apex/apex
[7]:http://gosparta.io/
[8]:https://www.iron.io/
[9]:https://github.com/golang/go/wiki/GoUsers
[10]:https://twitter.com/SuConant
[11]:https://beta.golang.org/doc/go1.8
[12]:https://www.safaribooksonline.com/live-training/courses/go-beyond-the-basics/0636920065357/
[13]:https://www.oreilly.com/people/1ea0c-daniel-whitenack
[14]:https://devfest.gdg.org.ru/en/
[15]:https://medium.com/@rakyll/go-1-5-cross-compilation-488092ba44ec#.7s7sxmc4h
[16]:https://beta.golang.org/doc/go1.8#compiler
[17]:http://shop.oreilly.com/category/learning-path/go-fundamentals.do
[18]:https://github.com/go-interpreter
[19]:http://shop.oreilly.com/product/0636920047513.do
[20]:https://cloud.google.com/functions/docs/
[21]:https://github.com/SerifAndSemaphore/go-serverless-list
[22]:https://www.safaribooksonline.com/library/view/oreilly-software-architecture/9781491976142/video288473.html?utm_source=oreilly&utm_medium=newsite&utm_campaign=5-things-to-watch-in-go-programming-body-text-cta
[23]:https://blog.gopheracademy.com/series/advent-2016/
[24]:https://www.oreilly.com/ideas/data-science-gophers
