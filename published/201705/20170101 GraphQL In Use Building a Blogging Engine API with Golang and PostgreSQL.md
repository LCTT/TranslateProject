GraphQL 用例：使用 Golang 和 PostgreSQL 构建一个博客引擎 API
============================================================

### 摘要

GraphQL 在生产环境中似乎难以使用：虽然对于建模功能来说图接口非常灵活，但是并不适用于关系型存储，不管是在实现还是性能方面。

在这篇博客中，我们会设计并实现一个简单的博客引擎 API，它支持以下功能：

*	三种类型的资源（用户、博文以及评论）支持多种功能（创建用户、创建博文、给博文添加评论、关注其它用户的博文和评论，等等。）
*	使用 PostgreSQL 作为后端数据存储（选择它因为它是一个流行的关系型数据库）。
*	使用 Golang（开发 API 的一个流行语言）实现 API。

我们会比较简单的 GraphQL 实现和纯 REST 替代方案，在一种普通场景（呈现博客文章页面）下对比它们的实现复杂性和效率。

### 介绍

GraphQL 是一种 IDL（Interface Definition Language，接口定义语言），设计者定义数据类型和并把数据建模为一个图（graph）。每个顶点都是一种数据类型的一个实例，边代表了节点之间的关系。这种方式非常灵活，能适应任何业务领域。然而，问题是设计过程更加复杂，而且传统的数据存储不能很好地映射到图模型。阅读_附录1_了解更多关于这个问题的详细信息。

GraphQL 在 2014 年由 Facebook 的工程师团队首次提出。尽管它的优点和功能非常有趣而且引人注目，但它并没有得到大规模应用。开发者需要权衡 REST 的设计简单性、熟悉性、丰富的工具和 GraphQL 不会受限于 CRUD（LCTT 译注：Create、Read、Update、Delete） 以及网络性能（它优化了往返服务器的网络）的灵活性。

大部分关于 GraphQL 的教程和指南都跳过了从数据存储获取数据以便解决查询的问题。也就是，如何使用通用目的、流行存储方案（例如关系型数据库）为 GraphQL API 设计一个支持高效数据提取的数据库。

这篇博客介绍构建一个博客引擎 GraphQL API 的流程。它的功能相当复杂。为了和基于 REST 的方法进行比较，它的范围被限制为一个熟悉的业务领域。

这篇博客的文章结构如下：

*	第一部分我们会设计一个 GraphQL 模式并介绍所使用语言的一些功能。
*	第二部分是 PostgreSQL 数据库的设计。
*	第三部分介绍了使用 Golang 实现第一部分设计的 GraphQL 模式。
*	第四部分我们以从后端获取所需数据的角度来比较呈现博客文章页面的任务。

### 相关阅读

*	很棒的 [GraphQL 介绍文档][1]。
*	该项目的完整实现代码在 [github.com/topliceanu/graphql-go-example][2]。

### 在 GraphQL 中建模一个博客引擎

下述_列表1_包括了博客引擎 API 的全部模式。它显示了组成图的顶点的数据类型。顶点之间的关系，也就是边，被建模为指定类型的属性。

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

_列表1_

模式使用 GraphQL DSL 编写，它用于定义自定义数据类型，例如 `User`、`Post` 和 `Comment`。该语言也提供了一系列原始数据类型，例如 `String`、`Boolean` 和 `ID`（它是`String` 的别名，但是有顶点唯一标识符的额外语义）。

`Query` 和 `Mutation` 是语法解析器能识别并用于查询图的可选类型。从 GraphQL API 读取数据等同于遍历图。需要提供这样一个起始顶点；该角色通过 `Query` 类型来实现。在这种情况中，所有图的查询都要从一个由 id `user(id:ID!)` 指定的用户开始。对于写数据，定义了 `Mutation` 顶点。它提供了一系列操作，建模为能遍历（并返回）新创建顶点类型的参数化属性。_列表2_是这些查询的一些例子。

