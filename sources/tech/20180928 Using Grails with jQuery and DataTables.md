Using Grails with jQuery and DataTables
======

Learn to build a Grails-based data browser that lets users visualize complex tabular data.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_container_block.png?itok=S8MbXEYw)

I’m a huge fan of [Grails][1]. Granted, I’m mostly a data person who likes to explore and analyze data using command-line tools. But even data people sometimes need to _look at_ the data, and sometimes using data means having a great data browser. With Grails, [jQuery][2], and the [DataTables jQuery plugin][3], we can make really nice tabular data browsers.

The [DataTables website][3] offers a lot of decent “recipe-style” documentation that shows how to put together some fine sample applications, and it includes the necessary JavaScript, HTML, and occasional [PHP][4] to accomplish some pretty spiffy stuff. But for those who would rather use Grails as their backend, a bit of interpretation is necessary. Also, the sample application data used is a single flat table of employees of a fictional company, so the complexity of dealing with table relations serves as an exercise for the reader.

In this article, we’ll fill those two gaps by creating a Grails application with a slightly more complex data structure and a DataTables browser. In doing so, we’ll cover Grails criteria, which are [Groovy][5] -fied Java Hibernate criteria. I’ve put the code for the application on [GitHub][6] , so this article is oriented toward explaining the nuances of the code.

For prerequisites, you will need Java, Groovy, and Grails environments set up. With Grails, I tend to use a terminal window and [Vim][7], so that’s what’s used here. To get a modern Java, I suggest downloading and installing the [Open Java Development Kit][8] (OpenJDK) provided by your Linux distro (which should be Java 8, 9, 10 or 11; at the time of writing, I’m working with Java 8). From my point of view, the best way to get up-to-date Groovy and Grails is to use [SDKMAN!][9].

Readers who have never tried Grails will probably need to do some background reading. As a starting point, I recommend [Creating Your First Grails Application][10].

### Getting the employee browser application

As mentioned above, I’ve put the source code for this sample employee browser application on [GitHub][6]. For further explanation, the application **embrow** was built using the following commands in a Linux terminal window:

```
cd Projects
grails create-app com.nuevaconsulting.embrow
```

The domain classes and unit tests are created as follows:

```
grails create-domain-class com.nuevaconsulting.embrow.Position
grails create-domain-class com.nuevaconsulting.embrow.Office
grails create-domain-class com.nuevaconsulting.embrow.Employeecd embrowgrails createdomaincom.grails createdomaincom.grails createdomaincom.
```

The domain classes built this way have no attributes, so they must be edited as follows:

The Position domain class:

```
package com.nuevaconsulting.embrow
 
class Position {

    String name
    int starting

    static constraints = {
        name nullable: false, blank: false
        starting nullable: false
    }
}com.Stringint startingstatic constraintsnullableblankstarting nullable
```

The Office domain class:

```
package com.nuevaconsulting.embrow
 
class Office {

    String name
    String address
    String city
    String country

    static constraints = {
        name nullable: false, blank: false
        address nullable: false, blank: false
        city nullable: false, blank: false
        country nullable: false, blank: false
    }
}
```

And the Employee domain class:

```
package com.nuevaconsulting.embrow
 
class Employee {

    String surname
    String givenNames
    Position position
    Office office
    int extension
    Date hired
    int salary
    static constraints = {
        surname nullable: false, blank: false
        givenNames nullable: false, blank: false
        : false
        office nullable: false
        extension nullable: false
        hired nullable: false
        salary nullable: false
    }
}
```

Note that whereas the Position and Office domain classes use predefined Groovy types String and int, the Employee domain class defines fields that are of type Position and Office (as well as the predefined Date). This causes the creation of the database table in which instances of Employee are stored to contain references, or foreign keys, to the tables in which instances of Position and Office are stored.

Now you can generate the controllers, views, and various other test components:

```
-all com.nuevaconsulting.embrow.Position
grails generate-all com.nuevaconsulting.embrow.Office
grails generate-all com.nuevaconsulting.embrow.Employeegrails generateall com.grails generateall com.grails generateall com.
```

