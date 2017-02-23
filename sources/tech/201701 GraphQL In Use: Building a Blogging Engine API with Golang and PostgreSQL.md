GraphQL In Use: Building a Blogging Engine API with Golang and PostgreSQL
============================================================

### Abstract

GraphQL appears hard to use in production: the graph interface is flexible in its modeling capabilities but is a poor match for relational storage, both in terms of implementation and performance.

In this document, we will design and write a simple blogging engine API, with the following specification:

*   three types of resources (users, posts and comments) supporting a varied set of functionality (create a user, create a post, add a comment to a post, follow posts and comments from another user, etc.)
*   use PostgreSQL as the backing data store (chosen because it’s a popular relational DB)
*   write the API implementation in Golang (a popular language for writing APIs).

We will compare a simple GraphQL implementation with a pure REST alternative in terms of implementation complexity and efficiency for a common scenario: rendering a blog post page.

### Introduction

GraphQL is an IDL (Interface Definition Language), designers define data types and model information as a graph. Each vertex is an instance of a data type, while edges represent relationships between nodes. This approach is flexible and can accommodate any business domain. However, the problem is that the design process is more complex and traditional data stores don’t map well to the graph model. See _Appendix 1_ for more details on this topic.

GraphQL has been first proposed in 2014 by the Facebook Engineering Team. Although interesting and compelling in its advantages and features, it hasn’t seen mass adoption. Developers have to trade REST’s simplicity of design, familiarity and rich tooling for GraphQL’s flexibility of not being limited to just CRUD and network efficiency (it optimizes for round-trips to the server).

Most walkthroughs and tutorials on GraphQL avoid the problem of fetching data from the data store to resolve queries. That is, how to design a database using general-purpose, popular storage solutions (like relational databases) to support efficient data retrieval for a GraphQL API.

This document goes through building a blog engine GraphQL API. It is moderately complex in its functionality. It is scoped to a familiar business domain to facilitate comparisons with a REST based approach.

The structure of this document is the following:

*   in the first part we will design a GraphQL schema and explain some of features of the language that are used.
*   next is the design of the PostgreSQL database in section two.
*   part three covers the Golang implementation of the GraphQL schema designed in part one.
*   in part four we compare the task of rendering a blog post page from the perspective of fetching the needed data from the backend.

### Related

*   The excellent [GraphQL introduction document][1].
*   The complete and working code for this project is on [github.com/topliceanu/graphql-go-example][2].

### Modeling a blog engine in GraphQL

_Listing 1_ contains the entire schema for the blog engine API. It shows the data types of the vertices composing the graph. The relationships between vertices, ie. the edges, are modeled as attributes of a given type.

```
type User {
  id: ID
  email: String!
  post(id: ID!): Post
  posts: [Post!]!
  follower(id: ID!): User
  followers: [User!]!
  followee(id: ID!): User
  followees: [User!]!
}

type Post {
  id: ID
  user: User!
  title: String!
  body: String!
  comment(id: ID!): Comment
  comments: [Comment!]!
}

type Comment {
  id: ID
  user: User!
  post: Post!
  title: String
  body: String!
}

type Query {
  user(id: ID!): User
}

type Mutation {
  createUser(email: String!): User
  removeUser(id: ID!): Boolean
  follow(follower: ID!, followee: ID!): Boolean
  unfollow(follower: ID!, followee: ID!): Boolean
  createPost(user: ID!, title: String!, body: String!): Post
  removePost(id: ID!): Boolean
  createComment(user: ID!, post: ID!, title: String!, body: String!): Comment
  removeComment(id: ID!): Boolean
}
```

_Listing 1_

The schema is written in the GraphQL DSL, which is used for defining custom data types, such as `User`, `Post` and `Comment`. A set of primitive data types is also provided by the language, such as `String`, `Boolean` and `ID` (which is an alias of `String` with the additional semantics of being the unique identifier of a vertex).

