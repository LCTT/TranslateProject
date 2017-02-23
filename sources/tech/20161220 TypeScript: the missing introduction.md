TypeScript: the missing introduction
============================================================


**The following is a guest post by James Henry ([@MrJamesHenry][8]). I am a member of the ESLint Core Team, and a TypeScript evangelist. I am working with Todd on [UltimateAngular][9] to bring you more award-winning Angular and TypeScript courses.**

> The purpose of this article is to offer an introduction to how we can think about TypeScript, and its role in supercharging our **JavaScript** development. 
> 
> We will also try and come up with our own reasonable definitions for a lot of the buzzwords surrounding types and compilation.

There is huge amount of great stuff in the TypeScript project that we won’t be able to cover within the scope of this blog post. Please read the [official documentation][15] to learn more, and check out the [TypeScript courses over on UltimateAngular][16] to go from total beginner to TypeScript Pro!

### [Table of contents][17]

*   [Background][10]
*   [Getting to grips with the buzzwords][11]
    *   [JavaScript - interpreted or compiled?][1]
    *   [Run Time vs Compile Time][2]
    *   [The TypeScript Compiler][3]
    *   [Dynamic vs Static Typing][4]
*   [TypeScript’s role in our JavaScript workflow][12]
    *   [Our source file is our document, TypeScript is our Spell Check][5]
*   [TypeScript is a tool which enables other tools][13]
    *   [What is an Abstract Syntax Tree (AST)?][6]
    *   [Example: Renaming symbols in VS Code][7]
*   [Summary][14]

### [Background][18]

TypeScript is an amazingly powerful tool, and really quite easy to get started with.

It can, however, come across as more complex than it is, because it may simultaneously be introducing us to a whole host of technical concepts related to our JavaScript programs that we may not have considered before.

Whenever we stray into the area of talking about types, compilers, etc. things can get really confusing, really fast.

This article is designed as a “what you need to know” guide for a lot of these potentially confusing concepts, so that by the time you dive into the “Getting Started” style tutorials, you are feeling confident with the various themes and terminology that surround the topic.

### [Getting to grips with the buzzwords][19]

There is something about running our code in a web browser that makes us _feel_ differently about how it works. “It’s not compiled, right?”, “Well, I definitely know there aren’t any types…”

Things get even more interesting when we consider that both of those statements are both correct and incorrect at the same time - depending on the context and how you define some of these concepts.

As a first step, we are going to do exactly that!

#### [JavaScript - interpreted or compiled?][20]

Traditionally, developers will often think about a language being a “compiled language” when they are the ones responsible for compiling their own programs.

> In basic terms, when we compile a program we are converting it from the form we wrote it in, to the form it actually gets run in.

In a language like Golang, for example, you have a command line tool called `go build`which allows you to compile your `.go` file into a lower-level representation of the code, which can then be executed and run:

```
# We manually compile our .go file into something we can run
# using the command line tool "go build"
go build ultimate-angular.go
# ...then we execute it!
./ultimate-angular
```

As authors of JavaScript (ignoring our love of new-fangled build tools and module loaders for a moment), we don’t have such a fundamental compilation step in our workflow.

We write some code, and load it up in a browser using a `<script>` tag (or a server-side environment such as node.js), and it just runs.

**Ok, so JavaScript isn’t compiled - it must be an interpreted language, right?**

Well, actually, all we have determined so far is that JavaScript is not something that we compile _ourselves_, but we’ll come back to this after we briefly look an example of an “interpreted language”.

> An interpreted computer program is one that is executed like a human reads a book, starting at the top and working down line-by-line.

The classic example of interpreted programs that we are already familiar with are bash scripts. The bash interpreter in our terminal reads our commands in line-by-line and executes them.

Now, if we return to thinking about JavaScript and whether or not it is interpreted or compiled, intuitively there are some things about it that just don’t add up when we think about reading and executing a program line-by-line (our simple definition of “interpreted”).

Take this code as an example:

```
hello();
function hello() {
  console.log('Hello!');
}
```

