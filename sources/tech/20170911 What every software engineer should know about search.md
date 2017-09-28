What every software engineer should know about search
============================================================

![](https://cdn-images-1.medium.com/max/2000/1*5AlsVRQrewLw74uHYTZ36w.jpeg)


### Want to build or improve a search experience? Start here.

Ask a software engineer: “[How would you add search functionality to your product?][78]” or “[How do I build a search engine?][79]” You’ll probably immediately hear back something like: “Oh, we’d just launch an ElasticSearch cluster. Search is easy these days.”

But is it? Numerous current products [still][80] [have][81] [suboptimal][82] [search][83] [experiences][84]. Any true search expert will tell you that few engineers have a very deep understanding of how search engines work, knowledge that’s often needed to improve search quality.

Even though many open source software packages exist, and the research is vast, the knowledge around building solid search experiences is limited to a select few. Ironically, [searching online][85] for search-related expertise doesn’t yield any recent, thoughtful overviews.

#### Emoji Legend

```
❗ “Serious” gotcha: consequences of ignorance can be deadly
🔷 Especially notable idea or piece of technology
☁️ ️Cloud/SaaS
🍺 Open source / free software 
🦏 JavaScript
🐍 Python
☕ Java
🇨 C/C++
```

### Why read this?

Think of this post as a collection of insights and resources that could help you to build search experiences. It can’t be a complete reference, of course, but hopefully we can improve it based on feedback (please comment or reach out!).

I’ll point at some of the most popular approaches, algorithms, techniques, and tools, based on my work on general purpose and niche search experiences of varying sizes at Google, Airbnb and several startups.

❗️Not appreciating or understanding the scope and complexity of search problems can lead to bad user experiences, wasted engineering effort, and product failure.

If you’re impatient or already know a lot of this, you might find it useful to jump ahead to the tools and services sections.

### Some philosophy

This is a long read. But most of what we cover has four underlying principles:

#### 🔷 Search is an inherently messy problem:

*   Queries are highly variable. The search problems are highly variablebased on product needs.

*   Think about how different Facebook search (searching a graph of people).

*   YouTube search (searching individual videos).

*   Or how different both of those are are from Kayak ([air travel planning is a really hairy problem][2]).

*   Google Maps (making sense of geo-spacial data).

*   Pinterest (pictures of a brunch you might cook one day).

#### Quality, metrics, and processes matter a lot:

*   There is no magic bullet (like PageRank) nor a magic ranking formula that makes for a good approach. Processes are always evolving collection of techniques and processes that solve aspects of the problem and improve overall experience, usually gradually and continuously.

*   ❗️In other words, search is not just just about building software that does ranking or retrieval (which we will discuss below) for a specific domain. Search systems are usually an evolving pipeline of components that are tuned and evolve over time and that build up to a cohesive experience.

*   In particular, the key to success in search is building processes for evaluation and tuning into the product and development cycles. A search system architect should think about processes and metrics, not just technologies.

#### Use existing technologies first:

*   As in most engineering problems, don’t reinvent the wheel yourself. When possible, use existing services or open source tools. If an existing SaaS (such as [Algolia][3] or managed Elasticsearch) fits your constraints and you can afford to pay for it, use it. This solution will likely will be the best choice for your product at first, even if down the road you need to customize, enhance, or replace it.

#### ❗️Even if you buy, know the details:

*   Even if you are using an existing open source or commercial solution, you should have some sense of the complexity of the search problem and where there are likely to be pitfalls.

### Theory: the search problem

Search is different for every product, and choices depend on many technical details of the requirements. It helps to identify the key parameters of your search problem:

1.  Size: How big is the corpus (a complete set of documents that need to be searched)? Is it thousands or billions of documents?

2.  Media: Are you searching through text, images, graphical relationships, or geospatial data?

3.  🔷 Corpus control and quality: Are the sources for the documents under your control, or coming from a (potentially adversarial) third party? Are all the documents ready to be indexed or need to be cleaned up and selected?

4.  Indexing speed: Do you need real-time indexing, or is building indices in batch is fine?

5.  Query language: Are the queries structured, or you need to support unstructured ones?

6.  Query structure: Are your queries textual, images, sounds? Street addresses, record ids, people’s faces?

7.  Context-dependence: Do the results depend on who the user is, what is their history with the product, their geographical location, time of the day etc?

8.  Suggest support: Do you need to support incomplete queries?

9.  Latency: What are the serving latency requirements? 100 milliseconds or 100 seconds?

10.  Access control: Is it entirely public or should users only see a restricted subset of the documents?

11.  Compliance: Are there compliance or organizational limitations?

12.  Internationalization: Do you need to support documents with multilingual character sets or Unicode? (Hint: Always use UTF-8 unless you really know what you’re doing.) Do you need to support a multilingual corpus? Multilingual queries?

Thinking through these points up front can help you make significant choices designing and building individual search system components.

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/1600/1*qTK1iCtyJUr4zOyw4IFD7A.jpeg)
A production indexing pipeline.

