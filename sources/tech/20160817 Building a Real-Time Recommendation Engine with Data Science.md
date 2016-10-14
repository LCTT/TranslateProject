translating by ucasFL
Building a Real-Time Recommendation Engine with Data Science
用数据科学搭建一个实时推荐引擎
======================

Editor’s Note: This presentation was given by Nicole White at GraphConnect Europe in April 2016. Here’s a quick review of what she covered:
- [Basic graph-powered recommendations][1]
- [Social recommendations][2]
- [Similarity recommendations][3]
- [Cluster recommendations][4]
编者注：本文是 2016 年四月 Nicole Whilte 在欧洲 GraphConnect 时所作。这儿我们快速回顾一下她所涉及的内容：
- 【基本图表动力推荐】【1】
- 【社会推荐】【2】
- 【相似性推荐】【3】
- 【集群推荐】【4】

What we’re going to be talking about today is data science and graph recommendations:
我们今天将要讨论的内容是数据科学和图表推荐：

I’ve been with Neo4j for two years now, but have been working with Neo4j and Cypher for three. I discovered this particular graph database when I was a grad student at the University of Texas Austin studying for a masters in statistics with a focus on social networks.
Neo4j 已经伴随我两年了，但实际上我已经使用 Neo4j 和 Cypher 工作三年了。当我首次发现这个特别的图表数据库的时候，我还是一个研究生，那时候我在奥斯丁的德克萨斯大学攻读关于社会网络的统计学硕士学位。

[Real-time recommendation engines][5] are one of the most common use cases for Neo4j, and one of the things that makes it so powerful and easy to use. To explore this, I’ll explain how to incorporate statistical methods into these recommendations by using example datasets.
【实时推荐引擎】【5】是 Neo4j 中广泛使用的一个实例，有一样东西使它如此强大并且容易使用。为了探索这个东西，我将通过使用示例数据集来阐述如何将统计学方法并入这些引擎中。

The first will be simple – entirely in Cypher with a focus on social recommendations. Next we’ll look at the similarity recommendation, which involves similarity metrics that can be calculated, and finally a clustering recommendation.
第一个很简单 - 仅仅在 Cypher 中关注社会推荐。接下来，我们将看一看相似性推荐，这涉及到可以被计算的相似性度量，最后探索的是集群推荐

### Basic Graph-Powered Recommendations
### 基本图表动力推荐

The following dataset includes food and drink places in the Dallas Fort Worth International Airport, one of the major airport hubs in the United States:
下面的数据集包含所有达拉斯 Fort Worth 国际机场的饮食场所，达拉斯 Fort Worth 国际机场是美国主要的机场枢纽之一：

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816214938/recommendation-engine-data-science-nicole-white-graphconnect-768x432.png)

We have place nodes in yellow and are modeling their location in terms of gate and terminal. And we are also categorizing the place in terms of major categories for food and drink. Some include Mexican food, sandwiches, bars and barbecue.
我们把节点标记成黄色并按照出入口和终点给它们的位置建模。同时我们也按照食物和饮料的主类别将地点分类，其中一些包括墨西哥食物，三明治，酒吧和烤肉。

Let’s do a simple recommendation. We want to find a specific type of food in a certain location in the airport, and the curled brackets represent user inputs which are being entered into our hypothetical app:
让我们做一个简单的推荐。我们想要在机场的某一地点找到一种特定食物，大括号中的内容所表示的用户输入将进入我们假想的应用程序中。

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816215426/food-drink-real-time-recommendation-engine-parameters-768x208.png)

This English sentence maps really well as a Cypher query:
这个英文句子很好地表示出了密码查询：

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816215537/cypher-query-dfw-food-drink-real-time-recommendations-768x364.png)

This is going to pull all the places in the category, terminal and gate the user has requested. Then we get the absolute distance of the place to gate where the user is, and return the results in ascending order. Again, a very simple Cypher recommendation to a user based just on their location in the airport.
这将提取出目录中用户所提取的所以地点，终点和出入口。然后我们可以计算出用户所在位置到出入口的准确距离，并以升序返回结果。再次说明，一个非常简单的 Cypher 推荐仅仅依据用户在机场中的位置。

### Social Recommendations
### 社会推荐

Let’s look at a social recommendation. In our hypothetical app, we have users who can log in and “like” places in a way similar to Facebook and can also check into places:
让我们来看一下社会推荐。在我们的假想应用程序中，用户可以登录并且可以用和 Facebook 类似的方式标记自己“喜欢”的地点，也可以查询登记地点。

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816215655/social-media-recommendation-engine-data-model-768x550.png)

