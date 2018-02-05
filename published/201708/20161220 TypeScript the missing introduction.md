一篇缺失的 TypeScript 介绍
=============================================================

**下文是 James Henry（[@MrJamesHenry][8]）所提交的内容。我是 ESLint 核心团队的一员，也是 TypeScript 布道师。我正在和 Todd 在 [UltimateAngular][9] 平台上合作发布 Angular 和 TypeScript 的精品课程。**

> 本文的主旨是为了介绍我们是如何看待 TypeScript 的以及它在加强 JavaScript 开发中所起的作用。
>
> 我们也将尽可能地给出那些类型和编译方面的那些时髦词汇的准确定义。

TypeScript 强大之处远远不止这些，本篇文章无法涵盖，想要了解更多请阅读[官方文档][15]，或者学习 [UltimateAngular 上的 TypeScript 课程][16] ，从初学者成为一位 TypeScript 高手。

### 背景

TypeScript 是个出乎意料强大的工具，而且它真的很容易掌握。

然而，TypeScript 可能比 JavaScript 要更为复杂一些，因为 TypeScript 可能向我们同时引入了一系列以前没有考虑过的 JavaScript 程序相关的技术概念。

每当我们谈论到类型、编译器等这些概念的时候，你会发现很快会变的不知所云起来。

这篇文章就是一篇为了解答你需要知道的许许多多不知所云的概念，来帮助你 TypeScript 快速入门的教程，可以让你轻松自如的应对这些概念。

### 关键知识的掌握

在 Web 浏览器中运行我们的代码这件事或许使我们对它是如何工作的产生一些误解，“它不用经过编译，是吗？”，“我敢肯定这里面是没有类型的...”

更有意思的是，上述的说法既是正确的也是不正确的，这取决于上下文环境和我们是如何定义这些概念的。

首先，我们要作的是明确这些。

#### JavaScript 是解释型语言还是编译型语言？

传统意义上，程序员经常将自己的程序编译之后运行出结果就认为这种语言是编译型语言。

> 从初学者的角度来说，编译的过程就是将我们自己编辑好的高级语言程序转换成机器实际运行的格式。

就像 Go 语言，可以使用 `go build` 的命令行工具编译 .go 的文件，将其编译成代码的低级形式，它可以直接执行、运行。

```
# We manually compile our .go file into something we can run
# using the command line tool "go build"
go build ultimate-angular.go
# ...then we execute it!
./ultimate-angular
```

作为一个 JavaScript 程序员（这一刻，请先忽略我们对新一代构建工具和模块加载程序的热爱），我们在日常的 JavaScript 开发中并没有编译的这一基本步骤，

我们写一些 JavaScript 代码，把它放在浏览器的 `<script>` 标签中，它就能运行了（或者在服务端环境运行，比如：node.js）。

**好吧，因此 JavaScript 没有进行过编译，那它一定是解释型语言了，是吗？**

实际上，我们能够确定的一点是，JavaScript 不是我们自己编译的，现在让我们简单的回顾一个简单的解释型语言的例子，再来谈 JavaScript 的编译问题。

> 解释型计算机语言的执行的过程就像人们看书一样，从上到下、一行一行的阅读。

我们所熟知的解释型语言的典型例子是 bash 脚本。我们终端中的 bash 解释器逐行读取我们的命令并且执行它。

现在我们回到 JavaScript 是解释执行还是编译执行的讨论中，我们要将逐行读取和逐行执行程序分开理解（对“解释型”的简单理解），不要混在一起。

以此代码为例：

```
hello();
function hello(){
	console.log("Hello")
}
```

这是真正意义上 JavaScript 输出 Hello 单词的程序代码，但是，在 `hello()` 在我们定义它之前就已经使用了这个函数，这是简单的逐行执行办不到的，因为 `hello()` 在第一行没有任何意义的，直到我们在第二行声明了它。

像这样在 JavaScript 是存在的，因为我们的代码实际上在执行之前就被所谓的“JavaScript 引擎”或者是“特定的编译环境”编译过，这个编译的过程取决于具体的实现（比如，使用 V8 引擎的 node.js 和 Chome 就和使用 SpiderMonkey 的 FireFox 就有所不同）。

在这里，我们不会在进一步的讲解编译型执行和解释型执行微妙之处（这里的定义已经很好了）。

> 请务必记住，我们编写的 JavaScript 代码已经不是我们的用户实际执行的代码了，即使是我们简单地将其放在 HTML 中的 `<script>` ，也是不一样的。

#### 运行时间 VS 编译时间

现在我们已经正确理解了编译和运行是两个不同的阶段，那“<ruby>运行阶段<rt>Run Time</rt></ruby>”和“<ruby>编译阶段<rt>Compile Time</rt></ruby>”理解起来也就容易多了。

