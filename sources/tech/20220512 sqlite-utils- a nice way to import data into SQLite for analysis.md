[#]: subject: "sqlite-utils: a nice way to import data into SQLite for analysis"
[#]: via: "https://jvns.ca/blog/2022/05/12/sqlite-utils--a-nice-way-to-import-data-into-sqlite/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

sqlite-utils: a nice way to import data into SQLite for analysis
======

Hello! This is a quick post about a nice tool I found recently called [sqlite-utils][1], from the [tools category][2].

Recently I wanted to do some basic data analysis using data from my Shopify store. So I figured I’d query the Shopify API and import my data into SQLite, and then I could make queries to get the graphs I want.

But this seemed like a lot of boring work, like I’d have to write a schema and write a Python program. So I hunted around for a solution, and I found `sqlite-utils`, a tool designed to make it easy to import arbitrary data into SQLite to do data analysis on the data.

### sqlite-utils automatically generates a schema

The Shopify data has about a billion fields and I really did not want to type out a schema for it. `sqlite-utils` solves this problem: if I have an array of JSON orders, I can create a new SQLite table with that data in it like this:

```

    import sqlite_utils

    orders = ... # (some code to get the `orders` array here)

    db = sqlite_utils.Database('orders.db')
    db['shopify_orders'].insert_all(orders)

```

### you can alter the schema if there are new fields (with `alter`)

Next, I ran into a problem where on the 5th page of downloads, the JSON contained a new field that I hadn’t seen before.

Luckily, `sqlite-utils` thought of that: there’s an `alter` flag which will update the table’s schema to include the new fields. ```

Here’s what the code for that looks like

```

    db['shopify_orders'].insert_all(orders, alter=True)

```

### you can deduplicate existing rows (with `upsert`)

Next I ran into a problem where sometimes when doing a sync, I’d download data from the API where some of it was new and some wasn’t.

So I wanted to do an “upsert” where it only created new rows if the item didn’t already exist. `sqlite-utils` also thought of this, and there’s an `upsert` method.

For this to work you have to specify the primary key. For me that was `pk="id"`. Here’s what my final code looks like:

```

    db['shopify_orders'].upsert_all(
        orders,
        pk="id",
        alter=True
    )

```

### there’s also a command line tool

I’ve talked about using `sqlite-utils` as a library so far, but there’s also a command line tool which is really useful.

For example, this inserts the data from a `plants.csv` into a `plants` table:

```

    sqlite-utils insert plants.db plants plants.csv --csv

```

### format conversions

I haven’t tried this yet, but here’s a cool example from the help docs of how you can do format conversions, like converting a string to a float:

```

    sqlite-utils insert plants.db plants plants.csv --csv --convert '
    return {
      "name": row["name"].upper(),
      "latitude": float(row["latitude"]),
      "longitude": float(row["longitude"]),
    }'

```

This seems really useful for CSVs, where by default it’ll often interpret numeric data as strings if you don’t do this conversions.

### metabase seems nice too

Once I had all the data in SQLite, I needed a way to draw graphs with it. I wanted some dashboards, so I ended up using [Metabase][3], an open source business intelligence tool. I found it very straightforward and it seems like a really easy way to turn SQL queries into graphs.

This whole setup (sqlite-utils + metabase + SQL) feels a lot easier to use than my previous setup, where I had a custom Flask website that used plotly and pandas to draw graphs.

### that’s all!

I was really delighted by `sqlite-utils`, it was super easy to use and it did everything I wanted.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/05/12/sqlite-utils--a-nice-way-to-import-data-into-sqlite/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://sqlite-utils.datasette.io
[2]: https://jvns.ca/#cool-computer-tools---features---ideas
[3]: https://www.metabase.com/
