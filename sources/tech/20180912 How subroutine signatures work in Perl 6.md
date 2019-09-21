How subroutine signatures work in Perl 6
======
In the fourth article in this series comparing Perl 5 to Perl 6, learn how signatures work in Perl 6.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard2.png?itok=WnKfsl-G)

In the [first article][1] in this series comparing Perl 5 to Perl 6, we looked into some of the issues you might encounter when migrating code into Perl 6. In the [second article][2], we examined how garbage collection works in Perl 6, and in the [third article][3], we looked at how containers replaced references in Perl 6. Here in the fourth article, we will focus on (subroutine) signatures in Perl 6 and how they differ from those in Perl 5.

### Experimental signatures in Perl 5

If you're migrating from Perl 5 code to Perl 6, you're probably not using the [experimental signature feature][4] that became available in Perl 5.20 or any of the older CPAN modules like [signatures][5], [Function::Parameters][6], or any of the other Perl 5 modules on CPAN with ["signature" in their name][7].

Also, in my experience, [prototypes][8] haven't been used very often in the Perl programs out in the world (e.g., the [DarkPAN][9] ).

For these reasons, I will compare Perl 6 functionality only with the most common use of "classic" Perl 5 argument passing.

### Argument passing in Perl 5

All arguments you pass to a Perl 5 subroutine are flattened and put into the automatically defined `@_` array variable inside. That is basically all Perl 5 does with passing arguments to subroutines. Nothing more, nothing less. There are, however, several idioms in Perl 5 that take it from there. The most common (I would say "standard") idiom in my experience is:

```
# Perl 5
sub do_something {
    my ($foo, $bar) = @_;
    # actually do something with $foo and $bar
}
```

This idiom performs a list assignment (copy) to two (new) lexical variables. This way of accessing the arguments to a subroutine is also supported in Perl 6, but it's intended just as a way to make migrations easier.

If you expect a fixed number of arguments followed by a variable number of arguments, the following idiom is typically used:

```
# Perl 5
sub do_something {
    my $foo = shift;
    my $bar = shift;
    for (@_) {
        # do something for each element in @_
    }
}do_something
```

This idiom depends on the magic behavior of [shift][10], which shifts from `@_` in this context. If the subroutine is intended to be called as a method, something like this is usually seen:

```
# Perl 5
sub do_something {
    my $self = shift;
    # do something with $self
}do_something
```

as the first argument passed is the [invocant][11] in Perl 5.

By the way, this idiom can also be written in the first idiom:

```
# Perl 5
sub do_something {
    my ($foo, $bar, @rest) = @_;
    for (@rest) {
        # do something for each element in @rest
    }
}
```

But that would be less efficient, as it would involve copying a potentially long list of values.

The third idiom revolves on directly accessing the `@_` array.

```
# Perl 5
sub sum_two {
    return $_[0] + $_[1];  # return the sum of the two parameters
}sum_two
```

This idiom is typically used for small, one-line subroutines, as it is one of the most efficient ways of handling arguments because no copying takes place.

This idiom is also used if you want to change any variable that is passed as a parameter. Since the elements in `@_` are aliases to any variables specified (in Perl 6 you would say: "are bound to the variables"), it is possible to change the contents:

```
# Perl 5
sub make42 {
    $_[0] = 42;
}
my $a = 666;
make42($a);
say $a;      # 42
```

### Named arguments in Perl 5

Named arguments (as such) don't exist in Perl 5. But there is an often-used idiom that effectively mimics named arguments:

```
# Perl 5
sub do_something {
    my %named = @_;
    if (exists %named{bar}) {
        # do stuff if named variable "bar" exists
    }
}do_somethingbar
```

This initializes the hash `%named` by alternately taking a key and a value from the `@_` array. If you call a subroutine with arguments using the fat-comma syntax:

```
# Perl 5
frobnicate( bar => 42 );
```

it will pass two values, `"foo"` and `42`, which will be placed into the `%named` hash as the value `42` associated with key `"foo"`. But the same thing would have happened if you had specified:

```
# Perl 5
frobnicate( "bar", 42 );
```

The `=>` is syntactic sugar for automatically quoting the left side. Otherwise, it functions just like a comma (hence the name "fat comma").

If a subroutine is called as a method with named arguments, this idiom is combined with the standard idiom:

```
# Perl 5
sub do_something {
    my ($self, %named) = @_;
    # do something with $self and %named
}
```

alternatively:

```
# Perl 5
sub do_something {
    my $self  = shift;
    my %named = @_;
    # do something with $self and %named
}do_something
```

### Argument passing in Perl 6

In their simplest form, subroutine signatures in Perl 6 are very much like the "standard" idiom of Perl 5. But instead of being part of the code, they are part of the definition of the subroutine, and you don't need to do the assignment:

```
# Perl 6
sub do-something($foo, $bar) {
    # actually do something with $foo and $bar
}
```

versus:

```
# Perl 5
sub do_something {
    my ($foo, $bar) = @_;
    # actually do something with $foo and $bar
}
```

In Perl 6, the `($foo, $bar)` part is called the signature of the subroutine.

Since Perl 6 has an actual `method` keyword, it is not necessary to take the invocant into account, as that is automatically available with the `self` term:

```
# Perl 6
class Foo {
    method do-something-else($foo, $bar) {
        # do something else with self, $foo and $bar
    }
}
```

Such parameters are called positional parameters in Perl 6. Unless indicated otherwise, positional parameters must be specified when calling the subroutine.

