怎么在一台树莓派上安装 Postgres 数据库
============================================================

> 在你的下一个树莓派项目上安装和配置流行的开源数据库 Postgres 并去使用它。

![How to set up a Postgres database on a Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspiresources.png?itok=pJwS87K6 "How to set up a Postgres database on a Raspberry Pi")

Image credits : Raspberry Pi Foundation. [CC BY-SA 4.0][12].

保存你的项目或应用程序持续增加的数据，数据库是一种很好的方式。你可以在一个会话中将数据写入到数据库，并且在下次你需要查找的时候找到它。一个设计良好的数据库可以做到在巨大的数据集中高效地找到数据，只要告诉它你想去找什么，而不用去考虑它是如何查找的。为一个基本的 [CRUD][13] （创建、记录、更新、删除）应用程序安装一个数据库是非常简单的， 它是一个很通用的模式，并且也适用于很多项目。

为什么 [PostgreSQL][14]，一般被为 Postgres？ 它被认为是功能和性能最好的开源数据库。如果你使用过 MySQL，它们是很相似的。但是，如果你希望使用它更高级的功能，你会发现优化 Postgres 是比较容易的。它便于安装、容易使用、方便安全， 而且在树莓派 3 上运行的非常好。

本教程介绍了怎么在一个树莓派上去安装 Postgres；创建一个表；写简单查询；在树莓派、PC，或者 Mac 上使用 pgAdmin 图形用户界面；从 Python 中与数据库交互。

你掌握了这些基础知识后，你可以让你的应用程序使用复合查询连接多个表，那个时候你需要考虑的是，怎么去使用主键或外键优化及最佳实践等等。

### 安装

一开始，你将需要去安装 Postgres 和一些其它的包。打开一个终端窗口并连接到因特网，然后运行以下命令：

```
sudo apt install postgresql libpq-dev postgresql-client 
postgresql-client-common -y
```

