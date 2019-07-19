[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using D Features to Reimplement Inheritance and Polymorphism)
[#]: via: (https://theartofmachinery.com/2018/08/13/inheritance_and_polymorphism_2.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Using D Features to Reimplement Inheritance and Polymorphism
======

Some months ago I showed [how inheritance and polymorphism work in compiled languages][1] by reimplementing them with basic structs and function pointers. I wrote that code in D, but it could be translated directly to plain old C. In this post I’ll show how to take advantage of D’s features to make DIY inheritance a bit more ergonomic to use.

Although [I have used these tricks in real code][2], I’m honestly just writing this because I think it’s neat what D can do, and because it helps explain how high-level features of D can be implemented — using the language itself.

### `alias this`

In the original version of the code, the `Run` command inherited from the `Commmand` base class by including a `Command` instance as its first member. `Run` and `Command` were still considered completely different types, so this meant explicit typecasting was needed every time a `Run` instance was polymorphically used as a `Command`.

The D type system actually allows declaring a struct to be a subtype of another struct (or even of a primitive type) using a feature called “[`alias this`][3]”. Here’s a simple example of how it works:

```
struct Base
{
    int x;
}

struct Derived
{
    // Add an instance of Base as a member like before...
    Base _base;
    // ...but this time we declare that the member is used for subtyping
    alias _base this;
}

void foo(Base b)
{
    // ...
}

void main()
{
    Derived d;

    // Derived "inherits" members from Base
    d.x = 42;

    // Derived instances can be used where a Base instance is expected
    foo(d);
}
```

The code above works in the same way as the code in the previous blog post, but `alias this` tells the type system what we’re doing. This allows us to work _with_ the type system more, and do less typecasting. The example showed a `Derived` instance being passed by value as a `Base` instance, but passing by `ref` also works. Unfortunately, D version 2.081 won’t implicitly convert a `Derived*` to a `Base*`, but maybe it’ll be implemented in future.

Here’s an example of `alias this` being used to implement some slightly more realistic inheritance:

```
import io = std.stdio;

struct Animal
{
    struct VTable
    {
        void function(Animal* instance) greet;
    }
    immutable(VTable)* vtable;

    void greet()
    {
        vtable.greet(&this);
    }
}

struct Penguin
{
    private:
    static immutable Animal.VTable vtable = {greet: &greetImpl};
    auto _base = Animal(&vtable);
    alias _base this;

    public:
    string name;

    this(string name) pure
    {
        this.name = name;
    }

    static void greetImpl(Animal* instance)
    {
        // We still need one typecast here because the type system can't guarantee this is okay
        auto penguin = cast(Penguin*) instance;
        io.writef("I'm %s the penguin and I can swim.\n", penguin.name);
    }
}

void main()
{
    auto p = Penguin("Paul");

    // p inherits members from Animal
    p.greet();

    // and can be passed to functions that work with Animal instances
    doThings(p);
}

void doThings(ref Animal a)
{
    a.greet();
}
```

Unlike the code in the previous blog post, this version uses a vtable, just like the polymorphic inheritance in normal compiled languages. As explained in the previous post, every `Penguin` instance will use the same list of function pointers for its virtual functions. So instead of repeating the function pointers in every instance, we can have one list of function pointers that’s shared across all `Penguin` instances (i.e., a list that’s a `static` member). That’s all the vtable is, but it’s how real-world compiled OOP languages work.

### Template Mixins

If we implemented another `Animal` subtype, we’d have to add exactly the same vtable and base member boilerplate as in `Penguin`:

```
struct Snake
{
    // This bit is exactly the same as before
    private:
    static immutable Animal.VTable vtable = {greet: &greetImpl};
    auto _base = Animal(&vtable);
    alias _base this;

    public:

    static void greetImpl(Animal* instance)
    {
        io.writeln("I'm an unfriendly snake.  Go away.");
    }
}
```

D has another feature for dumping this kind of boilerplate code into things: [template mixins][4].

```
mixin template DeriveAnimal()
{
    private:
    static immutable Animal.VTable vtable = {greet: &greetImpl};
    auto _base = Animal(&vtable);
    alias _base this;
}

struct Snake
{
    mixin DeriveAnimal;

    static void greetImpl(Animal* instance)
    {
        io.writeln("I'm an unfriendly snake.  Go away.");
    }
}
```

Actually, template mixins can take parameters, so it’s possible to create a generic `Derive` mixin that inherits from any struct that defines a `VTable` struct. Because template mixins can inject any kind of declaration, including template functions, the `Derive` mixin can even handle more complex things, like the typecast from `Animal*` to the subtype.

By the way, [the `mixin` statement can also be used to “paste” code into places][5]. It’s like a hygienic version of the C preprocessor, and it’s used below (and also in this [compile-time Brainfuck compiler][6]).

### `opDispatch()`

There’s some highly redundant wrapper code inside the definition of `Animal`:

```
void greet()
{
    vtable.greet(&this);
}
```

If we added another virtual method, we’d have to add another wrapper:

```
void eat(Food food)
{
    vtable.eat(&this, food);
}
```

But D has `opDispatch()`, which provides a way to automatically add members to a struct. When an `opDispatch()` is defined in a struct, any time the compiler fails to find a member, it tries the `opDispatch()` template function. In other words, it’s a fallback for member lookup. A fallback to a fully generic `return vtable.MEMBER(&this, args)` will effectively fill in all the virtual function dispatchers for us:

```
auto opDispatch(string member_name, Args...)(auto ref Args args)
{
    mixin("return vtable." ~ member_name ~ "(&this, args);");
}
```

The downside is that if the `opDispatch()` fails for any reason, the compiler gives up on the member lookup and we get a generic “Error: no property foo for type Animal”. This is confusing if `foo` is actually a valid virtual member but was called with arguments of the wrong type, or something, so `opDispatch()` needs some good error handling (e.g., with [`static assert`][7]).

### `static foreach`

An alternative is to use a newer feature of D: [`static foreach`][8]. This is a powerful tool that can create declarations inside a struct (and other places) using a loop. We can directly read a list of members from the `VTable` definition by using some compile-time reflection:

```
import std.traits : FieldNameTuple;
static foreach (member; FieldNameTuple!VTable)
{
    mixin("auto " ~ member ~ "(Args...)(auto ref Args args) { return vtable." ~ member ~ "(&this, args); }");
}
```

The advantage in this case is that we’re explicitly creating struct members. Now the compiler can distinguish between a member that shouldn’t exist at all, and a member that exists but isn’t used properly.

### It’s all just like the C equivalent

As I said, this is basically just a tour-de-force of ways that D can improve the code from the previous post. However, the original motivation for this blog post was people asking me about tricks I used to implement polymorphic inheritance in bare metal D code, so I’ll finish up by saying this: All this stuff works in [`-betterC`][9] code, and none of it requires extra runtime support. The code in this post implements the same kind of thing as in the [previous post][1]. It’s just expressed in a more compact and less error-prone way.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2018/08/13/inheritance_and_polymorphism_2.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: /2018/04/02/inheritance_and_polymorphism.html
[2]: https://gitlab.com/sarneaud/xanthe/blob/master/src/game/rigid_body.d#L15
[3]: https://dlang.org/spec/class.html#alias-this
[4]: https://dlang.org/spec/template-mixin.html
[5]: https://dlang.org/articles/mixin.html
[6]: /2017/12/31/compile_time_brainfuck.html
[7]: https://dlang.org/spec/version.html#StaticAssert
[8]: https://dlang.org/spec/version.html#staticforeach
[9]: https://dlang.org/blog/2018/06/11/dasbetterc-converting-make-c-to-d/