Consider this data model on top of the first model that we explored, and now let’s find food and drink places in the following categories closest to some gate in whatever terminal that user’s friends like:
考虑我们所探索的第一个模型顶部的数据模型，现在让我们在下面的目录中国找到离一些出入口最近的饮食场所，不考虑用户的朋友想要去哪个终点：

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816215751/social-recommendation-engine-parameters-768x258.png)

The MATCH clause is very similar to the MATCH clause of our first Cypher query, except now we are matching on likes and friends:
匹配项目和我们第一次 Cypher 查询得到的匹配项目相似，只是现在我们依据喜好和朋友来匹配：

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816215846/social-recommendation-engine-cypher-query-768x468.png)

The first three lines are the same, but for the user in question – the user that’s “logged in” – we want to find their friends through the :FRIENDS_WITH relationship along with the places those friends liked. With just a few added lines of Cypher, we are now taking a social aspect into account for our recommendation engine.
前三行是完全一样的，但是现在正在考虑的是关于那些登录的用户，我们想要通过喜欢相同的地方这一关系来找到他们的朋友。仅需通过在 Cypher 中增加一些行内容，我们现在已经把社会层面考虑到了我们的推荐引擎中。

Again, we’re only showing categories that the user explicitly asked for that are in the same terminals the user is in. And, of course, we want to filter this by the user who is logged in and making this request, and it returns the name of the place along with its location and category. We are also accounting for how many friends have liked that place and the absolute value of the distance of the place from the gate, all returned in the RETURN clause.
在次说明，我们仅仅显示了用户明确请求的目录，并且这些目录中的地点与用户进入的地方有相同的终点。当然，我们希望通过登录用户做出请求来滤过这些目录，然后返回地点的名字、位置以及所在目录。我们也要显示出有多少朋友已经“喜欢”那个地点以及那个地点到出入口的确切距离，然后在返回项目中把这些内容都返回。

### Similarity Recommendation
### 相似性推荐

Now let’s take a look at a similarity recommendation engine:
现在，让我们看一看相似性推荐引擎：

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816215944/similarity-recommendation-engine-data-model-768x646.png)

Similarly to our earlier data model, we have users who can like places, but this time they can also rate places with an integer between one and 10. This is easily modeled in Neo4j by adding a property to the relationship.
和前面的数据模型相似，用户可以标记“喜欢”的地点，但是这一次他们可以用 1 到 10 的整数给地点评定等级。这是通过前期在 Neo4j 中增加一些属性到关系中建模实现的。

This allows us to find other similar users, like in the example of Greta and Alice. We’ve queried the places they’ve mutually liked, and for each of those places, we can see the weights they have assigned. Presumably, we can use these numbers to determine how similar they are to each other:
这将允许我们找到其他相似的用户，比如以 Greta 和 Alice 为例，我们都已经查询了他们共同喜欢的地点，并且对于每一个地点，我们可以看到他们给设定的等级。大概地，我们可以通过他们评定的数字等级来确定他们之间的相似性大小。

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816220107/user-similarity-recommendation-engine-768x481.png)

Now we have two vectors:
现在我们有两个向量：

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816220204/user-length-vectors-300x180.png)

And now let’s apply Euclidean distance to find the distance between those two vectors:
现在让我们按照欧几里得距离的定义来计算这两个向量之间的距离：

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816220239/euclidean-distance-user-vectors.png)

And when we plug in all the numbers, we get the following similarity metric, which is really the distance metric between the two users:
当我们把所有的数字带入公式中计算，我们得到下面的相似度，这就是两个用户之间的“距离”：

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816220323/user-vector-distance-similarity-metric-768x140.png)

You can do this between two specific users easily in Cypher, especially if they’ve only mutually liked a small subset of places. Again, here we’re matching on two users, Alice and Greta, and are trying to find places they’ve mutually liked:
你可以提前在 Cypher 中计算两个特定用户的“距离”，特别是如果他们仅仅同时“喜欢”一个很小的地点子集。再次说明，这儿我们依据两个用户 Alice 和 Greta 来进行匹配，并尝试去找到他们同时“喜欢”的地点：

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816220517/similarity-recommendation-engine-Cypher-query-users-768x399.png)

They both have to have a :LIKES relationship to the place for it to be found in this result, and then we can easily calculate the Euclidean distance between them with the square root of the sum of their squared differences in Cypher.
他们都有对最后找到的地点的“喜爱”关系，然后我们可以在 Cypher 中很容易的计算出他们之间的欧几里得距离，计算方法为他们对各个地点等级差的平方和再开平方根。

