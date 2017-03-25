[One Year Using Go][18]
============================================================

 ![](https://bugfender.com/wp-content/uploads/2017/03/one-year-using-go-social-1.jpg) 

Our ventures into [Go][5] all started as an internal experiment at [Mobile Jazz][6]. As the company name hints, we develop mobile apps.

After releasing an app into the wild, we soon realised we were missing a tool to check what was actually happening to users and how they were interacting with the app – something that would have been very handy in the case of any issues or bugs being reported.

There were a couple of tools around which claimed to help developers in this area, but none of them quite hit the mark, so we decided to build our own. We started by creating a basic set of scripts that quickly evolved into a fully-fledged tool known today as [Bugfender][7]!

As this was initially an experiment, we decided to try out a new trending technology. A love of learning and continual education is a key aspect of Mobile Jazz’s core values, so we decided to build it using Go; a relatively new programming language developed by Google. It’s a new player in the game and there have been many respected developers saying great things about it.

One year later and the experiment has turned into a startup, we’ve got an incredible tool that’s already helping thousands of developers all over the world. Our servers are processing over 200GB of data everyday incoming from more than 7 million devices.

After using Go for a year, we’d like to share some of our thoughts and experiences from taking our small experiment to a production server handling millions and millions of logs.

### Go Ecosystem

No one in the company had any previous experience using Go. Bugfender was our first dive into the language.

Learning the basics was pretty straight forward. Our previous experiences with C/C++/Java/Objective-C/PHP enabled us to learn Go quickly and get developing in days. There were, of course, a few new and unusual things to learn, including GOPATH and how to deal with packages, but that was expected.

Within a few days, we realized that even being a simplified language by design, Go was extremely powerful. It was able to do everything a modern programming language should: being able to work with JSON, communicate between servers and even access databases with no problems (and with just a few lines of code at that).

When building a server, you should first decide if you’re going to use any third party libraries or frameworks. For Bugfender, we decided to use:

### Martini

[Martini][8] is a powerful web framework for Go. At the time we started the experiment, it was a great solution and to this day, we haven’t experienced any problems with it. However if we were to start this experiment again today, we would choose a different framework as Martini is no longer maintained.

We’ve further experimented with [Iris][9] (our current favorite) and [Gin][10]. Gin is the successor to Martini and migrating to this will enable us to reuse our existing code.

In the past year, we’ve realized that Go’s standard libraries are really powerful and that you don’t really need to rely on a heavy web framework to build a server. It is better to use high-performance libraries that specialize in specific tasks.

~~Iris is our current ~~favourite~~ and in the future, we’ll re-write our servers to use it instead of Martini/Gin, but it’s not a priority right now.~~

**Edit:** After some discussions about Iris in differents places, we realized that Iris might not be the best option. If we ever decide to re-write our web components, we might look into other options, we are open to suggestions.

### Gorm

Some people are fans of ORM and others are not. We decided to use ORM and more specifically, [GORM][11]. Our implementation was for the web frontend only, keeping it optimized with hand-written SQL for the log ingestion API. In the beginning, we were really happy, but as time progresses, we’ve started to find problems and we are soon going to remove it completely from our code and use a lower level approach using a standard SQL library with [sqlx][12].

One of the main problems with GORM is Go’s ecosystem. As a new language, there have been many new versions since we started developing the product. Some changes in these new releases are not backwards compatible and so, to use the newest library versions we are frequently rewriting existing code and checking hacks we may have created to solve version issues.

These two libraries are the main building blocks of almost any web server, so it’s important to make a good choice because it can be difficult to change later and will affect your server performance.

### Third-Party Services

Another important area to consider when creating a real world product is the availability of libraries, third-party services and tools. Here, Go is still lacking maturity, most companies don’t yet provide a Go library, so you may need to rely on libraries written by other people where quality isn’t always guaranteed.

For example, there are great libraries for using [Redis][13] and [ElasticSearch][14], but libraries for other services such as Mixpanel or Stripe are not so good.

Our recommendation before using Go is to check beforehand if there’s a good library available for any specific products you may need.

We’ve also experienced a lot of problems with Go’s package management system. The way it handles versions is far from optimal and over the past year, we have run into various problems getting different versions of the same library between different team members. Recently, however, this problem has been almost solved thanks to the new Go feature that supports vendor packages, alongside the [gopkg.in][15] service.

### Developer Tools

 ![](https://bugfender.com/wp-content/uploads/2017/03/go-ide.jpg) 

As Go is a relatively new language, you might find the developer tools available are not so great when compared to other established languages like Java. When we started Bugfender it was really hard to use any IDE, none seemed to support Go. But in this last year, this has improved a lot with the introduction of [IntelliJ][16] and [Visual Studio Code Go][17] plugins.

Finally looking at other Go tools, the debugger is not-so-great and the profiler is even worse, so debugging your code or trying to optimize it can be hard at times.

### Heading for Production

This is definitely one of the best things about Go, if you want to deploy something to production you just need to build your binary and send it to the server, no dependencies, no need to install extra software, you only need to be able to run a binary file in your server.

If you’re used to dealing with other languages where you require a package manager or need to be careful with a language interpreter you may use, Go is a pleasure to work with.

We are also really happy with Go’s stability as the servers never seem to crash. We faced a problem some time ago sending big amounts of data to Go Routines but since then we’ve rarely seen any crashes. Note: if you need to send a lot of data to a Go Routine, you’ll need to be careful as you can have a heap overflow.

If you’re interested in performance, we cannot compare to other languages as we have started with Go from scratch, but given the amount of data we process, we feel it’s performance is very good, we definitely wouldn’t be able to process the same number of requests using PHP so easily.

### Conclusions

Over the year we’ve had our ups and downs regarding Go. At the beginning we were excited, but after the experiment converted to a real product we started unveiling problems. We’ve thought several times about a complete rewrite in Java, but here we are, still working with Go, and in this past year the ecosystem has had some great improvements that simplified our work.

If you want to build your product using Go, you can be sure it will work, but you need to be really careful with one thing: the availability of developers to hire. There are only a few senior Go developers in Silicon Valley, and finding one elsewhere can be a very difficult task.


--------------------------------------------------------------------------------

via: https://bugfender.com/one-year-using-go

作者：[ALEIX VENTAYOL][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bugfender.com/author/aleixventayol
[1]:https://bugfender.com/#facebook
[2]:https://bugfender.com/#twitter
[3]:https://bugfender.com/#google_plus
[4]:https://www.addtoany.com/share#url=https%3A%2F%2Fbugfender.com%2Fone-year-using-go&title=One%20Year%20Using%20Go
[5]:https://golang.org/
[6]:http://mobilejazz.com/
[7]:https://www.bugfender.com/
[8]:https://github.com/go-martini/martini
[9]:https://github.com/kataras/iris
[10]:https://github.com/gin-gonic/gin
[11]:https://github.com/jinzhu/gorm
[12]:https://github.com/jmoiron/sqlx
[13]:https://github.com/go-redis/redis
[14]:https://github.com/olivere/elastic
[15]:http://labix.org/gopkg.in
[16]:https://plugins.jetbrains.com/plugin/5047-go
[17]:https://github.com/Microsoft/vscode-go
[18]:https://bugfender.com/one-year-using-go
