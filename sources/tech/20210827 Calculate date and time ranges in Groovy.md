[#]: subject: "Calculate date and time ranges in Groovy"
[#]: via: "https://opensource.com/article/21/8/groovy-date-time"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Calculate date and time ranges in Groovy
======
Use Groovy date and time to discover and display time increments.
![clock][1]

Every so often, I need to do some calculations related to dates. A few days ago, a colleague asked me to set up a new project definition in our (open source, of course!) project management system. This project is to start on the 1st of August and finish on the 31st of December. The service to be provided is budgeted at 10 hours per week.

So, yeah, I had to figure out how many weeks between 2021-08-01 and 2021-12-31 inclusive.

This is the perfect sort of problem to solve with a tiny [Groovy][2] script.

### Install Groovy on Linux

Groovy is based on Java, so it requires a Java installation. Both a recent and decent version of Java and Groovy might be in your Linux distribution's repositories. Alternately, you can install Groovy by following the instructions on the [groovy-lang.org][2].

A nice alternative for Linux users is [SDKMan][3], which can be used to get multiple versions of Java, Groovy, and many other related tools. For this article, I'm using my distro's OpenJDK11 release and SDKMan's latest Groovy release.

### Solving the problem with Groovy

Since Java 8, time and date calculations have been folded into a new package called **java.time**, and Groovy provides access to that. Here’s the script:


```
import java.time.*

import java.time.temporal.*

def start = LocalDate.parse('2021-08-01','yyyy-MM-dd')

def end = LocalDate.parse('2022-01-01','yyyy-MM-dd')

println "${ChronoUnit.WEEKS.between(start,end)} weeks between $start and $end"
```

Copy this code into a file called **wb.groovy** and run it on the command line to see the results:


```
$ groovy wb.groovy
21 weeks between 2021-08-01 and 2022-01-01
```

Let’s review what’s going on.

### Date and time

The [**java.time.LocalDate** class][4] provides many useful static methods (like **parse()** shown above, which lets us convert from a string to a **LocalDate** instance according to a pattern, in this case, **‘yyyy-MM-dd’**). The format characters are explained in quite a number of places–for example, the documentation for [**java.time.format.DateTimeFormat**][5]. Notice that **M** represents “month,” not **m**, which represents “minute.” So this pattern defines a date formatted as a four-digit year, followed by a hyphen, followed by a two-digit month number (1-12), followed by another hyphen, followed by a two-digit day-of-month number (1-31).

Notice as well that in Java, **parse()** requires an instance of **DateTimeFormat**:


```
`parse(CharSequence text, DateTimeFormatter formatter)`
```

As a result, parsing becomes a two-step operation, whereas Groovy provides an additional version of **parse()** that accepts the format string directly in place of the **DateTimeFormat** instance.

The [**java.time.temporal.ChronoUnit** class][6], actually an **Enum**, provides several **Enum constants**, like **WEEKS** (or **DAYS**, or **CENTURIES**...) which in turn provide the **between()** method that allows us to calculate the interval of those units between two **LocalDates** (or other similar date or time data types). Note that I used January 1, 2022, as the value for **end**; this is because **between()** spans the time period starting on the first date given up to but not including the second date given.

### More date arithmetic

Every so often, I need to know how many working days are in a specific time frame (like, say, a month). This handy script will calculate that for me:


```
import java.time.*

def holidaySet = [LocalDate.parse('2021-01-01'), LocalDate.parse('2021-04-02'),
    LocalDate.parse('2021-04-03'), LocalDate.parse('2021-05-01'),
    LocalDate.parse('2021-05-15'), LocalDate.parse('2021-05-16'),
    LocalDate.parse('2021-05-21'), LocalDate.parse('2021-06-13'),
    LocalDate.parse('2021-06-21'), LocalDate.parse('2021-06-28'),
    LocalDate.parse('2021-06-16'), LocalDate.parse('2021-06-18'),
    LocalDate.parse('2021-08-15'), LocalDate.parse('2021-09-17'),
    LocalDate.parse('2021-09-18'), LocalDate.parse('2021-09-19'),
    LocalDate.parse('2021-10-11'), LocalDate.parse('2021-10-31'),
    LocalDate.parse('2021-11-01'), LocalDate.parse('2021-11-21'),
    LocalDate.parse('2021-12-08'), LocalDate.parse('2021-12-19'),
    LocalDate.parse('2021-12-25')] as [Set][7]

def weekendDaySet = [DayOfWeek.SATURDAY,DayOfWeek.SUNDAY] as [Set][7]

int calcWorkingDays(start, end, holidaySet, weekendDaySet) {
    (start..&lt;end).inject(0) { subtotal, d -&gt;
        if (!(d in holidaySet || DayOfWeek.from(d) in weekendDaySet))
            subtotal + 1
        else
            subtotal
    }
}

def start = LocalDate.parse('2021-08-01')
def end = LocalDate.parse('2021-09-01')

println "${calcWorkingDays(start,end,holidaySet,weekendDaySet)} working day(s) between $start and $end"
```

Copy this code into a file called **wdb.groovy** and run it from the command line to see the results:


```
$ groovy wdb.groovy
22 working day(s) between 2021-08-01 and 2021-09-01
```

Let’s review this.

First, I create a set of holiday dates (these are Chile’s “días feriados” for 2021, in case you wondered) called holidaySet. Note that the default pattern for **LocalDate.parse()** is ‘**yyyy-MM-dd**’, so I’ve left the pattern out here. Note as well that I’m using the Groovy shorthand **[a,b,c]** to create a **List** and then coercing it to a **Set**.

Next, I want to skip Saturdays and Sundays, so I create another set incorporating two **enum** values of [**java.time.DayOfWeek**][8]–**SATURDAY** and **SUNDAY**.

Then I define a method **calcWorkingDays()** that takes as arguments the start date, the end date (which following the previous example of **between()** is the first value outside the range I want to consider), the holiday set, and the weekend day set. Line by line, this method:

  * Defines a range between **start** and **end**, open on the **end**, (that’s what **&lt;end** means) and executes the closure argument passed to the **inject()** method (**inject()** implements the 'reduce' operation on **List** in Groovy) on the successive elements **d** in the range:
    * As long as **d** is neither in the **holidaySet** nor in the **weekendDaySet**, increments the **subtotal** by 1
  * Returns the value of the result returned by **inject()**



Next, I define the **start** and **end** dates between which I want to calculate working days.

Finally, I call **println** using a Groovy [**GString**][9] to evaluate the **calcWorkingDays()** method and display the result.

Note that I could have used the **each** closure instead of **inject**, or even a **for** loop. I could have also used Java Streams rather than Groovy ranges, lists, and closures. Lots of options.

### But why not use groovy.Date?

Some of you old Groovy users may be wondering why I’m not using good old [**groovy.Date**][10]. The answer is, I could use it. But Groovy Date is based on Java Date, and there are some good reasons for moving to **java.time**, even though Groovy Date added quite a few nice things to Java Date.

For me, the main reason is that there are some not-so-great design decisions buried in the implementation of Java Date, the worst being that it is unnecessarily mutable. I spent a while tracking down a weird bug that arose from my poor understanding of the **clearTime()** method on Groovy Date. I learned it actually clears the time field of the date instance, rather than returning the date value with the time part set to ‘00:00:00’.

Date instances also aren’t thread-safe, which can be kind of challenging for multithreaded applications.

Finally, having both date and time wrapped up in a single field isn’t always convenient and can lead to some weird data modeling contortions. Think, for instance, of a day on which multiple events occur: Ideally, the _date_ field would be on the day, and the _time_ field would be on each event; but that’s not easy to do with Groovy Date.

### Groovy is groovy

Groovy is an Apache project, and it provides a simplified syntax for Java so you can use it for quick and simple scripts in addition to complex applications. You retain the power of Java, but you access it with an efficient toolset. [Try it soon][11], and see if you find your groove with Groovy.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/groovy-date-time

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/clock_1.png?itok=lbyiCJWV (clock)
[2]: https://groovy-lang.org/
[3]: https://sdkman.io/
[4]: https://docs.groovy-lang.org/latest/html/groovy-jdk/java/time/LocalDate.html
[5]: https://docs.oracle.com/javase/8/docs/api/java/time/format/DateTimeFormatter.html
[6]: https://docs.oracle.com/javase/8/docs/api/java/time/temporal/ChronoUnit.html
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+set
[8]: https://docs.oracle.com/javase/8/docs/api/java/time/DayOfWeek.html
[9]: https://docs.groovy-lang.org/latest/html/api/groovy/lang/GString.html
[10]: https://docs.groovy-lang.org/latest/html/groovy-jdk/java/util/Date.html
[11]: https://groovy.apache.org/download.html
