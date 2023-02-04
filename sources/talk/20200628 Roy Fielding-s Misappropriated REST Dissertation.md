[#]: collector: (lujun9972)
[#]: translator: (CanYellow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Roy Fielding's Misappropriated REST Dissertation)
[#]: via: (https://twobithistory.org/2020/06/28/rest.html)
[#]: author: (Two-Bit History https://twobithistory.org)

Roy Fielding's Misappropriated REST Dissertation
======

RESTful APIs are everywhere. This is funny, because how many people really know what “RESTful” is supposed to mean?

I think most of us can empathize with [this Hacker News poster][1]:

> I’ve read several articles about REST, even a bit of the original paper. But I still have quite a vague idea about what it is. I’m beginning to think that nobody knows, that it’s simply a very poorly defined concept.

I had planned to write a blog post exploring how REST came to be such a dominant paradigm for communication across the internet. I started my research by reading [Roy Fielding’s 2000 dissertation][2], which introduced REST to the world. After reading Fielding’s dissertation, I realized that the much more interesting story here is how Fielding’s ideas came to be so widely misunderstood.

Many more people know that Fielding’s dissertation is where REST came from than have read the dissertation (fair enough), so misconceptions about what the dissertation actually contains are pervasive.

The biggest of these misconceptions is that the dissertation directly addresses the problem of building APIs. I had always assumed, as I imagine many people do, that REST was intended from the get-go as an architectural model for web APIs built on top of HTTP. I thought perhaps that there had been some chaotic experimental period where people were building APIs on top of HTTP all wrong, and then Fielding came along and presented REST as the sane way to do things. But the timeline doesn’t make sense here: APIs for web services, in the sense that we know them today, weren’t a thing until a few years after Fielding published his dissertation.

Fielding’s dissertation (titled “Architectural Styles and the Design of Network-based Software Architectures”) is not about how to build APIs on top of HTTP but rather about HTTP itself. Fielding contributed to the HTTP/1.0 specification and co-authored the HTTP/1.1 specification, which was published in 1999. He was interested in the architectural lessons that could be drawn from the design of the HTTP protocol; his dissertation presents REST as a distillation of the architectural principles that guided the standardization process for HTTP/1.1. Fielding used these principles to make decisions about which proposals to incorporate into HTTP/1.1. For example, he rejected a proposal to batch requests using new `MGET` and `MHEAD` methods because he felt the proposal violated the constraints prescribed by REST, especially the constraint that messages in a REST system should be easy to proxy and cache.[1][3] So HTTP/1.1 was instead designed around persistent connections over which multiple HTTP requests can be sent. (Fielding also felt that cookies are not RESTful because they add state to what should be a stateless system, but their usage was already entrenched.[2][4]) REST, for Fielding, was not a guide to building HTTP-based systems but a guide to extending HTTP.

This isn’t to say that Fielding doesn’t think REST could be used to build other systems. It’s just that he assumes these other systems will also be “distributed hypermedia systems.” This is another misconception people have about REST: that it is a general architecture you can use for any kind of networked application. But you could sum up the part of the dissertation where Fielding introduces REST as, essentially, “Listen, we just designed HTTP, so if you also find yourself designing a _distributed hypermedia system_ you should use this cool architecture we worked out called REST to make things easier.” It’s not obvious why Fielding thinks anyone would ever attempt to build such a thing given that the web already exists; perhaps in 2000 it seemed like there was room for more than one distributed hypermedia system in the world. Anyway, Fielding makes clear that REST is intended as a solution for the scalability and consistency problems that arise when trying to connect hypermedia across the internet, _not_ as an architectural model for distributed applications in general.

We remember Fielding’s dissertation now as the dissertation that introduced REST, but really the dissertation is about how much one-size-fits-all software architectures suck, and how you can better pick a software architecture appropriate for your needs. Only a single chapter of the dissertation is devoted to REST itself; much of the word count is spent on a taxonomy of alternative architectural styles[3][5] that one could use for networked applications. Among these is the Pipe-and-Filter (PF) style, inspired by Unix pipes, along with various refinements of the Client-Server style (CS), such as Layered-Client-Server (LCS), Client-Cache-Stateless-Server (C$SS), and Layered-Client-Cache-Stateless-Server (LC$SS). The acronyms get unwieldy but Fielding’s point is that you can mix and match constraints imposed by existing styles to derive new styles. REST gets derived this way and could instead have been called—but for obvious reasons was not—Uniform-Layered-Code-on-Demand-Client-Cache-Stateless-Server (ULCODC$SS). Fielding establishes this taxonomy to emphasize that different constraints are appropriate for different applications and that this last group of constraints were the ones he felt worked best for HTTP.

This is the deep, deep irony of REST’s ubiquity today. REST gets blindly used for all sorts of networked applications now, but Fielding originally offered REST as an illustration of how to derive a software architecture tailored to an individual application’s particular needs.

I struggle to understand how this happened, because Fielding is so explicit about the pitfalls of not letting form follow function. He warns, almost at the very beginning of the dissertation, that “design-by-buzzword is a common occurrence” brought on by a failure to properly appreciate software architecture.[4][6] He picks up this theme again several pages later:

> Some architectural styles are often portrayed as “silver bullet” solutions for all forms of software. However, a good designer should select a style that matches the needs of a particular problem being solved.[5][7]

REST itself is an especially poor “silver bullet” solution, because, as Fielding later points out, it incorporates trade-offs that may not be appropriate unless you are building a distributed hypermedia application:

> REST is designed to be efficient for large-grain hypermedia data transfer, optimizing for the common case of the Web, but resulting in an interface that is not optimal for other forms of architectural interaction.[6][8]

Fielding came up with REST because the web posed a thorny problem of “anarchic scalability,” by which Fielding means the need to connect documents in a performant way across organizational and national boundaries. The constraints that REST imposes were carefully chosen to solve this anarchic scalability problem. Web service APIs that are _public-facing_ have to deal with a similar problem, so one can see why REST is relevant there. Yet today it would not be at all surprising to find that an engineering team has built a backend using REST even though the backend only talks to clients that the engineering team has full control over. We have all become the architect in [this Monty Python sketch][9], who designs an apartment building in the style of a slaughterhouse because slaughterhouses are the only thing he has experience building. (Fielding uses a line from this sketch as an epigraph for his dissertation: “Excuse me… did you say ‘knives’?”)

So, given that Fielding’s dissertation was all about avoiding silver bullet software architectures, how did REST become a de facto standard for web services of every kind?

My theory is that, in the mid-2000s, the people who were sick of SOAP and wanted to do something else needed their own four-letter acronym.

I’m only half-joking here. SOAP, or the Simple Object Access Protocol, is a verbose and complicated protocol that you cannot use without first understanding a bunch of interrelated XML specifications. Early web services offered APIs based on SOAP, but, as more and more APIs started being offered in the mid-2000s, software developers burned by SOAP’s complexity migrated away en masse.

Among this crowd, SOAP inspired contempt. Ruby-on-Rails dropped SOAP support in 2007, leading to this emblematic comment from Rails creator David Heinemeier Hansson: “We feel that SOAP is overly complicated. It’s been taken over by the enterprise people, and when that happens, usually nothing good comes of it.”[7][10] The “enterprise people” wanted everything to be formally specified, but the get-shit-done crowd saw that as a waste of time.

If the get-shit-done crowd wasn’t going to use SOAP, they still needed some standard way of doing things. Since everyone was using HTTP, and since everyone would keep using HTTP at least as a transport layer because of all the proxying and caching support, the simplest possible thing to do was just rely on HTTP’s existing semantics. So that’s what they did. They could have called their approach Fuck It, Overload HTTP (FIOH), and that would have been an accurate name, as anyone who has ever tried to decide what HTTP status code to return for a business logic error can attest. But that would have seemed recklessly blasé next to all the formal specification work that went into SOAP.

Luckily, there was this dissertation out there, written by a co-author of the HTTP/1.1 specification, that had something vaguely to do with extending HTTP and could offer FIOH a veneer of academic respectability. So REST was appropriated to give cover for what was really just FIOH.

I’m not saying that this is exactly how things happened, or that there was an actual conspiracy among irreverent startup types to misappropriate REST, but this story helps me understand how REST became a model for web service APIs when Fielding’s dissertation isn’t about web service APIs at all. Adopting REST’s constraints makes some sense, especially for public-facing APIs that do cross organizational boundaries and thus benefit from REST’s “uniform interface.” That link must have been the kernel of why REST first got mentioned in connection with building APIs on the web. But imagining a separate approach called “FIOH,” that borrowed the “REST” name partly just for marketing reasons, helps me account for the many disparities between what today we know as RESTful APIs and the REST architectural style that Fielding originally described.

REST purists often complain, for example, that so-called REST APIs aren’t actually REST APIs because they do not use Hypermedia as The Engine of Application State (HATEOAS). Fielding himself [has made this criticism][11]. According to him, a real REST API is supposed to allow you to navigate all its endpoints from a base endpoint by following links. If you think that people are actually out there trying to build REST APIs, then this is a glaring omission—HATEOAS really is fundamental to Fielding’s original conception of REST, especially considering that the “state transfer” in “Representational State Transfer” refers to navigating a state machine using hyperlinks between resources (and not, as many people seem to believe, to transferring resource state over the wire).[8][12] But if you imagine that everyone is just building FIOH APIs and advertising them, with a nudge and a wink, as REST APIs, or slightly more honestly as “RESTful” APIs, then of course HATEOAS is unimportant.

Similarly, you might be surprised to know that there is nothing in Fielding’s dissertation about which HTTP verb should map to which CRUD action, even though software developers like to argue endlessly about whether using PUT or PATCH to update a resource is more RESTful. Having a standard mapping of HTTP verbs to CRUD actions is a useful thing, but this standard mapping is part of FIOH and not part of REST.

This is why, rather than saying that nobody understands REST, we should just think of the term “REST” as having been misappropriated. The modern notion of a REST API has historical links to Fielding’s REST architecture, but really the two things are separate. The historical link is good to keep in mind as a guide for when to build a RESTful API. Does your API cross organizational and national boundaries the same way that HTTP needs to? Then building a RESTful API with a predictable, uniform interface might be the right approach. If not, it’s good to remember that Fielding favored having form follow function. Maybe something like GraphQL or even just JSON-RPC would be a better fit for what you are trying to accomplish.

_If you enjoyed this post, more like it come out every four weeks! Follow [@TwoBitHistory][13] on Twitter or subscribe to the [RSS feed][14] to make sure you know when a new post is out._

_Previously on TwoBitHistory…_

> New post is up! I wrote about how to solve differential equations using an analog computer from the '30s mostly made out of gears. As a bonus there's even some stuff in here about how to aim very large artillery pieces.<https://t.co/fwswXymgZa>
>
> — TwoBitHistory (@TwoBitHistory) [April 6, 2020][15]

  1. Roy Fielding. “Architectural Styles and the Design of Network-based Software Architectures,” 128. 2000. University of California, Irvine, PhD Dissertation, accessed June 28, 2020, <https://www.ics.uci.edu/~fielding/pubs/dissertation/fielding_dissertation_2up.pdf>. [↩︎][16]

  2. Fielding, 130. [↩︎][17]

  3. Fielding distinguishes between software architectures and software architecture “styles.” REST is an architectural style that has an instantiation in the architecture of HTTP. [↩︎][18]

  4. Fielding, 2. [↩︎][19]

  5. Fielding, 15. [↩︎][20]

  6. Fielding, 82. [↩︎][21]

  7. Paul Krill. “Ruby on Rails 2.0 released for Web Apps,” InfoWorld. Dec 7, 2007, accessed June 28, 2020, <https://www.infoworld.com/article/2648925/ruby-on-rails-2-0-released-for-web-apps.html> [↩︎][22]

  8. Fielding, 109. [↩︎][23]




--------------------------------------------------------------------------------

via: https://twobithistory.org/2020/06/28/rest.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://news.ycombinator.com/item?id=7201871
[2]: https://www.ics.uci.edu/~fielding/pubs/dissertation/fielding_dissertation_2up.pdf
[3]: tmp.Ewi4FpMIg6#fn:1
[4]: tmp.Ewi4FpMIg6#fn:2
[5]: tmp.Ewi4FpMIg6#fn:3
[6]: tmp.Ewi4FpMIg6#fn:4
[7]: tmp.Ewi4FpMIg6#fn:5
[8]: tmp.Ewi4FpMIg6#fn:6
[9]: https://www.youtube.com/watch?v=vNoPJqm3DAY
[10]: tmp.Ewi4FpMIg6#fn:7
[11]: https://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven
[12]: tmp.Ewi4FpMIg6#fn:8
[13]: https://twitter.com/TwoBitHistory
[14]: https://twobithistory.org/feed.xml
[15]: https://twitter.com/TwoBitHistory/status/1247187881946275841?ref_src=twsrc%5Etfw
[16]: tmp.Ewi4FpMIg6#fnref:1
[17]: tmp.Ewi4FpMIg6#fnref:2
[18]: tmp.Ewi4FpMIg6#fnref:3
[19]: tmp.Ewi4FpMIg6#fnref:4
[20]: tmp.Ewi4FpMIg6#fnref:5
[21]: tmp.Ewi4FpMIg6#fnref:6
[22]: tmp.Ewi4FpMIg6#fnref:7
[23]: tmp.Ewi4FpMIg6#fnref:8
