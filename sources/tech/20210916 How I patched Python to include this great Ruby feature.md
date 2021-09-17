[#]: subject: "How I patched Python to include this great Ruby feature"
[#]: via: "https://opensource.com/article/21/9/python-else-less"
[#]: author: "Miguel Brito https://opensource.com/users/miguendes"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I patched Python to include this great Ruby feature
======
What I learned from adding "else-less" functionality to Python, as
inspired by Ruby.
![Python programming language logo with question marks][1]

Ruby, [unlike Python][2], makes lots of things implicit, and there's a special kind of _if_ expression that demonstrates this well. It's often referred to as an "inline-if" or "conditional modifier", and this special syntax is able to return one value when a condition is true, but another value (`nil`, specifically) when a condition is false. Here's an example:


```
$ irb
irb(main):&gt; RUBY_VERSION
=&gt; "2.7.1"
irb(main):&gt; a = 42 if true
=&gt; 42
irb(main):&gt; b = 21 if false
=&gt; nil
irb(main):&gt; b
=&gt; nil
irb(main):&gt; a
=&gt; 42
```

In Python, you can't do that without explicitly adding an `else` clause to the expression. In fact, as of [this PR][3], the interpreter tells you immediately that `else` is mandatory:


```
$ python
Python 3.11.0a0
&gt;&gt;&gt; a = 42 if True
  File "&lt;stdin&gt;", line 1
    ;a = 42 if True
    ^^^^^^^^^^
SyntaxError: expected 'else' after 'if' expression
```

However, I find Ruby's `if` actually very convenient.

![return if python][4]

Python accepts else-less if statements, similar to Ruby.

This convenience became more evident when I had to go back to Python and write things like this:


```
`>>> my_var = 42 if some_cond else None`
```

So I thought to myself, what would it be like if Python had a similar feature? Could I do it myself? How hard would that be?

### Looking into Python's source code

Digging into CPython's code and changing the language's syntax sounded not trivial to me. Luckily, during the same week, I found out on Twitter that [Anthony Shaw][5] had just written a [book on CPython Internals][6] and it was available for pre-release. I didn't think twice and bought the book. I've got to be honest, I'm the kind of person who buys things and doesn't use them immediately. As I had other plans in mind, I let it "gather dust" in my home folder until I had to work with that Ruby service again. It reminded me of the CPython Internals book and how challenging hacking the guts of Python would be.

The first thing was to go through the book from the very start and try to follow each step. The book focuses on Python 3.9, so in order to follow it, one needs to check out the 3.9 tag, and that's what I did. I learned about how the code is structured and then how to compile it. The next chapters show how to extend the grammar and add new things, such as a new operator.

As I got familiar with the code base and how to tweak the grammar, I decided to give it a spin and make my own changes to it.

### The first (failed) attempt

As I started finding my way around CPython's code from the latest main branch, I noticed that lots of things had changed since Python 3.9, yet some fundamental concepts didn't.

My first attempt was to dig into the grammar definition and find the if expression rule. The file is currently named `Grammar/python.gram`. Locating it was not difficult. An ordinary **CTRL+F** for the `else` keyword was enough.


```
file: Grammar/python.gram
...
expression[expr_ty] (memo):
   | invalid_expression
   | a=disjunction 'if' b=disjunction 'else' c=expression { _PyAST_IfExp(b, a, c, EXTRA) }
   | disjunction
   | lambdef
....
```

Now with the rule in hand, my idea was to add one more option to the current `if` expression where it would match `a=disjunction 'if' b=disjunction` and the `c` expression would be `NULL`.

This new rule should be placed immediately after the complete one, otherwise, the parser would match `a=disjunction 'if' b=disjunction` always, returning a `SyntaxError`.


```
...
expression[expr_ty] (memo):
   | invalid_expression
   | a=disjunction 'if' b=disjunction 'else' c=expression { _PyAST_IfExp(b, a, c, EXTRA) }
   | a=disjunction 'if' b=disjunction { _PyAST_IfExp(b, a, NULL, EXTRA) }
   | disjunction
   | lambdef
....
```

### Regenerating the parser and compiling Python from source

CPython comes with a `Makefile` containing lots of useful commands. One of them is the [`regen-pegen` command][7] which converts `Grammar/python.gram` into `Parser/parser.c`.

Besides changing the grammar, I had to modify the AST for the _if_ expression. AST stands for Abstract Syntax Tree, and it is a way of representing the syntactic structure of the grammar as a tree. For more information about ASTs, I highly recommend the [Crafting Interpreters book][8] by [Robert Nystrom][9].

Moving on, if you observe the rule for the _if_ expression, it goes like this:


```
`   | a=disjunction 'if' b=disjunction 'else' c=expression { _PyAST_IfExp(b, a, c, EXTRA) }`
```

The means when the parser finds this rule, it calls the `_PyAST_IfExp`, which gives back a `expr_ty` data structure. So this gave me a clue that to implement the new rule's behavior, I'd need to change `_PyAST_IfExp`.

To find where it is located, I used my `rip-grep` skills and searched for it inside the source root:


```
$ rg _PyAST_IfExp -C2 .

[OMITTED]
Python/Python-ast.c
2686-
2687-expr_ty
2688:_PyAST_IfExp(expr_ty test, expr_ty body, expr_ty orelse, int lineno, int
2689- col_offset, int end_lineno, int end_col_offset, PyArena *arena)
2690-{
[OMITTED]
```

The implementation goes like this:


```
expr_ty
_PyAST_IfExp(expr_ty test, expr_ty body, expr_ty orelse, int lineno, int
             col_offset, int end_lineno, int end_col_offset, PyArena *arena)
{
   expr_ty p;
   if (!test) {
        PyErr_SetString(PyExc_ValueError,
                        "field 'test' is required for IfExp");
       return NULL;
   }
   if (!body) {
        PyErr_SetString(PyExc_ValueError,
                        "field 'body' is required for IfExp");
        return NULL;
   }
   if (!orelse) {
        PyErr_SetString(PyExc_ValueError,
                        "field 'orelse' is required for IfExp");
        return NULL;
   }
   p = (expr_ty)_PyArena_Malloc(arena, sizeof(*p));
   if (!p)
        return NULL;
   p-&gt;kind = IfExp_kind;
   p-&gt;v.IfExp.test = test;
   p-&gt;v.IfExp.body = body;
   p-&gt;v.IfExp.orelse = orelse;
   p-&gt;lineno = lineno;
   p-&gt;col_offset = col_offset;
   p-&gt;end_lineno = end_lineno;
   p-&gt;end_col_offset = end_col_offset;
   return p;
}
```

Since I passed **orelse**NULL, I thought it was just a matter of changing the body of `if (!orelse)`None to `orelse`. It would look like this:


```
   if (!orelse) {
\- PyErr_SetString(PyExc_ValueError,
\- "field 'orelse' is required for IfExp");
\- return NULL;
\+ orelse = Py_None;
   }
```

Now it was time to test it. I compiled the code with `make -j8 -s` and fired up the interpreter:


```
$ make -j8 -s

Python/Python-ast.c: In function ‘_PyAST_IfExp’:
Python/Python-ast.c:2703:16: warning: assignment from incompatible pointer type [-Wincompatible-pointer-types]
         orelse = Py_None;
```

Despite the glaring obvious warnings, I decided to ignore it just to see what would happen.


```
$ ./python
Python 3.11.0a0 (heads/ruby-if-new-dirty:f92b9133ef, Aug 2 2021, 09:13:02) [GCC 7.5.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
&gt;&gt;&gt; a = 42 if True
&gt;&gt;&gt; a
42
&gt;&gt;&gt; b = 21 if False
[1] 16805 segmentation fault (core dumped) ./python
```

Ouch! It worked for the `if True` case, but assigning `Py_None` to `expr_ty orelse` caused a `segfault`.

Time to go back to see what went wrong.

### The second attempt

It wasn't too difficult to figure out where I messed up. `orelse` is an `expr_ty`, and I assigned to it a `Py_None` which is a `PyObject *`. Again, thanks to `rip-grep`, I found its definition:


```
$ rg constant -tc -C2

Include/internal/pycore_asdl.h
14-typedef PyObject * string;
15-typedef PyObject * object;
16:typedef PyObject * constant;
```

Now, how did I find out `Py_None` was a constant?

While reviewing the `Grammar/python.gram` file, I found that one of the rules for the new pattern matching syntax is defined like this:


```
# Literal patterns are used for equality and identity constraints
literal_pattern[pattern_ty]:
   | value=signed_number !('+' | '-') { _PyAST_MatchValue(value, EXTRA) }
   | value=complex_number { _PyAST_MatchValue(value, EXTRA) }
   | value=strings { _PyAST_MatchValue(value, EXTRA) }
   | 'None' { _PyAST_MatchSingleton(Py_None, EXTRA) }
```

However, this rule is a `pattern_ty`, not an `expr_ty`. But that's fine. What really matters is to understand what `_PyAST_MatchSingleton` actually is. Then, I searched for it in `Python/Python-ast.c:`


```
file: Python/Python-ast.c
...
pattern_ty
_PyAST_MatchSingleton(constant value, int lineno, int col_offset, int
                        end_lineno, int end_col_offset, PyArena *arena)
...
```

I looked for the definition of a `None` node in the grammar. To my great relief, I found it!


```
atom[expr_ty]:
   | NAME
   | 'True' { _PyAST_Constant(Py_True, NULL, EXTRA) }
   | 'False' { _PyAST_Constant(Py_False, NULL, EXTRA) }
   | 'None' { _PyAST_Constant(Py_None, NULL, EXTRA) }
....
```

At this point, I had all the information I needed. To return an `expr_ty` representing `None`, I needed to create a node in the AST which is constant by using the `_PyAST_Constant` function.


```
   | a=disjunction 'if' b=disjunction 'else' c=expression { _PyAST_IfExp(b, a, c, EXTRA) }
\- | a=disjunction 'if' b=disjunction { _PyAST_IfExp(b, a, NULL, EXTRA) }
\+ | a=disjunction 'if' b=disjunction { _PyAST_IfExp(b, a, _PyAST_Constant(Py_None, NULL, EXTRA), EXTRA) }
   | disjunction
```

Next, I must revert `Python/Python-ast.c` as well. Since I'm feeding it a valid `expr_ty`, it will never be `NULL`.


```
file: Python/Python-ast.c
...
   if (!orelse) {
\- orelse = Py_None;
\+ PyErr_SetString(PyExc_ValueError,
\+ "field 'orelse' is required for IfExp");
\+ return NULL;
   }
...
```

I compiled it again:


```
$ make -j8 -s &amp;&amp; ./python
Python 3.11.0a0 (heads/ruby-if-new-dirty:25c439ebef, Aug 2 2021, 09:25:18) [GCC 7.5.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
&gt;&gt;&gt; c = 42 if True
&gt;&gt;&gt; c
42
&gt;&gt;&gt; b = 21 if False
&gt;&gt;&gt; type(b)
&lt;class 'NoneType'&gt;
&gt;&gt;&gt;
```

It works!

Now, I needed to do one more test. Ruby functions allow returning a value if a condition matches, and if not, the rest of the function body gets executed. Like this:


```
&gt; irb
irb(main):&gt; def f(test)
irb(main):&gt;   return 42 if test
irb(main):&gt;   puts 'missed return'
irb(main):&gt;   return 21
irb(main):&gt; end
=&gt; :f
irb(main):&gt; f(false)
missed return
=&gt; 21
irb(main):&gt; f(true)
=&gt; 42
```

At this point, I wondered if that would work with my modified Python. I rushed to the interpreter again and wrote the same function:


```
&gt;&gt;&gt; def f(test):
... return 42 if test
... print('missed return')
... return 21
...
&gt;&gt;&gt; f(False)
&gt;&gt;&gt; f(True)
42
&gt;&gt;&gt;
```

The function returns `None` if _test_ is `False`... To help me debug this, I summoned the [ast module][10]. The official docs define it like so:

> The ast module helps Python applications to process trees of the Python abstract syntax grammar. The abstract syntax itself might change with each Python release; this module helps to find out programmatically what the current grammar looks like.

I printed the AST for this function:


```
&gt;&gt;&gt; fc = '''
... def f(test):
... return 42 if test
... print('missed return')
... return 21
... '''
&gt;&gt;&gt; print(ast.dump(ast.parse(fc), indent=4))
Module(
   body=[
        FunctionDef(
            name='f',
            args=arguments(
                posonlyargs=[],
                args=[
                  arg(arg='test')],
                kwonlyargs=[],
                kw_defaults=[],
                defaults=[]),
            body=[
                Return(
                  value=IfExp(
                  test=Name(id='test', ctx=Load()),
                  ;body=Constant(value=42),
                  orelse=Constant(value=None))),
                Expr(
                  value=Call(
                    func=Name(id='print', ctx=Load()),
                      args=[
                        Constant(value='missed return')],
                      keywords=[])),
                  Return(
                      value=Constant(value=21))],
            decorator_list=[])],
   type_ignores=[])
```

Now things made more sense. My change to the grammar was just "syntax sugar". It turns an expression like this: `a if b` into this: `a if b else None`. The problem here is that Python returns no matter what, so the rest of the function is ignored.

You can look at the [bytecode][11] generated to understand what exactly is executed by the interpreter. And for that, you can use the [`dis` module][12]. According to the docs:

> The dis module supports the analysis of CPython bytecode by disassembling it.


```
&gt;&gt;&gt; import dis
&gt;&gt;&gt; dis.dis(f)
  2 0 LOAD_FAST 0 (test)
              2 POP_JUMP_IF_FALSE 4 (to 8)
              4 LOAD_CONST 1 (42)
              6 RETURN_VALUE
        &gt;&gt; 8 LOAD_CONST 0 (None)
            10 RETURN_VALUE
```

What this basically means is that in case the _test_ is false, the execution jumps to 8, which loads the `None` into the top of the stack and returns it.

### Supporting "return-if"

To support the same Ruby feature, I need to turn the expression `return 42 if test` into a regular `if` statement that returns if `test` is true.

To do that, I needed to add one more rule. This time, it would be a rule that matches the `return <value> if <test>` piece of code. Not only that, I needed a `_PyAST_` function that creates the node for me. I'll then call it `_PyAST_ReturnIfExpr:`


```
file: Grammar/python.gram

return_stmt[stmt_ty]:
\+ | 'return' a=star_expressions 'if' b=disjunction { _PyAST_ReturnIfExpr(a, b, EXTRA) }
   | 'return' a=[star_expressions] { _PyAST_Return(a, EXTRA) }
```

As mentioned previously, the implementation for all these functions resides in `Python/Python-ast.c`, and their definition is in `Include/internal/pycore_ast.h`, so I put `_PyAST_ReturnIfExpr` there:


```
file: Include/internal/pycore_ast.h

 stmt_ty _PyAST_Return(expr_ty value, int lineno, int col_offset, int
                      end_lineno, int end_col_offset, PyArena *arena);
+stmt_ty _PyAST_ReturnIfExpr(expr_ty value, expr_ty test, int lineno, int col_of
fset, int
\+ end_lineno, int end_col_offset, PyArena *arena);
 stmt_ty _PyAST_Delete(asdl_expr_seq * targets, int lineno, int col_offset, int
                      end_lineno, int end_col_offset, PyArena *arena);

[/code] [code]

file: Python/Python-ast.c

+stmt_ty
+_PyAST_ReturnIfExpr(expr_ty value, expr_ty test, int lineno, int col_offset, int end_lineno, int
\+ end_col_offset, PyArena *arena)
+{
\+ stmt_ty ret, p;
\+ ret = _PyAST_Return(value, lineno, col_offset, end_lineno, end_col_offset, arena);
+
\+ asdl_stmt_seq *body;
\+ body = _Py_asdl_stmt_seq_new(1, arena);
\+ asdl_seq_SET(body, 0, ret);
+
\+ p = _PyAST_If(test, body, NULL, lineno, col_offset, end_lineno, end_col_offset, arena);
+
\+ return p;
+}
+
 stmt_ty
```

I examined the implementation of `_PyAST_ReturnIfExpr`. I wanted to turn `return <value> if <test>` into `if <test>: return <value>`.

Both `return` and the regular `if` are statements, so in CPython, they're represented as `stmt_ty`. The `_PyAST_If` expectes a `expr_ty test` and a body, which is a sequence of statements. In this case, the `body` is `asdl_stmt_seq *body`.

As a result, what I really wanted here was an `if` statement with a body where the only statement is a `return <value>` one.

CPython disposes of some convenient functions to build `asdl_stmt_seq *`, and one of them is `_Py_asdl_stmt_seq_new`. So I used it to create the body and added the return statement I created a few lines before with `_PyAST_Return`.

Once that was done, the last step was to pass the `test` as well as the `body` to `_PyAST_If`.

And before I forget, you may be wondering what on earth is the `PyArena *arena`. **Arena** is a CPython abstraction used for memory allocation. It allows efficient memory usage by using memory mapping [mmap()][13] and placing it in contiguous [chunks of memory][6].

Time to regenerate the parser and test it one more time:


```
&gt;&gt;&gt; def f(test):
... return 42 if test
... print('missed return')
... return 21
...
&gt;&gt;&gt; import dis
&gt;&gt;&gt; f(False)
&gt;&gt;&gt; f(True)
42
```

It doesn't work. Check the bytecodes:


```
&gt;&gt;&gt; dis.dis(f)
  2 0 LOAD_FAST 0 (test)
            2 POP_JUMP_IF_FALSE 4 (to 8)
            4 LOAD_CONST 1 (42)
            6 RETURN_VALUE
        &gt;&gt; 8 LOAD_CONST 0 (None)
        10 RETURN_VALUE
&gt;&gt;&gt;
```

It's the same bytecode instructions again!

### Going back to the compilers class

At that point, I was clueless. I had no idea what was going on until I decided to go down the rabbit hole of expanding the grammar rules.

The new rule I added went like this: `'return' a=star_expressions 'if' b=disjunction { _PyAST_ReturnIfExpr(a, b, EXTRA) }`.

My only hypothesis was that `a=star_expressions 'if' b=disjunction` was being resolved to the else-less rule I added in the beginning.

By going over the grammar one more time, I figured that my theory held. `star_expressions` would match `a=disjunction 'if' b=disjunction { _PyAST_IfExp(b, a, NULL, EXTRA) }`.

The only way to fix this was by getting rid of the `star_expressions`. So I changed the rule to:


```
 return_stmt[stmt_ty]:
\- | 'return' a=star_expressions 'if' b=disjunction { _PyAST_ReturnIfExpr(a, b, EXTRA) }
\+ | 'return' a=disjunction guard=guard !'else' { _PyAST_ReturnIfExpr(a, guard, EXTRA) }
  | 'return' a=[star_expressions] { _PyAST_Return(a, EXTRA) }
```

You might be wondering, what are `guard,` `!else`, and `star_expressions`?

This `guard` is a rule that is part of the pattern matching rules. The new pattern matching feature added in Python 3.10 allows things like this:


```
match point:
   case Point(x, y) if x == y:
        print(f"Y=X at {x}")
        case Point(x, y):
        print(f"Not on the diagonal")
```

And the rule goes by this:


```
`guard[expr_ty]: 'if' guard=named_expression { guard }`
```

With that, I added one more check. To avoid it failing with `SyntaxError`, I needed to make sure the rule matched only code like this: `return value if cond`. Thus, to prevent code such as `return an if cond else b` being matched prematurely, I added a `!' else` to the rule.

Last but not least, the `star_expressions` allow me to return destructured iterables. For example:


```
&gt;&gt;&gt; def f():
  ...: a = [1, 2]
  ...: return 0, *a
  ...:&amp;

&gt;&gt;&gt; f()
(0, 1, 2)
```

In this case, `0, * a` is a tuple, which falls under the category of `star_expressions`. The regular if-expression doesn't allow using `star_expressions` with it, AFAIK, so changing the new `return` rule won't be an issue.

### Does it work yet?

After fixing the return rule, I regenerated the grammar one more time and compiled it:


```
&gt;&gt;&gt; def f(test):
... return 42 if test
... print('missed return')
... return 21
...
&gt;&gt;&gt; f(False)
missed return
21
&gt;&gt;&gt; f(True)
42
```

It works!

Looking at the bytecode:


```
&gt;&gt;&gt; import dis
&gt;&gt;&gt; dis.dis(f)
  2 0 LOAD_FAST 0 (test)
            2 POP_JUMP_IF_FALSE 4 (to 8)
            4 LOAD_CONST 1 (42)
            6 RETURN_VALUE

  3 &gt;&gt; 8 LOAD_GLOBAL 0 (print)
            10 LOAD_CONST 2 ('missed return')
            12 CALL_FUNCTION 1
            14 POP_TOP

  4 16 LOAD_CONST 3 (21)
            18 RETURN_VALUE
&gt;&gt;&gt;
```

That's precisely what I wanted. Is the AST is the same as the one with regular `if`?


```
&gt;&gt;&gt; import ast
&gt;&gt;&gt; print(ast.dump(ast.parse(fc), indent=4))
Module(
   body=[
        FunctionDef(
            name='f',
            args=arguments(
                posonlyargs=[],
                args=[
                  arg(arg='test')],
                kwonlyargs=[],
                kw_defaults=[],
                defaults=[]),
            body=[
                If(
                    test=Name(id='test', ctx=Load()),
                    body=[
                      Return(
                      value=Constant(value=42))],
                      orelse=[]),
                Expr(
                  value=Call(
                          func=Name(id='print', ctx=Load()),
                          args=[
                            Constant(value='missed return')],
                          keywords=[])),
                Return(
                  value=Constant(value=21))],
            decorator_list=[])],
   type_ignores=[])
&gt;&gt;&gt;
```

Indeed it is!


```
If(
   test=Name(id='test', ctx=Load()),
   body=[
        Return(
            value=Constant(value=42))],
   orelse=[]),
```

This node is the same as the one that would be generated by:


```
`if test: return 42`
```

### If it's not tested, it's broken?

To conclude this journey, I thought it'd be a good idea to add some unit tests as well. Before writing anything new, I wanted to get an idea of what I had broken.

With the code tested manually, I ran all tests using the `test` module `python -m test -j8`. The `-j8` means it uses eight processes to run the tests in parallel:


```
`$ ./python -m test -j8`
```

To my surprise, only one test failed!


```
== Tests result: FAILURE ==
406 tests OK.
1 test failed:
   test_grammar
```

Because I ran all tests, it's hard to navigate the output, so I can run only this one again in isolation:


```
======================================================================
FAIL: test_listcomps (test.test_grammar.GrammarTests)
\----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/miguel/projects/cpython/Lib/test/test_grammar.py", line 1732, in test_listcomps
   check_syntax_error(self, "[x if y]")
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/miguel/projects/cpython/Lib/test/support/__init__.py", line 497, in check_syntax_error
   with testcase.assertRaisesRegex(SyntaxError, errtext) as cm:
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: SyntaxError not raised
\----------------------------------------------------------------------

Ran 76 tests in 0.038s

FAILED (failures=1)
test test_grammar failed
test_grammar failed (1 failure)

== Tests result: FAILURE ==

1 test failed:
   test_grammar

1 re-run test:
   test_grammar

Total duration: 82 ms
Tests result: FAILURE
```

And there it is! It expected a syntax error when running a `[x if y]` expression. I can safely remove it and re-run the tests again:


```
== Tests result: SUCCESS ==

1 test OK.

Total duration: 112 ms
Tests result: SUCCESS
```

Now that everything is OK, it's time to add a few more tests. It's important to test not only the new "else-less if" but also the new `return` statement.

By navigating through the `test_grammar.py` file, I can find a test for pretty much every grammar rule. The first one I look for is `test_if_else_expr`. This test doesn't fail, so it only tests for the happy case. To make it more robust, I needed to add two new tests to check `if True` and `if False` cases:


```
     self.assertEqual((6 &lt; 4 if 0), None)
        self.assertEqual((6 &lt; 4 if 1), False)
```

I ran everything again, and all tests passed this time.

Note: `bool` in Python is a [subclass of integer][14], so you can use `1` to denote `True` and `0` for `False`.


```
Ran 76 tests in 0.087s

OK

== Tests result: SUCCESS ==

1 test OK.

Total duration: 174 ms
Tests result: SUCCESS
```

Lastly, I needed the tests for the `return` rule. They're defined in the `test_return` test. Just like the `if` expression one, this test passed with no modification.

To test this new use case, I created a function that receives a `bool` argument and returns if the argument is true. When it's false, it skips the return, just like the manual tests I had been doing up to this point:


```
        def g4(test):
             a = 1
             return a if test
             a += 1
             return a

        self.assertEqual(g4(False), 2)
        self.assertEqual(g4(True), 1)
```

I saved the file and re-ran `test_grammar` one more time:


```
\----------------------------------------------------------------------

Ran 76 tests in 0.087s

OK

== Tests result: SUCCESS ==

1 test OK.

Total duration: 174 ms
Tests result: SUCCESS
```

Looks good! The `test_grammar` test passed. Just in case, I re-ran the full test suite:


```
`$ ./python -m test -j8`
```

After a while, all tests passed, and I'm very happy with the result.

### Limitations

If you know Ruby well, by this point, you've probably noticed that what I did here was not 100% the same as a conditional modifier. For example, in Ruby, you can run actual expressions in these modifiers:


```
irb(main):002:0&gt; a = 42
irb(main):003:0&gt; a += 1 if false
=&gt; nil
irb(main):004:0&gt; a
=&gt; 42
irb(main):005:0&gt; a += 1 if true
=&gt; 43
```

I cannot do the same with my implementation:


```
&gt;&gt;&gt; a = 42
&gt;&gt;&gt; a += 1 if False
Traceback (most recent call last):
  File "&lt;stdin&gt;", line 1, in &lt;module&gt;
TypeError: unsupported operand type(s) for +=: 'int' and 'NoneType'
&gt;&gt;&gt; a += 1 if True
&gt;&gt;&gt; a
43
```

What this reveals is that the `return` rule I created is just a workaround. If I want to make it as close as possible to Ruby's conditional modifier, I'll need to make it work with other statements as well, not just `return`.

Nevertheless, this is fine. My goal with this experiment was just to learn more about Python internals and see how I would navigate a little-known code base written in C and make the appropriate changes to it. And I have to admit that I'm pretty happy with the results!

### Conclusion

Adding a new syntax inspired by Ruby is a really nice exercise to learn more about the internals of Python. Of course, if I had to convert this as a PR, the core developers would probably find a few shortcomings, as I have already described in the previous section. However, since I did this just for fun, I'm very happy with the results.

The source code with all my changes is on my CPython fork under the [branch ruby-if-new][15].

* * *

_This article was originally published on the [author's personal blog][16] and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/python-else-less

作者：[Miguel Brito][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/miguendes
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
[2]: https://www.python.org/dev/peps/pep-0020/#id2
[3]: https://github.com/python/cpython/pull/27506
[4]: https://opensource.com/sites/default/files/ihe46r0jv.gif
[5]: https://tonybaloney.github.io/
[6]: https://realpython.com/products/cpython-internals-book/
[7]: https://github.com/python/cpython/blob/3.10/Makefile.pre.in#L850_L856
[8]: https://craftinginterpreters.com/
[9]: https://journal.stuffwithstuff.com/
[10]: https://docs.python.org/3/library/ast.html
[11]: https://en.wikipedia.org/wiki/Bytecode
[12]: https://docs.python.org/3/library/dis.html
[13]: http://man7.org/linux/man-pages/man2/mmap.2.html
[14]: https://docs.python.org/3/c-api/bool.html
[15]: https://github.com/miguendes/cpython/tree/ruby-if-new
[16]: https://miguendes.me/what-if-python-had-this-ruby-feature
