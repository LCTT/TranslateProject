[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11593-1.html)
[#]: subject: (Getting started with PostgreSQL)
[#]: via: (https://opensource.com/article/19/11/getting-started-postgresql)
[#]: author: (Greg Pittman https://opensource.com/users/greg-p)

PostgreSQL 入门
======

> 安装、设置、创建和开始使用 PostgreSQL 数据库。

![](https://img.linux.net.cn/data/attachment/album/201911/20/085936u10q7eme1euu4ak3.jpg)

每个人或许都有需要在数据库中保存的东西。即使你执着于使用纸质文件或电子文件，它们也会变得很麻烦。纸质文档可能会丢失或混乱，你需要访问的电子信息可能会隐藏在段落和页面的深处。

在我从事医学工作的时候，我使用 [PostgreSQL][2] 来跟踪我的住院患者名单并提交有关住院患者的信息。我将我的每日患者名单打印在口袋里，以便快速了解患者房间、诊断或其他细节的任何变化并做出快速记录。

我以为一切没问题，直到去年我妻子决定买一辆新车，我“接手”了她以前的那辆车。她保留了汽车维修和保养服务收据的文件夹，但随着时间的流逝，它变得杂乱。与其花时间筛选所有纸条以弄清楚什么时候做了什么，我认为 PostgreSQL 将是更好的跟踪此信息的方法。

### 安装 PostgreSQL

自上次使用 PostgreSQL 以来已经有一段时间了，我已经忘记了如何使用它。实际上，我甚至没有在计算机上安装它。安装它是第一步。我使用 Fedora，因此在控制台中运行：

```
dnf list postgresql*
```

请注意，你无需使用 `sudo` 即可使用 `list` 选项。该命令返回了很长的软件包列表。看了眼后，我决定只需要三个：postgresql、postgresql-server 和 postgresql-docs。

为了了解下一步需要做什么，我决定查看 [PostgreSQL 文档][3]。文档参考内容非常丰富，实际上，丰富到令人生畏。幸运的是，我发现我在升级 Fedora 时曾经做过的一些笔记，希望有效地导出数据库，在新版本上重新启动 PostgreSQL，以及导入旧数据库。

### 设置 PostgreSQL

与大多数其他软件不同，你不能只是安装好 PostgreSQL 就开始使用它。你必须预先执行两个基本步骤：首先，你需要设置 PostgreSQL，第二，你需要启动它。你必须以 `root` 用户身份执行这些操作（`sudo` 在这里不起作用）。

要设置它，请输入：

```
postgresql-setup –initdb
```

这将确定 PostgreSQL 数据库在计算机上的位置。然后（仍为 `root`）输入以下两个命令：

```
systemctl start postgresql.service
systemctl enable postgresql.service
```

第一个命令为当前会话启动 PostgreSQL（如果你关闭机器，那么 PostgreSQL 也将关闭）。第二个命令使 PostgreSQL 在随后的重启中自动启动。

### 创建用户

PostgreSQL 正在运行，但是你仍然不能使用它，因为你还没有用户。为此，你需要切换到特殊用户 `postgres`。当你仍以 `root` 身份运行时，输入：

```
su postgres
```

由于你是以 `root` 的身份执行此操作的，因此无需输入密码。root 用户可以在不知道密码的情况下以任何用户身份操作；这就是使其强大而危险的原因之一。

现在你就是 `postgres` 了，请运行下面两个命令，如下所示创建用户（创建用户 `gregp`）：

```
createuser gregp
createdb gregp
```

你可能会看到错误消息，如：`Could not switch to /home/gregp`。这只是意味着用户 `postgres`不能访问该目录。尽管如此，你的用户和数据库已创建。接下来，输入 `exit` 并按回车两次，这样就回到了原来的用户下（`root`）。

### 设置数据库

要开始使用 PostgreSQL，请在命令行输入 `psql`。你应该在每行左侧看到类似 `gregp=>` 的内容，以显示你使用的是 PostgreSQL，并且只能使用它理解的命令。你自动获得一个数据库（我的名为 `gregp`），它里面完全没有内容。对 PostgreSQL 来说，数据库只是一个工作空间。在空间内，你可以创建*表*。表包含变量列表，而表中的每个变量是构成数据库的数据。

以下是我设置汽车服务数据库的方式：

```
CREATE TABLE autorepairs (
        date            date,
        repairs         varchar(80),
        location        varchar(80),
        cost            numeric(6,2)
);
```

我本可以在一行内输入，但为了更好地说明结构，并表明 PostgreSQL 不会解释制表符和换行的空白，我分成了多行。字段包含在括号中，每个变量名和数据类型与下一个变量用逗号分隔（最后一个除外），命令以分号结尾。所有命令都必须以分号结尾！

第一个变量名是 `date`，它的数据类型也是 `date`，这在 PostgreSQL 中没关系。第二个和第三个变量 `repairs` 和 `location` 都是 `varchar(80)` 类型，这意味着它们可以是最多 80 个任意字符（字母、数字等）。最后一个变量  `cost` 使用 `numeric` 类型。括号中的数字表示最多有六位数字，其中两位是小数。最初，我尝试了 `real` 类型，这将是一个浮点数。`real` 类型的问题是作为数据类型在使用时，在遇到 `WHERE` 子句，类似 `WHERE cost = 0` 或其他任何特定数字。由于 `real` 值有些不精确，因此特定数字将永远不会匹配。

### 输入数据

接下来，你可以使用 `INSERT INTO` 命令添加一些数据（在 PostgreSQL 中称为*行*）：

```
INSERT INTO autorepairs VALUES ('2017-08-11', 'airbag recall', 'dealer', 0);
```

请注意，括号构成了一个值的容器，它必须以正确的顺序，用逗号分隔，并在命令末尾加上分号。`date` 和 `varchar(80)` 类型的值必须包含在单引号中，但数字值（如 `numeric`）不用。作为反馈，你应该会看到：

```
INSERT 0 1
```

与常规终端会话一样，你会有输入命令的历史记录，因此，在输入后续行时，通常可以按向上箭头键来显示最后一个命令并根据需要编辑数据，从而节省大量时间。

如果出了什么问题怎么办？使用 `UPDATE` 更改值：

```
UPDATE autorepairs SET date = '2017-11-08' WHERE repairs = 'airbag recall';
```

或者，也许你不再需要表中的行。使用 `DELETE`：

```
DELETE FROM autorepairs WHERE repairs = 'airbag recall';
```

这将删除整行。

最后一件事：即使我在 PostgreSQL 命令中一直使用大写字母（在大多数文档中也这么做），你也可以用小写字母输入，我也经常如此。

### 输出数据

如果你想展示数据，使用 `SELECT`：

```
SELECT * FROM autorepairs ORDER BY date;
```

没有 `ORDER BY` 的话，行将不管你输入的内容来显示。例如，以下就是我终端中输出的我的汽车服务数据：

```
SELECT date, repairs FROM autorepairs ORDER BY date;

    date   |                             repairs                             
-----------+-----------------------------------------------------------------
2008-08-08 | oil change, air filter, spark plugs
2011-09-30 | 35000 service, oil change, rotate tires/balance wheels
2012-03-07 | repl battery
2012-11-14 | 45000 maint, oil/filter
2014-04-09 | 55000 maint, oil/filter, spark plugs, air/dust filters
2014-04-21 | replace 4 tires
2014-04-21 | wheel alignment
2016-06-01 | 65000 mile service, oil change
2017-05-16 | oil change, replce oil filt housing
2017-05-26 | rotate tires
2017-06-05 | air filter, cabin filter,spark plugs
2017-06-05 | brake pads and rotors, flush brakes
2017-08-11 | airbag recall
2018-07-06 | oil/filter change, fuel filter, battery svc
2018-07-06 | transmission fl, p steering fl, rear diff fl
2019-07-22 | oil &amp; filter change, brake fluid flush, front differential flush
2019-08-20 | replace 4 tires
2019-10-09 | replace passenger taillight bulb
2019-10-25 | replace passenger taillight assembly
(19 rows)
```

要将此发送到文件，将输出更改为：


```
\o autorepairs.txt
```

然后再次运行 `SELECT` 命令。

### 退出 PostgreSQL

最后，在终端中退出 PostgreSQL，输入：

```
quit
```

或者它的缩写版：

```
\q
```

虽然这只是 PostgreSQL 的简要介绍，但我希望它展示了将数据库用于这样的简单任务既不困难也不费时。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/getting-started-postgresql

作者：[Greg Pittman][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Guy on a laptop on a building)
[2]: https://www.postgresql.org/
[3]: http://www.postgresql.org/docs