If you need the aliasing behavior of using `$_[0]` directly in Perl 5, you can mark the parameter as writable by specifying the `is rw` trait:

```
# Perl 6
sub make42($foo is rw) {
    $foo = 42;
}
my $a = 666;
make42($a);
say $a;      # 42
```

When you pass an array as an argument to a subroutine, it doesn't get flattened in Perl 6. You only need to accept an array as an array in the signature:

```
# Perl 6
sub handle-array(@a) {
    # do something with @a
}
my @foo = "a" .. "z";
handle-array(@foo);
```

You can pass any number of arrays:

```
# Perl 6
sub handle-two-arrays(@a, @b) {
    # do something with @a and @b
}
my @bar = 1..26;
handle-two-arrays(@foo, @bar);
```

If you want the ([variadic][12]) flattening semantics of Perl 5, you can indicate this with a so-called "slurpy array" by prefixing the array with an asterisk in the signature:

```
# Perl 6
sub slurp-an-array(*@values) {
    # do something with @values
}
slurp-an-array("foo", 42, "baz");slurpanarrayslurpanarray
```

A slurpy array can occur only as the last positional parameter in a signature.

If you prefer to use the Perl 5 way of specifying parameters in Perl 6, you can do this by specifying a slurpy array `*@_` in the signature:

```
# Perl 6
sub do-like-5(*@_) {
    my ($foo, $bar) = @_;
}
```

### Named arguments in Perl 6

On the calling side, named arguments in Perl 6 can be expressed very similarly to how they are expressed in Perl 5:

```
# Perl 5 and Perl 6
frobnicate( bar => 42 );
```

However, on the definition side of the subroutine, things are very different:

```
# Perl 6
sub frobnicate(:$bar) {
    # do something with $bar
}
```

The difference between an ordinary (positional) parameter and a named parameter is the colon, which precedes the [sigil][13] and the variable name in the definition:

```
$foo      # positional parameter, receives in $foo
:$bar     # named parameter "bar", receives in $bar
```

Unless otherwise specified, named parameters are optional. If a named argument is not specified, the associated variable will contain the default value, which usually is the type object `Any`.

If you want to catch any (other) named arguments, you can use a so-called "slurpy hash." Just like the slurpy array, it is indicated with an asterisk before a hash:

```
# Perl 6
sub slurp-nameds(*%nameds) {
    say "Received: " ~ join ", ", sort keys %nameds;
}
slurp-nameds(foo => 42, bar => 666); # Received: bar, fooslurpnamedssayslurpnamedsfoobar
```

As with the slurpy array, there can be only one slurpy hash in a signature, and it must be specified after any other named parameters.

Often you want to pass a named argument to a subroutine from a variable with the same name. In Perl 5 this looks like: `do_something(bar => $bar)`. In Perl 6, you can specify this in the same way: `do-something(bar => $bar)`. But you can also use a shortcut: `do-something(:$bar)`. This means less typing–and less chance of typos.

### Default values in Perl 6

Perl 5 has the following idiom for making parameters optional with a default value:

```
# Perl 5
sub dosomething_with_defaults {
    my $foo = @_ ? shift : 42;
    my $bar = @_ ? shift : 666;
    # actually do something with $foo and $bar
}dosomething_with_defaults
```

In Perl 6, you can specify default values as part of the signature by specifying an equal sign and an expression:

```
# Perl 6
sub dosomething-with-defaults($foo = 42, :$bar = 666) {
    # actually do something with $foo and $bar
}
```

Positional parameters become optional if a default value is specified for them. Named parameters stay optional regardless of any default value.

### Summary

Perl 6 has a way of describing how arguments to a subroutine should be captured into parameters of that subroutine. Positional parameters are indicated by their name and the appropriate sigil (e.g., `$foo`). Named parameters are prefixed with a colon (e.g. `:$bar`). Positional parameters can be marked as `is rw` to allow changing variables in the caller's scope.

Positional arguments can be flattened in a slurpy array, which is prefixed by an asterisk (e.g., `*@values`). Unexpected named arguments can be collected using a slurpy hash, which is also prefixed with an asterisk (e.g., `*%nameds`).

Default values can be specified inside the signature by adding an expression after an equal sign (e.g., `$foo = 42`), which makes that parameter optional.

Signatures in Perl 6 have many other interesting features, aside from the ones summarized here; if you want to know more about them, check out the Perl 6 [signature object documentation][14].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/signatures-perl-6

作者：[Elizabeth Mattijsen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lizmat
[1]: https://opensource.com/article/18/7/migrating-perl-5-perl-6
[2]: https://opensource.com/article/18/7/garbage-collection-perl-6
[3]: https://opensource.com/article/18/7/containers-perl-6
[4]: https://metacpan.org/pod/distribution/perl/pod/perlsub.pod#Signatures
[5]: https://metacpan.org/pod/signatures
[6]: https://metacpan.org/pod/Function::Parameters
[7]: https://metacpan.org/search?q=signature
[8]: https://metacpan.org/pod/perlsub#Prototypes
[9]: http://modernperlbooks.com/mt/2009/02/the-darkpan-dependency-management-and-support-problem.html
[10]: https://perldoc.perl.org/functions/shift.html
[11]: https://docs.perl6.org/routine/invocant
[12]: https://en.wikipedia.org/wiki/Variadic_function
[13]: https://www.perl.com/article/on-sigils/
[14]: https://docs.perl6.org/type/Signature
