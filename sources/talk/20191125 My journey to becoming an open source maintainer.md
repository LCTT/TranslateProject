[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My journey to becoming an open source maintainer)
[#]: via: (https://opensource.com/article/19/11/journey-open-source-maintainer)
[#]: author: (Juliano Alves https://opensource.com/users/juliano)

My journey to becoming an open source maintainer
======
Hacktoberfest got me thinking. My first contribution to open source was
challenging, but everything I've learned since then has made me a better
developer.
![Guy on a laptop on a building][1]

[Hacktoberfest][2] is an initiative that invites developers from around the world to participate and contribute to open source. This is the second year in a row that I participated to completion of the challenge, and I was so inspired by it that I want to share my slightly longer journey to open source software.

### A long time ago, in a galaxy far, far away…

The year was 2010. The universe made its move to make me cross paths with my good friend, [Jonas Abreu][3]. Jonas is the creator of [Mirror][4], a simple domain-specific language (DSL) layer over the Java Reflection API, which makes [meta-programming][5] easier. There was a feature request open for a proxy creation capability, and Jonas asked me if I was interested in implementing it. I accepted the challenge.

I suffered for three days, dealing with code that I didn’t understand… until I did. I still remember the feeling that my triumph brought me that day. That pain was knowledge invading my brain!

This code was my first contribution to open source. I took quite a lot away from my experience contributing to Mirror:

  * A lot about Java meta-programming
  * The concept of proxy classes
  * [Javassist][6] and [cglib][7] frameworks
  * How to receive and provide useful and respectful feedback
  * How to design a tool that will be used by others
  * Some interesting [dark magic][8]



Most importantly, I took away a sense of purpose. I love the idea of contributing to the greater good while challenging myself and working with brilliant engineers who were way smarter than me.

### Exploring ways to contribute to open source

I started taking part in community initiatives, like running coding dojos. While doing this, I met more great devs, and we started a small group. At some point, that group decided to learn Scala. We studied and coded together, and eventually started [Scaladores][9], the Scala user group of São Paulo.

Eventually, Jonas started talking about a different approach for learning, called [deliberate practice][10].

> _What if we could put all this recently acquired knowledge altogether?_

The resulting project from studying this practice is [Aprenda][11], a learning platform that mixes gamification and deliberate practice to make it easier to learn HTML, regular expressions, or Git. Building something this significant felt like leveling up in my pursuit of open source contribution. I also found that I picked up more knowledge about programming and practices to motivate both others and myself. 

As much as I enjoyed this pursuit, I couldn’t dedicate a lot of time to this project. At the same time as I was making progress on Aprenda, I had to shift focus to a new job.

### Contributing through my own Ruby gem

My new work had me in a common pattern: Every problem was solved by writing code that creates, reads, updates, or deletes data (CRUD). It gave me an idea, so I started a new project. I wanted to generate code the same way Ruby on Rails, a powerful web framework, allowed me to set up an environment with a simple command: **rails g scaffold**. Using [Thor][12], the same gem that powers Rails generators, I created [Spring MVC Scaffold][13]. Now, any time I needed to create a CRUD I typed:


```
$ springmvc scaffold product name:string value:double active:boolean
```

The code I wrote reducing the work my team had to do to get their job done, and I shared it further by posting it publicly. Here are some of the highlights of what I learned:

  * Generating code and files with Thor
  * Defining commands for a CLI
  * Organizing Ruby lib code
  * Creating a Ruby gem
  * Building projects with [Travis CI][14]
  * Publishing to RubyGems



> _After solving a common problem, think about making that solution available. Most likely, other people have similar problems._

Even though it’s not being maintained anymore, Spring MVC Scaffold is still available on [RubyGems][15]. And I tell you what, after that project, I went to work in a tech environment full of problems.

### Shifting technology

My new work required a shift in languages. I started working with Microsoft .NET, and I found issues that other communities had already solved. That recognition excited me because I knew it was my opportunity. My new opportunity to contribute came in the form of porting those solutions.

#### Selenia

[Selenium][16] is the dominate way to programmatically interact with websites as if the code is a "real" user (accessing it via a web browser). The API has always been too complex in my opinion. So I built a tool, we called Selenia, that could be used to write concise UI tests in C#, so instead of using:


```
IWebDriver driver;
ChromeOptions options = [new][17] ChromeOptions();
options.addExtensions([new][17] File("/path/to/extension.crx"));
ChromeDriver driver = [new][17] ChromeDriver(options);
driver = [new][17] ChromeDriver();
driver.Navigate().GoToUrl("<http://www.google.com/ncr>");

IWebElement query = driver.FindElement(By.Name("q"));
query.SendKeys("Selenium");
query.Submit();

driver.Quit();
```

We can write as:


```
Open("<http://www.google.com/>");
S(By.Name("q").Value("Selenia").Enter();
```

Selenium users may have a question at this point. If you are wondering, the answer is "no." It’s not necessary to close the driver yourself.

#### Designing for immutability with Ioget

Immutability, which means never changing an object that already exists, makes a developer’s life easy. This opinion is a newer one, however. Back in the day, ASP.NET MVCs would recommend updating information in place. The only way to instantiate objects was via **setters**.

I built [Ioget][18] to help with unmarshalling request parameters in web applications. HTTP request parameters are strings, so Ioget looks for the best way to parse those params according to the given class, instantiating objects via their constructors and therefore making them immutable.

I published this project publicly to NuGet, but I never managed to integrate Ioget with ASP.NET like I intended to. I stopped working with Microsoft technology, and thus this project fell behind from its once lofty goals.

Continuing with my deliberate practice, I kept track of the lessons learned along the way.

  * [Reification][19]
  * ASP.NET MVC internals
  * Monad implementation
  * .NET framework internals



I also took note of a pattern I used with Selenia. I really like this snippet, which I used to close the driver:


```
private void MarkForAutoClose(IWebDriver driver) =&gt;
  AppDomain.CurrentDomain.DomainUnload += (s, e) =&gt; driver.Quit();
```

### Contributing to Quill

I moved to London in 2016, which paused my contributions for a while. Eventually, I watched a talk by [Gustavo Amigo][20] about his project, [quill-pgsql][21], which is an extension to support PostgreSQL data types with [Quill][22]. He mentioned that this project was in its early moments, which meant it was ideal for someone to join, and I was interested in writing in Scala. After a few pull requests, I decided to contribute to the main project.

Quill transforms regular collection-like code into SQL queries in compile-time. I consider it the most challenging (and interesting) project I have ever contributed to. It’s been a few years since I started, and today I am [one of the maintainers][23].

Here’s what I learned by working on Quill:

  * Abstract syntax trees (AST)
  * The Dark Arts (also known as [Scala macros][24])
  * How to make code extensible via [implicits][25]
  * Exclusive and weird [SQL rules][26]



Quill has a module called quill-async, which uses [an asynchronous database driver][27] that is no longer maintained. Quill’s creator, [Flavio Brasil][28], suggested that we could write a new async driver. That’s how [Non-Blocking Database Connectivity (NDBC)][29] got started.

NDBC is a fully async alternative to Java Database Connectivity (JDBC). Its architecture was designed to provide high-performance, non-blocking connectivity to the database on top of [Trane.io Futures][30] and [Netty 4][31]:


```
// Create a Config with an Embedded Postgres
Config config = Config.create("io.trane.ndbc.postgres.netty4.DataSourceSupplier", "localhost", 0, "user")
                      .database("test_schema")
                      .password("test")
                      .embedded("io.trane.ndbc.postgres.embedded.EmbeddedSupplier");

// Create a DataSource
DataSource&lt;[PreparedStatement][32], Row&gt; ds = DataSource.fromConfig(config);

// Define a timeout
Duration timeout = Duration.ofSeconds(10);

// Send a query to the db defining a timeout and receiving back a List
List&lt;Row&gt; rows = ds.query("SELECT 1 AS value").get(timeout);

// iterate over awesome strongly typed rows
rows.forEach(row -&gt; [System][33].out.println(row.getLong("value")));
```

More knowledge was acquired along the way:

  * Understanding binary protocols
  * Using Netty 4
  * Weaknesses of the Java type system
  * Fully implementing functional structures



That’s where I am at the moment. I divide my attention between Quill and NDBC, trying to make them work together.

### Plans for the future

The contributions I have in mind for the near future are implementing:

  * Array support in [Finagle Postgres][34]
  * A Clojure wrapper for NDBC
  * A ndbc-spring module
  * A CLI in [Rust][35]



I now have almost 10 years of open source in my journey, and it taught me something extremely valuable: Open source is about sharing knowledge. When I am solving an issue, I am acquiring knowledge. When I send a pull request, I am spreading that knowledge. Knowledge brings more knowledge!

I strongly recommend that you become part of the open source community. It can be difficult, especially in the beginning, but everything you will learn will make you a better developer. I promise.

> _Open source is about sharing knowledge. When I am solving an issue, I am acquiring knowledge. When I send a pull request, I am spreading that knowledge. Knowledge brings more knowledge!_

_This article was originally posted on [Juliano Alves' Programming Blog][36]. It has been edited for style and clarity._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/journey-open-source-maintainer

作者：[Juliano Alves][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/juliano
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Guy on a laptop on a building)
[2]: https://hacktoberfest.digitalocean.com/
[3]: https://twitter.com/jonasabreu
[4]: http://projetos.vidageek.net/mirror/mirror/
[5]: https://www.ibm.com/developerworks/library/l-metaprog1/index.html
[6]: https://www.javassist.org/
[7]: https://github.com/cglib/cglib
[8]: https://github.com/vidageek/mirror/blob/master/src/main/java/net/vidageek/mirror/provider/java/ObjenesisConstructorBypassingReflectionProvider.java
[9]: https://www.meetup.com/scaladores/
[10]: https://jamesclear.com/deliberate-practice-theory
[11]: https://aprenda.vidageek.net/
[12]: http://whatisthor.com/
[13]: https://github.com/juliano/springmvc-scaffold
[14]: https://travis-ci.com/
[15]: https://rubygems.org/gems/springmvc-scaffold
[16]: https://www.seleniumhq.org/
[17]: http://www.google.com/search?q=new+msdn.microsoft.com
[18]: https://www.nuget.org/packages/Ioget/
[19]: https://en.wikipedia.org/wiki/Reification_(computer_science)
[20]: https://github.com/gustavoamigo
[21]: https://github.com/gustavoamigo/quill-pgsql
[22]: https://getquill.io/
[23]: https://github.com/getquill/quill
[24]: http://scalamacros.org/
[25]: https://docs.scala-lang.org/tour/implicit-parameters.html
[26]: https://teamsql.io/blog/?p=923
[27]: https://github.com/mauricio/postgresql-async
[28]: https://twitter.com/flaviowbrasil
[29]: https://ndbc.io/
[30]: http://trane.io/
[31]: https://netty.io/
[32]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+preparedstatement
[33]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[34]: https://github.com/finagle/finagle-postgres/issues/55
[35]: https://opensource.com/tags/rust
[36]: https://juliano-alves.com/2019/11/02/the-journey-of-an-open-source-developer/