顶点属性能被参数化，也就是能接受参数。在图遍历场景中，如果一个博文顶点有多个评论顶点，你可以通过指定 `comment(id: ID)` 只遍历其中的一个。所有这些都取决于设计，设计者可以选择不提供到每个独立顶点的直接路径。

`!` 字符是一个类型后缀，适用于原始类型和用户定义类型，它有两种语义：

*	当被用于参数化属性的参数类型时，表示这个参数是必须的。
*	当被用于一个属性的返回类型时，表示当顶点被获取时该属性不会为空。
*	也可以把它们组合起来，例如 `[Comment!]!` 表示一个非空 Comment 顶点链表，其中 `[]`、`[Comment]` 是有效的，但 `null, [null], [Comment, null]` 就不是。


_列表2_ 包括一系列用于博客 API 的 `curl` 命令，它们会使用 mutation 填充图然后查询图以便获取数据。要运行它们，按照 [topliceanu/graphql-go-example][3] 仓库中的指令编译并运行服务。

```
# 创建用户 1、2 和 3 的更改。更改和查询类似，在该情景中我们检索新创建用户的 id 和 email。
curl -XPOST http://vm:8080/graphql -d 'mutation {createUser(email:"user1@x.co"){id, email}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createUser(email:"user2@x.co"){id, email}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createUser(email:"user3@x.co"){id, email}}'
# 为用户添加博文的更改。为了和模式匹配我们需要检索他们的 id，否则会出现错误。
curl -XPOST http://vm:8080/graphql -d 'mutation {createPost(user:1,title:"post1",body:"body1"){id}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createPost(user:1,title:"post2",body:"body2"){id}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createPost(user:2,title:"post3",body:"body3"){id}}'
# 博文所有评论的更改。`createComment` 需要用户 id，标题和正文。看列表 1 的模式。
curl -XPOST http://vm:8080/graphql -d 'mutation {createComment(user:2,post:1,title:"comment1",body:"comment1"){id}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createComment(user:1,post:3,title:"comment2",body:"comment2"){id}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createComment(user:3,post:3,title:"comment3",body:"comment3"){id}}'
# 让用户 3 关注用户 1 和用户 2 的更改。注意 `follow` 更改只返回一个布尔值而不需要指定。
curl -XPOST http://vm:8080/graphql -d 'mutation {follow(follower:3, followee:1)}'
curl -XPOST http://vm:8080/graphql -d 'mutation {follow(follower:3, followee:2)}'

# 用户获取用户 1 所有数据的查询。
curl -XPOST http://vm:8080/graphql -d '{user(id:1)}'
# 用户获取用户 2 和用户 1 的关注者的查询。
curl -XPOST http://vm:8080/graphql -d '{user(id:2){followers{id, email}}}'
curl -XPOST http://vm:8080/graphql -d '{user(id:1){followers{id, email}}}'
# 检测用户 2 是否被用户 1 关注的查询。如果是，检索用户 1 的 email，否则返回空。
curl -XPOST http://vm:8080/graphql -d '{user(id:2){follower(id:1){email}}}'
# 返回用户 3 关注的所有用户 id 和 email 的查询。
curl -XPOST http://vm:8080/graphql -d '{user(id:3){followees{id, email}}}'
# 如果用户 3 被用户 1 关注，就获取用户 3 email 的查询。
curl -XPOST http://vm:8080/graphql -d '{user(id:1){followee(id:3){email}}}'
# 获取用户 1 的第二篇博文的查询，检索它的标题和正文。如果博文 2 不是由用户 1 创建的，就会返回空。
curl -XPOST http://vm:8080/graphql -d '{user(id:1){post(id:2){title,body}}}'
# 获取用户 1 的所有博文的所有数据的查询。
curl -XPOST http://vm:8080/graphql -d '{user(id:1){posts{id,title,body}}}'
# 获取写博文 2 用户的查询，如果博文 2 是由 用户 1 撰写；一个现实语言灵活性的例证。
curl -XPOST http://vm:8080/graphql -d '{user(id:1){post(id:2){user{id,email}}}}'
```

_列表2_