编译阶段，就是我们在我们的编辑器或者 IDE 当中的代码转换成其它格式的代码的阶段。

运行阶段，就是我们程序实际执行的阶段，例如：上面的 `hello()` 函数就执行在“运行阶段”。

#### TypeScript 编译器

现在我们了解了程序的生命周期中的关键阶段，接下来我们可以介绍 TypeScript 编译器了。

TypeScript 编译器是帮助我们编写代码的关键。比如，我们不需将 JavaScript 代码包含到 `<script>` 标签当中，只需要通过 TypeScript 编译器传递它，就可以在运行程序之前得到改进程序的建议。

> 我们可以将这个新的步骤作为我们自己的个人“编译阶段”，这将在我们的程序抵达 JavaScript 主引擎之前，确保我们的程序是以我们预期的方式编写的。

它与上面 Go 语言的实例类似，但是 TypeScript 编译器只是基于我们编写程序的方式提供提示信息，并不会将其转换成低级的可执行文件，它只会生成纯 JavaScript 代码。

```
# One option for passing our source .ts file through the TypeScript
# compiler is to use the command line tool "tsc"
tsc ultimate-angular.ts

# ...this will produce a .js file of the same name
# i.e. ultimate-angular.js
```

在[官方文档][23]中，有许多关于将 TypeScript 编译器以各种方式融入到你的现有工作流程中的文章。这些已经超出本文范围。

#### 动态类型与静态类型

就像对比编译程序与解释程序一样，动态类型与静态类型的对比在现有的资料中也是极其模棱两可的。

让我们先回顾一下我们在 JavaScript 中对于类型的理解。

我们的代码如下：

```
var name = 'James';
var sum = 1 + 2;
```

我们如何给别人描述这段代码？

“我们声明了一个变量 `name`，它被分配了一个 “James” 的**字符串**，然后我们又申请了一个变量 `sum`，它被分配了一个**数字** 1 和**数字** 2 的求和的数值结果。”

即使在这样一个简单的程序中，我们也使用了两个 JavaScript 的基本类型：`String` 和 `Number`。

就像上面我们讲编译一样，我们不会陷入编程语言类型的学术细节当中，关键是要理解在 JavaScript 中类型表示的是什么，并扩展到 TypeScript 的类型的理解上。

从每夜拜读的最新 ECMAScript 规范中我们可以学到（LOL, JK - “wat’s an ECMA?”），它大量引用了 JavaScript 的类型及其用法。

直接引自官方规范：

> ECMAScript 语言的类型取决于使用 ECMAScript 语言的 ECMAScript 程序员所直接操作的值。 
> 
> ECMAScript 语言的类型有 Undefined、Null、Boolean、String、Symbol、Number 和 Object。

我们可以看到，JavaScript 语言有 7 种正式类型，其中我们在我们现在程序中使用了 6 种（Symbol 首次在 ES2015 中引入，也就是 ES6）。

现在我们来深入一点看上面的 JavaScript 代码中的 “name 和 sum”。

我们可以把我们当前被分配了字符串“James”的变量 `name`  重新赋值为我们的第二个变量 sum 的当前值，目前是数字 3。

```
var name = 'James';
var sum = 1 + 2;

name = sum;
```

该 `name` 变量开始“存有”一个字符串，但现在它“存有”一个数字。这凸显了 JavaScript 中变量和类型的基本特性：

“James” 值一直是字符串类型，而 `name` 变量可以分配任何类型的值。和 `sum` 赋值的情况相同，1 是一个数字类型，`sum` 变量可以分配任何可能的值。

> 在 JavaScript 中，值是具有类型的，而变量是可以随时保存任何类型的值。

这也恰好是一个“动态类型语言”的定义。

相比之下，我们可以将“静态类型语言”视为我们可以（也必须）将类型信息与特定变量相关联的语言：

```
var name: string ＝ ‘James’;
```

在这段代码中，我们能够更好地显式声明我们对变量 `name` 的意图，我们希望它总是用作一个字符串。

你猜怎么着？我们刚刚看到我们的第一个 TypeScript 程序。

当我们<ruby>反思</rt>reflect</rt></ruby>我们自己的代码（非编程方面的双关语“反射”）时，我们可以得出的结论，即使我们使用动态语言（如 JavaScript），在几乎所有的情况下，当我们初次定义变量和函数参数时，我们应该有非常明确的使用意图。如果这些变量和参数被重新赋值为与我们原先赋值不同类型的值，那么有可能某些东西并不是我们预期的那样工作的。

> 作为 JavaScript 开发者，TypeScript 的静态类型注释给我们的一个巨大的帮助，它能够清楚地表达我们对变量的意图。 