While this may work in an example with two specific people, it doesn’t necessarily work in real time when you’re trying to infer similar users from another user on the fly, by comparing them against every other user in the database in real time. Needless to say, this doesn’t work very well.
在两个特定用户的例子中上面这个方法或许能够工作。但是，在实时情况下，当你想要从一架飞机上的一个用户推断相似用户，通过把他们和实时数据库中的其他用户比较，这时候这个方法就不一定能够工作。不用说，它不能够很好的工作。

To find a way around this, we pre-compute this calculation and store it in an actual relationship:
为了找到解决这个问题的好方法，我们可以预先计算好距离并存入实际关系中：

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816220642/similarity-recommendation-engine-user-euclidean-distance-768x284.png)

While in large datasets we would do this in batches, in this small example dataset, we can match on a Cartesian product of all the users and places they’ve mutually liked. When we use WHERE id(u1) < id(u2) as part of our Cypher query, this is just a trick to ensure we’re not finding the same pair twice on both the left and the right.
当遇到一个很大的数据集的时候，我们需要成批处理这件事，在这个很小的示例数据集中，我们可以按照所有用户的迪卡尔乘积和他们共同“喜欢”的地点来进行匹配。当我们使用 WHERE id（u1） < id（u2） 作为 Cypher 查询的一部分，它只是来确定我们在左边和右边没有找到相同的对的一个技巧。

Then with their Euclidean distance and themselves, we’re going to create a relationship between them called :DISTANCE and set a Euclidean property called euclidean. In theory, we could also store other similarity metrics on some relationship between users to capture different similarity metrics, since some might be more useful than others in certain contexts.
通过他们之间的欧几里得距离，我们创建了他们之间的一种关系，叫做“距离”，并且设置了一个欧几里得属性，也叫做“欧几里得”。理论上，我们可以也通过用户间的一些关系来存储其他相似度从而获取不同的相似度，因为在确定的环境下一些相似度可能比其他相似度更有用。

And it’s really this ability to model properties on relationships in Neo4j that makes things like this incredibly easy. However, in practice you don’t want to store every single relationship that can possibly exist because you’ll only want to return the top few people of their neighbors.


So you can just store the top in according to some threshold so you don’t have this fully connected graph. This allows you to perform graph database queries like the below in real time, because we’ve pre-computed it and stored it on the relationship, and in Cypher we’ll be able to grab that very quickly:

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816220737/similarity-recommendation-engine-parameters-768x256.png)

In this query, we’re matching on places and categories:

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816221031/similarity-real-time-recommendation-engine-cypher-query-768x384.png)

Again, the first three lines are the same, except that for the logged-in user, we’re getting users who have a :DISTANCE relationship to them. This is where what we went over earlier comes into play – in practice you should only store the top :DISTANCE relationships to users who are similar to them so you’re not grabbing a huge volume of users in this MATCH clause. Instead, we’re grabbing users who have a :DISTANCE relationship to them where those users like that place.

This has allowed us to express a somewhat complicated pattern in just a few lines. We’re also grabbing the :LIKES relationship and putting it on a variable because we’re going to use those weights later to apply a rating.

What’s important here is that we’re ordering those users by their distance ascending, because it is a distance metric, and we want the lowest distances because that indicates they are the most similar.

With those other users ordered by the Euclidean distance, we’re going to collect the top three users’ ratings and use those as our average score to recommend these places. In other words, we’ve taken an active user, found users who are most similar to them based on the places they’ve liked, and then averaged the scores those similar users have given to rank those places in a result set.

We’re essentially taking an average here by adding it up and dividing by the number of elements in the collection, and we’re ordering by that average ascending. Then secondarily, we’re ordering by the gate distance. Hypothetically, there could be ties I suppose, and then you order by the gate distance and then returning the name, category, gate and terminal.

### Cluster Recommendations

Our final example is going to be a cluster recommendation, which can be thought of as a workflow of offline computing that may be required as a workaround in Cypher. This may now be obsolete based on the new procedures announced at GraphConnect Europe, but sometimes you have to do certain algorithmic approaches that Cypher version 2.3 doesn’t expose.

This is where you can use some form of statistical software, pull data out of Neo4j into a software such as Apache Spark, R or Python. Below is an example of R code for pulling data out of Neo4j, running an algorithm, and then – if appropriate – writing the results of that algorithm back into Neo4j as either a property, node, relationship or a new label. 

By persisting the results of that algorithm into the graph, you can use it in real-time with queries similar to the ones we just went over:

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816221336/cluster-recommendation-r-code-algorithm-neo4j.png)