This is perfectly valid JavaScript which will print the word “Hello!”, but we have used the `hello()` function before we have even defined it! A simple line-by-line execution of this program would just not be possible, because `hello()` on line 1 does not have any meaning until we reach its declaration on line 2.

The reason that this, and many other concepts like it, is possible in JavaScript is because our code is actually compiled by the so called “JavaScript engine”, or environment, before it is executed. The exact nature of this compilation process will depend on the specific implementation (e.g. V8, which powers node.js and Google Chrome, will behave slightly differently to SpiderMonkey, which is used by FireFox).

We will not dig any further into the subtleties of defining “compiled vs interpreted” here (there are a LOT).

> It’s useful to always keep in mind that the JavaScript code we write is already not the actual code that will be executed by our users, even when we simply have a `<script>` tag in an HTML document.

#### [Run Time vs Compile Time][21]

Now that we have properly introduced the idea that compiling a program and running a program are two distinct phases, the terms “Run Time” and “Compile Time” become a little easier to reason about.

When something happens at **Compile Time**, it is happening during the conversion of our code from what we wrote in our editor/IDE to some other form.

When something happens at **Run Time**, it is happening during the actual execution of our program. For example, our `hello()` function above is executed at “run time”.

#### [The TypeScript Compiler][22]

Now that we understand these key phases in the lifecycle of a program, we can introduce the **TypeScript compiler**.

The TypeScript compiler is at the core of how TypeScript is able to help us when we write our code. Instead of just including our JavaScript in a `<script>` tag, for example, we will first pass it through the TypeScript compiler so that it can give us helpful hints on how we can improve our program before it runs.

> We can think about this new step as our own personal “compile time”, which will help us ensure that our program is written in the way we intended, before it even reaches the main JavaScript engine.

It is a similar process to the one shown in the Golang example above, except that the TypeScript compiler just provides hints based on how we have written our program, and doesn’t turn it into a lower-level executable - it produces pure JavaScript.

```
# One option for passing our source .ts file through the TypeScript
# compiler is to use the command line tool "tsc"
tsc ultimate-angular.ts

# ...this will produce a .js file of the same name
# i.e. ultimate-angular.js
```

There are many great posts about the different options for integrating the TypeScript compiler into your existing workflow, including the [official documentation][23]. It is beyond the scope of this article to go into those options here.

#### [Dynamic vs Static Typing][24]

Just like with “compiled vs interpreted” programs, the existing material on “dynamic vs static typing” can be incredibly confusing.

Let’s start by taking a step back and refreshing our memory on how much we _already_understand about types from our existing JavaScript code.

We have the following program:

```
var name = 'James';
var sum = 1 + 2;
```

How would we describe this code to somebody?

“We have declared a variable called `name`, which is assigned the **string** of ‘James’, and we have declared the variable `sum`, which is assigned the value we get when we add the **number** `1` to the **number** `2`.”

Even in such a simple program, we have already highlighted two of JavaScript’s fundamental types: String and Number.

As with our introduction to compilation above, we are not going to get bogged down in the academic subtleties of types in programming languages - the key thing is understanding what it means for our JavaScript so that we can then extend it to properly understanding TypeScript.

We know from our traditional nightly ritual of reading the [latest ECMAScript specification][25]**(LOL, JK - “wat’s an ECMA?”)**, that it makes numerous references to types and their usage in JavaScript.

Taken directly from the official spec:

> An ECMAScript language type corresponds to values that are directly manipulated by an ECMAScript programmer using the ECMAScript language. 
> 
> The ECMAScript language types are Undefined, Null, Boolean, String, Symbol, Number, and Object.

We can see that the JavaScript language officially has 7 types, of which we have likely used 6 in just about every real-world program we have ever written (Symbol was first introduced in ES2015, a.k.a. ES6).

Now, let’s think a bit more deeply about our “name and sum” JavaScript program above.

We could take our `name` variable which is currently assigned the **string** ‘James’, and reassign it to the current value of our second variable `sum`, which is the **number** `3`.

```
var name = 'James';
var sum = 1 + 2;

name = sum;
```