> 这种改进不仅有益于 TypeScript 编译器，还可以让我们的同事和将来的自己明白我们的代码。代码是用来读的。

### TypeScript 在我们的 JavaScript 工作流程中的作用

我们已经开始看到“为什么经常说 TypeScript 只是 JavaScript + 静态类型”的说法了。`: string` 对于我们的 `name` 变量就是我们所谓的“类型注释”，在编译时被使用（换句话说，当我们让代码通过 TypeScript 编译器时），以确保其余的代码符合我们原来的意图。

我们再来看看我们的程序，并添加显式注释，这次是我们的 `sum` 变量：

```
var name: string = 'James';
var sum: number = 1 + 2;

name = sum;
```

如果我们使用 TypeScript 编译器编译这个代码，我们现在就会收到一个在 `name = sum` 这行的错误： `Type 'number' is not assignable to type 'string'`，我们的这种“偷渡”被警告，我们执行的代码可能有问题。

> 重要的是，如果我们想要继续执行，我们可以选择忽略 TypeScript 编译器的错误，因为它只是在将 JavaScript 代码发送给我们的用户之前给我们反馈的工具。

TypeScript 编译器为我们输出的最终 JavaScript 代码将与上述原始源代码完全相同：

```
var name = 'James';
var sum = 1 + 2;

name = sum;
```

类型注释全部为我们自动删除了，现在我们可以运行我们的代码了。

> 注意：在此示例中，即使我们没有提供显式类型注释的 `: string` 和 `: number` ，TypeScript 编译器也可以为我们提供完全相同的错误  。 

> TypeScript 通常能够从我们使用它的方式推断变量的类型！

#### 我们的源文件是我们的文档，TypeScript 是我们的拼写检查

对于 TypeScript 与我们的源代码的关系来说，一个很好的类比，就是拼写检查与我们在 Microsoft Word 中写的文档的关系。

这两个例子有三个关键的共同点：

1.  **它能告诉我们写的东西的客观的、直接的错误：**
	*	_拼写检查_：“我们已经写了字典中不存在的字”
	*	_TypeScript_：“我们引用了一个符号（例如一个变量），它没有在我们的程序中声明” 
2.	**它可以提醒我们写的可能是错误的：**
	*	_拼写检查_：“该工具无法完全推断特定语句的含义，并建议重写”
	*	_TypeScript_：“该工具不能完全推断特定变量的类型，并警告不要这样使用它” 
3.	**我们的来源可以用于其原始目的，无论工具是否存在错误：**
	*	_拼写检查_：“即使您的文档有很多拼写错误，您仍然可以打印出来，并把它当成文档使用”
	*	_TypeScript_：“即使您的源代码具有 TypeScript 错误，它仍然会生成您可以执行的 JavaScript 代码”

### TypeScript 是一种可以启用其它工具的工具

TypeScript 编译器由几个不同的部分或阶段组成。我们将通过查看这些部分之一  The Parser（语法分析程序）来结束这篇文章，除了 TypeScript 已经为我们做的以外，它为我们提供了在其上构建其它开发工具的机会。

编译过程的“解析器步骤”的结果是所谓的抽象语法树，简称为 AST。

#### 什么是抽象语法树（AST）？

我们以普通文本形式编写我们的程序，因为这是我们人类与计算机交互的最好方式，让它们能够做我们想要的东西。我们并不是很擅长于手工编写复杂的数据结构！

然而，不管在哪种情况下，普通文本在编译器里面实际上是一个非常棘手的事情。它可能包含程序运作不必要的东西，例如空格，或者可能存在有歧义的部分。

因此，我们希望将我们的程序转换成数据结构，将数据结构全部映射为我们所使用的所谓“标记”，并将其插入到我们的程序中。

这个数据结构正是 AST！

AST 可以通过多种不同的方式表示，我使用 JSON 来看一看。

我们从这个极其简单的基本源代码来看：

```
var a = 1;
```

TypeScript 编译器的 Parser（语法分析程序）阶段的（简化后的）输出将是以下 AST：

```
{
  "pos": 0,
  "end": 10,
  "kind": 256,
  "text": "var a = 1;",
  "statements": [
    {
      "pos": 0,
      "end": 10,
      "kind": 200,
      "declarationList": {
        "pos": 0,
        "end": 9,
        "kind": 219,
        "declarations": [
          {
            "pos": 3,
            "end": 9,
            "kind": 218,
            "name": {
              "pos": 3,
              "end": 5,
              "text": "a"
            },
            "initializer": {
              "pos": 7,
              "end": 9,
              "kind": 8,
              "text": "1"
            }
          }
        ]
      }
    }
  ]
}
```

我们的 AST 中的对象称为节点。

