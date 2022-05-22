[#]: subject: (Refactor your applications to Kubernetes)
[#]: via: (https://opensource.com/article/21/6/tackle-diva-kubernetes)
[#]: author: (Yasu Katsuno https://opensource.com/users/yasu-katsuno)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Refactor your applications to Kubernetes
======
Tackle-DiVA helps developers understand database operations and
transaction processes inside applications.
![Tips and gears turning][1]

Application modernization developers must be able to understand database operations and transaction processes inside applications precisely. [Tackle-DiVA][2] (Data-intensive Validity Analyzer) is an open source data-centric Java application analysis tool in the [Konveyor Tackle project][3] that aims at refactoring applications to Kubernetes.

This article gives an overview of Tackle-DiVA and presents example instructions and analysis results.

### What is Tackle-DiVA?

Tackle-DiVA is built using Java and Python and operated using a command-line interface. It imports target Java application source files and provides analysis results as files.

![Tackle-DiVA operation][4]

(Yasuharu Katsuno, [CC BY-SA 4.0][5])

Breaking down this diagram:

  * **Service entry inventory** analysis extracts a list of Java classes for implementing public APIs.
  * **Database inventory** analysis exports a list of database tables operated by an application.
  * **Transaction inventory** extracts a set of transaction processes.
  * **Code-to-database dependency** analyzes which Java class operates which database table.
  * The **database-to-database** and **transaction-to-transaction dependency** analyses find clues for transforming parallel executions.
  * Finally, **transaction refactoring recommendation** analysis shows parallel executable transactions from original sequential executions.



### Try it out!

It is easy to get started with Tackle-DiVA. It makes full use of [Docker][6] containers, and the only prerequisite is a Docker-runnable environment, such as RedHat Enterprise Linux, Ubuntu, or macOS.

Once you have Docker available on your machine, run:


```
$ cd /tmp
$ git clone <https://github.com/konveyor/tackle-diva.git> &amp;&amp; tackle-diva
$ docker build . -t diva
```

This builds Tackle-DiVA and packs it as a Docker image. Tackle-DiVA is now ready to use on your machine.

The next step is to prepare source codes of your target Java applications. I'll use the [DayTrader][7] application as an example:


```
$ cd /tmp
$ git clone <https://github.com/WASdev/sample.daytrader7.git>
```

The final step is to execute the `diva_docker` command by attaching the full directory path:


```
$ cd /tmp/tackle-diva/distrib/bin/
$ ./diva_docker /tmp/sample.daytrader7/
```

This creates the `tackle-diva/distrib/output` directory and stores the analysis result files:


```
$ ls /tmp/tackle-diva/distrib/output
contexts.yml            transaction.json        transaction_summary.dot
database.json           transaction.yml         transaction_summary.pdf
```

### Explore the analysis results

Take a look at some analysis results for the DayTrader application.

The **service entry inventory** result is stored in the `contexts.yml` file. It finds that the `TradeAppServlet.init class/method` plays a key role in service entries for the `login` and `register` actions:


```
\- entry:
   methods:
  - "com.ibm.websphere.samples.daytrader.web.TradeAppServlet.init"
 http-param:
   action:
  - "login"
\- entry:
   methods:
  - "com.ibm.websphere.samples.daytrader.web.TradeAppServlet.init"
 http-param:
   action:
  - "register"
```

The **database inventory** analysis exports six database tables in the `database.json` file. These tables are used in the DayTrader application:


```
{
 "/app": [
   "orderejb",
   "holdingejb",
   "quoteejb",
   "accountejb",
   "keygenejb",
   "accountprofileejb"
 ]
}
```

The **transaction inventory** analysis result is dumped into the `transaction.json` and `.yml` files, but it's better to check the `transaction_summary.pdf` file when looking through transactions. The following transaction consists of six SQL operations to two database tables: `holdingejb` and `orderejb`:

![Tackle-DiVA transaction inventory][8]

(Yasuharu Katsuno, [CC BY-SA 4.0][5])

The `transaction.json` and `.yml` files also contain **code-to-database dependency** analysis results. The following shows how the TradeDirect class invokes query operations to two database tables, `accountprofileejb` and `accountejb`:


```
"stacktrace" : [
  ...
  {
  "method" : "&lt;src-method: &lt; Source,
              Lcom/ibm/websphere/samples/daytrader/direct/TradeDirect,
              getStatement(Ljava/sql/Connection;Ljava/lang/String;)
              Ljava/sql/PreparedStatement; &gt;&gt;",
  "file" : "/app/daytrader-ee7-ejb/src/
            main/java/com/ibm/websphere/
            samples/daytrader/direct/TradeDirect.java",
  "position" : "TradeDirect.java [1935:15] -&gt; [1935:41]"
  }
],
"sql" : "select * from accountprofileejb ap where ap.userid = (
            select profile_userid from accountejb a where a.profile_userid=?)"
```

The **database-to-database dependency** analysis result is located in the `transaction_summary.dot `and `.pdf` files. The `accoutprofileejb` and `accoutejb` database tables have a mutual-query relationship:

![Tackle-DiVA database-to-database dependency][9]

(Yasuharu Katsuno, [CC BY-SA 4.0][5])

The **transaction-to-transaction dependency** analysis results are found in the `transaction_summary.dot` and `.pdf` files. Two transactions have a dependency on the `orderejb` database table. The upper transaction updates the table, and the lower transaction queries it:

![Tackle-DiVA transaction-to-transaction dependency][10]

(Yasuharu Katsuno, [CC BY-SA 4.0][5])

Finally, parallel executable transactions are shown in the `transaction_summary.dot` and `.pdf` files, resulting from the **transaction refactoring recommendation** analysis. In this example, two transactions in the lower part can be executed in parallel after the upper transaction processing completes, which helps keep data consistency due to no transaction dependencies:

![Tackle-DiVA transaction refactoring recommendation][11]

(Yasuharu Katsuno, [CC BY-SA 4.0][5])

### Learn more

To learn more about application refactoring, check out the [Konveyor Tackle site][12], join the community, and access the source code on [GitHub][2].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/tackle-diva-kubernetes

作者：[Yasu Katsuno][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/yasu-katsuno
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk (Tips and gears turning)
[2]: https://github.com/konveyor/tackle-diva
[3]: https://www.konveyor.io/tackle
[4]: https://opensource.com/sites/default/files/uploads/tackle-diva_operation.png (Tackle-DiVA operation)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/resources/what-docker
[7]: https://github.com/WASdev/sample.daytrader7
[8]: https://opensource.com/sites/default/files/uploads/tackle-diva_transaction-inventory.png (Tackle-DiVA transaction inventory)
[9]: https://opensource.com/sites/default/files/uploads/tackle-diva_dbtodb.png (Tackle-DiVA database-to-database dependency)
[10]: https://opensource.com/sites/default/files/uploads/tackle-diva_ttot.png (Tackle-DiVA transaction-to-transaction dependency)
[11]: https://opensource.com/sites/default/files/uploads/tackle-diva_transaction-refactoring.png (Tackle-DiVA transaction refactoring recommendation)
[12]: https://github.com/konveyor/tackle
