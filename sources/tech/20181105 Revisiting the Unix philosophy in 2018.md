Translating by Jamkr

Revisiting the Unix philosophy in 2018
======
The old strategy of building small, focused applications is new again in the modern microservices environment.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_data.png?itok=RH6NA32X)

In 1984, Rob Pike and Brian W. Kernighan published an article called "[Program Design in the Unix Environment][1]" in the AT&T Bell Laboratories Technical Journal, in which they argued the Unix philosophy, using the example of BSD's **cat -v** implementation. In a nutshell that philosophy is: Build small, focused programs—in whatever language—that do only one thing but do this thing well, communicate via **stdin** / **stdout** , and are connected through pipes.

Sound familiar?

Yeah, I thought so. That's pretty much the [definition of microservices][2] offered by James Lewis and Martin Fowler:

> In short, the microservice architectural style is an approach to developing a single application as a suite of small services, each running in its own process and communicating with lightweight mechanisms, often an HTTP resource API.

While one *nix program or one microservice may be very limited or not even very interesting on its own, it's the combination of such independently working units that reveals their true benefit and, therefore, their power.

### *nix vs. microservices

The following table compares programs (such as **cat** or **lsof** ) in a *nix environment against programs in a microservices environment.

|                                     | *nix                       | Microservices                       |
| ----------------------------------- | -------------------------- | ----------------------------------- |
| Unit of execution                   | program using stdin/stdout | service with HTTP or gRPC API       |
| Data flow                           | Pipes                      | ?                                   |
| Configuration & parameterization    | Command-line arguments,    |                                     |
| environment variables, config files | JSON/YAML docs             |                                     |
| Discovery                           | Package manager, man, make | DNS, environment variables, OpenAPI |

Let's explore each line in slightly greater detail.

#### Unit of execution

**stdin** and writes output to **stdout**. A microservices setup deals with a service that exposes one or more communication interfaces, such as HTTP or gRPC APIs. In both cases, you'll find stateless examples (essentially a purely functional behavior) and stateful examples, where, in addition to the input, some internal (persisted) state decides what happens.

#### Data flow

The unit of execution in *nix (such as Linux) is an executable file (binary or interpreted script) that, ideally, reads input fromand writes output to. A microservices setup deals with a service that exposes one or more communication interfaces, such as HTTP or gRPC APIs. In both cases, you'll find stateless examples (essentially a purely functional behavior) and stateful examples, where, in addition to the input, some internal (persisted) state decides what happens.

Traditionally, *nix programs could communicate via pipes. In other words, thanks to [Doug McIlroy][3], you don't need to create temporary files to pass around and each can process virtually endless streams of data between processes. To my knowledge, there is nothing comparable to a pipe standardized in microservices, besides my little [Apache Kafka-based experiment from 2017][4].

#### Configuration and parameterization

How do you configure a program or service—either on a permanent or a by-call basis? Well, with *nix programs you essentially have three options: command-line arguments, environment variables, or full-blown config files. In microservices, you typically deal with YAML (or even worse, JSON) documents, defining the layout and configuration of a single microservice as well as dependencies and communication, storage, and runtime settings. Examples include [Kubernetes resource definitions][5], [Nomad job specifications][6], or [Docker Compose][7] files. These may or may not be parameterized; that is, either you have some templating language, such as [Helm][8] in Kubernetes, or you find yourself doing an awful lot of **sed -i** commands.

#### Discovery

How do you know what programs or services are available and how they are supposed to be used? Well, in *nix, you typically have a package manager as well as good old man; between them, they should be able to answer all the questions you might have. In a microservices setup, there's a bit more automation in finding a service. In addition to bespoke approaches like [Airbnb's SmartStack][9] or [Netflix's Eureka][10], there usually are environment variable-based or DNS-based [approaches][11] that allow you to discover services dynamically. Equally important, [OpenAPI][12] provides a de-facto standard for HTTP API documentation and design, and [gRPC][13] does the same for more tightly coupled high-performance cases. Last but not least, take developer experience (DX) into account, starting with writing good [Makefiles][14] and ending with writing your docs with (or in?) [**style**][15].

### Pros and cons

Both *nix and microservices offer a number of challenges and opportunities

#### Composability

It's hard to design something that has a clear, sharp focus and can also play well with others. It's even harder to get it right across different versions and to introduce respective error case handling capabilities. In microservices, this could mean retry logic and timeouts—maybe it's a better option to outsource these features into a service mesh? It's hard, but if you get it right, its reusability can be enormous.

#### Observability

In a monolith (in 2018) or a big program that tries to do it all (in 1984), it's rather straightforward to find the culprit when things go south. But, in a

```
yes | tr \\n x | head -c 450m | grep n
```

or a request path in a microservices setup that involves, say, 20 services, how do you even start to figure out which one is behaving badly? Luckily we have standards, notably [OpenCensus][16] and [OpenTracing][17]. Observability still might be the biggest single blocker if you are looking to move to microservices.

#### Global state

While it may not be such a big issue for *nix programs, in microservices, global state remains something of a discussion. Namely, how to make sure the local (persistent) state is managed effectively and how to make the global state consistent with as little effort as possible.

### Wrapping up

In the end, the question remains: Are you using the right tool for a given task? That is, in the same way a specialized *nix program implementing a range of functions might be the better choice for certain use cases or phases, it might be that a monolith [is the best option][18] for your organization or workload. Regardless, I hope this article helps you see the many, strong parallels between the Unix philosophy and microservices—maybe we can learn something from the former to benefit the latter.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/revisiting-unix-philosophy-2018

作者：[Michael Hausenblas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mhausenblas
[b]: https://github.com/lujun9972
[1]: http://harmful.cat-v.org/cat-v/
[2]: https://martinfowler.com/articles/microservices.html
[3]: https://en.wikipedia.org/wiki/Douglas_McIlroy
[4]: https://speakerdeck.com/mhausenblas/distributed-named-pipes-and-other-inter-services-communication
[5]: http://kubernetesbyexample.com/
[6]: https://www.nomadproject.io/docs/job-specification/index.html
[7]: https://docs.docker.com/compose/overview/
[8]: https://helm.sh/
[9]: https://github.com/airbnb/smartstack-cookbook
[10]: https://github.com/Netflix/eureka
[11]: https://kubernetes.io/docs/concepts/services-networking/service/#discovering-services
[12]: https://www.openapis.org/
[13]: https://grpc.io/
[14]: https://suva.sh/posts/well-documented-makefiles/
[15]: https://www.linux.com/news/improve-your-writing-gnu-style-checkers
[16]: https://opencensus.io/
[17]: https://opentracing.io/
[18]: https://robertnorthard.com/devops-days-well-architected-monoliths-are-okay/