The `name` variable started out “holding” a string, but now it holds a number. This highlights a fundamental quality of variables and types in JavaScript:

The _value_ ‘James’ is always one type - a string - but the `name` variable can be assigned any value, and therefore any type. The exact same is true in the case of the `sum`assignment: the _value_ `1` is always a number type, but the `sum` variable could be assigned any possible value.

> In JavaScript, it is _values_, not variables, which have types. Variables can hold any value, and therefore any _type_, at any time.

For our purposes, this also just so happens to be the very definition of a **“dynamically typed language”**!

By contrast, we can think of a **“statically typed language”** as being one in which we can (and very likely have to) associate type information with a particular variable:

```
var name: string = 'James';
```

In this code, we are better able to explicitly declare our _intentions_ for the `name` variable - we want it to always be used as a string.

And guess what? We have just seen our first bit of TypeScript in action!

When we reflect on our own code (no programming pun intended), we can likely conclude that even when we are working with dynamic languages like JavaScript, in almost all cases we should have pretty clear intentions for the usage of our variables and function parameters when we first define them. If those variables and parameters are reassigned to hold values of _different_ types to ones we first assigned them to, it is possible that something is not working out as we planned.

> One great power that the static type annotations from TypeScript give us, as JavaScript authors, is the ability to clearly express our intentions for our variables. 
> 
> This improved clarity benefits not only the TypeScript compiler, but also our colleagues and future selves when they come to read and understand our code. Code is _read_ far more than it is written.

### [TypeScript’s role in our JavaScript workflow][26]

We have started to see why it is often said that TypeScript is just JavaScript + Static Types. Our so-called “type annotation” `: string` for our `name` variable is used by TypeScript at _compile time_ (in other words, when we pass our code through the TypeScript compiler) to make sure that the rest of the code is true to our original intention.

Let’s take a look at our program again, and add another explicit annotation, this time for our `sum` variable:

```
var name: string = 'James';
var sum: number = 1 + 2;

name = sum;
```

If we let TypeScript take a look at this code for us, we will now get an error `Type 'number' is not assignable to type 'string'` for our `name = sum` assignment, and we are appropriately warned against shipping _potentially_ problematic code to be executed by our users.

> Importantly, we can choose to ignore errors from the TypeScript compiler if we want to, because it is just a tool which gives us feedback on our JavaScript code before we ship it to our users.

The final JavaScript code that the TypeScript compiler will output for us will look exactly the same as our original source above:

```
var name = 'James';
var sum = 1 + 2;

name = sum;
```

The type annotations are all removed for us automatically, and we can now run our code.

> NOTE: In this example, the TypeScript Compiler would have been able to offer us the exact same error even if we hadn’t provided the explicit type annotations `: string` and `: number`. 
> 
> TypeScript is very often able to just _infer_ the type of a variable from the way we have used it!

#### [Our source file is our document, TypeScript is our Spell Check][27]

A great analogy for TypeScript’s relationship with our source code, is that of Spell Check’s relationship to a document we are writing in Microsoft Word, for example.

There are three key commonalities between the two examples:

1.  **It can tell us when stuff we have written is objectively, flat-out wrong:**
    *   _Spell Check_: “we have written a word that does not exist in the dictionary”
    *   _TypeScript_: “we have referenced a symbol (e.g. a variable), which is not declared in our program” 

2.  **It can suggest that what we have written _might be_ wrong:**
    *   _Spell Check_: “the tool is not able to fully infer the meaning of a particular clause and suggests rewriting it”
    *   _TypeScript_: “the tool is not able to fully infer the type of a particular variable and warns against using it as is” 

3.  **Our source can be used for its original purpose, regardless of if there are errors from the tool or not:**
    *   _Spell Check_: “even if your document has lots of Spell Check errors, you can still print it out and “use” it as document”
    *   _TypeScript_: “even if your source code has TypeScript errors, it will still produce JavaScript code which you can execute”

### [TypeScript is a tool which enables other tools][28]

