[#]: subject: "Install JDBC on Linux in 3 steps"
[#]: via: "https://opensource.com/article/22/9/install-jdbc-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15103-1.html"

3 步在 Linux 上安装 JDBC
======

> 安装 Java，使用 Maven 安装 JDBC，并安装数据库。然后，你就可以在 Java 代码中与数据库进行交互了。

![](https://img.linux.net.cn/data/attachment/album/202210/04/101923dpc8nnzsz5xxpn1x.jpg)

当你编写一个应用时，需要数据存储是很常见的。有时你要存储你的应用需要的素材数据，其他时候你要存储用户数据，包括偏好和保存的数据。存储数据的一种方式是在数据库中，为了在你的代码和数据库之间进行通信，你需要为你的语言提供一个数据库绑定或连接器。对于 Java 来说，一个常见的数据库连接器是 JDBC（<ruby>Java 数据库连接<rt>Java database connectivity</rt></ruby>）。

### 1、安装 Java

当然，要使用 Java 进行开发，你还必须安装 Java。对于 Linux、macOS 和 WSL 或 Cygwin，我推荐 [SDKman][2]。对于 Windows，你可以从 [developers.redhat.com][3] 下载 OpenJDK。

### 2、使用 Maven 安装 JDBC

JDBC 是一种 API，通过语句 `import java.sql.*` 导入到你的代码中，但要使其有用，你必须安装数据库驱动和数据库以与之交互。你使用的数据库驱动和要通信的数据库必须匹配：要与 MySQL 交互，你需要 MySQL 驱动，要与 SQLite3 交互，你必须具有 SQLite3 驱动等等。

在本文中，我使用 [PostgreSQL][4]，但所有主流数据库，包括 [MariaDB][5] 和 [SQLite3][6]，都有 JDBC 驱动程序。

你可以从 [jdbc.postgresql.org][7] 下载 JDBC for PostgreSQL。我使用 [Maven][8] 来管理 Java 依赖项，因此我将它包含在 `pom.xml` 中（调整 [Maven Central][9] 上的当前版本号）：

```
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <version>42.5.0</version>
</dependency>
```

### 3、安装数据库

你必须安装要通过 JDBC 连接的数据库。有几个非常好的开源数据库，但是我只能为这篇文章选择一个，所以我选择了 PostgreSQL。

要在 Linux 上安装 PostgreSQL，请使用你的软件仓库。在 Fedora、CentOS、Mageia 和类似设备上：

```
$ sudo dnf install postgresql postgresql-server
```

在 Debian、Linux Mint、Elementary 和类似平台上：

```
$ sudo apt install postgresql postgresql-contrib
```

### 数据库连接

如果你不使用 PostgreSQL，同样的一般过程也适用：

1. 安装 Java。
2. 为你选择的数据库找到 JDBC 驱动，并将其包含在你的 `pom.xml` 文件中。
3. 在你的开发系统上安装数据库（服务器和客户端）。

三个步骤，你就可以开始编写代码了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/install-jdbc-linux

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/java-coffee-mug.jpg
[2]: https://opensource.com/article/22/3/manage-java-versions-sdkman
[3]: https://developers.redhat.com/products/openjdk/download?intcmp=7013a000002qLH8AAM
[4]: http://LINK-TO-POSTGRESQL-INTRO-ARTICLE
[5]: https://www.redhat.com/sysadmin/mysql-mariadb-introduction
[6]: https://opensource.com/article/21/2/sqlite3-cheat-sheet
[7]: https://jdbc.postgresql.org/download.html
[8]: https://opensource.com/article/22/3/maven-manage-java-dependencies
[9]: https://mvnrepository.com/artifact/org.postgresql/postgresql
