[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Notes on building SQL exercises)
[#]: via: (https://jvns.ca/blog/2019/09/30/notes-on-building-sql-exercises/)
[#]: author: (Julia Evans https://jvns.ca/)

Notes on building SQL exercises
======

In the last couple of weeks I’ve been working on some interactive SQL exercises to help people get better at writing SQL queries. This is a pretty new thing for me so I thought I’d write a few notes about my process so far!

### why SQL is exciting: distributed SQL engines

To me the reason why SQL is exciting is that a lot of companies are storing their data in distributed SQL databases (Google BigQuery, Amazon Redshift, Spark SQL, Presto, etc) that let you run a complicated query across a billion rows pretty quickly! They’re fast partly because they’re designed to run your query across possibly tens or hundreds of computers.

At my last job I wrote thousands of SQL queries to do data analysis while I was working on the machine learning team, mostly ad hoc queries to answer questions I had about our data. I learned a lot of fun tricks to make them faster / easier to write and I’ve never really talked about it!

So I think SQL is a really nice way to go from “I have this sort of complicated question about billions of rows of data” to “ok, that’s the answer, great, I can move on”.

### why write exercises: knowledge != skills

This is the first time I’m really trying in earnest to write exercises to teach something, instead of just explanations of the thing. The reason I’m doing this is that I read [Design for how people learn][1] by Julie Dirksen and she makes the point that **knowledge** is different from **skills**.

She defines a “skill” as “something you have to practice”. And SQL is definitely something that you have to practice if you want to learn it! So I thought – SQL is a relatively simple skill (as programming/programming-adjacent skills go!), maybe I can make something interactive and relatively simple to help people improve their SQL skills!

It’s also, well, a challenge, and I like trying things I haven’t tried before.

### how I’m doing it: start with a challenge

I started out doing these SQL exercises in kind of the obvious way: start out with easy exercises, and then make them harder and harder over time to introduce new concepts. But when I watched people trying it out, I noticed a problem – a lot of people already **know** some SQL, and sometimes they would go through all the exercises without learning anything at all! That’s no fun!

So I came up with a different structure for each section of the SQL exercises:

  1. Start with a “challenge” that tests the skill the section is trying to teach.
  2. If the challenge is too hard, move on to a bunch of easier exercises that teach you the skills you need to solve the challenge.



Since showing is easier than explaining: [here’s a draft of a page teaching GROUP BY][2]. Here’s a screenshot of what the initial “challenge” for basic group by looks like:

<https://jvns.ca/images/aggregation-challenge.png>

I think that challenge in particular isn’t very good yet (I have a lot of work to do!) but that’s the idea.

### how I’m getting feedback: anonymously track responses

Early on I also realized that I needed to get feedback about which challenges people were finding hard / easy. Every time someone runs a query, I track

  * a randomly generated UUID for the person doing the challenge (like `f139a44c-ef09-43d2-8d7d-cabba9c28aa1`)
  * the query they ran
  * the puzzle they were solving



I’ve already learned a lot from this, for example:

  * at first I required that the column names match, but it resulted in a lot of people getting the “wrong” answer for no good reason, so I removed that requirement
  * when I’m not clear about how the results should be ordered, often people end up with the right answer except in the “wrong” order. Still need to do something about that.
  * if I don’t explain the syntax for `COUNT(DISTINCT col)`, some people end up using the wrong syntax and getting stuck
  * in the joins exercise, some people get stuck on join order. (they do `x LEFT join y` instead of `y LEFT JOIN x` and then don’t get the right answer)



So basically (in addition to making more exercises) I think I need to spend more time cataloguing where/how people are getting stuck in practice and helping make sure fewer people get stuck.

### the tech stack

To build this, I’m using:

  * [sql.js][3] to run the SQL queries in the browser with SQLite (there’s no server, it’s all done in the browser, so nobody can take down the server by running really expensive queries :) )
  * [firestore][4] to store the queries people are trying out
  * [vue.js][5] to manage Javascript components
  * [typescript][6] to compensate a bit for my lack of Javascript experience and help me refactor my code more easily
  * [tailwind css][7] for CSS



I also bought the [Refactoring UI][8] book to try to improve my web design skills a tiny bit. I think it’s helped a little so far.

Vue components let me really easily add new challenges/exercises to a page like this:

```
<Puzzle
   id="count-the-owners"
   title='Count the number of different cat owners'
   description="
   You can use <code>COUNT(DISTINCT column)</code> to count distinct values of a column. (you can also do <code>SUM(DISTINCT column)</code> or <code>AVG(DISTINCT column)</code> but I'm not sure why that would be useful.
   "
   answer= "
   SELECT count(distinct(owner)) AS num_owners
   from cats
   "
   v-bind:table_names='["cats"]'
   >
</Puzzle>
```

### the goal: make something that’s worth $100 or so

What I’m working towards is making exercises &amp; challenges that would help someone with beginner/intermediate SQL skills improve their SQL fluency enough that it’d easily be worth $100 to them. We’ll see if I can get there! I don’t know whether I’ll price it at $100, but that’s my goal for how useful it should be.

The person I have in mind is sort of (as usual) myself 6 years ago, when I’d _heard_ of SQL and could write a basic query but if you gave me a table of VERY INTERESTING DATA I couldn’t really effectively use SQL to answer the questions I had about it.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/09/30/notes-on-building-sql-exercises/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://www.amazon.com/Design-People-Learn-Voices-Matter/dp/0321768434
[2]: https://joins-238123.netlify.com/aggregations/
[3]: https://github.com/kripken/sql.js
[4]: https://firebase.google.com/docs/firestore
[5]: https://vuejs.org
[6]: https://www.typescriptlang.org/
[7]: https://tailwindcss.com/
[8]: https://refactoringui.com/