### Theory: the search pipeline

Now let’s go through a list of search sub-problems. These are usually solved by separate subsystems that form a pipeline. What that means is that a given subsystem consumes the output of previous subsystems, and produces input for the following subsystems.

This leads to an important property of the ecosystem: once you change how an upstream subsystem works, you need to evaluate the effect of the change and possibly change the behavior downstream.

Here are the most important problems you need to solve:

#### Index selection:

given a set of documents (e.g. the entirety of the Internet, all the Twitter posts, all the pictures on Instagram), select a potentially smaller subset of documents that may be worthy for consideration as search results and only include those in the index, discarding the rest. This is done to keep your indexes compact, and is almost orthogonal to selecting the documents to show to the user. Examples of particular classes of documents that don’t make the cut may include:

#### Spam:

oh, all the different shapes and sizes of search spam! A giant topic in itself, worthy of a separate guide. [A good web spam taxonomy overview][86].

#### Undesirable documents:

domain constraints might require filtering: [porn][87], illegal content, etc. The techniques are similar to spam filtering, probably with extra heuristics.

#### Duplicates:

Or near-duplicates and redundant documents. Can be done with [Locality-sensitive hashing][88], [similarity measures][89], clustering techniques or even [clickthrough data][90]. A [good overview][91] of techniques.

#### Low-utility documents:

The definition of utility depends highly on the problem domain, so it’s hard to recommend the approaches here. Some ideas are: it might be possible to build a utility function for your documents; heuristics might work, or example an image that contains only black pixels is not a useful document; utility might be learned from user behavior.

#### Index construction:

For most search systems, document retrieval is performed using an [inverted index][92] — often just called the index.

*   The index is a mapping of search terms to documents. A search term could be a word, an image feature or any other document derivative useful for query-to-document matching. The list of the documents for a given term is called a [posting list][1]. It can be sorted by some metric, like document quality.

*   Figure out whether you need to index the data in real time.❗️Many companies with large corpora of documents use a batch-oriented indexing approach, but then find this is unsuited to a product where users expect results to be current.

*   With text documents, term extraction usually involves using NLP techniques, such as stop lists, [stemming][4] and [entity extraction][5]; for images or videos computer vision methods are used etc.

*   In addition, documents are mined for statistical and meta information, such as references to other documents (used in the famous [PageRank][6]ranking signal), [topics][7], counts of term occurrences, document size, entities A mentioned etc. That information can be later used in ranking signal construction or document clustering. Some larger systems might contain several indexes, e.g. for documents of different types.

*   Index formats. The actual structure and layout of the index is a complex topic, since it can be optimized in many ways. For instance there are [posting lists compression methods][8], one could target [mmap()able data representation][9] or use[ LSM-tree][10] for continuously updated index.

#### Query analysis and document retrieval:

Most popular search systems allow non-structured queries. That means the system has to extract structure out of the query itself. In the case of an inverted index, you need to extract search terms using [NLP][93] techniques.

The extracted terms can be used to retrieve relevant documents. Unfortunately, most queries are not very well formulated, so it pays to do additional query expansion and rewriting, like:

*   [Term re-weighting][11].

