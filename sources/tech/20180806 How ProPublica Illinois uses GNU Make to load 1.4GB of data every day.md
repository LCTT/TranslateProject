How ProPublica Illinois uses GNU Make to load 1.4GB of data every day
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr)

I avoided using GNU Make in my data journalism work for a long time, partly because the documentation was so obtuse that I couldn’t see how Make, one of many extract-transform-load (ETL) processes, could help my day-to-day data reporting. But this year, to build [The Money Game][1], I needed to load 1.4GB of Illinois political contribution and spending data every day, and the ETL process was taking hours, so I gave Make another chance.

Now the same process takes less than 30 minutes.

Here’s how it all works, but if you want to skip directly to the code, [we’ve open-sourced it here][2].

Fundamentally, Make lets you say:

  * File X depends on a transformation applied to file Y
  * If file X doesn’t exist, apply that transformation to file Y and make file X



This “start with file Y to get file X” pattern is a daily reality of data journalism, and using Make to load political contribution and spending data was a great use case. The data is fairly large, accessed via a slow FTP server, has a quirky format, has just enough integrity issues to keep things interesting, and needs to be compatible with a legacy codebase. To tackle it, I needed to start from the beginning.

### Overview

The financial disclosure data we’re using is from the Illinois State Board of Elections, but the [Illinois Sunshine project][3] had released open source code (no longer available) to handle the ETL process and fundraising calculations. Using their code, the ETL process took about two hours to run on robust hardware and over five hours on our servers, where it would sometimes fail for reasons I never quite understood. I needed it to work better and work faster.

The process looks like this:

  * **Download** data files via FTP from Illinois State Board Of Elections.
  * **Clean** the data using Python to resolve integrity issues and create clean versions of the data files.
  * **Load** the clean data into PostgreSQL using its highly efficient but finicky “\copy” command.
  * **Transform** the data in the database to clean up column names and provide more immediately useful forms of the data using “raw” and “public” PostgreSQL schemas and materialized views (essentially persistently cached versions of standard SQL views).



The cleaning step must happen before any data is loaded into the database, so we can take advantage of PostgreSQL’s efficient import tools. If a single row has a string in a column where it’s expecting an integer, the whole operation fails.

GNU Make is well-suited to this task. Make’s model is built around describing the output files your ETL process should produce and the operations required to go from a set of original source files to a set of output files.

As with any ETL process, the goal is to preserve your original data, keep operations atomic and provide a simple and repeatable process that can be run over and over.

Let’s examine a few of the steps:

### Download and pre-import cleaning

Take a look at this snippet, which could be a standalone Makefile:
```
data/download/%.txt : aria2c -x5 -q -d data/download --ftp-user="$(ILCAMPAIGNCASH_FTP_USER)" --ftp-passwd="$(ILCAMPAIGNCASH_FTP_PASSWD)" ftp://ftp.elections.il.gov/CampDisclDataFiles/$*.txt data/processed/%.csv : data/download/%.txt python processors/clean_isboe_tsv.py $< $* > $@

```

This snippet first downloads a file via FTP and then uses Python to process it. For example, if “Expenditures.txt” is one of my source data files, I can run `make data/processed/Expenditures.csv` to download and process the expenditure data.

There are two things to note here.

The first is that we use [Aria2][4] to handle FTP duties. Earlier versions of the script used other FTP clients that were either slow as molasses or painful to use. After some trial and error, I found Aria2 did the job better than lftp (which is fast but fussy) or good old ftp (which is both slow and fussy). I also found some incantations that took download times from roughly an hour to less than 20 minutes.

Second, the cleaning step is crucial for this dataset. It uses a simple class-based Python validation scheme you can [see here][5]. The important thing to note is that while Python is pretty slow generally, Python 3 is fast enough for this. And as long as you are [only processing row-by-row][6] without any objects accumulating in memory or doing any extra disk writes, performance is fine, even on low-resource machines like the servers in ProPublica’s cluster, and there aren’t any unexpected quirks.

### Loading

Make is built around file inputs and outputs. But what happens if our data is both in files and database tables? Here are a few valuable tricks I learned for integrating database tables into Makefiles:

**One SQL file per table / transform** : Make loves both files and simple mappings, so I created individual files with the schema definitions for each table or any other atomic table-level operation. The table names match the SQL filenames, the SQL filenames match the source data filenames. You can see them [here][7].

**Use exit code magic to make tables look like files to Make** : Hannah Cushman and Forrest Gregg from DataMade [introduced me to this trick on Twitter][8]. Make can be fooled into treating tables like files if you prefix table level commands with commands that emit appropriate exit codes. If a table exists, emit a successful code. If it doesn’t, emit an error.

