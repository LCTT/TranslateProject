简洁的介绍TypeScript
=============================================================


**下文是James Henry([@MrJamesHenry][8])所编辑的内容。我是ESLint核心团队的一员，也是TypeScript的热衷者和发扬者。我和Todd合作在[UltimateAngular][9]平台上发布Angular和TypeScript的精品课程。**

> 本文的主旨是为了介绍我们对TypeScript的思考和在JavaScript开发当中的更好的使用。
>
> 我们将给出编译和关键字准确的定义

TypeScript强大之处远远不止这些，本篇文章无法涵盖，想要了解更多请阅读官方文档[official document][15]，或者查阅[TypeScript courses over on UltimateAngular][16]UltimateAngular平台的TypeScript精品课程－从初学者到TypeScript高手

### [目录][17]

*   [背景][10]
*   [关键知识的掌握][11]
    *   [JavaScript解释型语言还是编译型语言][1]
    *   [运行时间 VS 编译时间][2]
    *   [TypeScript编译器][3]
    *   [动态类型 VS 静态类型][4]
*   [TypeScript在我们JavaScript工作流程中的作用][12]
	*	[我们的源文件是我们的文档，TypeScript是我们的拼写检查][5]
*	[TypeScript是一种可以启动其它工具的工具][13]
	*	[什么是抽象语法树（AST）？][6]
	*	[示例：在VS中重命名符号][7]
*	[总结][14]

### [背景][18]

TypeScript是很容易掌握的强大开发工具

然而，TypeScript可能比JavaScript要更为复杂，因为TypeScript可能同时向我们介绍以前没有考虑到的JavaScript程序相关的一些列技术概念。

每当我们谈论到类型、编译器等这些概念的时候。事情就会变的非常麻烦和不知所云起来。

这篇文章就是为了你在学习过程中你需要知道的许许多多不知所云的概念解答的，来帮助你TypeScript入门的，让你轻松自如的应对这些概念。

### [关键知识的掌握][19]

有时候运行我们的代码是在Web浏览器中运行，和我们平常运行代码有不同的感觉，它是怎样运行自己书写的代码的？“没有经过编译的，是正确的吗？”。“我敢肯定没有类型的...”

情况变的更有趣了，当我们知道通过前后程序的定义来判断语法的正确与否

首先我们要作的是

#### [JavaScript 解释型语言还是编译型语言][20]

传统意义上，程序员经常将自己的程序编译之后运行出结果就认为这种语言是编译型语言。

> 从初学者的角度来说，编译的过程就是将我们自己编辑好的高级语言程序转换成机器实际运行过程中能够看懂的格式（一般是二进制文件格式）。

就像GO语言，可以使用go build的命令行工具编译.go的文件格式，将其编译成较低级的语言，可以直接运行的格式。（译者没有使用过GO语言，不清楚GO编译过程的机制，试着用C语言的方式说明）

```
# We manually compile our .go file into something we can run
# using the command line tool "go build"
go build ultimate-angular.go
# ...then we execute it!
./ultimate-angular
```

我们在日常使用JavaScript开发的时候并没有编译的这一步，这是JavaScript忽略了我们程序员对新一代构建工具和模块加载程序的热爱。

我们编写JavaScript代码在浏览器的<script>标签进行加载运行（或者在服务端环境运行，比如：node.js）

**是的，JavaScript没有进过编译，那他一定是解释型语言吗？

实际上，我们能够确定的一点是，JavaScript不是我们自己编译的，现在我们简单的回顾一个简单的解释型语言的例子，再来谈JavaScript的编译问题。

> 计算机的解释执行的过程就行人们看书一样，从上到下一行一行的阅读。

我们熟知的解释型语言是bash Script。我们终端中的bash解释器逐行读取我们的命令并且执行它。

现在我们回到JavaScript是解释执行还是编译执行的讨论中，解释执行要将逐行读取和执行程序分开理解，不要和在一起理解。

以此代码为例

```
hello();
function hello(){
	console.log("Hello")
}
```

这是正真意义上JavaScript输出Hello字符的程序代码，但是，在hello()在我们定义他之前就已经使用了这个函数，这是简单逐行执行办不到的，因为hello()在第一行没有任何意义，直到我们在之后声明了它。