*   [Spell checking][12]. Historical query logs are very useful as a dictionary.

*   [Synonym matching][13]. [Another survey][14].

*   [Named entity recognition][15]. A good approach is to use [HMM-based language modeling][16].

*   Query classification. Detect queries of particular type. For example, Google Search detects queries that contain a geographical entity, a porny query, or a query about something in the news. The retrieval algorithm can then make a decision about which corpora or indexes to look at.

*   Expansion through [personalization][17] or [local context][18]. Useful for queries like “gas stations around me”.

#### Ranking:

Given a list of documents (retrieved in the previous step), their signals, and a processed query, create an optimal ordering (ranking) for those documents.

Originally, most ranking models in use were hand-tuned weighted combinations of all the document signals. Signal sets might include PageRank, clickthrough data, topicality information and [others][94].

To further complicate things, many of those signals, such as PageRank, or ones generated by [statistical language models][95] contain parameters that greatly affect the performance of a signal. Those have to be hand-tuned too.

Lately, 🔷 [learning to rank][96], signal-based discriminative supervised approaches are becoming more and more popular. Some popular examples of LtR are [McRank][97] and [LambdaRank][98] from Microsoft, and [MatrixNet][99] from Yandex.

A new, [vector space based approach][100] for semantic retrieval and ranking is gaining popularity lately. The idea is to learn individual low-dimensional vector document representations, then build a model which maps queries into the same vector space.

Then, retrieval is just finding several documents that are closest by some metric (e.g. Eucledian distance) to the query vector. Ranking is the distance itself. If the mapping of both the documents and queries is built well, the documents are chosen not by a fact of presence of some simple pattern (like a word), but how close the documents are to the query by  _meaning_ .

### Indexing pipeline operation

Usually, each of the above pieces of the pipeline must be operated on a regular basis to keep the search index and search experience current.

❗️Operating a search pipeline can be complex and involve a lot of moving pieces. Not only is the data moving through the pipeline, but the code for each module and the formats and assumptions embedded in the data will change over time.

A pipeline can be run in “batch” or based on a regular or occasional basis (if indexing speed does not need to be real time) or in a streamed way (if real-time indexing is needed) or based on certain triggers.

Some complex search engines (like Google) have several layers of pipelines operating on different time scales — for example, a page that changes often (like [cnn.com][101]) is indexed with a higher frequency than a static page that hasn’t changed in years.

### Serving systems

Ultimately, the goal of a search system is to accept queries, and use the index to return appropriately ranked results. While this subject can be incredibly complex and technical, we mention a few of the key aspects to this part of the system.

*   Performance: users notice when the system they interact with is laggy. ❗️Google has done [extensive research][19], and they have noticed that number of searches falls 0.6%, when serving is slowed by 300ms. They recommend to serve results under 200 ms for most of your queries. A good article [on the topic][20]. This is the hard part: the system needs to collect documents from, possibly, many computers, than merge them into possible a very long list and then sort that list in the ranking order. To complicate things further, ranking might be query-dependent, so, while sorting, the system is not just comparing 2 numbers, but performing computation.

*   🔷 Caching results: is often necessary to achieve decent performance. ❗️ But caches are just one large gotcha. The might show stale results when indices are updated or some results are blacklisted. Purging caches is a can of warm of itself: a search system might not have the capacity to serve the entire query stream with an empty (cold) cache, so the [cache needs to be pre-warmed][21] before the queries start arriving. Overall, caches complicate a system’s performance profile. Choosing a cache size and a replacement algorithm is also a [challenge][22].

*   Availability: is often defined by an uptime/(uptime + downtime) metric. When index is distributed, in order to serve any search results, the system often needs to query all the shards for their share of results. ❗️That means, that if one shard is unavailable, the entire search system is compromised. The more machines are involved in serving the index — the higher the probability of one of them becoming defunct and bringing the whole system down.

*   Managing multiple indices: Indices for large systems may separated into shards (pieces) or divided by media type or indexing cadence (fresh versus long-term indices). Results can then be merged.