At this point, you have a basic create-read-update-delete (CRUD) application ready to go. I’ve included some base data in the **grails-app/init/com/nuevaconsulting/BootStrap.groovy** to populate the tables.

If you run the application with the command:

```
grails run-app
```

you will see the following screen in the browser at **<http://localhost:8080/:>**

![Embrow home screen][12]

The Embrow application home screen

Clicking on the link for the OfficeController gives you a screen that looks like this:

![Office list][14]

The office list

Note that this list is generated by the **OfficeController index** method and displayed by the view `office/index.gsp`.

Similarly, clicking on the **EmployeeController** gives a screen that looks like this:

![Employee controller][16]

The employee controller

Ok, that’s pretty ugly—what’s with the Position and Office links?

Well, the views generated by the `generate-all` commands above create an **index.gsp** file that uses the Grails  <f:table/> tag that by default shows the class name ( **com.nuevaconsulting.embrow.Position** ) and the persistent instance identifier ( **30** ). This behavior can be customized to yield something better looking, and there is some pretty neat stuff with the autogenerated links, the autogenerated pagination, and the autogenerated sortable columns.

But even when it's fully cleaned up, this employee browser offers limited functionality. For example, what if you want to find all employees whose position includes the text “dev”? What if you want to combine columns for sorting so that the primary sort key is a surname and the secondary sort key is an office name? Or what if you want to export a sorted subset to a spreadsheet or PDF to email to someone who doesn’t have access to the browser?

The jQuery DataTables plugin provides this kind of extra functionality and allows you to create a full-fledged tabular data browser.

### Creating the employee browser view and controller methods

In order to create an employee browser based on jQuery DataTables, you must complete two tasks:

  1. Create a Grails view that incorporates the HTML and JavaScript required to enable the DataTables

  2. Add a method to the Grails controller to handle the new view




#### The employee browser view

In the directory **embrow/grails-app/views/employee** , start by making a copy of the **index.gsp** file, calling it **browser.gsp** :

```
cd Projects
cd embrow/grails-app/views/employee
cp gsp browser.gsp
```

At this point, you want to customize the new **browser.gsp** file to add the relevant jQuery DataTables code.

As a rule, I like to grab my JavaScript and CSS from a content provider when feasible; to do so in this case, after the line:

```
<title><g:message code="default.list.label" args="[entityName]" /></title>
```

insert the following lines:

```
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/scroller/1.4.4/css/scroller.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/scroller/1.4.4/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js "></script>
```

Next, remove the code that provided the data pagination in **index.gsp** :

```
<div id="list-employee" class="content scaffold-list" role="main">
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
<div class="message" role="status">${flash.message}</div>
</g:if>
<f:table collection="${employeeList}" />

<div class="pagination">
<g:paginate total="${employeeCount ?: 0}" />
</div>
</div>
```

and insert the code that materializes the jQuery DataTables.

The first part to insert is the HTML that creates the basic tabular structure of the browser. For the application where DataTables talks to a database backend, provide only the table headers and footers; the DataTables JavaScript takes care of the table contents.

```
<div id="employee-browser" class="content" role="main">
<h1>Employee Browser</h1>
<table id="employee_dt" class="display compact" style="width:99%;">
<thead>
<tr>
<th>Surname</th>
<th>Given name(s)</th>
<th>Position</th>
<th>Office</th>
<th>Extension</th>
<th>Hired</th>
<th>Salary</th>
</tr>
</thead>
<tfoot>
<tr>
<th>Surname</th>
<th>Given name(s)</th>
<th>Position</th>
<th>Office</th>
<th>Extension</th>
<th>Hired</th>
<th>Salary</th>
</tr>
</tfoot>
</table>
</div>
```

Next, insert a JavaScript block, which serves three primary functions: It sets the size of the text boxes shown in the footer for column filtering, it establishes the DataTables table model, and it creates a handler to do the column filtering.

```
<g:javascript>
$('#employee_dt tfoot th').each( function() {javascript
```

