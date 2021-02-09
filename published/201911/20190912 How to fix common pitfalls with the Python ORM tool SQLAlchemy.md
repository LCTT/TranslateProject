[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11590-1.html)
[#]: subject: (How to fix common pitfalls with the Python ORM tool SQLAlchemy)
[#]: via: (https://opensource.com/article/19/9/common-pitfalls-python)
[#]: author: (Zach Todd https://opensource.com/users/zchtoddhttps://opensource.com/users/lauren-pritchetthttps://opensource.com/users/liranhaimovitchhttps://opensource.com/users/moshez)

如何修复使用 Python ORM 工具 SQLAlchemy 时的常见陷阱
======

> 在使用 SQLAlchemy 时，那些看似很小的选择可能对这种对象关系映射工具包的性能产生重要影响。

![A python with a package.][1]

<ruby>对象关系映射<rt>Object-relational mapping</rt></ruby>（[ORM][2]）使应用程序开发人员的工作更轻松，在很大程度是因为它允许你使用你可能知道的语言（例如 Python）与数据库交互，而不是使用原始 SQL 语句查询。[SQLAlchemy][3] 是一个 Python ORM 工具包，它提供使用 Python 访问 SQL 数据库的功能。它是一个成熟的 ORM 工具，增加了模型关系、强大的查询构造范式、简单的序列化等优点。然而，它的易用性使得人们很容易忘记其背后发生了什么。使用 SQLAlchemy 时做出的看似很小的选择可能产生非常大的性能影响。

本文解释了开发人员在使用 SQLAlchemy 时遇到的一些最重要的性能问题，以及如何解决这些问题。

### 只需要计数但检索整个结果集

有时开发人员只需要一个结果计数，但是没有使用数据库计数功能，而是获取了所有结果，然后使用 Python 中的 `len` 完成计数。

```
count = len(User.query.filter_by(acct_active=True).all())
```

相反，使用 SQLAlchemy 的 `count` 方法将在服务器端执行计数，从而减少发送到客户端的数据。在前面的例子中调用 `all()` 也会导致模型对象的实例化，如果有很多数据，那么时间代价可能会非常昂贵。

除非还需要做其他的事情，否则只需使用 `count` 方法：

```
count = User.query.filter_by(acct_active=True).count()
```

### 只需要几列时检索整个模型

在许多情况下，发出查询时只需要几列数据。SQLAlchemy 可以只获取你想要的列，而不是返回整个模型实例。这不仅减少了发送的数据量，还避免了实例化整个对象。使用列数据的元组而不是模型可以快得多。

```
result = User.query.all()
for user in result:
    print(user.name, user.email)
```

反之，使用 `with_entities` 方法只选择所需要的内容：

```
result = User.query.with_entities(User.name, User.email).all()
for (username, email) in result:
    print(username, email)
```

### 每次循环都更新一个对象

避免使用循环来单独更新集合。虽然数据库可以非常快地执行单个更新，但应用程序和数据库服务器之间的往返时间将快速累加。通常，在合理的情况下争取更少的查询。

```
for user in users_to_update:
  user.acct_active = True
  db.session.add(user)
```

改用批量更新方法：

```
query = User.query.filter(user.id.in_([user.id for user in users_to_update]))
query.update({"acct_active": True}, synchronize_session=False)
```

### 触发级联删除

ORM 允许在模型关系上进行简单的配置，但是有一些微妙的行为可能会令人吃惊。大多数数据库通过外键和各种级联选项维护关系完整性。SQLAlchemy 允许你使用外键和级联选项定义模型，但是 ORM 具有自己的级联逻辑，可以取代数据库。

考虑以下模型：

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

删除歌手将导致 ORM 在 `song` 表上发出 `delete` 查询，从而防止由于外键导致的删除操作。这种行为可能会成为复杂关系和大量记录的瓶颈。

请包含 `passive_deletes` 选项，以确保让数据库来管理关系。但是，请确保你的数据库具有此功能。例如，SQLite 默认情况下不管理外键。

```
songs = relationship("Song", cascade  all, delete", passive_deletes=True)
```

### 当要使用贪婪加载时，应使用延迟加载

延迟加载是 SQLAlchemy 处理关系的默认方法。从上一个例子构建来看，加载一个歌手时不会同时加载他或她的歌曲。这通常是一个好主意，但是如果总是需要加载某些关系，单独的查询可能会造成浪费。

如果允许以延迟方式加载关系，像 [Marshmallow][4] 这样流行的序列化框架可以触发级联查询。

有几种方法可以控制此行为。最简单的方法是通过 relationship 函数本身。

```
songs = relationship("Song", lazy="joined", cascade="all, delete")
```

这将导致一个左连接被添加到任何歌手的查询中，因此，`songs` 集合将立即可用。尽管有更多数据返回给客户端，但往返次数可能会少得多。

SQLAlchemy 为无法采用这种综合方法的情况提供了更细粒度的控制，可以使用 `joinedload()` 函数在每个查询的基础上切换连接的加载。

```
from sqlalchemy.orm import joinedload

artists = Artist.query.options(joinedload(Artist.songs))
print(artists.songs) # Does not incur a roundtrip to load
```

### 使用 ORM 进行批量记录导入

导入成千上万条记录时，构建完整模型实例的开销会成为主要瓶颈。想象一下，从一个文件中加载数千首歌曲记录，其中每首歌曲都先被转换为字典。

```
for song in songs:
    db.session.add(Song(`song))
```

相反，绕过 ORM，只使用核心的 SQLAlchemy 参数绑定功能。

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

请记住，此方法会自然而然地跳过你可能依赖的任何客户端 ORM 逻辑，例如基于 Python 的列默认值。尽管此方法比将对象加载为完整的模型实例要快，但是你的数据库可能具有更快的批量加载方法。例如，PostgreSQL 的 `COPY` 命令为加载大量记录提供了最佳性能。

### 过早调用提交或刷新

在很多情况下，你需要将子记录与其父记录相关联，反之亦然。一种显然的方法是刷新会话，以便为有问题的记录分配一个 ID。

```
artist = Artist(name="Bob Dylan")
song = Song(title="Mr. Tambourine Man")

db.session.add(artist)
db.session.flush()

song.artist_id = artist.id
```

对于每个请求，多次提交或刷新通常是不必要的，也是不可取的。数据库刷新涉及强制在数据库服务器上进行磁盘写入，在大多数情况下，客户端将阻塞，直到服务器确认已写入数据为止。

SQLAlchemy 可以在幕后跟踪关系和管理相关键。

```
artist = Artist(name="Bob Dylan")
song = Song(title="Mr. Tambourine Man")

artist.songs.append(song)
```

### 总结

我希望这一系列常见的陷阱可以帮助你避免这些问题，并使你的应用平稳运行。通常，在诊断性能问题时，测量是关键。大多数数据库都提供性能诊断功能，可以帮助你定位问题，例如 PostgreSQL 的 `pg_stat_statements` 模块。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/common-pitfalls-python

作者：[Zach Todd][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/zchtoddhttps://opensource.com/users/lauren-pritchetthttps://opensource.com/users/liranhaimovitchhttps://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_snake_file_box.jpg?itok=UuDVFLX- (A python with a package.)
[2]: https://en.wikipedia.org/wiki/Object-relational_mapping
[3]: https://www.sqlalchemy.org/
[4]: https://marshmallow.readthedocs.io/en/stable/