*   Merging results of different kinds: e.g. Google showing results from Maps, News etc.

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/1600/1*M8WQu17E7SDziV0rVwUKbw.jpeg)
A human rater. Yeah, you should still have those.

### Quality, evaluation, and improvement

So you’ve launched your indexing pipeline and search servers, and it’s all running nicely. Unfortunately the road to a solid search experience only begins with running infrastructure.

Next, you’ll need to build a set of processes around continuous search quality evaluation and improvement. In fact, this is actually most of the work and the hardest problem you’ll have to solve.

🔷 What is quality? First, you’ll need to determine (and get your boss or the product lead to agree), what quality means in your case:

*   Self-reported user satisfaction (includes UX)

*   Perceived relevance of the returned results (not including UX)

*   Satisfaction relative to competitors

*   Satisfaction relative performance of the previous version of the search engine (e.g. last week)

*   [User engagement][23]

Metrics: Some of these concepts can be quite hard to quantify. On the other hand, it’s incredibly useful to be able to express how well a search engine is performing in a single number, a quality metric.

Continuously computing such a metric for your (and your competitors’) system you can both track your progress and explain how well you are doing to your boss. Here are some classical ways to quantify quality, that can help you construct your magic quality metric formula:

*   [Precision][24] and [recall][25] measure how well the retrieved set of documents corresponds to the set you expected to see.

*   [F score][26] (specifically F1 score) is a single number, that represents both precision and recall well.

*   [Mean Average Precision][27] (MAP) allows to quantify the relevance of the top returned results.

*   🔷 [Normalized Discounted Cumulative Gain][28] (nDCG) is like MAP, but weights the relevance of the result by its position.

*   [Long and short clicks][29] — Allow to quantify how useful the results are to the real users.

*   [A good detailed overview][30].

🔷 Human evaluations: Quality metrics might seem like statistical calculations, but they can’t all be done by automated calculations. Ultimately, metrics need to represent subjective human evaluation, and this is where a “human in the loop” comes into play.

❗️Skipping human evaluation is probably the most spread reason of sub-par search experiences.

Usually, at early stages the developers themselves evaluate the results manually. At later point [human raters][102] (or assessors) may get involved. Raters typically use custom tools to look at returned search results and provide feedback on the quality of the results.

Subsequently, you can use the feedback signals to guide development, help make launch decisions or even feed them back into the index selection, retrieval or ranking systems.

Here is the list of some other types of human-driven evaluation, that can be done on a search system:

*   Basic user evaluation: The user ranks their satisfaction with the whole experience

*   Comparative evaluation: Compare with other search results (compare with search results from earlier versions of the system or competitors)

*   Retrieval evaluation: The query analysis and retrieval quality is often evaluated using manually constructed query-document sets. A user is shown a query and the list of the retrieved documents. She can then mark all the documents that are relevant to the query, and the ones that are not. The resulting pairs of (query, [relevant docs]) are called a “golden set”. Golden sets are remarkably useful. For one, an engineer can set up automatic retrieval regression tests using those sets. The selection signal from golden sets can also be fed back as ground truth to term re-weighting and other query re-writing models.

*   Ranking evaluation: Raters are presented with a query and two documents side-by-side. The rater must choose the document that fits the query better. This creates a partial ordering on the documents for a given query. That ordering can be later be compared to the output of the ranking system. The usual ranking quality measures used are MAP and nDCG.

#### Evaluation datasets:

One should start thinking about the datasets used for evaluation (like “golden sets” mentioned above) early in the search experience design process. How you collect and update them? How you push them to the production eval pipeline? Is there a built-in bias?

Live experiments:

After your search engine catches on and gains enough users, you might want to start conducting [live search experiments][103] on a portion of your traffic. The basic idea is to turn some optimization on for a group of people, and then compare the outcome with that of a “control” group — a similar sample of your users that did not have the experiment feature on for them. How you would measure the outcome is, once again, very product specific: it could be clicks on results, clicks on ads etc.

Evaluation cycle time: How fast you improve your search quality is directly related to how fast you can complete the above cycle of measurement and improvement. It is essential from the beginning to ask yourself, “how fast can we measure and improve our performance?”

