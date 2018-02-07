translating---geekpi

What is the deal with GraphQL?
======

![](https://ryanmccue.ca/content/images/2018/01/Copy-of-Copy-of-Copy-of-Copy-of-Copy-of-Copy-of-Electric-Love.png)

There has been lots of talks lately about this thing called [GraphQL][1]. It is a relatively new technology coming out of Facebook and is starting to be widely adopted by large companies like [Github][2], Facebook, Twitter, Yelp, and many others. Basically, GraphQL is an alternative to REST, it replaces many dumb endpoints, `/user/1`, `/user/1/comments` with `/graphql` and you use the post body or query string to request the data you need, like, `/graphql?query={user(id:1){id,username,comments{text}}}`. You pick the pieces of data you need and can nest down to relations to avoid multiple calls. This is a different way of thinking about a backend, but in some situations, it makes practical sense.

### My Experience with GraphQL

Originally when I heard about it I was very skeptical, after dabbling in [Apollo Server][3] I was not convinced. Why would you use some silly new technology when you can simply build REST endpoints! But after digging deeper and learning more about its use cases, I came around. I still think REST has a place and will be important for the foreseeable future, but with how bad many APIs and their documentation are, this can be a breath of fresh air...

### Why Use GraphQL Over REST?

Although I have used GraphQL, and think it is a compelling and exciting technology, I believe it does not replace REST. That being said there are compelling reasons to pick GraphQL over REST in some situations. When you are building mobile apps or web apps which are made with high mobile traffic in mind GraphQL really shines. The reason for this is mobile data. REST uses many calls and often returns unused data whereas, with GraphQL, you can define precisely what you want to be returned for minimal data usage.

You can get do all the above with REST by making multiple endpoints available, but that also adds complexity to the project. It also means there will be back and forth between the front and backend teams.

### What Should You Use?

GraphQL is a new technology which is now mainstream. But many developers are not aware of it or choose not to learn it because they think it's a fad. I feel like for most projects you can get away using either REST or GraphQL. Developing using GraphQL has great benefits like enforcing documentation, which helps teams work better together, and provides clear expectations for each query. This will likely speed up development after the initial hurdle of wrapping your head around GraphQL.

Although I have been comparing GraphQL and REST, I think in most cases a mixture of the two will produce the best results. Combine the strengths of both instead of seeing it strightly as just using GraphQL or just using REST.

### Final Thoughts

Both technologies are here to stay. And done right both technologies can make fast and efficient backends. GraphQL has an edge up because it allows the client to query only the data they need by default, but that is at a potential sacrifice of endpoint speed. Ultimately, if I were starting a new project, I would go with a mix of both GraphQL and REST.

--------------------------------------------------------------------------------

via: https://ryanmccue.ca/what-is-the-deal-with-graphql/

作者：[Ryan McCue][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://ryanmccue.ca/author/ryan/
[1]:http://graphql.org/
[2]:https://developer.github.com/v4/
[3]:https://github.com/apollographql/apollo-server