Below is some example code for how you do this in R, but you can easily do the same thing with whatever software you’re most comfortable with, such as Python or Spark. All you have to do is log in and connect to the graph.

In the following example, I’ve clustered users together based on their similarities. Each user is represented as an observation, and I want to get the average rating that they’ve given each category:

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816221449/cluster-recommendation-engine-r-code-example-768x403.png)

Presumably, users who rate the bar category in similar ways are similar in general. Here I’m grabbing the names of users who like places in the same category, the category name, and the average weight of the “likes” relationships, as average weight, and that’s going to give me a table like this:

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816221557/cluster-user-category-likes-768x295.png)

Because we want each user to be an observation, we will have to manipulate the data where each feature is the average weight rating they’ve given restaurants within that category, per category. We’ll then use this to determine how similar they are, and I’m going to use a clustering algorithm to determine users being in different clusters.

In R this is very straightforward:

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816221716/clustering-algorith-recommendation-r-example-768x347.png)

For this demonstration we are using k-means, which allows you to easily grab cluster assignments. In summary, I ran a clustering algorithm and now for each user I have a cluster assignment. 

Bob and David are in the same cluster – they’re in cluster two – and now I’ll be able to see in real time which users have been determined to be in the same cluster.

Next we write it into a CSV, which we then load into the graph:

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816221805/load-csv-cypher-example-768x227.png)

We have users and cluster assignments, so the CSV will only have two columns. LOAD CSV is a syntax that’s built into Cypher that allows you to call a CSV from some file path or URL and alias it as something. Then we’ll match on the users that already exist in the graph, grab the user column out of that CSV, and merge on the cluster. 

Here we’re creating a new labeled node in the graph, the Cluster ID, which was given by k-means. Next we create relationships between the user and the cluster, which allows us to easily query when we get to the actual recommendation users who are in the same cluster.

Now we have a new label cluster where users who are in the same cluster have a relationship to that cluster. Below is what our new data model looks like, which is on top of the other data models we explored:

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816221913/clustering-recommendation-engine-data-model-768x401.png)

Now let’s consider the following query:

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816222009/clustering-recommendation-engine-parameters-768x259.png)

With this Cypher query, we’re going beyond similar users to users in the same cluster. At this point we’ve also deleted those distance relationships:

![](https://s3.amazonaws.com/dev.assets.neo4j.com/wp-content/uploads/20160816222045/cluster-recommendation-engine-cypher-query-example-768x385.png)

In this query, we’ve taken the user who’s logged in, finding their cluster based on the user-cluster relationship, and finding their neighbors who are in that same cluster.

We’ve assigned that to some variable cl, and we’re getting other users – which I’ve aliased as a neighbor variable – who have a user-cluster relationship to that same cluster, and then we’re getting the places that neighbor has liked. Again, we’re putting the “likes” on a variable, r, because we’re going want to grab weights off of the relationship to order our results.

All we’ve changed in the query is that instead of using the similarity distance, we’re grabbing users in the same cluster, asserting categories, asserting the terminal and asserting that we’re only grabbing the user who is logged in. We’re collecting all those weights of the :LIKES relationships from their neighbors liking places, getting the category, the absolute value of the distance, ordering that in descending order, and returning those results.

In these examples we’ve been able to take a pretty involved process and persist it in the graph, and then used the results of that algorithm – the results of the clustering algorithm and the clustering assignments – in real time.

Our preferred workflow is to update these clustering assignments however frequently you see fit — for example, nightly or hourly. And, of course, you can use intuition to figure out how often is acceptable to be updating these cluster assignments.

--------------------------------------------------------------------------------

via: https://neo4j.com/blog/real-time-recommendation-engine-data-science/?utm_source=dbweekly&utm_medium=email

作者：[Nicole White][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://neo4j.com/blog/contributor/nicole-white/
[1]: https://neo4j.com/blog/real-time-recommendation-engine-data-science/?utm_source=dbweekly&utm_medium=email#basic-graph-recommendations
[2]: https://neo4j.com/blog/real-time-recommendation-engine-data-science/?utm_source=dbweekly&utm_medium=email#social-recommendations
[3]: https://neo4j.com/blog/real-time-recommendation-engine-data-science/?utm_source=dbweekly&utm_medium=email#similarity-recommendations
[4]: https://neo4j.com/blog/real-time-recommendation-engine-data-science/?utm_source=dbweekly&utm_medium=email#cluster-recommendations
[5]: https://neo4j.com/use-cases/real-time-recommendation-engine/