Will it take days, hours, minutes or seconds to make changes and see if they improve quality? ❗️Running evaluation should also be as easy as possible for the engineers and should not take too much hands-on time.

### 🔷 So… How do I PRACTICALLY build it?

This blogpost is not meant as a tutorial, but here is a brief outline of how I’d approach building a search experience right now:

1.  As was said above, if you can afford it — just buy the existing SaaS (some good ones are listed below). An existing service fits if:

*   Your experience is a “connected” one (your service or app has internet connection).

*   Does it support all the functionality you need out of box? This post gives a pretty good idea of what functions would you want. To name a few, I’d at least consider: support for the media you are searching; real-time indexing support; query flexibility, including context-dependent queries.

*   Given the size of the corpus and the expected [QpS][31], can you afford to pay for it for the next 12 months?

*   Can the service support your expected traffic within the required latency limits? In case when you are querying the service from an app, make sure that the given service is accessible quickly enough from where your users are.

2\. If a hosted solution does not fit your needs or resources, you probably want to use one of the open source libraries or tools. In case of connected apps or websites, I’d choose ElasticSearch right now. For embedded experiences, there are multiple tools below.

3\. You most likely want to do index selection and clean up your documents (say extract relevant text from HTML pages) before uploading them to the search index. This will decrease the index size and make getting to good results easier. If your corpus fits on a single machine, just write a script (or several) to do that. If not, I’d use [Spark][104].

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/1600/1*lGw4kVVQyj8E5by2GWVoQg.jpeg)
You can never have too many tools.

### ☁️ SaaS

☁️ 🔷[Algolia][105] — a proprietary SaaS that indexes a client’s website and provides an API to search the website’s pages. They also have an API to submit your own documents, support context dependent searches and serve results really fast. If I were building a web search experience right now and could afford it, I’d probably use Algolia first — and buy myself time to build a comparable search experience.

*   Various ElasticSearch providers: AWS (☁️ [ElasticSearch Cloud)][32], ☁️[elastic.co][33] and from ☁️ [Qbox][34].

*   ☁️[ Azure Search][35] — a SaaS solution from Microsoft. Accessible through a REST API, it can scale to billions of documents. Has a Lucene query interface to simplify migrations from Lucene-based solutions.

*   ☁️[ Swiftype][36] — an enterprise SaaS that indexes your company’s internal services, like Salesforce, G Suite, Dropbox and the intranet site.

### Tools and libraries

🍺☕🔷[ Lucene][106] is the most popular IR library. Implements query analysis, index retrieval and ranking. Either of the components can be replaced by an alternative implementation. There is also a C port — 🍺[Lucy][107].

*   🍺☕🔷[ Solr][37] is a complete search server, based on Lucene. It’s a part of the [Hadoop][38] ecosystem of tools.

*   🍺☕🔷[ Hadoop][39] is the most widely used open source MapReduce system, originally designed as a indexing pipeline framework for Solr. It has been gradually loosing ground to 🍺[Spark][40] as the batch data processing framework used for indexing. ☁️[EMR][41] is a proprietary implementation of MapReduce on AWS.

*   🍺☕🔷 [ElasticSearch][42] is also based on Lucene ([feature comparison with Solr][43]). It has been getting more attention lately, so much that a lot of people think of ES when they hear “search”, and for good reasons: it’s well supported, has [extensive API][44], [integrates with Hadoop][45] and [scales well][46]. There are open source and [Enterprise][47] versions. ES is also available as a SaaS on Can scale to billions of documents, but scaling to that point can be very challenging, so typical scenario would involve orders of magnitude smaller corpus.

*   🍺🇨 [Xapian][48] — a C++-based IR library. Relatively compact, so good for embedding into desktop or mobile applications.

*   🍺🇨 [Sphinx][49] — an full-text search server. Has a SQL-like query language. Can also act as a [storage engine for MySQL][50] or used as a library.

*   🍺☕ [Nutch][51] — a web crawler. Can be used in conjunction with Solr. It’s also the tool behind [🍺Common Crawl][52].