像这样的在JavaScript是存在的，因为我们的代码实际上在执行之前就被所谓的”JavaScript引擎“或者是”特定的编译环境“编译过，这个编译的过程取决于具体的实现。（比如，使用v8引擎的node.js和Chome就和使用SpiderMonkey的FireFox就有所不一样）

我们不会在进一步的讲解编译型执行和解释型执行微妙之处。（这里的定义已经很好了）

> 请务必记住，我们编写的JavaScript代码已经不是普通用户（初学者）执行的代码了，即使<script>在HTML中只是个标签，也是不一样的。

#### [运行时间 VS 编译时间][21]

现在我们已经理解了编译和运行是二个不同的阶段，那运行时间和编译时间理解起来也就容易多了。

编译时间，就是我们在我们的编辑器或者IDE当中的代码转换成其它格式的代码

运行时间，就是我们程序实际执行的过程，例如：上面的hello()就是函数执行的具体时间

#### [TypeScript编译器][22]

现在我们了解了程序的生命周期中的关键阶段，接下来我们可以介绍TypeScript编译器了。

TypeScript编译器是帮助我们编写代码的核心。比如，我们不需将JavaScript代码包含到<script>标签当中，只需要通过TypeScript编译器传递它，以便在运行程序之前更好的修改程序

> 我们可以将这个新的步骤作为我们自己的个人“编译时间”，这将有助于我们的程序按照我们预期的方式编写，甚至达到了JavaScript引擎的作用。

它与上面Golang的实例类似，但是TypeScript编译器只是基于我们编写程序的方式提供提示信息，并不会将其转换成较低级的可执行文件，它只会生成纯JavaScript代码。

```
# One option for passing our source .ts file through the TypeScript
# compiler is to use the command line tool "tsc"
tsc ultimate-angular.ts

# ...this will produce a .js file of the same name
# i.e. ultimate-angular.js
```

在[官方文档][23]中有许多关于将TypeScript编译器融入到你的现有工作流程中。这些已经超出本文范围。

#### [动态类型 VS 静态类型][24]

就像编译程序 VS 解释程序一样，动态类型 VS 静态类型在现有的资料中也是模棱两可的。

让我门先回顾一下，我们在JavaScript中对于类型的理解。

我门的代码如下：

```
var name = 'James';
var sum = 1 + 2;
```

我门如何给别人描述这段代码。

我们声明了一个变量 name，它被分配了一个“James”的字符串，然后我们又申请了一个变量 sum，它被分配了一个数字1数字2的求和的数值结果值。

即使在这样一个简单的程序中，我们也使用了二个JavaScript的基本类型：String 和 Number

就像上面我们讲编译一样，我门不会陷入编程语言类型的细节当中，关键是要理解在JavaScript中类型的表示的是什么。以至于扩展到TypeScript的类型的理解上。

我们阅读官方最新的ECMAScript规范中的实例程序，它大量引入了JavaScript的类型和用法。

官方规定

> ECMAScript语言类型对应于使用ECMAScript语言的ECMAScript程序员直接操作的值。 
> 
> ECMAScript语言类型为Undefined，Null，Boolean，String，Symbol，Number和Object。

我们可以看到，JavaScript语言正式有7种类型，其中我们可能在我们现在程序中使用了6种（Symbol首次在ES2015中引入，也就是ES6）。

现在我们来深入一点的看上面的JavaScript代码中的“name 和 sum”

我们可以使用我们 name 当前被分配了字符串'James'的变量 ，并将其重新分配给我们的第二个当前值是数字3的变量 sum 。

```
var name = 'James';
var sum = 1 + 2;

name = sum;
```

该 name 变量开始“保持”一个字符串，但现在它保存一个数字。这突出了JavaScript中变量和类型的基本特性：

‘James’是一个字符串类型，而name变量可以分配任何类型的值。和sum赋值的情况相同，1 是一个数字类型，sum变量可以分配任何可能的值。

> 在JavaScript中，值是具有类型的，而变量是可以随时保存任何类型的值。