Beyond that, loading consists solely of the highly efficient PostgreSQL `\copy` command. While the `COPY` command is even more efficient, it doesn’t play nicely with Amazon RDS. Even if ProPublica moved to a different database provider, I’d continue to use `\copy` for portability unless eking out a little more performance was mission-critical.

There’s one last curveball: The loading step imports data to a PostgreSQL schema called `raw` so that we can cleanly transform the data further. Postgres schemas provide a useful way of segmenting data within a single database — instead of a single namespace with tables like `raw_contributions` and `clean_contributions`, you can keep things simple and clear with an almost folder-like structure of `raw.contributions` and `public.contributions`.

### Post-import transformations

The Illinois Sunshine code also renames columns and slightly reshapes the data for usability and performance reasons. Column aliasing is useful for end users and the intermediate tables are required for compatibility with the legacy code.

In this case, the loader imports into a schema called `raw` that is as close to the source data as humanly possible.

The data is then transformed by creating materialized views of the raw tables that rename columns and handle some light post-processing. This is enough for our purposes, but more elaborate transformations could be applied without sacrificing clarity or obscuring the source data. Here’s a snippet of one of these view definitions:
```
CREATE MATERIALIZED VIEW d2_reports AS SELECT id as id, committeeid as committee_id, fileddocid as filed_doc_id, begfundsavail as beginning_funds_avail, indivcontribi as individual_itemized_contrib, indivcontribni as individual_non_itemized_contrib, xferini as transfer_in_itemized, xferinni as transfer_in_non_itemized, # …. FROM raw.d2totals WITH DATA;
```

These transformations are very simple, but simply using more readable column names is a big improvement for end-users.

As with table schema definitions, there is a file for each table that describes the transformed view. We use materialized views, which, again, are essentially persistently cached versions of standard SQL views, because storage is cheap and they are faster than traditional SQL views.

### A note about security

You’ll notice we use environment variables that are expanded inline when the commands are run. That’s useful for debugging and helps with portability. But it’s not a good idea if you think log files or terminal output could be compromised or people who shouldn’t know these secrets have access to logs or shared systems. For more security, you could use a system like the PostgreSQL `pgconf` file and remove the environment variable references.

### Makefiles for the win

My only prior experience with Make was in a computational math course 15 years ago, where it was a frustrating and poorly explained footnote. The combination of obtuse documentation, my bad experience in school and an already reliable framework kept me away. Plus, my shell scripts and Python Fabric/Invoke code were doing a fine job building reliable data processing pipelines based on the same principles for the smaller, quick turnaround projects I was doing.

But after trying Make for this project, I was more than impressed with the results. It’s concise and expressive. It enforces atomic operations, but rewards them with dead simple ways to handle partial builds, which is a big deal during development when you really don’t want to be repeating expensive operations to test individual components. Combined with PostgreSQL’s speedy import tools, schemas, and materialized views, I was able to load the data in a fraction of the time. And just as important, the performance of the new process is less sensitive to varying system resources.

If you’re itching to get started with Make, here are a few additional resources:

+ [Making Data, The Datamade Way][9], by Hannah Cushman. My original inspiration.
+ [“Why Use Make”][10] by Mike Bostock.
+ [“Practical Makefiles, by example”][11] by John Tsiombikas is a nice resource if you want to dig deeper, but Make’s documentation is intimidating.


In the end, the best build/processing system is any system that never alters source data, clearly shows transformations, uses version control and can be easily run over and over. Grunt, Gulp, Rake, Make, Invoke … you have options. As long as you like what you use and use it religiously, your work will benefit.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/how-propublica-illinois-uses-gnu-make

作者：[David Eads][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/eads
[1]:https://www.propublica.org/article/illinois-governors-race-campaign-widget-update
[2]:https://github.com/propublica/ilcampaigncash/
[3]:https://illinoissunshine.org/
[4]:https://aria2.github.io/
[5]:https://github.com/propublica/ilcampaigncash/blob/master/processors/lib/models.py
[6]:https://github.com/propublica/ilcampaigncash/blob/master/processors/clean_isboe_tsv.py#L13
[7]:https://github.com/propublica/ilcampaigncash/tree/master/sql/tables
[8]:https://twitter.com/eads/status/968970130427404293
[9]: https://github.com/datamade/data-making-guidelines
[10]: https://bost.ocks.org/mike/make/
[11]: http://nuclear.mutantstargoat.com/articles/make/