*   🍺🦏 [Lunr][53] — a compact embedded search library for web apps on the client-side.

*   🍺🦏 [searchkit][54] — a library of web UI components to use with ElasticSearch.

*   🍺🦏 [Norch][55] — a [LevelDB][56]-based search engine library for Node.js.

*   🍺🐍 [Whoosh][57] — a fast, full-featured search library implemented in pure Python.

*   OpenStreetMaps has it’s own 🍺[deck of search software][58].

### Datasets

A few fun or useful data sets to try building a search engine or evaluating search engine quality:

*   🍺🔷 [Commoncrawl][59] — a regularly-updated open web crawl data. There is a [mirror on AWS][60], accessible for free within the service.

*   🍺🔷 [Openstreetmap data dump][61] is a very rich source of data for someone building a geospacial search engine.

*   🍺 [Google Books N-grams][62] can be very useful for building language models.

*   🍺 [Wikipedia dumps][63] are a classic source to build, among other things, an entity graph out of. There is a [wide range of helper tools][64] available.

*   [IMDb dumps][65] are a fun dataset to build a small toy search engine for.

### References

*   [Modern Information Retrieval][66] by R. Baeza-Yates and B. Ribeiro-Neto is a good, deep academic treatment of the subject. This is a good overview for someone completely new to the topic.

*   [Information Retrieval][67] by S. Büttcher, C. Clarke and G. Cormack is another academic textbook with a wide coverage and is more up-to-date. Covers learn-to-rank and does a pretty good job at discussing theory of search systems evaluation. Also is a good overview.

*   [Learning to Rank][68] by T-Y Liu is a best theoretical treatment of LtR. Pretty thin on practical aspects though. Someone considering building an LtR system should probably check this out.

*   [Managing Gigabytes][69] — published in 1999, is still a definitive reference for anyone embarking on building an efficient index of a significant size.

*   [Text Retrieval and Search Engines][70] — a MOOC from Coursera. A decent overview of basics.

*   [Indexing the World Wide Web: The Journey So Far][71] ([PDF][72]), an overview of web search from 2012, by Ankit Jain and Abhishek Das of Google.

*   [Why Writing Your Own Search Engine is Hard][73] a classic article from 2004 from Anna Patterson.

