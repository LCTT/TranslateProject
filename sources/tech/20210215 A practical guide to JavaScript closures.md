[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A practical guide to JavaScript closures)
[#]: via: (https://opensource.com/article/21/2/javascript-closures)
[#]: author: (Nimisha Mukherjee https://opensource.com/users/nimisha)

A practical guide to JavaScript closures
======
Get a better understanding of how JavaScript code works and executes by
diving into one of the advanced concept: closures.
![Woman programming][1]

In [_4 reasons why JavaScript is so popular_][2], I touched on a few advanced JavaScript concepts. In this article, I will dive into one of them: closures.

According to [Mozilla Developer Network][3] (MDN), "A closure is the combination of a function bundled together (enclosed) with references to its surrounding state (the lexical environment)." Simplified, this means that a function inside another function can access the variables from the outer (parent) function.

To better understand closures, take a look at scopes and their execution context.

Here is a simple code snippet:


```
var hello = "Hello";

function sayHelloWorld() {
var world = "World";
        function wish() {
                var year = "2021";
                console.log(hello + " " + world + " "+ year);
}
wish();
}
sayHelloWorld();
```

Here's the execution context for this code: 

![Execution context for JS code][4]

(Nimisha Mukherjee, [CC BY-SA 4.0][5])

Closures are created every time a function is created (at function-creation time). Every closure has three scopes:

  * Local scope (own scope)
  * Outer functions scope
  * Global scope



I'll modify the above code slightly to demonstrate closure:


```
var hello = "Hello";

var sayHelloWorld = function() {
var world = "World";
        function wish() {
                var year = "2021";
                console.log(hello + " " + world + " "+ year);
}
return wish;
}
var callFunc = sayHelloWorld();
callFunc();
```

The inner function `wish()` is returned from the outer function before it's executed. This happens because functions in JavaScript form **closures**.

  * `callFunc` holds a reference to the function `wish` when `sayHelloWorld` runs
  * `wish` maintains a reference to its surrounding (lexical) environment where the variable `world` exists.



### Private variables and methods

Natively, JavaScript does not support the creation of private variables and methods. A common and practical use of closure is to emulate private variables and methods and allow data privacy. Methods defined within the closure scope are privileged.

This code snippet captures how closures are commonly written and used in JavaScript:


```
var resourceRecord = function(myName, myAddress) {
 var resourceName = myName;
 var resourceAddress = myAddress;
 var accessRight = "HR";
 return {
   changeName: function(updateName, privilege) {
     //only HR can change the name
     if(privilege === accessRight ) {
       resourceName = updateName;
       return true;
     } else {
       return false;
     }
   },  
   changeAddress: function(newAddress) {
     //any associate can change the address
     resourceAddress = newAddress;          
   },  
   showResourceDetail: function() {
     console.log ("Name:" + resourceName + " ; Address:" + resourceAddress);
   }
 }
}
//Create first record
var resourceRecord1 = resourceRecord("Perry","Office");
//Create second record
var resourceRecord2 = resourceRecord("Emma","Office");
//Change the address on the first record
resourceRecord1.changeAddress("Home");
resourceRecord1.changeName("Perry Berry", "Associate"); //Output is false as only an HR can change the name
resourceRecord2.changeName("Emma Freeman", "HR"); //Output is true as HR changes the name
resourceRecord1.showResourceDetail(); //Output - Name:Perry ; Address:Home
resourceRecord2.showResourceDetail(); //Output - Name:Emma Freeman ; Address:Office
```

The resource records (`resourceRecord1` and `resourceRecord2`) are independent of one another. Each closure references a different version of the `resourceName` and `resourceAddress` variable through its own closure. You can also apply specific rules to how private variables need to be handled—I added a check on who can modify `resourceName`.

### Use closures

Understanding closure is important, as it enables deeper knowledge of how variables and functions relate to one another and how JavaScript code works and executes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/javascript-closures

作者：[Nimisha Mukherjee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nimisha
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://opensource.com/article/20/11/javascript-popular
[3]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures
[4]: https://opensource.com/sites/default/files/uploads/execution-context.png (Execution context for JS code)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
