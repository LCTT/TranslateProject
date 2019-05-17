[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Querying 10 years of GitHub data with GHTorrent and Libraries.io)
[#]: via: (https://opensource.com/article/19/5/chaossearch-github-ghtorrent)
[#]: author: (Pete Cheslock https://opensource.com/users/petecheslock/users/ghaff/users/payalsingh/users/davidmstokes)

Querying 10 years of GitHub data with GHTorrent and Libraries.io
======
There is a way to explore GitHub data without any local infrastructure
using open source datasets.
![magnifying glass on computer screen][1]

I’m always on the lookout for new datasets that we can use to show off the power of my team's work. [**CHAOS** SEARCH][2] turns your [Amazon S3][3] object storage data into a fully searchable [Elasticsearch][4]-like cluster. With the Elasticsearch API or tools like [Kibana][5], you can then query whatever data you find.

I was excited when I found the [GHTorrent][6] project to explore. GHTorrent aims to build an offline version of all data available through the GitHub APIs. If datasets are your thing, this is a project worth checking out or even consider [donating one of your GitHub API keys][7].

### Accessing GHTorrent data

There are many ways to gain access to and use [GHTorrent’s data][8], which is available in [NDJSON][9]** **format. This project does a great job making the data available in multiple forms, including[CSV][10] for restoring into a [MySQL][11] database, [MongoDB][12] dumps of all objects, and Google Big Query** **(free) for exporting data directly into Google’s object storage. There is one caveat: this dataset has a nearly complete dataset from 2008 to 2017 but is not as complete from 2017 to today. That will impact our ability to query with certainty, but it is still an exciting amount of information.

I chose Google Big Query to avoid running any database myself, so I was quickly able to download a full corpus of data including users and projects. **CHAOS** SEARCH can natively analyze the NDJSON format, so after uploading the data to Amazon S3 I was able to index it in just a few minutes. The **CHAOS** SEARCH platform doesn’t require users to set up index schemas or define mappings for their data, so it discovered all of the fields—strings, integers, etc.—itself.

With my data fully indexed and ready for search and aggregation, I wanted to dive in and see what insights we can learn, like which software languages are the most popular for GitHub projects.

(A note on formatting: this is a valid JSON query that we won't format correctly here to avoid scroll fatigue. To properly format it, you can copy it locally and send to a command-line utility like [jq][13].)


```
`{"aggs":{"2":{"date_histogram":{"field":"root.created_at","interval":"1M","time_zone":"America/New_York","min_doc_count":1}}},"size":0,"_source":{"excludes":[]},"stored_fields":["*"],"script_fields":{},"docvalue_fields":["root.created_at","root.updated_at"],"query":{"bool":{"must":[],"filter":[{"match_all":{}}],"should":[],"must_not":[{"match_phrase":{"root.language":{"query":""}}}]}}}`
```

This result is of little surprise to anyone who’s followed the state of open source languages over recent years.

![Which software languages are the most popular on GitHub.][14]

[JavaScript][15] is still the reigning champion, and while some believe JavaScript is on its way out, it remains the 800-pound gorilla and is likely to remain that way for some time. [Java][16] faces similar rumors and this data shows that it's a major part of the open source ecosystem.

Given the popularity of projects like [Docker][17] and [Kubernetes][18], you might be wondering, “What about Go ([Golang][19])?” This is a good time for a reminder that the GitHub dataset discussed here contains some gaps, most significantly after 2017, which is about when I saw Golang projects popping up everywhere. I hope to repeat this search with a complete GitHub dataset and see if it changes the rankings at all.

Now let's explore the rate of project creation. (Reminder: this is valid JSON consolidated for readability.)


```
`{"aggs":{"2":{"date_histogram":{"field":"root.created_at","interval":"1M","time_zone":"America/New_York","min_doc_count":1}}},"size":0,"_source":{"excludes":[]},"stored_fields":["*"],"script_fields":{},"docvalue_fields":["root.created_at","root.updated_at"],"query":{"bool":{"must":[],"filter":[{"match_all":{}}],"should":[],"must_not":[{"match_phrase":{"root.language":{"query":""}}}]}}}`
```

Seeing the rate at which new projects are created would be fun impressive as well, with tremendous growth starting around 2012:

![The rate at which new projects are created on GitHub.][20]

Now that I knew the rate of projects created as well as the most popular languages used to create these projects, I wanted to find out what open source licenses these projects chose. Unfortunately, this data doesn’t exist in the GitHub projects dataset, but the fantastic team over at [Tidelift][21] publishes a detailed list of GitHub projects, licenses used, and other details regarding the state of open source software in their [Libraries.io][22][ data][23]. Ingesting this dataset into **CHAOS** SEARCH took just minutes, letting me see which open source software licenses are the most popular on GitHub:

(Reminder: this is valid JSON consolidated for readability.)


```
`{"aggs":{"2":{"terms":{"field":"Repository License","size":10,"order":{"_count":"desc"}}}},"size":0,"_source":{"excludes":[]},"stored_fields":["*"],"script_fields":{},"docvalue_fields":["Created Timestamp","Last synced Timestamp","Latest Release Publish Timestamp","Updated Timestamp"],"query":{"bool":{"must":[],"filter":[{"match_all":{}}],"should":[],"must_not":[{"match_phrase":{"Repository License":{"query":""}}}]}}}`
```

The results show some significant outliers:

![Which open source software licenses are the most popular on GitHub.][24]

As you can see, the [MIT license][25] and the [Apache 2.0 license][26] by far outweighs most of the other open source licenses used for these projects, while [various BSD and GPL licenses][27] follow far behind. I can’t say that I’m surprised by these results given GitHub’s open model. I would guess that users, not companies, create most projects and that they use the MIT license to make it simple for other people to use, share, and contribute. That Apache 2.0** **licensing is right behind also makes sense, given just how many companies want to ensure their trademarks are respected and have an open source component to their businesses.

Now that I identified the most popular licenses, I was curious to see the least used ones. By adjusting my last query, I reversed the top 10 into the bottom 10 and was able to find just two projects using the [University of Illinois—NCSA Open Source License][28]. I had never heard of this license before, but it’s pretty close to Apache 2.0. It’s interesting to see just how many different software licenses are in use across all GitHub projects.

![The University of Illinois/NCSA open source license.][29]

The University of Illinois/NCSA open source license.

After that, I dove into a specific language (JavaScript) to see the most popular license used there. (Reminder: this is valid JSON consolidated for readability.)


```
`{"aggs":{"2":{"terms":{"field":"Repository License","size":10,"order":{"_count":"desc"}}}},"size":0,"_source":{"excludes":[]},"stored_fields":["*"],"script_fields":{},"docvalue_fields":["Created Timestamp","Last synced Timestamp","Latest Release Publish Timestamp","Updated Timestamp"],"query":{"bool":{"must":[{"match_phrase":{"Repository Language":{"query":"JavaScript"}}}],"filter":[{"match_all":{}}],"should":[],"must_not":[{"match_phrase":{"Repository License":{"query":""}}}]}}}`
```

There were some surprises in this output.

![The most popular open source licenses used for GitHub JavaScript projects.][30]

Even though the default license for [NPM][31] modules when created with **npm init **is the one from [Internet Systems Consortium (ISC)][32], you can see that a considerable number of these projects use MIT as well as Apache 2.0 for their open source license.

Since the Libraries.io dataset is rich in open source project content, and since the GHTorrent data is missing the last few years’ data (and thus missing any details about Golang projects), I decided to run a similar query to see how Golang projects license their code.

(Reminder: this is valid JSON consolidated for readability.)


```
`{"aggs":{"2":{"terms":{"field":"Repository License","size":10,"order":{"_count":"desc"}}}},"size":0,"_source":{"excludes":[]},"stored_fields":["*"],"script_fields":{},"docvalue_fields":["Created Timestamp","Last synced Timestamp","Latest Release Publish Timestamp","Updated Timestamp"],"query":{"bool":{"must":[{"match_phrase":{"Repository Language":{"query":"Go"}}}],"filter":[{"match_all":{}}],"should":[],"must_not":[{"match_phrase":{"Repository License":{"query":""}}}]}}}`
```

The results were quite different than Javascript.

![How Golang projects license their GitHub code.][33]

Golang offers a stunning reversal from JavaScript—nearly three times as many Golang projects are licensed with Apache 2.0 over MIT. While it’s hard precisely explain why this is the case, over the last few years there’s been massive growth in Golang, especially among companies building projects and software offerings, both open source and commercially.

As we learned above, many of these companies want to enforce their trademarks, thus the move to the Apache 2.0 license makes sense.

#### Conclusion

In the end, I found some interesting results by diving into the GitHub users and projects data dump. Some of these I definitely would have guessed, but a few results were surprises to me as well, especially the outliers like the rarely-used NCSA license.

All in all, you can see how quickly and easily the **CHAOS** SEARCH platform lets us find complicated answers to interesting questions. I dove into this dataset and received deep analytics without having to run any databases myself, and even stored the data inexpensively on Amazon S3—so there’s little maintenance involved. Now I can ask any other questions regarding the data anytime I want.

What other questions are you asking your data, and what data sets do you use? Let me know in the comments or on Twitter [@petecheslock][34].

_A version of this article was originally posted on[ **CHAOS** SEARCH][35]._

* * *

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/chaossearch-github-ghtorrent

作者：[Pete Cheslock][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/petecheslock/users/ghaff/users/payalsingh/users/davidmstokes
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_issue_bug_programming.png?itok=XPrh7fa0 (magnifying glass on computer screen)
[2]: https://chaossearch.io/
[3]: https://aws.amazon.com/s3/
[4]: https://www.elastic.co/
[5]: https://www.elastic.co/products/kibana
[6]: http://ghtorrent.org
[7]: http://ghtorrent.org/services.html
[8]: http://ghtorrent.org/downloads.html
[9]: http://ndjson.org
[10]: https://en.wikipedia.org/wiki/Comma-separated_values
[11]: https://en.wikipedia.org/wiki/MySQL
[12]: https://www.mongodb.com/
[13]: https://stedolan.github.io/jq/
[14]: https://opensource.com/sites/default/files/uploads/github-1_500.png (Which software languages are the most popular on GitHub.)
[15]: https://en.wikipedia.org/wiki/JavaScript
[16]: /resources/java
[17]: /resources/what-docker
[18]: /resources/what-is-kubernetes
[19]: https://golang.org/
[20]: https://opensource.com/sites/default/files/uploads/github-2_500.png (The rate at which new projects are created on GitHub.)
[21]: https://tidelift.com
[22]: http://libraries.io/
[23]: https://libraries.io/data
[24]: https://opensource.com/sites/default/files/uploads/github-3_500.png (Which open source software licenses are the most popular on GitHub.)
[25]: https://opensource.org/licenses/MIT
[26]: https://opensource.org/licenses/Apache-2.0
[27]: https://opensource.org/licenses
[28]: https://tldrlegal.com/license/university-of-illinois---ncsa-open-source-license-(ncsa)
[29]: https://opensource.com/sites/default/files/uploads/github-4_500_0.png (The University of Illinois/NCSA open source license.)
[30]: https://opensource.com/sites/default/files/uploads/github-5_500_0.png (The most popular open source licenses used for GitHub JavaScript projects.)
[31]: https://www.npmjs.com/
[32]: https://en.wikipedia.org/wiki/ISC_license
[33]: https://opensource.com/sites/default/files/uploads/github-6_500.png (How Golang projects license their GitHub code.)
[34]: https://twitter.com/petecheslock
[35]: https://chaossearch.io/blog/where-are-the-github-users-part-1/