The code below handles sizing the filter boxes at the bottoms of the table columns:

```
var title = $(this).text();
if (title == 'Extension' || title == 'Hired')
$(this).html('<input type="text" size="5" placeholder="' + title + '?" />');
else
$(this).html('<input type="text" size="15" placeholder="' + title + '?" />');
});titletitletitletitletitle
```

Next, define the table model. This is where all the table options are provided, including the scrolling, rather than paginated, nature of the interface, the cryptic decorations to be provided according to the dom string, the ability to export data to CSV and other formats, as well as where the Ajax connection to the server is established. Note that the URL is created with a Groovy GString call to the Grails **createLink()** method, referring to the **browserLister** action in the **EmployeeController**. Also of interest is the definition of the columns of the table. This information is sent across to the back end, which queries the database and returns the appropriate records.

```
var table = $('#employee_dt').DataTable( {
"scrollY": 500,
"deferRender": true,
"scroller": true,
"dom": "Brtip",
"buttons": [ 'copy', 'csv', 'excel', 'pdf', 'print' ],
"processing": true,
"serverSide": true,
"ajax": {
"url": "${createLink(controller: 'employee', action: 'browserLister')}",
"type": "POST",
},
"columns": [
{ "data": "surname" },
{ "data": "givenNames" },
{ "data": "position" },
{ "data": "office" },
{ "data": "extension" },
{ "data": "hired" },
{ "data": "salary" }
]
});
```

Finally, monitor the filter columns for changes and use them to apply the filter(s).

```
table.columns().every(function() {
var that = this;
$('input', this.footer()).on('keyup change', function(e) {
if (that.search() != this.value && 8 < e.keyCode && e.keyCode < 32)
that.search(this.value).draw();
});
```

And that’s it for the JavaScript. This completes the changes to the view code.

```
});
</g:javascript>
```

Here’s a screenshot of the UI this view creates:

![](https://opensource.com/sites/default/files/uploads/screen_4.png)

Here’s another screenshot showing the filtering and multi-column sorting at work (looking for employees whose positions include the characters “dev”, ordering first by office, then by surname):

![](https://opensource.com/sites/default/files/uploads/screen_5.png)

Here’s another screenshot, showing what happens when you click on the CSV button:

![](https://opensource.com/sites/default/files/uploads/screen6.png)

And finally, here’s a screenshot showing the CSV data opened in LibreOffice:

![](https://opensource.com/sites/default/files/uploads/screen7.png)

Ok, so the view part looked pretty straightforward; therefore, the controller action must do all the heavy lifting, right? Let’s see…

#### The employee controller browserLister action

Recall that we saw this string

```
"${createLink(controller: 'employee', action: 'browserLister')}"
```

as the URL used for the Ajax calls from the DataTables table model. [createLink() is the method][17] behind a Grails tag that is used to dynamically generate a link as the HTML is preprocessed on the Grails server. This ends up generating a link to the **EmployeeController** , located in

```
embrow/grails-app/controllers/com/nuevaconsulting/embrow/EmployeeController.groovy
```

and specifically to the controller method **browserLister()**. I’ve left some print statements in the code so that the intermediate results can be seen in the terminal window where the application is running.

```
    def browserLister() {
        // Applies filters and sorting to return a list of desired employees
```

First, print out the parameters passed to **browserLister()**. I usually start building controller methods with this code so that I’m completely clear on what my controller is receiving.

```
      println "employee browserLister params $params"
        println()
```

Next, process those parameters to put them in a more usable shape. First, the jQuery DataTables parameters, a Groovy map called **jqdtParams** :

```
def jqdtParams = [:]
params.each { key, value ->
    def keyFields = key.replace(']','').split(/\[/)
    def table = jqdtParams
    for (int f = 0; f < keyFields.size() - 1; f++) {
        def keyField = keyFields[f]
        if (!table.containsKey(keyField))
            table[keyField] = [:]
        table = table[keyField]
    }
    table[keyFields[-1]] = value
}
println "employee dataTableParams $jqdtParams"
println()
```

Next, the column data, a Groovy map called **columnMap** :

```
def columnMap = jqdtParams.columns.collectEntries { k, v ->
    def whereTerm = null
    switch (v.data) {
    case 'extension':
    case 'hired':
    case 'salary':
        if (v.search.value ==~ /\d+(,\d+)*/)
            whereTerm = v.search.value.split(',').collect { it as Integer }
        break
    default:
        if (v.search.value ==~ /[A-Za-z0-9 ]+/)
            whereTerm = "%${v.search.value}%" as String
        break
    }
    [(v.data): [where: whereTerm]]
}
println "employee columnMap $columnMap"
println()
```

Next, a list of all column names, retrieved from **columnMap** , and a corresponding list of how those columns should be ordered in the view, Groovy lists called **allColumnList** and **orderList** , respectively:

```
def allColumnList = columnMap.keySet() as List
println "employee allColumnList $allColumnList"
def orderList = jqdtParams.order.collect { k, v -> [allColumnList[v.column as Integer], v.dir] }
println "employee orderList $orderList"
```

We’re going to use Grails’ implementation of Hibernate criteria to actually carry out the selection of elements to be displayed as well as their ordering and pagination. Criteria requires a filter closure; in most examples, this is given as part of the creation of the criteria instance itself, but here we define the filter closure beforehand. Note in this case the relatively complex interpretation of the “date hired” filter, which is treated as a year and applied to establish date ranges, and the use of **createAlias** to allow us to reach into related classes Position and Office:

```
def filterer = {
    createAlias 'position',        'p'
    createAlias 'office',          'o'

    if (columnMap.surname.where)    ilike  'surname',     columnMap.surname.where
    if (columnMap.givenNames.where) ilike  'givenNames',  columnMap.givenNames.where
    if (columnMap.position.where)   ilike  'p.name',      columnMap.position.where
    if (columnMap.office.where)     ilike  'o.name',      columnMap.office.where
    if (columnMap.extension.where)  inList 'extension',   columnMap.extension.where
    if (columnMap.salary.where)     inList 'salary',      columnMap.salary.where
    if (columnMap.hired.where) {
        if (columnMap.hired.where.size() > 1) {
            or {
                columnMap.hired.where.each {
                    between 'hired', Date.parse('yyyy/MM/dd',"${it}/01/01" as String),
                        Date.parse('yyyy/MM/dd',"${it}/12/31" as String)
                }
            }
        } else {
            between 'hired', Date.parse('yyyy/MM/dd',"${columnMap.hired.where[0]}/01/01" as String),
                Date.parse('yyyy/MM/dd',"${columnMap.hired.where[0]}/12/31" as String)
        }
    }
}
```

At this point, it’s time to apply the foregoing. The first step is to get a total count of all the Employee instances, required by the pagination code:

```
        def recordsTotal = Employee.count()
        println "employee recordsTotal $recordsTotal"
```

Next, apply the filter to the Employee instances to get the count of filtered results, which will always be less than or equal to the total number (again, this is for the pagination code):

```
        def c = Employee.createCriteria()
        def recordsFiltered = c.count {
            filterer.delegate = delegate
            filterer()
        }
        println "employee recordsFiltered $recordsFiltered"

```

Once you have those two counts, you can get the actual filtered instances using the pagination and ordering information as well.

```
      def orderer = Employee.withCriteria {
            filterer.delegate = delegate
            filterer()
            orderList.each { oi ->
                switch (oi[0]) {
                case 'surname':    order 'surname',    oi[1]; break
                case 'givenNames': order 'givenNames', oi[1]; break
                case 'position':   order 'p.name',     oi[1]; break
                case 'office':     order 'o.name',     oi[1]; break
                case 'extension':  order 'extension',  oi[1]; break
                case 'hired':      order 'hired',      oi[1]; break
                case 'salary':     order 'salary',     oi[1]; break
                }
            }
            maxResults (jqdtParams.length as Integer)
            firstResult (jqdtParams.start as Integer)
        }
```

To be completely clear, the pagination code in JTables manages three counts: the total number of records in the data set, the number resulting after the filters are applied, and the number to be displayed on the page (whether the display is scrolling or paginated). The ordering is applied to all the filtered records and the pagination is applied to chunks of those filtered records for display purposes.

Next, process the results returned by the orderer, creating links to the Employee, Position, and Office instance in each row so the user can click on these links to get all the detail on the relevant instance:

```
        def dollarFormatter = new DecimalFormat('$##,###.##')
        def employees = orderer.collect { employee ->
            ['surname': "<a href='${createLink(controller: 'employee', action: 'show', id: employee.id)}'>${employee.surname}</a>",
                'givenNames': employee.givenNames,
                'position': "<a href='${createLink(controller: 'position', action: 'show', id: employee.position?.id)}'>${employee.position?.name}</a>",
                'office': "<a href='${createLink(controller: 'office', action: 'show', id: employee.office?.id)}'>${employee.office?.name}</a>",
                'extension': employee.extension,
                'hired': employee.hired.format('yyyy/MM/dd'),
                'salary': dollarFormatter.format(employee.salary)]
        }
```

And finally, create the result you want to return and give it back as JSON, which is what jQuery DataTables requires.

```
        def result = [draw: jqdtParams.draw, recordsTotal: recordsTotal, recordsFiltered: recordsFiltered, data: employees]
        render(result as JSON)
    }
```

That’s it.

If you’re familiar with Grails, this probably seems like more work than you might have originally thought, but there’s no rocket science here, just a lot of moving parts. However, if you haven’t had much exposure to Grails (or to Groovy), there’s a lot of new stuff to understand—closures, delegates, and builders, among other things.

In that case, where to start? The best place is to learn about Groovy itself, especially [Groovy closures][18] and [Groovy delegates and builders][19]. Then go back to the reading suggested above on Grails and Hibernate criteria queries.

### Conclusions

jQuery DataTables make awesome tabular data browsers for Grails. Coding the view isn’t too tricky, but the PHP examples provided in the DataTables documentation take you only so far. In particular, they aren’t written with Grails programmers in mind, nor do they explore the finer details of using elements that are references to other classes (essentially lookup tables).

I’ve used this approach to make a couple of data browsers that allow the user to select which columns to view and accumulate record counts, or just to browse the data. The performance is good even in million-row tables on a relatively modest VPS.

One caveat: I have stumbled upon some problems with the various Hibernate criteria mechanisms exposed in Grails (see my other GitHub repositories), so care and experimentation is required. If all else fails, the alternative approach is to build SQL strings on the fly and execute them instead. As of this writing, I prefer to work with Grails criteria, unless I get into messy subqueries, but that may just reflect my relative lack of experience with subqueries in Hibernate.

I hope you Grails programmers out there find this interesting. Please feel free to leave comments or suggestions below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/using-grails-jquery-and-datatables

作者：[Chris Hermansen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[1]: https://grails.org/
[2]: https://jquery.com/
[3]: https://datatables.net/
[4]: http://php.net/
[5]: http://groovy-lang.org/
[6]: https://github.com/monetschemist/grails-datatables
[7]: https://www.vim.org/
[8]: http://openjdk.java.net/
[9]: http://sdkman.io/
[10]: http://guides.grails.org/creating-your-first-grails-app/guide/index.html
[11]: https://opensource.com/file/410061
[12]: https://opensource.com/sites/default/files/uploads/screen_1.png (Embrow home screen)
[13]: https://opensource.com/file/410066
[14]: https://opensource.com/sites/default/files/uploads/screen_2.png (Office list screenshot)
[15]: https://opensource.com/file/410071
[16]: https://opensource.com/sites/default/files/uploads/screen3.png (Employee controller screenshot)
[17]: https://gsp.grails.org/latest/ref/Tags/createLink.html
[18]: http://groovy-lang.org/closures.html
[19]: http://groovy-lang.org/dsls.html
