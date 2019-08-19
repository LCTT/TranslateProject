[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why use GraphQL?)
[#]: via: (https://opensource.com/article/19/6/why-use-graphql)
[#]: author: (Zach Lendon https://opensource.com/users/zachlendon/users/goncasousa/users/patrickhousley)

Why use GraphQL?
======
Here's why GraphQL is gaining ground on standard REST API technology.
![][1]

[GraphQL][2], as I wrote [previously][3], is a next-generation API technology that is transforming both how client applications communicate with backend systems and how backend systems are designed.

As a result of the support that began with the organization that founded it, Facebook, and continues with the backing of other technology giants such as Github, Twitter, and AirBnB, GraphQL's place as a linchpin technology for application systems seems secure; both now and long into the future.

### GraphQL's ascent

The rise in importance of mobile application performance and organizational agility has provided booster rockets for GraphQL's ascent to the top of modern enterprise architectures.

Given that [REST][4] is a wildly popular architectural style that already allows mechanisms for data interaction, what advantages does this new technology provide over [REST][4]? The ‘QL’ in GraphQL stands for query language, and that is a great place to start.

The ease at which different client applications within an organization can query only the data they need with GraphQL usurps alternative REST approaches and delivers real-world application performance boosts. With traditional [REST][4] API endpoints, client applications interrogate a server resource, and receive a response containing all the data that matches the request. If a successful response from a [REST][4] API endpoint returns 35 fields, the client application receives 35 fields

### Fetching problems

[REST][4] APIs traditionally provide no clean way for client applications to retrieve or update only the data they care about. This is often described as the “over-fetching” problem. With the prevalence of mobile applications in people’s day to day lives, the over-fetching problem has real world consequences. Every request a mobile application needs to make, every byte it has to send and receive, has an increasingly negative performance impact for end users. Users with slower data connections are particularly affected by suboptimal API design choices. Customers who experience poor performance using mobile applications are more likely to not purchase products and use services. Inefficient API designs cost companies money.

“Over-fetching” isn’t alone - it has a partner in crime - “under-fetching”. Endpoints that, by default, return only a portion of the data a client actually needs require clients to make additional calls to satisfy their data needs - which requires additional HTTP requests. Because of the over and under fetching problems and their impact on client application performance, an API technology that facilitates efficient fetching has a chance to catch fire in the marketplace - and GraphQL has boldly jumped in and filled that void.

### REST's response

[REST][4] API designers, not willing to go down without a fight, have attempted to counter the mobile application performance problem through a mix of:

  * “include” and “exclude” query parameters, allowing client applications to specify which fields they want through a potentially long query format.
  * “Composite” services, which combine multiple endpoints in a way that allow client applications to be more efficient in the number of requests they make and the data they receive.



While these patterns are a valiant attempt by the [REST][4] API community to address challenges mobile clients face, they fall short in a few key regards, namely:

  * Include and exclude query key/value pairs quickly get messy, in particular for deeper object graphs that require a nested dot notation syntax (or similar) to target data to include and exclude. Additionally, debugging issues with the query string in this model often requires manually breaking up a URL.
  * Server implementations for include and exclude queries are often custom, as there is no standard way for server-based applications to handle the use of include and exclude queries, just as there is no standard way for include and exclude queries to be defined.
  * The rise of composite services creates more tightly coupled back-end and front-end systems, requiring increasing coordination to deliver projects and turning once agile projects back to waterfall. This coordination and coupling has the painful side effect of slowing organizational agility. Additionally, composite services are by definition, not RESTful.



### GraphQL's genesis

For Facebook, GraphQL’s genesis was a response to pain felt and experiences learned from an HTML5-based version of their flagship mobile application back in 2011-2012. Understanding that improved performance was paramount, Facebook engineers realized that they needed a new API design to ensure peak performance. Likely taking the above [REST][4] limitations into consideration, and with needing to support different needs of a number of API clients, one can begin to understand the early seeds of what led co-creators Lee Byron and Dan Schaeffer, Facebook employees at the time, to create what has become known as GraphQL.

With what is often a single GraphQL endpoint, through the GraphQL query language, client applications are able to reduce, often significantly, the number of network calls they need to make, and ensure that they only are retrieving the data they need. In many ways, this harkens back to earlier models of web programming, where client application code would directly query back-end systems - some might remember writing SQL queries with JSTL on JSPs 10-15 years ago for example!

The biggest difference now is with GraphQL, we have a specification that is implemented across a variety of client and server languages and libraries. And with GraphQL being an API technology, we have decoupled the back-end and front-end application systems by introducing an intermediary GraphQL application layer that provides a mechanism to access organizational data in a manner that aligns with an organization’s business domain(s).

Beyond solving technical challenges experienced by software engineering teams, GraphQL has also been a boost to organizational agility, in particular in the enterprise. GraphQL-enabled organizational agility increases are commonly attributable to the following:

  * Rather than creating new endpoints when 1 or more new fields are needed by clients, GraphQL API designers and developers are able to include those fields in existing graph implementations, exposing new capabilities in a fashion that requires less development effort and less change across application systems.
  * By encouraging API design teams to focus more on defining their object graph and be less focused on what client applications are delivering, the speed at which front-end and back-end software teams deliver solutions for customers has increasingly decoupled.



### Considerations before adoption

Despite GraphQL’s compelling benefits, GraphQL is not without its implementation challenges. A few examples include:

  * Caching mechanisms around [REST][4] APIs are much more mature.
  * The patterns used to build APIs using [REST][4] are much more well established.
  * While engineers may be more attracted to newer technologies like GraphQL, the talent pool in the marketplace is much broader for building [REST][4]-based solutions vs. GraphQL.



### Conclusion

By providing both a boost to performance and organizational agility, GraphQL's adoption by companies has skyrocketed in the past few years. It does, however, have some maturing to do in comparison to the RESTful ecosystem of API design.

One of the great benefits of GraphQL is that it’s not designed as a wholesale replacement for alternative API solutions. Instead, GraphQL can be implemented to complement or enhance existing APIs. As a result, companies are encouraged to explore incrementally adopting GraphQL where it makes the most sense for them - where they find it has the greatest positive impact on application performance and organizational agility.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/why-use-graphql

作者：[Zach Lendon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/zachlendon/users/goncasousa/users/patrickhousley
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_graph_stats_blue.png?itok=OKCc_60D
[2]: https://graphql.org/
[3]: https://opensource.com/article/19/6/what-is-graphql
[4]: https://en.wikipedia.org/wiki/Representational_state_transfer