![installing postgres](https://opensource.com/sites/default/files/u128651/postgres-install.png "installing postgres")

当安装完成后，切换到 Postgres 用户去配置数据库：

```
sudo su postgres
```

现在，你可以创建一个数据库用户。如果你创建了一个与你的 Unix 用户帐户相同名字的用户，那个用户将被自动授权访问该数据库。因此在本教程中，为简单起见，我们将假设你使用了默认用户 `pi` 。运行 `createuser` 命令以继续：

```
createuser pi -P --interactive
```

当得到提示时，输入一个密码 （并记住它）， 选择 `n`  使它成为一个非超级用户（LCTT 译注：此处原文有误），接下来两个问题选择 `y`（LCTT 译注：分别允许创建数据库和其它用户）。

![creating a postgres user](https://opensource.com/sites/default/files/u128651/postgres-createuser.png "creating a postgres user")

现在，使用 Postgres shell 连接到 Postgres 去创建一个测试数据库：

```
$ psql
> create database test;
```

按下 `Ctrl+D` **两次**从 psql shell 和 postgres  用户中退出，再次以 `pi` 用户登入。你创建了一个名为 `pi` 的 Postgres 用户后，你可以从这里无需登录凭据即可访问 Postgres shell：

```
$ psql test
```

你现在已经连接到 "test" 数据库。这个数据库当前是空的，不包含任何表。你可以在 psql shell 里创建一个简单的表：

```
test=> create table people (name text, company text);
```

现在你可插入数据到表中：

```
test=> insert into people values ('Ben Nuttall', 'Raspberry Pi Foundation');

test=> insert into people values ('Rikki Endsley', 'Red Hat');
```

然后尝试进行查询：

```
test=> select * from people;

     name      |         company         
---------------+-------------------------
 Ben Nuttall   | Raspberry Pi Foundation
 Rikki Endsley | Red Hat
(2 rows)
```

![a postgres query](https://opensource.com/sites/default/files/u128651/postgres-query.png "a postgres query")

```
test=> select name from people where company = 'Red Hat';

     name      | company 
---------------+---------
 Rikki Endsley | Red Hat
(1 row)
```

### pgAdmin

如果希望使用一个图形工具去访问数据库，你可以使用它。 PgAdmin 是一个全功能的 PostgreSQL GUI，它允许你去创建和管理数据库和用户、创建和修改表、执行查询，和如同在电子表格一样熟悉的视图中浏览结果。psql 命令行工具可以很好地进行简单查询，并且你会发现很多高级用户一直在使用它，因为它的执行速度很快 （并且因为他们不需要借助 GUI），但是，一般用户学习和操作数据库，使用 pgAdmin 是一个更适合的方式。

关于 pgAdmin 可以做的其它事情：你可以用它在树莓派上直接连接数据库，或者用它在其它的电脑上远程连接到树莓派上的数据库。

如果你想去访问树莓派，你可以用 `apt` 去安装它：

```
sudo apt install pgadmin3
```

它是和基于 Debian 的系统如 Ubuntu 是完全相同的；如果你在其它发行版上安装，尝试与你的系统相关的等价的命令。 或者，如果你在 Windows 或 macOS 上，尝试从 [pgAdmin.org][15] 上下载 pgAdmin。注意，在 `apt` 上的可用版本是 pgAdmin3，而最新的版本 pgAdmin4，在其网站上可以找到。

在同一台树莓派上使用 pgAdmin 连接到你的数据库，从主菜单上简单地打开 pgAdmin3 ，点击 **new connection** 图标，然后完成注册，这时，你将需要一个名字（连接名，比如 test），改变用户为 “pi”，然后剩下的输入框留空 (或者如它们原本不动）。点击 OK，然后你在左侧的侧面版中将发现一个新的连接。

![connect your database with pgadmin](https://opensource.com/sites/default/files/u128651/pgadmin-connect.png "connect your database with pgadmin")

要从另外一台电脑上使用 pgAdmin 连接到你的树莓派数据库上，你首先需要编辑 PostgreSQL 配置允许远程连接：

1、 编辑 PostgreSQL 配置文件 `/etc/postgresql/9.6/main/postgresql.conf` ，取消 `listen_addresses` 行的注释，并把它的值从 `localhost` 改变成 `*`。然后保存并退出。

2、 编辑 pg_hba 配置文件 `/etc/postgresql/9.6/main/postgresql.conf`，将 `127.0.0.1/32` 改变成 `0.0.0.0/0` （对于IPv4）和将 `::1/128` 改变成 `::/0` （对于 IPv6）。然后保存并退出。

3、 重启 PostgreSQL 服务： `sudo service postgresql restart`。

注意，如果你使用一个旧的 Raspbian 镜像或其它发行版，版本号可能不一样。

![ edit the postgresql configuration to allow remote connections](https://opensource.com/sites/default/files/u128651/postgres-config.png " edit the postgresql configuration to allow remote connections")

做完这些之后，在其它的电脑上打开 pgAdmin 并创建一个新的连接。这时，需要提供一个连接名，输入树莓派的 IP 地址作为主机（这可以在任务栏的 WiFi 图标上悬停鼠标找到，或者在一个终端中输入 `hostname -I` 找到）。

![a remote connection](https://opensource.com/sites/default/files/u128651/pgadmin-remote.png "a remote connection")

不论你连接的是本地的还是远程的数据库，点击打开 **Server Groups > Servers > test > Schemas > public > Tables**，右键单击 **people** 表，然后选择 **View Data > View top 100 Rows**。你现在将看到你前面输入的数据。

![viewing test data](https://opensource.com/sites/default/files/u128651/pgadmin-view.png "viewing test data")

你现在可以创建和修改数据库和表、管理用户，和使用 GUI 去写你自己的查询了。你可能会发现这种可视化方法比命令行更易于管理。

### Python

要从一个 Python 脚本连接到你的数据库，你将需要 [Psycopg2][16] 这个 Python 包。你可以用 [pip][17] 来安装它：

```
sudo pip3 install psycopg2
```

现在打开一个 Python 编辑器写一些代码连接到你的数据库：

```
import psycopg2

conn = psycopg2.connect('dbname=test')
cur = conn.cursor()

cur.execute('select * from people')

results = cur.fetchall()

for result in results:
    print(result)
```

运行这个代码去看查询结果。注意，如果你连接的是远程数据库，在连接字符串中你将需要提供更多的凭据，比如，增加主机 IP、用户名，和数据库密码：

```
conn = psycopg2.connect('host=192.168.86.31 user=pi 
password=raspberry dbname=test')
```

你甚至可以创建一个函数去运行特定的查询：

```
def get_all_people():
    query = """
    SELECT
        *
    FROM
        people
    """
    cur.execute(query)
    return cur.fetchall()
```

和一个包含参数的查询：

```
def get_people_by_company(company):
    query = """
    SELECT
        *
    FROM
        people
    WHERE
        company = %s
    """
    values = (company, )
    cur.execute(query, values)
    return cur.fetchall()
```

或者甚至是一个增加记录的函数：

```
def add_person(name, company):
    query = """
    INSERT INTO
        people
    VALUES
        (%s, %s)
    """
    values = (name, company)
    cur.execute(query, values)
```

注意，这里使用了一个注入字符串到查询中的安全的方法， 你不希望被 [小鲍勃的桌子][18] 害死！

![Python](https://opensource.com/sites/default/files/u128651/python-postgres.png "Python")

现在你知道了这些基础知识，如果你想去进一步掌握 Postgres ，查看在 [Full Stack Python][19] 上的文章。

--------------------------------------------------------------------------------

作者简介：

Ben Nuttall - 树莓派社区的管理者。除了它为树莓派基金会所做的工作之外 ，他也投入开源软件、数学、皮艇运动、GitHub、探险活动和 Futurama。在 Twitter [@ben_nuttall][10] 上关注他。

-------------

via: https://opensource.com/article/17/10/set-postgres-database-your-raspberry-pi

作者：[Ben Nuttall][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bennuttall
[1]:https://opensource.com/file/374246
[2]:https://opensource.com/file/374241
[3]:https://opensource.com/file/374251
[4]:https://opensource.com/file/374221
[5]:https://opensource.com/file/374236
[6]:https://opensource.com/file/374226
[7]:https://opensource.com/file/374231
[8]:https://opensource.com/file/374256
[9]:https://opensource.com/article/17/10/set-postgres-database-your-raspberry-pi?imm_mid=0f75d0&cmp=em-prog-na-na-newsltr_20171021&rate=t-XUFUPa6mURgML4cfL1mjxsmFBG-VQTG4R39QvFVQA
[10]:http://www.twitter.com/ben_nuttall
[11]:https://opensource.com/user/26767/feed
[12]:https://creativecommons.org/licenses/by-sa/4.0/
[13]:https://en.wikipedia.org/wiki/Create,_read,_update_and_delete
[14]:https://www.postgresql.org/
[15]:https://www.pgadmin.org/download/
[16]:http://initd.org/psycopg/
[17]:https://pypi.python.org/pypi/pip
[18]:https://xkcd.com/327/
[19]:https://www.fullstackpython.com/postgresql.html
[20]:https://opensource.com/users/bennuttall
[21]:https://opensource.com/users/bennuttall
[22]:https://opensource.com/users/bennuttall
[23]:https://opensource.com/article/17/10/set-postgres-database-your-raspberry-pi?imm_mid=0f75d0&cmp=em-prog-na-na-newsltr_20171021#comments
[24]:https://opensource.com/tags/raspberry-pi
[25]:https://opensource.com/tags/raspberry-pi-column
[26]:https://opensource.com/tags/how-tos-and-tutorials
[27]:https://opensource.com/tags/programming