`Query` and `Mutation` are optional types recognized by the parser and used in querying the graph. Reading data from a GraphQL API is equivalent to traversing the graph. As such a starting vertex needs to be provided; this role is fulfilled by the `Query` type. In this case, all queries to the graph must start with a user specified by id `user(id:ID!)`. For writing data, the `Mutation` vertex type is defined. This exposes a set of operations, modeled as parameterized attributes which traverse (and return) the newly created vertex types. See _Listing 2_ for examples of how these queries might look.

Vertex attributes can be parameterized, ie. accept arguments. In the context of graph traversal, if a post vertex has multiple comment vertices, you can traverse just one of them by specifying `comment(id: ID)`. All this is by design, the designer can choose not to provide direct paths to individual vertices.

The `!` character is a type post-fix, works for both primitive or user-defined types and has two semantics:

*   when used for the type of a param in a parametriezed attribute, it means that the param is required.
*   when used for the return type of an attribute it means that the attribute will not be null when the vertex is retrieved.
*   combinations are possible, for instance `[Comment!]!` represents a list of non-null Comment vertices, where `[]`, `[Comment]` are valid, but `null, [null], [Comment, null]` are not.

_Listing 2_ contains a list of _curl_ commands against the blogging API which will populate the graph using mutations and then query it to retrieve data. To run them, follow the instructions in the [topliceanu/graphql-go-example][3] repo to build and run the service.

```
# Mutations to create users 1,2 and 3\. Mutations also work as queries, in these cases we retrieve the ids and emails of the newly created users.
curl -XPOST http://vm:8080/graphql -d 'mutation {createUser(email:"user1@x.co"){id, email}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createUser(email:"user2@x.co"){id, email}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createUser(email:"user3@x.co"){id, email}}'
# Mutations to add posts for the users. We retrieve their ids to comply with the schema, otherwise we will get an error.
curl -XPOST http://vm:8080/graphql -d 'mutation {createPost(user:1,title:"post1",body:"body1"){id}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createPost(user:1,title:"post2",body:"body2"){id}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createPost(user:2,title:"post3",body:"body3"){id}}'
# Mutations to all comments to posts. `createComment` expects the user's ID, a title and a body. See the schema in Listing 1.
curl -XPOST http://vm:8080/graphql -d 'mutation {createComment(user:2,post:1,title:"comment1",body:"comment1"){id}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createComment(user:1,post:3,title:"comment2",body:"comment2"){id}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createComment(user:3,post:3,title:"comment3",body:"comment3"){id}}'
# Mutations to have the user3 follow users 1 and 2\. Note that the `follow` mutation only returns a boolean which doesn't need to be specified.
curl -XPOST http://vm:8080/graphql -d 'mutation {follow(follower:3, followee:1)}'
curl -XPOST http://vm:8080/graphql -d 'mutation {follow(follower:3, followee:2)}'

# Query to fetch all data for user 1
curl -XPOST http://vm:8080/graphql -d '{user(id:1)}'
# Queries to fetch the followers of user2 and, respectively, user1.
curl -XPOST http://vm:8080/graphql -d '{user(id:2){followers{id, email}}}'
curl -XPOST http://vm:8080/graphql -d '{user(id:1){followers{id, email}}}'
# Query to check if user2 is being followed by user1\. If so retrieve user1's email, otherwise return null.
curl -XPOST http://vm:8080/graphql -d '{user(id:2){follower(id:1){email}}}'
# Query to return ids and emails for all the users being followed by user3.
curl -XPOST http://vm:8080/graphql -d '{user(id:3){followees{id, email}}}'
# Query to retrieve the email of user3 if it is being followed by user1.
curl -XPOST http://vm:8080/graphql -d '{user(id:1){followee(id:3){email}}}'
# Query to fetch user1's post2 and retrieve the title and body. If post2 was not created by user1, null will be returned.
curl -XPOST http://vm:8080/graphql -d '{user(id:1){post(id:2){title,body}}}'
# Query to retrieve all data about all the posts of user1.
curl -XPOST http://vm:8080/graphql -d '{user(id:1){posts{id,title,body}}}'
# Query to retrieve the user who wrote post2, if post2 was written by user1; a contrived example that displays the flexibility of the language.
curl -XPOST http://vm:8080/graphql -d '{user(id:1){post(id:2){user{id,email}}}}'
```