这也恰好是一个“动态类型语言”的定义。

相比之下，我们可以将“静态类型语言”视为我们可以（必须）将类型信息与特定变量相关联的语言：

```
var name: string ＝ ‘James’;
```

在这段代码中，我们能够更好地显式声明我们对变量name的意图，我们希望它总是用作一个字符串。

你猜怎么着？我们刚刚看到我们的第一个TypeScript程序。

当我们反思我们自己的代码（没有规划程序的双关语）时，我们可以得出的结论，即使我们使用动态语言（如JavaScript），在几乎所有的情况下，我们应该有非常明确的意图先定义我们的变量和函数参数然后再来使用他们。如果这些变量和参数被重新分配，将不同类型的值保存到我们首先分配给值的那些，那么有可能我们这样分配程序是不会工作的。

> 作为JavaScript开发者，TypeScript的静态类型注释给我们的一个巨大的帮助，够清楚地表达我们对变量的意图。 

> 这种改进不仅有益于TypeScript编译器，还可以让我们的同事和将来的自己明白我们的代码。代码的阅读远远超过编写。

### [TypeScript在我们JavaScript工作流程中的作用][26]

我们已经开始看到为什么经常说TypeScript只是JavaScript + Static Types。: string 对于我们的 name 变量就是我们所谓的“类型注释”。  在编译时被使用   （换句话说，当我们通过TypeScript编译器传递代码时），以确保其余的代码符合我们原来的意图。

我们再来看看我们的程序，并添加显式注释，这次是我们的  sum 变量：

```
var name: string = 'James';
var sum: number = 1 + 2;

name = sum;
```

如果我们使用TypeScript编译器编译这个代码，我们现在就会收到一个在 name = sum 这行的错误，Type 'number' is not assignable to type 'string'，我们被警告不能这样传递（运送），我们执行的代码可能有问题。

> 更厉害的是，如果我们想要继续执行，我们可以选择忽略来自TypeScript编译器的错误，因为它只是在将JavaScript代码发送给我们的用户之前给出了我们对JavaScript代码的反馈的工具。

TypeScript编译器为我们输出的最终JavaScript代码将与上述原始源代码完全相同：

```
var name = 'James';
var sum = 1 + 2;

name = sum;
```

类型注释全部为我们自动删除，现在我们可以运行我们的代码。

> 注意：在此示例中，即使我们没有提供显式类型注释的 : string 和: number ，TypeScript编译器也可以为我们提供完全相同的错误  。 
>
> TypeScript通常能够从我们使用它的方式推断变量的类型！

#### [我们的源文件是我们的文档，TypeScript是我们的拼写检查][27]

对于TypeScript与我们的源代码的关系来说，一个很好的类比，就是拼写检查与我们在Microsoft Word中写的文档的关系。

这两个例子有三个关键的共同点：

1.  **我们写的东西是客观的，它可以告诉我们写的对不对：
	*	_拼写检查：“我们已经写了字典中不存在的字”
	*	_TypeScript：“我们引用了一个符号（例如一个变量），它没有在我们的程序中声明” 

2.	**它可以表明我们写的可能是错误的：
	*	_拼写检查：“该工具无法完全推断特定条款的含义，并建议重写”
	*	_TypeScript：“该工具不能完全推断特定变量的类型并警告不要使用它” 

3.	**我们的来源可以用于其原始目的，无论工具是否存在错误：
	*	_拼写检查：“即使您的文档有很多拼写错误，您仍然可以打印出来，并将其用作文档”
	*	_TypeScript：“即使您的源代码具有TypeScript错误，它仍然会生成JavaScript代码，您可以执行”

#### [TypeScript是一种可以启动其它工具的工具][28]

TypeScript编译器由几个不同的部分或阶段组成。我们将通过查看这些部分之一 -The Parser-（语法分析程序）；为我们提供了构建其他开发人员工具的机会，除了TypeScript已经为我们做的以外。

编译过程的“解析器步骤”的结果是所谓的抽象语法树，简称为AST。

#### [什么是抽象语法树（AST）？}[29]

我们以自由的文本形式编写我们的程序，因为这是我们人类与计算机交互的最好方式，让他们能够做我们想要的东西。我们手工编写复杂的数据结构并不是很棒！

