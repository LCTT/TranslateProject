[#]: collector: (lujun9972)
[#]: translator: (MjSeven )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to fix common pitfalls with the Python ORM tool SQLAlchemy)
[#]: via: (https://opensource.com/article/19/9/common-pitfalls-python)
[#]: author: (Zach Todd https://opensource.com/users/zchtoddhttps://opensource.com/users/lauren-pritchetthttps://opensource.com/users/liranhaimovitchhttps://opensource.com/users/moshez)

How to fix common pitfalls with the Python ORM tool SQLAlchemy
======
Seemingly small choices made when using SQLAlchemy can have important
implications on the object-relational mapping toolkit's performance.
![A python with a package.][1]

Object-relational mapping ([ORM][2]) makes life easier for application developers, in no small part because it lets you interact with a database in a language you may know (such as Python) instead of raw SQL queries. [SQLAlchemy][3] is a Python ORM toolkit that provides access to SQL databases using Python. It is a mature ORM tool that adds the benefit of model relationships, a powerful query construction paradigm, easy serialization, and much more. Its ease of use, however, makes it easy to forget what is going on behind the scenes. Seemingly small choices made using SQLAlchemy can have important performance implications.

This article explains some of the top performance issues developers encounter when using SQLAlchemy and how to fix them.

### Retrieving an entire result set when you only need the count

Sometimes a developer just needs a count of results, but instead of utilizing a database count, all the results are fetched and the count is done with **len** in Python.


```
`count = len(User.query.filter_by(acct_active=True).all())`
```

Using SQLAlchemy's **count** method instead will do the count on the server side, resulting in far less data sent to the client. Calling **all()** in the prior example also results in the instantiation of model objects, which can become expensive quickly, given enough rows.

Unless more than the count is required, just use the **count** method.


```
`count = User.query.filter_by(acct_active=True).count()`
```

### Retrieving entire models when you only need a few columns

In many cases, only a few columns are needed when issuing a query. Instead of returning entire model instances, SQLAlchemy can fetch only the columns you're interested in. This not only reduces the amount of data sent but also avoids the need to instantiate entire objects. Working with tuples of column data instead of models can be quite a bit faster.


```
result = User.query.all()
for user in result:
    print(user.name, user.email)
```

Instead, select only what is needed using the **with_entities** method.


```
result = User.query.with_entities(User.name, User.email).all()
for (username, email) in result:
    print(username, email)
```

### Updating one object at a time inside a loop

Avoid using loops to update collections individually. While the database may execute a single update very quickly, the roundtrip time between the application and database servers will quickly add up. In general, strive for fewer queries where reasonable.


```
for user in users_to_update:
  user.acct_active = True
  db.session.add(user)
```

Use the bulk update method instead.


```
query = User.query.filter(user.id.in_([user.id for user in users_to_update]))
query.update({"acct_active": True}, synchronize_session=False)
```

### Triggering cascading deletes

ORM allows easy configuration of relationships on models, but there are some subtle behaviors that can be surprising. Most databases maintain relational integrity through foreign keys and various cascade options. SQLAlchemy allows you to define models with foreign keys and cascade options, but the ORM has its own cascade logic that can preempt the database.

Consider the following models.


```
class Artist(Base):
    __tablename__ = "artist"

    id = Column(Integer, primary_key=True)
    songs = relationship("Song", cascade="all, delete")

class Song(Base):
    __tablename__ = "song"

    id = Column(Integer, primary_key=True)
    artist_id = Column(Integer, ForeignKey("artist.id", ondelete="CASCADE"))
```

Deleting artists will cause the ORM to issue **delete** queries on the Song table, thus preventing the deletes from happening as a result of the foreign key. This behavior can become a bottleneck with complex relationships and a large number of records.

Include the **passive_deletes** option to ensure that the database is managing relationships. Be sure, however, that your database is capable of this. SQLite, for example, does not manage foreign keys by default.


```
`songs = relationship("Song", cascade="all, delete", passive_deletes=True)`
```

### Relying on lazy loading when eager loading should be used

Lazy loading is the default SQLAlchemy approach to relationships. Building from the last example, this implies that loading an artist does not simultaneously load his or her songs. This is usually a good idea, but the separate queries can be wasteful if certain relationships always need to be loaded.

Popular serialization frameworks like [Marshmallow][4] can trigger a cascade of queries if relationships are allowed to load in a lazy fashion.

There are a few ways to control this behavior. The simplest method is through the relationship function itself.


```
`songs = relationship("Song", lazy="joined", cascade="all, delete")`
```

This will cause a left join to be added to any query for artists, and as a result, the **songs** collection will be immediately available. Although more data is returned to the client, there are potentially far fewer roundtrips.

SQLAlchemy offers finer-grained control for situations where such a blanket approach can't be taken. The **joinedload()** function can be used to toggle joined loading on a per-query basis.


```
from sqlalchemy.orm import joinedload

artists = Artist.query.options(joinedload(Artist.songs))
print(artists.songs) # Does not incur a roundtrip to load
```

### Using the ORM for a bulk record import

The overhead of constructing full model instances becomes a major bottleneck when importing thousands of records. Imagine, for example, loading thousands of song records from a file where each song has first been converted to a dictionary.


```
for song in songs:
    db.session.add(Song(**song))
```

Instead, bypass the ORM and use just the parameter binding functionality of core SQLAlchemy.


```
batch = []
insert_stmt = Song.__table__.insert()
for song in songs:
    if len(batch) &gt; 1000:
       db.session.execute(insert_stmt, batch)
       batch.clear()
    batch.append(song)
if batch:
    db.session.execute(insert_stmt, batch)
```

Keep in mind that this method naturally skips any client-side ORM logic you might depend on, such as Python-based column defaults. While this method is faster than loading objects as full model instances, your database may have bulk loading methods that are faster. PostgreSQL, for example, has the **COPY** command that offers perhaps the best performance for loading large numbers of records.

### Calling commit or flush prematurely

There are many occasions when you need to associate a child record to its parent, or vice versa. One obvious way of doing this is to flush the session so that the record in question will be assigned an ID.


```
artist = Artist(name="Bob Dylan")
song = Song(title="Mr. Tambourine Man")

db.session.add(artist)
db.session.flush()

song.artist_id = artist.id
```

Committing or flushing more than once per request is usually unnecessary and undesirable. A database flush involves forcing disk writes on the database server, and in most circumstances, the client will block until the server can acknowledge that the data has been written.

SQLAlchemy can track relationships and manage keys behind the scenes.


```
artist = Artist(name="Bob Dylan")
song = Song(title="Mr. Tambourine Man")

artist.songs.append(song)
```

### Wrapping up

I hope this list of common pitfalls can help you avoid these issues and keep your application running smoothly. As always, when diagnosing a performance problem, measurement is key. Most databases offer performance diagnostics that can help you pinpoint issues, such as the PostgreSQL **pg_stat_statements** module.

* * *

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/common-pitfalls-python

作者：[Zach Todd][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/zchtoddhttps://opensource.com/users/lauren-pritchetthttps://opensource.com/users/liranhaimovitchhttps://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_snake_file_box.jpg?itok=UuDVFLX- (A python with a package.)
[2]: https://en.wikipedia.org/wiki/Object-relational_mapping
[3]: https://www.sqlalchemy.org/
[4]: https://marshmallow.readthedocs.io/en/stable/
