[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fast data modeling with JavaScript)
[#]: via: (https://opensource.com/article/20/5/data-modeling-javascript)
[#]: author: (Szymon https://opensource.com/users/schodevio)

Fast data modeling with JavaScript
======
This tutorial showcases a method to model data in just a few minutes.
![Analytics: Charts and Graphs][1]

As a backend developer at the [Railwaymen][2], a software house in Kraków, Poland, some of my tasks rely on models that manipulate and customize data retrieved from a database. When I wanted to improve my skills in frontend frameworks, I [chose Vue][3], and I thought it would be good to have a similar way to model data in a store. I started with some libraries that I found through [NPM][4], but they offered many more features than I needed.

So I decided to build my own solution, and I was very surprised that the base took less than 15 lines of code and is very flexible. I implemented this solution in an open source application which I developed and called [Evally][5] - a web app that helps businesses keep track of their employees' performance reviews and professional development. It reminds managers or HR representatives about employees' upcoming evaluations and gathers all of the data needed to assess their performance in the fairest way.

### Model and list

The only things you need to do are to create a class and use the defaultsDeep function in the [Lodash][6] JavaScript library:


```
`_.defaultsDeep(object, [sources])`
```

Arguments:

  * `object (Object)`: The destination object
  * `[sources] (...Object)`: The source objects



Returns:

  * `(Object)`: Returns object



This helper function: [Lodash Docs][7]

> "Assigns recursively own and inherited enumerable string keyed properties of source objects to the destination object for all destination properties that resolve to undefined. Source objects are applied from left to right. Once a property is set, additional values of the same property are ignored."

For example:


```
_.defaultsDeep({ 'a': { 'b': 2 } }, { 'a': { 'b': 1, 'c': 3 } })
 // =&gt; { 'a': { 'b': 2, 'c': 3 } }
```

That's all! To try it out, create a file called **base.js** and import the defaultsDeep function from the Lodash package:


```
 // base.js
 import defaultsDeep from "lodash/defaultsDeep";
```

Next, create and export the Model class, where constructor will use the Lodash helper function to assign values to all passed attributes and initialize the attributes that were not received with default values:


```
 // base.js
 // ...

 export class Model {
   constructor(attributes = {}) {
     defaultsDeep(this, attributes, this.defaults);
   }
 }
```

Now, create your first real model, Employee, with attributes for firstName, lastName, position and hiredAt where "position" defines "Programmer" as the default value:


```
 // employee.js
 import { Model } from "./base.js";

 export class Employee extends Model {
   get defaults() {
     return {
       firstName: "",
       lastName: "",
       position: "Programmer",
       hiredAt: ""
     };
   }
 }
```

Next, begin creating employees:


```
// app.js
 import { Employee } from "./employee.js";

 const programmer = new Employee({
   firstName: "Will",
   lastName: "Smith"
 });

 // =&gt; Employee {
 //   firstName: "Will",
 //   lastName: "Smith",
 //   position: "Programmer",
 //   hiredAt: "",
 //   constructor: Object
 // }

 const techLeader = new Employee({
   firstName: "Charles",
   lastName: "Bartowski",
   position: "Tech Leader"
 });

 // =&gt; Employee {
 //   firstName: "Charles",
 //   lastName: "Bartowski",
 //   position: "Tech Leader",
 //   hiredAt: "",
 //   constructor: Object
 // }
```

You have two employees, and the first one's position is assigned from the defaults. Here's how multiple employees can be defined:


```
 // base.js

 // ...

 export class List {
   constructor(items = []) {
     this.models = items.map(item =&gt; new this.model(item));
   }
 }

[/code] [code]

 // employee.js
 import { Model, List } from "./base.js";

 // …

 export class EmployeesList extends List {
   get model() {
     return Employee;
   }
 }
```

The List class constructor maps an array of received items into an array of desired models. The only requirement is to provide a correct model class name:


```
 // app.js
 import { Employee, EmployeesList } from "./employee.js";

 // …

 const employees = new EmployeesList([
   {
     firstName: "Will",
     lastName: "Smith"
   },
   {
     firstName: "Charles",
     lastName: "Bartowski",
     position: "Tech Leader"
   }
 ]);

 // =&gt; EmployeesList {models: Array[2], constructor: Object}
 //  models: Array[2]
 //   0: Employee
 //     firstName: "Will"
 //     lastName: "Smith"
 //     position: "Programmer"
 //     hiredAt: ""
 //     &lt;constructor&gt;: "Employee"
 //   1: Employee
 //     firstName: "Charles"
 //     lastName: "Bartowski"
 //     position: "Tech Leader"
 //     hiredAt: ""
 //     &lt;constructor&gt;: "Employee"
 //   &lt;constructor&gt;: "EmployeesList"
```

### Ways to use this approach

This simple solution allows you to keep your data structure in one place and avoid code repetition. The [DRY][8] principle rocks! You can also customize your models as needed, such as in the following examples.

#### Custom getters

Do you need one attribute to be dependent on the others? No problem; you can do this by improving your Employee model:


```
// employee.js
 import { Model } from "./base.js";

 export class Employee extends Model {
   get defaults() {
     return {
       firstName: "",
       lastName: "",
       position: "Programmer",
       hiredAt: ""
     };
   }

   get fullName() {
     return [this.firstName, this.lastName].join(' ')
   }

 }

[/code] [code]

// app.js
 import { Employee, EmployeesList } from "./employee.js";

 // …

 console.log(techLeader.fullName);
 // =&gt; Charles Bartowski
```

Now you don't have to repeat the code to do something as simple as displaying the employee's full name.

#### Date formatting

Model is a good place to define other formats for given attributes. The best examples are dates:


```
// employee.js
 import { Model } from "./base.js";
 import moment from 'moment';

 export class Employee extends Model {
   get defaults() {
     return {
       firstName: "",
       lastName: "",
       position: "Programmer",
       hiredAt: ""
     };
   }

   get formattedHiredDate() {
     if (!this.hiredAt) return "---";

     return moment(this.hiredAt).format('MMMM DD, YYYY');
   }
 }

[/code] [code]

// app.js
 import { Employee, EmployeesList } from "./employee.js";

 // …

 techLeader.hiredAt = "2020-05-01";

 console.log(techLeader.formattedHiredDate);
 // =&gt; May 01, 2020
```

Another case related to dates (which I discovered developing the Evally app) is the ability to operate with different date formats. Here's an example that uses datepicker:

  1. All employees fetched from the database have the hiredAt date in the format:
YEAR-MONTH-DAY, e.g., 2020-05-01
  2. You need to display the hiredAt date in a more friendly format:
MONTH DAY, YEAR, e.g., May 01, 2020
  3. A datepicker uses the format:
DAY-MONTH-YEAR, e.g., 01-05-2020



Resolve this issue with:


```
// employee.js
 import { Model } from "./base.js";
 import moment from 'moment';

 export class Employee extends Model {

   // …

   get formattedHiredDate() {
     if (!this.hiredAt) return "---";

     return moment(this.hiredAt).format('MMMM DD, YYYY');
   }

   get hiredDate() {
     return (
       this.hiredAt
         ? moment(this.hiredAt).format('DD-MM-YYYY')
         : ''
     );
   }

   set hiredDate(date) {
     const mDate = moment(date, 'DD-MM-YYYY');
 
     this.hiredAt = (
       mDate.isValid()
         ? mDate.format('YYYY-MM-DD')
         : ''
     );
   }
 }
```

This adds getter and setter functions to handle datepicker's functionality.


```
 // Get date from server
 techLeader.hiredAt = '2020-05-01';
 console.log(techLeader.formattedHiredDate);
 // =&gt; May 01, 2020

 // Datepicker gets date
 console.log(techLeader.hiredDate);
 // =&gt; 01-05-2020

 // Datepicker sets new date
 techLeader.hiredDate = '15-06-2020';

 // Display new date
 console.log(techLeader.formattedHiredDate);
 // =&gt; June 15, 2020
```

This makes it very simple to manage multiple date formats.

#### Storage for model-related information

Another use for a model class is storing general information related to the model, like paths for routing:


```
// employee.js
 import { Model } from "./base.js";
 import moment from 'moment';

 export class Employee extends Model {

   // …

   static get routes() {
     return {
       employeesPath: '/api/v1/employees',
       employeePath: id =&gt; `/api/v1/employees/${id}`
     }
   }

 }

[/code] [code]

 // Path for POST requests
 console.log(Employee.routes.employeesPath)

 // Path for GET request
 console.log(Employee.routes.employeePath(1))
```

### Customize the list of models

Don't forget about the List class, which you can customize as needed:


```
// employee.js
 import { Model, List } from "./base.js";

 // …

 export class EmployeesList extends List {
   get model() {
     return Employee;
   }

   findByFirstName(val) {
     return this.models.find(item =&gt; item.firstName === val);
   }

   filterByPosition(val) {
     return this.models.filter(item =&gt; item.position === val);
   }
 }

[/code] [code]

 console.log(employees.findByFirstName('Will'))
 // =&gt; Employee {
 //   firstName: "Will",
 //   lastName: "Smith",
 //   position: "Programmer",
 //   hiredAt: "",
 //   constructor: Object
 // }

 console.log(employees.filterByPosition('Tech Leader'))
 // =&gt; [Employee]
 //     0: Employee
 //       firstName: "Charles"
 //       lastName: "Bartowski"
 //       position: "Tech Leader"
 //       hiredAt: ""
 //       &lt;constructor&gt;: "Employee"
```

### Summary

This simple structure for data modeling in JavaScript should save you some development time. You can add new functions whenever you need them to keep your code cleaner and easier to maintain. All of this code is available in my [CodeSandbox][9], so try it out and let me know how it goes by leaving a comment below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/data-modeling-javascript

作者：[Szymon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/schodevio
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/analytics-graphs-charts.png?itok=sersoqbV (Analytics: Charts and Graphs)
[2]: https://railwaymen.org/
[3]: https://blog.railwaymen.org/vue-vs-react-which-one-is-better-for-your-app-similarities-differences
[4]: https://www.npmjs.com/
[5]: https://github.com/railwaymen/evally
[6]: https://lodash.com/
[7]: https://lodash.com/docs/4.17.15
[8]: https://en.wikipedia.org/wiki/Don%27t_repeat_yourself
[9]: https://codesandbox.io/s/02jsdatamodels-1mhtb