_Listing 2_

By carefully desiging the mutations and type attributes, powerful and expressive queries are possible.

### Designing the PostgreSQL database

The relational database design is, as usual, driven by the need to avoid data duplication. This approach was chosen for two reasons: 1\. to show that there is no need for a specialized database technology or to learn and use new design techniques to accommodate a GraphQL API. 2\. to show that a GraphQL API can still be created on top of existing databases, more specifically databases originally designed to power REST endpoints or even traditional server-side rendered HTML websites.

See _Appendix 1_ for a discussion on differences between relational and graph databases with respect to building a GraphQL API. _Listing 3_ shows the SQL commands to create the new database. The database schema generally matches the GraphQL schema. The `followers` relation needed to be added to support the `follow/unfollow` mutations.

```
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS posts (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(200) NOT NULL,
  body TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS comments (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
  title VARCHAR(200) NOT NULL,
  body TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS followers (
  follower_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  followee_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  PRIMARY KEY(follower_id, followee_id)
);
```

_Listing 3_

### Golang API Implementation

The GraphQL parser implemented in Go and used in this project is `github.com/graphql-go/graphql`. It contains a query parser, but no schema parser. This requires the programmer to build the GraphQL schema in Go using the constructs offered by the library. This is unlike the reference [nodejs implementation][4], which offers a schema parser and exposes hooks for data fetching. As such the schema in `Listing 1` is only useful as a guideline and has to be translated into Golang code. However, this _“limitation”_ offers the opportunity to peer behind the levels of abstraction and see how the schema relates to the graph traversal model for retrieving data. _Listing 4_ shows the implementation of the `Comment` vertex type:

```
var CommentType = graphql.NewObject(graphql.ObjectConfig{
	Name: "Comment",
	Fields: graphql.Fields{
		"id": &graphql.Field{
			Type: graphql.NewNonNull(graphql.ID),
			Resolve: func(p graphql.ResolveParams) (interface{}, error) {
				if comment, ok := p.Source.(*Comment); ok == true {
					return comment.ID, nil
				}
				return nil, nil
			},
		},
		"title": &graphql.Field{
			Type: graphql.NewNonNull(graphql.String),
			Resolve: func(p graphql.ResolveParams) (interface{}, error) {
				if comment, ok := p.Source.(*Comment); ok == true {
					return comment.Title, nil
				}
				return nil, nil
			},
		},
		"body": &graphql.Field{
			Type: graphql.NewNonNull(graphql.ID),
			Resolve: func(p graphql.ResolveParams) (interface{}, error) {
				if comment, ok := p.Source.(*Comment); ok == true {
					return comment.Body, nil
				}
				return nil, nil
			},
		},
	},
})
func init() {
	CommentType.AddFieldConfig("user", &graphql.Field{
		Type: UserType,
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			if comment, ok := p.Source.(*Comment); ok == true {
				return GetUserByID(comment.UserID)
			}
			return nil, nil
		},
	})
	CommentType.AddFieldConfig("post", &graphql.Field{
		Type: PostType,
		Args: graphql.FieldConfigArgument{
			"id": &graphql.ArgumentConfig{
				Description: "Post ID",
				Type:        graphql.NewNonNull(graphql.ID),
			},
		},
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			i := p.Args["id"].(string)
			id, err := strconv.Atoi(i)
			if err != nil {
				return nil, err
			}
			return GetPostByID(id)
		},
	})
}
```

_Listing 4_

Just like in the schema in _Listing 1_, the `Comment` type is a structure with three attributes defined statically; `id`, `title` and `body`. Two other attributes `user` and `post` are defined dynamically to avoid circular dependencies.

