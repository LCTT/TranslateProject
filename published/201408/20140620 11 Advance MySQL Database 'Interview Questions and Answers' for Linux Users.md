给linux用户的11个高级MySQL数据库面试问题和答案
================================================================================
我们已经发表了两篇MySQL的文章，非常感谢Tecmint社区的大力支持。这是MySQL面试系列的第三篇文章,并且在面试专栏中排第16。
- [15个基本的MySQL面试问题][1]
- [给中级人员的10个MySQL面试问题][1]

![11个MySQL面试问题](http://www.tecmint.com/wp-content/uploads/2014/06/MySQL-Interview-Questions.jpeg)

因为有大家的支持，我们才能做到现在，感谢你们这一路上对我们的支持.在这篇文章中，我们将主要针对MySQL的实用技巧，讲讲面试中相关的问题.

### 1. 如何使用SELECT语句找到你正在运行的服务器的版本并打印出当前数据库的名称? ###
**答**：下面的语句的结果会显示服务器的版本和当前的数据库名称 

     mysql> SELECT VERSION(), DATABASE();
     
     +-------------------------+------------+
     | VERSION()               | DATABASE() |
     +-------------------------+------------+
     | 5.5.34-0ubuntu0.13.10.1 | NULL       |
     +-------------------------+------------+
     1 row in set (0.06 sec)

在Database一列中显示**NULL**是因为我们当前没有选择任何数据库。因此，使用下面的语句先选择一个数据库,就能看到相应的结果。

    mysql> use Tecmint;
    
    Reading table information for completion of table and column names
    You can turn off this feature to get a quicker startup with -A
    
    Database changed

----------

    mysql> select VERSION(), DATABASE();
    
    +-------------------------+------------+
    | VERSION()               | DATABASE() |
    +-------------------------+------------+
    | 5.5.34-0ubuntu0.13.10.1 | tecmint    |
    +-------------------------+------------+
    1 row in set (0.00 sec)

### 2. 使用非运算符(!)从表"Tecmint"中列出除了"SAM"以外的所有user记录

**答**：使用下面的语句 

    mysql> SELECT * FROM Tecmint WHERE user !=SAM;
    
    +---------------------+---------+---------+---------+---------+-------+ 
    | date                | user    | host 	 | root     | local   | size  | 
    +---------------------+---------+---------+---------+---------+-------+ 
    | 2001-05-14 14:42:21 | Anthony | venus  | barb     | venus   | 98151 | 
    | 2001-05-15 08:50:57 | TIM     | venus  | phil     | venus   | 978   | 
    +---------------------+---------+---------+---------+---------+-------+

### 3. ‘AND’运算符有可能带着非运算符(!)一起用吗？

**答**：当我们使用‘=’号时用‘AND’连接，用‘!=’时用‘OR’连接，下面是‘=’和AND运算符一起用的例子

    mysql> SELECT * FROM mail WHERE user = SAM AND root = phil

‘!=’和OR运算符的例子

    mysql> SELECT * FROM mail WHERE user != SAM OR root != phil
    
    +---------------------+---------+---------+---------+---------+-------+ 
    | date                | user    | host    | root    | local   | size  | 
    +---------------------+---------+---------+---------+---------+-------+ 
    | 2001-05-14 14:42:21 | Anthony | venus   | barb    | venus   | 98151 | 
    +---------------------+---------+---------+---------+---------+-------+

- = : 等于
- != : 不等于
- ! : 代表“非”的运算符

AND和OR在MySQL中被看作连接运算符

### 4. IFNULL()当打在MySQL中有什么作用? ###

**答**：使用**IFNULL()**方法能使MySQL中的查询更加精确。IFNULL()方法将会测试它的第一个参数，若不为NULL则返回该参数的值，否则返回第二个参数的值

    mysql> SELECT name, IFNULL(id,'Unknown') AS 'id' FROM taxpayer;
    
    +---------+---------+ 
    | name 	  | id      | 
    +---------+---------+ 
    | bernina | 198-48  | 
    | bertha  | Unknown | 
    | ben     | Unknown | 
    | bill    | 475-83  | 
    +---------+---------+

### 5. 如果你只想知道从一个结果集的开头或者结尾开始的特定几条记录，该如何实现？

**答**：我们需要把**LIMIT**语句接在**ORDER BY**语句后使用，以达到上述效果。

#### 显示一行记录 ####

    mysql> SELECT * FROM name LIMIT 1;
    
    +----+------+------------+-------+----------------------+------+ 
    | id | name | birth      | color | foods                | cats | 
    +----+------+------------+-------+----------------------+------+ 
    | 1  | Fred | 1970-04-13 | black | lutefisk,fadge,pizza | 0    | 
    +----+------+------------+-------+----------------------+------+

#### 显示5行记录 ####

    mysql> SELECT * FROM profile LIMIT 5;
    
    +----+------+------------+-------+-----------------------+------+ 
    | id | name | birth      | color | foods                 | cats | 
    +----+------+------------+-------+-----------------------+------+ 
    | 1  | Fred | 1970-04-13 | black | lutefisk,fadge,pizza  | 0    | 
    | 2  | Mort | 1969-09-30 | white | burrito,curry,eggroll | 3    | 
    | 3  | Brit | 1957-12-01 | red   | burrito,curry,pizza   | 1    |   
    | 4  | Carl | 1973-11-02 | red   | eggroll,pizza         | 4    | 
    | 5  | Sean | 1963-07-04 | blue  | burrito,curry         | 5    | 
    +----+------+------------+-------+-----------------------+------+

#### 显示按照ORDER BY排序后的第一条记录 ####

    mysql> SELECT * FROM profile ORDER BY birth LIMIT 1;
    
    +----+------+------------+-------+----------------+------+ 
    | id | name | birth      | color | foods          | cats | 
    +----+------+------------+-------+----------------+------+ 
    | 9  | Dick | 1952-08-20 | green | lutefisk,fadge | 0    | 
    +----+------+------------+-------+----------------+------+

### 6. Oracle 和 MySQL该如何选择，为什么? ###

**答**：它们都有各自的优点和缺点。考虑到时间因素，我倾向于MySQL。

#### 选择MySQL而不选orcale的原因 ####

- MySQL开源
- MySQL轻便快捷  
- MySQL对命令行和图形界面的支持都很好
- MySQL支持通过Query Browser进行管理

### 7. MySQL中如何得到当前日期? ###

**答**：在MySQL中获取当前日期就是如下的SELECT语句这么简单。

    mysql> SELECT CURRENT_DATE();
    
    +----------------+
    | CURRENT_DATE() |
    +----------------+
    | 2014-06-17     |
    +----------------+

### 8. MySQL中如何将表导出为XML文件? ###

**答**：我们可以使用'-e'(export)选项来把MySQL表或整个数据库导出到XML文件。当处理大型表的时候我们可能需要手动导出，不过对于小表的话可以直接使用想phpMyAdmin等这样的工具。

    mysql -u USER_NAME -xml -e 'SELECT * FROM table_name' > table_name.xml

上面的例子中USER_NAME是数据库的用户名，table_name是待导出为xml文件的表名，table_name.xml是存放数据的xml文件

### 9. MySQL_pconnect是什么? 它和MySQL_connect有什么区别? ###

**答**：MySQL_pconnect()打开一个持久的数据库连接，这意味着数据库不是在每次页面加载的时候被打开一个新连接，因此我们不能使用MySQL_close()来关闭一个持久的连接

MySQL_pconnect和MySQL_connect最简要的区别是：

与MySQL_pconnect不同，MySQL_connect在每次页面被加载的时候打开连接，这个连接可以使用MySQL_close()语句来关闭

### 10. 当你需要查看一个名为'mysql'的数据库中'user'表中的所有索引时，你会如何做? ###

**答**：下面的命令将会显示出‘user’表中所有的索引

    mysql> show index from user;
    +-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+ 
    | Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | 
    +-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+ 
    | user  |          0 | PRIMARY  |            1 | Host        | A         |        NULL |     NULL | NULL   |      | BTREE      |         |               | 
    | user  |          0 | PRIMARY  |            2 | User        | A         |           4 |     NULL | NULL   |      | BTREE      |         |               | 
    +-------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+ 
    2 rows in set (0.00 sec)

### 11. 什么是CSV表? ###

**答**：CSV是逗号分隔值（Comma-Separated Values）或也被称为字符分隔值（Character-Separated Values）的缩写。CSV表以纯文本和表格形式来存储数据。

每一条记录都使用特定的分隔符隔开(如逗号,分号,...)，并且每条记录都有着顺序相同的列。CSV表最广泛地被用来存储用于导入和导出的电话联系人，并能够用来存储任何类型的纯文本数据。

以上就是这次要讲的全部内容。我还会带来其他你们应该会喜欢的有趣的文章。到那时敬请关注并访问Tecmint，不要忘了在下方的评论栏中留下你们的宝贵意见。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/mysql-advance-interview-questions/

译者：[GOLinux](https://github.com/GOLinux) 校对：[ReiNoir](https://github.com/reinoir)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/basic-mysql-interview-questions-for-database-administrators/
[2]:http://www.tecmint.com/10-mysql-database-interview-questions-for-beginners-and-intermediates/