The TypeScript compiler is made up of a couple of different parts or phases. We are going to finish off this article by looking at how one of those parts - **the Parser** - offers us the chance to build _additional developer tools_ on top of what TypeScript already does for us.

The result of the “parser step” of the compilation process is what is called an **Abstract Syntax Tree**, or **AST** for short.

#### [What is an Abstract Syntax Tree (AST)?][29]

We write our programs in a free text form, as this is a great way for us humans to interact with our computers to get them to do the stuff we want them to. We are not so great at manually composing complex data structures!

However, free text is actually a pretty tricky thing to work with within a compiler in any kind of reasonable way. It may contain things which are unnecessary for the program to function, such as whitespace, or there may be parts which are ambiguous.

For this reason, we ideally want to convert our programs into a data structure which maps out all of the so-called “tokens” we have used, and where they slot into our program.

This data structure is exactly what an AST is!

An AST could be represented in a number of different ways, but let’s take a look at a quick example using our old buddy JSON.

If we have this incredibly basic source code:

```
var a = 1;
```

The (simplified) output of the TypeScript Compiler’s **Parser** phase will be the following AST:

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

The objects in our in our AST are called _nodes_.

#### [Example: Renaming symbols in VS Code][30]

Internally, the TypeScript Compiler will use the AST it has produced to power a couple of really important things such as the actual **Type Checking** that occurs when we compile our programs.

But it does not stop there!

> We can use the AST to develop our own tooling on top of TypeScript, such as linters, formatters, and analysis tools.

One great example of a tool built on top of this AST generation is the **Language Server**.

It is beyond the scope of this article to dive into how the Language Server works, but one absolutely killer feature that it enables for us when we write our programs is that of “renaming symbols”.

Let’s say that we have the following source code:

```
// The name of the author is James
var first_name = 'James';
console.log(first_name);
```

After a _thorough_ code review and appropriate bikeshedding, it is decided that we should switch our variable naming convention to use camel case instead of the snake case we are currently using.

In our code editors, we have long been able to select multiple occurrences of the same text and use multiple cursors to change all of them at once - awesome!

 ![Manually select matches](https://toddmotto.com/img/posts/typescript-the-missing-introduction/manually-select-match.gif) 

Ah! We have fallen into one of the classic traps that appear when we continue to treat our programs as pieces of text.

The word “name” in our comment, which we did not want to change, got caught up in our manual matching process. We can see how risky such a strategy would be for code changes in a real-world application!

As we learned above, when something like TypeScript generates an AST for our program behind the scenes, it no longer has to interact with our program as if it were free text - each token has its own place in the AST, and its usage is clearly mapped.

We can take advantage of this directly in VS Code using the “rename symbol” option when we right click on our `first_name` variable (TypeScript Language Server plugins are available for other editors).

 ![Rename Symbol Example](https://toddmotto.com/img/posts/typescript-the-missing-introduction/rename-symbol-example.gif) 

Much better! Now our `first_name` variable is the only thing that will be changed, and this change will even happen across multiple files in our project if applicable (as with exported and imported values)!

### [Summary][31]

Phew! We have covered a lot in this post.

We cut through all of the academic distractions to decide on practical definitions for a lot of the terminology that surrounds any discussion on compilers and types.

We looked at compiled vs interpreted languages, run time vs compile time, dynamic vs static typing, and how Abstract Syntax Trees give us a more optimal way to build tooling for our programs.

Importantly, we provided a way of thinking about TypeScript as a tool for our _JavaScript_development, and how it in turn can be built upon to offer even more amazing utilities, such as renaming symbols as a way of refactoring code.

Come join us over on [UltimateAngular][32] to continue the journey and go from total beginner to TypeScript Pro!


--------------------------------------------------------------------------------

作者简介：

![](https://toddmotto.com/img/todd.jpg)

I'm Todd, I teach the world Angular through @UltimateAngular. Conference speaker and Developer Expert at Google.

--------------------------------------------------------------------------------

via: https://toddmotto.com/typescript-the-missing-introduction

作者：[Todd][a]
译者：[译者ID](https://github.com/译者ID)
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