Go does not lend itself well to this kind of dynamic modeling, there is little type-checking support, most of the variables in the code are of type `interface{}` and need to be type asserted before use. `CommentType` itself is a variable of type `graphql.Object` and its attributes are of type `graphql.Field`. So, there’s no direct translation between the GraphQL DSL and the data structures used in Go.

The `resolve` function for each field exposes the `Source` parameter which is a data type vertex representing the previous node in the traversal. All the attributes of a `Comment` have, as source, the current `CommentType` vertex. Retrieving the `id`, `title` and `body` is a straightforward attribute access, while retrieving the `user` and the `post` requires graph traversals, and thus database queries. The SQL queries are left out of this document because of their simplicity, but they are available in the github repository listed in the _References_ section.

### Comparison with REST in common scenarios

In this section we will present a common blog page rendering scenario and compare the REST and the GraphQL implementations. The focus will be on the number of inbound/outbound requests, because these are the biggest contributors to the latency of rendering the page.

The scenario: render a blog post page. It should contain information about the author (email), about the blog post (title, body), all comments (title, body) and whether the user that made the comment follows the author of the blog post or not. _Figure 1_ and _Figure 2_ show the interaction between the client SPA, the API server and the database, for a REST API and, respectively, for a GraphQL API.

```
+------+                  +------+                  +--------+
|client|                  |server|                  |database|
+--+---+                  +--+---+                  +----+---+
   |      GET /blogs/:id     |                           |
1\. +------------------------->  SELECT * FROM blogs...   |
   |                         +--------------------------->
   |                         <---------------------------+
   <-------------------------+                           |
   |                         |                           |
   |     GET /users/:id      |                           |
2\. +------------------------->  SELECT * FROM users...   |
   |                         +--------------------------->
   |                         <---------------------------+
   <-------------------------+                           |
   |                         |                           |
   | GET /blogs/:id/comments |                           |
3\. +-------------------------> SELECT * FROM comments... |
   |                         +--------------------------->
   |                         <---------------------------+
   <-------------------------+                           |
   |                         |                           |
   | GET /users/:id/followers|                           |
4\. +-------------------------> SELECT * FROM followers.. |
   |                         +--------------------------->
   |                         <---------------------------+
   <-------------------------+                           |
   |                         |                           |
   +                         +                           +
```

_Figure 1_

```
+------+                  +------+                  +--------+
|client|                  |server|                  |database|
+--+---+                  +--+---+                  +----+---+
   |      GET /graphql       |                           |
1\. +------------------------->  SELECT * FROM blogs...   |
   |                         +--------------------------->
   |                         <---------------------------+
   |                         |                           |
   |                         |                           |
   |                         |                           |
2\. |                         |  SELECT * FROM users...   |
   |                         +--------------------------->
   |                         <---------------------------+
   |                         |                           |
   |                         |                           |
   |                         |                           |
3\. |                         | SELECT * FROM comments... |
   |                         +--------------------------->
   |                         <---------------------------+
   |                         |                           |
   |                         |                           |
   |                         |                           |
4\. |                         | SELECT * FROM followers.. |
   |                         +--------------------------->
   |                         <---------------------------+
   <-------------------------+                           |
   |                         |                           |
   +                         +                           +
```

_Figure 2_

_Listing 5_ contains the single GraphQL query which will fetch all the data needed to render the blog post.

```
{
  user(id: 1) {
    email
    followers
    post(id: 1) {
      title
      body
      comments {
        id
        title
        user {
          id
          email
        }
      }
    }
  }
}
```

_Listing 5_

The number of queries to the database for this scenario is deliberately identical, but the number of HTTP requests to the API server has been reduced to just one. We argue that the HTTP requests over the Internet are the most costly in this type of application.

The backend doesn’t have to be designed differently to start reaping the benefits of GraphQL, transitioning from REST to GraphQL can be done incrementally. This allows to measure performance improvements and optimize. From this point, the API developer can start to optimize (potentially merge) SQL queries to improve performance. The opportunity for caching is greatly increased, both on the database and API levels.

