HankChow translating

Gitbase: Exploring git repos with SQL
======
Gitbase is a Go-powered open source project that allows SQL queries to be run on Git repositories.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_cloud_database.png?itok=lhhU42fg)

Git has become the de-facto standard for code versioning, but its popularity didn't remove the complexity of performing deep analyses of the history and contents of source code repositories.

SQL, on the other hand, is a battle-tested language to query large codebases as its adoption by projects like Spark and BigQuery shows.

So it is just logical that at source{d} we chose these two technologies to create gitbase: the code-as-data solution for large-scale analysis of git repositories with SQL.

[Gitbase][1] is a fully open source project that stands on the shoulders of a series of giants which made its development possible, this article aims to point out the main ones.

![](https://opensource.com/sites/default/files/uploads/gitbase.png)

The [gitbase][2] [playground][2] provides a visual way to use gitbase.

### Parsing SQL with Vitess

Gitbase's user interface is SQL. This means we need to be able to parse and understand the SQL requests that arrive through the network following the MySQL protocol. Fortunately for us, this was already implemented by our friends at YouTube and their [Vitess][3] project. Vitess is a database clustering system for horizontal scaling of MySQL.

We simply grabbed the pieces of code that mattered to us and made it into an [open source project][4] that allows anyone to write a MySQL server in minutes (as I showed in my [justforfunc][5] episode [CSVQL—serving CSV with SQL][6]).

### Reading git repositories with go-git

Once we've parsed a request we still need to find how to answer it by reading the git repositories in our dataset. For this, we integrated source{d}'s most successful repository [go-git][7]. Go-git is a* *highly extensible Git implementation in pure Go.

This allowed us to easily analyze repositories stored on disk as [siva][8] files (again an open source project by source{d}) or simply cloned with git clone.

### Detecting languages with enry and parsing files with babelfish

Gitbase does not stop its analytic power at the git history. By integrating language detection with our (obviously) open source project [enry][9] and program parsing with [babelfish][10]. Babelfish is a self-hosted server for universal source code parsing, turning code files into Universal Abstract Syntax Trees (UASTs)

These two features are exposed in gitbase as the user functions LANGUAGE and UAST. Together they make requests like "find the name of the function that was most often modified during the last month" possible.

### Making it go fast

Gitbase analyzes really large datasets—e.g. Public Git Archive, with 3TB of source code from GitHub ([announcement][11]) and in order to do so every CPU cycle counts.

This is why we integrated two more projects into the mix: Rubex and Pilosa.

#### Speeding up regular expressions with Rubex and Oniguruma

[Rubex][12] is a quasi-drop-in replacement for Go's regexp standard library package. I say quasi because they do not implement the LiteralPrefix method on the regexp.Regexp type, but I also had never heard about that method until right now.

#### Speeding up queries with Pilosa indexes

Rubex gets its performance from the highly optimized C library [Oniguruma][13] which it calls using [cgo][14]

Indexes are a well-known feature of basically every relational database, but Vitess does not implement them since it doesn't really need to.

But again open source came to the rescue with [Pilosa][15], a distributed bitmap index implemented in Go which made gitbase usable on massive datasets. Pilosa is an open source, distributed bitmap index that dramatically accelerates queries across multiple, massive datasets.

### Conclusion

I'd like to use this blog post to personally thank the open source community that made it possible for us to create gitbase in such a shorter period that anyone would have expected. At source{d} we are firm believers in open source and every single line of code under github.com/src-d (including our OKRs and investor board) is a testament to that.

Would you like to give gitbase a try? The fastest and easiest way is with source{d} Engine. Download it from sourced.tech/engine and get gitbase running with a single command!

Want to know more? Check out the recording of my talk at the [Go SF meetup][16].

The article was [originally published][17] on Medium and is republished here with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/gitbase

作者：[Francesc Campoy][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/francesc
[b]: https://github.com/lujun9972
[1]: https://github.com/src-d/gitbase
[2]: https://github.com/src-d/gitbase-web
[3]: https://github.com/vitessio/vitess
[4]: https://github.com/src-d/go-mysql-server
[5]: http://justforfunc.com/
[6]: https://youtu.be/bcRDXAraprk
[7]: https://github.com/src-d/go-git
[8]: https://github.com/src-d/siva
[9]: https://github.com/src-d/enry
[10]: https://github.com/bblfsh/bblfshd
[11]: https://blog.sourced.tech/post/announcing-pga/
[12]: https://github.com/moovweb/rubex
[13]: https://github.com/kkos/oniguruma
[14]: https://golang.org/cmd/cgo/
[15]: https://github.com/pilosa/pilosa
[16]: https://www.meetup.com/golangsf/events/251690574/
[17]: https://medium.com/sourcedtech/gitbase-exploring-git-repos-with-sql-95ec0986386c
