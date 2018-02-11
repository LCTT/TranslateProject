translating by Flowsnow

Python Global, Local and Nonlocal variables (With Examples)
======

### Global Variables

In Python, a variable declared outside of the function or in global scope is known as global variable. This means, global variable can be accessed inside or outside of the function.

Let's see an example on how a global variable is created in Python.

#### Example 1: Create a Global Variable
```
x = "global"

def foo():
 print("x inside :", x)

foo()
print("x outside:", x)

```

When we run the code, the will output be:
```
x inside : global
x outside: global

```

In above code, we created x as a global variable and defined a `foo()` to print the global variable x. Finally, we call the `foo()` which will print the value of x.

What if you want to change value of x inside a function?
```
x = "global"

def foo():
 x = x * 2
 print(x)
foo()

```

When we run the code, the will output be:
```
UnboundLocalError: local variable 'x' referenced before assignment

```

The output shows an error because Python treats x as a local variable and x is also not defined inside `foo()`.

To make this work we use `global` keyword, to learn more visit [Python Global Keyword][1].

### Local Variables

A variable declared inside the function's body or in the local scope is known as local variable.

#### Example 2: Accessing local variable outside the scope
```
def foo():
 y = "local"

foo()
print(y)

```

When we run the code, the will output be:
```
NameError: name 'y' is not defined

```

The output shows an error, because we are trying to access a local variable y in a global scope whereas the local variable only works inside `foo() `or local scope.

Let's see an example on how a local variable is created in Python.

#### Example 3: Create a Local Variable

Normally, we declare a variable inside the function to create a local variable.
```
def foo():
 y = "local"
 print(y)

foo()

```

When we run the code, it will output:
```
local

```

Let's take a look to the earlier problem where x was a global variable and we wanted to modify x inside `foo()`.

### Global and local variables

Here, we will show how to use global variables and local variables in the same code.

#### Example 4: Using Global and Local variables in same code
```
x = "global"

def foo():
 global x
 y = "local"
 x = x * 2
 print(x)
 print(y)

foo()

```

When we run the code, the will output be:
```
global global
local

```

In the above code, we declare x as a global and y as a local variable in the `foo()`. Then, we use multiplication operator `*` to modify the global variable x and we print both x and y.

After calling the `foo()`, the value of x becomes `global global` because we used the `x * 2` to print two times `global`. After that, we print the value of local variable y i.e `local`.

#### Example 5: Global variable and Local variable with same name
```
x = 5

def foo():
 x = 10
 print("local x:", x)

foo()
print("global x:", x)

```

When we run the code, the will output be:
```
local x: 10
global x: 5

```

In above code, we used same name x for both global variable and local variable. We get different result when we print same variable because the variable is declared in both scopes, i.e. the local scope inside `foo()` and global scope outside `foo()`.

When we print the variable inside the `foo()` it outputs `local x: 10`, this is called local scope of variable.

Similarly, when we print the variable outside the `foo()`, it outputs `global x: 5`, this is called global scope of variable.

### Nonlocal Variables

Nonlocal variable are used in nested function whose local scope is not defined. This means, the variable can be neither in the local nor the global scope.

Let's see an example on how a global variable is created in Python.

We use `nonlocal` keyword to create nonlocal variable.

#### Example 6: Create a nonlocal variable
```
def outer():
 x = "local"

 def inner():
   nonlocal x
   x = "nonlocal"
   print("inner:", x)

 inner()
 print("outer:", x)

outer()

```

When we run the code, the will output be:
```
inner: nonlocal
outer: nonlocal

```

In the above code there is a nested function `inner()`. We use `nonlocal` keyword to create nonlocal variable. The `inner()` function is defined in the scope of another function `outer()`.

Note : If we change value of nonlocal variable, the changes appears in the local variable.

--------------------------------------------------------------------------------

via: https://www.programiz.com/python-programming/global-local-nonlocal-variables

作者：[programiz][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.programiz.com/
[1]:https://www.programiz.com/python-programming/global-keyword