*   [https://github.com/harpribot/awesome-information-retrieval][74] — a curated list of search-related resources.

*   A [great blog][75] on everything search by [Daniel Tunkelang][76].

*   Some good slides on [search engine evaluation][77].

This concludes my humble attempt to make a somewhat-useful “map” for an aspiring search engine engineer. Did I miss something important? I’m pretty sure I did — you know, [the margin is too narrow][108] to contain this enormous topic. Let me know if you think that something should be here and is not — you can reach [me][109] at[ forwidur@gmail.com][110] or at [@forwidur][111].

> P.S. — This post is part of a open, collaborative effort to build an online reference, the Open Guide to Practical AI, which we’ll release in draft form soon. See [this popular guide][112] for an example of what’s coming. If you’d like to get updates on or help with with this effort, sign up [here][113].

> Special thanks to [Joshua Levy][114], [Leo Polovets][115] and [Abhishek Das][116] for reading drafts of this and their invaluable feedback!

> Header image courtesy of [Mickaël Forrett][117]. The beautiful toolbox is called [The Studley Tool Chest][118].

--------------------------------------------------------------------------------

作者简介：

Max Grigorev
distributed systems, data, AI

-------------


via: https://medium.com/startup-grind/what-every-software-engineer-should-know-about-search-27d1df99f80d

作者：[Max Grigorev][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@forwidur?source=post_header_lockup
[1]:https://en.wikipedia.org/wiki/Inverted_index
[2]:http://www.demarcken.org/carl/papers/ITA-software-travel-complexity/ITA-software-travel-complexity.pdf
[3]:https://www.algolia.com/
[4]:https://en.wikipedia.org/wiki/Stemming
[5]:https://en.wikipedia.org/wiki/Named-entity_recognition
[6]:http://ilpubs.stanford.edu:8090/422/1/1999-66.pdf
[7]:https://gofishdigital.com/semantic-topic-modeling/
[8]:https://nlp.stanford.edu/IR-book/html/htmledition/postings-file-compression-1.html
[9]:https://deplinenoise.wordpress.com/2013/03/31/fast-mmapable-data-structures/
[10]:https://en.wikipedia.org/wiki/Log-structured_merge-tree
[11]:http://orion.lcg.ufrj.br/Dr.Dobbs/books/book5/chap11.htm
[12]:http://norvig.com/spell-correct.html
[13]:http://nlp.stanford.edu/IR-book/html/htmledition/query-expansion-1.html
[14]:https://www.iro.umontreal.ca/~nie/IFT6255/carpineto-Survey-QE.pdf
[15]:https://en.wikipedia.org/wiki/Named-entity_recognition
[16]:http://www.aclweb.org/anthology/P02-1060
[17]:https://en.wikipedia.org/wiki/Personalized_search
[18]:http://searchengineland.com/future-search-engines-context-217550
[19]:http://services.google.com/fh/files/blogs/google_delayexp.pdf
[20]:http://highscalability.com/latency-everywhere-and-it-costs-you-sales-how-crush-it
[21]:https://stackoverflow.com/questions/22756092/what-does-it-mean-by-cold-cache-and-warm-cache-concept
[22]:https://en.wikipedia.org/wiki/Cache_performance_measurement_and_metric
[23]:http://blog.popcornmetrics.com/5-user-engagement-metrics-for-growth/
[24]:https://en.wikipedia.org/wiki/Information_retrieval#Precision
[25]:https://en.wikipedia.org/wiki/Information_retrieval#Recall
[26]:https://en.wikipedia.org/wiki/F1_score
[27]:http://fastml.com/what-you-wanted-to-know-about-mean-average-precision/
[28]:https://en.wikipedia.org/wiki/Discounted_cumulative_gain
[29]:http://www.blindfiveyearold.com/short-clicks-versus-long-clicks
[30]:https://arxiv.org/pdf/1302.2318.pdf
[31]:https://en.wikipedia.org/wiki/Queries_per_second
[32]:https://aws.amazon.com/elasticsearch-service/
[33]:https://www.elastic.co/
[34]:https://qbox.io/
[35]:https://azure.microsoft.com/en-us/services/search/
[36]:https://swiftype.com/
[37]:http://lucene.apache.org/solr/
[38]:http://hadoop.apache.org/
[39]:http://hadoop.apache.org/
[40]:http://spark.apache.org/
[41]:https://aws.amazon.com/emr/
[42]:https://www.elastic.co/products/elasticsearch
[43]:http://solr-vs-elasticsearch.com/
[44]:https://www.elastic.co/guide/en/elasticsearch/reference/current/docs.html
[45]:https://github.com/elastic/elasticsearch-hadoop
[46]:https://www.elastic.co/guide/en/elasticsearch/guide/current/distributed-cluster.html
[47]:https://www.elastic.co/cloud/enterprise
[48]:https://xapian.org/
[49]:http://sphinxsearch.com/
[50]:https://mariadb.com/kb/en/mariadb/sphinx-storage-engine/
[51]:https://nutch.apache.org/
[52]:http://commoncrawl.org/
[53]:https://lunrjs.com/
[54]:https://github.com/searchkit/searchkit
[55]:https://github.com/fergiemcdowall/norch
[56]:https://github.com/google/leveldb
[57]:https://bitbucket.org/mchaput/whoosh/wiki/Home
[58]:http://wiki.openstreetmap.org/wiki/Search_engines
[59]:http://commoncrawl.org/
[60]:https://aws.amazon.com/public-datasets/common-crawl/
[61]:http://wiki.openstreetmap.org/wiki/Downloading_data
[62]:http://commondatastorage.googleapis.com/books/syntactic-ngrams/index.html
[63]:https://dumps.wikimedia.org/
[64]:https://www.mediawiki.org/wiki/Alternative_parsers
[65]:http://www.imdb.com/interfaces
[66]:https://www.amazon.com/dp/0321416910
[67]:https://www.amazon.com/dp/0262528878/
[68]:https://www.amazon.com/dp/3642142664/
[69]:https://www.amazon.com/dp/1558605703
[70]:https://www.coursera.org/learn/text-retrieval
[71]:https://research.google.com/pubs/pub37043.html
[72]:https://pdfs.semanticscholar.org/28d8/288bff1b1fc693e6d80c238de9fe8b5e8160.pdf
[73]:http://queue.acm.org/detail.cfm?id=988407
[74]:https://github.com/harpribot/awesome-information-retrieval
[75]:https://medium.com/@dtunkelang
[76]:https://www.cs.cmu.edu/~quixote/
[77]:https://web.stanford.edu/class/cs276/handouts/lecture8-evaluation_2014-one-per-page.pdf
[78]:https://stackoverflow.com/questions/34314/how-do-i-implement-search-functionality-in-a-website
[79]:https://www.quora.com/How-to-build-a-search-engine-from-scratch
[80]:https://github.com/isaacs/github/issues/908
[81]:https://www.reddit.com/r/Windows10/comments/4jbxgo/can_we_talk_about_how_bad_windows_10_search_sucks/d365mce/
[82]:https://www.reddit.com/r/spotify/comments/2apwpd/the_search_function_sucks_let_me_explain/
[83]:https://medium.com/@RohitPaulK/github-issues-suck-723a5b80a1a3#.yp8ui3g9i
[84]:https://thenextweb.com/opinion/2016/01/11/netflix-search-sucks-flixed-fixes-it/
[85]:https://www.google.com/search?q=building+a+search+engine
[86]:http://airweb.cse.lehigh.edu/2005/gyongyi.pdf
[87]:https://www.researchgate.net/profile/Gabriel_Sanchez-Perez/publication/262371199_Explicit_image_detection_using_YCbCr_space_color_model_as_skin_detection/links/549839cf0cf2519f5a1dd966.pdf
[88]:https://en.wikipedia.org/wiki/Locality-sensitive_hashing
[89]:https://en.wikipedia.org/wiki/Similarity_measure
[90]:https://www.microsoft.com/en-us/research/wp-content/uploads/2011/02/RadlinskiBennettYilmaz_WSDM2011.pdf
[91]:http://infolab.stanford.edu/~ullman/mmds/ch3.pdf
[92]:https://en.wikipedia.org/wiki/Inverted_index
[93]:https://en.wikipedia.org/wiki/Natural_language_processing
[94]:http://backlinko.com/google-ranking-factors
[95]:http://times.cs.uiuc.edu/czhai/pub/slmir-now.pdf
[96]:https://en.wikipedia.org/wiki/Learning_to_rank
[97]:https://papers.nips.cc/paper/3270-mcrank-learning-to-rank-using-multiple-classification-and-gradient-boosting.pdf
[98]:https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/lambdarank.pdf
[99]:https://yandex.com/company/technologies/matrixnet/
[100]:https://arxiv.org/abs/1708.02702
[101]:http://cnn.com/
[102]:http://static.googleusercontent.com/media/www.google.com/en//insidesearch/howsearchworks/assets/searchqualityevaluatorguidelines.pdf
[103]:https://googleblog.blogspot.co.uk/2008/08/search-experiments-large-and-small.html
[104]:https://spark.apache.org/
[105]:https://www.algolia.com/
[106]:https://lucene.apache.org/
[107]:https://lucy.apache.org/
[108]:https://www.brainyquote.com/quotes/quotes/p/pierredefe204944.html
[109]:https://www.linkedin.com/in/grigorev/
[110]:mailto:forwidur@gmail.com
[111]:https://twitter.com/forwidur
[112]:https://github.com/open-guides/og-aws
[113]:https://upscri.be/d29cfe/
[114]:https://twitter.com/ojoshe
[115]:https://twitter.com/lpolovets
[116]:https://www.linkedin.com/in/abhishek-das-3280053/
[117]:https://www.behance.net/gallery/3530289/-HORIZON-
[118]:https://en.wikipedia.org/wiki/Henry_O._Studley