通过仔细设计 mutation 和类型属性，可以实现强大而富有表达力的查询。

### 设计 PostgreSQL 数据库

关系型数据库的设计，一如以往，由避免数据冗余的需求驱动。选择该方式有两个原因：

1. 表明实现 GraphQL API 不需要定制化的数据库技术或者学习和使用新的设计技巧。
2. 表明 GraphQL API 能在现有的数据库之上创建，更具体地说，最初设计用于 REST 后端甚至传统的呈现 HTML 站点的服务器端数据库。

阅读 _附录1_ 了解关于关系型和图数据库在构建 GraphQL API 方面的区别。_列表3_ 显示了用于创建新数据库的 SQL 命令。数据库模式和 GraphQL 模式相对应。为了支持 `follow/unfollow` 更改，需要添加 `followers` 关系。

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

_列表3_

### Golang API 实现

本项目使用的用 Go 实现的 GraphQL 语法解析器是 `github.com/graphql-go/graphql`。它包括一个查询解析器，但不包括模式解析器。这要求开发者利用库提供的结构使用 Go 构建 GraphQL 模式。这和 [nodejs 实现][3] 不同，后者提供了一个模式解析器并为数据获取暴露了钩子。因此 _列表1_ 中的模式只是作为指导使用，需要转化为 Golang 代码。然而，这个_“限制”_提供了与抽象级别对等的机会，并且了解模式如何和用于检索数据的图遍历模型相关。_列表4_ 显示了 `Comment` 顶点类型的实现：

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

_列表4_

正如 _列表1_ 中的模式，`Comment` 类型是静态定义的一个有三个属性的结构体：`id`、`title` 和 `body`。为了避免循环依赖，动态定义了 `user` 和 `post` 两个其它属性。

Go 并不适用于这种动态建模，它只支持一些类型检查，代码中大部分变量都是 `interface{}` 类型，在使用之前都需要进行类型断言。`CommentType` 是一个 `graphql.Object` 类型的变量，它的属性是 `graphql.Field` 类型。因此，GraphQL DSL 和 Go 中使用的数据结构并没有直接的转换。

每个字段的 `resolve` 函数暴露了 `Source` 参数，它是表示遍历时前一个节点的数据类型顶点。`Comment` 的所有属性都有作为 source 的当前 `CommentType` 顶点。检索`id`、`title` 和 `body` 是一个直接属性访问，而检索 `user` 和 `post` 要求图遍历，也需要数据库查询。由于它们非常简单，这篇文章并没有介绍这些 SQL 查询，但在_参考文献_部分列出的 github 仓库中有。

### 普通场景下和 REST 的对比

在这一部分，我们会展示一个普通的博客文章呈现场景，并比较 REST 和 GraphQL 的实现。关注重点会放在入站/出站请求数量，因为这些是造成页面呈现延迟的最主要原因。

场景：呈现一个博客文章页面。它应该包含关于作者（email）、博客文章（标题、正文）、所有评论（标题、正文）以及评论人是否关注博客文章作者的信息。_图1_ 和 _图2_ 显示了客户端 SPA、API 服务器以及数据库之间的交互，一个是 REST API、另一个对应是 GraphQL API。 

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

_图1_

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

_图2_

_列表5_ 是一条用于获取所有呈现博文所需数据的简单 GraphQL 查询。

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

_列表5_

对于这种情况，对数据库的查询次数是故意相同的，但是到 API 服务器的 HTTP 请求已经减少到只有一个。我们认为在这种类型的应用程序中通过互联网的 HTTP 请求是最昂贵的。

为了利用 GraphQL 的优势，后端并不需要进行特别设计，从 REST 到 GraphQL 的转换可以逐步完成。这使得可以测量性能提升和优化。从这一点，API 设计者可以开始优化（潜在的合并） SQL 查询从而提高性能。缓存的机会在数据库和 API 级别都大大增加。