然而，在任何一种合理的方式下，自由文本实际上是一个非常棘手的事情。它可能包含程序不必要的东西，例如空格，或者可能存在不明确的部分。

因此，我们希望将我们的程序转换成数据结构，将数据结构映射出所有使用的所谓“令牌”，并将其插入到我们的程序中。

这个数据结构正是AST！

AST可以通过多种不同的方式表示，我使用JSON来看一看。

我们从这个令人难以置信的基本源代码来看：

```
var a = 1;
```

TypeScript编译器的Parser（语法分析程序）阶段的（简化的）输出将是以下AST：

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

我们的AST中的对象称为节点。

#### [示例：在VS中重命名符号][30]

在内部，TypeScript编译器将使用Parser生成的AST来提供一些非常重要的事情，例如 编译程序时发生的类型检查。

但它不止于此！

> 我们可以使用AST在TypeScript之上开发自己的工具，如linters，formatter和分析工具。

建立在这个AST代码之上的工具的一个很好的例子是：语言服务器。

深入了解语言服务器的工作原理超出了本文的范围，但是当我们编写程序时，它能为我们提供一个重量级别功能，就是“重命名符号”。

假设我们有以下源代码：

```
// The name of the author is James
var first_name = 'James';
console.log(first_name);
```

经过代码审查和适当的 ，决定应该切换我们的变量命名；使用骆驼式命名方式，而不是我们当前正在使用这种方式。

在我们的代码编辑器中，我们一直以来可以选择多个相同的文本，并使用多个光标来一次更改它们。

 ![Manually select matches](https://toddmotto.com/img/posts/typescript-the-missing-introduction/manually-select-match.gif) 

当我们继续这样的操作的时候，我们已经陷入了一个典型的陷阱中。

的在我们手动匹配过程中，我们不想改变的“name”变量名在抽象语法书中的结构，可以这样的操作已经改变了。我们可以看到在现实世界的应用程序中更改这样的代码是有多高的风险？

正如我们在上面学到的那样，像TypeScript这样的东西在幕后生成一个AST的时候，它不再像我们的程序那样与自己的程序交互 ，每个标记在AST中都有自己的位置，而且它有很清晰的映射关系。

当我们右键单击我们的first_name变量（TypeScript语言服务器插件可用于其他编辑器）时，我们可以使用“代码符号”选项直接在VS中编辑。

 ![Rename Symbol Example](https://toddmotto.com/img/posts/typescript-the-missing-introduction/rename-symbol-example.gif) 

好多了！现在我们的first_name变量是唯一需要改变的东西，如果合适，这个变化甚至会发生在我们项目中的多个文件中（与导出和导入的值一样）！

### [总结][31]

我们在这篇文章中已经讲了很多的内容。

我们把有关学术方面的规避开，围绕编译器和类型还有很多专业术语给出了通俗的定义。

我们查看了编译语言vs解释语言，运行时间与编译时间，动态类型vs静态类型，以及抽象语法树如何为我们的程序构建工具提供了更为优化的方法。

重要的是，我们提供了TypeScript思考方式作为我们JavaScript开发者的一种方式，它可以建立在如何提供更为惊人的实用程序，如重命名符号作为重构代码的一种方式。

快来UltimateAngular平台上学习从初学者到TypeScript高手的课程吧，开启你的学习之旅！


-------------------------------------------------------------------------------

作者简介：

![](https://toddmotto.com/img/todd.jpg)

I‘m Todd, I teach the world Angular through @UltimateAngular. Conference speaker and Developer Expert at Google.

--------------------------------------------------------------------------------

via: https://toddmotto.com/typescript-the-missing-introduction

作者：[Todd][a]
译者：[MonkeyDEcho](https://github.com/MonkeyDEcho)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/intent/follow?original_referer=https%3A%2F%2Ftoddmotto.com%2Ftypescript-the-missing-introduction%3Futm_source%3Djavascriptweekly%26utm_medium%3Demail&ref_src=twsrc%5Etfw&region=follow_link&screen_name=toddmotto&tw_p=followbutton
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





















