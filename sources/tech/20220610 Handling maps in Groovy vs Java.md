[#]: subject: "Handling maps in Groovy vs Java"
[#]: via: "https://opensource.com/article/22/6/maps-groovy-vs-java"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Handling maps in Groovy vs Java
======
Discover the differences in map handling between Groovy and Java with this hands-on demo.

![women programming][1]

Image by: WOCinTech Chat. Modified by Opensource.com. CC BY-SA 4.0

Java is a great programming language, but sometimes I want a Java-like language that's just a bit more flexible and compact. That's when I opt for [Groovy][2].

In a recent article, I reviewed some of the differences between [creating and initializing maps in Groovy][3] and doing the same thing in Java. In brief, Groovy has a concise syntax for setting up maps and accessing map entries compared to the effort necessary in Java.

This article will delve into more differences in map handling between Groovy and Java. For that purpose, I will use the [sample table of employees][4] used for demoing the JavaScript DataTables library. To follow along, start by making sure you have recent versions of Groovy and Java installed on your computer.

### Install Java and Groovy

Groovy is based on Java and requires a Java installation as well. A recent and/or decent version of Java and Groovy might already be in your Linux distribution's repositories, or you can download and install Groovy from the [Apache Groovy website][5]. A good option for Linux users is [SDKMan][6], which can be used to get multiple versions of Java, Groovy, and many other related tools. For this article, I'm using SDK's releases of:

* Java: version 11.0.12-open of OpenJDK 11
* Groovy: version 3.0.8.

### Back to the problem: maps

First, in my experience, maps and lists (or at least arrays) often end up in the same program. For example, processing an input file is very similar to passing over a list; often, I do that when I want to categorize data encountered in the input file (or list), storing some kind of value in lookup tables, which are just maps.

Second, Java 8 introduced the whole Streams functionality and lambdas (or anonymous functions). In my experience, converting input data (or lists) into maps often involves using Java Streams. Moreover, Java Streams are at their most flexible when dealing with streams of typed objects, providing grouping and accumulation facilities out of the box.

### Employee list processing in Java

Here's a concrete example based on those fictitious employee records. Below is a Java program that defines an Employee class to hold the employee information, builds a list of Employee instances, and processes that list in a few different ways:

```
1  import java.lang.*;
2  import java.util.Arrays;

3  import java.util.Locale;
4  import java.time.format.DateTimeFormatter;
5  import java.time.LocalDate;
6  import java.time.format.DateTimeParseException;
7  import java.text.NumberFormat;
8  import java.text.ParseException;
 
9  import java.util.stream.Collectors;
 
10  public class Test31 {

11      static public void main(String args[]) {
       
12          var employeeList = Arrays.asList(
13              new Employee("Tiger Nixon", "System Architect",
14                  "Edinburgh", "5421", "2011/04/25", "$320,800"),
15              new Employee("Garrett Winters", "Accountant",
6                  "Tokyo", "8422", "2011/07/25", "$170,750"),
                                                        ...
    
81              new Employee("Martena Mccray", "Post-Sales support",
82                  "Edinburgh", "8240", "2011/03/09", "$324,050"),
83              new Employee("Unity Butler", "Marketing Designer",
84                  "San Francisco", "5384", "2009/12/09", "$85,675")
85          );
   
86          // calculate the average salary across the entire company
       
87          var companyAvgSal = employeeList.
88              stream().
89              collect(Collectors.averagingDouble(Employee::getSalary));
90          System.out.println("company avg salary = " + companyAvgSal);
   
91          // calculate the average salary for each location,
92          //     compare to the company average
       
93          var locationAvgSal = employeeList.
94              stream().
95              collect(Collectors.groupingBy((Employee e) ->
96                  e.getLocation(),
97                      Collectors.averagingDouble(Employee::getSalary)));
98          locationAvgSal.forEach((k,v) ->
99              System.out.println(k + " avg salary = " + v +
100                  "; diff from avg company salary = " +
101                  (v - companyAvgSal)));
  
102          // show the employees in Edinburgh approach #1
       
103          System.out.print("employee(s) in Edinburgh (approach #1):");
104          var employeesInEdinburgh = employeeList.
105              stream().
106              filter(e -> e.getLocation().equals("Edinburgh")).
107              collect(Collectors.toList());
108          employeesInEdinburgh.
109              forEach(e ->
110                  System.out.print(" " + e.getSurname() + "," +
111                      e.getGivenName()));
112          System.out.println();
       
       
113          // group employees by location

114          var employeesByLocation = employeeList.
115              stream().
116              collect(Collectors.groupingBy(Employee::getLocation));

117          // show the employees in Edinburgh approach #2

118          System.out.print("employee(s) in Edinburgh (approach #2):");
119          employeesByLocation.get("Edinburgh").
120              forEach(e ->
121                  System.out.print(" " + e.getSurname() + "," +
122                      e.getGivenName()));
123          System.out.println();

124      }
125  }
       
126  class Employee {
127      private String surname;
128      private String givenName;
129      private String role;
130      private String location;
131      private int extension;
132      private LocalDate hired;
133      private double salary;
       
134      public Employee(String fullName, String role, String location,
135          String extension, String hired, String salary) {
136          var nn = fullName.split(" ");
137          if (nn.length > 1) {
138              this.surname = nn[1];
139              this.givenName = nn[0];
140          } else {
141              this.surname = nn[0];
142              this.givenName = "";
143          }
144          this.role = role;
145          this.location = location;
146          try {
147              this.extension = Integer.parseInt(extension);
148          } catch (NumberFormatException nfe) {
149              this.extension = 0;
150          }
151          try {
152              this.hired = LocalDate.parse(hired,
153                  DateTimeFormatter.ofPattern("yyyy/MM/dd"));
154          } catch (DateTimeParseException dtpe) {
155              this.hired = LocalDate.EPOCH;
156          }
157          try {
158              this.salary = NumberFormat.getCurrencyInstance(Locale.US).
159                  parse(salary).doubleValue();
160          } catch (ParseException pe) {
161              this.salary = 0d;
162          }
163      }
       
164      public String getSurname() { return this.surname; }
165      public String getGivenName() { return this.givenName; }
166      public String getLocation() { return this.location; }
167      public int getExtension() { return this.extension; }
168      public LocalDate getHired() { return this.hired; }
169      public double getSalary() { return this.salary; }
170  }
```

Wow, that's a lot of code for a simple demo program! I'll go through it in chunks first.

Starting at the end, lines 126 through 170 define the `Employee` class used to store employee data. The most important thing to mention here is that the fields of the employee record are of different types, and in Java that generally leads to defining this type of class. You could make this code a bit more compact by using [Project Lombok's @Data][7] annotation to automatically generate the getters (and setters) for the `Employee` class. In more recent versions of Java, I can declare these sorts of things as a record rather than a class, since the whole point is to store data. Storing the data as a list of `Employee` instances facilitates the use of Java streams.

Lines 12 through 85 create the list of `Employee` instances, so now you've already dealt with 119 of 170 lines.

There are nine lines of import statements up front. Interestingly, there are no map-related imports! This is partly because I'm using stream methods that yield maps as their results, and partly because I'm using the `var` keyword to declare variables, so the type is inferred by the compiler.

The interesting parts of the above code happen in lines 86 through 123.

In lines 87-90, I convert `employeeList` into a stream (line 88) and then use `collect()` to apply the `Collectors.averagingDouble()` method to the `Employee::getSalary` (line 89) method to calculate the average salary across the whole company. This is pure functional list processing; no maps are involved.

In lines 93-101, I convert `employeeList` into a stream again. I then use the `Collectors.groupingBy()` method to create a map whose keys are employee locations, returned by `e.getLocation()`, and whose values are the average salary for each location, returned by `Collectors.averagingDouble()` again applied to the `Employee::getSalary` method applied to each employee in the location subset, rather than the entire company. That is, the `groupingBy()` method creates subsets by location, which are then averaged. Lines 98-101 use `forEach()` to step through the map entries printing location, average salary, and the difference between the location averages and company average.

Now, suppose you wanted to look at just those employees located in Edinburgh. One way to accomplish this is shown in lines 103-112, where I use the stream `filter()` method to create a list of only those employees based in Edinburgh and the `forEach()` method to print their names. No maps here, either.

Another way to solve this problem is shown in lines 113-123. In this method, I create a map where each entry holds a list of employees by location. First, in lines 113-116, I use the `groupingBy()` method to produce the map I want with keys of employee locations whose values are sublists of employees at that location. Then, in lines 117-123, I use the `forEach()` method to print out the sublist of names of employees at the Edinburgh location.

When we compile and run the above, the output is:

```
company avg salary = 292082.5
San Francisco avg salary = 284703.125; diff from avg company salary = -7379.375
New York avg salary = 410158.3333333333; diff from avg company salary = 118075.83333333331
Singapore avg salary = 357650.0; diff from avg company salary = 65567.5
Tokyo avg salary = 206087.5; diff from avg company salary = -85995.0
London avg salary = 322476.25; diff from avg company salary = 30393.75
Edinburgh avg salary = 261940.7142857143; diff from avg company salary = -30141.78571428571
Sydney avg salary = 90500.0; diff from avg company salary = -201582.5
employee(s) in Edinburgh (approach #1): Nixon,Tiger Kelly,Cedric Frost,Sonya Flynn,Quinn Rios,Dai Joyce,Gavin Mccray,Martena
employee(s) in Edinburgh (approach #2): Nixon,Tiger Kelly,Cedric Frost,Sonya Flynn,Quinn Rios,Dai Joyce,Gavin Mccray,Martena
```

### Employee list processing in Groovy

Groovy has always provided enhanced facilities for processing lists and maps, partly by extending the Java Collections library and partly by providing closures, which are somewhat like lambdas.

One outcome of this is that maps in Groovy can easily be used with different types of values. As a result, you can't be pushed into making the auxiliary Employee class; instead, you can just use a map. Let's examine a Groovy version of the same functionality:

```
1  import java.util.Locale
2  import java.time.format.DateTimeFormatter
3  import java.time.LocalDate
4  import java.time.format.DateTimeParseException
5  import java.text.NumberFormat
6  import java.text.ParseException
       
7  def employeeList = [
8      ["Tiger Nixon", "System Architect", "Edinburgh",
9          "5421", "2011/04/25", "\$320,800"],
10      ["Garrett Winters", "Accountant", "Tokyo",
11          "8422", "2011/07/25", "\$170,750"],

                           ...

76      ["Martena Mccray", "Post-Sales support", "Edinburgh",
77          "8240", "2011/03/09", "\$324,050"],
78      ["Unity Butler", "Marketing Designer", "San Francisco",
79          "5384", "2009/12/09", "\$85,675"]
80  ].collect { ef ->
81      def surname, givenName, role, location, extension, hired, salary
82      def nn = ef[0].split(" ")
83      if (nn.length > 1) {
84          surname = nn[1]
85          givenName = nn[0]
86      } else {
87          surname = nn[0]
88          givenName = ""
89      }
90      role = ef[1]
91      location = ef[2]
92      try {
93          extension = Integer.parseInt(ef[3]);
94      } catch (NumberFormatException nfe) {
95          extension = 0;
96      }
97      try {
98          hired = LocalDate.parse(ef[4],
99              DateTimeFormatter.ofPattern("yyyy/MM/dd"));
100      } catch (DateTimeParseException dtpe) {
101          hired = LocalDate.EPOCH;
102      }
103      try {
104          salary = NumberFormat.getCurrencyInstance(Locale.US).
105              parse(ef[5]).doubleValue();
106      } catch (ParseException pe) {
107          salary = 0d;
108      }
109      [surname: surname, givenName: givenName, role: role,
110          location: location, extension: extension, hired: hired, salary: salary]
111  }
       
112  // calculate the average salary across the entire company
       
113  def companyAvgSal = employeeList.average { e -> e.salary }
114  println "company avg salary = " + companyAvgSal
       
115  // calculate the average salary for each location,
116  //     compare to the company average
       
117  def locationAvgSal = employeeList.groupBy { e ->
118      e.location
119  }.collectEntries { l, el ->
120      [l, el.average { e -> e.salary }]
121  }
122  locationAvgSal.each { l, a ->
123      println l + " avg salary = " + a +
124          "; diff from avg company salary = " + (a - companyAvgSal)
125  }
       
126  // show the employees in Edinburgh approach #1
       
127  print "employee(s) in Edinburgh (approach #1):"
128  def employeesInEdinburgh = employeeList.findAll { e ->
129      e.location == "Edinburgh"
130  }
131  employeesInEdinburgh.each { e ->
132      print " " + e.surname + "," + e.givenName
133  }
134  println()
       
135  // group employees by location
       
136  def employeesByLocation = employeeList.groupBy { e ->
137      e.location
138  }
       
139  // show the employees in Edinburgh approach #2
       
140  print "employee(s) in Edinburgh (approach #1):"
141  employeesByLocation["Edinburgh"].each { e ->
142      print " " + e.surname + "," + e.givenName
143  }
144  println()
```

Because I am just writing a script here, I don't need to put the program body inside a method inside a class; Groovy handles that for us.

In lines 1-6, I still need to import the classes needed for the data parsing. Groovy imports quite a bit of useful stuff by default, including `java.lang.*` and `java.util.*`.

In lines 7-90, I use Groovy's syntactic support for lists as comma-separated values bracketed by `[` and `]`. In this case, there is a list of lists; each sublist is the employee data. Notice that you need the `\` in front of the `$` in the salary field. This is because a `$` occurring inside a string surrounded by double quotes indicates the presence of a field whose value is to be interpolated into the string. An alternative would be to use single quotes.

But I don't want to work with a list of lists; I would rather have a list of maps analogous to the list of Employee class instances in the Java version. I use the Groovy Collection`.collect()` method in lines 90-111 to take apart each sublist of employee data and convert it into a map. The collect method takes a Groovy Closure argument, and the syntax for creating a closure surrounds the code with `{` and `}` and lists the parameters as `a, b, c ->` in a manner similar to Java's lambdas. Most of the code looks quite similar to the constructor method in the Java Employee class, except that there are items in the sublist rather than arguments to the constructor. However, the last two lines—

```
[surname: surname, givenName: givenName, role: role,

    location: location, extension: extension, hired: hired, salary: salary]
```

—create a map with keys `surname`, `givenName`, `role`, `location`, `extension`, `hired`, and `salary`. And, since this is the last line of the closure, the value returned to the caller is this map. No need for a return statement. No need to quote these key values; Groovy assumes they are strings. In fact, if they were variables, you would need to put them in parentheses to indicate the need to evaluate them. The value assigned to each key appears on its right side. Note that this is a map whose values are of different types: The first four are `String`, then `int`, `LocalDate`, and `double`. It would have been possible to define the sublists with elements of those different types, but I chose to take this approach because the data would often be read in as string values from a text file.

The interesting bits appear in lines 112-144. I've kept the same kind of processing steps as in the Java version.

In lines 112-114, I use the Groovy Collection `average()` method, which like `collect()` takes a Closure argument, here iterating over the list of employee maps and picking out the `salary` value. Note that using these methods on the Collection class means you don't have to learn how to transform lists, maps, or some other element to streams and then learn the stream methods to handle your calculations, as in Java. For those who like Java Streams, they are available in newer Groovy versions.

In lines 115-125, I calculate the average salary by location. First, in lines 117-119, I transform `employeeList`, which is a list of maps, into a map, using the Collection`groupBy()` method, whose keys are the location values and whose values are linked sublists of the employee maps pertaining to that location. Then I process those map entries with the `collectEntries()` method, using the `average()` method to compute the average salary for each location.

Note that `collectEntries()` passes each key (location) and value (employee sublist at that location) into the closure (the `l, el ->` string) and expects a two-element list of key (location) and value (average salary at that location) to be returned, converting those into map entries. Once I have the map of average salaries by location, `locationAvgSal`, I can print it out using the Collection `each()` method, which also takes a closure. When `each()` is applied to a map, it passes in the key (location) and value (average salary) in the same way as `collectEntries()`.

In lines 126-134, I filter the `employeeList` to get a sublist of `employeesInEdinburgh`, using the `findAll()` method, which is analogous to the Java Streams `filter()` method. And again, I use the `each()` method to print out the sublist of employees in Edinburgh.

In lines 135-144, I take the alternative approach of grouping the `employeeList` into a map of employee sublists at each location, `employeesByLocation`. Then in lines 139-144, I select the employee sublist at Edinburgh, using the expression `employeesByLocation[“Edinburgh”]` and the `each()` method to print out the sublist of employee names at that location.

### Why I often prefer Groovy

Maybe it's just my familiarity with Groovy, built up over the last 12 years or so, but I feel more comfortable with the Groovy approach to enhancing Collection with all these methods that take a closure as an argument, rather than the Java approach of converting the list, map, or whatever is at hand to a stream and then using streams, lambdas, and data classes to handle the processing steps. I seem to spend a lot more time with the Java equivalents before I get something working.

I'm also a huge fan of strong static typing and parameterized types, such as `Map,employee>`  `,employee>` as found in Java. However, on a day-to-day basis, I find that the more relaxed approach of lists and maps accommodating different types does a better job of supporting me in the real world of data without requiring a lot of extra code. Dynamic typing can definitely come back to bite the programmer. Still, even knowing that I can turn static type checking on in Groovy, I bet I haven't done so more than a handful of times. Maybe my appreciation for Groovy comes from my work, which usually involves bashing a bunch of data into shape and then analyzing it; I'm certainly not your average developer. So is Groovy really a more Pythonic Java? Food for thought.

I would love to see in both Java and Groovy a few more facilities like `average()` and `averagingDouble()`. Two-argument versions to produce weighted averages and statistical methods beyond averaging—like median, standard deviation, and so forth—would also be helpful. [Tabnine][8] offers interesting suggestions on implementing some of these.

### Groovy resources

The [Apache Groovy site][9] has a lot of great documentation. Other good sources include the reference page for [Groovy enhancements to the Java Collection class][10], the more tutorial-like introduction to [working with collections][11], and [Mr. Haki][12]. The [Baeldung site][13] provides a lot of helpful how-tos in Java and Groovy. And a really great reason to learn Groovy is to learn [Grails][14], a wonderfully productive full-stack web framework built on top of excellent components like Hibernate, Spring Boot, and Micronaut.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/maps-groovy-vs-java

作者：[Chris Hermansen][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/collab-team-pair-programming-code-keyboard2.png
[2]: https://groovy-lang.org/
[3]: https://opensource.com/article/22/3/maps-groovy-vs-java
[4]: https://datatables.net/
[5]: https://groovy.apache.org/download.html
[6]: https://opensource.com/article/22/3/manage-java-versions-sdkman
[7]: https://projectlombok.org/features/Data
[8]: https://www.tabnine.com/code/java/methods/java.util.stream.Collectors/averagingDouble
[9]: https://groovy-lang.org/
[10]: https://docs.groovy-lang.org/latest/html/groovy-jdk/java/util/Collection.html
[11]: https://groovy-lang.org/groovy-dev-kit.html#_working_with_collections
[12]: https://blog.mrhaki.com/
[13]: https://www.baeldung.com/
[14]: https://grails.org/
