[#]: subject: "165+ JavaScript terms you need to know"
[#]: via: "https://opensource.com/article/22/9/javascript-glossary"
[#]: author: "Sachin Samal https://opensource.com/users/sacsam005"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

165+ JavaScript terms you need to know
======
Keep this JavaScript glossary bookmarked to reference variables, methods, strings, and more.

![Javascript code close-up with neon graphic overlay][1]

Photo by Jen Wike Huger

JavaScript is a rich language, with sometimes a seemingly overwhelming number of libraries and frameworks. With so many options available, it's sometimes useful to just look at the language itself and keep in mind its core components. This glossary covers the core JavaScript language, syntax, and functions.

### JavaScript variables

`var` : The most used variable. Can be reassigned but only accessed within a function, meaning function scope. Variables defined with `var` move to the top when code is executed.

`const` : Cannot be reassigned and not accessible before they appear within the code, meaning block scope.

`let` : Similar to `const` with block scope, however, the `let` variable can be reassigned but not re-declared.

#### Data types

Numbers: `var age = 33`

Variables: `var a`

Text (strings): `var a = "Sachin"`

Operations: `var b = 4 + 5 + 6`

True or false statements: `var a = true`

Constant numbers: `const PI = 3.14`

Objects: `var fullName = {firstName:"Sachin", lastName: "Samal"}`

#### Objects

This is a simple example of objects in JavaScript. This object describe the variable `car`, and includes *keys* or *properties* such as `make`, `model`, and `year` are the object's property names. Each property has a value, such as `Nissan`, `Altima`, and `2022`. A JavaScript object is a collection of properties with values, and it functions as a method.

```
var car = {
make:"Nissan",
model:"Altima",
year:2022,
};
```

#### Comparison operators

`==` : Is equal to

`===` : Is equal value and equal type

`!=` : Is not equal

`!==` : Is not equal value or not equal type

`>` : Is greater than

`<` : Is less than

`>=` : Is greater than or equal to

`<=` : Is less than or equal to

`?` : Ternary operator

#### Logical operators

`&&` : Logical AND

`||` : Logical OR

`!` : Logical NOT

#### Output data

`alert()` : Output data in an alert box in the browser window

`confirm()` : Open up a yes/no dialog and return true/false depending on user click

`console.log()` : Write information to the browser console. Good for debugging.

`document.write()` : Write directly to the HTML document

`prompt()` : Create a dialog for user input

### Array methods

Array: An object that can hold multiple values at once.

`concat()` : Join several arrays into one

`indexOf()` : Return the primitive value of the specified object

`join()` : Combine elements of an array into a single string and return the string

`lastIndexOf()` : Give the last position at which a given element appears in an array

`pop()` : Remove the last element of an array

`push()` : Add a new element at the end

`reverse()` : Sort elements in descending order

`shift()` : Remove the first element of an array

`slice()` : Pull a copy of a portion of an array into a new array

`splice()` : Add positions and elements in a specified way

`toString()` : Convert elements to strings

`unshift()` : Add a new element to the beginning

`valueOf()` : Return the first position at which a given element appears in an array

### JavaScript loops

Loops: Perform specific tasks repeatedly under applied conditions.

```
for (before loop; condition for loop; execute after loop) {
// what to do during the loop
}
```

`for` : Creates a conditional loop

`while` : Sets up conditions under which a loop executes at least once, as long as the specified condition is evaluated as true

`do while` : Similar to the `while` loop, it executes at least once and performs a check at the end to see if the condition is met. If it is, then it executes again

`break` : Stop and exit the cycle at certain conditions

`continue` : Skip parts of the cycle if certain conditions are met

### if-else statements

An `if` statement executes the code within brackets as long as the condition in parentheses is true. Failing that, an optional `else` statement is executed instead.

```
if (condition) {
// do this if condition is met
} else {
// do this if condition is not met
}
```

### Strings

#### String methods

`charAt()` : Return a character at a specified position inside a string

`charCodeAt()` : Give the Unicode of the character at that position

`concat()` : Concatenate (join) two or more strings into one

`fromCharCode()` : Return a string created from the specified sequence of UTF-16 code units

`indexOf()` : Provide the position of the first occurrence of a specified text within a string

`lastIndexOf()` : Same as `indexOf()` but with the last occurrence, searching backwards

`match()` : Retrieve the matches of a string against a search pattern

`replace()` : Find and replace specified text in a string

`search()` : Execute a search for a matching text and return its position

`slice()` : Extract a section of a string and return it as a new string

`split()` : Split a string object into an array of strings at a specified position

`substr()` : Extract a substring depended on a specified number of characters, similar to `slice()`

`substring()` : Can't accept negative indices, also similar to `slice()`

`toLowerCase()` : Convert strings to lower case

`toUpperCase()` : Convert strings to upper case

`valueOf()` : Return the primitive value (that has no properties or methods) of a string object

#### Number methods

`toExponential()` : Return a string with a rounded number written as exponential notation

`toFixed()` : Return the string of a number with a specified number of decimals

`toPrecision()` : String of a number written with a specified length

`toString()` : Return a number as a string

`valueOf()` : Return a number as a number

#### Math methods

`abs(a)` : Return the absolute (positive) value of `a`

`acos(x)` : Arccosine of `x`, in radians

`asin(x)` : Arcsine of `x`, in radians

`atan(x)` : Arctangent of `x` as a numeric value

`atan2(y,x)` : Arctangent of the quotient of its arguments

`ceil(a)` : Value of a rounded up to its nearest integer

`cos(a)` : Cosine of `a` (`x` is in radians)

`exp(a)` : Value of Ex

`floor(a)` : Value of a rounded down to its nearest integer

`log(a)` : Natural logarithm (base E) of `a`

`max(a,b,c…,z)` : Return the number with the highest value

`min(a,b,c…,z)` : Return the number with the lowest value

`pow(a,b)` : `a` to the power of `b`

`random()` : Return a random number between 0 and 1

`round(a)` : Value of `a` rounded to its nearest integer

`sin(a)` : Sine of `a` (`a` is in radians)

`sqrt(a)` : Square root of `a`

`tan(a)` : Tangent of an angle

### Dealing with dates in JavaScript

#### Set dates

`Date()` : Create a new date object with the current date and time

`Date(2022, 6, 22, 4, 22, 11, 0)` : Create a custom date object. The numbers represent year, month, day, hour, minutes, seconds, milliseconds. You can omit anything except for year and month.

`Date("2022-07-29")` : Date declaration as a string

#### Pull date and time values

`getDate()` : Day of the month as a number (1-31)

`getDay()` : Weekday as a number (0-6)

`getFullYear()` : Year as a four-digit number (yyyy)

`getHours()` : Hour (0-23)

`getMilliseconds()` : Millisecond (0-999)

`getMinutes()` : Minute (0-59)

`getMonth()` : Month as a number (0-11)

`getSeconds()` : Second (0-59)

`getTime()` : Milliseconds since January 1, 1970

`getUTCDate()` : Day (date) of the month in the specified date according to universal time (also available for day, month, full year, hours, minutes, etc.)

`parse` : Parse a string representation of a date and return the number of milliseconds since January 1, 1970

#### Set part of a date

`setDate()` : Set the day as a number (1-31)

`setFullYear()` : Set the year (optionally month and day)

`setHours()` : Set the hour (0-23)

`setMilliseconds()` : Set milliseconds (0-999)

`setMinutes()` : Set the minutes (0-59)

`setMonth()` : Set the month (0-11)

`setSeconds()` : Set the seconds (0-59)

`setTime()` : Set the time (milliseconds since January 1, 1970)

`setUTCDate()` : Set the day of the month for a specified date according to universal time (also available for day, month, full year, hours, minutes, etc.)

### Dom mode

#### Node methods

`appendChild()` : Add a new child node to an element as the last child node

`cloneNode()` : Clone an HTML element

`compareDocumentPosition()` : Compare the document position of two elements

`getFeature()` : Return an object which implements the APIs of a specified feature

`hasAttributes()` : Return **true** if an element has any attributes, otherwise **false**

`hasChildNodes()` : Return **true** if an element has any child nodes, otherwise **false**

`insertBefore()` : Insert a new child node before a specified, existing child node

`isDefaultNamespace()` : Return **true** if a specified `namespaceURI` is the default, otherwise **false**

`isEqualNode()` : Check if two elements are equal

`isSameNode()` : Check if two elements are the same node

`isSupported()` : Return **true** if a specified feature is supported on the element

`lookupNamespaceURI()` : Return the `namespaceURI` associated with a given node

`normalize()` : Join adjacent text nodes and removes empty text nodes in an element

`removeChild()` : Remove a child node from an element

`replaceChild()` : Replace a child node in an element

#### Element methods

`getAttribute()` : Return the specified attribute value of an element node

`getAttributeNS()` : Return string value of the attribute with the specified namespace and name

`getAttributeNode()` : Get the specified attribute node

`getAttributeNodeNS()` : Return the attribute node for the attribute with the given namespace and name

`getElementsByTagName()` : Provide a collection of all child elements with the specified tag name

`getElementsByTagNameNS()` : Return a live HTMLCollection of elements with a certain tag name belonging to the given namespace

`hasAttribute()` : Return **true** if an element has any attributes, otherwise **false**

`hasAttributeNS()` : Provide a true/false value indicating whether the current element in a given namespace has the specified attribute

`removeAttribute()` : Remove a specified attribute from an element

`lookupPrefix()` : Return a `DOMString` containing the prefix for a given `namespaceURI`, if present

`removeAttributeNS()` : Remove the specified attribute from an element within a certain namespace

`removeAttributeNode()` : Take away a specified attribute node and return the removed node

`setAttribute()` : Set or change the specified attribute to a specified value

`setAttributeNS()` : Add a new attribute or changes the value of an attribute with the given namespace and name

`setAttributeNode()` : Set or change the specified attribute node

`setAttributeNodeNS()` : Add a new namespaced attribute node to an element

### JavaScript events

#### Mouse

`onclick` : User clicks on an element

`oncontextmenu` : User right-clicks on an element to open a context menu

`ondblclick` : User double-clicks on an element

`onmousedown` : User presses a mouse button over an element

`onmouseenter` : Pointer moves onto an element

`onmouseleave` : Pointer moves out of an element

`onmousemove` : Pointer moves while it is over an element

`onmouseover` : Pointer moves onto an element or one of its children

`setInterval()` : Call a function or evaluates an expression at

`oninput` : User input on an element

`onmouseup` : User releases a mouse button while over an element

`onmouseout` : User moves the mouse pointer out of an element or one of its children

`onerror` : Happens when an error occurs while loading an external file

`onloadeddata` : Media data is loaded

`onloadedmetadata` : Metadata (like dimensions and duration) is loaded

`onloadstart` : Browser starts looking for specified media

`onpause` : Media is paused either by the user or automatically

`onplay` : Media is started or is no longer paused

`onplaying` : Media is playing after having been paused or stopped for buffering

`onprogress` : Browser is in the process of downloading the media

`onratechange` : Media play speed changes

`onseeked` : User finishes moving/skipping to a new position in the media

`onseeking` : User starts moving/skipping

`onstalled` : Browser tries to load the media, but it is not available

`onsuspend` — Browser is intentionally not loading media

`ontimeupdate` : Play position has changed (e.g., because of fast forward)

`onvolumechange` : Media volume has changed (including mute)

`onwaiting` : Media paused but expected to resume (for example, buffering)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/javascript-glossary

作者：[Sachin Samal][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sacsam005
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/code_javascript.jpg