#### 示例：在 VS Code 中重命名符号

在内部，TypeScript 编译器将使用 Parser 生成的 AST 来提供一些非常重要的事情，例如，发生在编译程序时的类型检查。

但它不止于此！

> 我们可以使用 AST 在 TypeScript 之上开发自己的工具，如代码美化工具、代码格式化工具和分析工具。

建立在这个 AST 代码之上的工具的一个很好的例子是：<ruby>语言服务器<rt>Language Server</rt></ruby>。

深入了解语言服务器的工作原理超出了本文的范围，但是当我们编写程序时，它能为我们提供一个绝对重量级别功能，就是“重命名符号”。

假设我们有以下源代码：

```
// The name of the author is James
var first_name = 'James';
console.log(first_name);
```

经过代码审查和对完美的适当追求，我们决定应该改换我们的变量命名惯例；使用驼峰式命名方式，而不是我们当前正在使用这种蛇式命名。

在我们的代码编辑器中，我们一直以来可以选择多个相同的文本，并使用多个光标来一次更改它们。

 ![Manually select matches](https://toddmotto.com/img/posts/typescript-the-missing-introduction/manually-select-match.gif) 

当我们把程序也视作文本这样继续操作时，我们已经陷入了一个典型的陷阱中。

那个注释中我们不想修改的“name”单词，在我们的手动匹配中却被误选中了。我们可以看到在现实世界的应用程序中这样更改代码是有多危险。

正如我们在上面学到的那样，像 TypeScript 这样的东西在幕后生成一个 AST 的时候，与我们的程序不再像普通文本那样可以交互，每个标记在 AST 中都有自己的位置，而且它有很清晰的映射关系。

当我们右键单击我们的 `first_name` 变量时，我们可以在 VS Code 中直接“重命名符号”（TypeScript 语言服务器插件也可用于其他编辑器）。

 ![Rename Symbol Example](https://toddmotto.com/img/posts/typescript-the-missing-introduction/rename-symbol-example.gif) 

非常好！现在我们的 `first_name` 变量是唯一需要改变的东西，如果需要的话，这个改变甚至会发生在我们项目中的多个文件中（与导出和导入的值一样）！

### 总结

哦，我们在这篇文章中已经讲了很多的内容。

我们把有关学术方面的规避开，围绕编译器和类型还有很多专业术语给出了通俗的定义。

我们对比了编译语言与解释语言、运行阶段与编译阶段、动态类型与静态类型，以及抽象语法树（AST）如何为我们的程序构建工具提供了更为优化的方法。

重要的是，我们提供了 TypeScript 作为我们 JavaScript 开发工具的一种思路，以及如何在其上构建更棒的工具，比如说作为重构代码的一种方式的重命名符号。

快来 UltimateAngular 平台上学习从初学者到 TypeScript 高手的课程吧，开启你的学习之旅！

--------------------------------------------------------------------------------

via: https://toddmotto.com/typescript-the-missing-introduction

作者：James Henry
译者：[MonkeyDEcho](https://github.com/MonkeyDEcho)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#javascript---interpreted-or-compiled
[2]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#run-time-vs-compile-time
[3]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#the-typescript-compiler
[4]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#dynamic-vs-static-typing
[5]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#our-source-file-is-our-document-typescript-is-our-spell-check
[6]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#what-is-an-abstract-syntax-tree-ast
[7]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#example-renaming-symbols-in-vs-code
[8]:https://twitter.com/MrJamesHenry
[9]:https://ultimateangular.com/courses
[10]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#background
[11]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#getting-to-grips-with-the-buzzwords
[12]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#typescripts-role-in-our-javascript-workflow
[13]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#typescript-is-a-tool-which-enables-other-tools
[14]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#summary
[15]:http://www.typescriptlang.org/docs
[16]:https://ultimateangular.com/courses#typescript
[17]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#table-of-contents
[18]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#background
[19]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#getting-to-grips-with-the-buzzwords
[20]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#javascript---interpreted-or-compiled
[21]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#run-time-vs-compile-time
[22]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#the-typescript-compiler
[23]:http://www.typescriptlang.org/docs
[24]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#dynamic-vs-static-typing
[25]:http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-262.pdf
[26]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#typescripts-role-in-our-javascript-workflow
[27]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#our-source-file-is-our-document-typescript-is-our-spell-check
[28]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#typescript-is-a-tool-which-enables-other-tools
[29]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#what-is-an-abstract-syntax-tree-ast
[30]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#example-renaming-symbols-in-vs-code
[31]:https://toddmotto.com/typescript-the-missing-introduction?utm_source=javascriptweekly&utm_medium=email#summary
[32]:https://ultimateangular.com/courses#typescript





