SQL 之上的抽象（例如 ORM 层）通常会和 `n+1` 问题相抵触。在 REST 示例的步骤 4 中，客户端可能不得不在单独的请求中为每个评论的作者请求关注状态。这是因为在 REST 中没有标准的方式来表达两个以上资源之间的关系，而 GraphQL 旨在通过使用嵌套查询来防止这类问题。这里我们通过获取用户的所有关注者来作弊。我们向客户提出了如何确定评论并关注了作者的用户的逻辑。

另一个区别是获取比客户端所需更多的数据，以免破坏 REST 资源抽象。这对于用于解析和存储不需要数据的带宽消耗和电池寿命非常重要。

### 总结

GraphQL 是 REST 的一个可用替代方案，因为：

*	尽管设计 API 更加困难，但该过程可以逐步完成。也是由于这个原因，从 REST 转换到 GraphQL 非常容易，两个流程可以没有任何问题地共存。
*	在网络请求方面更加高效，即使是类似本博客中的简单实现。它还提供了更多查询优化和结果缓存的机会。
*	在用于解析结果的带宽消耗和 CPU 周期方面它更加高效，因为它只返回呈现页面所需的数据。

REST 仍然非常有用，如果：

*	你的 API 非常简单，只有少量的资源或者资源之间关系简单。
*	在你的组织中已经在使用 REST API，而且你已经配置好了所有工具，或者你的客户希望获取 REST API。
*	你有复杂的 ACL（LCTT 译注：Access Control List） 策略。在博客例子中，可能的功能是允许用户良好地控制谁能查看他们的电子邮箱、博客、特定博客的评论、他们关注了谁，等等。优化数据获取同时检查复杂的业务规则可能会更加困难。

### 附录1：图数据库和高效数据存储

尽管将其应用领域数据想象为一个图非常直观，正如这篇博文介绍的那样，但是支持这种接口的高效数据存储问题仍然没有解决。

近年来图数据库变得越来越流行。通过将 GraphQL 查询转换为特定的图数据库查询语言从而延迟解决请求的复杂性似乎是一种可行的方案。

问题是和关系型数据库相比，图并不是一种高效的数据结构。图中一个顶点可能有到任何其它顶点的连接，访问模式比较难以预测因此提供了较少的优化机会。

例如缓存的问题，为了快速访问需要将哪些顶点保存在内存中？通用缓存算法在图遍历场景中可能没那么高效。

数据库分片问题：把数据库切分为更小、没有交叉的数据库并保存到独立的硬件。在学术上，最小切割的图划分问题已经得到了很好的理解，但可能是次优的，而且由于病态的最坏情况可能导致高度不平衡切割。

在关系型数据库中，数据被建模为记录（行或者元组）和列，表和数据库名称都只是简单的命名空间。大部分数据库都是面向行的，意味着每个记录都是一个连续的内存块，一个表中的所有记录在磁盘上一个接一个地整齐地打包（通常按照某个关键列排序）。这非常高效，因为这是物理存储最优的工作方式。HDD 最昂贵的操作是将磁头移动到磁盘上的另一个扇区，因此最小化此类访问非常重要。

很有可能如果应用程序对一条特定记录感兴趣，它需要获取整条记录，而不仅仅是记录中的其中一列。也很有可能如果应用程序对一条记录感兴趣，它也会对该记录周围的记录感兴趣，例如全表扫描。这两点使得关系型数据库相当高效。然而，也是因为这个原因，关系型数据库的最差使用场景就是总是随机访问所有数据。图数据库正是如此。

随着支持更快随机访问的 SSD 驱动器的出现，更便宜的内存使得缓存大部分图数据库成为可能，更好的优化图缓存和分区的技术，图数据库开始成为可选的存储解决方案。大部分大公司也使用它：Facebook 有 Social Graph，Google 有 Knowledge Graph。

--------------------------------------------------------------------------------

via: http://alexandrutopliceanu.ro/post/graphql-with-go-and-postgresql

作者：[Alexandru Topliceanu][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/topliceanu
[1]:http://graphql.org/learn/
[2]:https://github.com/topliceanu/graphql-go-example
[3]:https://github.com/graphql/graphql-js
