[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13140-1.html)
[#]: subject: (A practical guide to JavaScript closures)
[#]: via: (https://opensource.com/article/21/2/javascript-closures)
[#]: author: (Nimisha Mukherjee https://opensource.com/users/nimisha)

JavaScript 闭包实践
======

> 通过深入了解 JavaScript 的高级概念之一：闭包，更好地理解 JavaScript 代码的工作和执行方式。

![](https://img.linux.net.cn/data/attachment/album/202102/21/162941ogyb74z3ahfbfe35.jpg)

在《[JavaScript 如此受欢迎的 4 个原因][2]》中，我提到了一些高级 JavaScript 概念。在本文中，我将深入探讨其中的一个概念：<ruby>闭包<rt>closure</rt></ruby>。

根据 [Mozilla 开发者网络][3]（MDN），“闭包是将一个函数和对其周围的状态（词法环境）的引用捆绑在一起（封闭）的组合。”简而言之，这意味着在一个函数内部的函数可以访问其外部（父）函数的变量。

为了更好地理解闭包，可以看看作用域及其执行上下文。

下面是一个简单的代码片段：

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

下面是这段代码的执行上下文：

![JS 代码的执行上下文][4]

每次创建函数时（在函数创建阶段）都会创建闭包。每个闭包有三个作用域。

  * 本地作用域（自己的作用域）
  * 外部函数范围
  * 全局范围

我稍微修改一下上面的代码来演示一下闭包：

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

内部函数 `wish()` 在执行之前就从外部函数返回。这是因为 JavaScript 中的函数形成了**闭包**。

  * 当 `sayHelloWorld` 运行时，`callFunc` 持有对函数 `wish` 的引用。
  * `wish` 保持对其周围（词法）环境的引用，其中存在变量 `world`。

### 私有变量和方法

本身，JavaScript 不支持创建私有变量和方法。闭包的一个常见和实用的用途是模拟私有变量和方法，并允许数据隐私。在闭包范围内定义的方法是有特权的。

这个代码片段捕捉了 JavaScript 中闭包的常用编写和使用方式：

```
var resourceRecord = function(myName, myAddress) {
    var resourceName = myName;
    var resourceAddress = myAddress;
    var accessRight = "HR";
    return {
        changeName: function(updateName, privilege) {
            // only HR can change the name
            if (privilege === accessRight ) {
                resourceName = updateName;
                return true;
            } else {
                return false;
            }
        },  
        changeAddress: function(newAddress) {
            // any associate can change the address
            resourceAddress = newAddress;          
        },  
        showResourceDetail: function() {
            console.log ("Name:" + resourceName + " ; Address:" + resourceAddress);
        }
    }
}
// Create first record
var resourceRecord1 = resourceRecord("Perry","Office");
// Create second record
var resourceRecord2 = resourceRecord("Emma","Office");
// Change the address on the first record
resourceRecord1.changeAddress("Home");
resourceRecord1.changeName("Perry Berry", "Associate"); // Output is false as only an HR can change the name
resourceRecord2.changeName("Emma Freeman", "HR"); // Output is true as HR changes the name
resourceRecord1.showResourceDetail(); // Output - Name:Perry ; Address:Home
resourceRecord2.showResourceDetail(); // Output - Name:Emma Freeman ; Address:Office
```

资源记录（`resourceRecord1` 和 `resourceRecord2`）相互独立。每个闭包通过自己的闭包引用不同版本的 `resourceName` 和 `resourceAddress` 变量。你也可以应用特定的规则来处理私有变量，我添加了一个谁可以修改 `resourceName` 的检查。

### 使用闭包

理解闭包是很重要的，因为它可以更深入地了解变量和函数之间的关系，以及 JavaScript 代码如何工作和执行。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/javascript-closures

作者：[Nimisha Mukherjee][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nimisha
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://linux.cn/article-12830-1.html
[3]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures
[4]: https://opensource.com/sites/default/files/uploads/execution-context.png (Execution context for JS code)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