Abstractions on top of SQL (for instance ORM layers) usually have to contend with the `n+1` problem. In step `4.` of the REST example, a client could have had to request the follower status for the author of each comment in separate requests. This is because in REST there is no standard way of expressing relationships between more than two resources, whereas GraphQL was designed to prevent this problem by using nested queries. Here, we cheat by fetching all the followers of the user. We defer to the client the logic of determining the users who commented and also followed the author.

Another difference is fetching more data than the client needs, in order to not break the REST resource abstractions. This is important for bandwidth consumption and battery life spent parsing and storing unneeded data.

### Conclusions

GraphQL is a viable alternative to REST because:

*   while it is more difficult to design the API, the process can be done incrementally. Also for this reason, it’s easy to transition from REST to GraphQL, the two paradigms can coexist without issues.
*   it is more efficient in terms of network requests, even with naive implementations like the one in this document. It also offers more opportunities for query optimization and result caching.
*   it is more efficient in terms of bandwidth consumption and CPU cycles spent parsing results, because it only returns what is needed to render the page.

REST remains very useful if:

*   your API is simple, either has a low number of resources or simple relationships between them.
*   you already work with REST APIs inside your organization and you have the tooling all set up or your clients expect REST APIs from your organization.
*   you have complex ACL policies. In the blog example, a potential feature could allow users fine-grained control over who can see their email, their posts, their comments on a particular post, whom they follow etc. Optimizing data retrieval while checking complex business rules can be more difficult.

### Appendix 1: Graph Databases And Efficient Data Storage

While it is intuitive to think about application domain data as a graph, as this document demonstrates, the question of efficient data storage to support such an interface is still open.

In recent years graph databases have become more popular. Deferring the complexity of resolving the request by translating the GraphQL query into a specific graph database query language seems like a viable solution.

The problem is that graphs are not an efficient data structure compared to relational databases. A vertex can have links to any other vertex in the graph and access patterns are less predictable and thus offer less opportunity for optimization.

For instance, the problem of caching, ie. which vertices need to be kept in memory for fast access? Generic caching algorithms may not be very efficient in the context of graph traversal.

The problem of database sharding: splitting the database into smaller, non-interacting databases, living on separate hardware. In academia, the problem of splitting a graph on the minimal cut is well understood but it is suboptimal and may potentially result in highly unbalanced cuts due to pathological worst-case scenarios.

With relational databases, data is modeled in records (or rows, or tuples) and columns, tables and database names are simply namespaces. Most databases are row-oriented, which means that each record is a contiguous chunk of memory, all records in a table are neatly packed one after the other on the disk (usually sorted by some key column). This is efficient because it is optimal for the way physical storage works. The most expensive operation for an HDD is to move the read/write head to another sector on the disk, so minimizing these accesses is critical.

There is also a high probability that, if the application is interested in a particular record, it will need the whole record, not just a single key from it. There is a high probabilty that if the application is interested in a record, it will be interested in its neighbours as well, for instance a table scan. These two observations make relational databases quite efficient. However, for this reason also, the worst use-case scenario for a relational database is random access across all data all the time. This is exactly what graph databases do.

With the advent of SSD drives which have faster random access, cheap RAM memory which makes caching large portions of a graph database possible, better techniques to optimize graph caching and partitioning, graph databases have become a viable storage solution. And most large companies use it: Facebook has the Social Graph, Google has the Knowledge Graph.

--------------------------------------------------------------------------------

via: http://alexandrutopliceanu.ro/post/graphql-with-go-and-postgresql

作者：[Alexandru Topliceanu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/topliceanu
[1]:http://graphql.org/learn/
[2]:https://github.com/topliceanu/graphql-go-example
[3]:https://github.com/topliceanu/graphql-go-example
[4]:https://github.com/graphql/graphql-js
