[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is GraphQL?)
[#]: via: (https://opensource.com/article/19/6/what-is-graphql)
[#]: author: (Zach Lendon https://opensource.com/users/zachlendon)

What is GraphQL?
======
GraphQL is a query language, an execution engine, and a specification,
and it's leading developers to rethink how they build client and API
applications.
![Analytics: Charts and Graphs][1]

GraphQL is one of the biggest buzzwords in software tech today. But _what is it_ _actually_? Is it a query language like [SQL][2]? An execution engine like the [JVM][3]? A specification like [XML][4]?

If you answered all of the above, you are correct! [GraphQL][5] is a query language syntax, a programming language-agnostic execution engine, and a continuously evolving specification.

Let's dive into how GraphQL can be all of these things and get a glimpse of why people are excited about it.

### Query language

GraphQL as a query language seems reasonable—"QL" seemed important enough to be in the name, after all. But what are we querying? It probably helps to look at a sample query request and the corresponding response.

The following user query:


```
{
 user(id: 4) {
   name
   email
   phoneNumber
 }
}
```

might return the following JSON response:


```
{
 "user": {
   "name": "Zach Lendon"
   “email”: “[zach@hydrate.io][6]”
   “phoneNumber”: “867-5309”
 }
}
```

Imagine a client application querying for user details, taking the result, and using it to populate a profile screen. As a query language, one of GraphQL's core benefits is that a client application can request _only the data it needs_ and expect it to be returned in a consistent manner.

_What_ is returning the GraphQL response, though? This is where the execution engine, typically in the form of a GraphQL server, comes into play.

### Execution engine

![GraphQL execution engine][7]

The GraphQL execution engine is what is responsible for processing a GraphQL query and returning a JSON response. All GraphQL servers are made up of two core components that define the structure and behavior of the execution engine: a schema and resolvers, respectively.

A GraphQL schema is a custom typed language that exposes which queries are both permitted (valid) and handled by a GraphQL server implementation. The schema for our user example query above might look like:


```
type User {
        name: String
        email: String
        phoneNumber: String
}

type Query {
        user: User
}
```

This schema defines a user query that returns a user. Clients can request any of the fields on a user via the user query, and the GraphQL server will return only those fields in its response. By using the strongly typed schema, a GraphQL server can validate incoming queries to ensure they are valid based on the defined schema.

Once a query is determined to be valid, it is processed by a GraphQL server by resolvers. A resolver function backs each field of each GraphQL type. An example resolver for our user query might look like:


```
Query: {
  user(obj, args, context, info) {
    return context.db.loadUserById(args.id).then(
      userData =&gt; new User(userData)
    )
  }
}
```

While the above example is in JavaScript, GraphQL servers can be written in any number of languages. This is due to the fact that GraphQL is _also_ a specification!

### Specification

The GraphQL specification defines the capabilities and characteristics that GraphQL implementations must follow. As an open specification available under the Open Web Foundation Final Specification Agreement ([OWFa 1.0][8]), the technology community has the opportunity to both review what a GraphQL implementation must do to be spec-compliant and help craft the future of the language.

While the specification is very specific about GraphQL's syntax, what is a valid query, and how a schema works, it provides no direction on how to store data or what implementation programming languages GraphQL servers should use. This is incredibly powerful and relatively unique in the software space—it allows GraphQL servers to be created in any number of programming languages, and clients will know exactly how they function since they are spec-compliant. And GraphQL server implementations have been created across many programming languages, not just ones folks might expect like JavaScript, Java, and C#, but languages like Go, Elixir, and Haskell. The language a server is implemented in will not be a barrier to adoption—not only are there implementations in many languages, but they are all open source. If there isn't an implementation in your language of choice, you are free to create your own.

### Conclusion

GraphQL is an exciting, relatively new entrant into the open source API space. It couples a query language and execution engine with an open source specification that defines how GraphQL implementations should look and function.

GraphQL has already started to change how companies think about building both client and API applications. With GraphQL as part of a technology stack, front-end developers are freed to query for the data they want, and back-end developers can decouple client application needs from their back-end system architectures. Often companies journey into GraphQL by first building a GraphQL API "layer" that sits on top of their existing back-end services. This allows the client applications to begin to gain the performance and operational efficiencies they seek, while allowing the back-end teams an opportunity to determine what, if any, changes they might want to make "under the hood," behind their GraphQL layer. Often, those changes will be geared towards optimizations that will help ensure that applications using GraphQL can operate as performantly as possible. Because of the abstraction GraphQL provides, systems teams can make those changes while continuing to honor the GraphQL "contract" at their GraphQL API level.

Because GraphQL is relatively new, developers are still finding new and exciting ways to leverage it to build better software solutions. How will GraphQL change how you build applications, and does it live up to the hype? There's only one way to find out—go out there and build something with GraphQL!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/what-is-graphql

作者：[Zach Lendon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/zachlendon
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/analytics-graphs-charts.png?itok=sersoqbV (Analytics: Charts and Graphs)
[2]: https://opensource.com/article/18/2/getting-started-sql
[3]: https://www.cubrid.org/blog/understanding-jvm-internals/
[4]: https://www.w3.org/TR/xml/
[5]: http://graphql.org/
[6]: mailto:zach@hydrate.io
[7]: https://opensource.com/sites/default/files/pictures/graphql-execution-engine.png (GraphQL execution engine)
[8]: http://www.openwebfoundation.org/legal/the-owf-1-0-agreements/owfa-1-0---patent-only
