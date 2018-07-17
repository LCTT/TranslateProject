MjSeven is translating

Understanding Python Dataclasses — Part 1
============================================================

![](https://cdn-images-1.medium.com/max/900/1*7pr8EL8EDsP296pxL7Wz_g.png)

If you’re reading this, then you are already aware of Python 3.7 and the new features that come packed with it. Personally, I am most excited about `Dataclasses`. I have been waiting for them to arrive for a while.

This is a two part post:
1\. Dataclass features overview in this post
2\. Dataclass `fields` overview in the [next post][1]

### Introduction

`Dataclasses` are python classes but are suited for storing data objects. What are data objects, you ask? Here is a non-exhaustive list of features that define data objects:

*   They store data and represent a certain data type. Ex: A number. For people familiar with ORMs, a model instance is a data object. It represents a specific kind of entity. It holds attributes that define or represent the entity.

*   They can be compared to other objects of the same type. Ex: A number can be `greater than`, `less than`, or `equal to` another number

There are certainly more features, but this list is sufficient to help you understand the crux.

To understand `Dataclasses`, we shall be implementing a simple class that holds a number, and allows us to perform the above mentioned operations.
First, we shall be using normal classes, and then we shall use `Dataclasses` to achieve the same result.

But before we begin, a word on the usage of `Dataclasses`

Python 3.7 provides a decorator [dataclass][2] that is used to convert a class into a dataclass.

All you have to do is wrap the class in the decorator:

```
from dataclasses import dataclass
```

```
@dataclass
class A:
 …
```

Now, lets dive into the usage of how and what `dataclass` changes for us.

### Initialization

Usual

```
class Number:
```

```
  __init__(self, val):
 self.val = val

>>> one = Number(1)
>>> one.val
>>> 1
```

With `dataclass`

```
@dataclass
class Number:
 val:int 

>>> one = Number(1)
>>> one.val
>>> 1
```

Here’s what’s changed with the dataclass decorator:

1\. No need of defining `__init__`and then assigning values to `self`, `d` takes care of it
2\. We defined the member attributes in advance in a much more readable fashion, along with [type hinting][3]. We now know instantly that `val` is of type `int`. This is definitely more readable than the usual way of defining class members.

> Zen of Python: Readability counts

It is also possible to define default values:

```
@dataclass
class Number:
    val:int = 0
```

### Representation

Object representation is a meaningful string representation of the object that is very useful in debugging.

Default python objects representation is not very meaningful:

```
class Number:
    def __init__(self, val = 0):
    self.val = val

>>> a = Number(1)
>>> a
>>> <__main__.Number object at 0x7ff395b2ccc0>
```

This gives us no insight as to the utility of the object, and will result in horrible a debugging experience.

A meaningful representation could be implemented by defining a `__repr__`method in the class definition.

```
def __repr__(self):
    return self.val
```

Now we get a meaningful representation of the object:

```
>>> a = Number(1)
>>> a
>>> 1
```

`dataclass` automatically add a `__repr__ `function, so that we don’t have to manually implement it.

```
@dataclass
class Number:
    val: int = 0
```

```
>>> a = Number(1)
>>> a
>>> Number(val = 1)
```

### Data Comparison

Generally, data objects come with a need to be compared with each other.

Comparison between two objects `a` and `b` generally consists of the following operations:

*   a < b

*   a > b

*   a == b

*   a >= b

*   a <= b

In python, it is possible to define [methods][4] in classes that can do the above operations. For the sake of simplicity and to not let this post run amuck, I shall be only demonstrating implementation of `==` and `<`.

Usual

```
class Number:
    def __init__( self, val = 0):
       self.val = val

    def __eq__(self, other):
        return self.val == other.val

    def __lt__(self, other):
        return self.val < other.val
```

With `dataclass`

```
@dataclass(order = True)
class Number:
    val: int = 0
```

Yup, that’s it.

We dont need to define the `__eq__`and `__lt__` methods, because `dataclass`decorator automatically adds them to the class definition for us when called with `order = True`

Well, how does it do that?

When you use `dataclass,` it adds a functions `__eq__` and `__lt__` to the class definition. We already know that. So, how do these functions know how to check equality and do comparison?

A dataclass generated `__eq__` function will compare a tuple of its attributes with a tuple of attributes of the other instance of the same class. In our case here’s what the `automatically` generated `__eq__` function would be equivalent to:

```
def __eq__(self, other):
    return (self.val,) == (other.val,)
```

Let’s look at a more elaborate example:

We shall write a dataclass `Person `to hold their `name` and `age`.

```
@dataclass(order = True)
class Person:
    name: str
    age:int = 0
```

The automatically generated `__eq__` method will be equivalent of:

```
def __eq__(self, other):
    return (self.name, self.age) == ( other.name, other.age)
```

Pay attention to the order of the attributes. They will always be generated in the order you defined them in the dataclass definition.

Similarly, the equivalent `__le__` function would be akin to:

```
def __le__(self, other):
    return (self.name, self.age) <= (other.name, other.age)
```

A need for defining a function like `__le__` generally arises, when you have to sort a list of your data objects. Python’s built-in [sorted][5] function relies on comparing two objects.

```

>>> import random
```

```
>>> a = [Number(random.randint(1,10)) for _ in range(10)] #generate list of random numbers
```

```
>>> a
```

```
>>> [Number(val=2), Number(val=7), Number(val=6), Number(val=5), Number(val=10), Number(val=9), Number(val=1), Number(val=10), Number(val=1), Number(val=7)]
```

```
>>> sorted_a = sorted(a) #Sort Numbers in ascending order
```

```
>>> [Number(val=1), Number(val=1), Number(val=2), Number(val=5), Number(val=6), Number(val=7), Number(val=7), Number(val=9), Number(val=10), Number(val=10)]
```

```
>>> reverse_sorted_a = sorted(a, reverse = True) #Sort Numbers in descending order 
```

```
>>> reverse_sorted_a
```

```
>>> [Number(val=10), Number(val=10), Number(val=9), Number(val=7), Number(val=7), Number(val=6), Number(val=5), Number(val=2), Number(val=1), Number(val=1)]

```

### `dataclass` as a callable decorator

It is not always desirable to have all the `dunder` methods defined. Your use case might only consist of storing the values and checking equality. Thus, you only need the `__init__` and `__eq__` methods defined. If we could tell the decorator to not generate the other methods, it would reduce some overhead and we shall have correct operations available on the data object.

Fortunately, this can be achieved by using `dataclass` decorator as a callable.

From the official [docs][6], the decorator can be used as a callable with the following arguments:

```
@dataclass(init=True, repr=True, eq=True, order=False, unsafe_hash=False, frozen=False)
class C:
 …
```

1.  `init` : By default an `__init__` method will be generated. If passed as `False`, the class will not have an `__init__` method.

2.  `repr` : `__repr__` method is generated by default. If passed as `False`, the class will not have an `__repr__` method.

3.  `eq`: By default the `__eq__` method will be generated. If passed as `False`, the `__eq__` method will not be added by `dataclass`, but will default to the `object.__eq__`.

4.  `order` : By default `__gt__` , `__ge__`, `__lt__`, `__le__` methods will be generated. If passed as `False`, they are omitted.

We shall discuss `frozen` in a while. The `unsafe_hash` argument deserves a separate post because of its complicated use cases.

Now, back to our use case, here’s what we need:

1. `__init__`
2. `__eq__`

These functions are generated by default, so what we need is to not have the other functions generated. How do we do that? Simply pass the relevant arguments as false to the generator.

```
@dataclass(repr = False) # order, unsafe_hash and frozen are False
class Number:
    val: int = 0
```

```
>>> a = Number(1)
```

```
>>> a
```

```
>>> <__main__.Number object at 0x7ff395afe898>
```

```
>>> b = Number(2)
```

```
>>> c = Number(1)
```

```
>>> a == b
```

```
>>> False
```

```
>>> a < b
```

```
>>> Traceback (most recent call last):
 File “<stdin>”, line 1, in <module>
TypeError: ‘<’ not supported between instances of ‘Number’ and ‘Number’
```

### Frozen Instances

Frozen Instances are objects whose attributes cannot be modified after the object has been initialized.

> It is not possible to create truly immutable Python objects

To create immutable attributes on an object in Python is an arduous task, and something that I won’t dive into in this post.

Here’s what we expect from an immutable object:

```
>>> a = Number(10) #Assuming Number class is immutable
```

```
>>> a.val = 10 # Raises Error
```

With Dataclasses it is possible to define a frozen object by using `dataclass`decorator as a callable with argument `frozen=True` .

When a frozen dataclass object is instantiated, any attempt to modify the attributes of the object raises `FrozenInstanceError`.

```
@dataclass(frozen = True)
class Number:
    val: int = 0
```

```
>>> a = Number(1)
```

```
>>> a.val
```

```
>>> 1
```

```
>>> a.val = 2
```

```
>>> Traceback (most recent call last):
 File “<stdin>”, line 1, in <module>
 File “<string>”, line 3, in __setattr__
dataclasses.FrozenInstanceError: cannot assign to field ‘val’
```

So a frozen instance is a great way of storing

*   constants

*   settings

These generally do not change over the lifetime of the application and any attempt to modify them should generally be warded off.

### Post init processing

With Dataclasses the requirement of defining an `__init__` method to assign variables to `self` has been taken care of. But now we lose the flexibility of making function-calls/processing that might be required immediately after the variables have been assigned.

Let us discuss a use case where we define a class `Float` to contain float numbers, and we calculate the integer and decimal parts immediately after initialization.

Usual

```
import math
```

```
class Float:
    def __init__(self, val = 0):
        self.val = val
        self.process()

    def process(self):
        self.decimal, self.integer = math.modf(self.val)

>>> a = Float( 2.2)
```

```
>>> a.decimal
```

```
>>> 0.2000
```

```
>>> a.integer
```

```
>>> 2.0
```

Fortunately, post initialization processing is already taken care of with [__post_init__][9] method.

The generated `__init__` method calls the `__post_init__` method before returning. So, any processing can be made in this functions.

```
import math
```

```
@dataclass
class FloatNumber:
    val: float = 0.0

    def __post_init__(self):
        self.decimal, self.integer = math.modf(self.val)

>>> a = Number(2.2)
```

```
>>> a.val
```

```
>>> 2.2
```

```
>>> a.integer
```

```
>>> 2.0
```

```
>>> a.decimal
```

```
>>> 0.2
```

Neat!


### Inheritance

`Dataclasses` support inheritance like normal python classes.

So, the attributes defined in the parent class will be available in the child class.

```
@dataclass
class Person:
    age: int = 0
    name: str
```

```
@dataclass
class Student(Person):
    grade: int
```

```
>>> s = Student(20, "John Doe", 12)
```

```
>>> s.age
```

```
>>> 20
```

```
>>> s.name
```

```
>>> "John Doe"
```

```
>>> s.grade
```

```
>>> 12
```

Pay attention to the fact that the arguments to `Student` are in the order of fields defined in the class definition.

What about the behavior of `__post_init__` during inheritance?

Since `__post_init__` is just another function, it has to be invoked in the conventional form:

```
@dataclass
class A:
    a: int

    def __post_init__(self):
        print("A")
```

```
@dataclass
class B(A):
    b: int

    def __post_init__(self):
        print("B")
```

```
>>> a = B(1,2)
```

```
>>> B
```

In the above example, only `B's` `__post_init__` is called. How do we invoke `A's` `__post_init__` ?

Since it is a function of the parent class, it can be invoked using `super.`

```
@dataclass
class B(A):
    b: int

    def __post_init__(self):
        super().__post_init__() #Call post init of A
        print("B")
```

```
>>> a = B(1,2)
```

```
>>> A
    B
```

### Conclusion

So, above are a few ways in which Dataclasses make life easier for Python developers.
I have tried to be thorough and cover most of the use cases, yet, no man is perfect. Reach out if you find mistakes, or want me to pay attention to relevant use cases.

I shall cover [dataclasses.field][10] and `unsafe_hash` in different posts.

Follow me on [Github][11], [Twitter][12].

Update: Post for `dataclasses.field` can be found [here][13].

--------------------------------------------------------------------------------

via: https://medium.com/mindorks/understanding-python-dataclasses-part-1-c3ccd4355c34

作者：[Shikhar Chauhan][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@xsschauhan?source=post_header_lockup
[1]:https://medium.com/@xsschauhan/understanding-python-dataclasses-part-2-660ecc11c9b8
[2]:https://docs.python.org/3.7/library/dataclasses.html#dataclasses.dataclass
[3]:https://stackoverflow.com/q/32557920/4333721
[4]:https://docs.python.org/3/reference/datamodel.html#object.__lt__
[5]:https://docs.python.org/3.7/library/functions.html#sorted
[6]:https://docs.python.org/3/library/dataclasses.html#dataclasses.dataclass
[7]:http://twitter.com/dataclass
[8]:http://twitter.com/dataclass
[9]:https://docs.python.org/3/library/dataclasses.html#post-init-processing
[10]:https://docs.python.org/3/library/dataclasses.html#dataclasses.field
[11]:http://github.com/xssChauhan/
[12]:https://twitter.com/xssChauhan
[13]:https://medium.com/@xsschauhan/understanding-python-dataclasses-part-2-660ecc11c9b8
